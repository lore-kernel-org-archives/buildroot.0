Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE15E668A5
	for <buildroot@archiver.kernel.org>; Sun, 24 Nov 2024 04:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B90584D5E;
	Sun, 24 Nov 2024 04:19:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5sdCCMsrrS2X; Sun, 24 Nov 2024 04:19:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6912584D61
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6912584D61;
	Sun, 24 Nov 2024 04:19:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D9901D8B
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 04:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7743440BB3
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 04:19:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7larCCfqYXbM for <buildroot@buildroot.org>;
 Sun, 24 Nov 2024 04:19:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 52B6F400DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52B6F400DC
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52B6F400DC
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 04:19:03 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5d0102fc7beso3678496a12.0
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 20:19:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732421941; x=1733026741;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZxOzeCZ6UZXcUMo9Z1l1Jxx9BanzX9YCSbz/tJ3rM+U=;
 b=t5tAzo9s3uXrRGESVnCKuo4EtWzGY/0xI5aytzhgvVD2mXJOSQoitNStGP5l4K2uKC
 uKF+D8HPUhqVhP+ct/QXFEqWG+ZwP9uneLNIDwKu4hvujJ6w9ACFFetuwxt1d5KBEiMi
 V5fR4LCLebeU7peF+8H3Vpjtc/v85BmHb9PUyT5FhE8sU5N61B3YsFbBMfT+XCP3O9pR
 718+CnEwC3Ygi6qLJMMAgtVYyKTfPwPcriPRhEpTQSbMf1sXw6NOZrH0BUM6zii8Qo7m
 zayE/8Dl6+7FSi7sbUOdz3QK7PvKNbyMp5qCdqPvHtRLcKLywZahrMYXxbyQa/Bg5qH4
 nJmQ==
X-Gm-Message-State: AOJu0Yzbu3ZtnINbzDyPu96DZ/zsbuC9aM6Ut8pxGNKHXNzIswdecOfB
 htqkMP3ZgUUVxo9eD0pHdZ7P199JBM2LWmJEw654P59b59/5G9cMYi6nBw==
X-Gm-Gg: ASbGncsK1s5VJsycQeJwS9GyZwgmuyvZZdzcrdf/Hp9myqsc8WqYC68p2ezU5IktOMU
 WbW57j8tvXUtpI6le8Z0XBzoG2rPujT0S9Vk8PVfFxr4Vt3hZdtJKQrkogVJZVmganeT7FQhiiB
 TLbNjvzqsgxb+ZJBOEuOdxvI2HX+tx0lYktHniS49tPvYVsBILEi3Kv+yVRQHIrUnpUm1ytGlUI
 RUhRzLo51Z+uY5N+nrYdbFIxLFQXLLR/7VmsxQwhR0dyHpKI8cIJg==
X-Google-Smtp-Source: AGHT+IGFGK2ujvFkOnbXBR9g3dbzxmyhohEyjk/W2bb7ffBbyJlnl3/ZAqrHtzueEx+zZGz6EHYk9w==
X-Received: by 2002:a17:906:3caa:b0:aa5:1757:bdd9 with SMTP id
 a640c23a62f3a-aa51757bf0emr549337766b.44.1732421940684; 
 Sat, 23 Nov 2024 20:19:00 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa535bd5bb1sm144587466b.48.2024.11.23.20.19.00
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Nov 2024 20:19:00 -0800 (PST)
Message-ID: <6742a934.170a0220.becba.44c9@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 24 Nov 2024 04:19:00 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732421941; x=1733026741; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ZxOzeCZ6UZXcUMo9Z1l1Jxx9BanzX9YCSbz/tJ3rM+U=;
 b=hEt2B8iv3bH947wlPjVRq1BQKvwbQ299v9m+XV1M7uB+rYxRcTjDlL0jpiRKGJVFAA
 w6dX1pApQY2Hze0SsrBQvesgqeCOuFNYJRVRQy/lY/VS3e/u1PCwjbchR763QVInMWNz
 mlZ1qYk9xPHq/im+dDVokWnEZP4/8U1CoCxUapnA3rIURIEfaFLp6LOCAkBacGKqLidJ
 q9Uy4oFI9CbsixaVQzpylcyITLJRQNqMvr7hv/x7V+XvvrgR2gtr5h+q2eO5lJSSoVMT
 xLouER7elDSrXctgQdorN6GaUH8vMfa58inI6E9J35y0aFeCJ0Dt+EBZ8shn51LBxRSs
 +kXw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hEt2B8iv
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-11-23
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

Autobuild statistics for 2024-11-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  |  1  |  0  |  5  |
  2024.08.x  |  3  |  4  |  0  |  7  |
    master   | 19  | 304 | 10  | 333 |
     next    |  3  |  1  |  1  |  5  |

Classification of failures by reason for master
-----------------------------------------------

             util-linux-2.40.2 | 17
             dahdi-linux-3.3.0 | 16
 ibm-sw-tpm2-rev183-2024-03-27 | 13
              host-rust-1.82.0 | 12
                lmbench-3.0-a9 | 11
         gobject-introspection | 10
            host-binutils-2.42 | 8 
                  linux-6.11.7 | 8 
               procps-ng-4.0.4 | 8 
                   eza-0.18.22 | 6 
