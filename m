Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BF9CAC581
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 08:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73A0F61BED;
	Mon,  8 Sep 2025 08:57:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NHLUNaYVRhap; Mon,  8 Sep 2025 08:57:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EBC861C21
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EBC861C21;
	Mon,  8 Sep 2025 08:57:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A0856186
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 03:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8754B41F52
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 03:22:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tIPiSAfciyHZ for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 03:22:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2FC8C41342
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FC8C41342
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2FC8C41342
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 03:22:01 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b043a33b060so609658266b.1
 for <buildroot@buildroot.org>; Sun, 07 Sep 2025 20:22:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757301720; x=1757906520;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jQQUlzvQfX7chkDli+BxDtSi9jGnzblHxz4xxvJGWYk=;
 b=Fob1YNQZrVH21CdOZEBoTxCnwcvwOIzjMR2hPcPc5JA1dOuo4OT2qDeKmYS/fSppR5
 DzFaSR9ux0goEiPv12cCcZ6FNe7iq1D5mF+ARtpvfl8A7pG7jvxW4kZ8IJ12H4YABwSm
 B/OkErNnrL/weIZrekKA9AbnQy0Z5a5TvbftpBcWFCCs5REeZ/B9AcrEY4shrJ21Cc7A
 C667hx+Um4X1fSTI2E2x5taccpgopXqjODlgUk9zA7nEMDSibBr/uOBcUy6Ehj/IVYaL
 T89lKXhI/KjnCYX805HwOJRLmycosHh2R25K9DJYMnuGRVnhjfaC8mgUpeRuA0/7m/cZ
 iu6g==
X-Gm-Message-State: AOJu0YxxHa2upECva+rYTx7p2/MOnm94nzdbMdZpuzWVI+FszLeaZ3RN
 KoYcpthagq7ser2nJCVlVPVMXPhClD3rrp2ZfMA+IWlJNCjeCqgJ3ij384ICKg==
X-Gm-Gg: ASbGncu8Mp2w+yrEt7IIT1VfvPPzKOei1sOIhKCf1Rryt0N2dV8pCs2HXodUvAPAZ8M
 o3KCZpGRSxm+61MzKZUIvhofVE9Cxyza/Nj7akWRNacTDaYP1ZsSMJVaNqw+FpVbfnjxeXm0pCP
 z4vSVJgVyVKnolYtL0DXYwQ5soKpUmngIPAV80JpR57y3wHjPHeyT+X9oaIi8n6gJfEm2qT07dh
 JivdguNprkwBZhwyE6dC1DVFl65ROwoKWehSFcUDOymTwK2CFYig+mr5eVsuBOt7qQz8EsDLCPr
 wMWPewZMZHh/lOgTOfDs6J0Ykfu3OD31BwW1X51rwkBf5nlIGGyozw4Fh2WL3AT/1s4Ul7eTBtC
 I2yiCVWj6vHN76xYbdZrdwzbH2cL6xg==
X-Google-Smtp-Source: AGHT+IEdMc9b1aq3ccpt84Pv6HV90qeevL1J1cnrI+BnRJHSCBPjeSindliDu0MWqFH6BiKZX043UQ==
X-Received: by 2002:a17:907:3fa4:b0:b04:a2e4:89b4 with SMTP id
 a640c23a62f3a-b04b1702cf0mr593076666b.49.1757301718537; 
 Sun, 07 Sep 2025 20:21:58 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b046e6c630fsm1180602166b.55.2025.09.07.20.21.57
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Sep 2025 20:21:57 -0700 (PDT)
Message-ID: <68be4bd5.170a0220.1d9c6.e91e@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Mon, 08 Sep 2025 03:21:57 -0000
X-Mailman-Approved-At: Mon, 08 Sep 2025 08:57:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757301720; x=1757906520; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=jQQUlzvQfX7chkDli+BxDtSi9jGnzblHxz4xxvJGWYk=;
 b=m9Y5MV/Tz1oNa+5TleMIMSJQNIbgArjbBNFClZUhkXhbaOvxVyA2aH+J3cTYFxsUCk
 AvO7ZJGAPgaZZ01qVyc77nA6OaVidfINyOdCcRph9rQyLtviioqEzn4Iubede69W1mjB
 yKULsmnPmj20yg162rQgNoD6YbVP229K0QWBaPa/GR3WhGGSl2Szir5qZoCeCh28JdMr
 unyqpBX7RybMGCdxw25X8ydJ4ZKBpW9JUV159n9P3vePxg0RMyEAJb5C1YQW480yK3KD
 n13I5McJcadpgYqALJFah1wszL61/Fb7WvvdVKLpFX0WGNacYAvYn2d2/FfPtGQzCx3A
 4blA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=m9Y5MV/T
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-09-07
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

Autobuild statistics for 2025-09-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  | 10  |  0  | 13  |
  2025.05.x  |  5  |  1  |  0  |  6  |
    master   | 30  | 332 |  0  | 362 |
     next    |  2  |  3  |  0  |  5  |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 35
              libselinux-3.8.1 | 26
                    yajl-2.1.0 | 16
               bctoolbox-4.4.8 | 11
              host-json-c-0.18 | 11
         host-mariadb-10.11.11 | 11
                       cfm-0.3 | 10
             batman-adv-2024.4 | 9 
                   cvs-1.12.13 | 9 
                 libsoxr-0.1.3 | 8 
                   perl-5.40.2 | 8 
alure-14beed2a86d5a36030e90... | 7 
                 expect-5.45.4 | 5 
libdbi-drivers-0bfae6c43134... | 5 
                 libiconv-1.15 | 5 
                 logsurfer-1.8 | 5 
                 apitrace-10.0 | 4 
             dahdi-linux-3.3.0 | 4 
                    ficl-4.1.0 | 4 
                  linux-6.16.5 | 4 
                    mpir-3.0.0 | 4 
                 uclibc-1.0.54 | 4 
                   atop-2.11.0 | 3 
  gobject-introspection-1.84.0 | 3 
host-am335x-pru-package-5f3... | 3 
                 host-gdb-14.2 | 3 
          sane-airscan-0.99.33 | 3 
                       unknown | 3 
             util-linux-2.41.1 | 3 
        vulkan-headers-1.4.317 | 3 
                     bc-1.07.1 | 2 
                    brltty-6.6 | 2 
                 c-icap-0.5.10 | 2 
          chocolate-doom-3.0.1 | 2 
           crucible-2023.11.02 | 2 
glibc-2.41-70-g1502c248d58c... | 2 
              graphite2-1.3.14 | 2 
           host-doxygen-1.8.18 | 2 
    host-mender-artifact-4.1.0 | 2 
             libgphoto2-2.5.27 | 2 
           libmicrohttpd-1.0.2 | 2 
libmodplug-d1b97ed0020bc620... | 2 
          linux-5.10.162-cip24 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                 netsnmp-5.9.4 | 2 
          aardvark-dns-v1.16.0 | 1 
               acpica-20241212 | 1 
                 agentpp-4.6.1 | 1 
amazon-ecr-credential-helpe... | 1 
                apparmor-3.1.7 | 1 
           at-spi2-core-2.50.0 | 1 
                    azmq-1.0.3 | 1 
                    bat-0.25.0 | 1 
             berkeleydb-5.3.28 | 1 
                  brotli-1.1.0 | 1 
                  cairo-1.18.4 | 1 
                 cdrkit-1.1.11 | 1 
                 coreutils-9.5 | 1 
                diffutils-3.12 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                  dpdk-24.11.1 | 1 
                   dvblast-3.4 | 1 
               dvbsnoop-1.4.50 | 1 
              e2fsprogs-1.47.2 | 1 
                enscript-1.6.6 | 1 
              fftw-quad-3.3.10 | 1 
firmware-utils-86739f2b3ae9... | 1 
flashbench-2e30b1968a661474... | 1 
              fluent-bit-4.0.3 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
            gettext-gnu-0.22.4 | 1 
               harfbuzz-11.3.3 | 1 
            host-binutils-2.42 | 1 
 host-binutils-bare-metal-2.44 | 1 
             host-fatcat-1.1.1 | 1 
         host-gcc-final-13.4.0 | 1 
                 host-gdb-15.2 | 1 
              host-guile-3.0.9 | 1 
                host-m4-1.4.20 | 1 
                host-odb-2.4.0 | 1 
               host-ola-0.10.9 | 1 
               host-runc-1.3.0 | 1 
 host-softether-4.30-9700-beta | 1 
              host-swipl-9.2.8 | 1 
           imagemagick-7.1.2-3 | 1 
                 inadyn-2.12.0 | 1 
   libcdio-paranoia-10.2+2.0.1 | 1 
                    libev-4.33 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
               libglib2-2.84.3 | 1 
                   libidn-1.42 | 1 
                  libjwt-3.2.0 | 1 
                 libmbus-0.8.0 | 1 
     libphidget-2.1.9.20190409 | 1 
                 libpng-1.6.50 | 1 
                libsepol-3.8.1 | 1 
                libshout-2.4.6 | 1 
                libsolv-0.7.30 | 1 
libubox-3868f47c8f6c6570e62... | 1 
                  liburing-2.6 | 1 
                  libva-2.22.0 | 1 
                   linux-tools | 1 
        ltp-testsuite-20250530 | 1 
                 mbedtls-3.6.4 | 1 
           oath-toolkit-2.6.12 | 1 
                 openal-1.24.3 | 1 
      passt-2025_06_11.0293c6f | 1 
                pipewire-1.2.8 | 1 
psimd-072586a71b55b7f8c5841... | 1 
               pulseaudio-17.0 | 1 
       python-flask-cors-6.0.1 | 1 
         s6-networking-2.7.0.4 | 1 
                 samba4-4.22.3 | 1 
                 siproxd-0.8.3 | 1 
                  snmppp-3.5.1 | 1 
       sp-oops-extract-0.0.7-1 | 1 
                     unzip-6.0 | 1 
               valgrind-3.25.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |      aardvark-dns-v1.16.0      | NOK | https://autobuild.buildroot.org/results/840da4b9564dd156b060cacf8b269cf7b0e60fa8 | ORPH
powerpc64le  |        acpica-20241212         | NOK | https://autobuild.buildroot.org/results/38b7af2084421c244f5cf65c209c086548ad6ec5 | ORPH
powerpc64le  |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/b355c67ddefdcd1ab0e66cd6833525d542c9a1e1 |     
    sh4a     | alure-14beed2a86d5a36030e90... | NOK | https://autobuild.buildroot.org/results/7cda65d57fa05adeedfd814ff1a5ccdf4b62e95d |     
   s390x     | alure-14beed2a86d5a36030e90... | NOK | https://autobuild.buildroot.org/results/ae7a41302f4ac05bb219acc8effc761c625fd2a9 |     
   mipsel    | alure-14beed2a86d5a36030e90... | NOK | https://autobuild.buildroot.org/results/0f2ebdb44211407291863669ecc103b5870aabfd |     
   s390x     | alure-14beed2a86d5a36030e90... | NOK | https://autobuild.buildroot.org/results/fb225e226fb5cc2a5e67a951e22b7b762ec9ca86 |     
   x86_64    | alure-14beed2a86d5a36030e90... | NOK | https://autobuild.buildroot.org/results/83dfb64b401d43d9d8b6c054ab06c11131efa37e |     
  aarch64    | alure-14beed2a86d5a36030e90... | NOK | https://autobuild.buildroot.org/results/7cda802d34ff06bb6ef5d3f4ea868e2e864e4d7b |     
  sparc64    | alure-14beed2a86d5a36030e90... | NOK | https://autobuild.buildroot.org/results/a981e0ec66ab2d5ae258771e47e622464eba385f |     
   x86_64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/e17f05ef58d9fc32c22d0600b3b94e2fa56a0e19 | ORPH
 microblaze  |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/d5b73c11a6029ea266e54af0423f14710e7d0a52 |     
 aarch64_be  |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/c0fb3f818b68db3b79f2af9cc3bd6dc297f28e82 |     
   mips64    |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/4b86198e46800fc37fcd2c737a2a69069128d8e1 |     
    arm      |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/df2a3bb42e5285546d82b8043eea6935e8feaf5f |     
    arc      |         apparmor-3.1.7         | NOK | https://autobuild.buildroot.org/results/4dfe386cef4555321678fdf87c1a865a364a0ad8 |     
loongarch64  |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/234b088668ff644857e837158bebbd32ceba271d |     
 microblaze  |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/67fa44bc23ab66a38bb58cce97d604a97dfeb8b1 |     
   sh4eb     |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/97c520879f4e60eee3f7b1b077404ef85fb7338a |     
   s390x     |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/26969cca0d80eb36523521579b0afcd2a4f8596c |     
microblazeel |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/af06baffa43641ca843495a0e2a90f60c575dd1f |     
  powerpc    |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/93f4ce664c269f5f39da40d26edeab79f1dda21f |     
    i586     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/f2277cf8d8004dfd243293b6c7c837469fc02527 |     
  riscv64    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/ac3a8032e6ccfa5b8fca2559c0ff6430a4619b68 |     
  aarch64    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/78f758ceb6f2d27f44aacafad1b881d2ce0b4d38 |     
  riscv64    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/bf776fdb3a22bbd7cdeb9b9186c03257bfc442ff |     
loongarch64  |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/8c21d209e248625e2a593ff9319a6fb1aafbc1a4 |     
   armeb     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/e5112367a113eb51655ecbdd04c9e6ea962275a1 |     
  mips64el   |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/bfc48f95f72e36e9a5689ab1561d713bbf5bff43 |     
  mips64el   |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/b92c341bed90672067ba8f3bf5890d2e3356ba65 |     
   sparc     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/c17add33ba6f95b81798ac261e8857ddf4a7d285 |     
powerpc64le  |           bc-1.07.1            | NOK | https://autobuild.buildroot.org/results/37333904f1f840ebaa89a9bf113baf39d5b76a0c | ORPH
   s390x     |           bc-1.07.1            | NOK | https://autobuild.buildroot.org/results/db83ea719452288f7202eaa1d7a2a71ff2f6a0e8 | ORPH
    m68k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/f5a105d8843268f6c6073abb895a4d4d283a729b | ORPH
   s390x     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/d3f8cf5c01891539c905320ff6abb8b99c968620 | ORPH
powerpc64le  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/3306e09a119ba3fdb8fd00d189af149884c75235 | ORPH
   sh4eb     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/231e7274046f1670331faffc83edea8f6519789b | ORPH
   x86_64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/cfc1853177e6f851c324e65e7f309dada13d7b7a | ORPH
 powerpc64   |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/9599fece1453eff3c1952782c8032646c1d7ff59 | ORPH
    arm      |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/583e5c908505de98c793b4277061bb95c458c4f5 | ORPH
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/6c3b6706e9dcc054e139e772f4cf8aa0ea7a5796 | ORPH
   s390x     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/0882b19bf26db23b8390a45e644c06136887ac85 | ORPH
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/c4fdfa2868b5a9dd377db6c2fb9b4ad4df850c65 | ORPH
   arceb     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/20743a4b5bc9797d2f9ca57dbf84edd17b8e5d66 | ORPH
  mips64el   |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/15b6c50637b3fdab891a8451d18c6a901f01f612 | ORPH
 microblaze  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/97f4f123aeea961f021795df2d379ff8c3303234 |     
   sparc     |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/5d7fbe0061854df754403dcf9d6bd6bca58122f1 |     
   arceb     |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/0c90d414ab03e47917e718877976e50480d14b95 |     
 aarch64_be  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/accbf24d33bdb730eb2c6582484f4095fd653766 | ORPH
  riscv64    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/63b4363f28ad91e1fec09bc8c7c884e11032bc60 | ORPH
  mips64el   |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/4bf5fa8811ef42468f2f0da26fc97d9124dc2264 |     
   arceb     |         cdrkit-1.1.11          | NOK | https://autobuild.buildroot.org/results/e9cf6dfe40f8293ab399681e0841e4199b10ae0b |     
   armeb     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/aa186f35d84bfd206334d0b155228e75451f8747 |     
  mips64el   |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/02e61d26a8c97ad11296f5be1672c1a73814ecf7 |     
    arc      |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/d106e91bdd0230ccce758848d40beebcf12c99bc |     
    mips     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/b885c72f3dd38ab5fd50ea7a90cf7ee191db541e |     
 aarch64_be  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/2998a59a57c0747537b1faaadd435bf237f8439d |     
  mips64el   |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/327436c9c9fbce3451309c0cffb318f0db75ecc2 |     
   sparc     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/29a6f59fffe9df936809b01fab4731ba2bfc148d |     
   sh4eb     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/ea0d33020a7e7820c5d90e65331fc9a804537458 |     
   arceb     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/8b62d330460b58a558647dba580dbb15af4ce214 |     
   sparc     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/2662a7b0f6de8b8d4d7edd17469833d523346d08 |     
powerpc64le  |      chocolate-doom-3.0.1      | NOK | https://autobuild.buildroot.org/results/a9998b63867122876c4014d560ad93b9aa021c2d |     
    arc      |      chocolate-doom-3.0.1      | NOK | https://autobuild.buildroot.org/results/1cc71846c6f4dbb262df0d35d6775dd46981b2dd |     
   x86_64    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/5eba081039bd7d32b42f6875665dbd3375a08e92 | ORPH
   s390x     |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/64019b815c3bab41abdb02a1c83e0c6acc0ae658 |     
    arm      |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/0c0c690521fa0f204b442cde75cbc45ae4c9fb31 |     
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/0b96dac6b4fbc3c7a9a3b972974d778179651b31 | ORPH
    mips     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/0e29e54956d9f7f8004d1dc9ec94a8dbc73d6a32 | ORPH
  powerpc    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/6a695c10f93ddf877b87494abc5ea9c33cbabbc4 | ORPH
loongarch64  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/749b6f131d949246c498083d5a78e13538117a6e | ORPH
loongarch64  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/978c8e1e400b8f3ab831c984782cf954380c74b2 | ORPH
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/7d445da7d5bda6b115920dfdb95573c97123c697 | ORPH
   s390x     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/a0e583dcb60cc4ca85592997ecb614865b5739ef | ORPH
loongarch64  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/de5e5194d162cb231a69b001cdff5195ca5a9587 | ORPH
   mipsel    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/6a46df63f792dbbb58084ececd6a56fcb30b225a | ORPH
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/75ccc585d8e329b748462b32cce5385578480bfe | ORPH
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/2d759654a14c0612c219d639e26010f647547519 | ORPH
   mips64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/052f61bad30ab1642b1cfcbf15727f419e04eb7e | ORPH
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b32e6039bdb917133475df10f8c58bd13eefb3ad | ORPH
 powerpc64   |         diffutils-3.12         | NOK | https://autobuild.buildroot.org/results/de47448e2656d66192165b4b5728655c317e331b | ORPH
 powerpc64   |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/f3ad66a7d4a9c279089826f99beb6bc4da2f8c39 | ORPH
  aarch64    |          dpdk-24.11.1          | NOK | https://autobuild.buildroot.org/results/55b8802a0286ad0554bd32b3b9c51480513f5dd4 |     
   mipsel    |          dvblast-3.4           | NOK | https://autobuild.buildroot.org/results/6ac482c4b2a54f292578666ab9b52176e6ac1097 |     
   mips64    |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/00b8a17a570c42553c3051db6ba9914bb954fbb2 |     
   xtensa    |        e2fsprogs-1.47.2        | NOK | https://autobuild.buildroot.org/results/d45c089a595294bf8e5005d9555999f0ceea53ae | ORPH
   mips64    |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/e9db064b486e4d24209780e94f16999f68c127b8 | ORPH
   armeb     |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/4d6aa40fee030d5da510b5411c0b1e8f881820c8 | ORPH
 aarch64_be  |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/704ea8d51155059e245b85b66053af02a705cbcd | ORPH
 powerpc64   |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/76f250ef427388c1370d7a7657fcc0ca9547a3d7 | ORPH
    sh4a     |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/99a19e0e2fabf42de4cc05c12aef3cd993e0d2d3 | ORPH
   sh4eb     |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/f8690c370f7a5bc866c0f296dc5337da205aa0b5 | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/9b1a6900ad439752055bd80e796244ac483b719f | ORPH
  mips64el   |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/598e5d7c797ebd31df88799fed889b71495e9c0a |     
    mips     |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/f49b4b0a36fbc0b912a15972db4c012c2053d5d9 |     
 powerpc64   |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/7465b9434f3f6d7a7cd732eb4147524d25994229 |     
powerpc64le  |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/a71439bd20f9ed8ceef1d1ab3359c2e5c04b0f76 |     
    arc      | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/3ce0fa8deace2597ca802da003dd4a60ca60a557 |     
   s390x     | flashbench-2e30b1968a661474... | NOK | https://autobuild.buildroot.org/results/d193c06dfc1d64607282be65f00270487b092891 | ORPH
    m68k     |        fluent-bit-4.0.3        | NOK | https://autobuild.buildroot.org/results/efe6f74260662ca743cac306bbe9ef5d81a42192 |     
   mipsel    | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/782f3a2bde44a36c4a344f16f7e6213c6f8df6bf |     
   xtensa    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/688c4237b113bd9d62dd6720a2c54db46ccc2736 | ORPH
   arceb     | glibc-2.41-70-g1502c248d58c... | NOK | https://autobuild.buildroot.org/results/67c62c2c80e5203b34ff9b5146db321168df0896 |     
   arceb     | glibc-2.41-70-g1502c248d58c... | NOK | https://autobuild.buildroot.org/results/15e1e2da54f601ab25480be06cd5fcdc8f11dcc8 |     
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/84247b9d6dac4a44a944506b1098d8bcc51ba272 | ORPH
   sh4eb     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/b4ab2018b3ae0c5e598810d8380a41e16f07d034 | ORPH
    sh4      |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/9949e4a6fa342447ee31a658f0a51cc0dfa3a38f | ORPH
   xtensa    |        graphite2-1.3.14        | NOK | https://autobuild.buildroot.org/results/47c7fc8c3875d950dcd678a64fde185fd08c6d7b | ORPH
   x86_64    |        graphite2-1.3.14        | NOK | https://autobuild.buildroot.org/results/294593b30eef752e602d55fae6598a21e9717376 | ORPH
microblazeel |        harfbuzz-11.3.3         | NOK | https://autobuild.buildroot.org/results/d3ab517257162ede0aa22d1416e44a8cc57ce7d5 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/896931f51dc96d7c51e6874a5c232d34a41b4d46 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/ae51602ea9dadf1659ae1f1347c83705de3d507f |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/1aaf59107311197e457bc12bd2a168610c7e0ede |     
loongarch64  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/123b3e7d2f63ba8282505e0af41b1f147c476d55 |     
    sh4      | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/7e94f937cb61d231bf2803e687f81450a341cff0 |     
   arceb     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/307339c0b2c0d43833be45f7734e16bf7f3f4057 | ORPH
   armeb     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/95517900efe553169294250a1428dd79453187a0 | ORPH
   x86_64    |       host-fatcat-1.1.1        | NOK | https://autobuild.buildroot.org/results/548e662429e7cf91bd48e447345374c6734f1de7 |     
    i686     |     host-gcc-final-13.4.0      | NOK | https://autobuild.buildroot.org/results/2b013756867c17b6d258def8c712a728fa1ce8cd |     
  sparc64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/e7e79fffa26d780d76d7f5d6fb032600375754ce | ORPH
    arm      |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/1043f6b0eacbcef3c85e20dd6949afa6d46b0dce | ORPH
   s390x     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/ec8b529afc6efa2be2605c5a4dc695e026b67367 | ORPH
powerpc64le  |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/c213b0893ad5e0375664b3520b6c6ee8a8f23ffe | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/eb7861f8610bd5ecd85e1a15a3a0cf578ce451bd | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e0e0fda339442d47c83c8329f1a94633514f74dc | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/facb3999d76683050e6511871bec3c091fee462c | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/258be22027fd1550b64cacfda6dd44fd1a583e60 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/dfdd205bfbfd33d09cf92d7ff63e3c2eecd9963d | ORPH
loongarch64  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/70f02f610227094ffb46ba97f61695269a69df7d | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7e74803dc97916d719525b6ea342e4c6be174cb5 | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/86ff2e206751974c1231cdb727b6b90c52ea6100 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5eb2cfa841aad9044f92d6cf972332f42978e258 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c2991237897369dfd61bfc59a74f5989a2e3425c | ORPH
loongarch64  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e8a2dedacaa972b809c4e7a8e130f3c7e8297eba | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1ae424ea5a15620e9e4bd9ba951076beffc2938d | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/36d9258ba5369bdb6f5ccd28bff7fe708fe22840 | ORPH
   sh4eb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/13ca9b1d64a05f8a7c54f051796d9546dd731ec7 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b1fa930956f5ab955acadfd23a784f9d82638601 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/409401e95b991f43afdfdb485f2caec4f06df318 | ORPH
loongarch64  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0fdf6198e3b4122ebbcfa7867add34cb8c0f728f | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8212e481fbd107df79f9398e1daa773967fa9160 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/60d8f2e6b181d88005284d488380dfd586c7f7be | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5a0f0d641a8b5628b5bd75105b51f455bb74b7e6 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9ab2a845090a5eeecb25a0ec6797967fc5e1f19c | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a7cd912eb75f2976babf037bc577efeff33a3f44 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/13f48b3a713960f89e4214071976c4d40f907940 | ORPH
    i586     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6826a9bb2d6283b9bbe8cc3a0bb0bdd47abe1b54 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/57c9406fe83a36052179e5d747bbd0c3bd505e38 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7535ca337e2d122aa36d62d7f067cf1387fcd94f | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8910e470e63582070e0f5f1fd38fb6353597ac2d | ORPH
loongarch64  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ad7f4fcfa7c49806dedf61b81b3f81bfeea71119 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/461eade2ee8300cea35d4f789fd0c6b2c8ec6042 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5c7a13ce299def1836eb70a085fef2ca940976d9 | ORPH
   sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5c4694937ea73276c44941a602a7d244ff7299bb | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/44ed88c733a91798243847e8a1771fec6fed1bd2 | ORPH
   sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f18ebe0c9bc29cfe82ddbbc35cf25567f1afb008 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9476315bcaf6c8d9ea4e5ce93400fa7f35e83a17 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7ce288e3b735eb2ba6285d719af90efc28d5c37e | ORPH
  sparc64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/ba33664b924fa51f22203b0df590192c8f03b47b |     
  aarch64    |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/eec063155095c26d3053d1ed2e4f9ed0cfab939d |     
 aarch64_be  |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/1ddf655051f7670de6a06844f3574879b3e430c6 |     
  mips64el   |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/4ec184d7b3bb8f362583720c115f1e1b3bfc7588 |     
   armeb     |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/cf80d6954444c98b924476cb682ce32ab7cc368e |     
loongarch64  |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/2c749c15ab924e7a21707523288c52a2a89647ea |     
 powerpc64   |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/ca301db223979ad3d91dfd34b8c77e47d551ed5f |     
loongarch64  |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/1bc8391f73302af0b6655de2baa6a58b9499b09b |     
  aarch64    |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/56b15880c1a5be9481c3ea879405f19badfc06e0 |     
    arm      |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/fab8e8b4aa5b38c97e47c510dc7af98683e867c2 |     
 powerpc64   |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/ba10c95a0f4d4d8f0c784b271e5663ef1a221061 |     
 powerpc64   |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/ee793e4fd8aef524f29d08af8bbc2d2630246d7f |     
microblazeel |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/9be16102775534528ae0a97736ea639db5129395 | ORPH
 microblaze  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/c3fb52dd506ff7c494551dbb22f3a9a9092c4ca1 | ORPH
   s390x     |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/01a7ed3391673ea526fd54647ff782d7dd46da8a | ORPH
    i586     |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/8d19900dc04210c9cf24cccd26bc694a578840ef | ORPH
 microblaze  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/fd032a7ce5e7ebfee703ed47d73df2d763a4fd34 | ORPH
microblazeel |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/b98f6a746883f4ed8a59fe7b97ef97ebe891008d | ORPH
loongarch64  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/5cb350130b7b68a1cf6469ad360da5c4a52c157a | ORPH
  riscv64    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/014b77fda5728d9ca65f50d40949cdd60975e350 | ORPH
   mips64    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/a8472fbf28f1b57338be1f9833f6ff3fe886fe17 | ORPH
  aarch64    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/dda2429ce7834df2ad759d541b1803558e5b67e8 | ORPH
    sh4      |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/434cd7c2dc4166cfd2b43c56a5abcb28abd023b8 | ORPH
    sh4a     |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/c0cad92baf1cc5234e20d755ac0609ae0aa60ce1 | ORPH
   x86_64    |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/dcf3c9210466c18363236d390ba05dc88ec0cd35 |     
   mips64    |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/c39591dbddfcf0020f0e3884086787cc93e64d3e |     
 powerpc64   |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/1f14189220d33c7c6b23ad09514c51c8119b2d94 | ORPH
powerpc64le  |        host-ola-0.10.9         | NOK | https://autobuild.buildroot.org/results/895470a735e488d09570a0975830718858ccc787 |     
   mipsel    |        host-runc-1.3.0         | NOK | https://autobuild.buildroot.org/results/11fc12ac0db39e7f008979d3257342bc36307b3b |     
   sh4eb     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/cd80ede6b9374fb16879c46812b2e32c14dc2e41 | ORPH
  powerpc    |        host-swipl-9.2.8        | NOK | https://autobuild.buildroot.org/results/d5451f2c7cdf0719a10064ec2958437804364827 |     
   arceb     |      imagemagick-7.1.2-3       | NOK | https://autobuild.buildroot.org/results/adb8986b5ea670a224e177d421896913997d6ab3 | ORPH
    mips     |         inadyn-2.12.0          | NOK | https://autobuild.buildroot.org/results/3cdc5c7094d6acaa82479f62a951ff3635611639 |     
  mips64el   |  libcdio-paranoia-10.2+2.0.1   | NOK | https://autobuild.buildroot.org/results/3a96abe80c276c5c81f60126262090eb4d7c3b1b |     
