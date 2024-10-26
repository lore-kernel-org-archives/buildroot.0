Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9A1D0C60B
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 03:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9AB76078A;
	Sat, 26 Oct 2024 03:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c1wJhui18Nyl; Sat, 26 Oct 2024 03:18:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 367DA606C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 367DA606C8;
	Sat, 26 Oct 2024 03:18:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6067D5C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 03:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B9574083F
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 03:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gSMxmUiUpoHH for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 03:18:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BBD1E4082A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBD1E4082A
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BBD1E4082A
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 03:18:11 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a9a16b310f5so383919466b.0
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 20:18:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729912689; x=1730517489;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/RBY/R7Hl6ukrKEMPISfa6OscmiW2qF6Tkn4Ox/3wRI=;
 b=colkK40KnTWvzOIgBNZVOKMIanVS1oNKlNBSpW0V5/1fJ8Fqz/U5rDhOvvSOKnCkdh
 j6QEP+/QPbpo2na8+MtxItTjkhb/bmZX35l/o2fH6e/aR6F4BBXcJimAf+GDCnOV6izQ
 Fa2EpkY14OioT2Mv8XTMhiSzewVE7iFCDwrOUxZzeD/6iylBGD+3/Jztyli6euC2aV6J
 I01kWlT4f4MKh9bUDeox3jmn3IpnSS25EzbHTsKiJ735sDpSlviDs+1x6gace5UlhXC4
 gaAUg+OQo9pC4M/hnzpsheRCl5akfi9xqav7X0ooPSW2Zr2YRcy64PRuGcrVHUL+Tx65
 fDJg==
X-Gm-Message-State: AOJu0YxV7XkuyiYpk6NmyiWiS/KA2Kp73ZVRHGoXRL0zwvSJrLZA1hLh
 xm/hhaoRB9Wl6IR48ZTdH35f4E4cCSX3g7l2y1xKBm99Vt3xVsWqt6qDIg==
X-Google-Smtp-Source: AGHT+IGMfeTDYIfKEWU2HKYiqU+D+Kf9HIEcjXywt1V5h9+JcuJ1ezqOk3u2UZuMm/2ZaJZ05c0n+A==
X-Received: by 2002:a17:906:6a1c:b0:a9a:81a3:59bf with SMTP id
 a640c23a62f3a-a9de5f656e6mr102749166b.35.1729912688987; 
 Fri, 25 Oct 2024 20:18:08 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f05deb6sm128313866b.88.2024.10.25.20.18.08
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 20:18:08 -0700 (PDT)
Message-ID: <671c5f70.170a0220.3ae10a.46c5@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 26 Oct 2024 03:18:08 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729912689; x=1730517489; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=/RBY/R7Hl6ukrKEMPISfa6OscmiW2qF6Tkn4Ox/3wRI=;
 b=EY/pRzvqhMThqeZm+7im8+Dt5oNq1LVse+yOi7LvmMY0bMXBG4d73LjCyCXXXDiJor
 SmMX4SL1V+OX5J2sP7CLJ43+lXu8ehtAr99J5WBJ0Bs+rKGh3TOLyJoT9Cp09iUm59jr
 JPe7ZqqUff/f6c9pUdbROORWtUl4cZcTqMAQrvliXEYVKpqG25PmBq9E0+IQwYwc07QQ
 w+RDQuMHzkcX1pUEn+DvvP5e2w90lNop/jS6qUlsZJD//pKKmbiOi/ildHQDxH7Zm6Nj
 hWD8byUtF/iWO3R66WE0eEB01rtDHDt3IxPJLqI8V5sVakH+m6EoF9ZVJUzYy8ZJdPBu
 nYqQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=EY/pRzvq
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-10-25
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

Autobuild statistics for 2024-10-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  1  |  1  |  0  |  2  |
  2024.05.x  | 17  | 27  |  0  | 44  |
  2024.08.x  |  3  |  3  |  0  |  6  |
    master   | 16  | 316 |  7  | 339 |

Classification of failures by reason for master
-----------------------------------------------

       linux-firmware-20240909 | 19
               procps-ng-4.0.4 | 13
           libzenoh-pico-1.0.0 | 12
                  linux-6.11.3 | 12
  gobject-introspection-1.76.1 | 11
              host-rust-1.80.1 | 11
                    git-2.47.0 | 9 
android-tools-4.2.2+git2013... | 8 
                 apache-2.4.62 | 8 
             dahdi-linux-3.3.0 | 8 
                 coreutils-9.5 | 7 
         gobject-introspection | 7 
            host-binutils-2.42 | 7 
 host-binutils-bare-metal-2.42 | 7 
         host-libxcrypt-4.4.36 | 6 
              libopenssl-3.3.2 | 6 
          cryptodev-linux-1.13 | 5 
                  evilwm-1.4.3 | 5 
                   foot-1.16.2 | 5 
host-heimdal-f4faaeaba371ff... | 5 
      python-autocommand-2.2.2 | 5 
                       unknown | 5 
                    brltty-6.6 | 4 
                  ffmpeg-6.1.2 | 4 
                libdrm-2.4.123 | 4 
                  ntp-4.2.8p18 | 4 
                 pixman-0.42.2 | 4 
                    bat-0.24.0 | 3 
                 gnuplot-6.0.1 | 3 
           host-librsvg-2.50.9 | 3 
   host-mender-artifact-3.11.2 | 3 
                liblinear-2.45 | 3 
               linux-pam-1.6.1 | 3 
             lirc-tools-0.10.2 | 3 
              mosquitto-2.0.20 | 3 
                   perl-5.40.0 | 3 
               pulseaudio-17.0 | 3 
                 apitrace-10.0 | 2 
                  bcusdk-0.0.5 | 2 
             berkeleydb-5.3.28 | 2 
                   bird-2.15.1 | 2 
                   bullet-3.25 | 2 
                elfutils-0.189 | 2 
                espflash-3.1.0 | 2 
            gdk-pixbuf-2.42.12 | 2 
            gettext-gnu-0.22.4 | 2 