glibc-2.40-18-g564178076272... | 5 
  gobject-introspection-1.76.1 | 5 
           host-doxygen-1.8.18 | 5 
              libopenssl-3.4.0 | 5 
                  linux-6.11.9 | 5 
                 openssh-9.9p1 | 5 
                       unknown | 5 
                  bcusdk-0.0.5 | 4 
                  curlpp-0.8.1 | 4 
                   cvs-1.12.13 | 4 
                elfutils-0.189 | 4 
   host-mender-artifact-3.11.2 | 4 
               libunwind-1.8.1 | 4 
            linux-fusion-9.0.3 | 4 
               mariadb-10.11.6 | 4 
                    mpir-3.0.0 | 4 
                  ntp-4.2.8p18 | 4 
                   perl-5.40.0 | 4 
      python-autocommand-2.2.2 | 4 
android-tools-4.2.2+git2013... | 3 
                   bird-2.15.1 | 3 
                 c-ares-1.34.2 | 3 
                  ffmpeg-6.1.2 | 3 
                   foot-1.16.2 | 3 
          linux-5.10.162-cip24 | 3 
     linux-5.10.162-cip24-rt10 | 3 
               linux-pam-1.6.1 | 3 
             lirc-tools-0.10.2 | 3 
               pulseaudio-17.0 | 3 
           at-spi2-core-2.50.0 | 2 
                    azmq-1.0.3 | 2 
                  boost-1.83.0 | 2 
cegui-00b4e1fe174da53b7ed72... | 2 
                 coreutils-9.5 | 2 
          cryptodev-linux-1.13 | 2 
                cryptopp-8.9.0 | 2 
                     daq-2.0.7 | 2 
                  fwupd-1.9.20 | 2 
            gettext-gnu-0.22.4 | 2 
                   grpc-1.51.1 | 2 
    host-python-greenlet-3.1.1 | 2 
                libdrm-2.4.123 | 2 
                libesmtp-1.1.0 | 2 
                  libva-2.22.0 | 2 
              luabitop-1.0.2-1 | 2 
                  lvm2-2.03.27 | 2 
            netstat-nat-1.4.10 | 2 
                acpitool-0.5.1 | 1 
               arp-scan-1.10.0 | 1 
                  assimp-5.3.1 | 1 
              asterisk-20.10.0 | 1 
                 babeld-1.13.1 | 1 
             batman-adv-2024.2 | 1 
             berkeleydb-5.3.28 | 1 
                  boinc-7.20.2 | 1 
                    brltty-6.6 | 1 
                   bzip2-1.0.8 | 1 
                 c-icap-0.5.10 | 1 
                 cdrkit-1.1.11 | 1 
                   crun-1.18.2 | 1 
                directfb-1.7.7 | 1 
                 erlang-26.0.2 | 1 
esp-hosted-91b093365cc58214... | 1 
                 expect-5.45.4 | 1 
firmware-utils-86739f2b3ae9... | 1 
fs/romfs/romfs.mk:32: /home... | 1 
                  giblib-1.2.4 | 1 
                gnu-efi-3.0.18 | 1 
               graphene-1.10.8 | 1 
             gstreamer1-1.22.9 | 1 
                     gzip-1.13 | 1 
host-binutils-bare-metal-2.... | 1 
           host-cryptopp-8.9.0 | 1 
httping-0e26c53d5fe504eb720... | 1 
                  jack2-1.9.22 | 1 
                latencytop-0.5 | 1 
                   libcap-2.70 | 1 
                  libdex-0.8.0 | 1 
           libfreeimage-3.18.0 | 1 
                liboauth-1.0.3 | 1 
                  libsepol-3.7 | 1 
              libunistring-1.3 | 1 
                  liburing-2.6 | 1 
                 libv4l-1.28.1 | 1 
                libxml2-2.13.4 | 1 
           libzenoh-pico-1.0.2 | 1 
                   linux-tools | 1 
        ltp-testsuite-20240524 | 1 
       matchbox-keyboard-0.1.1 | 1 
                 mesa3d-24.0.9 | 1 
                   mimic-1.1.0 | 1 
              mosquitto-2.0.20 | 1 
           oath-toolkit-2.6.12 | 1 
               openblas-0.3.28 | 1 
                 pixman-0.42.2 | 1 
       riemann-c-client-1.10.5 | 1 
                 rtptools-1.22 | 1 
                   sdl2-2.30.9 | 1 
                   swipl-9.2.8 | 1 
           v4l2loopback-0.13.2 | 1 
               valgrind-3.23.0 | 1 
                 watchdog-5.16 | 1 
                 wolfssl-5.7.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/44e751318fa527e432f18ea2e8f448033e21cd3b | ORPH
    m68k     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/c726a7b71704ae81f0176ae23951c05abe169f0b |     
microblazeel | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/d7f099047af4879eb904f152b5d0a5ef3bf6b7ab |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/f349029e1905444168c41d6f9789ecad5732fab0 |     
 microblaze  |        arp-scan-1.10.0         | NOK | https://autobuild.buildroot.org/results/e0a174d34db9683d82e584383e96b8f08f832bee |     
    or1k     |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/65e3ebf1222866169b51043dc0f652020188f9cf | ORPH
    i686     |        asterisk-20.10.0        | NOK | https://autobuild.buildroot.org/results/8f46eeb445ea395ca7f79c85bd4bab1d2ed748c3 |     