microblazeel | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/9f7465ebb1dc675081dd4e7067dff84949c91288 |     
    arc      | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/8b26532e46637b849f696d60f4ca9764ea5e67ed |     
   s390x     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/febdb5e9bfd3d9aff4aeeb5bc6986abe76ad15be |     
    i686     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/7d25990780a77929c9d7a72599478ba43a4e1e56 |     
   mips64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/cb03fbf978874907e328fc4f67b0a1419f166221 |     
    mips     |           libev-4.33           | NOK | https://autobuild.buildroot.org/results/b6be12588b31a4b10aaf86a4e7dae6bc8411dd4c | ORPH
microblazeel | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/ed4ec8d382527532c31eab7e3616f6587f428bea |     
  powerpc    |        libglib2-2.84.3         | NOK | https://autobuild.buildroot.org/results/09538fa0f013274e4a3386e48713359b6bf987cf |     
loongarch64  |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/addd27615f795aed77bdb0fc67e9c0ac8e351b52 | ORPH
    sh4a     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/6c7eaef12875e62eedb860aa23a18c9f7d6a9839 | ORPH
   sparc     |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/ddd7eb9fb96758e7d7bc4222a5c54139106e7acd | ORPH
  mips64el   |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/f4d06b000f838e77819acad90f854728f41bf066 | ORPH
    mips     |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/ef2453a2b8819708c7cc8edc760d5ed15422e8da | ORPH
microblazeel |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/7a8952a1beba6ca394adb32d76aea403f43004db | ORPH
   mips64    |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/fd405e2055aa5375d8334bb8574ece78f4cd6df7 | ORPH
   s390x     |          libidn-1.42           | NOK | https://autobuild.buildroot.org/results/a594cb91ca6905d5d155758f7019b9499d9e6091 |     
 microblaze  |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/3cc1addf75b9cc6feddb7e2f7eca01e5bc999f86 |     
 powerpc64   |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/d28bb45edc364fe87bcd7254d33dac0141821307 | ORPH
 powerpc64   |      libmicrohttpd-1.0.2       | NOK | https://autobuild.buildroot.org/results/063fd3ad9135247afd95c590feae2b71c12bd59a |     
   sh4eb     |      libmicrohttpd-1.0.2       | NOK | https://autobuild.buildroot.org/results/6dfdb97c304ea40213e9549dd43ce8ba830da373 |     
microblazeel | libmodplug-d1b97ed0020bc620... | NOK | https://autobuild.buildroot.org/results/5c8ec268459fa4e3d45cab14d3eb709c6ff54b89 | ORPH
    m68k     | libmodplug-d1b97ed0020bc620... | NOK | https://autobuild.buildroot.org/results/420af55c96fe9f258f05d46eeba5a411e0cc3bce | ORPH
   mips64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/10b6b2cf5ba224b4f5495ca0705935730bdd4a56 |     
  riscv64    |         libpng-1.6.50          | NOK | https://autobuild.buildroot.org/results/3b166ba8cab493bc4059f19b71b54d5926f2f630 |     
   mipsel    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/15ebd6e2034ce5a541782bb7d0e67ebcd8a6b766 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/877853f67cff3558f1fea8dda16610b25e01e196 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/73c47876570594505189c79424f5997a81cdc5b7 |     
  riscv32    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/7b94f44282582d5994f40a741cc0c38bd68b53bd |     
  riscv32    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/341fb97bc5bb6fca91ad12a46b67354f7e886755 |     
microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/e9ce2f139c92ce8d70cbd466f54e3af7a4018ce5 |     
    m68k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/1b0351bc37479b45718ecdd25b006e38b21f63b6 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/7c5365ca9bafc7324fd67b49e1d457fdd7faeadc |     
  powerpc    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/bd6fd7f8ce4e265f1bfdfd1937cf29dc46706dce |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/0cc80e6c93b0166b967342312493fcc95686bbb6 |     
 microblaze  |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/f3abe617fac99a280caaa2fa3b1e26cb4d025e91 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/dc85a67369ec9709df3cf6487d19f6a84b402a0e |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/000183f588eede4de6033c7bd69c607c6a934ce6 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/d099b5a9a3cb5f02cd6e1f3e4d3714bad1995874 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/437ed90e7876fe47e66efaf0cd81586e386356c7 |     
    i586     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/9a89b002f05dd74c12ef7a79dcc2866cdc8e5399 |     
microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/0bb6272beb8c00f70321dd3f606fabbd1529126e |     
microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/60a25030e76bcb0dca8997d3431c6768933f6b63 |     
    sh4a     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/42d26dd12ae61073477ac3cca9d574299e412047 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/f54667351eb999fb59a4d315a3ae341472631bea |     
    arc      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/2295093ca1a72aec450c59960dc8a4f067c91d16 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/3f514274e3609c1e151866931d5fd799f085cb09 |     
   sh4aeb    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/388d315d663da4d0442b094050e45e4816549e30 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/bb7dd67386cf104c4f6698f41510020ed1b00ae7 |     
  riscv32    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/d2f8ca63c9c8d45137219018a0d1fc77188c6275 |     
  powerpc    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/cb6fca4ab67c66ed0a2d3b680c06a7213879df70 |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/612f6a5c8ba2f5a85f9dd5c9300dc563bdf751dc |     
   xtensa    |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/e42e1cf78d84c00a2b5b5fc1983008e5bd09254c | ORPH
   x86_64    |         libsolv-0.7.30         | NOK | https://autobuild.buildroot.org/results/03db66b2a1db6e4966a5f969cbb83ea99974fb88 |     
   s390x     |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/42beb9b040cf01de69d0277f009fe049dabdbff3 |     
 microblaze  |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/7bc8defd5b93d25e420dae79ce9a03a265fe788d |     
powerpc64le  |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/2f60fadd56025707ea1fa578f0e0cf92bbdc14e4 |     
  sparc64    |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/b66188d8e6bf0babf881771dd976baff5da44f12 |     
microblazeel |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/58c085e65441b62cbda6d74da46a3189bed9be3e |     
   arceb     |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/2d317c57d9bcc11d43bca8dcc0436f7ace6f623f |     
microblazeel |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/eab56e55820d709b5eedc46faf8ab50cbc75fd87 |     
    sh4      |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/e592919815347a29431031acd43b65c9f55b5cce |     
   mips64    | libubox-3868f47c8f6c6570e62... | NOK | https://autobuild.buildroot.org/results/775d0e2213e71b2535cf91aba3cc7af2ae4e5df7 |     
   sh4aeb    |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/db9ccb7c2d62367aee20dc203bf4124271a78368 |     
 aarch64_be  |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/059f00b3d644b4f07d5392e10d2653d1445d9a46 |     
  powerpc    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/372cbbfedff8b8448ae3ce60aa28c43483809617 | ORPH
    i686     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/b3cc8a9127668027f64d533307f022d91d411eb4 | ORPH
    mips     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/e80743baf6c2672855d29ec31c5f880a8121a125 | ORPH
powerpc64le  |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/ec2465157b4cfed796a3ed7b299b9e0a63388ea0 | ORPH
   x86_64    |          linux-6.16.5          | NOK | https://autobuild.buildroot.org/results/4cae67aa73ee6d909c842f916411e41a60c08953 | ORPH
powerpc64le  |          linux-6.16.5          | NOK | https://autobuild.buildroot.org/results/0743224a565c000717e1e8d064c9f79ab441f8c7 | ORPH
  sparc64    |          linux-6.16.5          | NOK | https://autobuild.buildroot.org/results/99dcec1b70a084df36cf50bf335a1de90ed7a098 | ORPH
    arm      |          linux-6.16.5          | NOK | https://autobuild.buildroot.org/results/80c293e0134d57402843b77349c80c8064db7b76 | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/285430504386215bdaa0b733b83b50041c66167d | ORPH
    or1k     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/190f5800388760361604283e09706d9dfbac85cd |     
    or1k     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/8f203dfb13b1da72c100b4a20423b05dca352172 |     
 aarch64_be  |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/022289723a567086593fd7fe41f18059ea8b2f93 |     
   s390x     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/1640b3d662b503536479ac10266079abdae833d9 |     
 powerpc64   |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/4855041da948779968335fdbca83e37aba37bcb1 |     
   x86_64    |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/a062da1933cbee33a71e7fd659a1687c8e5617b8 |     
  aarch64    |         mbedtls-3.6.4          | NOK | https://autobuild.buildroot.org/results/ae7c3de25762ec7d8598c71b60a8c1551fffb3b2 |     
    i686     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/2acc89d8fce4107f01f156d7b5cfa17eef12db62 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/286468a696cc658aec9eae1a36a39a0abf075341 |     
  mips64el   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/dd97bec30afeab642e94e1107947e61194bce042 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/fbaf5a1ff5e7c63efcfb5e62102181073dff3c54 |     
    sh4a     |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/89dd44fdcd7d46d8b340a2172cab642cd2de822c | ORPH
    i686     |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/968812eb204bb0957acd1c37a7fab48bd6321e2e | ORPH
  powerpc    |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/4b95e578f53a48e6397d77506d6d877669a9dc74 |     
   sparc     |         openal-1.24.3          | NOK | https://autobuild.buildroot.org/results/36ae46ff3438ec18be60e652f9fd033a32a3ac1e | ORPH
    arc      |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/64debf26f64595f94b7b1b16cff95708cfb7de9b | ORPH
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/017e50b40d77f91e2edc50c30bad0f885f4bf94b |     
microblazeel |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/e62d68de3b634fe4669341e4195cc024b21b40bb |     
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/0e265fe4f53214813ab872842cd157f5508c3586 |     
   mips64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/6c665948288107c57725509eb0b6c5ad08bdf33e |     
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/302916324089620df178215708876cfde1066c03 |     
   xtensa    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/db59945157612068607b6e3b33a6e08040115a95 |     
 microblaze  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/e7c3da9c8fe447db94615e6e1b9fc365e5163279 |     
   mips64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/62fc00bb767daac9b8aea5e2ab1038106b1a2734 |     
    arc      |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/760c06ebb9064548f9e3a07df55c4689325e9319 |     
 powerpc64   | psimd-072586a71b55b7f8c5841... | NOK | https://autobuild.buildroot.org/results/0157a93561bf475ba2ceb204d925531ec35a6cdd |     
   armeb     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/e0d7ad7af98e2026a262e9cfdd72ae13f91cc1f6 | ORPH
powerpc64le  |    python-flask-cors-6.0.1     | NOK | https://autobuild.buildroot.org/results/5a1bf0284a7f524126a442d6ee53735a43e11404 |     
  mips64el   |     s6-networking-2.7.0.4      | NOK | https://autobuild.buildroot.org/results/0051fb649f9557a2284bad9948d234eb3d4f355a |     
    m68k     |         samba4-4.22.3          | NOK | https://autobuild.buildroot.org/results/2cd21bfea5e33bec1b85acf3a48eb9e46328872a |     
powerpc64le  |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/2dea5b17a7562423b3bf5d5ad205090b59ba76f5 |     
   s390x     |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/b7410360ee6bcd83cc3710b4603e687f8e6407a1 |     
powerpc64le  |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/eb9ee580ebd70ee1037fe6cc6d2b83c5e703c201 |     
    sh4a     |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/b32b5ebe9a4fde318660d03b18810900a87358f7 |     
loongarch64  |          snmppp-3.5.1          | NOK | https://autobuild.buildroot.org/results/0e4ea7ef94c3b634bc3abfcdf809c43890d5a075 |     
 powerpc64   |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/f22fa281199bb0cac1d27f9ce57020ca598664c7 |     
   sparc     |         uclibc-1.0.54          | NOK | https://autobuild.buildroot.org/results/6f43646e08d64c07ce23feffa8d05d4dad3a9a70 |     
  riscv32    |         uclibc-1.0.54          | NOK | https://autobuild.buildroot.org/results/abdcffaed0fbcc84c780c731d259f0018efdb603 |     
   sparc     |         uclibc-1.0.54          | NOK | https://autobuild.buildroot.org/results/285a674025a22795c345b3f51320d9bab36f8fbe |     
   sparc     |         uclibc-1.0.54          | NOK | https://autobuild.buildroot.org/results/2a9d4ecaf2f631657591a7e4bb6e5f056672e5f1 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/2ad5aee063b73162c298e87363550e0838be6c08 |     
  riscv32    |            unknown             | NOK | https://autobuild.buildroot.org/results/cb62010a57b727cfd40f1ca356fd54b2ea10e4e2 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/2e72cf13a8a13d8fd1edbab9d53db0486d46cc36 |     
  powerpc    |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/1e1693d3b9c257eabd4de8c15b134a2f75f9b0cc |     
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/adae1b20b189e0df98fb55f4faeb1140d6de799f | ORPH
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/5e337b51313be2e9d1275ba7e860d4a9e712bfda | ORPH
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/f1ce811921d7855ee885172cdf5af9e0f387ccfd | ORPH
   mips64    |        valgrind-3.25.1         | NOK | https://autobuild.buildroot.org/results/2b7fd854bf22a013cc8c356ca006a7325977cbc8 | ORPH
   armeb     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/db71e11420205b5bce92fd5fb4bb7112d86434a6 | ORPH
 microblaze  |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/bfb09c1762255208ea52b7cca804431493b72bb0 | ORPH
 aarch64_be  |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/c590194dafc7e8f362ea97aa35a136839615f7f6 | ORPH
    arm      |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/f4dfae648c58425e036e830c691dc2fea21ec579 | ORPH
  mips64el   |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/817c57c26aaba1d5e65a2a8a079500e22ec3026f | ORPH
   s390x     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/3634e7bda288a483606a761d4aba6c60511f08cb | ORPH
  mips64el   |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/54830277a01d8459a58dd88a9c998928404c2fe3 | ORPH
   armeb     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/f62523249f80dfac43f36887d55778ac58e936d3 | ORPH
   s390x     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/0fc22e37569f058879297ae4e037ba1a6292405b | ORPH
    mips     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/eeb7bf0ac90974ea844442c50ad40cef6c12d650 | ORPH
loongarch64  |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/552c252ca1c69fb35a11387f7e23f4ca378103e5 | ORPH
loongarch64  |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/2e6c58ff57f8b43db136934d61b2350e08db65f8 | ORPH
 microblaze  |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/bbf6e6e193c259760420d367b530387b1a7cd749 | ORPH
 microblaze  |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/d6dab1c03114a8bb2a55d876dd58402632b63000 | ORPH
   sparc     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/2e981765ec34e6a5a04e069608587666bbc3e339 | ORPH
   armeb     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/2b79073669a05333b020dc5b21037fa9b708048e | ORPH
   arceb     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/150ac74ed645c7f386d9fbb822195aa94bc69aaf | ORPH
  mips64el   |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/9bb165dd2ffa9948d8c89676423d401a7b300b99 | ORPH
  mips64el   |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/bbb1d958838a703c86e45e347ea2863da3df497a | ORPH


Classification of failures by reason for next
---------------------------------------------

host-binutils-arc-2024.12-r... | 1 
                python3-3.13.5 | 1 
        vulkan-headers-1.4.317 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/9b17c0390f525c7fc6d3f9c5d1010c376e7df4ef |     
    sh4a     |         python3-3.13.5         | NOK | https://autobuild.buildroot.org/results/d188db357e0fa3cc221c990e58f5f264087ab250 |     
 microblaze  |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/5681ac07493df5f0f72e5beb6950926c2a88d958 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                   cvs-1.12.13 | 1 
                 host-gdb-15.2 | 1 
    host-mender-artifact-4.0.0 | 1 
              host-rust-1.82.0 | 1 
                libressl-3.9.2 | 1 
                 linux-6.12.44 | 1 
                   linux-tools | 1 
mjpg-streamer-5a6e0a2db163e... | 1 
                openswan-3.0.0 | 1 
              wireshark-4.2.11 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/62f89d5682ca9e50e2b34b3aa8e49617914e0c10 | ORPH
    i686     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/9f9e00bce90512e59b364fad22fe02431c799701 | ORPH
  mips64el   |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/1dcf154213d75ee28b6ff7120be1e110a30ebc87 |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/097519f08d1d01107577aefb081da9e8a5f91636 |     
   armeb     |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/9c293716093a345d17c1ab047d7bbc4609b0678c | ORPH
   x86_64    |         linux-6.12.44          | NOK | https://autobuild.buildroot.org/results/b3a5d669491ea5ae6a190334645f85a37d7aceb6 | ORPH
    or1k     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/52ddf64935bcf0c49e4adac651bf7c0d57528a1e | ORPH
   mipsel    | mjpg-streamer-5a6e0a2db163e... | NOK | https://autobuild.buildroot.org/results/35c30d7efd90cedc39b48950cbfccae55b417910 |     
   armeb     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/1e8fffc6e7a2ede9b7a78a0ac4c7259113881bfe | ORPH