glibc-2.40-18-g564178076272... | 2 
httping-0e26c53d5fe504eb720... | 2 
                  libsepol-3.6 | 2 
                 libv4l-1.28.1 | 2 
          linux-5.10.162-cip24 | 2 
     linux-5.10.162-cip24-rt10 | 2 
          lua-cqueues-20200726 | 2 
              luabitop-1.0.2-1 | 2 
                   mimic-1.1.0 | 2 
                    mpir-3.0.0 | 2 
           musl-compat-headers | 2 
          obsidian-cursors-1.0 | 2 
               openblas-0.3.28 | 2 
               valgrind-3.23.0 | 2 
               arp-scan-1.10.0 | 1 
              asterisk-20.10.0 | 1 
           at-spi2-core-2.50.0 | 1 
             batman-adv-2024.2 | 1 
                  boost-1.83.0 | 1 
                  brotli-1.1.0 | 1 
                    bsdiff-4.3 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
            cppcms-2.0.0-beta2 | 1 
           crucible-2023.11.02 | 1 
                cryptopp-8.9.0 | 1 
                   cvs-1.12.13 | 1 
                dbus-broker-36 | 1 
                  dlib-19.24.6 | 1 
                   duma-2.5.21 | 1 
                    dust-0.9.0 | 1 
                   eza-0.18.22 | 1 
                     file-5.45 | 1 
                freerdp-2.11.7 | 1 
           ghostscript-10.03.1 | 1 
                  giblib-1.2.4 | 1 
            gnuradio-3.10.11.0 | 1 
               graphene-1.10.8 | 1 
                 highway-1.2.0 | 1 
        host-sentry-cli-2.20.3 | 1 
 host-softether-4.30-9700-beta | 1 
                      iwd-2.20 | 1 
                libglvnd-1.4.0 | 1 
                  libnss-3.105 | 1 
                  libsvg-0.1.4 | 1 
            libsvg-cairo-0.1.6 | 1 
               linknx-0.0.1.38 | 1 
            linux-fusion-9.0.3 | 1 
                   linux-tools | 1 
                   ltris-1.3.2 | 1 
                 mesa3d-24.0.9 | 1 
               pcsc-lite-2.1.0 | 1 
               postgresql-16.4 | 1 
                  ramsmp-3.5.0 | 1 
       riemann-c-client-1.10.5 | 1 
                 rtptools-1.22 | 1 
                   sdl2-2.30.7 | 1 
              sdl2_mixer-2.6.3 | 1 
                   swipl-9.2.7 | 1 
                 uclibc-1.0.50 | 1 
                 whetstone-1.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/a78b8a3722cb0ab383e0de3328af5a76c43b0666 |     
   sh4aeb    | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/adc5e8ecb5900a7e5373aa61ca442a1df2334ebc |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/571177e5e7f8fc69504e006f92b755b22e8b7312 |     
    arc      | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/79b87b21866a22382a73dd794b4c97332929036e |     
    or1k     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/6056a62fc6761630d404ed661b80e4cdd067dd6e |     
   arceb     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/97a85a5e29ddfe571ef052de1e6a4bf776241919 |     
    m68k     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/5948046c5906d14f14dc853f91364a01574879dd |     
  powerpc    | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/a61adab7417c39191c278f02ad9e644c44a68be2 |     
    m68k     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/824a56fd76634bbe481afb79e98809fd9adf5ae9 |     
   mipsel    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/2823447f5a4ab6997c09740764be39661c98bf0a |     
    i686     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/b7335bc7dd3f71327b579ac9803ab7a34998d853 |     
  sparc64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/f0eb3cafcf474685db73f1635f4815546378c21f |     
    or1k     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/296facb34875b9256b4049113cfa92ac5f99cacf |     
   x86_64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/7d6825502726d9322b2ac268dfd8e11538274bd8 |     
   nios2     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/d1b4d8945d6b45957573ec91dd4f4035e5fc01eb |     
    sh4      |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/74fed31555b40b60c2f307c4fa0d19adf3fc125e |     
    arc      |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/b22efafc9a92f067fe94e4ce399ec8e8e220f834 |     
    arc      |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/72c7b9654e9e5f383afe2a4206c5859e232763da |     
   arceb     |        arp-scan-1.10.0         | NOK | https://autobuild.buildroot.org/results/125a4cc4204c7b195d66f65f6f8b94ed29389cd4 |     
  powerpc    |        asterisk-20.10.0        | NOK | https://autobuild.buildroot.org/results/234412e8023c3e3e0c323a0463a52793f1210537 |     
    mips     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/f94c8384bcac38b07effe9cd5cc059b93a6b9f4c |     
   x86_64    |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/94907482e7d1b34fd13c8c15f3d6d955b7ce5496 |     
  powerpc    |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/362f525975220699a5160e57422690e3d1a1b939 |     
  riscv64    |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/21b223fd447537bae88e72dc8b0377d771852819 |     
   mipsel    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/3d7c87520a4b930a3b168eb492f1f9471cff5507 |     