powerpc64le  |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/d059dedaa4ebf4ad629f9b23fa4dfd3cc1423137 |     
    arc      |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/b4bdc58812c554275f8215cd903b5f702f746a31 |     
   mipsel    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/fe5e007f889f0ce8b87397e80f684d5aa9920555 |     
   mipsel    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/4e46814a3c33688e20c7527e0dba82497a37b136 |     
 aarch64_be  |         babeld-1.13.1          | NOK | https://autobuild.buildroot.org/results/3996447eab4f32654c645cab0c4a749b3dd8f606 |     
   mips64    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/911520e91cd2717b4fbfe269755db7dd1ddb692c |     
powerpc64le  |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/1f95734d104293f692bff3865d6d4a1a49139bb1 |     
   nios2     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/4094cb264707242b231bf81d327f3ff32d9cea1a |     
  mips64el   |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/ce9a392001eaca79cddcb4cf36f89ecad9a6c485 |     
powerpc64le  |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/ddb37c7cf4558268f37c0deb16ee01e44c83948b |     
   xtensa    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/ccc23dc2037f7b442224db75a2243e6e5e417798 | ORPH
  aarch64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/42c6b248fdb3fa50236a54f81d619694b246caa4 |     
    arc      |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/85b6ce6db2a2107ca544a5858de09c88c469c467 |     
    m68k     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/c285e1591be9e8554c412cbf110b61d7917cee2c |     
    mips     |          boinc-7.20.2          | NOK | https://autobuild.buildroot.org/results/8fb6cf939a37b7f8d3e8472bee80ed406895f697 |     
  mips64el   |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/aacfa3f7136bf08e5f5f8d481077867d06a2b70a |     
  aarch64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/d963a482183e6c6e38cb341acc91af3be21e06e3 |     
 microblaze  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/f8590998b4531ab3997e07429739a37846a5d9c8 |     
powerpc64le  |          bzip2-1.0.8           | NOK | https://autobuild.buildroot.org/results/1f4f930dbf2cce02bb95ba1cea7f7023dbd5f939 | ORPH
   mipsel    |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/6aac29bcd5a8613353fdbbb0db0cbf2833b5fb7d | ORPH
   sparc     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/6daa89228c21c65d536ccd76cad48e34d2eaa797 | ORPH
    arc      |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/0098a16fe3d99ff96374c7dddc3e54c3b1b97e04 | ORPH
  aarch64    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/c50c3b10d507c3812035b9fbb896b02528205148 | ORPH
microblazeel |         cdrkit-1.1.11          | NOK | https://autobuild.buildroot.org/results/fb55c896e47672d83bd52feea96f19df2c1e563c |     
powerpc64le  | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/bb69d5a7624e1cab8cc36c8e2d531ce917cc52fc |     
   arceb     | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/e0bf758e98713e22b8fe4d0a9d2f87218cefbbd0 |     
    arc      |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/f4afb3e353dd85d8c93faa1140ac41b6336f6192 | ORPH
   mips64    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/a9ddb097ec2a97aa7e130bd85c00c53ed3aa866c | ORPH
    i686     |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/2777cb15e5c7d86360162e924590bfb6f243c87d |     
   mipsel    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/58df95ae11ea97126b2fd9c027ecbc2128540ba5 | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/c2e09f3b8aace3219cfbcadf0b8a1d8661f4d4c7 | ORPH
  sparc64    |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/6e3144ef6dc318674b8cfc895751ac031ce0ee1b |     
   mips64    |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/ce1dd2b044b5b8e9f23e6bf53caa554fe6f415be |     
   mipsel    |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/ee80ed51bc6e0457b41dbadf0073f89c1937434d |     
   mipsel    |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/86ebffed6d001e76d9b880542d17c4038f546f1c |     
   sparc     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/652c05b1d90ceb2c4e9b46b4c150a007d811398c |     
    m68k     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/77b786b815cf1b658ad3b14eb4ee99f9822c5e4a |     
   mips64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/96d532a20e5554082fab279b8a2c833a8b73e613 | ORPH
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/7f3bc52a6a824ae3f98a97529eeab9a496cacf0a | ORPH
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/cffa40e284882af4992bf51bc0d53ed0f4f0304f | ORPH
   mips64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/0495e0f16eaa78114b224a525bd0d3bac4d40312 | ORPH
   armeb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/d085c67876803e02c0adb33d8e7f8920fa3e7fbf |     
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/36684ebd49da35eb469f878905a591ff54e0d985 |     
    sh4      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/21260f2361ef53e78dd710a8cb64ee1749048d89 |     
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/24cd4a47844fa38f05133134def06974f2f6cd79 |     
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/c876e69dccbdf7da6a900d0ed48edc1b0ab02ab0 |     
    arc      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/ff6af8a3110b85b8cadb5aa53f19ffed0685a449 |     
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a688fe0ca0a98c5aff4797f50381eaae0a198a49 |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a4972f044458ebb5891fb327fdf7d5fa45acc1c6 |     
   armeb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/ddf4cc30194678e5aa78bf466dc9c769fd163c2e |     
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/016b19727b4413d9bc61f4df747c0acbd0cb4803 |     
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/22040b659e8b59509d53f40cdc54045d8da80637 |     
    arm      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/227ee4320e2ba42943e904430239b7f115994d01 |     
   nios2     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/464a1992c23c72c8b9b747e21407a9f6b4db8663 |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/5e6176eacad2292175e876d7f01e4873d8dcd4cd |     
    arc      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b65097583dcba0f570aac882c155bc364977debc |     