powerpc64le  |        wireshark-4.2.11        | NOK | https://autobuild.buildroot.org/results/5889ceaa376bec4a1980a30fcdadf4ad3f297c0b | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                   s6-2.13.1.0 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4a     |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/d30a55f5ebe66444d5f2080df0b4da4e2a242a35 |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org         |   version    |   upstream   | orph?
-------------------------------+----------+-----------------------------------------------+--------------+--------------+-------
                  aardvark-dns |  DISTRO  | https://release-monitoring.org/project/242641 | v1.15.0      | 1.16.0       | ORPH
                           ace |  DISTRO  | https://release-monitoring.org/project/242395 | 7.1.1        | 8.0.5        | ORPH
                       acsccid |  DISTRO  | https://release-monitoring.org/project/015661 | 1.1.11       | 1.1.12       |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/013117 | 3.37.2       | 48.1         |     
                       agentpp |  DISTRO  | https://release-monitoring.org/project/021316 | 4.6.1        | 4.7.2        |     
                        alfred |  DISTRO  | https://release-monitoring.org/project/241870 | 2022.1       | 2025.3       | ORPH
                 android-tools |  GUESS   | https://release-monitoring.org/project/013989 | 4.2.2+git... | 16.0.0_r2    |     
                           apr |  DISTRO  | https://release-monitoring.org/project/000095 | 1.7.5        | 1.7.6        |     
                         argus |  DISTRO  | https://release-monitoring.org/project/000107 | 3.0.8.2      | 5.0.2        | ORPH
                      asterisk |  DISTRO  | https://release-monitoring.org/project/009838 | 22.3.0       | 22.5.2       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/007841 | 2.50.0       | 2.56.4       |     
                           atf |  DISTRO  | https://release-monitoring.org/project/021394 | 0.21         | 0.23         | ORPH
                         atkmm |  DISTRO  | https://release-monitoring.org/project/007962 | 2.36.2       | 2.36.3       |     
                          atop |  DISTRO  | https://release-monitoring.org/project/000135 | 2.11.0       | 2.12.0       |     
                         audit |  DISTRO  | https://release-monitoring.org/project/015225 | 3.1.2        | 4.1.2        |     
              autoconf-archive |  DISTRO  | https://release-monitoring.org/project/000142 | 2023.02.20   | 2024.10.16   | ORPH
                      automake |  DISTRO  | https://release-monitoring.org/project/000144 | 1.16.5       | 1.18.1       | ORPH
                       avocado |  DISTRO  | https://release-monitoring.org/project/013385 | 98.0         | 111.0        | ORPH
                       avrdude |  DISTRO  | https://release-monitoring.org/project/010751 | 8.0          | 8.1          |     
                   babeltrace2 |  DISTRO  | https://release-monitoring.org/project/007137 | 2.0.6        | 2.1.2        |     
                 balena-engine |  DISTRO  | https://release-monitoring.org/project/141616 | 20.10.26     | 20.10.44     |     
                          bash |  DISTRO  | https://release-monitoring.org/project/000166 | 5.2.37       | 5.3          | ORPH
               bash-completion |  DISTRO  | https://release-monitoring.org/project/005667 | 2.11         | 2.16.0       | ORPH
                        batctl |  DISTRO  | https://release-monitoring.org/project/014740 | 2024.2       | 2025.3       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/019529 | 2024.4       | 2025.3       |     
                   bats-assert |  DISTRO  | https://release-monitoring.org/project/372274 | 2.1.0        | 2.2.0        |     
                            bc |  DISTRO  | https://release-monitoring.org/project/000170 | 1.07.1       | 1.08.2       | ORPH
                  bcache-tools |  DISTRO  | https://release-monitoring.org/project/021397 | 1.0.8        | 1.1          | ORPH
                           bcc |  DISTRO  | https://release-monitoring.org/project/012803 | v0.34.0      | 0.35.0       |     
                       bcm2835 |  DISTRO  | https://release-monitoring.org/project/021323 | 1.73         | 1.75         | ORPH
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/014746 | 4.4.8        | 5.4.42       | ORPH
                     belle-sip |  DISTRO  | https://release-monitoring.org/project/014378 | 4.4.8        | 5.4.42       |     
                          belr |  DISTRO  | https://release-monitoring.org/project/080042 | 4.4.8        | 5.4.42       |     
                    berkeleydb |  GUESS   | https://release-monitoring.org/project/138386 | 5.3.28       | 18.1.14      | ORPH
                          bind |  DISTRO  | https://release-monitoring.org/project/014923 | 9.18.33      | 9.20.12      | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/007981 | 2.43.1       | 2.45         |     
                          bird |  DISTRO  | https://release-monitoring.org/project/000192 | 2.15.1       | 3.1.3        |     
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/013618 | 28.0         | 29.1         |     
                  bluez5_utils |  DISTRO  | https://release-monitoring.org/project/010029 | 5.79         | 5.83         |     
          bluez5_utils-headers |  DISTRO  | https://release-monitoring.org/project/010029 | 5.79         | 5.83         |     
                         boinc |  DISTRO  | https://release-monitoring.org/project/000211 | 7.20.2       | 8.0.2        |     
                         boost |  DISTRO  | https://release-monitoring.org/project/006845 | 1.83.0       | 1.89.0       |     
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/021578 | 4.3.1        | 5.3.8        |     
                         botan |  DISTRO  | https://release-monitoring.org/project/000214 | 3.5.0        | 3.9.0        | ORPH
                       bpftool |  DISTRO  | https://release-monitoring.org/project/328454 | v7.5.0       | 7.6.0        |     
                      bpftrace |  DISTRO  | https://release-monitoring.org/project/141354 | 0.23.3       | 0.23.5       |     
                        brltty |  DISTRO  | https://release-monitoring.org/project/000220 | 6.6          | 6.8          |     
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/000227 | 6.10         | 6.16         | ORPH
                        bustle |  DISTRO  | https://release-monitoring.org/project/006428 | 0.8.0        | 0.12.0       | ORPH
                        c-icap |  DISTRO  | https://release-monitoring.org/project/021325 | 0.5.10       | 0.6.4        | ORPH
                c-icap-modules |  DISTRO  | https://release-monitoring.org/project/021326 | 0.5.5        | 0.5.7        | ORPH
                       cairomm |  DISTRO  | https://release-monitoring.org/project/007959 | 1.16.2       | 1.18.0       |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/010888 | 0.0.25       | 0.303.1      | ORPH
                     capnproto |  DISTRO  | https://release-monitoring.org/project/011515 | 0.10.4       | 1.2.0        |     
                          ccid |  DISTRO  | https://release-monitoring.org/project/002612 | 1.5.2        | 1.6.2        | ORPH
                          cctz |  DISTRO  | https://release-monitoring.org/project/017090 | 2.4          | 2.5          |     
                       chartjs |  DISTRO  | https://release-monitoring.org/project/085785 | 3.9.1        | 4.5.0        | ORPH
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/000276 | 3.8.1        | 20200710     |     
                chocolate-doom |  DISTRO  | https://release-monitoring.org/project/008547 | 3.0.1        | 3.1.1        |     
                        chrony |  DISTRO  | https://release-monitoring.org/project/008810 | 4.7          | 4.8          | ORPH
                        circus |  DISTRO  | https://release-monitoring.org/project/021726 | 0.16.1       | 0.19.0       |     
                         clang |  DISTRO  | https://release-monitoring.org/project/011811 | 20.1.8       | 21.1.0       |     
                         cli11 |  DISTRO  | https://release-monitoring.org/project/020578 | 2.3.2        | 2.5.0        |     
                   cloudflared |  DISTRO  | https://release-monitoring.org/project/186920 | 2025.1.0     | 2025.100.150 |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/000306 | 3.31.8       | 4.1.1        |     
                        cmocka |  DISTRO  | https://release-monitoring.org/project/011779 | 1.1.5        | 1.1.8        |     
                      collectl |  DISTRO  | https://release-monitoring.org/project/000330 | 4.3.2        | 4.3.8        |     
                 comix-cursors |  DISTRO  | https://release-monitoring.org/project/021882 | 0.9.1        | 0.10.1       | ORPH
                   compiler-rt |  DISTRO  | https://release-monitoring.org/project/017705 | 20.1.8       | 21.1.0       |     
                      composer |  DISTRO  | https://release-monitoring.org/project/009710 | 2.5.8        | 2.8.11       |     
                        conmon |  DISTRO  | https://release-monitoring.org/project/096793 | 2.1.8        | 2.1.13       |     
                       connman |  DISTRO  | https://release-monitoring.org/project/000337 | 1.44         | 1.45         |     
               conntrack-tools |  DISTRO  | https://release-monitoring.org/project/000338 | 1.4.7        | 1.4.8        | ORPH
                    containerd |  DISTRO  | https://release-monitoring.org/project/016460 | 2.0.2        | 2.1.4        |     
       containers-image-config |  DISTRO  | https://release-monitoring.org/project/378977 | v5.35.0      | 5.36.2       | ORPH
                     coreutils |  DISTRO  | https://release-monitoring.org/project/000343 | 9.5          | 9.7          | ORPH
                   cpp-httplib |  DISTRO  | https://release-monitoring.org/project/274636 | 0.25.0       | 0.26.0       |     
                        cppzmq |  DISTRO  | https://release-monitoring.org/project/018648 | 4.10.0       | 4.11.0       |     
                      cracklib |  DISTRO  | https://release-monitoring.org/project/000362 | 2.9.11       | 2.10.3       |     
                          criu |  DISTRO  | https://release-monitoring.org/project/000366 | 3.19         | 4.1.1        |     
                      crucible |  DISTRO  | https://release-monitoring.org/project/267616 | 2023.11.02   | 2025.05.28   |     
                       crudini |  DISTRO  | https://release-monitoring.org/project/021669 | 0.9.5        | 0.9.6        |     
                          crun |  DISTRO  | https://release-monitoring.org/project/096792 | 1.22         | 1.23.1       |     
               cryptodev-linux |  DISTRO  | https://release-monitoring.org/project/021409 | 1.13         | 1.14         | ORPH
                       cukinia |  DISTRO  | https://release-monitoring.org/project/138119 | 0.8.0        | 0.9.0        | ORPH
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/005541 | 1.28.17      | 2.0.1        |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/021335 | 2.11.0       | 5.0.1        |     
                          dado |  DISTRO  | https://release-monitoring.org/project/058442 | 1.8.3-1      | 2.2.0-1      |     
                   dahdi-linux |  DISTRO  | https://release-monitoring.org/project/021412 | 3.3.0        | 3.4.0        | ORPH
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/010252 | 3.3.0        | 3.4.0        | ORPH
                         dante |  DISTRO  | https://release-monitoring.org/project/014716 | 1.4.3        | 1.4.4        | ORPH
                          daq3 |  DISTRO  | https://release-monitoring.org/project/212345 | 3.0.9        | 3.0.21       |     
                     darkhttpd |  DISTRO  | https://release-monitoring.org/project/000391 | 1.15         | 1.17         |     
                    datatables |  DISTRO  | https://release-monitoring.org/project/141588 | 1.10.20      | 1.13.4       | ORPH
            datatables-buttons |  DISTRO  | https://release-monitoring.org/project/141589 | 1.6.1        | 2.3.6        | ORPH
       datatables-fixedcolumns |  DISTRO  | https://release-monitoring.org/project/141590 | 3.3.0        | 4.2.2        | ORPH
         datatables-responsive |  DISTRO  | https://release-monitoring.org/project/141591 | 2.2.3        | 2.4.1        | ORPH
                        davfs2 |  DISTRO  | https://release-monitoring.org/project/007487 | 1.7.0        | 1.7.2        | ORPH
                          dbus |  DISTRO  | https://release-monitoring.org/project/005356 | 1.14.10      | 1.16.2       | ORPH
                   dbus-broker |  DISTRO  | https://release-monitoring.org/project/271475 | 36           | 37           |     
                      dbus-cxx |  DISTRO  | https://release-monitoring.org/project/242464 | 2.5.2        | 2.6.0        |     
                   dbus-python |  DISTRO  | https://release-monitoring.org/project/000402 | 1.2.18       | 1.4.0        | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/015086 | 7.2.641      | 7.3.1        | ORPH
                      ddrescue |  DISTRO  | https://release-monitoring.org/project/000410 | 1.28         | 1.29.1       | ORPH
                    dehydrated |  DISTRO  | https://release-monitoring.org/project/011312 | 0.7.1        | 0.7.2        |     
                         delve |  DISTRO  | https://release-monitoring.org/project/040149 | 1.22.1       | 1.25.2       |     
            desktop-file-utils |  DISTRO  | https://release-monitoring.org/project/000421 | 0.26         | 0.28         | ORPH
                        dialog |  DISTRO  | https://release-monitoring.org/project/000431 | 1.3-20220117 | 1.3-20250817 | ORPH
                         dillo |  DISTRO  | https://release-monitoring.org/project/000438 | 3.0.5        | 3.2.0        | ORPH
                          dlib |  DISTRO  | https://release-monitoring.org/project/018600 | 19.24.9      | 20.0         |     
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/021076 | 28.3.2       | 28.4.0       |     
             docker-cli-buildx |  DISTRO  | https://release-monitoring.org/project/325723 | 0.25.0       | 0.28.0       | ORPH
                docker-compose |  DISTRO  | https://release-monitoring.org/project/006185 | 2.38.2       | 2.39.2       |     
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/000447 | 28.3.2       | 28.4.0       |     
                      domoticz |  DISTRO  | https://release-monitoring.org/project/021342 | 2024.4       | 2025.1       |     
                       dovecot |  DISTRO  | https://release-monitoring.org/project/000456 | 2.3.21.1     | 2.4.0        |     
            dovecot-pigeonhole |  DISTRO  | https://release-monitoring.org/project/021418 | 0.5.21.1     | 2.4.0        |     
                          dpdk |  DISTRO  | https://release-monitoring.org/project/000459 | 24.11.1      | 25.03        |     
                        dracut |  DISTRO  | https://release-monitoring.org/project/010627 | 059          | 108          |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/000462 | 9.21.4       | 9.32.0       |     
                     dropwatch |  DISTRO  | https://release-monitoring.org/project/021344 | 1.5.4        | 1.5.5        |     
                            dt |  DISTRO  | https://release-monitoring.org/project/021844 | 18.32        | 21.27        | ORPH
                       dtbocfg |  DISTRO  | https://release-monitoring.org/project/235269 | 0.1.0        | 0.1.1        |     
                      dump1090 |  DISTRO  | https://release-monitoring.org/project/231403 | 9.0          | 10.2         |     
                     e2fsprogs |  DISTRO  | https://release-monitoring.org/project/000646 | 1.47.2       | 1.47.3       | ORPH
                      earlyoom |  DISTRO  | https://release-monitoring.org/project/017392 | 1.7          | 1.8.2        |     
                      easy-rsa |  DISTRO  | https://release-monitoring.org/project/017770 | 3.1.7        | 3.2.4        |     
                            ed |  DISTRO  | https://release-monitoring.org/project/000659 | 1.20.2       | 1.22.2       | ORPH
                           efl |  DISTRO  | https://release-monitoring.org/project/006128 | 1.26.3       | 1.28.1       |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/000667 | 24.07        | 25.08        |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/005679 | 0.192        | 0.193        | ORPH
                       enchant |  DISTRO  | https://release-monitoring.org/project/006601 | 2.3.3        | 2.8.12       |     
                          enet |  DISTRO  | https://release-monitoring.org/project/000696 | 1.3.17       | 1.3.18       |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/000698 | 0.25.4       | 0.27.1       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/000707 | 26.0.2       | 28.0.2       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/017060 | 1.0.23       | 1.0.26       |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/045375 | 1.0.23       | 1.0.28       |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/008757 | 1.0.31       | 1.0.33       |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/020220 | 1.0.17       | 1.0.19       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/009302 | 0.6.14       | 0.9.2        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/010576 | 1.0.54       | 1.0.59       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/009222 | 1.0.30       | 1.0.33       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/010455 | 1.1.21       | 1.1.25       |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/008643 | 1.0.26       | 1.0.28       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/045378 | 1.0.16       | 1.0.21       |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/009283 | 1.0.13       | 1.0.15       |     
                   erofs-utils |  DISTRO  | https://release-monitoring.org/project/063188 | 1.8.5        | 1.8.10       |     
                        evtest |  DISTRO  | https://release-monitoring.org/project/021347 | 1.35         | 1.36         | ORPH
                      execline |  DISTRO  | https://release-monitoring.org/project/005482 | 2.9.6.1      | 2.9.7.0      |     
                        exempi |  DISTRO  | https://release-monitoring.org/project/000767 | 2.6.3        | 2.6.6        |     
                    exfatprogs |  DISTRO  | https://release-monitoring.org/project/094441 | 1.2.5        | 1.2.9        |     
                         exiv2 |  DISTRO  | https://release-monitoring.org/project/000769 | 0.27.6       | 0.28.7       |     
                           eza |  DISTRO  | https://release-monitoring.org/project/369474 | 0.20.19      | 0.23.1       |     
                         faad2 |  DISTRO  | https://release-monitoring.org/project/013755 | 2.11.1       | 2.11.2       |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/012048 | 1.37.1.1     | 1.37.1.2     | ORPH
                      faketime |  DISTRO  | https://release-monitoring.org/project/021348 | 0.9.10       | 0.9.12       | ORPH
                         fastd |  DISTRO  | https://release-monitoring.org/project/017116 | 22           | 23           |     
                          fcft |  DISTRO  | https://release-monitoring.org/project/143240 | 3.1.8        | 3.3.2        |     
                            fd |  DISTRO  | https://release-monitoring.org/project/373722 | 10.2.0       | 10.3.0       |     
                           feh |  DISTRO  | https://release-monitoring.org/project/000790 | 3.10.3       | 3.11.1       |     
                           fio |  DISTRO  | https://release-monitoring.org/project/000806 | 3.38         | 3.41         |     
                     firewalld |  DISTRO  | https://release-monitoring.org/project/009989 | 2.0.2        | 2.3.1        | ORPH
                       flannel |  DISTRO  | https://release-monitoring.org/project/007421 | 0.26.0       | 0.27.3       |     
                      flashrom |  DISTRO  | https://release-monitoring.org/project/010202 | 1.5.1        | 1.6.0        |     
                          flot |  DISTRO  | https://release-monitoring.org/project/007184 | 0.8.3        | 4.2.6        | ORPH
                          fltk |  DISTRO  | https://release-monitoring.org/project/000823 | 1.3.7        | 1.4.4        | ORPH
                    fluent-bit |  DISTRO  | https://release-monitoring.org/project/267335 | 4.0.3        | 4.0.9        |     
                    fluidsynth |  DISTRO  | https://release-monitoring.org/project/010437 | 2.4.7        | 2.4.8        |     
                       fmtools |  DISTRO  | https://release-monitoring.org/project/021435 | 2.0.7        | 2.0.8        | ORPH
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/000826 | 4.7.0        | 7.0.1        | ORPH
                          foot |  DISTRO  | https://release-monitoring.org/project/141611 | 1.16.2       | 1.23.1       |     
                         fping |  DISTRO  | https://release-monitoring.org/project/000834 | 5.2          | 5.4          |     
                      freeipmi |  DISTRO  | https://release-monitoring.org/project/000848 | 1.6.14       | 1.6.15       |     
             freeradius-server |  DISTRO  | https://release-monitoring.org/project/000853 | 3.2.6        | 3.2.8        |     
                      freetype |  DISTRO  | https://release-monitoring.org/project/000854 | 2.13.3       | 2.14.0       |     
                    fscryptctl |  DISTRO  | https://release-monitoring.org/project/270981 | 1.0.0        | 1.2.0        |     
                fuse-overlayfs |  DISTRO  | https://release-monitoring.org/project/101220 | 1.13         | 1.15         |     
                          fwup |  DISTRO  | https://release-monitoring.org/project/021438 | 1.9.1        | 1.13.2       |     
                         fwupd |  DISTRO  | https://release-monitoring.org/project/005833 | 2.0.4        | 2.0.14       |     
                          gawk |  DISTRO  | https://release-monitoring.org/project/000868 | 5.3.1        | 5.3.2        | ORPH
                gcc-bare-metal |  DISTRO  | https://release-monitoring.org/project/006502 | 15.1.0       | 15.2.0       |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/011801 | 3.40.0       | 4.4.0.1      | ORPH
                          gdal |  DISTRO  | https://release-monitoring.org/project/000881 | 3.8.2        | 3.11.3       |     
                        gensio |  DISTRO  | https://release-monitoring.org/project/067634 | 2.5.5        | 2.8.15       |     
                       gerbera |  DISTRO  | https://release-monitoring.org/project/018420 | 2.4.1        | 2.6.1        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/000898 | 0.22.4       | 0.26         | ORPH
                 gitlab-runner |  DISTRO  | https://release-monitoring.org/project/011337 | 15.5.0       | 18.3.1       |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/021353 | 2.76.0       | 2.80.1       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/007960 | 2.76.0       | 2.84.0       |     
                          glog |  DISTRO  | https://release-monitoring.org/project/008732 | 0.7.0        | 0.7.1        |     
                       gnu-efi |  DISTRO  | https://release-monitoring.org/project/001202 | 4.0.0        | 4.0.2        |     
                      gnuchess |  DISTRO  | https://release-monitoring.org/project/001206 | 6.2.9        | 6.3.0        | ORPH
                        gnupg2 |  DISTRO  | https://release-monitoring.org/project/001215 | 2.4.7        | 2.4.8        |     
                     gocryptfs |  DISTRO  | https://release-monitoring.org/project/021085 | 2.3.2        | 2.6.1        |     
                       granite |  DISTRO  | https://release-monitoring.org/project/005410 | 6.2.0        | 7.6.0        | ORPH
                          grpc |  DISTRO  | https://release-monitoring.org/project/019117 | 1.66.1       | 1.74.1       |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/013139 | 45.0         | 48.0         |     
                           gsl |  DISTRO  | https://release-monitoring.org/project/001267 | 2.7.1        | 2.8          | ORPH
                         gssdp |  DISTRO  | https://release-monitoring.org/project/001262 | 1.6.3        | 1.6.4        |     
                 gst1-devtools |  DISTRO  | https://release-monitoring.org/project/021856 | 1.24.11      | 1.27.2       | ORPH
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/021846 | 0.13.1       | 2.2.0        |     
                gst1-interpipe |  DISTRO  | https://release-monitoring.org/project/021847 | v1.1.8       | 1.1.9        | ORPH
                    gst1-libav |  DISTRO  | https://release-monitoring.org/project/021848 | 1.24.11      | 1.26.5       | ORPH
              gst1-plugins-bad |  DISTRO  | https://release-monitoring.org/project/021849 | 1.24.11      | 1.26.5       | ORPH
             gst1-plugins-base |  DISTRO  | https://release-monitoring.org/project/021850 | 1.24.11      | 1.26.5       | ORPH
             gst1-plugins-good |  DISTRO  | https://release-monitoring.org/project/021852 | 1.24.11      | 1.26.5       | ORPH
             gst1-plugins-ugly |  DISTRO  | https://release-monitoring.org/project/015187 | 1.24.11      | 1.27.2       | ORPH
                   gst1-python |  DISTRO  | https://release-monitoring.org/project/003881 | 1.24.11      | 1.26.5       | ORPH
              gst1-rtsp-server |  DISTRO  | https://release-monitoring.org/project/021853 | 1.24.11      | 1.26.5       | ORPH
                    gst1-shark |  DISTRO  | https://release-monitoring.org/project/021854 | v0.8.1       | 0.8.2        |     
                    gst1-vaapi |  DISTRO  | https://release-monitoring.org/project/021855 | 1.24.11      | 1.26.5       | ORPH
                          gstd |  DISTRO  | https://release-monitoring.org/project/235022 | 0.15.0       | 0.15.2       | ORPH
                    gstreamer1 |  DISTRO  | https://release-monitoring.org/project/001263 | 1.24.11      | 1.26.5       | ORPH
   gstreamer1-editing-services |  DISTRO  | https://release-monitoring.org/project/230920 | 1.24.11      | 1.26.5       | ORPH
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/007724 | 3.24.7       | 5.16.0       |     
                         guile |  DISTRO  | https://release-monitoring.org/project/001277 | 3.0.9        | 3.0.10       |     
                  gumbo-parser |  DISTRO  | https://release-monitoring.org/project/214990 | 0.13.1       | 0.13.2       |     
                         gupnp |  DISTRO  | https://release-monitoring.org/project/001281 | 1.6.6        | 1.6.9        |     
                      gupnp-av |  DISTRO  | https://release-monitoring.org/project/001282 | 0.14.1       | 0.14.4       |     
                   gupnp-tools |  DISTRO  | https://release-monitoring.org/project/001284 | 0.12.1       | 0.12.2       |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/001285 | 5.2.14       | 5.3.5        | ORPH
                        hackrf |  DISTRO  | https://release-monitoring.org/project/006136 | 2023.01.1    | 2024.02.1    | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/001298 | 2.6.22       | 3.2.4        |     
                heirloom-mailx |  DISTRO  | https://release-monitoring.org/project/095708 | 12.5         | 14.9.25      |     
                       highway |  DISTRO  | https://release-monitoring.org/project/205809 | 1.2.0        | 1.3.0        |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/001327 | 3.17.10      | 3.25.6       | ORPH
                       htpdate |  DISTRO  | https://release-monitoring.org/project/132187 | 2.0.0        | 2.0.1        |     
                        hwdata |  DISTRO  | https://release-monitoring.org/project/005387 | 0.397        | 0.399        | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/013501 | 2.11.2       | 2.12.2       |     
                          i2pd |  DISTRO  | https://release-monitoring.org/project/021355 | 2.50.2       | 2.57.0       |     
                           icu |  DISTRO  | https://release-monitoring.org/project/016134 | 73-2         | 77-1         | ORPH
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/021670 | 2.9          | 2.14         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/021673 | 0.8.41       | 0.8.44       | ORPH
                  igh-ethercat |  DISTRO  | https://release-monitoring.org/project/021674 | 1.6.3        | 1.6.7        |     
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/001372 | 7.1.1-43     | 7.1.2-3      | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/021676 | 1.7.3        | 1.12.5       |     
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/008864 | 3.20.2.2     | 4.23.9.0     | ORPH
               intel-microcode |  DISTRO  | https://release-monitoring.org/project/020614 | 20250512     | 20250812     |     
                        iozone |  DISTRO  | https://release-monitoring.org/project/021679 | 3.506        | 3.508        |     
                        iperf3 |  DISTRO  | https://release-monitoring.org/project/001389 | 3.19         | 3.19.1       | ORPH
                      ipmiutil |  DISTRO  | https://release-monitoring.org/project/001391 | 3.1.9        | 3.2.1        | ORPH
                         ipset |  DISTRO  | https://release-monitoring.org/project/001393 | 7.23         | 7.24         |     
                     iptraf-ng |  DISTRO  | https://release-monitoring.org/project/007034 | 1.2.1        | 1.2.2        |     
                    irqbalance |  DISTRO  | https://release-monitoring.org/project/001402 | 1.9.3        | 1.9.4        |     
                           isl |  DISTRO  | https://release-monitoring.org/project/013286 | 0.26         | 0.27         | ORPH
                            iw |  DISTRO  | https://release-monitoring.org/project/001410 | 6.9          | 6.17         | ORPH
                         janet |  DISTRO  | https://release-monitoring.org/project/155612 | 1.35.2       | 1.39.1       |     
                       jansson |  DISTRO  | https://release-monitoring.org/project/001417 | 2.14         | 2.14.1       |     
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/015715 | 1.1.2        | 1.3.2        |     
                        jasper |  DISTRO  | https://release-monitoring.org/project/001421 | 2.0.33       | 4.2.8        |     
                        jimtcl |  DISTRO  | https://release-monitoring.org/project/001459 | 0.81         | 0.83         |     
         jitterentropy-library |  DISTRO  | https://release-monitoring.org/project/029701 | 3.6.1        | 3.6.3        | ORPH
                    jpeg-turbo |  DISTRO  | https://release-monitoring.org/project/001648 | 3.1.0        | 3.1.2        |     
                            jq |  DISTRO  | https://release-monitoring.org/project/013252 | 1.8.0        | 1.8.1        |     
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/013910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/021681 | 1.18.12      | 1.30.4       | ORPH
                 jquery-mobile |  DISTRO  | https://release-monitoring.org/project/059395 | 1.4.3        | 1.4.5        | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/021815 | 1.13.1       | 1.14.1       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/021816 | 1.10.4       | 1.14.1       |     
             jquery-validation |  DISTRO  | https://release-monitoring.org/project/021817 | 1.19.5       | 1.21.0       | ORPH
                           kbd |  DISTRO  | https://release-monitoring.org/project/001492 | 2.6.4        | 2.9.0        | ORPH
                    keepalived |  DISTRO  | https://release-monitoring.org/project/001504 | 2.2.8        | 2.3.4        |     
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/008762 | 5.91.0       | 6.17.0       |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/008762 | 5.91.0       | 6.17.0       |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/008762 | 5.91.0       | 6.17.0       |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/008762 | 5.91.0       | 6.17.0       |     
                          kmod |  DISTRO  | https://release-monitoring.org/project/001517 | 33           | 34.2         |     
                  kompexsqlite |  DISTRO  | https://release-monitoring.org/project/021462 | 1.12.15      | 1.13.15      | ORPH
                   ksmbd-tools |  DISTRO  | https://release-monitoring.org/project/241856 | 3.5.2        | 3.5.3        |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/012418 | 2.2.0        | 2.3.1        |     
                          kyua |  DISTRO  | https://release-monitoring.org/project/016901 | 0.13         | 0.14.1       | ORPH
                        ledmon |  DISTRO  | https://release-monitoring.org/project/012346 | 1.0.0        | 1.1.0        |     
                          less |  DISTRO  | https://release-monitoring.org/project/001550 | 661          | 679          | ORPH
                          lftp |  DISTRO  | https://release-monitoring.org/project/001555 | 4.9.2        | 4.9.3        |     
                 libabseil-cpp |  DISTRO  | https://release-monitoring.org/project/115295 | 20250127.0   | 20250814.0   |     
                         libao |  DISTRO  | https://release-monitoring.org/project/007629 | 1.2.0        | 1.2.2        | ORPH
                     libassuan |  DISTRO  | https://release-monitoring.org/project/001559 | 2.5.7        | 3.0.2        | ORPH
                 libatomic_ops |  DISTRO  | https://release-monitoring.org/project/001561 | 7.8.2        | 7.8.4        | ORPH
                     libbluray |  DISTRO  | https://release-monitoring.org/project/001565 | 1.3.4        | 1.4.0        |     
                        libbpf |  DISTRO  | https://release-monitoring.org/project/141355 | 1.5.0        | 1.6.2        |     
                        libbsd |  DISTRO  | https://release-monitoring.org/project/001567 | 0.11.7       | 0.12.2       | ORPH
                   libbytesize |  DISTRO  | https://release-monitoring.org/project/007869 | 2.10         | 2.11         | ORPH
                     libcamera |  DISTRO  | https://release-monitoring.org/project/301902 | v0.5.1       | 0.5.2        |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/001575 | 2.0.3        | 3.2.0        |     
                        libclc |  GUESS   | https://release-monitoring.org/project/376264 | 20.1.8       | 21.1.0       |     
                 libcpprestsdk |  DISTRO  | https://release-monitoring.org/project/015531 | 2.10.18      | 2.10.19      | ORPH
                      libdecor |  DISTRO  | https://release-monitoring.org/project/312806 | 0.1.1        | 0.2.3        |     
                        libdex |  DISTRO  | https://release-monitoring.org/project/328356 | 0.10.1       | 1.0.0        |     
               libdisplay-info |  DISTRO  | https://release-monitoring.org/project/326668 | 0.2.0        | 0.3.0        |     
                      libevdev |  DISTRO  | https://release-monitoring.org/project/020540 | 1.13.1       | 1.13.4       |     
                       libexif |  DISTRO  | https://release-monitoring.org/project/001607 | 0.6.24       | 0.6.25       | ORPH
                   libfastjson |  DISTRO  | https://release-monitoring.org/project/012043 | 0.99.9.1     | 1.2304.0     |     
                        libffi |  DISTRO  | https://release-monitoring.org/project/001611 | 3.4.8        | 3.5.2        |     
                         libfm |  DISTRO  | https://release-monitoring.org/project/008794 | 1.3.2        | 1.4.0        | ORPH
                   libfm-extra |  DISTRO  | https://release-monitoring.org/project/008794 | 1.3.2        | 1.4.0        | ORPH
                   libfreeglut |  DISTRO  | https://release-monitoring.org/project/000846 | 3.4.0        | 3.6.0        |     
                     libgcrypt |  DISTRO  | https://release-monitoring.org/project/001623 | 1.11.1       | 1.11.2       | ORPH
                        libgee |  DISTRO  | https://release-monitoring.org/project/001625 | 0.20.6       | 0.20.8       |     
                       libgeos |  DISTRO  | https://release-monitoring.org/project/013493 | 3.13.1       | 3.14.0       |     
                    libgeotiff |  DISTRO  | https://release-monitoring.org/project/021361 | 1.7.3        | 1.7.4        |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/001174 | 2.6.4        | 3.40.0       | ORPH
                       libglfw |  DISTRO  | https://release-monitoring.org/project/001180 | 3.4          | 3.5.0        | ORPH
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/010024 | 2.84.3       | 2.86.0       |     
                      libglvnd |  DISTRO  | https://release-monitoring.org/project/012098 | 1.4.0        | 1.7.0        | ORPH
                  libgpg-error |  DISTRO  | https://release-monitoring.org/project/001628 | 1.51         | 1.55         | ORPH
                      libgpgme |  DISTRO  | https://release-monitoring.org/project/001239 | 1.23.2       | 2.0.0        | ORPH
                    libgphoto2 |  DISTRO  | https://release-monitoring.org/project/012558 | 2.5.27       | 2.5.32       | ORPH
                      libgpiod |  GUESS   | https://release-monitoring.org/project/020640 | 1.6.5        | 2.2.2        | ORPH
                      libgsasl |  DISTRO  | https://release-monitoring.org/project/001563 | 2.2.1        | 2.2.2        | ORPH
                        libgsm |  DISTRO  | https://release-monitoring.org/project/012587 | 1.0.22       | 1.0.23       | ORPH
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/311549 | 3.24.43      | 3.24.50      |     
                       libgtk4 |  DISTRO  | https://release-monitoring.org/project/013942 | 4.14.5       | 4.20.0       |     
                       libheif |  DISTRO  | https://release-monitoring.org/project/064439 | 1.20.1       | 1.20.2       |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/010656 | 1.15         | 1.18         | ORPH
                     libid3tag |  DISTRO  | https://release-monitoring.org/project/021478 | 0.15.1b      | 0.16.3       | ORPH
                        libidn |  DISTRO  | https://release-monitoring.org/project/001639 | 1.42         | 1.43         |     
                       libidn2 |  DISTRO  | https://release-monitoring.org/project/005597 | 2.3.7        | 2.3.8        |     
                   libiec61850 |  DISTRO  | https://release-monitoring.org/project/141617 | 1.6.0        | 1.6.1        |     
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/021479 | 0.10.3       | 2.3.0        |     
                      libinput |  DISTRO  | https://release-monitoring.org/project/005781 | 1.29.0       | 1.29.1       | ORPH
                      libiscsi |  DISTRO  | https://release-monitoring.org/project/010862 | 1.20.0       | 1.20.3       | ORPH
                        libjwt |  DISTRO  | https://release-monitoring.org/project/242868 | 3.2.0        | 3.2.2        |     
                         libks |  DISTRO  | https://release-monitoring.org/project/241898 | 2.0.5        | 2.0.7        | ORPH
                     liblinear |  DISTRO  | https://release-monitoring.org/project/021363 | 2.48         | 249          |     
                  libmaxminddb |  DISTRO  | https://release-monitoring.org/project/007470 | 1.10.0       | 1.12.2       |     
                       libmdbx |  DISTRO  | https://release-monitoring.org/project/141559 | 0.13.6       | 0.13.8       |     
                   libmediaart |  DISTRO  | https://release-monitoring.org/project/013148 | 1.9.6        | 1.9.7        |     
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/001986 | 2.2.7        | 2.3.3        |     
                     libmspack |  DISTRO  | https://release-monitoring.org/project/016827 | 0.11alpha    | 1.11         |     
                   libnetconf2 |  DISTRO  | https://release-monitoring.org/project/031639 | 3.7.1        | 3.7.10       |     
        libnetfilter_conntrack |  DISTRO  | https://release-monitoring.org/project/001675 | 1.0.9        | 1.1.0        |     
                        libnfs |  DISTRO  | https://release-monitoring.org/project/007325 | 5.0.3        | 6.0.2        | ORPH
                       libnice |  DISTRO  | https://release-monitoring.org/project/001683 | 0.1.21       | 0.1.22       |     
                     libnpupnp |  DISTRO  | https://release-monitoring.org/project/075209 | 4.2.2        | 6.2.1        |     
                        libodb |  DISTRO  | https://release-monitoring.org/project/001687 | 2.4.0        | 2.5.0        | ORPH
                  libodb-boost |  DISTRO  | https://release-monitoring.org/project/001688 | 2.4.0        | 2.5.0        |     
                  libodb-mysql |  DISTRO  | https://release-monitoring.org/project/001689 | 2.4.0        | 2.5.0        |     
                  libodb-pgsql |  DISTRO  | https://release-monitoring.org/project/001690 | 2.4.0        | 2.5.0        | ORPH
                   libopenh264 |  DISTRO  | https://release-monitoring.org/project/021365 | 2.5.1        | 2.6.0        |     
                    libopenmpt |  DISTRO  | https://release-monitoring.org/project/141468 | 0.7.13       | 0.8.3        |     
                     libostree |  DISTRO  | https://release-monitoring.org/project/010899 | 2023.8       | 2025.6       |     
                        libp11 |  DISTRO  | https://release-monitoring.org/project/001699 | 0.4.12       | 0.4.16       | ORPH
                       libpeas |  DISTRO  | https://release-monitoring.org/project/006871 | 1.32.0       | 2.1.0        | ORPH
                      libplist |  DISTRO  | https://release-monitoring.org/project/011675 | 2.4.0        | 2.7.0        | ORPH
                        libpri |  DISTRO  | https://release-monitoring.org/project/011042 | 1.6.0        | 1.6.1        | ORPH
                      libressl |  DISTRO  | https://release-monitoring.org/project/012102 | 3.9.2        | 4.1.0        | ORPH
                       librsvg |  DISTRO  | https://release-monitoring.org/project/005420 | 2.50.9       | 2.61.0       |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/010717 | 2.0.5        | 2.0.6        | ORPH
                    libseccomp |  DISTRO  | https://release-monitoring.org/project/013823 | 2.5.5        | 2.6.0        | ORPH
                     libsecret |  DISTRO  | https://release-monitoring.org/project/013150 | 0.20.5       | 0.21.7       | ORPH
                    libselinux |  DISTRO  | https://release-monitoring.org/project/001717 | 3.8.1        | 3.9          |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/001718 | 3.8.1        | 20200710     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/001719 | 3.8.1        | 20200710     |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/007961 | 3.4.0        | 3.6.0        |     
                    libsigsegv |  DISTRO  | https://release-monitoring.org/project/001722 | 2.14         | 2.15         |     
                     libsodium |  DISTRO  | https://release-monitoring.org/project/001728 | 1.0.18       | 1.0.20       |     
                       libsolv |  DISTRO  | https://release-monitoring.org/project/007908 | 0.7.30       | 0.7.35       |     
                 libsoundtouch |  DISTRO  | https://release-monitoring.org/project/115722 | 2.3.3        | 2.4.0        |     
               libspatialindex |  DISTRO  | https://release-monitoring.org/project/004864 | 1.9.3        | 2.1.0        |     
                       libspdm |  DISTRO  | https://release-monitoring.org/project/369161 | 3.8.0        | 3.8.1        |     
                    libstrophe |  DISTRO  | https://release-monitoring.org/project/015633 | 0.13.1       | 0.14.0       |     
                     libtalloc |  DISTRO  | https://release-monitoring.org/project/001733 | 2.4.2        | 2.4.3        |     
                     libtheora |  DISTRO  | https://release-monitoring.org/project/011793 | 1.1.1        | 1.2.0        | ORPH
                      libtirpc |  DISTRO  | https://release-monitoring.org/project/001740 | 1.3.6        | 1.3.7        |     
                       libtool |  DISTRO  | https://release-monitoring.org/project/001741 | 2.4.6        | 2.5.4        | ORPH
                    libtorrent |  DISTRO  | https://release-monitoring.org/project/001742 | 0.13.8       | 0.16.0       | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/004166 | 1.2.19       | 2.0.11       |     
                       libtpms |  GUESS   | https://release-monitoring.org/project/116460 | 0.9.6        | 0.10.1       |     
                        libucl |  DISTRO  | https://release-monitoring.org/project/021371 | 0.8.2        | 0.9.2        |     
                   libucontext |  DISTRO  | https://release-monitoring.org/project/017085 | 1.2          | 1.3.2        |     
                    libudfread |  DISTRO  | https://release-monitoring.org/project/089591 | 1.1.2        | 1.2.0        |     
                   libunibreak |  DISTRO  | https://release-monitoring.org/project/326564 | 5.1          | 6.1          |     
                     libunwind |  DISTRO  | https://release-monitoring.org/project/001748 | 1.8.1        | 1.8.3        | ORPH
                       libupnp |  DISTRO  | https://release-monitoring.org/project/021315 | 1.14.19      | 1.14.24      |     
                      libupnpp |  DISTRO  | https://release-monitoring.org/project/015849 | 0.21.0       | 1.0.3        | ORPH
                       liburcu |  DISTRO  | https://release-monitoring.org/project/007134 | 0.14.0       | 0.15.3       |     
                      liburing |  DISTRO  | https://release-monitoring.org/project/230185 | 2.6          | 2.12         |     
                  liburiparser |  DISTRO  | https://release-monitoring.org/project/010160 | 0.9.8        | 0.9.9        |     
                        libv4l |  DISTRO  | https://release-monitoring.org/project/009998 | 1.28.1       | 1.30.1       |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/005097 | 8.10.6       | 8.17.1       |     
                       libvirt |  DISTRO  | https://release-monitoring.org/project/013830 | 7.10.0       | 11.7.0       |     
                  libvncserver |  DISTRO  | https://release-monitoring.org/project/001756 | 0.9.14       | 0.9.15       | ORPH
                        libvpl |  DISTRO  | https://release-monitoring.org/project/242664 | 2.15.0       | 2023.4.0     |     
                        libvpx |  DISTRO  | https://release-monitoring.org/project/011083 | 1.15.0       | 1.15.2       |     
                        libxcb |  DISTRO  | https://release-monitoring.org/project/001767 | 1.15         | 1.17.0       | ORPH
                  libxkbcommon |  DISTRO  | https://release-monitoring.org/project/001780 | 1.7.0        | 1.11.0       |     
                       libxml2 |  DISTRO  | https://release-monitoring.org/project/001783 | 2.13.8       | 2.14.5       |     
                       libxmlb |  GUESS   | https://release-monitoring.org/project/179028 | 0.3.19       | 0.3.23       |     
                      libxmlpp |  DISTRO  | https://release-monitoring.org/project/011129 | 5.2.0        | 5.4.0        | ORPH
                       libxslt |  DISTRO  | https://release-monitoring.org/project/013301 | 1.1.42       | 1.1.43       |     
                       libyang |  DISTRO  | https://release-monitoring.org/project/018554 | 3.12.2       | 3.13.5       |     
                    libzenoh-c |  DISTRO  | https://release-monitoring.org/project/372354 | 1.2.1        | 1.5.1        |     
                 libzenoh-pico |  DISTRO  | https://release-monitoring.org/project/369957 | 1.2.1        | 1.5.1        |     
                        libzip |  DISTRO  | https://release-monitoring.org/project/010649 | 1.10.1       | 1.11.4       | ORPH
                      lighttpd |  DISTRO  | https://release-monitoring.org/project/001817 | 1.4.79       | 1.4.81       | ORPH
                          lilv |  DISTRO  | https://release-monitoring.org/project/001818 | 0.24.12      | 0.24.26      |     
                        linknx |  DISTRO  | https://release-monitoring.org/project/021373 | 0.0.1.38     | 0.0.1.39     | ORPH
                     linux-pam |  DISTRO  | https://release-monitoring.org/project/012244 | 1.6.1        | 1.7.1        | ORPH
                    liquid-dsp |  DISTRO  | https://release-monitoring.org/project/014535 | 1.6.0        | 1.7.0        |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/012414 | 2021.05.03   | 2025.07.19   | ORPH
                  lksctp-tools |  DISTRO  | https://release-monitoring.org/project/021497 | 1.0.19       | 1.0.21       | ORPH
                           lld |  DISTRO  | https://release-monitoring.org/project/001830 | 20.1.8       | 21.1.0       |     
                         lldpd |  DISTRO  | https://release-monitoring.org/project/014019 | 1.0.18       | 1.0.19       | ORPH
                          llvm |  DISTRO  | https://release-monitoring.org/project/001830 | 20.1.8       | 21.1.0       |     
                lockfile-progs |  DISTRO  | https://release-monitoring.org/project/010135 | 0.1.19       | 0.2.0        | ORPH
                     log4cplus |  DISTRO  | https://release-monitoring.org/project/001835 | 2.1.0        | 2.1.2        | ORPH
                       log4cxx |  DISTRO  | https://release-monitoring.org/project/015330 | 1.3.1        | 1.5.0        |     
                          lpac |  DISTRO  | https://release-monitoring.org/project/371628 | 2.2.1        | 2.3.0        |     
                          lpty |  DISTRO  | https://release-monitoring.org/project/011671 | 1.0.1-1      | 1.2.2        |     
                          lsof |  DISTRO  | https://release-monitoring.org/project/001844 | 4.99.4       | 4.99.5       | ORPH
                      lsqlite3 |  DISTRO  | https://release-monitoring.org/project/011649 | 0.9.5-1      | 0.9.6        |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/000155 | 1.5.7        | 1.5.11       |     
                  lttng-libust |  DISTRO  | https://release-monitoring.org/project/007135 | 2.13.1       | 2.14.0       |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/007141 | 2.13.10      | 2.14.0       |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/007136 | 2.13.8       | 2.14.0       |     
                           lua |  DISTRO  | https://release-monitoring.org/project/001847 | 5.1.5        | 5.4.8        |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/013887 | 0.15-0       | 0.17.2       |     
                         lutok |  DISTRO  | https://release-monitoring.org/project/021509 | 0.4          | 0.6.1        | ORPH
                           luv |  DISTRO  | https://release-monitoring.org/project/021510 | 1.43.0-0     | 1.51.0-1     | ORPH
                          luvi |  DISTRO  | https://release-monitoring.org/project/021512 | 2.14.0       | 2.15.0       | ORPH
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/005354 | 2.03.31      | 2.03.34      | ORPH
                           lxc |  DISTRO  | https://release-monitoring.org/project/001860 | 5.0.3        | 6.0.5        |     
                    lzma-alone |  DISTRO  | https://release-monitoring.org/project/145824 | 9.22         | 25.01        | ORPH
                  makedumpfile |  DISTRO  | https://release-monitoring.org/project/131396 | 1.7.5        | 1.7.7        |     
                       mariadb |  DISTRO  | https://release-monitoring.org/project/001887 | 10.11.11     | 12.1.1       | ORPH
                  matchbox-lib |  DISTRO  | https://release-monitoring.org/project/021187 | 1.12         | 1.14         | ORPH
                         matio |  DISTRO  | https://release-monitoring.org/project/001893 | 1.5.26       | 1.5.28       |     
                       mbuffer |  DISTRO  | https://release-monitoring.org/project/015518 | 20220418     | 20250809     |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/008093 | 194          | 206          |     
                         mdadm |  DISTRO  | https://release-monitoring.org/project/001958 | 4.3          | 4.4          | ORPH
                         mdevd |  DISTRO  | https://release-monitoring.org/project/016553 | 0.1.6.5      | 0.1.7.0      |     
                 mediastreamer |  DISTRO  | https://release-monitoring.org/project/021746 | 4.4.8        | 5.4.42       | ORPH
                     memcached |  DISTRO  | https://release-monitoring.org/project/001965 | 1.6.29       | 1.6.39       | ORPH
                    menu-cache |  DISTRO  | https://release-monitoring.org/project/001968 | 1.1.0        | 1.1.1        | ORPH
                        mesa3d |  DISTRO  | https://release-monitoring.org/project/001970 | 25.1.7       | 25.2.2       |     
                mesa3d-headers |  DISTRO  | https://release-monitoring.org/project/001970 | 25.1.7       | 25.2.2       | ORPH
                         meson |  DISTRO  | https://release-monitoring.org/project/006472 | 1.8.3        | 1.9.0        |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/015392 | 2.25.1       | 3.57.1       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/021519 | 0.02         | 2.8.0        |     