powerpc64le  |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/6cc64c06c3703f5ed190bcdc1fb5c3e88cfd1270 |     
  sparc64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/b2d9f3ffaa80789791ea4c07a81c23191aaa7f83 |     
 aarch64_be  |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/11ebdc566170256fd710058ce0c03e86db97a142 | ORPH
    sh4      |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/d72a02ac497ec3f1434cd6a29a426b56fd74f787 | ORPH
 aarch64_be  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/4ced5008b287860b4d1fcedb4b2f3057a197fa2a |     
   mips64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/bf653b85eea2c3217422d7b7115e4146e3cf1db4 |     
  riscv64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/6e752a46e2dbbc8fc567e1da90353e5766fa368f |     
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/62daf19c45a2888450e1313137677d8bb0616223 |     
microblazeel |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/713caf0df0aef620a590f348596a3a0887e911af |     
 microblaze  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/dab6555dfa55ed27fe352c860aff09d5ad74cab1 |     
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/18f5040b83d81c2e4b1446f6063a9a5dbb48cf9e |     
   arceb     |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/85084a9cd0dce55fff55ca0573b7cdac52921b73 |     
  riscv64    |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/4eac36c67ddbe8acbcb4d8a620a76eff50570335 | ORPH
   mipsel    |          bullet-3.25           | NOK | https://autobuild.buildroot.org/results/f3325083816601deb8ebffd01964f5dbd579aca3 |     
    arc      |          bullet-3.25           | NOK | https://autobuild.buildroot.org/results/1080d7de17c7378caf85158ec6376e35e945810d |     
   nios2     | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/0ddf9da664d08723517949686764682b4aa003bc |     
   x86_64    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/ecdd64586fec11110d095db452bebc5bec4735aa | ORPH
 aarch64_be  |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/8aec5dac5383a80c5023ba1064c2cf703edcb238 | ORPH
    or1k     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/868307ed1d3e545d4f2e2c309d8f8b5b65fcff1e | ORPH
   xtensa    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/519c32a2d56b09c77ea789935b93ba507b0e2cb5 | ORPH
    mips     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/821b16606ef94673e77992a030d36da667e85aa0 | ORPH
   mips64    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/595bbaf8a2a5bf77abaa972f42de18ecb4483c97 | ORPH
    mips     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/0a3527d9cf48e033aa2c3d9362696ffcaa71b48f | ORPH
    or1k     |       cppcms-2.0.0-beta2       | NOK | https://autobuild.buildroot.org/results/d7ab6f1f749a698f98f058b0377fe80ed8993d8e | ORPH
   s390x     |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/3f157fa0b62882aea13a1b7ae1d395efafe0ca20 |     
    m68k     |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/5053e686b98ee76d15a133ff71f970c28d957b3c | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/ec8860954c8c39fa8fdfb616a175a332a609773f | ORPH
   mipsel    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/464cc6eee55aae2fa4c5e33cb25df9c3e1edde08 | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/ecd4d3ff30a8c65defa984c7702ebe0dcf5a8e93 | ORPH
    m68k     |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/e90053cc5ec42091518af0ae91828f7990c69e98 | ORPH
   s390x     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/245eedb40237971f111d303ede4eb6b666546925 |     
   s390x     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/80935377d3867ef070f616c920e56a0b8cfd709a | ORPH
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/fd250232ac242160360e5408c5da146d4b356b66 |     
   sparc     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/472e6db0527ac3b28972791336567af469d5fe9f |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/5f9fa1e4c240ae451bb23d73cd73952c6e6e9582 |     
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b787d005d630e4cd03288690d938577b602c29cd |     
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a071fd6ba96ecedca589ca876b96b03e5c609af7 |     
   sparc     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/daa097e46ec9ac540f52e5e754e5a4e402460081 |     
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e1806157f5f32249f131507c1f3c250a837eca63 |     
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/46b49bfa55694a6819c1e771c1e648be99722f03 |     
   s390x     |         dbus-broker-36         | NOK | https://autobuild.buildroot.org/results/601864c6abe6e320712dbeba686126cfd6d49544 |     
   sparc     |          dlib-19.24.6          | NOK | https://autobuild.buildroot.org/results/1f795d0529687e22c87b25acb2b1ad8ce1a01e92 |     
   x86_64    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/dccea46aff306054716296f25c5d8f260e9ecf68 | ORPH
  powerpc    |           dust-0.9.0           | NOK | https://autobuild.buildroot.org/results/8ecbe06ca7630a676a506cbc10b71e0aaccae684 | ORPH
    m68k     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/1dfc8289577558fc03761250fd4ac8ac69578c63 | ORPH
    arc      |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/46f15c888137b03e71c92b20e0bcc1bfddf566d3 | ORPH
  sparc64    |         espflash-3.1.0         | NOK | https://autobuild.buildroot.org/results/1c1c016467653a6d56e72e34ca560d54c61dec93 |     
  sparc64    |         espflash-3.1.0         | NOK | https://autobuild.buildroot.org/results/5aeb5aab9592ce30bd69959aad7d2cf12db24c25 |     
  riscv32    |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/40b4add191728fb2c4bda1f9835e99f77631bd14 |     
    m68k     |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/1266eb5d0057b682ec451d63ee506b65a949333a |     
   nios2     |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/db3a574bb51de372adacdc52e89abe7ce0774a64 |     
 microblaze  |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/8d22a547fdbac8539ab88b7d6c596a6c4e46f04d |     
   x86_64    |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/b9dffbfe2fb56c777e4a48d60ecd9ad4e283dd7d |     
  sparc64    |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/cc7b4c252a6f96b20f65b45ae51f405a7b4429e2 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/63a93d29f6ba51c30f41eeeb4c618bc7acdd7f5d |     
  riscv32    |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/79695d3ddd12c504bec562a977cc9f317d12610c |     
  riscv32    |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/40fc9ae83fdc5abc95c7ffb560896f5b87264488 |     
  riscv32    |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/c4280d7d621879067e9c667464162a9e894c9ce5 |     
   mipsel    |           file-5.45            | NOK | https://autobuild.buildroot.org/results/f5ef7a487e30a108d0af6cd6420d5280432799c6 | ORPH
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/a566cae7407955c13b82f01531b84b377835fd47 |     
    or1k     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/90b5e2d7c74e487c929230063cda69a5092aca1c |     
   s390x     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/d6a0b0f4bf0ae163c99e46afcb5c71f61544ba82 |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/d3aeb02e3883d3a91a75d9e1a2d0c982a76e76aa |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/3824b5049d2811b3163abe8b53436910fd1a7bfa |     
    m68k     |         freerdp-2.11.7         | NOK | https://autobuild.buildroot.org/results/a0462c0d79355bf9d6f91455b602051073c7b62a |     
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/8320b2ef1370249d7a449bd5bca842edf7d48ab3 | ORPH
    arm      |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/ab7870be40ede661073dfb4ff08631c8396a94c6 | ORPH
   xtensa    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/5b66a9abca3741b9c0ba276359b4fed0570b3793 | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/afeec3c7e1074fb791dcbf42da0975c39142571d | ORPH