microblazeel |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/af5d39b38ec680cacd8df0ad7f8243cc77b68d1e |     
 powerpc64   |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/f91c7665f3764ed7504c037b1075332a08c9d864 |     
    or1k     |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/a9e809cdd318298be7b0a2490f387b61192c1dee |     
   armeb     |         directfb-1.7.7         | NOK | https://autobuild.buildroot.org/results/db513db00f484493e03a3182ad12898d024c57cf | ORPH
    arc      |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/cd508219c217bafe187a833395eae04a9d6d087a | ORPH
 aarch64_be  |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/56f5434812c25d2b83b66571de704efb1bc8ef13 | ORPH
    sh4a     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/33325d458f22770efda54aa97572e4524d043537 | ORPH
   s390x     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/9151f8d57e7db7559bdda0398201411a74e5d566 | ORPH
   mipsel    |         erlang-26.0.2          | NOK | https://autobuild.buildroot.org/results/6f1f5d03d8cd112cc26b6f3e1720498d4dbae8e2 |     
  mips64el   | esp-hosted-91b093365cc58214... | NOK | https://autobuild.buildroot.org/results/f5d2f3baf871b3d3afd15f269e043cf2fd14b370 |     
  mips64el   |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/26d25289f702b11ec6331cd9d1ca3985691d38a1 | ORPH
powerpc64le  |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/46738d04e605a2dd0fb9460045a19fe1f5049175 |     
   x86_64    |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/4842bc2c3a1bc9618186a12d1a98c9b19b15d2dd |     
   s390x     |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/0e3d17c4400b86584eaed398ea9f245c0742ab4c |     
   s390x     |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/aaed2d913b8414e5317045c54b5e676711d2e133 |     
   s390x     |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/855347ac1629f476dfd9c5eba5f7ad17639743f3 |     
powerpc64le  |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/cb52b2f84205bc2b6ad25ee861f7bca4af8324cb |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/285d57325c69e6f0d123ee42eb1fa909993b4b89 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/1e3a9ecfe7ea6ed6cd321064c32a042b9732dbf4 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/72a0dbdf4457380b5f2a22b936184dab8e5b0179 |     
    or1k     | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/64d4fa114425124de277873483752fe60246348b |     
   armeb     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/00318b191393ad84f5d9cfd8619680cffe982aaf |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/758b691fab784e90ea5fef908deb49e6b0be1aa3 |     
   mips64    |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/ad9ca085b44d953126ed635f073afd715e923ef2 |     
    mips     | fs/romfs/romfs.mk:32: /home... | NOK | https://autobuild.buildroot.org/results/e1787253e46ed54250d3909a3b83275ec1124ba8 |     
microblazeel |          fwupd-1.9.20          | NOK | https://autobuild.buildroot.org/results/3529df98a42093b8f6609cb18664499021cdbc72 |     
    mips     |          fwupd-1.9.20          | NOK | https://autobuild.buildroot.org/results/2e3980d8558095ff6075ddf7d37b4975a5249d54 |     
   armeb     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/61c44aa1bd16e9c82967b4042af873c6832103af | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/c16bfe563ca5c09cb5e0cffcac8c3ea9c6e3ab57 | ORPH
   armeb     |          giblib-1.2.4          | NOK | https://autobuild.buildroot.org/results/be23ad9454976c0f4effd6c54381917d641e99d8 |     
    arc      | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/0ea945a0da454b8004461094186ac46a8b9122b8 |     
  riscv64    | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/4944e7106a6dd781e4b89f8dbff18201791430d6 |     
   arceb     | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/905fcb40591df0cb9191a6a89627a21db2f1783d |     
   arceb     | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/9eb4f7e8dcef8d8e62c319e8641f6771b0053a08 |     
   arceb     | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/4e3d2ca4011ca419fce7922b37d5f96116fcfe0d |     
   x86_64    |         gnu-efi-3.0.18         | NOK | https://autobuild.buildroot.org/results/2337dc822c29495bbee789d18df2393effce9046 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/e24fc8c28d2cedc92ccd83b87dcf37c42f03d744 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/034c4de6e07c82891c1d53990a0c2c732501ef17 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/7290651929218572310f4e72826e229c39eade9d |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/119fa3baca0a380445bae057f727e53986274df9 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/94f715a124d887c55bc7a67cd7891207d5a2a1e9 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/dac7e1e8dccbfbaf3c63c9bc9ba1c734b9d6c15a |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/614c33a4a19468276ca6f6c8a33ace01b78f71e5 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/ae4279a31f5641bcb5249132b2700c6bc1f2dc0d |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/f1fb55c34ed8dd9089bbbdf95bf35e969aff5e6d |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/272c62c182d2484cee769d1e426ac3dd0c5870f7 |     
    i686     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/a5b1093ff30671bc447b5a87d0bd902344030bce | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/7e4e60c196c8b6d1122621e0a8e904ae9d378017 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/aa03cf065209e60f12e36cf30b6d97d16946265d | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/d6909d977de8110728c917fe545d16007fdddf5a | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/42b1e5b8fdd707af2c72f0365469501374a7ac99 | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/54c2448708de53cfe04af2fb42e1a70e92e725d9 |     