microchip-hss-payload-gener... |  DISTRO  | https://release-monitoring.org/project/368767 | 2024.06      | 2025.07      |     
                   micropython |  DISTRO  | https://release-monitoring.org/project/010539 | 1.22.2       | 1.26.0       |     
                      minetest |  DISTRO  | https://release-monitoring.org/project/001978 | 5.6.1        | 5.13.0       |     
                 minetest-game |  DISTRO  | https://release-monitoring.org/project/021522 | 5.6.1        | 5.8.0        |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/301509 | 4.0.3        | 4.0.10       |     
                        moarvm |  DISTRO  | https://release-monitoring.org/project/021100 | 2024.12      | 2025.08      |     
mobile-broadband-provider-info |  DISTRO  | https://release-monitoring.org/project/010267 | 20221107     | 20240407     | ORPH
                 moby-buildkit |  DISTRO  | https://release-monitoring.org/project/020836 | 0.11.6       | 0.24.0       |     
                 modem-manager |  DISTRO  | https://release-monitoring.org/project/007306 | 1.24.0       | 1.24.2       |     
                  modsecurity2 |  DISTRO  | https://release-monitoring.org/project/068638 | 2.9.10       | 3.0.14       |     
                         monit |  DISTRO  | https://release-monitoring.org/project/005483 | 5.34.3       | 5.35.2       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/006360 | 6.12.0.182   | 6.14.1       |     
                     mpdecimal |  DISTRO  | https://release-monitoring.org/project/011578 | 4.0.0        | 4.0.1        |     
                          mpfr |  DISTRO  | https://release-monitoring.org/project/002019 | 4.1.1        | 4.2.2        | ORPH
                        mpg123 |  DISTRO  | https://release-monitoring.org/project/012413 | 1.32.8       | 1.33.2       |     
                           mpv |  DISTRO  | https://release-monitoring.org/project/005348 | 0.35.1       | 0.40.0       |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/012278 | 3.3.0        | 7.0.0        |     
                         msmtp |  DISTRO  | https://release-monitoring.org/project/002024 | 1.8.30       | 1.8.31       |     
                           mtd |  DISTRO  | https://release-monitoring.org/project/002026 | 2.2.1        | 2.3.0        |     
                        mtools |  DISTRO  | https://release-monitoring.org/project/002028 | 4.0.48       | 4.0.49       | ORPH
                           mtr |  DISTRO  | https://release-monitoring.org/project/002029 | 0.95         | 0.96         | ORPH
               multipath-tools |  DISTRO  | https://release-monitoring.org/project/000424 | 0.9.8        | 0.11.1       |     
                         mupdf |  DISTRO  | https://release-monitoring.org/project/002034 | 1.23.9       | 1.26.7       |     
                          mutt |  DISTRO  | https://release-monitoring.org/project/002035 | 2.2.13       | 2.2.14       |     
                          mxml |  DISTRO  | https://release-monitoring.org/project/013545 | 3.3.1        | 4.0.4        |     
                       mxt-app |  DISTRO  | https://release-monitoring.org/project/373381 | 1.38         | 1.45         |     
                       nanomsg |  DISTRO  | https://release-monitoring.org/project/014540 | 1.2          | 1.2.1        |     
                           nbd |  DISTRO  | https://release-monitoring.org/project/002052 | 3.25         | 3.26.1       | ORPH
                          ncdu |  DISTRO  | https://release-monitoring.org/project/006045 | 1.22         | 2.9.1        |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/002057 | 6.5-20250720 | 6.5-20250830 | ORPH
                        ndisc6 |  DISTRO  | https://release-monitoring.org/project/021531 | 1.0.7        | 1.0.8        | ORPH
                          neon |  DISTRO  | https://release-monitoring.org/project/007604 | 0.33.0       | 0.35.0       | ORPH
                       nerdctl |  DISTRO  | https://release-monitoring.org/project/242901 | 1.7.3        | 2.1.4        |     
                      netatalk |  DISTRO  | https://release-monitoring.org/project/002063 | 3.1.19       | 4.3.2        | ORPH
                      netavark |  DISTRO  | https://release-monitoring.org/project/242639 | v1.15.2      | 1.16.1       | ORPH
                       netdata |  DISTRO  | https://release-monitoring.org/project/011046 | 1.33.1       | 2.6.3        |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/021917 | 0.7.3        | 0.7.12       |     
                     netopeer2 |  DISTRO  | https://release-monitoring.org/project/114978 | 2.4.1        | 2.4.5        |     
                       netsurf |  DISTRO  | https://release-monitoring.org/project/005386 | 3.10         | 3.11         |     
               network-manager |  DISTRO  | https://release-monitoring.org/project/021197 | 1.52.1       | 1.54.0       | ORPH
       network-manager-openvpn |  DISTRO  | https://release-monitoring.org/project/069977 | 1.12.0       | 1.12.3       |     
                          newt |  DISTRO  | https://release-monitoring.org/project/015129 | 0.52.23      | 0.52.25      | ORPH
                      nftables |  DISTRO  | https://release-monitoring.org/project/002082 | 1.1.4        | 1.1.5        |     
               nftables-python |  DISTRO  | https://release-monitoring.org/project/002082 | 1.1.4        | 1.1.5        |     
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/008651 | 1.64.0       | 1.67.0       | ORPH
                         nginx |  DISTRO  | https://release-monitoring.org/project/005413 | 1.26.3       | 1.29.1       | ORPH
                        ngircd |  DISTRO  | https://release-monitoring.org/project/002083 | 26.1         | 27           | ORPH
                          nmap |  DISTRO  | https://release-monitoring.org/project/002096 | 7.97         | 7.98         | ORPH
                    nodejs-bin |  DISTRO  | https://release-monitoring.org/project/008251 | 22.15.1      | 24.7.0       |     
                    nodejs-src |  DISTRO  | https://release-monitoring.org/project/008251 | 22.15.1      | 24.7.0       |     
                          noip |  DISTRO  | https://release-monitoring.org/project/021539 | 2.1.9        | 3.0.0        | ORPH
                          norm |  DISTRO  | https://release-monitoring.org/project/021540 | 1.5.8        | 1.5.9        | ORPH
                       nushell |  DISTRO  | https://release-monitoring.org/project/031106 | 0.96.1       | 0.107.0      | ORPH
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/002511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/021843 | 390.151      | 390.157      | ORPH
               nvidia-modprobe |  DISTRO  | https://release-monitoring.org/project/141657 | 450.57       | 580.82.07    | ORPH
           nvidia-persistenced |  DISTRO  | https://release-monitoring.org/project/369496 | 560.35.03    | 580.82.07    |     
                          nvme |  DISTRO  | https://release-monitoring.org/project/009074 | 1.12         | 2.15         | ORPH
                  oath-toolkit |  DISTRO  | https://release-monitoring.org/project/002515 | 2.6.12       | 2.6.13       |     
                         oatpp |  DISTRO  | https://release-monitoring.org/project/370050 | 1.3.0        | 1.3.1        |     
                           odb |  DISTRO  | https://release-monitoring.org/project/002531 | 2.4.0        | 2.5.0        | ORPH
                         ofono |  DISTRO  | https://release-monitoring.org/project/016859 | 2.2          | 2.18         |     
                          ogre |  DISTRO  | https://release-monitoring.org/project/033334 | v1.12.12     | 14.4.1       |     
                       omniorb |  DISTRO  | https://release-monitoring.org/project/021545 | 4.3.1        | 4.3.3        | ORPH
                    open-iscsi |  DISTRO  | https://release-monitoring.org/project/010861 | 2.1.9        | 2.1.11       |     
                     open-isns |  DISTRO  | https://release-monitoring.org/project/009393 | 0.102        | 0.103        |     
                     open-lldp |  DISTRO  | https://release-monitoring.org/project/115714 | 1.1          | 1.1.1        |     
                     open62541 |  DISTRO  | https://release-monitoring.org/project/016896 | v1.3.15      | 1.4.13       | ORPH
                        openal |  DISTRO  | https://release-monitoring.org/project/008172 | 1.22.0       | 1.24.3       | ORPH
                  opencore-amr |  DISTRO  | https://release-monitoring.org/project/021548 | 0.1.5        | 0.1.6        | ORPH
                       opencv3 |  DISTRO  | https://release-monitoring.org/project/006615 | 3.4.20       | 4.12.0       | ORPH
                       opencv4 |  DISTRO  | https://release-monitoring.org/project/006615 | 4.11.0       | 4.12.0       |     
                openfpgaloader |  DISTRO  | https://release-monitoring.org/project/241709 | 0.11.0       | 0.13.1       |     
                      openipmi |  DISTRO  | https://release-monitoring.org/project/002549 | 2.0.36       | 2.0.37       | ORPH
                    openlayers |  DISTRO  | https://release-monitoring.org/project/006847 | 10.5.0       | 10.6.1       |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/002554 | 4.1.8        | 5.0.8        |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/011687 | 0.56         | 0.62.8       |     
                    openresolv |  DISTRO  | https://release-monitoring.org/project/021551 | 3.13.2       | 3.17.0       | ORPH
                        opensc |  DISTRO  | https://release-monitoring.org/project/002559 | 0.26.0       | 0.26.1       | ORPH
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/010998 | 11.3.5-18... | 13.0.0       |     
                          opkg |  DISTRO  | https://release-monitoring.org/project/059397 | 0.7.0        | 0.9.0        | ORPH
                          ortp |  DISTRO  | https://release-monitoring.org/project/021691 | 4.4.8        | 5.4.42       | ORPH
                     osm2pgsql |  DISTRO  | https://release-monitoring.org/project/002575 | 2.0.1        | 2.1.1        |     
                         p7zip |  DISTRO  | https://release-monitoring.org/project/002583 | 17.05        | 17.06        |     
                   paho-mqtt-c |  DISTRO  | https://release-monitoring.org/project/021375 | 1.3.14       | 1.3.15       |     
                 paho-mqtt-cpp |  DISTRO  | https://release-monitoring.org/project/021376 | 1.3.2        | 1.5.3        |     
                        pahole |  DISTRO  | https://release-monitoring.org/project/231624 | 1.28         | 1.30         |     
                         pango |  DISTRO  | https://release-monitoring.org/project/011783 | 1.54.0       | 1.56.4       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/007958 | 2.50.1       | 2.56.1       |     
                    parprouted |  DISTRO  | https://release-monitoring.org/project/010309 | 0.7          | 0.65         | ORPH
                         patch |  DISTRO  | https://release-monitoring.org/project/002597 | 2.7.6        | 2.8          | ORPH
                      patchelf |  DISTRO  | https://release-monitoring.org/project/002598 | 0.13         | 0.18.0       | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/002601 | 1.3.7        | 1.3.8        | ORPH
                         pcre2 |  DISTRO  | https://release-monitoring.org/project/005832 | 10.45        | 10.46        | ORPH
                     pcsc-lite |  DISTRO  | https://release-monitoring.org/project/002611 | 2.1.0        | 2.3.3        | ORPH
                          pdbg |  DISTRO  | https://release-monitoring.org/project/021378 | 3.5          | 3.6          |     
                          perl |  DISTRO  | https://release-monitoring.org/project/013599 | 5.40.2       | 5.42.0       |     
                perl-crypt-cbc |  DISTRO  | https://release-monitoring.org/project/011930 | 2.33         | 3.07         |     
        perl-crypt-openssl-aes |  DISTRO  | https://release-monitoring.org/project/002743 | 0.02         | 0.21         |     
        perl-crypt-openssl-rsa |  DISTRO  | https://release-monitoring.org/project/002748 | 0.33         | 0.35         |     
               perl-date-manip |  DISTRO  | https://release-monitoring.org/project/002785 | 6.95         | 6.98         |     
            perl-datetime-tiny |  DISTRO  | https://release-monitoring.org/project/002802 | 1.07         | 1.08         |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/002807 | 4.046        | 5.013        |     
                      perl-dbi |  DISTRO  | https://release-monitoring.org/project/002811 | 1.643        | 1.647        |     
               perl-devel-size |  DISTRO  | https://release-monitoring.org/project/002835 | 0.84         | 0.85         |     
                       perl-gd |  DISTRO  | https://release-monitoring.org/project/012660 | 2.77         | 2.83         |     
           perl-image-exiftool |  DISTRO  | https://release-monitoring.org/project/006175 | 12.50        | 13.35        |     
            perl-io-socket-ssl |  DISTRO  | https://release-monitoring.org/project/006569 | 2.080        | 2.095        |     
              perl-libwww-perl |  DISTRO  | https://release-monitoring.org/project/003024 | 6.77         | 6.79         |     
        perl-module-build-tiny |  DISTRO  | https://release-monitoring.org/project/011870 | 0.051        | 0.052        |     
           perl-module-runtime |  DISTRO  | https://release-monitoring.org/project/003111 | 0.016        | 0.018        |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/005966 | 9.38         | 9.41         |     
               perl-mozilla-ca |  DISTRO  | https://release-monitoring.org/project/003136 | 20240924     | 20250602     |     
                  perl-net-dns |  DISTRO  | https://release-monitoring.org/project/003147 | 1.50         | 1.53         |     
                 perl-net-http |  DISTRO  | https://release-monitoring.org/project/003152 | 6.23         | 6.24         |     
                 perl-net-ssh2 |  DISTRO  | https://release-monitoring.org/project/003163 | 0.72         | 0.74         |     
                perl-path-tiny |  DISTRO  | https://release-monitoring.org/project/011962 | 0.146        | 0.150        |     
                perl-sub-quote |  DISTRO  | https://release-monitoring.org/project/012678 | 2.006008     | 2.006009     |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/014338 | 0.52         | 0.61         |     
                perl-type-tiny |  DISTRO  | https://release-monitoring.org/project/014406 | 2.006000     | 2.008003     |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/003527 | 2.0134       | 2.0210       |     
                           php |  DISTRO  | https://release-monitoring.org/project/003627 | 8.3.24       | 8.4.12       |     
                      php-amqp |  DISTRO  | https://release-monitoring.org/project/015603 | 2.0.0        | 2.1.2        |     
                      php-apcu |  DISTRO  | https://release-monitoring.org/project/011010 | 5.1.22       | 5.1.27       |     
                     php-gnupg |  DISTRO  | https://release-monitoring.org/project/021743 | 1.5.1        | 1.5.4        | ORPH
                   php-imagick |  DISTRO  | https://release-monitoring.org/project/017401 | 3.7.0        | 3.8.0        | ORPH
                 php-memcached |  DISTRO  | https://release-monitoring.org/project/017400 | 3.2.0        | 3.3.0        | ORPH
                       php-pam |  DISTRO  | https://release-monitoring.org/project/241707 | 2.2.4        | 2.2.5        |     
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/021742 | 1.4          | 1.4.1        | ORPH
                    php-xdebug |  DISTRO  | https://release-monitoring.org/project/013302 | 3.3.1        | 3.4.5        |     
                      php-yaml |  DISTRO  | https://release-monitoring.org/project/012515 | 2.2.3        | 2.2.5        | ORPH
                        physfs |  DISTRO  | https://release-monitoring.org/project/003631 | 3.0.2        | 3.2.0        |     
                      pico-sdk |  DISTRO  | https://release-monitoring.org/project/373461 | 1.5.1        | 2.2.0        |     
                      picotool |  DISTRO  | https://release-monitoring.org/project/373463 | 1.1.2        | 2.2.0-a4     |     
                      pinentry |  DISTRO  | https://release-monitoring.org/project/003643 | 1.3.1        | 1.3.2        | ORPH
                      pipewire |  DISTRO  | https://release-monitoring.org/project/057357 | 1.2.8        | 1.4.7        |     
        pipewire-media-session |  DISTRO  | https://release-monitoring.org/project/236416 | 0.4.2        | 0.4.3        | ORPH
                        pixman |  DISTRO  | https://release-monitoring.org/project/003648 | 0.44.2       | 0.46.4       | ORPH
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/012753 | 2.3.0        | 2.5.1        | ORPH
                      pngquant |  DISTRO  | https://release-monitoring.org/project/003674 | 2.18.0       | 3.0.3        |     
                          poco |  DISTRO  | https://release-monitoring.org/project/005418 | 1.13.2       | 1.14.2       |     
                        podman |  DISTRO  | https://release-monitoring.org/project/093284 | v5.5.2       | 5.6.1        | ORPH
                          poke |  DISTRO  | https://release-monitoring.org/project/179926 | 3.0          | 4.3          | ORPH
                       poppler |  DISTRO  | https://release-monitoring.org/project/003686 | 22.12.0      | 25.09.1      |     
                       postgis |  DISTRO  | https://release-monitoring.org/project/003694 | 3.5.2        | 3.6.0        |     
                    postgresql |  DISTRO  | https://release-monitoring.org/project/005601 | 17.5         | 17.6         |     
                         pound |  DISTRO  | https://release-monitoring.org/project/005436 | 4.8          | 4.17         | ORPH
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/010715 | 1.3.11       | 1.3.13       | ORPH
                         procs |  DISTRO  | https://release-monitoring.org/project/076458 | 0.14.9       | 0.14.10      |     
                       proftpd |  DISTRO  | https://release-monitoring.org/project/007609 | 1.3.8b       | 1.3.9        | ORPH
                          proj |  DISTRO  | https://release-monitoring.org/project/021570 | 9.5.1        | 9.6.2        |     
                       prosody |  DISTRO  | https://release-monitoring.org/project/003709 | 0.11.14      | 13.0.2       |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/003715 | 29.3         | 32.0         |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/006499 | 4.16         | 4.17         | ORPH
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/021825 | 6.0.1        | 6.5.0        |     
                        psmisc |  DISTRO  | https://release-monitoring.org/project/003721 | 23.5         | 23.7         | ORPH
                          ptpd |  GUESS   | https://release-monitoring.org/project/003726 | 1.1.0        | 2.3.1        | ORPH
                       pugixml |  DISTRO  | https://release-monitoring.org/project/003728 | 1.14         | 1.15         |     
                         putty |  DISTRO  | https://release-monitoring.org/project/005749 | 0.81         | 0.83         |     
                            pv |  DISTRO  | https://release-monitoring.org/project/003736 | 1.9.0        | 1.9.34       | ORPH
                  python-aenum |  DISTRO  | https://release-monitoring.org/project/034074 | 3.1.15       | 3.1.16       |     
                python-aexpect |  DISTRO  | https://release-monitoring.org/project/012442 | 1.7.0        | 1.8.0        |     
                python-aiohttp |  DISTRO  | https://release-monitoring.org/project/006713 | 3.12.14      | 3.12.15      |     
                python-alembic |  DISTRO  | https://release-monitoring.org/project/003766 | 1.16.4       | 1.16.5       |     
                  python-anyio |  DISTRO  | https://release-monitoring.org/project/049275 | 4.9.0        | 4.10.0       |     
                python-apispec |  DISTRO  | https://release-monitoring.org/project/037849 | 6.8.1        | 6.8.3        |     
            python-argcomplete |  DISTRO  | https://release-monitoring.org/project/003773 | 3.5.3        | 3.6.2        |     
            python-argon2-cffi |  DISTRO  | https://release-monitoring.org/project/033377 | 23.1.0       | 25.1.0       |     
   python-argon2-cffi-bindings |  DISTRO  | https://release-monitoring.org/project/241938 | 21.2.0       | 25.1.0       |     
              python-async-lru |  DISTRO  | https://release-monitoring.org/project/056566 | 2.0.4        | 2.0.5        |     
             python-asyncclick |  DISTRO  | https://release-monitoring.org/project/025628 | 8.1.8        | 8.2.2.2      |     
               python-asyncssh |  DISTRO  | https://release-monitoring.org/project/017555 | 2.19.0       | 2.21.0       |     
                  python-attrs |  DISTRO  | https://release-monitoring.org/project/015099 | 25.1.0       | 25.3.0       |     
                python-automat |  DISTRO  | https://release-monitoring.org/project/015101 | 24.8.1       | 25.4.16      |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/011984 | 2.16.0       | 2.17.0       |     
                 python-bcrypt |  DISTRO  | https://release-monitoring.org/project/009047 | 4.2.1        | 4.3.0        |     
         python-beautifulsoup4 |  DISTRO  | https://release-monitoring.org/project/003779 | 4.12.3       | 4.13.5       |     
               python-bitarray |  DISTRO  | https://release-monitoring.org/project/011014 | 3.0.0        | 3.7.1        |     
              python-bitstring |  DISTRO  | https://release-monitoring.org/project/014665 | 4.3.0        | 4.3.1        |     
                  python-bleak |  DISTRO  | https://release-monitoring.org/project/026271 | 0.22.3       | 1.1.1        |     
               python-bluezero |  DISTRO  | https://release-monitoring.org/project/021929 | 0.9.0        | 0.9.1        |     
                  python-boto3 |  DISTRO  | https://release-monitoring.org/project/029737 | 1.37.34      | 1.40.25      |     
               python-botocore |  DISTRO  | https://release-monitoring.org/project/008748 | 1.37.33      | 1.40.25      |     
                 python-bottle |  DISTRO  | https://release-monitoring.org/project/011101 | 0.13.2       | 0.13.4       |     
                python-bsdiff4 |  DISTRO  | https://release-monitoring.org/project/044268 | 1.2.5        | 1.2.6        |     
             python-cachetools |  DISTRO  | https://release-monitoring.org/project/007022 | 5.5.1        | 6.2.0        |     
                 python-calver |  DISTRO  | https://release-monitoring.org/project/100823 | 2022.6.26    | 2025.4.17    |     
                python-canopen |  DISTRO  | https://release-monitoring.org/project/023230 | 2.3.0        | 2.4.1        |     
                  python-cbor2 |  DISTRO  | https://release-monitoring.org/project/064102 | 5.6.5        | 5.7.0        |     
               python-cchardet |  DISTRO  | https://release-monitoring.org/project/014813 | 2.1.7        | 2.2.0a2      |     
                python-certifi |  DISTRO  | https://release-monitoring.org/project/007995 | 2024.12.14   | 2025.8.3     |     
               python-channels |  DISTRO  | https://release-monitoring.org/project/021937 | 4.2.0        | 4.3.1        |     
         python-channels-redis |  DISTRO  | https://release-monitoring.org/project/021936 | 4.2.1        | 4.3.0        |     
     python-charset-normalizer |  DISTRO  | https://release-monitoring.org/project/055366 | 3.4.1        | 3.4.3        |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/020163 | 10.0.1       | 11.0.0b3     |     
                  python-click |  DISTRO  | https://release-monitoring.org/project/003802 | 8.2.1        | 8.2.2        |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/019734 | 1.1.30       | 2.0.2        |     
              python-contourpy |  DISTRO  | https://release-monitoring.org/project/244705 | 1.3.1        | 1.3.3        |     
                python-crontab |  DISTRO  | https://release-monitoring.org/project/031282 | 3.2.0        | 3.3.0        |     
           python-cryptography |  DISTRO  | https://release-monitoring.org/project/005532 | 44.0.1       | 45.0.7       |     
              python-cssselect |  DISTRO  | https://release-monitoring.org/project/011593 | 1.2.0        | 1.3.0        |     
             python-cssselect2 |  DISTRO  | https://release-monitoring.org/project/086109 | 0.7.0        | 0.8.0        |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/036699 | 3.1.2        | 3.1.3        |     
                 python-daphne |  DISTRO  | https://release-monitoring.org/project/021939 | 4.1.2        | 4.2.1        |     
               python-dateutil |  DISTRO  | https://release-monitoring.org/project/005621 | 2.9.0        | 2.9.0.post0  |     
              python-dbus-fast |  DISTRO  | https://release-monitoring.org/project/287975 | 2.44.1       | 2.44.3       |     
              python-decorator |  DISTRO  | https://release-monitoring.org/project/003819 | 5.1.1        | 5.2.1        |     
                python-distlib |  DISTRO  | https://release-monitoring.org/project/034504 | 0.3.9        | 0.4.0        |     
                 python-django |  DISTRO  | https://release-monitoring.org/project/003828 | 5.2.4        | 5.2.6        |     
              python-dnspython |  DISTRO  | https://release-monitoring.org/project/013190 | 2.7.0        | 2.8.0        |     
               python-docutils |  DISTRO  | https://release-monitoring.org/project/003849 | 0.21.2       | 0.22         |     
               python-dtschema |  DISTRO  | https://release-monitoring.org/project/100908 | 2024.11      | 2025.8       |     
                  python-ecdsa |  DISTRO  | https://release-monitoring.org/project/008370 | 0.19.0       | 0.19.1       |     
        python-email-validator |  DISTRO  | https://release-monitoring.org/project/098134 | 2.2.0        | 2.3.0        |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/015064 | 4.11.2       | 4.12.2       |     
                python-esptool |  DISTRO  | https://release-monitoring.org/project/011619 | 4.8.1        | 5.0.2        |     
                  python-evdev |  DISTRO  | https://release-monitoring.org/project/062869 | 1.9.0        | 1.9.2        |     
              python-executing |  DISTRO  | https://release-monitoring.org/project/024668 | 2.2.0        | 2.2.1        |     
                 python-falcon |  DISTRO  | https://release-monitoring.org/project/003860 | 4.0.2        | 4.1.0        |     
                 python-fastui |  DISTRO  | https://release-monitoring.org/project/372329 | 0.7.0        | 0.8.0        |     
               python-filelock |  DISTRO  | https://release-monitoring.org/project/011739 | 3.17.0       | 3.19.1       |     
                   python-fire |  DISTRO  | https://release-monitoring.org/project/021700 | 0.7.0        | 0.7.1        |     
                  python-flask |  DISTRO  | https://release-monitoring.org/project/003867 | 3.1.1        | 3.1.2        |     
             python-flask-cors |  DISTRO  | https://release-monitoring.org/project/019867 | 5.0.0        | 6.0.1        |     
          python-flask-smorest |  DISTRO  | https://release-monitoring.org/project/025028 | 0.45.0       | 0.46.1       |     
            python-flatbuffers |  DISTRO  | https://release-monitoring.org/project/085010 | 2.0.7        | 25.2.10      |     
              python-fonttools |  DISTRO  | https://release-monitoring.org/project/007388 | 4.55.6       | 4.59.2       |     
             python-frozenlist |  DISTRO  | https://release-monitoring.org/project/041138 | 1.5.0        | 1.7.0        |     
                    python-git |  DISTRO  | https://release-monitoring.org/project/006459 | 3.1.44       | 3.1.45       |     
                python-glslang |  DISTRO  | https://release-monitoring.org/project/205796 | 15.3.0       | 15.4.0       |     
                  python-gnupg |  DISTRO  | https://release-monitoring.org/project/015157 | 0.5.4        | 0.5.5        |     
                python-gobject |  DISTRO  | https://release-monitoring.org/project/013158 | 3.52.3       | 3.54.0       |     
        python-google-api-core |  DISTRO  | https://release-monitoring.org/project/025386 | 2.24.1       | 2.25.1       |     
            python-google-auth |  DISTRO  | https://release-monitoring.org/project/038039 | 2.38.0       | 2.40.3       |     