powerpc64le  |      ghostscript-10.03.1       | NOK | https://autobuild.buildroot.org/results/a7c9fdce4e12d9da5c6ccf944533c029bd894e24 |     
    i686     |          giblib-1.2.4          | NOK | https://autobuild.buildroot.org/results/e95816e51c05c061bf2c7d4592a33d90eb639e17 |     
  mips64el   |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/0d5143af07b05d5c52aafb174f2f44fcb475993d |     
   xtensa    |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/77bb361b0cfbb7238c556895fd2171490ba236c4 |     
   xtensa    |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/1463174d86bad4023c4114d24467ac0200ca1f96 |     
   xtensa    |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/cc9a8481aaa5b234837024e45d89119228a1140d |     
  mips64el   |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/7c00e791b866488751bfa06f322accd27a98d006 |     
   arceb     |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/2da75db21da8f66d32c460403575e62c145ede40 |     
   mips64    |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/8094c8c48871e27b910fff0ea5552401fd285146 |     
    arc      |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/14d412deec3380b2f9666e0620c0056791459270 |     
 aarch64_be  |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/b31ceb5f936c13c199c829c144b851291e46317a |     
   arceb     | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/4a0d481c594eb43620a199685b1257a3ef3839e9 |     
   arceb     | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/145dde1b374e9ceb7166f800a5a0d0fc50e248ba |     
   nios2     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/4d7a5ca8e5d56073de78045eb0f40ff5364252e6 |     
  mips64el   |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/5b01342c658efc4f1067e58e54edd883ce715441 |     
microblazeel |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/355c3f3ab1b4cede850f1d5593090e056e583cf7 |     
   x86_64    |       gnuradio-3.10.11.0       | NOK | https://autobuild.buildroot.org/results/a363c2407ab21ce4240a7aa79efea3af060103b3 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/1060e9347d17215d0339f2839a71f3c7544967f3 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/8d4b8172dbce97406bd69c6d8f3ace69bcb1d5bd |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/dbdad2aa893ebb4bd218e4bde2531cdbc01b190b |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/1f39aeabd2cfb5b42b73c796a5e9deae177fe6ae |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/8d80ab87101a24b849a54f3e3f31271634d8a749 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/360e5cb10a347322fcbe9e53f328e890923531c2 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/dc3ba9374b3306832e09865558d56607feb1d754 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/656ea43f1cc5e0d3d593fad703b894da7b950fa9 | ORPH
   sh4eb     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/881bc35964069c1766ce3ecb87b174001ab582a0 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/d24346973d8d7b800c662e71415bed7b6767a56f | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/162e82378840cb08d2ccbd6be6d5dbc92f3056f4 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/bdb167e5f2add59a9d5ae5dcc300a198c6757a74 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/b24ded9121f0e9e94d9cb0064f5ff9ffb22d73a6 | ORPH
  powerpc    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/4d14a792af35ff30887f5a0186a95fc13c1162d9 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/c51d473348938523f699c142e210ff822984c31b | ORPH
   sh4eb     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/e93b23e55eb955c6b08bc1389c3c3196bddf6db3 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/626ca6ef3b7821853f8fdc9d8790f1e4799d7430 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/a6570a56be082116a90d0ebf4219dc548a536a75 | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/be5533c029b8085d03b79afecb38060f9384f026 |     
  riscv64    |         highway-1.2.0          | NOK | https://autobuild.buildroot.org/results/51f4d3c4bbe7ba0548ceaa568b3398ac643a503e |     
   nios2     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/f8354d2d7b8e4ee70e1398dc1376feda8aeb6e61 |     
  sparc64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/d5f1ba7ac9850175b5344e2fd12032d900cba83e |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/2df1efe660f3abb41e235408744236d20109ae05 |     
   sparc     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/2697e5fc7cb7451c76f3c2792c107be0e2ba6929 |     
    sh4      |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/a77c380f5473df96f5d07cdc6571496da295f187 |     
microblazeel |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/b945190e8c3467072e05997d29b386af9bad2ff0 |     
   xtensa    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/fe89980759f1dc4db61c89b907391f15bce20ad8 |     
  riscv64    | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/45673583338e0e76a8f0d5fa9ab94389d0a28d86 |     
    sh4a     | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/370728945d57c6c27b0ca93413e5746d469aadb6 |     
   armeb     | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/26081cde5f6a01769b69e2d3924c34507b979a2f |     
    arc      | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/0d5ca7a610ff62a40333008673dc14d9aceba403 |     
 microblaze  | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/4ab48222d40fabe846dd52b40399f244c9283823 |     
   x86_64    | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/6f5bccf6b6d02641e8b2948427e261ff912ccfba |     
   armeb     | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/192cf52eb51ebeecb95da54de4358e55adb39d9a |     
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/f9ed25a3d77cc06b6520d47dc9afa2b017b38d1b | ORPH
    mips     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/ee129a6baff0e936b30ebbccb62e4800c3be144c | ORPH
    mips     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/1049b79d5df7968613d32fbcd1a8971f57ec3c18 | ORPH
    sh4      | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/e191819cb5e555c3eab94d96b70a3032170f178c | ORPH
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/6b9ca122ed5d2677aeec034355e0be6ca25fa88a | ORPH
  sparc64    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/83371276ae8061e0b06301cfc7644d79a3ac0c43 |     
   armeb     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/f90510aac13e41afdb2bc3a3c2c34be9b03cec78 |     
   s390x     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/c3535303a5c781c01af73ac6f79a23df86ac7cb8 |     
 powerpc64   |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/a80f70279d00c647f71e54cbb031cac0912c0486 |     
   armeb     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/71f955605b58a4e352a2e91a79cf671dd12402ce |     
 powerpc64   |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/2a7898011c9ff8f805010f0ffea3fb5beb649cf6 |     
  powerpc    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/d32978bc56f4375f07463bb65856c5a72f300c07 |     
    m68k     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/516a723480af3e278463aa52520ca07157ed114b |     
   s390x     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/f097c2e53e7b10459b8292512661a561d8fe7f92 |     
   mips64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/f8128c1082dc78e6b5498ac88093a62cbaaf4150 |     
  mips64el   |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/730df7876cedb25af64d9f80aec709b746c37504 |     
  riscv64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/2b2cf57af37ea45288941617f21ad2a799297d64 |     
  powerpc    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/a96a70528af9d2e685154970cc97515b942e1743 |     