powerpc64le  |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/c8e77ba60f32d72c650245ef15fe5bdae780bcbc |     
  mips64el   |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/ea41ceff585bd3408233b4ce6a4ad2528db988a2 |     
    sh4      |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/4ef13b8587db43837890b90488c207efd4c75911 | ORPH
    i686     |           gzip-1.13            | NOK | https://autobuild.buildroot.org/results/10733439af2dd17d34180aa49f30326f73b2bf25 | ORPH
   armeb     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/402b48c3283bd7706f17a223a6a5abfe851ce700 |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/e3510db354a6f8780458f9178b8726bbcc725a35 |     
 aarch64_be  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/385c7596deaeafbced5a05cd6f321f7c2211911e |     
   armeb     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/bf083566a1e685ec734ca910127fffdcad9e404a |     
   armeb     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/546385b9cb65dec24c6a5715b5d8d8e74ff196e9 |     
    or1k     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/58cc54c79bda3d3dc27d60042d2142148ebd1458 |     
    i586     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/8924f9fa5c674ba8f9e3213aada0402099e5cf89 |     
  powerpc    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/4edd8528857e70e88e4aee22befaa7c9d5b8f672 |     
 microblaze  | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/6caf1f93e703394bc95897d0a9fb0955e8e70114 |     
   armeb     |      host-cryptopp-8.9.0       | NOK | https://autobuild.buildroot.org/results/74e6c83a3809e580b9b21a1f496f0ed84fbef1ea |     
  sparc64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/c637a796f6217304438013d534cfe3cb9d34e6e8 | ORPH
    sh4a     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/7e9b06bf3d7fcfd6010eaf64904926569125fa04 | ORPH
   nios2     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/f0b56b0500a9c5bd0fcb2fc7ada2827065e088a0 | ORPH
 aarch64_be  |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/a8391c036823d9b6fa422cf424d2ec2d268ad7a6 | ORPH
  riscv32    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/bb0c5638fffb149432157475a7d5a10318c2542c | ORPH
   mips64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/edb9bff543a07d0199eeccd063f37ad83d2426d0 |     
   mips64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/3e3ca229abf80d5cf01736a546362ecbe11c8728 |     
  riscv64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/20474352b94ff7d8de38d2d3c96c92eabdc7a155 |     
  mips64el   |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/fd85acb61c2e761ba578e3a42291a6db6abff58c |     
   nios2     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/99977d2140a1511610000a0a51f68785df39a992 |     
    mips     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/df6b77261fdf67f6a1cc8f4d4eefd674ccf6d9bc |     
   s390x     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/9d2ee796e878b93d1182d3b953c8fd9ac47e8421 |     
   s390x     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/27575f966080ce2f1e71fc765b5d9d3c22c69dcc |     
  aarch64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/43f4e3e76836dab5278575f89e7958b430922c84 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/2e68ac0d0f7eda57d0db1e00d31489367081c277 |     
 powerpc64   |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/afd4876200a1c7335f25b558c134709027a54baf |     
powerpc64le  |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/b86e06b90762671d2601ca5f88fe48cd65332901 |     
    arm      |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/958b59444e7e0c56dc0dde0f5df4327d0b56d341 |     
 powerpc64   |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/2cc5789d7553beeead17b628a96632d38e5e59dc |     
powerpc64le  |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/2d305fe335b658baf45f1262e26b96ae371637df |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/b95f4dfa732060d81be43101cdec1a490a225ddb |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/117dc335fbc36cebc58f6cf0406ed94dfeb7a06c |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/146a3e0fd6539f62839177f909e714590cce8499 |     
  powerpc    | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/c9ed8ec6053a05ff155aa262587e65c80d7d4c3e |     
   arceb     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/bbd46311155e8c675f913e409dfbe375eed7fef8 |     
   arceb     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/35534721f58c506950cfa4a35c31e677856e5122 |     
  sparc64    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/c6a32a08a3f4bf00ccfbf3012342306d52455a08 |     
    mips     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/f25c9fc34ecb195ca4ed9e56032b44b83a5c35ff |     
 aarch64_be  | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/445c0131da9482c77c12aec681b9244079695c92 |     
 powerpc64   | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/e418dadb0363e6e7159d75944169ee8ce862c9fb |     
    m68k     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/133c84216da5bdad3a84fec06402574945a60f1e |     
  riscv32    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/c2a20c39f8a9c66641cfe44dad91c006e9453dbe |     
 aarch64_be  | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/0a7ba8afb2cd580077937ab6a7f55fb02f07390c |     
   mips64    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/9127b5aeaf768e6dd74b1867d1947d36fa6225bb |     
  mips64el   | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/adf94eab1e848140d83e52e3f8043263dabc4573 |     
    arc      | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/e1523c6dbb973ee1498f8f606c0df4a2189ea383 |     
    mips     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/c16f75f1173a5b18acc133b97cef6edd167e237b |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/82f6f177861361b134cd1f537e7d916db999e2b6 |     
    or1k     |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/b3d76bec17824853d99e6d3a2374c1ce6087cde1 | ORPH