python-googleapis-common-pr... |  DISTRO  | https://release-monitoring.org/project/063943 | 1.66.0       | 1.70.0       |     
               python-greenlet |  DISTRO  | https://release-monitoring.org/project/006870 | 3.1.1        | 3.2.4        |     
          python-grpc-requests |  DISTRO  | https://release-monitoring.org/project/132701 | 0.1.20       | 0.1.21       |     
                 python-grpcio |  DISTRO  | https://release-monitoring.org/project/018429 | 1.70.0       | 1.74.0       |     
      python-grpcio-reflection |  DISTRO  | https://release-monitoring.org/project/030542 | 1.70.0       | 1.74.0       |     
                python-grpclib |  DISTRO  | https://release-monitoring.org/project/039170 | 0.4.7        | 0.4.8        |     
                     python-h2 |  DISTRO  | https://release-monitoring.org/project/019033 | 4.1.0        | 4.3.0        |     
                    python-hid |  DISTRO  | https://release-monitoring.org/project/049364 | 1.0.6        | 1.0.8        |     
                python-hiredis |  DISTRO  | https://release-monitoring.org/project/012002 | 3.1.0        | 3.2.1        |     
               python-httpcore |  DISTRO  | https://release-monitoring.org/project/079947 | 1.0.7        | 1.0.9        |     
               python-httplib2 |  DISTRO  | https://release-monitoring.org/project/003887 | 0.22.0       | 0.30.0       |     
               python-humanize |  DISTRO  | https://release-monitoring.org/project/019799 | 4.11.0       | 4.13.0       |     
                 python-hwdata |  DISTRO  | https://release-monitoring.org/project/011771 | 2.4.1        | 2.4.3-1      |     
               python-iptables |  DISTRO  | https://release-monitoring.org/project/011475 | 1.0.1        | 1.2.0        |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/001399 | 8.31.0       | 9.5.0        |     
                  python-iwlib |  DISTRO  | https://release-monitoring.org/project/051611 | 1.5          | 1.7.0        |     
     python-jaraco-collections |  DISTRO  | https://release-monitoring.org/project/058530 | 5.1.0        | 5.2.1        |     
       python-jaraco-functools |  DISTRO  | https://release-monitoring.org/project/020165 | 4.1.0        | 4.3.0        |     
                python-jeepney |  DISTRO  | https://release-monitoring.org/project/019564 | 0.8.0        | 0.9.0        |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/003898 | 4.23.0       | 4.25.1       |     
python-jsonschema-specifica... |  DISTRO  | https://release-monitoring.org/project/316377 | 2024.10.1    | 2025.9.1     |     
             python-kiwisolver |  DISTRO  | https://release-monitoring.org/project/016910 | 1.4.8        | 1.4.9        |     
             python-legacy-cgi |  DISTRO  | https://release-monitoring.org/project/375190 | 2.6.2        | 2.6.3        |     
               python-libevdev |  DISTRO  | https://release-monitoring.org/project/250362 | 0.11         | 0.12         |     
                python-libusb1 |  DISTRO  | https://release-monitoring.org/project/012301 | 3.2.0        | 3.3.1        |     
                   python-lmdb |  DISTRO  | https://release-monitoring.org/project/015512 | 1.6.2        | 1.7.3        |     
                python-logbook |  DISTRO  | https://release-monitoring.org/project/020016 | 1.8.0        | 1.8.2        |     
                   python-lxml |  DISTRO  | https://release-monitoring.org/project/003914 | 5.3.0        | 6.0.1        |     
         python-magic-wormhole |  DISTRO  | https://release-monitoring.org/project/017278 | 0.19.2       | 0.20.0       |     
                   python-mako |  DISTRO  | https://release-monitoring.org/project/003915 | 1.3.8        | 1.3.10       |     
               python-markdown |  DISTRO  | https://release-monitoring.org/project/003916 | 3.7          | 3.9          |     
              python-markdown2 |  DISTRO  | https://release-monitoring.org/project/003917 | 2.5.3        | 2.5.4        |     
            python-marshmallow |  DISTRO  | https://release-monitoring.org/project/008079 | 3.26.0       | 4.0.1        |     
 python-marshmallow-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/050566 | 1.4.0        | 1.4.2        |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/003919 | 3.10.0       | 3.10.6       |     
                python-maturin |  DISTRO  | https://release-monitoring.org/project/042653 | 1.9.1        | 1.9.4        |     
           python-meson-python |  DISTRO  | https://release-monitoring.org/project/248985 | 0.17.1       | 0.18.0       |     
                python-mistune |  DISTRO  | https://release-monitoring.org/project/006189 | 3.1.0        | 3.1.4        |     
              python-ml-dtypes |  DISTRO  | https://release-monitoring.org/project/330555 | 0.5.1        | 0.5.3        |     
              python-modbus-tk |  DISTRO  | https://release-monitoring.org/project/022813 | 1.1.4        | 1.1.5        |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/012201 | 10.6.0       | 10.8.0       |     
                 python-mpmath |  DISTRO  | https://release-monitoring.org/project/003930 | 1.3.0        | 1.4.0b1      |     
              python-multidict |  DISTRO  | https://release-monitoring.org/project/011132 | 6.1.0        | 6.6.4        |     
        python-mypy-extensions |  DISTRO  | https://release-monitoring.org/project/023367 | 1.0.0        | 1.1.0        |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/007791 | 3.4.2        | 3.5          |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/002509 | 1.25.0       | 2.3.3        |     
               python-oauthlib |  DISTRO  | https://release-monitoring.org/project/005377 | 3.2.2        | 3.3.1        |     
          python-opcua-asyncio |  DISTRO  | https://release-monitoring.org/project/131612 | 1.1.5        | 1.05a1       |     
                 python-orjson |  DISTRO  | https://release-monitoring.org/project/031737 | 3.10.15      | 3.11.3       |     
               python-paramiko |  DISTRO  | https://release-monitoring.org/project/003954 | 3.5.0        | 4.0.0        |     
                  python-parso |  DISTRO  | https://release-monitoring.org/project/016689 | 0.8.4        | 0.8.5        |     
                   python-path |  DISTRO  | https://release-monitoring.org/project/006110 | 17.1.0       | 17.1.1       |     
           python-pathvalidate |  DISTRO  | https://release-monitoring.org/project/021704 | 3.2.3        | 3.3.1        |     
                    python-pbr |  DISTRO  | https://release-monitoring.org/project/003960 | 6.1.0        | 7.0.1        |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/006529 | 25.0         | 25.2         |     
                python-portend |  DISTRO  | https://release-monitoring.org/project/020203 | 3.2.0        | 3.2.1        |     
              python-posix-ipc |  DISTRO  | https://release-monitoring.org/project/013204 | 1.1.1        | 1.3.0        |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/008742 | 3.0.50       | 3.0.52       |     
             python-proto-plus |  DISTRO  | https://release-monitoring.org/project/099887 | 1.26.0       | 1.26.1       |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/003715 | 29.3         | 32.0         |     
                 python-psutil |  DISTRO  | https://release-monitoring.org/project/003978 | 6.1.1        | 7.0.0        |     
                python-psygnal |  DISTRO  | https://release-monitoring.org/project/218690 | 0.11.1       | 0.14.1       |     
                   python-pudb |  DISTRO  | https://release-monitoring.org/project/003980 | 2024.1.3     | 2025.1       |     
                 python-pyalsa |  DISTRO  | https://release-monitoring.org/project/003767 | 1.2.12       | 1.2.14       |     
                  python-pyaml |  DISTRO  | https://release-monitoring.org/project/083931 | 25.1.0       | 25.7.0       |     
         python-pyasn1-modules |  DISTRO  | https://release-monitoring.org/project/011987 | 0.4.1        | 0.4.2        |     
                 python-pybind |  DISTRO  | https://release-monitoring.org/project/013384 | 2.13.6       | 3.0.1        |     
                python-pycairo |  DISTRO  | https://release-monitoring.org/project/013166 | 1.27.0       | 1.28.0       |     
                python-pycares |  DISTRO  | https://release-monitoring.org/project/019900 | 4.5.0        | 4.10.0       |     
                python-pycrate |  DISTRO  | https://release-monitoring.org/project/185106 | 0.7.8        | 0.7.11       |     
          python-pycryptodomex |  DISTRO  | https://release-monitoring.org/project/036851 | 3.21.0       | 3.23.0       |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/021582 | 20250629.2   | 20250906.1   |     
          python-pydantic-core |  DISTRO  | https://release-monitoring.org/project/273695 | 2.33.2       | 2.39.0       |     
             python-pyelftools |  DISTRO  | https://release-monitoring.org/project/016219 | 0.31         | 0.32         |     
               python-pygments |  DISTRO  | https://release-monitoring.org/project/003986 | 2.19.1       | 2.19.2       |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/012004 | 2.14         | 2.15.2       |     
               python-pylibfdt |  DISTRO  | https://release-monitoring.org/project/269896 | 1.7.2        | 1.7.2.post1  |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/015600 | 3.8.6        | 3.11.1       |     
                python-pymupdf |  DISTRO  | https://release-monitoring.org/project/017320 | 1.23.22      | 1.26.4       |     
                python-pymysql |  DISTRO  | https://release-monitoring.org/project/007284 | 1.1.1        | 1.1.2        |     
              python-pyopenssl |  DISTRO  | https://release-monitoring.org/project/005535 | 25.0.0       | 25.1.0       |     
             python-pypa-build |  DISTRO  | https://release-monitoring.org/project/132276 | 1.2.2        | 1.3.0        |     
              python-pyparsing |  DISTRO  | https://release-monitoring.org/project/003756 | 3.2.1        | 3.2.3        |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/015558 | 3.12.0       | 3.13.0       |     
        python-pypika-tortoise |  DISTRO  | https://release-monitoring.org/project/181934 | 0.6.1        | 0.6.2        |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/020104 | 5.15.6       | 5.15.11      |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/021589 | 1.2.10       | 1.2.11       |     
                  python-pysmi |  DISTRO  | https://release-monitoring.org/project/013209 | 1.5.9        | 1.6.2        |     
                 python-pysnmp |  DISTRO  | https://release-monitoring.org/project/012027 | 7.1.16       | 7.1.21       |     
               python-pyspnego |  DISTRO  | https://release-monitoring.org/project/107092 | 0.11.2       | 0.12.0       |     
                 python-pytest |  DISTRO  | https://release-monitoring.org/project/003765 | 8.4.0        | 8.4.2        |     
         python-pytest-asyncio |  DISTRO  | https://release-monitoring.org/project/007273 | 1.0.0        | 1.1.0        |     
                python-pythran |  DISTRO  | https://release-monitoring.org/project/021140 | 0.17.0       | 0.18.0       |     
                   python-pytz |  DISTRO  | https://release-monitoring.org/project/006537 | 2024.2       | 2025.2       |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/004104 | 25.1.2       | 27.0.2       |     
                 python-qrcode |  DISTRO  | https://release-monitoring.org/project/020011 | 8.1          | 8.2          |     
                  python-redis |  DISTRO  | https://release-monitoring.org/project/003992 | 5.2.1        | 6.4.0        |     
               python-reedsolo |  DISTRO  | https://release-monitoring.org/project/081160 | 1.7.0        | 2.0.13       |     
                  python-regex |  DISTRO  | https://release-monitoring.org/project/005548 | 2024.11.6    | 2025.9.1     |     
               python-requests |  DISTRO  | https://release-monitoring.org/project/004004 | 2.32.4       | 2.32.5       |     
                python-rpds-py |  DISTRO  | https://release-monitoring.org/project/368622 | 0.22.3       | 0.27.1       |     
                  python-rtoml |  DISTRO  | https://release-monitoring.org/project/062048 | 0.10.0       | 0.12.0       |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/019641 | 2.1.76       | 2.2.3        |     
            python-ruamel-yaml |  DISTRO  | https://release-monitoring.org/project/066067 | 0.18.10      | 0.18.15      |     
             python-s3transfer |  DISTRO  | https://release-monitoring.org/project/010428 | 0.13.0       | 0.13.1       |     
                  python-scipy |  DISTRO  | https://release-monitoring.org/project/004768 | 1.11.4       | 1.16.1       |     
                  python-segno |  DISTRO  | https://release-monitoring.org/project/059641 | 1.6.1        | 1.6.6        |     
               python-selenium |  DISTRO  | https://release-monitoring.org/project/005645 | 4.27.1       | 4.35.0       |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/021603 | 2.21.0       | 2.37.0       |     
           python-setproctitle |  DISTRO  | https://release-monitoring.org/project/011699 | 1.3.4        | 1.3.7        |     
        python-setuptools-rust |  DISTRO  | https://release-monitoring.org/project/122284 | 1.11.1       | 1.12.0       |     
         python-setuptools-scm |  DISTRO  | https://release-monitoring.org/project/007874 | 8.3.1        | 9.2.0        |     
                     python-sh |  DISTRO  | https://release-monitoring.org/project/010429 | 2.2.1        | 2.2.2        |     
             python-simplejson |  DISTRO  | https://release-monitoring.org/project/004026 | 3.19.3       | 3.20.1       |     
           python-simplesqlite |  DISTRO  | https://release-monitoring.org/project/021608 | 1.5.3        | 1.5.4        |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/013626 | 4.19.25      | 6.12.0       |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/012729 | 5.0.2        | 6.0.0        |     
                 python-snappy |  DISTRO  | https://release-monitoring.org/project/007203 | 0.6.1        | 0.7.3        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/021611 | 5.12.1       | 5.13.0       |     
              python-soupsieve |  DISTRO  | https://release-monitoring.org/project/027570 | 2.6          | 2.8          |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/004034 | 2.0.41       | 2.0.43       |     
           python-sqliteschema |  DISTRO  | https://release-monitoring.org/project/029718 | 2.0.0        | 2.0.1        |     
              python-starlette |  DISTRO  | https://release-monitoring.org/project/036570 | 0.47.2       | 0.47.3       |     
                  python-sympy |  DISTRO  | https://release-monitoring.org/project/004923 | 1.13.3       | 1.14.0       |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/021225 | 5.8.0        | 5.8.1        |     
              python-termcolor |  DISTRO  | https://release-monitoring.org/project/010198 | 2.5.0        | 3.1.0        |     
                  python-tftpy |  DISTRO  | https://release-monitoring.org/project/209210 | 0.8.5        | 0.8.6        |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/021614 | 0.21.0       | 0.22.0       |     
                python-tomlkit |  DISTRO  | https://release-monitoring.org/project/019609 | 0.13.2       | 0.13.3       |     
                python-tornado |  DISTRO  | https://release-monitoring.org/project/007498 | 6.5.1        | 6.5.2        |     
                   python-treq |  DISTRO  | https://release-monitoring.org/project/019614 | 24.9.1       | 25.5.0       |     
                   python-trio |  DISTRO  | https://release-monitoring.org/project/017451 | 0.28.0       | 0.30.0       |     
         python-trio-websocket |  DISTRO  | https://release-monitoring.org/project/136283 | 0.11.1       | 0.12.2       |     
      python-trove-classifiers |  DISTRO  | https://release-monitoring.org/project/088298 | 2025.1.15.22 | 2025.8.26.11 |     
                python-twisted |  DISTRO  | https://release-monitoring.org/project/004071 | 24.11.0      | 25.5.0       |     
                  python-txaio |  DISTRO  | https://release-monitoring.org/project/007202 | 23.1.1       | 25.6.1       |     
              python-typeguard |  DISTRO  | https://release-monitoring.org/project/038819 | 4.4.1        | 4.4.4        |     
  python-types-python-dateutil |  DISTRO  | https://release-monitoring.org/project/147859 | 2.9.0.202... | 2.9.0.202... |     
      python-typing-extensions |  DISTRO  | https://release-monitoring.org/project/019755 | 4.14.1       | 4.15.0       |     
                  python-ujson |  DISTRO  | https://release-monitoring.org/project/004076 | 5.10.0       | 5.11.0       |     
                  python-urwid |  DISTRO  | https://release-monitoring.org/project/004079 | 2.6.16       | 3.0.2        |     
                  python-uswid |  DISTRO  | https://release-monitoring.org/project/295497 | 0.5.1        | 0.5.2        |     
             python-validators |  DISTRO  | https://release-monitoring.org/project/019818 | 0.34.0       | 0.35.0       |     
             python-weasyprint |  DISTRO  | https://release-monitoring.org/project/011057 | 64.0         | 66.0         |     
                python-webargs |  DISTRO  | https://release-monitoring.org/project/024711 | 8.6.0        | 8.7.0        |     
             python-websockets |  DISTRO  | https://release-monitoring.org/project/008100 | 15.0         | 15.0.1       |     
                  python-wheel |  DISTRO  | https://release-monitoring.org/project/011428 | 0.45.1       | 0.46.1       |     
                  python-wrapt |  DISTRO  | https://release-monitoring.org/project/006108 | 1.17.2       | 1.17.3       |     
                   python-xlrd |  DISTRO  | https://release-monitoring.org/project/015107 | 2.0.1        | 2.0.2        |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/012031 | 3.2.1        | 3.2.5        |     
              python-xmltodict |  DISTRO  | https://release-monitoring.org/project/015109 | 0.14.2       | 0.15.0       |     
                   python-yarl |  DISTRO  | https://release-monitoring.org/project/012895 | 1.18.3       | 1.21.1       |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/012681 | 0.141.0      | 0.147.2      |     
           python-zipstream-ng |  DISTRO  | https://release-monitoring.org/project/215954 | 1.8.0        | 1.9.0        |     
                       python3 |  DISTRO  | https://release-monitoring.org/project/013254 | 3.13.5       | 3.13.7       |     
                    qbee-agent |  DISTRO  | https://release-monitoring.org/project/372328 | 2024.50      | 2025.36      |     
          qcom-db410c-firmware |  DISTRO  | https://release-monitoring.org/project/235382 | 1034.2.1     | 1036.1       |     
                          qemu |  DISTRO  | https://release-monitoring.org/project/013607 | 10.0.0       | 10.1.0       |     
                         qlibc |  DISTRO  | https://release-monitoring.org/project/021737 | 2.4.7        | 2.5.0        | ORPH
               qoriq-mc-binary |  DISTRO  | https://release-monitoring.org/project/377827 | 10.39.0      | 10.300.138   |     
                          qpdf |  DISTRO  | https://release-monitoring.org/project/005542 | 10.5.0       | 12.2.0       |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/015198 | 0.35.0       | 0.40.0       |     
                       qt5coap |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.9.2        |     
                        qt5knx |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.9.2        |     
                       qt5mqtt |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.9.2        |     
                      qt5opcua |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.9.2        |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.14      | 6.9.2        |     
                       qt6base |  DISTRO  | https://release-monitoring.org/project/007927 | 6.8.1        | 6.9.2        |     
                qt6core5compat |  DISTRO  | https://release-monitoring.org/project/007927 | 6.8.1        | 6.9.2        |     
                       qt6mqtt |  DISTRO  | https://release-monitoring.org/project/242923 | 6.8.1        | 6.9.2        |     
                  qt6serialbus |  DISTRO  | https://release-monitoring.org/project/007927 | 6.8.1        | 6.9.2        |     
                 qt6serialport |  DISTRO  | https://release-monitoring.org/project/007927 | 6.8.1        | 6.9.2        |     
                        qt6svg |  DISTRO  | https://release-monitoring.org/project/007927 | 6.8.1        | 6.9.2        |     
                        quazip |  DISTRO  | https://release-monitoring.org/project/004141 | 1.4          | 1.5          |     
                         quota |  DISTRO  | https://release-monitoring.org/project/004145 | 4.09         | 4.10         |     
                     quotatool |  DISTRO  | https://release-monitoring.org/project/004146 | 1.6.4        | 1.6.5        | ORPH
                           qwt |  DISTRO  | https://release-monitoring.org/project/004147 | 6.1.6        | 6.3.0        | ORPH
                    rabbitmq-c |  DISTRO  | https://release-monitoring.org/project/013768 | 0.14.0       | 0.15.0       |     
                         ragel |  DISTRO  | https://release-monitoring.org/project/012105 | 6.10         | 7.0.4        | ORPH
                        ranger |  DISTRO  | https://release-monitoring.org/project/007426 | 1.9.3        | 1.9.4        |     
                     rdma-core |  DISTRO  | https://release-monitoring.org/project/012907 | 58.0         | 59.0         |     
                         redis |  DISTRO  | https://release-monitoring.org/project/004181 | 8.2.0        | 8.2.1        |     
               redis-plus-plus |  DISTRO  | https://release-monitoring.org/project/368624 | 1.3.12       | 1.3.15       |     
                     refpolicy |  DISTRO  | https://release-monitoring.org/project/021663 | 2.20250213   | 2.20250618   |     
                        reproc |  DISTRO  | https://release-monitoring.org/project/151400 | 14.2.4       | 14.2.5       |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/016520 | 3.8.1        | 20200710     | ORPH
                         rhash |  DISTRO  | https://release-monitoring.org/project/013843 | 1.4.4        | 1.4.6        | ORPH
              riemann-c-client |  DISTRO  | https://release-monitoring.org/project/021389 | 1.10.5       | 2.0.1        | ORPH
                        rlwrap |  DISTRO  | https://release-monitoring.org/project/004199 | 0.46.1       | 0.47.1       |     
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/015560 | 6.20.3       | 10.5.1       |     
                       rpcbind |  DISTRO  | https://release-monitoring.org/project/004212 | 1.2.7        | 1.2.8        |     
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/004218 | 8.2506.0     | 8.2508.0     |     
                      rt-tests |  DISTRO  | https://release-monitoring.org/project/059450 | 2.8          | 2.9          |     
                       rtl_433 |  DISTRO  | https://release-monitoring.org/project/014997 | 23.11        | 25.02        |     
                      rtorrent |  DISTRO  | https://release-monitoring.org/project/004221 | 0.9.8        | 0.16.0       | ORPH
                          rtty |  DISTRO  | https://release-monitoring.org/project/087994 | 8.1.2        | 9.0.2        |     
                          ruby |  DISTRO  | https://release-monitoring.org/project/004223 | 3.4.3        | 3.4.5        |     
                          runc |  DISTRO  | https://release-monitoring.org/project/007462 | 1.3.0        | 1.3.1        |     
                          rust |  DISTRO  | https://release-monitoring.org/project/007635 | 1.88.0       | 1.89.0       |     
                      rust-bin |  DISTRO  | https://release-monitoring.org/project/007635 | 1.88.0       | 1.89.0       |     
                  rust-bindgen |  DISTRO  | https://release-monitoring.org/project/017910 | 0.72.0       | 0.72.1       | ORPH
                         rygel |  DISTRO  | https://release-monitoring.org/project/004751 | 0.42.5       | 0.44.2       |     
                    s390-tools |  DISTRO  | https://release-monitoring.org/project/010714 | 2.33.1       | 2.38.0       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/005485 | 2.13.1.0     | 2.13.2.0     |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/016547 | 2.4.0.0      | 2.4.1.0      |     
                 s6-linux-init |  DISTRO  | https://release-monitoring.org/project/016552 | 1.1.2.1      | 1.1.3.0      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/016551 | 2.6.2.1      | 2.6.3.0      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/016550 | 2.7.0.4      | 2.7.1.0      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/016549 | 2.3.0.4      | 2.3.1.0      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/016548 | 0.5.5.0      | 0.5.6.0      |     
                      safeclib |  DISTRO  | https://release-monitoring.org/project/021385 | 3.7.1        | 08032024     |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/004758 | 4.22.3       | 4.22.4       |     
                  sane-airscan |  DISTRO  | https://release-monitoring.org/project/121086 | 0.99.33      | 0.99.36      |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/004760 | 1.1.1        | 1.4.0        |     
                           sbc |  DISTRO  | https://release-monitoring.org/project/016338 | 2.0          | 2.1          |     
                         scons |  DISTRO  | https://release-monitoring.org/project/004770 | 4.8.1        | 4.9.1        |     
                   screenfetch |  DISTRO  | https://release-monitoring.org/project/005733 | 3.9.1        | 3.9.9        | ORPH
                        scrypt |  DISTRO  | https://release-monitoring.org/project/021238 | 1.3.2        | 1.3.3        |     
                          sdl2 |  DISTRO  | https://release-monitoring.org/project/004779 | 2.32.8       | 2.32.10      |     
                    sdl2_image |  DISTRO  | https://release-monitoring.org/project/004781 | 2.8.4        | 3.2.4        |     
                    sdl2_mixer |  DISTRO  | https://release-monitoring.org/project/004782 | 2.6.3        | 2.8.1        | ORPH
                      sdl2_ttf |  DISTRO  | https://release-monitoring.org/project/004784 | 2.24.0       | 3.2.2        |     
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/004778 | 2.0.23       | 2.0.27       | ORPH
                     sdl_sound |  DISTRO  | https://release-monitoring.org/project/010262 | 1.0.3        | 2.0.4        | ORPH
                        sdparm |  DISTRO  | https://release-monitoring.org/project/004787 | 1.10         | 1.12         |     
                       sedutil |  DISTRO  | https://release-monitoring.org/project/015203 | 1.20.0       | 1.49.13      |     
                selinux-python |  DISTRO  | https://release-monitoring.org/project/001717 | 3.8.1        | 3.9          |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/001717 | 3.8.1        | 3.9          | ORPH
                    sentry-cli |  DISTRO  | https://release-monitoring.org/project/135642 | 2.20.3       | 2.53.0       |     
                 sentry-native |  DISTRO  | https://release-monitoring.org/project/135639 | 0.4.1        | 0.10.1       |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/021655 | 4.3.8        | 4.6.5        |     
                          serd |  DISTRO  | https://release-monitoring.org/project/230531 | 0.30.14      | 0.32.4       |     
                       sexpect |  DISTRO  | https://release-monitoring.org/project/269648 | 2.3.14       | 2.3.15       |     
                        shadow |  DISTRO  | https://release-monitoring.org/project/004802 | 4.17.4       | 4.18.0       |     
                shairport-sync |  DISTRO  | https://release-monitoring.org/project/021384 | 3.3.9        | 4.3.7        | ORPH
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/005524 | 1.12         | 2.4          | ORPH
                   shellinabox |  DISTRO  | https://release-monitoring.org/project/009501 | 2.20         | 2.21         |     
                          shim |  DISTRO  | https://release-monitoring.org/project/010719 | 16.0         | 16.1         |     
              signal-estimator |  DISTRO  | https://release-monitoring.org/project/284559 | v0.0.4       | 0.1.0        | ORPH
                       skalibs |  DISTRO  | https://release-monitoring.org/project/005486 | 2.14.3.0     | 2.14.4.0     |     
                        skopeo |  DISTRO  | https://release-monitoring.org/project/009216 | 1.18.0       | 1.20.0       |     
                         slirp |  DISTRO  | https://release-monitoring.org/project/096796 | 4.8.0        | 4.9.1        | ORPH
                        snappy |  DISTRO  | https://release-monitoring.org/project/004844 | 1.2.1        | 1.2.2        | ORPH
                  snmpclitools |  DISTRO  | https://release-monitoring.org/project/031640 | 0.6.4        | 0.7.2        | ORPH
                        snmppp |  DISTRO  | https://release-monitoring.org/project/021318 | 3.5.1        | 3.6.3        |     
                        snort3 |  DISTRO  | https://release-monitoring.org/project/013263 | 3.1.40.0     | 3.9.5.0      |     
                          sord |  DISTRO  | https://release-monitoring.org/project/230536 | 0.16.12      | 0.16.18      |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/010152 | 0.7          | 0.8          |     
                    spawn-fcgi |  DISTRO  | https://release-monitoring.org/project/005388 | 1.6.4        | 1.6.6        | ORPH
                       speechd |  DISTRO  | https://release-monitoring.org/project/328138 | 0.11.5       | 0.12.1       |     
                         spice |  DISTRO  | https://release-monitoring.org/project/004871 | 0.15.2       | 0.16.0       | ORPH
                spice-protocol |  DISTRO  | https://release-monitoring.org/project/014892 | 0.14.4       | 0.14.5       | ORPH
                   spirv-tools |  DISTRO  | https://release-monitoring.org/project/334920 | 1.4.313.0    | 1.4.321.0    | ORPH
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/011213 | 4.5.5        | 4.10.0       |     
                        sqlite |  DISTRO  | https://release-monitoring.org/project/004877 | 3.48.0       | 3.50.4       |     
                      squashfs |  DISTRO  | https://release-monitoring.org/project/004879 | 4.6.1        | 4.7.2        |     
                         squid |  DISTRO  | https://release-monitoring.org/project/004880 | 6.13         | 7.1          | ORPH
                        sratom |  DISTRO  | https://release-monitoring.org/project/014903 | 0.6.14       | 0.6.18       |     
                          sslh |  DISTRO  | https://release-monitoring.org/project/006184 | 2.0.1        | 2.2.4        | ORPH
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/008127 | 1.20.7.1     | 1.22.21      | ORPH
                        stella |  DISTRO  | https://release-monitoring.org/project/006861 | 6.7.1        | 7.0c         |     
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/012538 | 0.18.05      | 0.19.04      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/004899 | 5.9.14       | 6.0.2        |     
                       stunnel |  DISTRO  | https://release-monitoring.org/project/004901 | 5.71         | 5.75         |     
                   superiotool |  DISTRO  | https://release-monitoring.org/project/010128 | 24.05        | 25.06        |     
                    supervisor |  DISTRO  | https://release-monitoring.org/project/016289 | 4.2.5        | 4.3.0        | ORPH
                      suricata |  DISTRO  | https://release-monitoring.org/project/010925 | 6.0.19       | 8.0.0        |     
                          sway |  DISTRO  | https://release-monitoring.org/project/011497 | 1.10         | 1.11         |     
                          swig |  DISTRO  | https://release-monitoring.org/project/004919 | 4.1.1        | 4.3.1        |     
                         swipl |  DISTRO  | https://release-monitoring.org/project/236197 | 9.2.8        | 9.2.9        |     
                         swtpm |  GUESS   | https://release-monitoring.org/project/116461 | 0.8.2        | 0.10.1       |     
                       synergy |  DISTRO  | https://release-monitoring.org/project/005718 | 2.0.12-beta  | 2.3.2        |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/016898 | 0.29.3       | 0.40.1       |     
                     syslog-ng |  DISTRO  | https://release-monitoring.org/project/004930 | 4.8.1        | 4.9.0        |     
                       sysprof |  DISTRO  | https://release-monitoring.org/project/021649 | 48.0         | 48.1         |     
                       sysrepo |  DISTRO  | https://release-monitoring.org/project/034820 | 3.6.11       | 3.7.11       |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/004931 | 12.7.5       | 12.7.8       | ORPH
                       systemd |  DISTRO  | https://release-monitoring.org/project/005440 | 257.7        | 257.9        |     
             systemd-bootchart |  DISTRO  | https://release-monitoring.org/project/011774 | 233          | 235          | ORPH
                     tailscale |  DISTRO  | https://release-monitoring.org/project/141585 | 1.78.1       | 1.86.2       |     
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/009174 | 2.1.58       | 3.0.1        |     
                           tbb |  DISTRO  | https://release-monitoring.org/project/008217 | 2021.12.0    | 2022.2.0     |     
                     tcf-agent |  DISTRO  | https://release-monitoring.org/project/021833 | 1.8.0        | 1.9.0        |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/004941 | 8.6.15       | 9.0.2        | ORPH
                         tclap |  DISTRO  | https://release-monitoring.org/project/004942 | 1.2.4        | 1.2.5        | ORPH
                        tcllib |  DISTRO  | https://release-monitoring.org/project/004943 | 1.21         | 2.0          |     
                     tcpreplay |  DISTRO  | https://release-monitoring.org/project/013716 | 4.5.1        | 4.5.2        | ORPH
                      tealdeer |  DISTRO  | https://release-monitoring.org/project/084521 | 1.6.1        | 1.7.2        |     
               tensorflow-lite |  DISTRO  | https://release-monitoring.org/project/016141 | 2.11.0       | 2.20.0       |     
                   terminology |  DISTRO  | https://release-monitoring.org/project/004951 | 1.12.1       | 1.14.0       |     
                 tesseract-ocr |  DISTRO  | https://release-monitoring.org/project/004954 | 5.5.0        | 5.5.1        |     
                      thermald |  DISTRO  | https://release-monitoring.org/project/014500 | 2.5.6        | 2.5.9        |     
                        thrift |  DISTRO  | https://release-monitoring.org/project/005581 | 0.14.1       | 0.22.0       | ORPH
                   timescaledb |  DISTRO  | https://release-monitoring.org/project/017545 | 2.21.0       | 2.22.0       |     
                      tinifier |  DISTRO  | https://release-monitoring.org/project/241900 | 4.1.0        | 5.1.0        |     
                       tinyssh |  DISTRO  | https://release-monitoring.org/project/014678 | 20240101     | 20250501     |     
                           tio |  DISTRO  | https://release-monitoring.org/project/020587 | 3.5          | 3.9          |     
                       tipidee |  DISTRO  | https://release-monitoring.org/project/373437 | 0.0.5.1      | 0.0.6.0      |     
                            tk |  DISTRO  | https://release-monitoring.org/project/011426 | 8.6.15       | 9.0.2        |     
                   tl-expected |  DISTRO  | https://release-monitoring.org/project/112689 | v1.0.0       | 1.3.1        |     
                     tpm-tools |  DISTRO  | https://release-monitoring.org/project/021640 | 1.3.9.1      | 1.3.9.2      |     
                  tpm2-openssl |  DISTRO  | https://release-monitoring.org/project/242488 | 1.2.0        | 1.3.0        |     
                     tpm2-totp |  DISTRO  | https://release-monitoring.org/project/018790 | 0.2.1        | 0.3.0        |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/012683 | 3.2.2        | 4.1.3        | ORPH
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/007873 | 3.3.2        | 3.3.3        |     
                   uboot-tools |  DISTRO  | https://release-monitoring.org/project/005022 | 2021.07      | 2025.07      | ORPH
                        udisks |  DISTRO  | https://release-monitoring.org/project/005028 | 2.10.1       | 2.10.2       |     
                       udpcast |  DISTRO  | https://release-monitoring.org/project/010206 | 20230924     | 20250223     | ORPH
                       uftrace |  DISTRO  | https://release-monitoring.org/project/195039 | 0.14         | 0.18.1       | ORPH
                           uhd |  DISTRO  | https://release-monitoring.org/project/012572 | 4.7.0.0      | 4.9.0.0      |     
                         ulogd |  DISTRO  | https://release-monitoring.org/project/005038 | 2.0.8        | 2.0.9        | ORPH
                       unbound |  DISTRO  | https://release-monitoring.org/project/005042 | 1.21.1       | 1.23.1       |     
                       unionfs |  DISTRO  | https://release-monitoring.org/project/017617 | 2.1          | 3.6          | ORPH
                         unrar |  DISTRO  | https://release-monitoring.org/project/013306 | 6.2.12       | 7.1.10       | ORPH
                      upmpdcli |  DISTRO  | https://release-monitoring.org/project/015848 | 1.5.12       | 1.9.6        | ORPH
                        upower |  DISTRO  | https://release-monitoring.org/project/005056 | 0.99.19      | 1.90.10      |     
                           upx |  DISTRO  | https://release-monitoring.org/project/013737 | 4.2.1        | 5.0.2        |     
                      usbguard |  DISTRO  | https://release-monitoring.org/project/011151 | 1.1.2        | 1.1.4        |     
                      usbredir |  DISTRO  | https://release-monitoring.org/project/016012 | 0.14.0       | 0.15.0       | ORPH
                     ustreamer |  DISTRO  | https://release-monitoring.org/project/314869 | 6.37         | 6.40         |     
                      utf8proc |  DISTRO  | https://release-monitoring.org/project/007455 | 2.9.0        | 2.10.0       | ORPH
                  v4l2loopback |  DISTRO  | https://release-monitoring.org/project/010956 | 0.13.2       | 0.15.1       |     
                      valijson |  DISTRO  | https://release-monitoring.org/project/018452 | 1.0.2        | 1.0.6        | ORPH
                           vdr |  DISTRO  | https://release-monitoring.org/project/005069 | 2.6.5        | 2.7.7        | ORPH
         vdr-plugin-vnsiserver |  DISTRO  | https://release-monitoring.org/project/005080 | 1.8.0        | 1.8.3        | ORPH
                           vim |  DISTRO  | https://release-monitoring.org/project/005092 | 9.1.0145     | 9.1.1740     | ORPH
                   vis-network |  DISTRO  | https://release-monitoring.org/project/270536 | 9.1.0        | 10.0.1       |     
                           vlc |  DISTRO  | https://release-monitoring.org/project/006504 | 3.0.21       | 3.0.21-1     |     
                  vorbis-tools |  DISTRO  | https://release-monitoring.org/project/005104 | 1.4.2        | 1.4.3        | ORPH
                           vte |  DISTRO  | https://release-monitoring.org/project/010895 | 0.66.2       | 0.80.3       | ORPH
                         vuejs |  DISTRO  | https://release-monitoring.org/project/089353 | 3.5.16       | 3.5.21       |     
                vulkan-headers |  DISTRO  | https://release-monitoring.org/project/088835 | 1.4.317      | 1.4.326      | ORPH
                 vulkan-loader |  DISTRO  | https://release-monitoring.org/project/230557 | 1.4.317      | 1.4.326      | ORPH
                    vulkan-sdk |  DISTRO  | https://release-monitoring.org/project/370476 | 1.4.313.0    | 1.4.321.0    | ORPH
                  vulkan-tools |  DISTRO  | https://release-monitoring.org/project/242111 | 1.4.317      | 1.4.326      | ORPH
                        waffle |  DISTRO  | https://release-monitoring.org/project/021633 | 1.7.0        | 1.8.1        |     
                       wavemon |  DISTRO  | https://release-monitoring.org/project/005120 | 0.9.5        | 0.9.6        | ORPH
                       wavpack |  DISTRO  | https://release-monitoring.org/project/005121 | 5.7.0        | 5.8.1        | ORPH
                       wayland |  DISTRO  | https://release-monitoring.org/project/010061 | 1.23.1       | 1.24.0       |     
             wayland-protocols |  DISTRO  | https://release-monitoring.org/project/013997 | 1.42         | 1.45         | ORPH
                     waylandpp |  DISTRO  | https://release-monitoring.org/project/016969 | 1.0.0        | 1.0.1        | ORPH
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/005355 | 2.48.3       | 2.49.90      |     
                          webp |  DISTRO  | https://release-monitoring.org/project/001761 | 1.5.0        | 1.6.0        |     
       webrtc-audio-processing |  DISTRO  | https://release-monitoring.org/project/015929 | 1.3          | 2.1          | ORPH
                        weston |  DISTRO  | https://release-monitoring.org/project/013745 | 14.0.1       | 14.0.2       |     
                         which |  DISTRO  | https://release-monitoring.org/project/005127 | 2.21         | 2.23         | ORPH
                          wine |  DISTRO  | https://release-monitoring.org/project/005134 | 10.0         | 10.14        |     
                wireless-regdb |  DISTRO  | https://release-monitoring.org/project/015257 | 2025.02.20   | 2025.07.10   |     
                   wireplumber |  DISTRO  | https://release-monitoring.org/project/235056 | 0.5.10       | 0.5.11       | ORPH
                       wlroots |  DISTRO  | https://release-monitoring.org/project/018357 | 0.18.2       | 0.19.0       |     
                       wolftpm |  DISTRO  | https://release-monitoring.org/project/256219 | 3.1.0        | 3.9.2        |     
                    wpan-tools |  DISTRO  | https://release-monitoring.org/project/021835 | 0.9          | 0.10         | ORPH
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/017557 | 2.48.3       | 2.48.6       |     
                       wtfutil |  DISTRO  | https://release-monitoring.org/project/243189 | 0.41.0       | 0.46.1       | ORPH
                        x11vnc |  DISTRO  | https://release-monitoring.org/project/010182 | 0.9.16       | 0.9.17       |     
                          x265 |  DISTRO  | https://release-monitoring.org/project/007275 | 3.5          | 4.1          |     
                        xapian |  DISTRO  | https://release-monitoring.org/project/015919 | 1.4.27       | 1.4.29       |     
                   xapp_appres |  DISTRO  | https://release-monitoring.org/project/015053 | 1.0.6        | 1.0.7        | ORPH
                 xapp_bdftopcf |  DISTRO  | https://release-monitoring.org/project/015054 | 1.1.1        | 1.1.2        | ORPH
                   xapp_bitmap |  DISTRO  | https://release-monitoring.org/project/000191 | 1.1.0        | 1.1.1        | ORPH
                  xapp_editres |  DISTRO  | https://release-monitoring.org/project/017160 | 1.0.8        | 1.0.9        | ORPH
               xapp_fonttosfnt |  DISTRO  | https://release-monitoring.org/project/021723 | 1.2.2        | 1.2.4        | ORPH
                xapp_fslsfonts |  DISTRO  | https://release-monitoring.org/project/017157 | 1.0.6        | 1.0.7        | ORPH
                  xapp_iceauth |  DISTRO  | https://release-monitoring.org/project/015048 | 1.0.9        | 1.0.10       | ORPH
                  xapp_listres |  DISTRO  | https://release-monitoring.org/project/017161 | 1.0.5        | 1.0.6        | ORPH
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/015047 | 1.1.1        | 20240910     | ORPH
              xapp_mkfontscale |  DISTRO  | https://release-monitoring.org/project/015043 | 1.2.2        | 1.2.3        | ORPH
                   xapp_oclock |  DISTRO  | https://release-monitoring.org/project/015042 | 1.0.5        | 1.0.6        | ORPH
                  xapp_sessreg |  DISTRO  | https://release-monitoring.org/project/015040 | 1.1.3        | 1.1.4        | ORPH
                 xapp_showfont |  DISTRO  | https://release-monitoring.org/project/012316 | 1.0.6        | 1.0.7        | ORPH
                  xapp_smproxy |  DISTRO  | https://release-monitoring.org/project/015039 | 1.0.7        | 1.0.8        | ORPH
                      xapp_twm |  DISTRO  | https://release-monitoring.org/project/015038 | 1.0.12       | 1.0.13.1     | ORPH
                  xapp_viewres |  DISTRO  | https://release-monitoring.org/project/017162 | 1.0.7        | 1.0.8        | ORPH
                  xapp_x11perf |  DISTRO  | https://release-monitoring.org/project/015035 | 1.6.2        | 1.7.0        | ORPH
                    xapp_xauth |  DISTRO  | https://release-monitoring.org/project/005253 | 1.1.2        | 1.1.4        | ORPH
               xapp_xbacklight |  DISTRO  | https://release-monitoring.org/project/005161 | 1.2.3        | 1.2.4        | ORPH
                    xapp_xbiff |  DISTRO  | https://release-monitoring.org/project/015034 | 1.0.4        | 1.0.5        | ORPH
               xapp_xclipboard |  DISTRO  | https://release-monitoring.org/project/015033 | 1.1.4        | 1.1.5        | ORPH
                   xapp_xcmsdb |  DISTRO  | https://release-monitoring.org/project/015031 | 1.0.6        | 1.0.7        | ORPH
                 xapp_xcompmgr |  DISTRO  | https://release-monitoring.org/project/005174 | 1.1.9        | 1.1.10       | ORPH
                 xapp_xconsole |  DISTRO  | https://release-monitoring.org/project/015030 | 1.0.8        | 1.1.0        |     
               xapp_xcursorgen |  DISTRO  | https://release-monitoring.org/project/021210 | 1.0.8        | 1.0.9        | ORPH
                 xapp_xditview |  DISTRO  | https://release-monitoring.org/project/021262 | 1.0.6        | 1.0.7        | ORPH
                      xapp_xdm |  DISTRO  | https://release-monitoring.org/project/005255 | 1.1.14       | 1.1.17       | ORPH
                 xapp_xdpyinfo |  DISTRO  | https://release-monitoring.org/project/015028 | 1.3.4        | 1.4.0        | ORPH
                 xapp_xdriinfo |  DISTRO  | https://release-monitoring.org/project/015027 | 1.0.7        | 1.0.8        | ORPH
                    xapp_xedit |  DISTRO  | https://release-monitoring.org/project/005180 | 1.2.3        | 1.2.4        | ORPH
                      xapp_xev |  DISTRO  | https://release-monitoring.org/project/015026 | 1.2.5        | 1.2.6        | ORPH
                    xapp_xeyes |  DISTRO  | https://release-monitoring.org/project/015025 | 1.2.0        | 1.3.1        | ORPH
                 xapp_xfontsel |  DISTRO  | https://release-monitoring.org/project/015023 | 1.1.0        | 1.1.1        | ORPH
                      xapp_xfs |  DISTRO  | https://release-monitoring.org/project/005256 | 1.2.1        | 1.2.2        | ORPH
                  xapp_xfsinfo |  DISTRO  | https://release-monitoring.org/project/017158 | 1.0.7        | 1.0.8        | ORPH
                   xapp_xgamma |  DISTRO  | https://release-monitoring.org/project/015022 | 1.0.7        | 1.0.8        | ORPH
                      xapp_xgc |  DISTRO  | https://release-monitoring.org/project/021720 | 1.0.6        | 1.0.7        | ORPH
                    xapp_xhost |  DISTRO  | https://release-monitoring.org/project/015021 | 1.0.9        | 1.0.10       | ORPH
                    xapp_xinit |  DISTRO  | https://release-monitoring.org/project/005258 | 1.4.2        | 1.4.4        | ORPH
                  xapp_xkbcomp |  DISTRO  | https://release-monitoring.org/project/015018 | 1.4.6        | 1.4.7        | ORPH
                   xapp_xkbevd |  DISTRO  | https://release-monitoring.org/project/015017 | 1.1.5        | 1.1.6        | ORPH
                 xapp_xkbprint |  DISTRO  | https://release-monitoring.org/project/017159 | 1.0.6        | 1.0.7        | ORPH
                 xapp_xkbutils |  DISTRO  | https://release-monitoring.org/project/015016 | 1.0.5        | 1.0.6        | ORPH
                    xapp_xload |  DISTRO  | https://release-monitoring.org/project/014992 | 1.1.4        | 1.2.0        | ORPH
                    xapp_xlogo |  DISTRO  | https://release-monitoring.org/project/014991 | 1.0.6        | 1.0.7        | ORPH
                 xapp_xlsfonts |  DISTRO  | https://release-monitoring.org/project/014964 | 1.0.7        | 1.0.8        | ORPH
                     xapp_xmag |  DISTRO  | https://release-monitoring.org/project/014963 | 1.0.7        | 1.0.8        | ORPH
                     xapp_xman |  DISTRO  | https://release-monitoring.org/project/014962 | 1.1.5        | 1.2.0        | ORPH
                 xapp_xmessage |  DISTRO  | https://release-monitoring.org/project/014961 | 1.0.6        | 1.0.7        | ORPH
                      xapp_xmh |  DISTRO  | https://release-monitoring.org/project/021718 | 1.0.4        | 1.0.5        | ORPH
                    xapp_xmore |  DISTRO  | https://release-monitoring.org/project/018845 | 1.0.3        | 1.0.4        | ORPH
                      xapp_xpr |  DISTRO  | https://release-monitoring.org/project/014959 | 1.1.0        | 1.2.0        | ORPH
                    xapp_xprop |  DISTRO  | https://release-monitoring.org/project/014958 | 1.2.6        | 1.2.8        | ORPH
                   xapp_xrandr |  DISTRO  | https://release-monitoring.org/project/014957 | 1.5.2        | 1.5.3        | ORPH
                 xapp_xrefresh |  DISTRO  | https://release-monitoring.org/project/014955 | 1.0.7        | 1.1.0        | ORPH
                      xapp_xsm |  DISTRO  | https://release-monitoring.org/project/005259 | 1.0.5        | 1.0.6        | ORPH
                     xapp_xwud |  DISTRO  | https://release-monitoring.org/project/014948 | 1.0.6        | 1.0.7        | ORPH
                     xcb-proto |  DISTRO  | https://release-monitoring.org/project/013646 | 1.15.2       | 1.17.0       | ORPH
               xcb-util-cursor |  DISTRO  | https://release-monitoring.org/project/005166 | 0.1.4        | 0.1.5        | ORPH
      xdriver_xf86-input-evdev |  DISTRO  | https://release-monitoring.org/project/005217 | 2.10.6       | 2.11.0       | ORPH
   xdriver_xf86-input-libinput |  DISTRO  | https://release-monitoring.org/project/005782 | 1.3.0        | 1.5.0        | ORPH
      xdriver_xf86-input-mouse |  DISTRO  | https://release-monitoring.org/project/015901 | 1.9.5        | 2.0.0        | ORPH
  xdriver_xf86-input-synaptics |  DISTRO  | https://release-monitoring.org/project/005239 | 1.9.2        | 1.10.0       | ORPH
     xdriver_xf86-video-amdgpu |  DISTRO  | https://release-monitoring.org/project/015900 | 23.0.0       | 25.0.0       | ORPH
        xdriver_xf86-video-ast |  DISTRO  | https://release-monitoring.org/project/017163 | 1.1.6        | 1.2.1        | ORPH
      xdriver_xf86-video-fbdev |  DISTRO  | https://release-monitoring.org/project/005218 | 0.5.0        | 0.5.1        | ORPH
      xdriver_xf86-video-geode |  DISTRO  | https://release-monitoring.org/project/005219 | 2.11.21      | 2.18.2       | ORPH
     xdriver_xf86-video-mach64 |  DISTRO  | https://release-monitoring.org/project/005225 | 6.9.7        | 6.10.0       | ORPH
        xdriver_xf86-video-mga |  DISTRO  | https://release-monitoring.org/project/005226 | 2.0.1        | 2.1.0        | ORPH
    xdriver_xf86-video-nouveau |  DISTRO  | https://release-monitoring.org/project/005229 | 1.0.17       | 1.0.18       | ORPH
         xdriver_xf86-video-nv |  DISTRO  | https://release-monitoring.org/project/021711 | 2.1.22       | 2.1.23       | ORPH
       xdriver_xf86-video-r128 |  DISTRO  | https://release-monitoring.org/project/005232 | 6.12.1       | 6.13.0       | ORPH
     xdriver_xf86-video-savage |  DISTRO  | https://release-monitoring.org/project/005235 | 2.4.0        | 2.4.1        | ORPH