powerpc64le  |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/d15d17c2b6906f6de4a762ea4760f309faf7202c |     
  sparc64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/18c997f330eea0bf3dcf7ebde70d3482a1acd423 |     
powerpc64le  |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/8c4e29844f9e17a1209afdda1dad0c2e57917e14 |     
  sparc64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/e2f08a0688eba656bccccb2627e787284f24eee1 |     
  sparc64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/61f80a5506a4baaa6b4a02a3e8698123f474d63f |     
  powerpc    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/6d3941069093fb2e1b8f1d1afb750ac26ee07154 |     
powerpc64le  |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/01cdd022814e84394c8c96560026dd167adb7506 |     
  sparc64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/eb92a45b92ee5e6c5763f6ba06a19233ee1ed5d3 |     
   x86_64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/80548ab54a3eef7f8fa1a8f21ba480358c95a987 |     
  sparc64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/fca6723cc73218edc8f8115fe54a39ba881c3f4f |     
 aarch64_be  |     host-sentry-cli-2.20.3     | NOK | https://autobuild.buildroot.org/results/dd4644759dc025b259e1f0fec191dd1ce967d670 |     
 powerpc64   | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/19111b2eaa18e36acc8c5690886e5d194c0023ac | ORPH
 powerpc64   | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/3b4a48719f9ebf13f516e0f2d92a20d314628fe3 |     
  powerpc    | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/f9fe5aa9e5cc278ef00b1249a1d46e9cc2a08359 |     
  aarch64    |            iwd-2.20            | NOK | https://autobuild.buildroot.org/results/295b91666cfb8740d36840db334fe165cd438c89 | ORPH
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/d030be2c8ebad53913f79675663f171bbe028ca3 |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/a54b3c74753dbdcb1bd04dbcfbfdda8ecef59401 |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/9f6cb9376adb381f332b87c682c4fd1ed7d9c277 |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/06a39f43d24254fe1708696f78b84e08e6b6b2b8 |     
   mips64    |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/012794961bb020ea6c76979e9a4a49781686cb13 | ORPH
powerpc64le  |         liblinear-2.45         | NOK | https://autobuild.buildroot.org/results/ef11c96704cee61f93f14a8d7328ee1887917e3e |     
powerpc64le  |         liblinear-2.45         | NOK | https://autobuild.buildroot.org/results/9496980199b9c508bf32e69c86382ba782fee111 |     
 microblaze  |         liblinear-2.45         | NOK | https://autobuild.buildroot.org/results/b82025895414cc8e6d5fc5fa72c8e9141c5b1f7c |     
  mips64el   |          libnss-3.105          | NOK | https://autobuild.buildroot.org/results/106c6da6361f3995dd6c4b31501de665b490fd6e |     
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/c70db6e972558b7bc9daea6a8d954d5103ca8c2c | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/4e14fc28e54d31486248a294b9733452886214eb | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/5166d4bcdfc345c2f1b77d1e79ceefcf22fa06bb | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/d03925b329da42f5fef3577e2263cd80dd35f9e5 | ORPH
 microblaze  |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/4cd4e94dfaeae6e724d1c6479ede5945f6d4b6ec | ORPH
   s390x     |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/55c268bd97b05ff0e59bf33124ce944544fd939c | ORPH
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/a040bf41f0550bfb1d36e7f459e6348710350c16 |     
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/796de5fd4f22868a0741c50ab4a1922d808ef54e |     
   mips64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/4d935c10e4c3b9c51e483a8ce70af44595f3341c |     
   s390x     |       libsvg-cairo-0.1.6       | NOK | https://autobuild.buildroot.org/results/c2c84fb41ecf0972edcf86b68d7283c9cbf6858b |     
   arceb     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/1ae8dc39618cd4ccb7470e78ed7be1f16c535035 |     
   nios2     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/3ee07969c6c7d1b8ee1c18eb2fdd54bfc7fc5abd |     
    sh4a     |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/802286fa96d456ae64a75e3b80fc176e1279401b |     
   s390x     |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/5372e38cec6f4cd7af0656b3ffcba70d99510b7f |     
   mips64    |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/23a81114c1977b67bfcb79985f51498725237a27 |     
powerpc64le  |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/abdfb2ecf88a0fa482c4af9537c3505f18516bb3 |     
 aarch64_be  |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/4a4905343e6a366f53f2f082479ba459538853a8 |     
  aarch64    |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/476796d59de0c7b849b2d04dca30bbb19e3df380 |     
microblazeel |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/8b07efc457e0dba9454a8b20ac4735ddb8e07613 |     
 powerpc64   |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/7c2287dd28fe7f416e9a2993f5cc605fd01797ae |     
   s390x     |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/62160637ac8b11d00131b719dc30059e006994d2 |     
   armeb     |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/8232e9a2a46adbb67b616c98c8197a076512e5d4 |     
  mips64el   |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/95f052ab9cdde0676b2e10d0d8ecb1dd006f7509 |     
  powerpc    |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/574220392e9426dd20d17dfe4904002659d3bd12 |     
 powerpc64   |        linknx-0.0.1.38         | NOK | https://autobuild.buildroot.org/results/4572e1cae63d153dd9bcb1670de1ad28c1671e61 | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/959c447f00bab6a3b4cc0653cac57e9b1ce53f09 | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/4806851cf9954a97b8f85697b582ac9822df6769 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/5255d0a5748e51d3f00930afc933a5d1dcc1180a | ORPH