microblazeel |          libcap-2.70           | NOK | https://autobuild.buildroot.org/results/5a01cb1a75cf8c152d525851505a64a01f50091b |     
    mips     |          libdex-0.8.0          | NOK | https://autobuild.buildroot.org/results/d3ec2e64e6cdc6052edb0e7332718eb29c9b60a5 |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/cc38f95553852f21959bd8dbadfe127bcd2321e6 |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/afe2c8277daa863ff8fe1a10e29167e0bce41995 |     
   mips64    |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/45d11707ee9ef983412eacea7adba3ca23972cda | ORPH
  sparc64    |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/96516148e24504a941105a9022e6cc2428e334fd | ORPH
  mips64el   |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/fea9363c2673e2cf8570c13bb22f93e848d649d6 |     
   sh4eb     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/a820636cc7bc588931d59cdb3737339ace444ba5 | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/718107171db1560c4c0890ac3b005f1bbb22e776 | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/f496190132c1a3686c099c266fe58a60082dc330 | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/9e8d6f0e2e6ed44175375cd643c681d76af6a3ac | ORPH
   arceb     |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/40df916b1b4ec8e8fa81b1a7525005a5350e9588 | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/744caeae334a55256b056cbf2c117f6e70b17516 | ORPH
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/b8db35ad576171fdfbd14fc6569b77ce6bb7241f |     
   armeb     |        libunistring-1.3        | NOK | https://autobuild.buildroot.org/results/bf9cb50e1746fa3b202ab01ab151c9ce9b0d075a |     
   mips64    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/985cb79ed1b45c6a9d2792112a9a44587f744028 | ORPH
    mips     |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/6e80628746f193e16102adc21674b62618d97a4f | ORPH
   mips64    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/4fd220f2d0ef560f92f490248531e60a0ddd0dbb | ORPH
   mips64    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/ee7773f0c30880a0eb662133fd7bd7d3421e7709 | ORPH
   mipsel    |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/336e56ead6bbf00899a34588c6d8cb5fef3b42ca |     
    arc      |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/31e3650a6a0ffa218065464e5c30579e4f958a9b |     
  aarch64    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/90e28fa3726dc68dca2381816acf7ef862065d7b |     
 aarch64_be  |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/e599c2cb67ce2fddc2b094d3d429f62b4b5813d8 |     
 aarch64_be  |         libxml2-2.13.4         | NOK | https://autobuild.buildroot.org/results/d2893a316b98307cb13bc66cf1068c260ce339de |     
 powerpc64   |      libzenoh-pico-1.0.2       | NOK | https://autobuild.buildroot.org/results/f496b568eaf4a4e79a09a8ef12971493d82dec1a |     
   mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/fd10f575642704b8b600fb239e3d7b1129f31dcc | ORPH
    mips     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/d822e9b0687367e05165d854a88420a930f53d9a | ORPH
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/9105368e56cc002753cafc05c721d0c8b3d4b999 | ORPH
    arm      |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/b65292f3a6e3bd49b2600ba4c54489edcdf131a5 | ORPH
 powerpc64   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/d94b8a5a89a0428c6eec1187a5ce8d81dd7d8722 | ORPH
   nios2     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/1acf95eaa6223ae8217870bf194d7b8b29823955 | ORPH
  mips64el   |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/b6efb375b835f3fdaf4c715eede8100798cd2100 | ORPH
   nios2     |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/66dd3ccaad0c0e9f30c4f9b84d18598dcf07860c | ORPH
   mipsel    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/574b701c0dd510ded2a05d1e45604c2440f6ca9c | ORPH
   nios2     |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/4d257ea8c08606ee52873dec4e05e681127e7e7d | ORPH
  mips64el   |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/546fc113a8faf6fdc5e91c0e98c32df786c3c888 | ORPH
  powerpc    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/30cc1b3be4e02d0c52bd2d6a9c1a1cc42c28ebd3 | ORPH
powerpc64le  |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/aca3c144fe0ff6298c93f3556e7a02501af02822 | ORPH
  mips64el   |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/ff30a6d75d2f5dc5eb198a458e31257fd97334e0 | ORPH
    arc      |          linux-6.11.9          | NOK | https://autobuild.buildroot.org/results/9d0b702d2234af511fca7e04c31dfbf2fe1ce5f2 | ORPH
  powerpc    |          linux-6.11.9          | NOK | https://autobuild.buildroot.org/results/59a6c4a1ccaf8ffab857aeff02c5f2064507faf9 | ORPH
  powerpc    |          linux-6.11.9          | NOK | https://autobuild.buildroot.org/results/be0079e4eca224f5ebb3a5d0110db69649dcf554 | ORPH
  mips64el   |          linux-6.11.9          | NOK | https://autobuild.buildroot.org/results/b9946115bd40cbd0626acbe9aa7eb195123d9f9f | ORPH
   mipsel    |          linux-6.11.9          | NOK | https://autobuild.buildroot.org/results/9eb03769442f21f2d6aa26dec94754e0f039da6d | ORPH
 powerpc64   |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/60fc4b2d3bc56f5b023f6533d0312eb8091d0f32 | ORPH
   sparc     |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/ddbb9da6e074980abbbdcb66458b0423c24caa55 | ORPH
   s390x     |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/c11971c66939173bd4c8710d6f5f5810fb388040 | ORPH
   armeb     |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/517d7fc4a2c0bed93b7676684daf901b84d76a5a | ORPH
    i686     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/0d7d44d6487cde9ecdf15d0c9d33898128cfbad8 | ORPH
   armeb     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/a6acc286088f93f13e674961ee1a77dd5291dbca | ORPH