xdriver_xf86-video-siliconm... |  DISTRO  | https://release-monitoring.org/project/005236 | 1.7.9        | 1.7.10       | ORPH
                           xen |  DISTRO  | https://release-monitoring.org/project/005181 | 4.14.6       | 4.20.1       |     
                        xerces |  DISTRO  | https://release-monitoring.org/project/005182 | 3.2.4        | 3.3.0        | ORPH
               xfont_encodings |  DISTRO  | https://release-monitoring.org/project/015051 | 1.0.7        | 1.1.0        | ORPH
 xfont_font-adobe-utopia-75dpi |  DISTRO  | https://release-monitoring.org/project/017200 | 1.0.4        | 1.0.5        | ORPH
               xfont_font-util |  DISTRO  | https://release-monitoring.org/project/015055 | 1.4.0        | 1.4.1        | ORPH
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/005188 | 6.11.0       | 6.16.0       | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/006382 | 2.3.15       | 2.3.15.4     |     
              xkeyboard-config |  DISTRO  | https://release-monitoring.org/project/005191 | 2.38         | 2.45         | ORPH
                         xl2tp |  DISTRO  | https://release-monitoring.org/project/005193 | 1.3.18       | 1.3.19       | ORPH
                    xlib_libFS |  DISTRO  | https://release-monitoring.org/project/001618 | 1.0.9        | 1.0.10       | ORPH
                   xlib_libICE |  DISTRO  | https://release-monitoring.org/project/001638 | 1.1.1        | 1.1.2        | ORPH
                    xlib_libSM |  DISTRO  | https://release-monitoring.org/project/001726 | 1.2.4        | 1.2.6        | ORPH
                   xlib_libX11 |  DISTRO  | https://release-monitoring.org/project/001764 | 1.8.7        | 1.8.12       | ORPH
            xlib_libXScrnSaver |  DISTRO  | https://release-monitoring.org/project/001791 | 1.2.4        | 1.2.5        | ORPH
                   xlib_libXau |  DISTRO  | https://release-monitoring.org/project/001765 | 1.0.11       | 1.0.12       | ORPH
                   xlib_libXaw |  DISTRO  | https://release-monitoring.org/project/001766 | 1.0.15       | 1.0.16       | ORPH
               xlib_libXcursor |  DISTRO  | https://release-monitoring.org/project/001770 | 1.2.1        | 1.2.3        | ORPH
                 xlib_libXdmcp |  DISTRO  | https://release-monitoring.org/project/001772 | 1.1.4        | 1.1.5        | ORPH
                  xlib_libXext |  DISTRO  | https://release-monitoring.org/project/001774 | 1.3.5        | 1.3.6        | ORPH
                xlib_libXfixes |  DISTRO  | https://release-monitoring.org/project/001775 | 6.0.1        | 6.0.2        | ORPH
                xlib_libXfont2 |  DISTRO  | https://release-monitoring.org/project/017165 | 2.0.6        | 2.0.7        | ORPH
                   xlib_libXft |  DISTRO  | https://release-monitoring.org/project/001777 | 2.3.8        | 2.3.9        | ORPH
                    xlib_libXi |  DISTRO  | https://release-monitoring.org/project/001778 | 1.8.1        | 1.8.2        | ORPH
                   xlib_libXmu |  DISTRO  | https://release-monitoring.org/project/001785 | 1.1.4        | 1.2.1        | ORPH
              xlib_libXpresent |  DISTRO  | https://release-monitoring.org/project/017166 | 1.0.1        | 1.0.2        |     
                xlib_libXrandr |  DISTRO  | https://release-monitoring.org/project/001788 | 1.5.3        | 1.5.4        | ORPH
               xlib_libXrender |  DISTRO  | https://release-monitoring.org/project/001789 | 0.9.11       | 0.9.12       | ORPH
                  xlib_libXres |  DISTRO  | https://release-monitoring.org/project/001790 | 1.2.2        | 1.2.3        | ORPH
                    xlib_libXt |  DISTRO  | https://release-monitoring.org/project/001793 | 1.3.0        | 1.3.1        | ORPH
                  xlib_libXtst |  DISTRO  | https://release-monitoring.org/project/001794 | 1.2.4        | 1.2.5        | ORPH
                    xlib_libXv |  DISTRO  | https://release-monitoring.org/project/001795 | 1.0.12       | 1.0.13       | ORPH
                  xlib_libXvMC |  DISTRO  | https://release-monitoring.org/project/001796 | 1.0.13       | 1.0.14       | ORPH
               xlib_libXxf86vm |  DISTRO  | https://release-monitoring.org/project/001799 | 1.1.5        | 1.1.6        | ORPH
               xlib_libfontenc |  DISTRO  | https://release-monitoring.org/project/001613 | 1.1.7        | 1.1.8        | ORPH
                  xlib_libxcvt |  DISTRO  | https://release-monitoring.org/project/235147 | 0.1.2        | 0.1.3        | ORPH
               xlib_libxkbfile |  DISTRO  | https://release-monitoring.org/project/001781 | 1.1.2        | 1.1.3        | ORPH
                   xlib_xtrans |  DISTRO  | https://release-monitoring.org/project/013441 | 1.5.0        | 1.6.0        | ORPH
                  xscreensaver |  DISTRO  | https://release-monitoring.org/project/005269 | 6.03         | 6.12         |     
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/007736 | 3.24         | 3.29         | ORPH
              xutil_makedepend |  DISTRO  | https://release-monitoring.org/project/013528 | 1.0.8        | 1.0.9        | ORPH
             xutil_util-macros |  DISTRO  | https://release-monitoring.org/project/015037 | 1.20.0       | 1.20.2       | ORPH
                           yad |  DISTRO  | https://release-monitoring.org/project/005280 | 0.40.0       | 14.1         |     
                            z3 |  DISTRO  | https://release-monitoring.org/project/007812 | 4.15.2       | 4.15.3       |     
                        zabbix |  DISTRO  | https://release-monitoring.org/project/005492 | 7.2.5        | 7.4.2        |     
                        zchunk |  DISTRO  | https://release-monitoring.org/project/178035 | 1.3.2        | 1.5.2        |     
                          zeek |  DISTRO  | https://release-monitoring.org/project/267106 | 4.1.1        | 8.0.1        |     
                       zlib-ng |  DISTRO  | https://release-monitoring.org/project/115592 | 2.2.4        | 2.2.5        | ORPH
                        zoxide |  DISTRO  | https://release-monitoring.org/project/098400 | 0.9.6        | 0.9.8        |     
                       zziplib |  DISTRO  | https://release-monitoring.org/project/013802 | 0.13.74      | 0.13.80      |     

Packages having CVEs
====================