powerpc64le  |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/26eba6134990bb857c616498b899c9018bb1f637 | ORPH
    sh4a     |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/a9a0c5c79712827db4f56386493da77677686a3d | ORPH
   mips64    |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/7785fc34a553c0a0f3478ab6887ae109f71f0dbb | ORPH
  powerpc    |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/1743fd151eeb65091a3bbdbf05e93ee1256c881f | ORPH
    i686     |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/763ea0c54d0745cff12a5ae5372abbb8e63d77dd | ORPH
   mipsel    |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/a44d5ded912cdf0ab34e70e1b67a78c50e459176 | ORPH
 powerpc64   |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/1efb12a34651fbbd895e53538351e560f5b5d124 | ORPH
  mips64el   |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/42349e7c8d88949551dd7ee61d5f3dc4c0184d54 | ORPH
    sh4a     |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/e4dcf44165d0694cedccd2d1e81b3b6e10ce5940 | ORPH
  mips64el   |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/df1a2008f145698972336f036b6b229b8cf8b859 | ORPH
    m68k     |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/23ca59afb1f5d070ac89fc04267ad4ab5f815c5e | ORPH
    arc      |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/9ae13d56beb9e1ed099b284336e31922bb676a35 | ORPH
    mips     |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/fc6cb778fae5e85a838c1cd9d3bdf5fb16c171f4 | ORPH
  powerpc    |    linux-firmware-20240909     | NOK | https://autobuild.buildroot.org/results/764ec1633d7b2ed2bc95b00ce4db0a31acba73bb |     
   x86_64    |    linux-firmware-20240909     | NOK | https://autobuild.buildroot.org/results/3e91ebd41e8451be8ab5ecaaab7c666472d79501 |     
   s390x     |    linux-firmware-20240909     | NOK | https://autobuild.buildroot.org/results/c11ceda5344e32a53615c3d56501078c9674fcd2 |     
 powerpc64   |    linux-firmware-20240909     | NOK | https://autobuild.buildroot.org/results/b162dc58fea831eba17a3cc150323b5941a3fd8d |     
    sh4      |    linux-firmware-20240909     | NOK | https://autobuild.buildroot.org/results/10a6ad93ee70dc53751c2fc5970ce159c3d370f4 |     
 powerpc64   |    linux-firmware-20240909     | NOK | https://autobuild.buildroot.org/results/7d87d18ab594a1afcf6dd1c1d6331eb29b71aab7 |     
   x86_64    |    linux-firmware-20240909     | NOK | https://autobuild.buildroot.org/results/4b59b22ed2500ad46cf4dc485ef4d31309ba0fdf |     
 aarch64_be  |    linux-firmware-20240909     | NOK | https://autobuild.buildroot.org/results/e28558bf4555c56a2261a33668d08ce668346b03 |     
    m68k     |    linux-firmware-20240909     | NOK | https://autobuild.buildroot.org/results/25fbf63fa474f1659c62f8b3c1701b8a482a8dda |     
   mipsel    |    linux-firmware-20240909     | NOK | https://autobuild.buildroot.org/results/77263fc21ae3d2cf8a050dd9b18e21dc1258d0f8 |     
  riscv32    |    linux-firmware-20240909     | NOK | https://autobuild.buildroot.org/results/ac0773bf595fb67370b9fea0db739a30116af076 |     
   armeb     |    linux-firmware-20240909     | NOK | https://autobuild.buildroot.org/results/8600454e1d538c7cbbab149b659bbce708b4acc4 |     
    mips     |    linux-firmware-20240909     | NOK | https://autobuild.buildroot.org/results/e546ff13bedf2526a324e1371dd37ac8a3cfc937 |     
   sh4eb     |    linux-firmware-20240909     | NOK | https://autobuild.buildroot.org/results/f780f0211c3be9bbeaa4df34d1cf96637d036b41 |     
   nios2     |    linux-firmware-20240909     | NOK | https://autobuild.buildroot.org/results/ac416317ace10f4398fe10547ce71b959f061ffc |     
 powerpc64   |    linux-firmware-20240909     | NOK | https://autobuild.buildroot.org/results/8d08f3cba54072ad8d0f62b134294d01cc2f3179 |     
   arceb     |    linux-firmware-20240909     | NOK | https://autobuild.buildroot.org/results/817fb10212545a6e8a4eb839bc91cada40905173 |     
   arceb     |    linux-firmware-20240909     | NOK | https://autobuild.buildroot.org/results/0f1dbfb0e2b26112e4392f036df3a3a69ae874e7 |     
  sparc64    |    linux-firmware-20240909     | NOK | https://autobuild.buildroot.org/results/245ad88da518b8880f56bacde410458981abdfdb |     
 powerpc64   |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/02e52636b8834e3a6c2a39ade37a877be1b7401a | ORPH
   arceb     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/604a65a077ccf0460f2d222160c27a9f811f09b1 | ORPH
  powerpc    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/f13ff9e54657b4d6b28074fc8c7dea2a52f27e4d | ORPH
    i686     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/821f407b27d2c0b9e6ba404a251e32bc845272a2 | ORPH
 aarch64_be  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/8fba5360b336da5f6623b87f53507b413d3b339f | ORPH
   mipsel    |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/93ffab2a7d3b6af6b65c492c7b22ae57c2d1d27e | ORPH
   nios2     |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/c18d0ba1d3d2e97881470ac0c81bcb399038f18a | ORPH
  sparc64    |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/2b00b49243549a3ef863bbde2b2327c97e475ede | ORPH
    arc      |          ltris-1.3.2           | NOK | https://autobuild.buildroot.org/results/22d54aa865b899fb37e5b026def0faeeb70b259d |     
   nios2     |      lua-cqueues-20200726      | NOK | https://autobuild.buildroot.org/results/22771348825c23cbf9b991f8a0bd4845566ce8c5 |     
    sh4a     |      lua-cqueues-20200726      | NOK | https://autobuild.buildroot.org/results/af6cff205f2bcb20e67853b3ca76c5c89e1b715a |     
 powerpc64   |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/27adad3f1d31e125b6efd1b54bb7ebe9710a6b2d |     
    mips     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/d388213c30f39a64dc4142a21410a01ce7ee3cb2 |     