microblazeel |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/0c0a4ea20c011ab5e932da426913cf07d6e04aac | ORPH
   sparc     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/48cc9f8e390e7a73e462dc63c0a05ed528d8bc8e | ORPH
  mips64el   |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/094eb9427936b853c6dbe3aead3af5f929a12de7 | ORPH
  sparc64    |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/64b519eebafd4e748a5c1c881102affe623a25de | ORPH
   s390x     |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/9f23580c957135100ff30adfa3a406e8b635bda9 | ORPH
   mips64    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/4f11f39630a45198b6eee1fd55f47ce66c0864fa | ORPH
    or1k     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/6ae8bfd6d89c7d09fc97da4d0799a66ab80f8581 | ORPH
   nios2     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/b9914c2aafa3526e0fc1f9001455ab928f98e2a1 | ORPH
    or1k     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/b7413aac30d0e9d102c9e99994e0c790cba94782 | ORPH
    m68k     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/dae185e0d58624a16d835bcbd62424422c301f28 | ORPH
  mips64el   |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/9858ac65e410900a787ca6d47fdd001a4276e04a | ORPH
   armeb     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/3d35eab09f9ab897cea9eb151d52bd3b7c2d4bcd | ORPH
  mips64el   |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/6e148e52d9db13044777ca145b11fc7df1a99547 | ORPH
   sh4eb     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/248e6347e4e51de49363eaa5d8d4454232e84c34 | ORPH
   sparc     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/259bd3857942253e444563c646a5d51140211edc | ORPH
   mips64    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/e515809ec994c02dd59fad511862ba5eaffad595 | ORPH
    i586     |     ltp-testsuite-20240524     | NOK | https://autobuild.buildroot.org/results/780158fc70265a876d030b0ff6a7b0c3502698c6 |     
   xtensa    |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/7ad72d7d071fb97e631775878070624c71c2c69b |     
  sparc64    |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/ef5e73947d024e40eeb010135a4c66749664d12c |     
microblazeel |          lvm2-2.03.27          | NOK | https://autobuild.buildroot.org/results/1b3487c12782f1bd2174fe14849db85aa5df4d8a | ORPH
 aarch64_be  |          lvm2-2.03.27          | NOK | https://autobuild.buildroot.org/results/d66eb3758aa77a7e8a49bd381bbe0b1c8e6007a3 | ORPH
  riscv32    |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/e177de4888ab3202145e74d2dce11b1723547734 | ORPH
    or1k     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/6c44b150b5a01dc1866b0727cbcdb3ae57fdc6a6 | ORPH
powerpc64le  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/b415a59830600bdd75355797b91e2b7f7b7370c3 | ORPH
  riscv32    |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/f158fda85ea97969f9c8aeada68cacf4d9f9dc86 | ORPH
    mips     |    matchbox-keyboard-0.1.1     | NOK | https://autobuild.buildroot.org/results/678f9bff51435b661281a08cf4f6351917bf5059 |     
 aarch64_be  |         mesa3d-24.0.9          | NOK | https://autobuild.buildroot.org/results/48325f223ee2bc05ec857341a8de7503cfb0d27b |     
  mips64el   |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/fc739c054644e6ef5b0aa9ffd67df6ab272c1abc |     
    or1k     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/f9ef3b21eaa1f3828400a2da1e589f8682589e30 |     
  mips64el   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/52a8040f69361ab3c8e4c75e0916ae41dedc69e1 |     
   mips64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/1637b779f18708dbc0f1dd1f2eff382330ff9045 |     
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/971ab49b5e2054169c7c78bb5037be783330c8d0 |     
  mips64el   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/10534e47af714f5a0b13fd610ae169bc3e199135 |     
    or1k     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/ff0dc6e513104782c90a9d8747436ed89a49c8df | ORPH
 powerpc64   |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/fadfdf6905ef5f0e9c0d57543a7740d13120aaca | ORPH
    m68k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/9ed9d34401b35e5e125d3a832877d56ba22171ec |     
   x86_64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/88733d13c5dc1a6223c984afedaa3cb580263798 |     
   arceb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/da6627aacf5ad8bd8bfc80dba535c4031d5f4d76 |     
    arc      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/7a883b89da7e46d62ab48d4889d22f820294f1a0 |     
   mips64    |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/bc287f8b90cfb8299e0292618619f2e989f3885c |     
  mips64el   |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/a4bbd4b986f97ca28001e9a3a92e701a215b219e |     
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/1e67072433761e2d85619a0eae5075c8ac429061 | ORPH
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/7c04efaf2798395efa93db3856ec840792fbe7ee | ORPH
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/cf43b3db932c101550081b440adb720d444a746f | ORPH
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/9c68c4bb30e4293bdce364f3d65045019f80f1e3 | ORPH
   armeb     |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/c82fa93176b39ff911a3cbb4e8b09f42f78fc6b4 | ORPH
   s390x     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/756832671cb15d5fcf01efa5970c63c0b6f6859a |     
 aarch64_be  |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/55b5888e81b4866edcf8a73d2a3c66642401c986 |     
 aarch64_be  |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/327ff98cd78006b64e2067bcc1b95ab1a13b8266 |     
   mipsel    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/ea7999f8e873fb6ed9d60e0658067486a638a33b |     
 powerpc64   |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/500db283942be9e5827365e7fefc3a719d68efc9 | ORPH