CVEs for the 'master' branch
----------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2025-3891    | https://security-tracker.debian.org/tracker/CVE-2025-3891   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2023-38469   | https://security-tracker.debian.org/tracker/CVE-2023-38469  
                         avahi | CVE-2023-38471   | https://security-tracker.debian.org/tracker/CVE-2023-38471  
                         avahi | CVE-2023-38473   | https://security-tracker.debian.org/tracker/CVE-2023-38473  
                         avahi | CVE-2023-38472   | https://security-tracker.debian.org/tracker/CVE-2023-38472  
                         avahi | CVE-2023-38470   | https://security-tracker.debian.org/tracker/CVE-2023-38470  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
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
                      binutils | CVE-2025-0840    | https://security-tracker.debian.org/tracker/CVE-2025-0840   
           binutils-bare-metal | CVE-2025-8225    | https://security-tracker.debian.org/tracker/CVE-2025-8225   
           binutils-bare-metal | CVE-2025-8224    | https://security-tracker.debian.org/tracker/CVE-2025-8224   
           binutils-bare-metal | CVE-2025-1153    | https://security-tracker.debian.org/tracker/CVE-2025-1153   
           binutils-bare-metal | CVE-2025-3198    | https://security-tracker.debian.org/tracker/CVE-2025-3198   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                         botan | CVE-2024-50382   | https://security-tracker.debian.org/tracker/CVE-2024-50382  
                         botan | CVE-2024-50383   | https://security-tracker.debian.org/tracker/CVE-2024-50383  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          cpio | CVE-2023-7216    | https://security-tracker.debian.org/tracker/CVE-2023-7216   
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dash | CVE-2024-21485   | https://security-tracker.debian.org/tracker/CVE-2024-21485  
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
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
                          dpdk | CVE-2015-1142857 | https://security-tracker.debian.org/tracker/CVE-2015-1142857
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                      easy-rsa | CVE-2024-13454   | https://security-tracker.debian.org/tracker/CVE-2024-13454  
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
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
                         emlog | CVE-2025-47787   | https://security-tracker.debian.org/tracker/CVE-2025-47787  
                         emlog | CVE-2025-47785   | https://security-tracker.debian.org/tracker/CVE-2025-47785  
                         emlog | CVE-2025-47784   | https://security-tracker.debian.org/tracker/CVE-2025-47784  
                         emlog | CVE-2025-30372   | https://security-tracker.debian.org/tracker/CVE-2025-30372  
                         emlog | CVE-2025-5886    | https://security-tracker.debian.org/tracker/CVE-2025-5886   
                        erlang | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                        erlang | CVE-2025-32433   | https://security-tracker.debian.org/tracker/CVE-2025-32433  
                         fastd | CVE-2025-24356   | https://security-tracker.debian.org/tracker/CVE-2025-24356  
                        ffmpeg | CVE-2023-50007   | https://security-tracker.debian.org/tracker/CVE-2023-50007  
                        ffmpeg | CVE-2023-50008   | https://security-tracker.debian.org/tracker/CVE-2023-50008  
                        ffmpeg | CVE-2023-50009   | https://security-tracker.debian.org/tracker/CVE-2023-50009  
                        ffmpeg | CVE-2023-50010   | https://security-tracker.debian.org/tracker/CVE-2023-50010  
                        ffmpeg | CVE-2023-49502   | https://security-tracker.debian.org/tracker/CVE-2023-49502  
                        ffmpeg | CVE-2024-31585   | https://security-tracker.debian.org/tracker/CVE-2024-31585  
                        ffmpeg | CVE-2024-31582   | https://security-tracker.debian.org/tracker/CVE-2024-31582  
                        ffmpeg | CVE-2024-31578   | https://security-tracker.debian.org/tracker/CVE-2024-31578  
                        ffmpeg | CVE-2025-1373    | https://security-tracker.debian.org/tracker/CVE-2025-1373   
                        ffmpeg | CVE-2025-1594    | https://security-tracker.debian.org/tracker/CVE-2025-1594   
                       freerdp | CVE-2024-32662   | https://security-tracker.debian.org/tracker/CVE-2024-32662  
                       freerdp | CVE-2024-32661   | https://security-tracker.debian.org/tracker/CVE-2024-32661  
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                   ghostscript | CVE-2023-38560   | https://security-tracker.debian.org/tracker/CVE-2023-38560  
                        giflib | CVE-2024-45993   | https://security-tracker.debian.org/tracker/CVE-2024-45993  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                        gnupg2 | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                        gnutls | CVE-2025-32990   | https://security-tracker.debian.org/tracker/CVE-2025-32990  
                        gnutls | CVE-2025-32989   | https://security-tracker.debian.org/tracker/CVE-2025-32989  
                        go-bin | CVE-2024-3566    | https://security-tracker.debian.org/tracker/CVE-2024-3566   
                        go-src | CVE-2024-3566    | https://security-tracker.debian.org/tracker/CVE-2024-3566   
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                         grub2 | CVE-2024-2312    | https://security-tracker.debian.org/tracker/CVE-2024-2312   
                    gstreamer1 | CVE-2025-47183   | https://security-tracker.debian.org/tracker/CVE-2025-47183  
                    gstreamer1 | CVE-2025-3887    | https://security-tracker.debian.org/tracker/CVE-2025-3887   
                    gstreamer1 | CVE-2025-47219   | https://security-tracker.debian.org/tracker/CVE-2025-47219  
                    gstreamer1 | CVE-2025-2759    | https://security-tracker.debian.org/tracker/CVE-2025-2759   
                    gstreamer1 | CVE-2025-47808   | https://security-tracker.debian.org/tracker/CVE-2025-47808  
                    gstreamer1 | CVE-2025-47806   | https://security-tracker.debian.org/tracker/CVE-2025-47806  
                    gstreamer1 | CVE-2025-47807   | https://security-tracker.debian.org/tracker/CVE-2025-47807  
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2023-0056    | https://security-tracker.debian.org/tracker/CVE-2023-0056   
                       haproxy | CVE-2023-45539   | https://security-tracker.debian.org/tracker/CVE-2023-45539  
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                        jasper | CVE-2023-51257   | https://security-tracker.debian.org/tracker/CVE-2023-51257  
                         jhead | CVE-2025-44906   | https://security-tracker.debian.org/tracker/CVE-2025-44906  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                       kvmtool | CVE-2021-45464   | https://security-tracker.debian.org/tracker/CVE-2021-45464  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                  libfreeimage | CVE-2023-47997   | https://security-tracker.debian.org/tracker/CVE-2023-47997  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47995   | https://security-tracker.debian.org/tracker/CVE-2023-47995  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2024-31570   | https://security-tracker.debian.org/tracker/CVE-2024-31570  
                  libfreeimage | CVE-2024-9029    | https://security-tracker.debian.org/tracker/CVE-2024-9029   
                      libglib2 | CVE-2025-6052    | https://security-tracker.debian.org/tracker/CVE-2025-6052   
            libglib2-bootstrap | CVE-2025-6052    | https://security-tracker.debian.org/tracker/CVE-2025-6052   
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                        libssh | CVE-2025-5987    | https://security-tracker.debian.org/tracker/CVE-2025-5987   
                        libssh | CVE-2025-5318    | https://security-tracker.debian.org/tracker/CVE-2025-5318   
                        libssh | CVE-2025-8114    | https://security-tracker.debian.org/tracker/CVE-2025-8114   
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libvirt | CVE-2023-3750    | https://security-tracker.debian.org/tracker/CVE-2023-3750   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                       libxslt | CVE-2025-7424    | https://security-tracker.debian.org/tracker/CVE-2025-7424   
                     linux-pam | CVE-2024-10041   | https://security-tracker.debian.org/tracker/CVE-2024-10041  
                       log4cxx | CVE-2025-54812   | https://security-tracker.debian.org/tracker/CVE-2025-54812  
                       log4cxx | CVE-2025-54813   | https://security-tracker.debian.org/tracker/CVE-2025-54813  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                        mender | CVE-2024-46948   | https://security-tracker.debian.org/tracker/CVE-2024-46948  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33717   | https://security-tracker.debian.org/tracker/CVE-2023-33717  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mp4v2 | CVE-2023-33718   | https://security-tracker.debian.org/tracker/CVE-2023-33718  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          mutt | CVE-2024-49393   | https://security-tracker.debian.org/tracker/CVE-2024-49393  
                          mutt | CVE-2024-49395   | https://security-tracker.debian.org/tracker/CVE-2024-49395  
                          mutt | CVE-2024-49394   | https://security-tracker.debian.org/tracker/CVE-2024-49394  
                       netdata | CVE-2023-22497   | https://security-tracker.debian.org/tracker/CVE-2023-22497  
                       netdata | CVE-2023-22496   | https://security-tracker.debian.org/tracker/CVE-2023-22496  
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7848    | https://security-tracker.debian.org/tracker/CVE-2015-7848   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
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
                      openjpeg | CVE-2023-39328   | https://security-tracker.debian.org/tracker/CVE-2023-39328  
                      openjpeg | CVE-2023-39329   | https://security-tracker.debian.org/tracker/CVE-2023-39329  
                      openjpeg | CVE-2023-39327   | https://security-tracker.debian.org/tracker/CVE-2023-39327  
                        opensc | CVE-2024-8443    | https://security-tracker.debian.org/tracker/CVE-2024-8443   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
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
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                        podman | CVE-2022-2989    | https://security-tracker.debian.org/tracker/CVE-2022-2989   
                        podman | CVE-2023-0778    | https://security-tracker.debian.org/tracker/CVE-2023-0778   
                       poppler | CVE-2024-6239    | https://security-tracker.debian.org/tracker/CVE-2024-6239   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                    pulseaudio | CVE-2024-11586   | https://security-tracker.debian.org/tracker/CVE-2024-11586  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-uvicorn | CVE-2020-7694    | https://security-tracker.debian.org/tracker/CVE-2020-7694   
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-2680    | https://security-tracker.debian.org/tracker/CVE-2023-2680   
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2024-8354    | https://security-tracker.debian.org/tracker/CVE-2024-8354   
                          qemu | CVE-2024-6505    | https://security-tracker.debian.org/tracker/CVE-2024-6505   
                          qemu | CVE-2024-6519    | https://security-tracker.debian.org/tracker/CVE-2024-6519   
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
                        shadow | CVE-2013-4235    | https://security-tracker.debian.org/tracker/CVE-2013-4235   
                        skopeo | CVE-2019-10214   | https://security-tracker.debian.org/tracker/CVE-2019-10214  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                          sudo | CVE-2025-32463   | https://security-tracker.debian.org/tracker/CVE-2025-32463  
                          sudo | CVE-2025-32462   | https://security-tracker.debian.org/tracker/CVE-2025-32462  
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
                      suricata | CVE-2024-37151   | https://security-tracker.debian.org/tracker/CVE-2024-37151  
                      suricata | CVE-2024-38536   | https://security-tracker.debian.org/tracker/CVE-2024-38536  
                      suricata | CVE-2024-38535   | https://security-tracker.debian.org/tracker/CVE-2024-38535  
                      suricata | CVE-2024-38534   | https://security-tracker.debian.org/tracker/CVE-2024-38534  
                      suricata | CVE-2025-29915   | https://security-tracker.debian.org/tracker/CVE-2025-29915  
                      suricata | CVE-2025-29918   | https://security-tracker.debian.org/tracker/CVE-2025-29918  
                      suricata | CVE-2025-29916   | https://security-tracker.debian.org/tracker/CVE-2025-29916  
                      suricata | CVE-2025-29917   | https://security-tracker.debian.org/tracker/CVE-2025-29917  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                          tiff | CVE-2023-6277    | https://security-tracker.debian.org/tracker/CVE-2023-6277   
                          tiff | CVE-2023-6228    | https://security-tracker.debian.org/tracker/CVE-2023-6228   
                          tiff | CVE-2023-52356   | https://security-tracker.debian.org/tracker/CVE-2023-52356  
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                      tpm2-tss | CVE-2023-22745   | https://security-tracker.debian.org/tracker/CVE-2023-22745  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                      unixodbc | CVE-2024-1013    | https://security-tracker.debian.org/tracker/CVE-2024-1013   
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                wpa_supplicant | CVE-2024-5290    | https://security-tracker.debian.org/tracker/CVE-2024-5290   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
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
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-40982   | https://security-tracker.debian.org/tracker/CVE-2022-40982  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-4949    | https://security-tracker.debian.org/tracker/CVE-2022-4949   
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-4949    | https://security-tracker.debian.org/tracker/CVE-2023-4949   
                           xen | CVE-2023-20588   | https://security-tracker.debian.org/tracker/CVE-2023-20588  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46841   | https://security-tracker.debian.org/tracker/CVE-2023-46841  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34324   | https://security-tracker.debian.org/tracker/CVE-2023-34324  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                           xen | CVE-2024-45818   | https://security-tracker.debian.org/tracker/CVE-2024-45818  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                        xerces | CVE-2018-1311    | https://security-tracker.debian.org/tracker/CVE-2018-1311   
                        xerces | CVE-2024-23807   | https://security-tracker.debian.org/tracker/CVE-2024-23807  
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
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the 'next' branch
--------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2025-3891    | https://security-tracker.debian.org/tracker/CVE-2025-3891   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2023-38469   | https://security-tracker.debian.org/tracker/CVE-2023-38469  
                         avahi | CVE-2023-38471   | https://security-tracker.debian.org/tracker/CVE-2023-38471  
                         avahi | CVE-2023-38473   | https://security-tracker.debian.org/tracker/CVE-2023-38473  
                         avahi | CVE-2023-38472   | https://security-tracker.debian.org/tracker/CVE-2023-38472  
                         avahi | CVE-2023-38470   | https://security-tracker.debian.org/tracker/CVE-2023-38470  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
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
                      binutils | CVE-2025-0840    | https://security-tracker.debian.org/tracker/CVE-2025-0840   
           binutils-bare-metal | CVE-2025-8225    | https://security-tracker.debian.org/tracker/CVE-2025-8225   
           binutils-bare-metal | CVE-2025-8224    | https://security-tracker.debian.org/tracker/CVE-2025-8224   
           binutils-bare-metal | CVE-2025-1153    | https://security-tracker.debian.org/tracker/CVE-2025-1153   
           binutils-bare-metal | CVE-2025-3198    | https://security-tracker.debian.org/tracker/CVE-2025-3198   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                         botan | CVE-2024-50382   | https://security-tracker.debian.org/tracker/CVE-2024-50382  
                         botan | CVE-2024-50383   | https://security-tracker.debian.org/tracker/CVE-2024-50383  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          cpio | CVE-2023-7216    | https://security-tracker.debian.org/tracker/CVE-2023-7216   
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dash | CVE-2024-21485   | https://security-tracker.debian.org/tracker/CVE-2024-21485  
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
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
                          dpdk | CVE-2015-1142857 | https://security-tracker.debian.org/tracker/CVE-2015-1142857
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                      easy-rsa | CVE-2024-13454   | https://security-tracker.debian.org/tracker/CVE-2024-13454  
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
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
                         emlog | CVE-2025-47787   | https://security-tracker.debian.org/tracker/CVE-2025-47787  
                         emlog | CVE-2025-47785   | https://security-tracker.debian.org/tracker/CVE-2025-47785  
                         emlog | CVE-2025-47784   | https://security-tracker.debian.org/tracker/CVE-2025-47784  
                         emlog | CVE-2025-30372   | https://security-tracker.debian.org/tracker/CVE-2025-30372  
                         emlog | CVE-2025-5886    | https://security-tracker.debian.org/tracker/CVE-2025-5886   
                        erlang | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                        erlang | CVE-2025-32433   | https://security-tracker.debian.org/tracker/CVE-2025-32433  
                         exiv2 | CVE-2025-54080   | https://security-tracker.debian.org/tracker/CVE-2025-54080  
                         exiv2 | CVE-2025-55304   | https://security-tracker.debian.org/tracker/CVE-2025-55304  
                         fastd | CVE-2025-24356   | https://security-tracker.debian.org/tracker/CVE-2025-24356  
                        ffmpeg | CVE-2023-50007   | https://security-tracker.debian.org/tracker/CVE-2023-50007  
                        ffmpeg | CVE-2023-50008   | https://security-tracker.debian.org/tracker/CVE-2023-50008  
                        ffmpeg | CVE-2023-50009   | https://security-tracker.debian.org/tracker/CVE-2023-50009  
                        ffmpeg | CVE-2023-50010   | https://security-tracker.debian.org/tracker/CVE-2023-50010  
                        ffmpeg | CVE-2023-49502   | https://security-tracker.debian.org/tracker/CVE-2023-49502  
                        ffmpeg | CVE-2024-31585   | https://security-tracker.debian.org/tracker/CVE-2024-31585  
                        ffmpeg | CVE-2024-31582   | https://security-tracker.debian.org/tracker/CVE-2024-31582  
                        ffmpeg | CVE-2024-31578   | https://security-tracker.debian.org/tracker/CVE-2024-31578  
                        ffmpeg | CVE-2025-1373    | https://security-tracker.debian.org/tracker/CVE-2025-1373   
                        ffmpeg | CVE-2025-1594    | https://security-tracker.debian.org/tracker/CVE-2025-1594   
                       freerdp | CVE-2024-32662   | https://security-tracker.debian.org/tracker/CVE-2024-32662  
                       freerdp | CVE-2024-32661   | https://security-tracker.debian.org/tracker/CVE-2024-32661  
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                   ghostscript | CVE-2023-38560   | https://security-tracker.debian.org/tracker/CVE-2023-38560  
                        giflib | CVE-2024-45993   | https://security-tracker.debian.org/tracker/CVE-2024-45993  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                        gnupg2 | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                        gnutls | CVE-2025-32990   | https://security-tracker.debian.org/tracker/CVE-2025-32990  
                        gnutls | CVE-2025-32989   | https://security-tracker.debian.org/tracker/CVE-2025-32989  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                         grub2 | CVE-2024-56737   | https://security-tracker.debian.org/tracker/CVE-2024-56737  
                         grub2 | CVE-2024-56738   | https://security-tracker.debian.org/tracker/CVE-2024-56738  
                         grub2 | CVE-2024-45778   | https://security-tracker.debian.org/tracker/CVE-2024-45778  
                         grub2 | CVE-2024-45777   | https://security-tracker.debian.org/tracker/CVE-2024-45777  
                         grub2 | CVE-2024-45782   | https://security-tracker.debian.org/tracker/CVE-2024-45782  
                         grub2 | CVE-2024-45779   | https://security-tracker.debian.org/tracker/CVE-2024-45779  
                         grub2 | CVE-2024-45780   | https://security-tracker.debian.org/tracker/CVE-2024-45780  
                         grub2 | CVE-2024-2312    | https://security-tracker.debian.org/tracker/CVE-2024-2312   
                         grub2 | CVE-2025-1125    | https://security-tracker.debian.org/tracker/CVE-2025-1125   
                         grub2 | CVE-2025-0684    | https://security-tracker.debian.org/tracker/CVE-2025-0684   
                         grub2 | CVE-2025-0678    | https://security-tracker.debian.org/tracker/CVE-2025-0678   
                         grub2 | CVE-2025-0689    | https://security-tracker.debian.org/tracker/CVE-2025-0689   
                         grub2 | CVE-2025-0686    | https://security-tracker.debian.org/tracker/CVE-2025-0686   
                         grub2 | CVE-2025-0685    | https://security-tracker.debian.org/tracker/CVE-2025-0685   
                    gstreamer1 | CVE-2025-47183   | https://security-tracker.debian.org/tracker/CVE-2025-47183  
                    gstreamer1 | CVE-2025-3887    | https://security-tracker.debian.org/tracker/CVE-2025-3887   
                    gstreamer1 | CVE-2025-47219   | https://security-tracker.debian.org/tracker/CVE-2025-47219  
                    gstreamer1 | CVE-2025-2759    | https://security-tracker.debian.org/tracker/CVE-2025-2759   
                    gstreamer1 | CVE-2025-47808   | https://security-tracker.debian.org/tracker/CVE-2025-47808  
                    gstreamer1 | CVE-2025-47806   | https://security-tracker.debian.org/tracker/CVE-2025-47806  
                    gstreamer1 | CVE-2025-47807   | https://security-tracker.debian.org/tracker/CVE-2025-47807  
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2023-0056    | https://security-tracker.debian.org/tracker/CVE-2023-0056   
                       haproxy | CVE-2023-45539   | https://security-tracker.debian.org/tracker/CVE-2023-45539  
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2023-5341    | https://security-tracker.debian.org/tracker/CVE-2023-5341   
                   imagemagick | CVE-2025-55160   | https://security-tracker.debian.org/tracker/CVE-2025-55160  
                   imagemagick | CVE-2025-55154   | https://security-tracker.debian.org/tracker/CVE-2025-55154  
                   imagemagick | CVE-2025-53015   | https://security-tracker.debian.org/tracker/CVE-2025-53015  
                   imagemagick | CVE-2025-53014   | https://security-tracker.debian.org/tracker/CVE-2025-53014  
                   imagemagick | CVE-2025-53019   | https://security-tracker.debian.org/tracker/CVE-2025-53019  
                   imagemagick | CVE-2025-55005   | https://security-tracker.debian.org/tracker/CVE-2025-55005  
                   imagemagick | CVE-2025-55004   | https://security-tracker.debian.org/tracker/CVE-2025-55004  
                   imagemagick | CVE-2025-53101   | https://security-tracker.debian.org/tracker/CVE-2025-53101  
                   imagemagick | CVE-2025-55212   | https://security-tracker.debian.org/tracker/CVE-2025-55212  
                   imagemagick | CVE-2025-55298   | https://security-tracker.debian.org/tracker/CVE-2025-55298  
                   imagemagick | CVE-2025-57803   | https://security-tracker.debian.org/tracker/CVE-2025-57803  
                        jasper | CVE-2023-51257   | https://security-tracker.debian.org/tracker/CVE-2023-51257  
                         jhead | CVE-2025-44906   | https://security-tracker.debian.org/tracker/CVE-2025-44906  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                       kvmtool | CVE-2021-45464   | https://security-tracker.debian.org/tracker/CVE-2021-45464  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                  libfreeimage | CVE-2023-47997   | https://security-tracker.debian.org/tracker/CVE-2023-47997  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47995   | https://security-tracker.debian.org/tracker/CVE-2023-47995  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2024-31570   | https://security-tracker.debian.org/tracker/CVE-2024-31570  
                  libfreeimage | CVE-2024-9029    | https://security-tracker.debian.org/tracker/CVE-2024-9029   
                      libglib2 | CVE-2025-6052    | https://security-tracker.debian.org/tracker/CVE-2025-6052   
            libglib2-bootstrap | CVE-2025-6052    | https://security-tracker.debian.org/tracker/CVE-2025-6052   
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                        libssh | CVE-2025-5987    | https://security-tracker.debian.org/tracker/CVE-2025-5987   
                        libssh | CVE-2025-5318    | https://security-tracker.debian.org/tracker/CVE-2025-5318   
                        libssh | CVE-2025-8114    | https://security-tracker.debian.org/tracker/CVE-2025-8114   
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libvirt | CVE-2023-3750    | https://security-tracker.debian.org/tracker/CVE-2023-3750   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                       libxslt | CVE-2025-7424    | https://security-tracker.debian.org/tracker/CVE-2025-7424   
                     linux-pam | CVE-2024-10041   | https://security-tracker.debian.org/tracker/CVE-2024-10041  
                       log4cxx | CVE-2025-54812   | https://security-tracker.debian.org/tracker/CVE-2025-54812  
                       log4cxx | CVE-2025-54813   | https://security-tracker.debian.org/tracker/CVE-2025-54813  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                        mender | CVE-2024-46948   | https://security-tracker.debian.org/tracker/CVE-2024-46948  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33717   | https://security-tracker.debian.org/tracker/CVE-2023-33717  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mp4v2 | CVE-2023-33718   | https://security-tracker.debian.org/tracker/CVE-2023-33718  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          mutt | CVE-2024-49393   | https://security-tracker.debian.org/tracker/CVE-2024-49393  
                          mutt | CVE-2024-49395   | https://security-tracker.debian.org/tracker/CVE-2024-49395  
                          mutt | CVE-2024-49394   | https://security-tracker.debian.org/tracker/CVE-2024-49394  
                       netdata | CVE-2023-22497   | https://security-tracker.debian.org/tracker/CVE-2023-22497  
                       netdata | CVE-2023-22496   | https://security-tracker.debian.org/tracker/CVE-2023-22496  
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7848    | https://security-tracker.debian.org/tracker/CVE-2015-7848   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                         ofono | CVE-2023-2794    | https://security-tracker.debian.org/tracker/CVE-2023-2794   
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
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
                      openjpeg | CVE-2023-39328   | https://security-tracker.debian.org/tracker/CVE-2023-39328  
                      openjpeg | CVE-2023-39329   | https://security-tracker.debian.org/tracker/CVE-2023-39329  
                      openjpeg | CVE-2023-39327   | https://security-tracker.debian.org/tracker/CVE-2023-39327  
                        opensc | CVE-2024-8443    | https://security-tracker.debian.org/tracker/CVE-2024-8443   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
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
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                        podman | CVE-2022-2989    | https://security-tracker.debian.org/tracker/CVE-2022-2989   
                        podman | CVE-2023-0778    | https://security-tracker.debian.org/tracker/CVE-2023-0778   
                       poppler | CVE-2024-6239    | https://security-tracker.debian.org/tracker/CVE-2024-6239   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                       proftpd | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                    pulseaudio | CVE-2024-11586   | https://security-tracker.debian.org/tracker/CVE-2024-11586  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-uvicorn | CVE-2020-7694    | https://security-tracker.debian.org/tracker/CVE-2020-7694   
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-2680    | https://security-tracker.debian.org/tracker/CVE-2023-2680   
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2024-8354    | https://security-tracker.debian.org/tracker/CVE-2024-8354   
                          qemu | CVE-2024-6505    | https://security-tracker.debian.org/tracker/CVE-2024-6505   
                          qemu | CVE-2024-6519    | https://security-tracker.debian.org/tracker/CVE-2024-6519   
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
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
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
                        shadow | CVE-2013-4235    | https://security-tracker.debian.org/tracker/CVE-2013-4235   
                        skopeo | CVE-2019-10214   | https://security-tracker.debian.org/tracker/CVE-2019-10214  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                        sqlite | CVE-2025-6965    | https://security-tracker.debian.org/tracker/CVE-2025-6965   
                          sudo | CVE-2025-32463   | https://security-tracker.debian.org/tracker/CVE-2025-32463  
                          sudo | CVE-2025-32462   | https://security-tracker.debian.org/tracker/CVE-2025-32462  
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
                      suricata | CVE-2024-37151   | https://security-tracker.debian.org/tracker/CVE-2024-37151  
                      suricata | CVE-2024-38536   | https://security-tracker.debian.org/tracker/CVE-2024-38536  
                      suricata | CVE-2024-38535   | https://security-tracker.debian.org/tracker/CVE-2024-38535  
                      suricata | CVE-2024-38534   | https://security-tracker.debian.org/tracker/CVE-2024-38534  
                      suricata | CVE-2025-29915   | https://security-tracker.debian.org/tracker/CVE-2025-29915  
                      suricata | CVE-2025-29918   | https://security-tracker.debian.org/tracker/CVE-2025-29918  
                      suricata | CVE-2025-29916   | https://security-tracker.debian.org/tracker/CVE-2025-29916  
                      suricata | CVE-2025-29917   | https://security-tracker.debian.org/tracker/CVE-2025-29917  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2023-6277    | https://security-tracker.debian.org/tracker/CVE-2023-6277   
                          tiff | CVE-2023-6228    | https://security-tracker.debian.org/tracker/CVE-2023-6228   
                          tiff | CVE-2023-52356   | https://security-tracker.debian.org/tracker/CVE-2023-52356  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                      tpm2-tss | CVE-2023-22745   | https://security-tracker.debian.org/tracker/CVE-2023-22745  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                      unixodbc | CVE-2024-1013    | https://security-tracker.debian.org/tracker/CVE-2024-1013   
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           vim | CVE-2024-41965   | https://security-tracker.debian.org/tracker/CVE-2024-41965  
                           vim | CVE-2024-41957   | https://security-tracker.debian.org/tracker/CVE-2024-41957  
                           vim | CVE-2024-43374   | https://security-tracker.debian.org/tracker/CVE-2024-43374  
                           vim | CVE-2024-45306   | https://security-tracker.debian.org/tracker/CVE-2024-45306  
                           vim | CVE-2024-47814   | https://security-tracker.debian.org/tracker/CVE-2024-47814  
                           vim | CVE-2025-1215    | https://security-tracker.debian.org/tracker/CVE-2025-1215   
                           vim | CVE-2025-53906   | https://security-tracker.debian.org/tracker/CVE-2025-53906  
                           vim | CVE-2025-53905   | https://security-tracker.debian.org/tracker/CVE-2025-53905  
                           vim | CVE-2025-22134   | https://security-tracker.debian.org/tracker/CVE-2025-22134  
                           vim | CVE-2025-24014   | https://security-tracker.debian.org/tracker/CVE-2025-24014  
                           vim | CVE-2025-26603   | https://security-tracker.debian.org/tracker/CVE-2025-26603  
                           vim | CVE-2025-29768   | https://security-tracker.debian.org/tracker/CVE-2025-29768  
                  vorbis-tools | CVE-2023-43361   | https://security-tracker.debian.org/tracker/CVE-2023-43361  
                wpa_supplicant | CVE-2024-5290    | https://security-tracker.debian.org/tracker/CVE-2024-5290   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
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
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-40982   | https://security-tracker.debian.org/tracker/CVE-2022-40982  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-4949    | https://security-tracker.debian.org/tracker/CVE-2022-4949   
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-4949    | https://security-tracker.debian.org/tracker/CVE-2023-4949   
                           xen | CVE-2023-20588   | https://security-tracker.debian.org/tracker/CVE-2023-20588  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46841   | https://security-tracker.debian.org/tracker/CVE-2023-46841  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34324   | https://security-tracker.debian.org/tracker/CVE-2023-34324  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                           xen | CVE-2024-45818   | https://security-tracker.debian.org/tracker/CVE-2024-45818  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                        xerces | CVE-2018-1311    | https://security-tracker.debian.org/tracker/CVE-2018-1311   
                        xerces | CVE-2024-23807   | https://security-tracker.debian.org/tracker/CVE-2024-23807  
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
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2025.02.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2025-3891    | https://security-tracker.debian.org/tracker/CVE-2025-3891   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2023-38469   | https://security-tracker.debian.org/tracker/CVE-2023-38469  
                         avahi | CVE-2023-38471   | https://security-tracker.debian.org/tracker/CVE-2023-38471  
                         avahi | CVE-2023-38473   | https://security-tracker.debian.org/tracker/CVE-2023-38473  
                         avahi | CVE-2023-38472   | https://security-tracker.debian.org/tracker/CVE-2023-38472  
                         avahi | CVE-2023-38470   | https://security-tracker.debian.org/tracker/CVE-2023-38470  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
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
                      binutils | CVE-2025-0840    | https://security-tracker.debian.org/tracker/CVE-2025-0840   
           binutils-bare-metal | CVE-2025-8225    | https://security-tracker.debian.org/tracker/CVE-2025-8225   
           binutils-bare-metal | CVE-2025-8224    | https://security-tracker.debian.org/tracker/CVE-2025-8224   
           binutils-bare-metal | CVE-2025-1153    | https://security-tracker.debian.org/tracker/CVE-2025-1153   
           binutils-bare-metal | CVE-2025-3198    | https://security-tracker.debian.org/tracker/CVE-2025-3198   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                         botan | CVE-2024-50382   | https://security-tracker.debian.org/tracker/CVE-2024-50382  
                         botan | CVE-2024-50383   | https://security-tracker.debian.org/tracker/CVE-2024-50383  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          cpio | CVE-2023-7216    | https://security-tracker.debian.org/tracker/CVE-2023-7216   
                   cpp-httplib | CVE-2025-46728   | https://security-tracker.debian.org/tracker/CVE-2025-46728  
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dash | CVE-2024-21485   | https://security-tracker.debian.org/tracker/CVE-2024-21485  
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
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
                          dpdk | CVE-2015-1142857 | https://security-tracker.debian.org/tracker/CVE-2015-1142857
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                      easy-rsa | CVE-2024-13454   | https://security-tracker.debian.org/tracker/CVE-2024-13454  
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
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
                         emlog | CVE-2025-47787   | https://security-tracker.debian.org/tracker/CVE-2025-47787  
                         emlog | CVE-2025-47785   | https://security-tracker.debian.org/tracker/CVE-2025-47785  
                         emlog | CVE-2025-47784   | https://security-tracker.debian.org/tracker/CVE-2025-47784  
                         emlog | CVE-2025-30372   | https://security-tracker.debian.org/tracker/CVE-2025-30372  
                         emlog | CVE-2025-5886    | https://security-tracker.debian.org/tracker/CVE-2025-5886   
                        erlang | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                        erlang | CVE-2025-32433   | https://security-tracker.debian.org/tracker/CVE-2025-32433  
                         exiv2 | CVE-2025-54080   | https://security-tracker.debian.org/tracker/CVE-2025-54080  
                         exiv2 | CVE-2025-55304   | https://security-tracker.debian.org/tracker/CVE-2025-55304  
                         fastd | CVE-2025-24356   | https://security-tracker.debian.org/tracker/CVE-2025-24356  
                        ffmpeg | CVE-2023-50007   | https://security-tracker.debian.org/tracker/CVE-2023-50007  
                        ffmpeg | CVE-2023-50008   | https://security-tracker.debian.org/tracker/CVE-2023-50008  
                        ffmpeg | CVE-2023-50009   | https://security-tracker.debian.org/tracker/CVE-2023-50009  
                        ffmpeg | CVE-2023-50010   | https://security-tracker.debian.org/tracker/CVE-2023-50010  
                        ffmpeg | CVE-2023-49502   | https://security-tracker.debian.org/tracker/CVE-2023-49502  
                        ffmpeg | CVE-2024-31585   | https://security-tracker.debian.org/tracker/CVE-2024-31585  
                        ffmpeg | CVE-2024-31582   | https://security-tracker.debian.org/tracker/CVE-2024-31582  
                        ffmpeg | CVE-2024-31578   | https://security-tracker.debian.org/tracker/CVE-2024-31578  
                        ffmpeg | CVE-2025-1373    | https://security-tracker.debian.org/tracker/CVE-2025-1373   
                        ffmpeg | CVE-2025-1594    | https://security-tracker.debian.org/tracker/CVE-2025-1594   
                       freerdp | CVE-2024-32662   | https://security-tracker.debian.org/tracker/CVE-2024-32662  
                       freerdp | CVE-2024-32661   | https://security-tracker.debian.org/tracker/CVE-2024-32661  
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                   ghostscript | CVE-2023-38560   | https://security-tracker.debian.org/tracker/CVE-2023-38560  
                        giflib | CVE-2024-45993   | https://security-tracker.debian.org/tracker/CVE-2024-45993  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                        gnupg2 | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                        gnutls | CVE-2025-32990   | https://security-tracker.debian.org/tracker/CVE-2025-32990  
                        gnutls | CVE-2025-32989   | https://security-tracker.debian.org/tracker/CVE-2025-32989  
                        go-bin | CVE-2024-3566    | https://security-tracker.debian.org/tracker/CVE-2024-3566   
                        go-src | CVE-2024-3566    | https://security-tracker.debian.org/tracker/CVE-2024-3566   
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                         grub2 | CVE-2024-2312    | https://security-tracker.debian.org/tracker/CVE-2024-2312   
                    gstreamer1 | CVE-2025-47183   | https://security-tracker.debian.org/tracker/CVE-2025-47183  
                    gstreamer1 | CVE-2025-3887    | https://security-tracker.debian.org/tracker/CVE-2025-3887   
                    gstreamer1 | CVE-2025-47219   | https://security-tracker.debian.org/tracker/CVE-2025-47219  
                    gstreamer1 | CVE-2025-2759    | https://security-tracker.debian.org/tracker/CVE-2025-2759   
                    gstreamer1 | CVE-2025-47808   | https://security-tracker.debian.org/tracker/CVE-2025-47808  
                    gstreamer1 | CVE-2025-47806   | https://security-tracker.debian.org/tracker/CVE-2025-47806  
                    gstreamer1 | CVE-2025-47807   | https://security-tracker.debian.org/tracker/CVE-2025-47807  
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2023-0056    | https://security-tracker.debian.org/tracker/CVE-2023-0056   
                       haproxy | CVE-2023-45539   | https://security-tracker.debian.org/tracker/CVE-2023-45539  
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2023-5341    | https://security-tracker.debian.org/tracker/CVE-2023-5341   
                   imagemagick | CVE-2025-55160   | https://security-tracker.debian.org/tracker/CVE-2025-55160  
                   imagemagick | CVE-2025-55154   | https://security-tracker.debian.org/tracker/CVE-2025-55154  
                   imagemagick | CVE-2025-53015   | https://security-tracker.debian.org/tracker/CVE-2025-53015  
                   imagemagick | CVE-2025-53014   | https://security-tracker.debian.org/tracker/CVE-2025-53014  
                   imagemagick | CVE-2025-53019   | https://security-tracker.debian.org/tracker/CVE-2025-53019  
                   imagemagick | CVE-2025-55005   | https://security-tracker.debian.org/tracker/CVE-2025-55005  
                   imagemagick | CVE-2025-55004   | https://security-tracker.debian.org/tracker/CVE-2025-55004  
                   imagemagick | CVE-2025-53101   | https://security-tracker.debian.org/tracker/CVE-2025-53101  
                   imagemagick | CVE-2025-55212   | https://security-tracker.debian.org/tracker/CVE-2025-55212  
                   imagemagick | CVE-2025-55298   | https://security-tracker.debian.org/tracker/CVE-2025-55298  
                   imagemagick | CVE-2025-57803   | https://security-tracker.debian.org/tracker/CVE-2025-57803  
                        jasper | CVE-2023-51257   | https://security-tracker.debian.org/tracker/CVE-2023-51257  
                         jhead | CVE-2025-44906   | https://security-tracker.debian.org/tracker/CVE-2025-44906  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                       kvmtool | CVE-2021-45464   | https://security-tracker.debian.org/tracker/CVE-2021-45464  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                  libfreeimage | CVE-2023-47997   | https://security-tracker.debian.org/tracker/CVE-2023-47997  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47995   | https://security-tracker.debian.org/tracker/CVE-2023-47995  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2024-31570   | https://security-tracker.debian.org/tracker/CVE-2024-31570  
                  libfreeimage | CVE-2024-9029    | https://security-tracker.debian.org/tracker/CVE-2024-9029   
                      libglib2 | CVE-2025-4056    | https://security-tracker.debian.org/tracker/CVE-2025-4056   
            libglib2-bootstrap | CVE-2025-6052    | https://security-tracker.debian.org/tracker/CVE-2025-6052   
            libglib2-bootstrap | CVE-2025-4056    | https://security-tracker.debian.org/tracker/CVE-2025-4056   
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                        libssh | CVE-2025-5987    | https://security-tracker.debian.org/tracker/CVE-2025-5987   
                        libssh | CVE-2025-5318    | https://security-tracker.debian.org/tracker/CVE-2025-5318   
                        libssh | CVE-2025-8114    | https://security-tracker.debian.org/tracker/CVE-2025-8114   
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libvirt | CVE-2023-3750    | https://security-tracker.debian.org/tracker/CVE-2023-3750   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                       libxslt | CVE-2025-7424    | https://security-tracker.debian.org/tracker/CVE-2025-7424   
                     linux-pam | CVE-2024-10041   | https://security-tracker.debian.org/tracker/CVE-2024-10041  
                       log4cxx | CVE-2025-54812   | https://security-tracker.debian.org/tracker/CVE-2025-54812  
                       log4cxx | CVE-2025-54813   | https://security-tracker.debian.org/tracker/CVE-2025-54813  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                        mender | CVE-2024-46948   | https://security-tracker.debian.org/tracker/CVE-2024-46948  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33717   | https://security-tracker.debian.org/tracker/CVE-2023-33717  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mp4v2 | CVE-2023-33718   | https://security-tracker.debian.org/tracker/CVE-2023-33718  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          mutt | CVE-2024-49393   | https://security-tracker.debian.org/tracker/CVE-2024-49393  
                          mutt | CVE-2024-49395   | https://security-tracker.debian.org/tracker/CVE-2024-49395  
                          mutt | CVE-2024-49394   | https://security-tracker.debian.org/tracker/CVE-2024-49394  
                       netdata | CVE-2023-22497   | https://security-tracker.debian.org/tracker/CVE-2023-22497  
                       netdata | CVE-2023-22496   | https://security-tracker.debian.org/tracker/CVE-2023-22496  
                       netsnmp | CVE-2022-44793   | https://security-tracker.debian.org/tracker/CVE-2022-44793  
                       netsnmp | CVE-2022-44792   | https://security-tracker.debian.org/tracker/CVE-2022-44792  
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7848    | https://security-tracker.debian.org/tracker/CVE-2015-7848   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
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
                      openjpeg | CVE-2023-39328   | https://security-tracker.debian.org/tracker/CVE-2023-39328  
                      openjpeg | CVE-2023-39329   | https://security-tracker.debian.org/tracker/CVE-2023-39329  
                      openjpeg | CVE-2023-39327   | https://security-tracker.debian.org/tracker/CVE-2023-39327  
                        opensc | CVE-2024-8443    | https://security-tracker.debian.org/tracker/CVE-2024-8443   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                       openssh | CVE-2025-26465   | https://security-tracker.debian.org/tracker/CVE-2025-26465  
                       openssh | CVE-2025-26466   | https://security-tracker.debian.org/tracker/CVE-2025-26466  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
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
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                       poppler | CVE-2024-6239    | https://security-tracker.debian.org/tracker/CVE-2024-6239   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                       proftpd | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                    pulseaudio | CVE-2024-11586   | https://security-tracker.debian.org/tracker/CVE-2024-11586  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-uvicorn | CVE-2020-7694    | https://security-tracker.debian.org/tracker/CVE-2020-7694   
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-2680    | https://security-tracker.debian.org/tracker/CVE-2023-2680   
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2024-8354    | https://security-tracker.debian.org/tracker/CVE-2024-8354   
                          qemu | CVE-2024-6505    | https://security-tracker.debian.org/tracker/CVE-2024-6505   
                          qemu | CVE-2024-6519    | https://security-tracker.debian.org/tracker/CVE-2024-6519   
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
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
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
                        shadow | CVE-2013-4235    | https://security-tracker.debian.org/tracker/CVE-2013-4235   
                        skopeo | CVE-2019-10214   | https://security-tracker.debian.org/tracker/CVE-2019-10214  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                        sqlite | CVE-2025-6965    | https://security-tracker.debian.org/tracker/CVE-2025-6965   
                          sudo | CVE-2025-32463   | https://security-tracker.debian.org/tracker/CVE-2025-32463  
                          sudo | CVE-2025-32462   | https://security-tracker.debian.org/tracker/CVE-2025-32462  
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
                      suricata | CVE-2024-37151   | https://security-tracker.debian.org/tracker/CVE-2024-37151  
                      suricata | CVE-2024-38536   | https://security-tracker.debian.org/tracker/CVE-2024-38536  
                      suricata | CVE-2024-38535   | https://security-tracker.debian.org/tracker/CVE-2024-38535  
                      suricata | CVE-2024-38534   | https://security-tracker.debian.org/tracker/CVE-2024-38534  
                      suricata | CVE-2025-29915   | https://security-tracker.debian.org/tracker/CVE-2025-29915  
                      suricata | CVE-2025-29918   | https://security-tracker.debian.org/tracker/CVE-2025-29918  
                      suricata | CVE-2025-29916   | https://security-tracker.debian.org/tracker/CVE-2025-29916  
                      suricata | CVE-2025-29917   | https://security-tracker.debian.org/tracker/CVE-2025-29917  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                          tiff | CVE-2023-6277    | https://security-tracker.debian.org/tracker/CVE-2023-6277   
                          tiff | CVE-2023-6228    | https://security-tracker.debian.org/tracker/CVE-2023-6228   
                          tiff | CVE-2023-52356   | https://security-tracker.debian.org/tracker/CVE-2023-52356  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                      tpm2-tss | CVE-2023-22745   | https://security-tracker.debian.org/tracker/CVE-2023-22745  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                      unixodbc | CVE-2024-1013    | https://security-tracker.debian.org/tracker/CVE-2024-1013   
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                     wireshark | CVE-2025-5601    | https://security-tracker.debian.org/tracker/CVE-2025-5601   
                wpa_supplicant | CVE-2024-5290    | https://security-tracker.debian.org/tracker/CVE-2024-5290   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
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
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-40982   | https://security-tracker.debian.org/tracker/CVE-2022-40982  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-4949    | https://security-tracker.debian.org/tracker/CVE-2022-4949   
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-4949    | https://security-tracker.debian.org/tracker/CVE-2023-4949   
                           xen | CVE-2023-20588   | https://security-tracker.debian.org/tracker/CVE-2023-20588  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46841   | https://security-tracker.debian.org/tracker/CVE-2023-46841  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34324   | https://security-tracker.debian.org/tracker/CVE-2023-34324  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                           xen | CVE-2024-45818   | https://security-tracker.debian.org/tracker/CVE-2024-45818  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                        xerces | CVE-2018-1311    | https://security-tracker.debian.org/tracker/CVE-2018-1311   
                        xerces | CVE-2024-23807   | https://security-tracker.debian.org/tracker/CVE-2024-23807  
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
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2025.05.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2025-3891    | https://security-tracker.debian.org/tracker/CVE-2025-3891   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2023-38469   | https://security-tracker.debian.org/tracker/CVE-2023-38469  
                         avahi | CVE-2023-38471   | https://security-tracker.debian.org/tracker/CVE-2023-38471  
                         avahi | CVE-2023-38473   | https://security-tracker.debian.org/tracker/CVE-2023-38473  
                         avahi | CVE-2023-38472   | https://security-tracker.debian.org/tracker/CVE-2023-38472  
                         avahi | CVE-2023-38470   | https://security-tracker.debian.org/tracker/CVE-2023-38470  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
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
                      binutils | CVE-2025-0840    | https://security-tracker.debian.org/tracker/CVE-2025-0840   
           binutils-bare-metal | CVE-2025-8225    | https://security-tracker.debian.org/tracker/CVE-2025-8225   
           binutils-bare-metal | CVE-2025-8224    | https://security-tracker.debian.org/tracker/CVE-2025-8224   
           binutils-bare-metal | CVE-2025-1153    | https://security-tracker.debian.org/tracker/CVE-2025-1153   
           binutils-bare-metal | CVE-2025-3198    | https://security-tracker.debian.org/tracker/CVE-2025-3198   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                         botan | CVE-2024-50382   | https://security-tracker.debian.org/tracker/CVE-2024-50382  
                         botan | CVE-2024-50383   | https://security-tracker.debian.org/tracker/CVE-2024-50383  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          cpio | CVE-2023-7216    | https://security-tracker.debian.org/tracker/CVE-2023-7216   
                   cpp-httplib | CVE-2025-46728   | https://security-tracker.debian.org/tracker/CVE-2025-46728  
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dash | CVE-2024-21485   | https://security-tracker.debian.org/tracker/CVE-2024-21485  
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
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
                          dpdk | CVE-2015-1142857 | https://security-tracker.debian.org/tracker/CVE-2015-1142857
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                      easy-rsa | CVE-2024-13454   | https://security-tracker.debian.org/tracker/CVE-2024-13454  
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
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
                         emlog | CVE-2025-47787   | https://security-tracker.debian.org/tracker/CVE-2025-47787  
                         emlog | CVE-2025-47785   | https://security-tracker.debian.org/tracker/CVE-2025-47785  
                         emlog | CVE-2025-47784   | https://security-tracker.debian.org/tracker/CVE-2025-47784  
                         emlog | CVE-2025-30372   | https://security-tracker.debian.org/tracker/CVE-2025-30372  
                         emlog | CVE-2025-5886    | https://security-tracker.debian.org/tracker/CVE-2025-5886   
                        erlang | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                        erlang | CVE-2025-32433   | https://security-tracker.debian.org/tracker/CVE-2025-32433  
                         exiv2 | CVE-2025-54080   | https://security-tracker.debian.org/tracker/CVE-2025-54080  
                         exiv2 | CVE-2025-55304   | https://security-tracker.debian.org/tracker/CVE-2025-55304  
                         fastd | CVE-2025-24356   | https://security-tracker.debian.org/tracker/CVE-2025-24356  
                        ffmpeg | CVE-2023-50007   | https://security-tracker.debian.org/tracker/CVE-2023-50007  
                        ffmpeg | CVE-2023-50008   | https://security-tracker.debian.org/tracker/CVE-2023-50008  
                        ffmpeg | CVE-2023-50009   | https://security-tracker.debian.org/tracker/CVE-2023-50009  
                        ffmpeg | CVE-2023-50010   | https://security-tracker.debian.org/tracker/CVE-2023-50010  
                        ffmpeg | CVE-2023-49502   | https://security-tracker.debian.org/tracker/CVE-2023-49502  
                        ffmpeg | CVE-2024-31585   | https://security-tracker.debian.org/tracker/CVE-2024-31585  
                        ffmpeg | CVE-2024-31582   | https://security-tracker.debian.org/tracker/CVE-2024-31582  
                        ffmpeg | CVE-2024-31578   | https://security-tracker.debian.org/tracker/CVE-2024-31578  
                        ffmpeg | CVE-2025-1373    | https://security-tracker.debian.org/tracker/CVE-2025-1373   
                        ffmpeg | CVE-2025-1594    | https://security-tracker.debian.org/tracker/CVE-2025-1594   
                       freerdp | CVE-2024-32662   | https://security-tracker.debian.org/tracker/CVE-2024-32662  
                       freerdp | CVE-2024-32661   | https://security-tracker.debian.org/tracker/CVE-2024-32661  
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                   ghostscript | CVE-2023-38560   | https://security-tracker.debian.org/tracker/CVE-2023-38560  
                        giflib | CVE-2024-45993   | https://security-tracker.debian.org/tracker/CVE-2024-45993  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                        gnupg2 | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                        gnutls | CVE-2025-32990   | https://security-tracker.debian.org/tracker/CVE-2025-32990  
                        gnutls | CVE-2025-32989   | https://security-tracker.debian.org/tracker/CVE-2025-32989  
                        go-bin | CVE-2024-3566    | https://security-tracker.debian.org/tracker/CVE-2024-3566   
                        go-src | CVE-2024-3566    | https://security-tracker.debian.org/tracker/CVE-2024-3566   
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                         grub2 | CVE-2024-2312    | https://security-tracker.debian.org/tracker/CVE-2024-2312   
                    gstreamer1 | CVE-2025-47183   | https://security-tracker.debian.org/tracker/CVE-2025-47183  
                    gstreamer1 | CVE-2025-3887    | https://security-tracker.debian.org/tracker/CVE-2025-3887   
                    gstreamer1 | CVE-2025-47219   | https://security-tracker.debian.org/tracker/CVE-2025-47219  
                    gstreamer1 | CVE-2025-2759    | https://security-tracker.debian.org/tracker/CVE-2025-2759   
                    gstreamer1 | CVE-2025-47808   | https://security-tracker.debian.org/tracker/CVE-2025-47808  
                    gstreamer1 | CVE-2025-47806   | https://security-tracker.debian.org/tracker/CVE-2025-47806  
                    gstreamer1 | CVE-2025-47807   | https://security-tracker.debian.org/tracker/CVE-2025-47807  
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2023-0056    | https://security-tracker.debian.org/tracker/CVE-2023-0056   
                       haproxy | CVE-2023-45539   | https://security-tracker.debian.org/tracker/CVE-2023-45539  
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2023-5341    | https://security-tracker.debian.org/tracker/CVE-2023-5341   
                   imagemagick | CVE-2025-55160   | https://security-tracker.debian.org/tracker/CVE-2025-55160  
                   imagemagick | CVE-2025-55154   | https://security-tracker.debian.org/tracker/CVE-2025-55154  
                   imagemagick | CVE-2025-53015   | https://security-tracker.debian.org/tracker/CVE-2025-53015  
                   imagemagick | CVE-2025-53014   | https://security-tracker.debian.org/tracker/CVE-2025-53014  
                   imagemagick | CVE-2025-53019   | https://security-tracker.debian.org/tracker/CVE-2025-53019  
                   imagemagick | CVE-2025-55005   | https://security-tracker.debian.org/tracker/CVE-2025-55005  
                   imagemagick | CVE-2025-55004   | https://security-tracker.debian.org/tracker/CVE-2025-55004  
                   imagemagick | CVE-2025-53101   | https://security-tracker.debian.org/tracker/CVE-2025-53101  
                   imagemagick | CVE-2025-55212   | https://security-tracker.debian.org/tracker/CVE-2025-55212  
                   imagemagick | CVE-2025-55298   | https://security-tracker.debian.org/tracker/CVE-2025-55298  
                   imagemagick | CVE-2025-57803   | https://security-tracker.debian.org/tracker/CVE-2025-57803  
                        jasper | CVE-2023-51257   | https://security-tracker.debian.org/tracker/CVE-2023-51257  
                         jhead | CVE-2025-44906   | https://security-tracker.debian.org/tracker/CVE-2025-44906  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                       kvmtool | CVE-2021-45464   | https://security-tracker.debian.org/tracker/CVE-2021-45464  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                  libfreeimage | CVE-2023-47997   | https://security-tracker.debian.org/tracker/CVE-2023-47997  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47995   | https://security-tracker.debian.org/tracker/CVE-2023-47995  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2024-31570   | https://security-tracker.debian.org/tracker/CVE-2024-31570  
                  libfreeimage | CVE-2024-9029    | https://security-tracker.debian.org/tracker/CVE-2024-9029   
                      libglib2 | CVE-2025-6052    | https://security-tracker.debian.org/tracker/CVE-2025-6052   
            libglib2-bootstrap | CVE-2025-6052    | https://security-tracker.debian.org/tracker/CVE-2025-6052   
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                        libssh | CVE-2025-5987    | https://security-tracker.debian.org/tracker/CVE-2025-5987   
                        libssh | CVE-2025-5318    | https://security-tracker.debian.org/tracker/CVE-2025-5318   
                        libssh | CVE-2025-8114    | https://security-tracker.debian.org/tracker/CVE-2025-8114   
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libvirt | CVE-2023-3750    | https://security-tracker.debian.org/tracker/CVE-2023-3750   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                       libxslt | CVE-2025-7424    | https://security-tracker.debian.org/tracker/CVE-2025-7424   
                     linux-pam | CVE-2024-10041   | https://security-tracker.debian.org/tracker/CVE-2024-10041  
                       log4cxx | CVE-2025-54812   | https://security-tracker.debian.org/tracker/CVE-2025-54812  
                       log4cxx | CVE-2025-54813   | https://security-tracker.debian.org/tracker/CVE-2025-54813  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                        mender | CVE-2024-46948   | https://security-tracker.debian.org/tracker/CVE-2024-46948  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33717   | https://security-tracker.debian.org/tracker/CVE-2023-33717  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mp4v2 | CVE-2023-33718   | https://security-tracker.debian.org/tracker/CVE-2023-33718  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          mutt | CVE-2024-49393   | https://security-tracker.debian.org/tracker/CVE-2024-49393  
                          mutt | CVE-2024-49395   | https://security-tracker.debian.org/tracker/CVE-2024-49395  
                          mutt | CVE-2024-49394   | https://security-tracker.debian.org/tracker/CVE-2024-49394  
                       netdata | CVE-2023-22497   | https://security-tracker.debian.org/tracker/CVE-2023-22497  
                       netdata | CVE-2023-22496   | https://security-tracker.debian.org/tracker/CVE-2023-22496  
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7848    | https://security-tracker.debian.org/tracker/CVE-2015-7848   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
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
                      openjpeg | CVE-2023-39328   | https://security-tracker.debian.org/tracker/CVE-2023-39328  
                      openjpeg | CVE-2023-39329   | https://security-tracker.debian.org/tracker/CVE-2023-39329  
                      openjpeg | CVE-2023-39327   | https://security-tracker.debian.org/tracker/CVE-2023-39327  
                        opensc | CVE-2024-8443    | https://security-tracker.debian.org/tracker/CVE-2024-8443   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
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
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                        podman | CVE-2022-2989    | https://security-tracker.debian.org/tracker/CVE-2022-2989   
                        podman | CVE-2023-0778    | https://security-tracker.debian.org/tracker/CVE-2023-0778   
                       poppler | CVE-2024-6239    | https://security-tracker.debian.org/tracker/CVE-2024-6239   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                       proftpd | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                    pulseaudio | CVE-2024-11586   | https://security-tracker.debian.org/tracker/CVE-2024-11586  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-uvicorn | CVE-2020-7694    | https://security-tracker.debian.org/tracker/CVE-2020-7694   
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-2680    | https://security-tracker.debian.org/tracker/CVE-2023-2680   
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2024-8354    | https://security-tracker.debian.org/tracker/CVE-2024-8354   
                          qemu | CVE-2024-6505    | https://security-tracker.debian.org/tracker/CVE-2024-6505   
                          qemu | CVE-2024-6519    | https://security-tracker.debian.org/tracker/CVE-2024-6519   
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
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
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
                        shadow | CVE-2013-4235    | https://security-tracker.debian.org/tracker/CVE-2013-4235   
                        skopeo | CVE-2019-10214   | https://security-tracker.debian.org/tracker/CVE-2019-10214  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                        sqlite | CVE-2025-6965    | https://security-tracker.debian.org/tracker/CVE-2025-6965   
                          sudo | CVE-2025-32463   | https://security-tracker.debian.org/tracker/CVE-2025-32463  
                          sudo | CVE-2025-32462   | https://security-tracker.debian.org/tracker/CVE-2025-32462  
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
                      suricata | CVE-2024-37151   | https://security-tracker.debian.org/tracker/CVE-2024-37151  
                      suricata | CVE-2024-38536   | https://security-tracker.debian.org/tracker/CVE-2024-38536  
                      suricata | CVE-2024-38535   | https://security-tracker.debian.org/tracker/CVE-2024-38535  
                      suricata | CVE-2024-38534   | https://security-tracker.debian.org/tracker/CVE-2024-38534  
                      suricata | CVE-2025-29915   | https://security-tracker.debian.org/tracker/CVE-2025-29915  
                      suricata | CVE-2025-29918   | https://security-tracker.debian.org/tracker/CVE-2025-29918  
                      suricata | CVE-2025-29916   | https://security-tracker.debian.org/tracker/CVE-2025-29916  
                      suricata | CVE-2025-29917   | https://security-tracker.debian.org/tracker/CVE-2025-29917  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                          tiff | CVE-2023-6277    | https://security-tracker.debian.org/tracker/CVE-2023-6277   
                          tiff | CVE-2023-6228    | https://security-tracker.debian.org/tracker/CVE-2023-6228   
                          tiff | CVE-2023-52356   | https://security-tracker.debian.org/tracker/CVE-2023-52356  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                      tpm2-tss | CVE-2023-22745   | https://security-tracker.debian.org/tracker/CVE-2023-22745  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                      unixodbc | CVE-2024-1013    | https://security-tracker.debian.org/tracker/CVE-2024-1013   
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                     wireshark | CVE-2025-5601    | https://security-tracker.debian.org/tracker/CVE-2025-5601   
                wpa_supplicant | CVE-2024-5290    | https://security-tracker.debian.org/tracker/CVE-2024-5290   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
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
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-40982   | https://security-tracker.debian.org/tracker/CVE-2022-40982  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-4949    | https://security-tracker.debian.org/tracker/CVE-2022-4949   
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-4949    | https://security-tracker.debian.org/tracker/CVE-2023-4949   
                           xen | CVE-2023-20588   | https://security-tracker.debian.org/tracker/CVE-2023-20588  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46841   | https://security-tracker.debian.org/tracker/CVE-2023-46841  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34324   | https://security-tracker.debian.org/tracker/CVE-2023-34324  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                           xen | CVE-2024-45818   | https://security-tracker.debian.org/tracker/CVE-2024-45818  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                        xerces | CVE-2018-1311    | https://security-tracker.debian.org/tracker/CVE-2018-1311   
                        xerces | CVE-2024-23807   | https://security-tracker.debian.org/tracker/CVE-2024-23807  
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
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  


-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