powerpc64le  |         mesa3d-24.0.9          | NOK | https://autobuild.buildroot.org/results/678ff86d754cc8bd2d18fc275d08c521d370b21c |     
   sh4aeb    |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/fefc5795d58810f040d26a0b713a76793cd9eb1b |     
   armeb     |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/2b748c83f06a7549d2f63ac0d240d09807190c11 |     
   mips64    |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/ab547765f3f5bb2710c66624d32102fc1b486e1b |     
  riscv64    |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/171e235d639f162f0a6f4a237b8702bf503f1ccb |     
  riscv64    |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/471bf038a28b27c380a0baa31ef0024a62eaf3e1 |     
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/2923af46cf78ba0c8104871cbabf35946f57eb23 |     
   s390x     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/ed13fb719355102fcee1f814235d32510b267a05 |     
   mips64    |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/7bda795a3025d31aac9cf9f6fbb69ce379da2a64 |     
    i686     |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/eafcaad32f77d86f835a59ec8fb81fceef5ccde4 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/573bea90dc118800f40b05f7e037ed8140038a6a |     
  aarch64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/0322222893d7959d7a702c02a58a5544ac5a1c00 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/89e082159550fe4a9777a47e63ac69839aa9cd57 |     
 aarch64_be  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/e0a4cf02f8c0e23796c65e5328f3e3a483c067ef |     
  sparc64    |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/3611161d5e80b7c7b6a72f73e616c906ef093714 | ORPH
   armeb     |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/3105318d0b4e1e0e934d1b4a993f26f09f9400c0 | ORPH
   armeb     |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/8b92bb9178e17c65252c8da62c4b386f28efc047 |     
  mips64el   |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/97337f79e5ce6c27f1d32cade1f3727b898c1f58 |     
 microblaze  |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/5f6a439c57317ec2d11fb5e71fc193d0b77724ce | ORPH
 aarch64_be  |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/0b013224e36a42a5dbc3d50967645e59112b939d |     
   mips64    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/54f5d8c460972ddeeccb48d2ed6620b18f4ba9f8 |     
powerpc64le  |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/245ac5193044c4149c78a9e4ef87ddb610500157 |     
   s390x     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/3e667462c7acfa4f279dabdd5f935456eb9c5ffc | ORPH
   armeb     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/222f271f56a9c453e3d9dc935cb9b90fbfffef33 | ORPH
   armeb     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/a46f474b0b8d501777c8f8d7aeeedd6d875a8382 | ORPH
   armeb     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/93d065a65e06bd712f5aec9ad9f2b329fde7000b | ORPH
   sparc     |        postgresql-16.4         | NOK | https://autobuild.buildroot.org/results/94e130f38651e924df11db102e33c568bc952644 |     
  mips64el   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/6f97a29d00780bb3f2c51f383fe167d3d845b6e8 | ORPH
    or1k     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/19a0a91097b92f1d410790fae019969bc601affe | ORPH
    or1k     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/359f8343cac9ddb66f20c8cf6a1f99fc0b8cb0fe | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/af282664b0d558c1a19a756322b6f2cce0dc2165 | ORPH
  mips64el   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/a412eec24df85c0089844cac379afe1dcfc20d93 | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/bc17fbebbad5faf1898a8d29093c98bc55c589cd | ORPH
   mips64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/c5a10b3b60812188791912b0a269cb08cbc7bbae | ORPH
powerpc64le  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/5290b20524712b2c1b391533551bd6b69f3458db | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/276669083702fc4a5499832552d7f3edaa167f14 | ORPH
   mips64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/202bac63e6f0118bfc852360eedc01c51ef887d5 | ORPH
powerpc64le  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/67e757f2ae98c215c7345a923ca5c94fd5555c86 | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/aaa1bdb7a25c42b86e588e0bbfe91a205f512be8 | ORPH
    mips     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/3c3fb85f018fd6250c06754ed89ea31e77dce0a0 | ORPH
   arceb     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/93f5a11769cdd7baa690cba4666f71debb51f552 | ORPH
    mips     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/b0b38ee6777b16054e8ed4da7fe163da7088a730 | ORPH
    or1k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/b2dacf5158c122162733d27187a153d18396cfb7 | ORPH
   s390x     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/af854f26c71800bcebeaea728d661ff5d3af1905 |     
    i486     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/4e5334df606abda9b7584771bd872eb4c50b8583 |     
    mips     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/1454dc889fc6e5786f5bf33a5cbfef285b177250 |     
   s390x     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/14b5dcc7e8009423dc8d122f46125c77862fe0fc |     
    or1k     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/bd359a30d4be385da2889de33f3790a9aa92e63b |     
 powerpc64   |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/9ef0d5acb68bcd04fdb92013db9186120d8c79ea |     
   mips64    |    riemann-c-client-1.10.5     | NOK | https://autobuild.buildroot.org/results/3a6f1045f905809bd2a6b0d3296d58d06ffa69e8 | ORPH
 powerpc64   |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/e12c6d8d2c874e59d43e1ef58500acbf7f7c521b | ORPH
   mipsel    |          sdl2-2.30.7           | NOK | https://autobuild.buildroot.org/results/082e050b2d02fe4ff4b8c0742ec7f9630f0b02e2 |     
    arc      |        sdl2_mixer-2.6.3        | NOK | https://autobuild.buildroot.org/results/5ec09650d1c45acd6edc242a1d144f67f7da5925 | ORPH
   s390x     |          swipl-9.2.7           | NOK | https://autobuild.buildroot.org/results/2c600ab74174924ad43748861c586b19c2a9d6b3 |     
  riscv32    |         uclibc-1.0.50          | NOK | https://autobuild.buildroot.org/results/8122248ec215f7b36392fa493de3177ffce055fd |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/9c54453d28d66bba3d5618a2b4cbdb5d065a781b |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/8957afe529255012c65a6dfba5f4f8c027ea0921 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/a121f7206f04fb71384ad296240e85bd4b2605a6 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/84f95c2e32338a5043602b94f2ac2598f11d44c6 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/1ac98fd8c8226c23997b7a7ffbd5ebc6a44e6fee |     
  powerpc    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/40ce6f15c717de41cb38dc2eab7ddeaef1efdfe6 | ORPH
   mips64    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/4915e89ab4b68adce201121a93e4d95cdda8ef37 | ORPH
   armeb     |         whetstone-1.2          | NOK | https://autobuild.buildroot.org/results/c7d56e6d48d164b476a1937d54f152f85095bcd5 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                    zeek-4.1.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |           zeek-4.1.1           | NOK | https://autobuild.buildroot.org/results/4ef8570d0f88eac7cccc2052deed142c36626397 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                       unknown | 3 
                  ffmpeg-6.1.2 | 2 
         host-libxcrypt-4.4.36 | 2 
          libcamera-apps-1.2.1 | 2 
                beecrypt-4.2.1 | 1 
             containerd-1.7.18 | 1 
                 coreutils-9.3 | 1 
                  dhcpdump-1.8 | 1 