powerpc64le  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/7659f4cf6ef5ddeb55dba608dda035008cacc12f | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/64a41acdd4e690b2f944f41601bb9c416354b226 | ORPH
    i686     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/150abd8c83aad6032937d07116e33b5752c870ff | ORPH
  mips64el   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/5681afba6f37469c3cd220861bbcdb5e2f8bfead | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/3239b4423d3ae853cc5c63ae9b47fd8f6a865dc5 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/9ef609821b54c04c29ee62de274fac797ff4248d | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/378596aa3901693ad75cf7dba98072934f5972b1 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/3be632c31227438fe3f5c92093228ad63254f121 | ORPH
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/a3b5788b9c3708e5d75879e449fd7a4caef9cae0 | ORPH
   sh4eb     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/479af24cc27e9f95477a28621a5b311acecd8052 | ORPH
microblazeel |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/159406661f8c426f4c2a601d289b90615594ec85 | ORPH
   s390x     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/c3cb807c5b2dee99c495e4f339319e717e5b544c |     
    sh4      |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/8949c45d5ab4820626fc80473dc475d48231e5cd |     
   s390x     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/1620ecd64598b84101a2fc2d7388ce9c84e5d585 |     
   x86_64    |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/a0f425091eda83eac4f78cbae3a04a6d71693d67 |     
 aarch64_be  |    riemann-c-client-1.10.5     | NOK | https://autobuild.buildroot.org/results/6719dd0469967a310b4780c72f9b808e231c09b8 | ORPH
   s390x     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/5a86c98590652b8c0ad7a3bc06bb10d3d9f69c23 | ORPH
powerpc64le  |          sdl2-2.30.9           | NOK | https://autobuild.buildroot.org/results/947bf869b33c9c01e0fa4e24c7ad20e86710b061 |     
powerpc64le  |          swipl-9.2.8           | NOK | https://autobuild.buildroot.org/results/4d3c83c63dbac478432ad580b8e944eacdc3c243 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/34138f8441ec82fbf6a2a77d5c90efa2a00040dc |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/ce7e490ae13a5d1cb57e447d0302809b39cc16fd |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/c2a47946d9d0479ebdc45a7efc89f986d8be74dd |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/1c5e97410be267397007e2255f1f279431b6bfb1 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/dbb81b5a74c85f62e6d4f4b983609901c2586082 |     
  mips64el   |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/0562bb3828783d07e65b2b47e0e9ab77f6980241 | ORPH
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/5aa3d0a2c5963ad93f89f816f59d7114e8b55fed | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/48d30da18d3e667f9e83cf3f35f4ddddeb63ceba | ORPH
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/94467013d5f2da64cd7d034bc6aabb3a93035395 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/f8f5441e55a30a3e66054db20d7f83b7e7fd27d3 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/78b8d3179d5b2962944f6b7940e2a3f4cd824216 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/1f7dc0a3a35aac705f38c7cd9c5d839ab03e1971 | ORPH
  mips64el   |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/bee7f507a37346c51af3d776244828e42b75e511 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/8bdb1a837681022698cba09791154a259fe7365f | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/765cc4393ddf69316895a57000410b2725969279 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/7018b903e4a3afe553493da4c8794b4d7e5d1ff9 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/3e9d5cc9492e586674a6e6eae410a914998e9e4a | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/9c369ec9cca925b14e1fa2727d1df666a42063cd | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/a5079ffe8904ed3b6bd7a184c3e0de975f9f4eea | ORPH
   x86_64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/d999f68c6956718af21329bd56a2659c00c392f2 | ORPH
   x86_64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/3edc2c7de0716dcca60d689111476f1f35c2913f | ORPH
  mips64el   |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/08b0e01325d205f425c661138d58e39f61b08172 | ORPH
  sparc64    |      v4l2loopback-0.13.2       | NOK | https://autobuild.buildroot.org/results/21da18ec938d09baf3ad525db6bd826e16d19f12 |     
  mips64el   |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/10f058526b5c150f9208e5ef608844e140c54bc8 | ORPH
  riscv64    |         watchdog-5.16          | NOK | https://autobuild.buildroot.org/results/a7f16a6721f3901fece98229da073a83bded7c60 |     
  mips64el   |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/d7b847aab0a597e918d3d7a97024f3098d7053bd |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  gamin-0.1.10 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |          gamin-0.1.10          | NOK | https://autobuild.buildroot.org/results/ef2b87da32c81fa635f795a99f352a18f535ec25 |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

           crucible-2023.11.02 | 1 
                  curlpp-0.8.1 | 1 
               ipmitool-1_8_19 | 1 
               libglib2-2.76.1 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/1d24f22e464bfb4bfaede9301dcaaeb1bb2c6296 |     
   nios2     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/83c896454e6176c0e7b3d07a48ac3998c2998a08 |     
   s390x     |        ipmitool-1_8_19         | NOK | https://autobuild.buildroot.org/results/9600c46f263f9a2d13d57e7d0d764422c7ff573b |     
    arc      |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/a3e7472fea8eb8a179bbb0cc4699e1a6fd753fac |     


Classification of failures by reason for next
---------------------------------------------

  binutils-arc-2023.09-release | 1 
         gobject-introspection | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/230f55a481ba45c9ab99d5b95e6b5545074236ec |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/c45880030e7fccc947d0e71f38162426a3430acc |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