glibc-2.39-74-g198632a05f6c... | 1 
  gobject-introspection-1.76.1 | 1 
 host-binutils-bare-metal-2.42 | 1 
            host-fakeroot-1.34 | 1 
                host-go-1.22.5 | 1 
host-go-bootstrap-stage3-1.... | 1 
                  linux-6.8.12 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
               mariadb-10.11.6 | 1 
           mediastreamer-4.4.8 | 1 
                opencv3-3.4.19 | 1 
                 openssh-9.7p1 | 1 
         python-remi-2022.7.27 | 1 
                 uclibc-1.0.48 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |         beecrypt-4.2.1         | NOK | https://autobuild.buildroot.org/results/7b6fcbbc9c946b3481d83291028c1dd9d21f7d9d |     
  aarch64    |       containerd-1.7.18        | NOK | https://autobuild.buildroot.org/results/3661c521900f02812f0a67943f50fb8ec59ca1d8 |     
 microblaze  |         coreutils-9.3          | NOK | https://autobuild.buildroot.org/results/f5b7a567b6a9679a2b8d98c7e10aadcc1fe458cb | ORPH
 aarch64_be  |          dhcpdump-1.8          | NOK | https://autobuild.buildroot.org/results/1af9e9942267104ed75363235b0640edfd0dd82d | ORPH
 microblaze  |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/558861101c7580319848a0a455575bc2a54060db |     
  riscv32    |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/b1be0a932301496cd5f5a521658edc388a39355f |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | https://autobuild.buildroot.org/results/d110c8c96b2ada07164325d354c5b253e9c76378 |     
   x86_64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/520cf3ac690b575e815436386455591e2b16557f | ORPH
    mips     | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/2e6a98b3f5610d2724c2a97a2d17e7a4d5a3f98b |     
   armeb     |       host-fakeroot-1.34       | NOK | https://autobuild.buildroot.org/results/479b0b12319e662293cd731c3ad28371eccffc37 | ORPH
   mips64    |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/a644ce691018238b7d5b5f65538d92b46ee9d51b |     
 powerpc64   | host-go-bootstrap-stage3-1.... | NOK | https://autobuild.buildroot.org/results/0a3d73c6b0e191c34c9cc0aaf6d2b74b0c1e783d |     
    arc      |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/e6b1116ca63501d706ea6e47b9394855b60e4d79 |     
 aarch64_be  |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/3aadd00d40f2a19a9371e2a93f456b56a3cbdb59 |     
  mips64el   |      libcamera-apps-1.2.1      | NOK | https://autobuild.buildroot.org/results/5ff5a1e946da6e03bb3463dd695d3f9e3fa5116b |     
  sparc64    |      libcamera-apps-1.2.1      | NOK | https://autobuild.buildroot.org/results/e1df60d1050eff6bb8f7c41f4cd18923f717af33 |     
   mipsel    |          linux-6.8.12          | NOK | https://autobuild.buildroot.org/results/2ca126b59d9c1e8d42a5c9192ebba951028a51d0 | ORPH
    arm      | ltrace-82c66409c7a93ca6ad2e... | NOK | https://autobuild.buildroot.org/results/604d36483871844247d03a87b98414757b86c9a2 | ORPH
   sparc     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/ffc1fda51337788603d9304fd3a607dd8d86ac1d | ORPH
    sh4      |      mediastreamer-4.4.8       | NOK | https://autobuild.buildroot.org/results/b93f3d26988bf0c1d5c1f70f707bebada43f740e | ORPH
   x86_64    |         opencv3-3.4.19         | NOK | https://autobuild.buildroot.org/results/32a890dee595a573a5474ba131e19922a03f9249 | ORPH
powerpc64le  |         openssh-9.7p1          | NOK | https://autobuild.buildroot.org/results/467f0692ea1f0fd8a22477ee4699d08f24b87d14 | ORPH
   x86_64    |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/b3ced8afc49ac04739e3c68bbe9a61db3f21f4fb |     
  riscv32    |         uclibc-1.0.48          | NOK | https://autobuild.buildroot.org/results/074750c572f19ce25fe75cfabcd2e70dce60d935 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/ed540d337ea0fbd5b9e7204005b6284420efe921 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/c8cc9ec2c5c5252c5e053fc278cfbf7408f77666 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/5efd62b615d455b6cde4bbe1e910270c1329cd20 |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

                    bat-0.24.0 | 1 
firmware-utils-86739f2b3ae9... | 1 
               procps-ng-4.0.4 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/78586dee0171fffb4d007afb41ed6a7a29de0e14 |     
  riscv32    | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/862a8ac938586dcfe2db169daa81203c81c15e51 |     
  riscv64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/8d789027c4659a22ec849de983b09d4c5a170670 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
