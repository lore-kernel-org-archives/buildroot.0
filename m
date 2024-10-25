Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDE4D116E2
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 03:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AD0A407DE;
	Fri, 25 Oct 2024 03:18:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7QZ41DiUY159; Fri, 25 Oct 2024 03:18:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4596405D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4596405D3;
	Fri, 25 Oct 2024 03:18:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 918A6497A
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 03:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E6F04065A
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 03:18:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dtkllEgdrg_N for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 03:18:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E41E040504
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E41E040504
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E41E040504
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 03:18:10 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a9a16b310f5so232060666b.0
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:18:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729826288; x=1730431088;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WS56qhtJgf6OUc/8+tFE46NlLVVz+kalm6wWdOBaJ2w=;
 b=sFWi9olYxnDpuDgG+cd446ymE16rR2TXuJvpM6Il8ZJ0JMcOiO9xNPIednueO8Vkul
 ygBNr3x1RX/0g0m0GI9gKUfBwy3qkK/3MeDtBPdKQCRkdQXjz2TiQKIxs22vrBQOPZvO
 MdnlHSjjquKzWGKkduwizW9mcCwKTLlWuj+FvUz+yyHTd5hNbIROZWfpvlxLn+2LUrDU
 ihS2scb5Kj7zE6k1Snz1Y/xwrm/+lLKuFPDtBHSdwu63+e+6L2qmbSuDffRMaCXTWKZ9
 v3zuJjKGbH+wNzdXDmBF6U2cYQpmOUQ2P68OPNRov1F3qDcHYCQX1G9DIrk86dfX04L9
 iUqQ==
X-Gm-Message-State: AOJu0Yz78AWBm5ibB5OVRJ7gkWgOGc0Kxmq3A9hMMUlBv2jQ/4lCMAh2
 xR63gYbywjNObWpON32UDeYXvUPr3IO9Z7DDcltUxhQDuitFEOMEVJwXYg==
X-Google-Smtp-Source: AGHT+IEB4hvcH2aBSstRSti4wEIIawKFb3asdDY5Gh/W8WWl/QsXjAIUsXRyZMiK85dAxUhce8SbYA==
X-Received: by 2002:a17:907:9606:b0:a9a:6bc2:c0a3 with SMTP id
 a640c23a62f3a-a9abf85c4c5mr839921866b.7.1729826287647; 
 Thu, 24 Oct 2024 20:18:07 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b330bc410sm16633166b.185.2024.10.24.20.18.07
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 20:18:07 -0700 (PDT)
Message-ID: <671b0def.170a0220.362637.05c9@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 25 Oct 2024 03:18:07 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729826288; x=1730431088; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=WS56qhtJgf6OUc/8+tFE46NlLVVz+kalm6wWdOBaJ2w=;
 b=ByqtMQRsNoN1zVsgt+bc8r2FEOSosNK2/9Yy+kOU8gzRgKvSl4KhSf/UNPAFQ12TMX
 0Kd6F2igUAg5UDpC7rLmerC62O+YO3C77F6h8nyOIjXJCgX1RvT8XivUIledZ7AwKoKz
 ehupvbOMF/1LhNOT3/80RI5wf6o33cyybZ8plGAkqZEnYKwMvPhV7r26hRbp2SsUSFB+
 uWqucYEvztU8qK/mgFv3LyHdgfLxOWkreWMmOnXlNA/jHb0/HuYEmoMs4PrE7cGVTLCm
 9krch7b5oc+ypom6cnLEHntFi5IFhZzUnneSZn3OfWkdtYY6ZiFf1Fyxp6HW9s/eFAn3
 u7tQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ByqtMQRs
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-10-24
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

Autobuild statistics for 2024-10-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  3  |  1  |  7  |
  2024.05.x  | 19  | 25  |  0  | 44  |
  2024.08.x  |  3  |  6  |  0  |  9  |
    master   | 15  | 299 |  8  | 322 |

Classification of failures by reason for master
-----------------------------------------------

               procps-ng-4.0.4 | 24
           libzenoh-pico-1.0.0 | 18
             dahdi-linux-3.3.0 | 17
                  linux-6.11.3 | 15
                    git-2.47.0 | 10
                 gnuplot-6.0.1 | 10
              host-rust-1.80.1 | 10
                  ntp-4.2.8p18 | 10
         gobject-introspection | 8 
android-tools-4.2.2+git2013... | 7 
                   foot-1.16.2 | 6 
            host-binutils-2.42 | 6 
                 coreutils-9.5 | 5 
           host-librsvg-2.50.9 | 5 
                 apache-2.4.62 | 4 
                  bcusdk-0.0.5 | 4 
                   eza-0.18.22 | 4 
 host-binutils-bare-metal-2.42 | 4 
   host-mender-artifact-3.11.2 | 4 
                  libsepol-3.6 | 4 
                 libv4l-1.28.1 | 4 
                    azmq-1.0.3 | 3 
             berkeleydb-5.3.28 | 3 
                elfutils-0.189 | 3 
                  evilwm-1.4.3 | 3 
         host-libxcrypt-4.4.36 | 3 
               linux-pam-1.6.1 | 3 
                   mimic-1.1.0 | 3 
                       unknown | 3 
           at-spi2-core-2.50.0 | 2 
  binutils-arc-2023.09-release | 2 
                    bsdiff-4.3 | 2 
               ebtables-2.0.11 | 2 
                  ffmpeg-6.1.2 | 2 
            gettext-gnu-0.22.4 | 2 
  gobject-introspection-1.76.1 | 2 
           host-doxygen-1.8.18 | 2 
    host-python-greenlet-3.1.1 | 2 
               libglib2-2.76.1 | 2 
               libunwind-1.8.1 | 2 
          linux-5.10.162-cip24 | 2 
                  lvm2-2.03.27 | 2 
              mosquitto-2.0.20 | 2 
                 openssh-9.8p1 | 2 
               popperjs-1.16.0 | 2 
      python-autocommand-2.2.2 | 2 
               valgrind-3.23.0 | 2 
                 wolfssl-5.7.2 | 2 
               alsa-lib-1.2.12 | 1 
                apparmor-3.1.7 | 1 
                    bat-0.24.0 | 1 
               binutils-2.43.1 | 1 
                   bird-2.15.1 | 1 
                   bullet-3.25 | 1 
                 c-icap-0.5.10 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
          cloudflared-2024.6.1 | 1 
             cni-plugins-1.3.0 | 1 
           crucible-2023.11.02 | 1 
          cryptodev-linux-1.13 | 1 
                   cvs-1.12.13 | 1 
                  dlib-19.24.6 | 1 
                espflash-3.1.0 | 1 
firmware-utils-86739f2b3ae9... | 1 
                freerdp-2.11.7 | 1 
            gdk-pixbuf-2.42.12 | 1 
                  giblib-1.2.4 | 1 
               graphene-1.10.8 | 1 
                 highway-1.2.0 | 1 
          host-binutils-2.43.1 | 1 
           host-checksec-2.7.1 | 1 
           host-cryptopp-8.9.0 | 1 
                   host-go-src | 1 
 host-softether-4.30-9700-beta | 1 
httping-0e26c53d5fe504eb720... | 1 
                      iwd-2.20 | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
             libargtable2-2.13 | 1 
               libcodec2-1.2.0 | 1 
               libdeflate-1.20 | 1 
                libesmtp-1.1.0 | 1 
           libfreeimage-3.18.0 | 1 
                liblinear-2.45 | 1 
             libopenh264-2.4.0 | 1 
              libopenssl-3.3.2 | 1 
                  libva-2.22.0 | 1 
              libzenoh-c-1.0.0 | 1 
     linux-5.10.162-cip24-rt10 | 1 
       linux-firmware-20240909 | 1 
            linux-fusion-9.0.3 | 1 
             lirc-tools-0.10.2 | 1 
         lttng-modules-2.13.10 | 1 
               mariadb-10.11.6 | 1 
                    mpir-3.0.0 | 1 
                     mtd-2.2.1 | 1 
                  multicat-2.3 | 1 
            netstat-nat-1.4.10 | 1 
          obsidian-cursors-1.0 | 1 
               openblas-0.3.28 | 1 
                 openssh-9.9p1 | 1 
                      opus-1.4 | 1 
               pax-utils-1.3.7 | 1 
                   pcre2-10.43 | 1 
          perl-net-ssleay-1.94 | 1 
                 pixman-0.42.2 | 1 
               pulseaudio-17.0 | 1 
    python-cryptography-43.0.1 | 1 
                     rauc-1.12 | 1 
                 rtptools-1.22 | 1 
        s6-linux-utils-2.6.2.0 | 1 
             strongswan-5.9.14 | 1 
                  whois-5.5.14 | 1 
                wlroots-0.16.2 | 1 
xr819-xradio-3a1f77fb2db248... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        alsa-lib-1.2.12         | NOK | https://autobuild.buildroot.org/results/2cedde074287be3385cc182a79dd6a4ce06a1a0c |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/5b863469ebab7e3c4bdab5d09d363be2145ec8a3 |     
   mips64    | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/0731257d3b48ccd77970511c23875a9977a5d4fb |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/8f6b2a0e662cc7b8a9fb0c0802538212d68661a4 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/2020accf81d46769d71b213aab6a5c5da1811a27 |     
microblazeel | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/b21eb5d4a6f490b9dcc484e137a971907992211b |     
    m68k     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/44f94385fc2c94ef2d70390c155ec17215209032 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/af4bf8c4b9c76b44ed2479efa149d19b518dc76b |     
powerpc64le  |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/cd94791c0dc7314a1dc91ccc66a8ed5832487afc |     
 aarch64_be  |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/66c1b7fec1d1437687b35766ef08687d523fadb0 |     
  sparc64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/483d8b30b207edd51db344e7777f5e7a0321f78f |     
  sparc64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/f30c2ca8670a09aa781079ea1293677839da8959 |     
    arc      |         apparmor-3.1.7         | NOK | https://autobuild.buildroot.org/results/ba27df7e8a085773ef0f562571d9c37e770163cb |     
   sparc     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/d9289eba9f34ba950d4f9c93794d4911996d1aa5 |     
   x86_64    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/99798cd1fc5eb686b76820bba96810cb65643ea9 |     
   s390x     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/4e4d74ec73744d590bd6f0b3ee8f960911eb1885 |     
    i586     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/e2576ea4016c70d33f0ffd05d81133c701c06e2a |     
   s390x     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/e8dc2028f3f0b74bd4e78612a8eb759c92d66e0e |     
   x86_64    |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/2bac1a32d101e3c79ec2d6e2086db274c6ef1fc6 |     
  sparc64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/40912a82dde80e8d8a2b6bdd8e8fe947f2161fee |     
   nios2     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/8cef589c65c454e2152c3c6ea5b383113045e620 |     
   arceb     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/c26cfe7ba72626bdc270afa33385c800f91e276b |     
  sparc64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/e1be7a8b268e875b3ce9c473479a659bb7009358 |     
   mips64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/4398cae0d3c449267abe047a20e46b3b8fea1427 | ORPH
   xtensa    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/c95457866f7b8286bad9bae0607cb0b1d66ac7e8 | ORPH
 aarch64_be  |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/aa0f4cc92f617eebb250d68d2a36cc4e337f7a05 | ORPH
   arceb     |        binutils-2.43.1         | NOK | https://autobuild.buildroot.org/results/9a25d3e6049d3590d3e191886b68ce79f36cc9d5 |     
   arceb     |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/547c86806e6a81f0709a3369d1f971557a8e8814 |     
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/84fe1a2a602b192d8d18aec64123dfa56fe79188 |     
    m68k     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/64433a3ad79134f45c9a9c806572fe358d103e67 |     
    sh4a     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/6c0066e68d7c09f6b93215ea9669ff7c79469278 | ORPH
   arceb     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/9f69017759d9bc2828760947c080c76b5de3c8af | ORPH
    arc      |          bullet-3.25           | NOK | https://autobuild.buildroot.org/results/cbf7aadc9218c623344e6edbf5d332317712875e |     
   mipsel    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/f76115ef35803fa754857fa1a3ae35c40430597a | ORPH
   mips64    | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/a516956208058b5e41d341f02e5195ed6905804d |     
  riscv64    |      cloudflared-2024.6.1      | NOK | https://autobuild.buildroot.org/results/b93c6cf7316f2bbb78e4279299d2385ae30475e2 |     
powerpc64le  |       cni-plugins-1.3.0        | NOK | https://autobuild.buildroot.org/results/996f945b8defdb2608d8c33247cdb35def425ed3 |     
   sh4aeb    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/478ca1f080cfcc24debff054d2b98eb386264e99 | ORPH
microblazeel |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/e1d0d542a7bed86f6435ae295c95438743382a78 | ORPH
   armeb     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/93ade790053fd143028c149b3ae75b157a0b8cf2 | ORPH
  mips64el   |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/f52c397117e54b114dacf7aff4521f3ef39dd8c2 | ORPH
   armeb     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/94003a9f85f661b59bae3273a47994a275cf0f70 | ORPH
   s390x     |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/b6aae648b3a3c21bdde808bc95c919c807fb149f |     
   mips64    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/cec221e0ce03043eb18e31c01924636da1273289 | ORPH
   nios2     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/f6171954d7042bb3c0f7ef5634db0eac285a3829 | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/1ffa20c7e31af0ba2b27494a7b977b28bdf6a732 |     
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/bcbacb7da84e0e24d62d7cc15e90a3a845de9556 |     
   sparc     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/954845a2de502011031de00956aaaffcd2a5910b |     
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7ed9d7b7c696508892f9ae0225852d27b9cf1bfd |     
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/c8f80c4dac7bc09f39ab5e7589c06d152c5ed222 |     
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7dd3b7f2b34ea82ddfd34652ad3ea17839eaefdd |     
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/8b5bde9f9a9f807be7f39cabba0f2f4e3758ca3b |     
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/5a4c28ff35c64931d70bff8fb1bd63def9a2ed1d |     
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/ee28a12ec8585c708400be6ade9cdd2ed3a0240f |     
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/540fe48f66109e26651913c5ab3da19546ef51dc |     
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/ecbf67adbab493ab9f4ec71fdcbcdf14aa617b8e |     
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/1eec1d9838743b0d5aa94603d79970e790a1c6d2 |     
    m68k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/6ca2ffc5fad7f7cdddfb14931a362f6875874bc6 |     
   sparc     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/3f1cf3c1aa9017c44e4e5dddd29f9ab30045e8b8 |     
   sparc     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e44a98de3841ad8a2714d84da80fafef92007630 |     
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/6da423b74d457341bb05fa461a82394604be39aa |     
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/c1fef552345d2cbc09bd35d60ce22ea04583df72 |     
  powerpc    |          dlib-19.24.6          | NOK | https://autobuild.buildroot.org/results/6e30dd89c98fa77a62ccceb978aca395832383d7 |     
   mips64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/291c19a2a3f61698c3dbd2ac2dd06ee43b4c4185 |     
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/129ed67e9dcc842ac297ad067b0d53f5c363f82c |     
   s390x     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/cea2b5637b1efb30a615ae08f238aa6c62fa6685 | ORPH
powerpc64le  |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/d8492c22d5ba952f73e168724682c99242050e2f | ORPH
microblazeel |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/209f356f79999f52e929b5de7e5cdd49acf6d602 | ORPH
  sparc64    |         espflash-3.1.0         | NOK | https://autobuild.buildroot.org/results/60905f2f080b7823605958cfb4ecf0bb73c03b1c |     
    m68k     |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/74c242ad56cdd32432445bee26f6fdba008b027c |     
powerpc64le  |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/c3cf66265e2fb550dd7bec67df7bcb1f2b0af63c |     
   armeb     |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/1439b17b4fb2cd473f1bc5cd0489164daafb38dc |     
  sparc64    |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/d0a52f9d59e186049dab59cbc0285dfa47986941 |     
   s390x     |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/31a6f644f6bea945c50203a8642495f5669fbde0 |     
  aarch64    |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/bc9df969e0e8cdd29c6a6e0c377310bee2319aca |     
 powerpc64   |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/8691d059548e0f1e00ed7ccdd9f2df138baa62af |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/996b1c5503441539ce35b691d1b312ef82e93f00 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/f2eea41541fa6e38d95aea6834c73b6cb390885d |     
   mips64    | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/fd3a4fff9377b6e191ade36c6b4f3ad9466f800e |     
microblazeel |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/5c160ef69e9ab3add53431ba7ce1327ed8b8a9db |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/e99a606fa78750951f42bac6284fec1cf19c1ea5 |     
 aarch64_be  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/8cc2a816c2def6ac16c34b3fd7c0dfeb6c030886 |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/c0361b4269cbd008abf308addbc83d06b76f1ee1 |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/c11d3796d72227eeda9c727d941f3f431f568472 |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/34173cd95a0ccec4fb230ff40e058fe86ff0bb7e |     
  sparc64    |         freerdp-2.11.7         | NOK | https://autobuild.buildroot.org/results/4d0be5049ae06bf1cfca09726b7ce3dd004ad907 |     
  riscv64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/b0b8f6b6eedcdaa09fe6d5424dcc6e18c01710ad | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/12b30cde646ad80961491f46b30c94bcfd53b736 | ORPH
  aarch64    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/47b08dcb21568f907835d45c4b072d7c36ebaa6e | ORPH
   armeb     |          giblib-1.2.4          | NOK | https://autobuild.buildroot.org/results/cc08eb6eeb98c8265c87ad329fa67eb0f5c1e4ab |     
   mips64    |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/545d48dcd9bb4243215d773336241cda526db559 |     
   sparc     |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/85dbf87451156fce7c2a12d8882622ea75e0d0db |     
    m68k     |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/5d197525f2b8e930c5e7ca9ca083114b2fb710ee |     
    arc      |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/e3dc87073714ffa8f5963158ec6f9c0c9aa7bd86 |     
    arc      |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/bea4764440d5f2fbca27f564d665076e0c7ac760 |     
   sparc     |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/98c22a72c9879ab17427c1a17f9c9988b35558d8 |     
    arc      |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/cab0532d06c153c4a0ebf57709bf6545cf67bd92 |     
   sparc     |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/7b7ece5a258cfd9422036c79004b5d8067f4c82a |     
   sparc     |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/9b3f0d301553f073d4e1a3ec7f8530a296f9469e |     
  aarch64    |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/8d60ab095c5a0f0707f12e1642fc1a04c3ca12f8 |     
  mips64el   |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/8db1be9cbcdb9bc936b67a67afbe9c5dd2839fc2 |     
   nios2     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/66c0e3baffb078d15118f934d06b4fa5fd7ce134 |     
   nios2     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/c194c60905fcd8db4057f2c1dbb0c52d642915a2 |     
    or1k     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/6979b19fb3cc3d8eb17d10146f895c24dad12a2e |     
   nios2     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/6b1b696b9920450b833d78420fb042bb2ff1ad7b |     
 microblaze  |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/8a6c3474f465d716702c1424630a424cedc35ac0 |     
    or1k     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/61529de03a833d848659b1485e1fe5193d074b73 |     
    mips     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/3aeb22e9e42721afd3f63b26ecdbf68a6445bc4f |     
    or1k     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/692ef562b8c7a2cf9da0df651b3a8795cf9fcb2b |     
   nios2     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/b243efce654d46c27cdf36dd8cae7e5e5662229c |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/215b1cec6866b47027a97795f2f06dc753f66d0f |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/a079648a20df3f319393787da40b2ac3405ac74d |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/bd0f3c4d55a4c937604617741f5b74d1a9fb5b5c |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/2ca6ea62010c05e0240fcb930d51acd1ab4932d3 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/8672b09c637fabd4831f1d810b1707769de9448e |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/052764d8b5f4d1f8e6de5aac3534d68ccc8936f7 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/395114855d89d676b4c1a04a2fcd791520977cbf |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/23d6d5071b073fa93d7be0a8a702406e99ac3c5c |     
   x86_64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/6d157c405256799665f78eeb2b7ce623162cd3ec | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/2d302d17f79212af6459c61ecd704c16cf5653ba | ORPH
   mips64    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/e24bebc875aa056d1c96dc181189f13744d08a10 |     
  riscv64    |         highway-1.2.0          | NOK | https://autobuild.buildroot.org/results/c4b45124ba89be914882eacd620359ddb0821527 |     
 microblaze  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/807ddb0a13e03ed5ffac35b749b0fe82258d1ae8 |     
   sh4eb     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/f8a5de3193ef7d6494513e51d98d322b9599c884 |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/b530f1a1256d183cc4ee9e99e8fbc7690d3d9df1 |     
    sh4a     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/9e9ad393dde2d803e32ad813e1d01196b01079e3 |     
   xtensa    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/b9e807490b8b863f889fb67b81b62ff26fb29727 |     
   s390x     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/2c2e191039270232a2a2cbaf4d5f0ba02fa80308 |     
 microblaze  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/7af427ef3f7a0b9e2dd8796f414c58ad24e3a209 |     
    or1k     | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/121bc3349d6b7a9d6ae5f6d10e2db2781a8db90e |     
  aarch64    | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/ad5ddd7bec1a6d36eb28bc729203e83e0e5d4a12 |     
   sparc     | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/74cb9cb29cf717e28557aae1bc0bc3bb5ae01b62 |     
microblazeel | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/6dc6e1ac82026a44f5d385f7e53eab9cebedb5ae |     
    or1k     |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/ca3c7031f6b001b6a9e8d0513d02bc715b0c9f22 | ORPH
    arm      |      host-cryptopp-8.9.0       | NOK | https://autobuild.buildroot.org/results/00bba659c3e79ede3c59a96ca079580851b67c13 |     
   s390x     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/aa8fc631f25d7537cd19f21c9487c28a100a16cc | ORPH
  sparc64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/0a48cb68a4751a43212b521742ec9078e6f89bf9 | ORPH
    arm      |          host-go-src           | NOK | https://autobuild.buildroot.org/results/5396ed8b1bf646e59da8a0b8c52ec86fded69a3f |     
  sparc64    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/9bcc03346bec9f5c3c7bdcc8cf241e075151b73c |     
   arceb     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/ca504e15eaaec6ea6d5e8447cfa4d9f5370e375e |     
    sh4      |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/172c7b17e4c651b00bcf6f18eb305fad42efb9fd |     
   xtensa    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/dad5cf126538e55d3e0d25f05d20114c3f2465da |     
   x86_64    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/986d5f2e954a047a362b5ec97d70fa5149c75da3 |     
 powerpc64   |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/08ac8316f488f7e731c2a2b748fc4ef9518aa5c4 |     
 aarch64_be  |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/d19c355c49369d4ac22053c627658f5e852a8b1f |     
  mips64el   |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/d636bc08a4327632056d2bda9e4c308bc1976c03 |     
   mips64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/e5a87331c9d83844490c6b88189eaed4b4e092fd |     
  mips64el   |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/87578b4501245a983011a4baf44e9c0192592a3c |     
   s390x     |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/06565c77cbf23a29fc4f89ee79220af2c2d1ad48 |     
  mips64el   |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/8d042e4634601c3e9fdc089b4f8e232c47df9f44 |     
  mips64el   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/07deda4d93f7deb5a50ea9319633e365f3ba9aaf |     
  sparc64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/640a7eb7bee3358081fb96c3ab9a4e768e024191 |     
  sparc64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/62722a00c3027dc28a5ec657627a95ddc18b023e |     
  sparc64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/90ff1644b06c9874b842f068541021adde755283 |     
  aarch64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/f43a6b8084b968e8a9da5f29e1be294f16e568f3 |     
 powerpc64   |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/fcbcc94a67225c5254f6d79dda8db808446409a6 |     
   armeb     |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/f1230280c09f43c2ae34404cd883da18d591fe17 |     
    i686     |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/6383f150c2ceb6aac71e31773e9ecfba95ed6224 |     
 powerpc64   |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/721cb36d02283c98a935099757a0b0ac99e1f49d |     
   s390x     |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/5dbab2265c6c54712c8614b356921353cfc64b22 |     
powerpc64le  |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/fa16e1bc42f62ac68f457d4d1bee0ba481a63a50 |     
  aarch64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/7f15d426c7cb9306c95c1b8fa9a2e1334ea0df0d |     
   armeb     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/c0dd533d8525070120a1c5c5d4f5d4ff7ce81f24 | ORPH
  mips64el   | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/ff9e68ba452aed727992e7ea8c50c00843371558 |     
   armeb     |            iwd-2.20            | NOK | https://autobuild.buildroot.org/results/1cfb1bb83c155a0725402f6cdc08ffa33034cd95 | ORPH
    mips     | kvmtool-4d2c017f41533b0e51e... | NOK | https://autobuild.buildroot.org/results/362e052563d0d192e08fc979112928ea94e13e33 | ORPH
   x86_64    |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/17ff003090449ee45c1f7c69c68b99dc67076ad9 | ORPH
   arceb     |        libcodec2-1.2.0         | NOK | https://autobuild.buildroot.org/results/4ae066c9e2d8d17b4c5331e4f41051b3ed874fd7 |     
  aarch64    |        libdeflate-1.20         | NOK | https://autobuild.buildroot.org/results/3f46173356da870d6050c3462eace06cf95b7c19 |     
   nios2     |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/cfc503e78d4092aaa25667aba680f6a7dec0641c | ORPH
powerpc64le  |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/4aaeb4b9b9053b4e70ae8c400b0105af63989968 |     
   arceb     |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/bf24b665d3e0264c6ef21fbd99b2df5bf6e19d5f |     
    arc      |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/0007e8b8365a5d5226673f69dc187a0c7626aef7 |     
   nios2     |         liblinear-2.45         | NOK | https://autobuild.buildroot.org/results/0b77b03b042ce46f0436019b9a907cf435eaebfb |     
    i686     |       libopenh264-2.4.0        | NOK | https://autobuild.buildroot.org/results/5179ba700838bd2e4a19f07eea221b4ee2995f5a |     
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/f7d483859d7d2529991b95288d54b8a6046efef8 | ORPH
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/7fbc7dd0b9f168c451d3b548c43b5677a6e2b16a |     
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/304372a585a6721371adef45d70d2f02868f8634 |     
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/c639970a4a05f788d01d7ccc3d2932395462eabe |     
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/f4589e4efc6350110131e5b7d4bee9746d8fd8c8 |     
    or1k     |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/70072770b31e6096cdc4c1580e25c34819978365 | ORPH
    or1k     |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/e0fd3457465a6f2e41159767d7a5abb022ae0f3c | ORPH
    i686     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/bc3602092d250f0944cd05d9bae6e0ea68343939 |     
    arc      |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/d0c95629729d68934f3139328bb7a38e50aabb4a |     
  mips64el   |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/9783e1a95c296740ed64c5c771629d6313438eda |     
    m68k     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/81e541a555b53ed799f5f09df3b90e9dec4169a5 |     
  mips64el   |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/fc211245055800e11513404f8742db49efb08739 |     
    arm      |        libzenoh-c-1.0.0        | NOK | https://autobuild.buildroot.org/results/abe0bb4f943ced31ab18fda537efb07dd81c1e33 |     
   sh4eb     |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/d822600543699815f380bedc4c4e3ed56a1e599d |     
   mips64    |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/b2cb1074430a9cfb7790907f6863f1ad8b303e36 |     
   sparc     |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/462a53c4de62e3791f4172fb0c8e3d48dac93c01 |     
    i686     |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/39255bb0cf62c50c4298800797a10e47ee42a066 |     
   sh4eb     |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/ab876ff430d01dd8b52a7358e1679b6a8d59930b |     
   armeb     |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/0d96cc440c8249aca2b692a2bcd484f77cfa87fb |     
   mipsel    |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/89f8c1d66aec77e2bbff7d833e6bb251e994c29e |     
   arceb     |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/120e8e82eebcd4515c3e7c2f655d6dceaf01edb0 |     
  riscv32    |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/6cad4b9d303251e342bbf571bc3378c51c74df9e |     
   xtensa    |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/bcbc5c922f46a5c2c46ab8b7079d71668b4e99f4 |     
 powerpc64   |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/713547b536f91f055da62766277888656d52d8d6 |     
    mips     |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/0f155e75606907395f3efc2beca80b8173ae6ce4 |     
   s390x     |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/54c95928e1fabcad5c8c7064115b5d3a2db79379 |     
   sh4aeb    |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/03fc49e1e7a60fbd3aca99f225998ee401873661 |     
  mips64el   |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/937217474f2d7e2b3a9a7e2a23dfcf0abf8978ae |     
  powerpc    |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/ce6ff5406a8c1c3d237c0a9a3d5509144c63d846 |     
  mips64el   |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/ba731a9320985f8ce360442fb689371c33f8d334 |     
    m68k     |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/3b13f3b3b5e14a3a835f57a257906cade9502af2 |     
 powerpc64   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/8c95fcef622041bcdd04d7ed8aa0c106deecf774 | ORPH
   x86_64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/4be8c38b51e953084370da6e86ccb3d51bc99e44 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/501a25546db2a180be5c97bd63e0b9e9d5dfbf40 | ORPH
   mips64    |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/b97105670c0f5e2dfad528d18418773004ade80d | ORPH
    mips     |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/4a9782e73d2bb72407f048a4c847357650c30c57 | ORPH
   sh4aeb    |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/f2b7aea329c8f30758f83166fe939a904ecc0c8d | ORPH
  powerpc    |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/25da968dbc89701b47d9877b4c26bf1bde439844 | ORPH
    mips     |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/82cebfb7b859543a6d187efdf307c5851b2c5295 | ORPH
powerpc64le  |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/6b69bb2f03cb383a0b877ba0d70ecfacd372788d | ORPH
   armeb     |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/8bbca3b1b052a031b50813df5ee4a0748ac58bd6 | ORPH
  powerpc    |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/7aabcbb84e7074742cb71d4f1fc681e854080e18 | ORPH
  mips64el   |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/fbb4b2c8a67125b843024096bd9206b7c30fd4cc | ORPH
   nios2     |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/370bf0d7c5a0694ec3732a5960e6b0a69c1935f9 | ORPH
  powerpc    |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/287ebd3c8e95e2fc800514857bd04f31f734c3fc | ORPH
microblazeel |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/ec44f37f6e6e04024651dd3383c34316c2bd6506 | ORPH
   mips64    |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/628983c18c823e1707612826104d1a7a2e9c45b1 | ORPH
   arceb     |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/f6377db2032ac91e052a95dc4b1543b9c82b6e40 | ORPH
    sh4a     |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/fd9b260c63de2ce783a33ccfd12e3bac0a0c6a47 | ORPH
   nios2     |    linux-firmware-20240909     | NOK | https://autobuild.buildroot.org/results/e6ef43434195e3492f0273ed8c78f84ee7991f31 |     
   xtensa    |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/07174d6b9e5b6f5e334e9a710c4bf2f4cffaf40c | ORPH
microblazeel |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/c236b9909ed24d114dc6159480c30d28f5e77d7c | ORPH
   arceb     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/0cdfba5e453377dc30b077d88c9285cbf6fd9f72 | ORPH
   sparc     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/bdf734efb840522aa4d57c8821080ec28083afcb | ORPH
powerpc64le  |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/c8b10626a660c379a3d359a76f838914482bf56a | ORPH
 aarch64_be  |     lttng-modules-2.13.10      | NOK | https://autobuild.buildroot.org/results/2fca59409ce164dbdc62c296128e634c686b6faa |     
 microblaze  |          lvm2-2.03.27          | NOK | https://autobuild.buildroot.org/results/cdecfa96ede6bfc4bd34af7361aa1e92931f545a | ORPH
 microblaze  |          lvm2-2.03.27          | NOK | https://autobuild.buildroot.org/results/27339863c403daca5ad3486de58c6b1df2943c56 | ORPH
    or1k     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/098966ceb8d9fa063a9456e64798e8c88214ce5f | ORPH
   mipsel    |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/e90e429222d8aae2e4455e1afff64eaf0c23d2c8 |     
   nios2     |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/fe9cde38f375dd15411a42d6dcde67d95f062b6f |     
   armeb     |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/398d3aeeab477fdd25018a6d59a91386ac84de96 |     
    mips     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/0f1bccaca7bab32e65c430da0b51b033b7fad721 |     
    or1k     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/9ed897f3a96caa782411f68dc1b3aafb3e012a83 |     
    sh4a     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/f9bbec7e46f5ebc8dd9cec67ba9a4363a76c927d |     
    or1k     |           mtd-2.2.1            | NOK | https://autobuild.buildroot.org/results/f59d46bc73232b0380285994f80bdf835ce487f8 |     
   x86_64    |          multicat-2.3          | NOK | https://autobuild.buildroot.org/results/da5f2a034edd7dd9f04f7ef374ce762d7f645521 | ORPH
  mips64el   |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/2a32a5b8117ca6960119c6639e7bf5ea7612b982 | ORPH
   xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/f91b2ce29ef00aacc3c7cd4c293ff12de826d37d |     
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/98eae357a5e45055ac48ae25eac3f5b2b4c85764 |     
  mips64el   |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/876831f5b0c96cd4c3ae72c2f66c3d158a2123b0 |     
   arceb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/c7ca9426a152efd2823052ed7cc06c56dfc3060d |     
   x86_64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/4d001f680e2b889a6a2c24e5032738881d52b72d |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/d7d5f8047f49fe790f9828102a929915afbd0584 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/f700098622c657abf3614f2ad4ac7a8bd1fa79a3 |     
 aarch64_be  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/84310b335016c4abee28cd86a3378856e420ce82 |     
powerpc64le  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/d2460b3107f6e8c5504cb0b887153e900a5daf81 |     
microblazeel |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/c6f45a1c1c59f1f965ba4567866315fdd633ec1a |     
    sh4      |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/00acb7898988edac2fa52709ccbf38fd8cc84c35 | ORPH
  riscv64    |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/0a0d8c4cadd5fae66178a225c140982576f0aea1 |     
   mips64    |         openssh-9.8p1          | NOK | https://autobuild.buildroot.org/results/386ec8741370022f69755aabba0f9fdd45770fef | ORPH
 powerpc64   |         openssh-9.8p1          | NOK | https://autobuild.buildroot.org/results/d83e2878404bd71a400bbf317e78a8e92b1ca014 | ORPH
    sh4a     |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/3628de8f9d5092769cc4b7b28fb460e07097c2a3 | ORPH
    arc      |            opus-1.4            | NOK | https://autobuild.buildroot.org/results/d34fb72db06ee34ee977cbcaf03443a8882b4c89 |     
  powerpc    |        pax-utils-1.3.7         | NOK | https://autobuild.buildroot.org/results/e8a3abf955584e5109c2df384e151fbbbd82664c | ORPH
    mips     |          pcre2-10.43           | NOK | https://autobuild.buildroot.org/results/a9bff31f615a4edd29df542e5ae31d69477c9cf9 | ORPH
  powerpc    |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/e161418d9d05f154f338523ef9fded46fff9b6eb |     
   nios2     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/d3a237a4bb02008165d4754e242f4d4dcae2cc5a | ORPH
   sparc     |        popperjs-1.16.0         | NOK | https://autobuild.buildroot.org/results/3ee15a5150950f98279ae0899ce824b484c234e4 | ORPH
   sh4aeb    |        popperjs-1.16.0         | NOK | https://autobuild.buildroot.org/results/4fe46f164f0c3e78a5166ae8630a9fa2d979db23 | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/4f553c73e07fb2b2a881c574869b0075962113cc | ORPH
    or1k     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/534cecde73574dd7a456db71b93ff84e4a0547f5 | ORPH
  riscv64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/7bc5a8d44b537d9142ca0fdf15e1f1c8450d0302 | ORPH
  aarch64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/af1d61ac766deb3a11129f28f31d08ce6459c434 | ORPH
  mips64el   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/2ef90c9b6e14952dc3f2c682c66ff59a2aa8efeb | ORPH
microblazeel |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/107d4e872e4782be502fc26ffeddb50cd7dc2a92 | ORPH
  mips64el   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/2c3d7d4f69c18d8ac62bb1b1678aca8f1416045b | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/84fd6bb7a2b609769b56ba455a816f360a054e27 | ORPH
    arc      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/f69ff49f741bb029105eb0f1212016d6322147ee | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/c92e295cfd6fc32efa5d0f193bf5d6198454f275 | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/dadace5b61fb5b8c201551d0bf7dd97868c020a1 | ORPH
microblazeel |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/f0a1e9479e05b9b318d67878f2fec34d217b5bd7 | ORPH
    m68k     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/3d8703265a7bd858fd66f406bc2886b3517b2879 | ORPH
    i686     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/2da9386ef50644b516a90a6f59fb92b540c6e2bd | ORPH
    arm      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/62eb2bb5521e08bfc1b96449d4c44225f7a4feaf | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/035e3ca4a38100a77ec9c429ca6d3b092126b00c | ORPH
    or1k     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/dc004177392d52151329271a954c0956f48e09a4 | ORPH
    sh4      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/6a813e4a7c33ad6da0a6da88e0ba156871819c4f | ORPH
   s390x     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/e87e9e4a4beb5ef9f73e4359dc8f222e060f0470 | ORPH
   s390x     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/e8fbe92cf6fa7952389adabd353ac4b1f17c8e11 | ORPH
powerpc64le  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/cab67cac53e929a793251d038b9092932f610a7d | ORPH
  powerpc    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/d35aee1405f17344ad6192cfdc86fcf231c1c906 | ORPH
    or1k     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/f02260eccbad0a3f2f4d017b837e53b63a7976d5 | ORPH
  sparc64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/c6c26147ec9184ef6e171e81bc7bf572d19bc2a7 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/90c5799ff5824bebf14baeefdf40a5666ab7a141 | ORPH
    i686     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/7b664d472c126b3fafe824e3a82bc06abfae95aa |     
    or1k     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/eeb160573b0f414bc52b533f1dffd12016eec4b5 |     
   x86_64    |   python-cryptography-43.0.1   | NOK | https://autobuild.buildroot.org/results/15038aeb37d63cdc26f40dbb9f0628c81f9eff94 |     
  sparc64    |           rauc-1.12            | NOK | https://autobuild.buildroot.org/results/040d57010ace30bb38195c4a54252209744bd5e8 |     
   xtensa    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/892b24217a69c860427364a27c731f6d41ba3f71 | ORPH
   mips64    |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/55754361b6f1fcac8f6a75603987db27365d438f |     
    arc      |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/bee7f0b19c05c50be723a9ebc698c55c94dc32b9 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/97d4f8044424778f532fcd916bc646caebe26698 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/4e33d0f2cd10c7193a081d6b4a7e12f33dc78cad |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/fb05263c90450dc8189d9f2b0bf72dc662d47731 |     
    i686     |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/b8c73bdd99ef9bbc2f96b51510ba218749a2aa50 | ORPH
   mips64    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/71ceb90efbea3000d3c50ed294251270c39fca2d | ORPH
  riscv64    |          whois-5.5.14          | NOK | https://autobuild.buildroot.org/results/4408296f9d11261d27f7328e6a2fabbe1ab15c9f |     
    arc      |         wlroots-0.16.2         | NOK | https://autobuild.buildroot.org/results/9aa1ad06a25d8ed0b08adbfe61c73d80690e1626 |     
  mips64el   |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/3d303327aa2e1dee7a77af603677577c4217fb02 |     
  mips64el   |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/0e83c05971779671b7278e27a138b708fcf19598 |     
   armeb     | xr819-xradio-3a1f77fb2db248... | NOK | https://autobuild.buildroot.org/results/1c0edd135f8fd39e446bbc3a89d51dcd654e1af7 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

           babeld-babeld-1.9.2 | 1 
         gobject-introspection | 1 
host-vboot-utils-bbdd62f9b0... | 1 
           musl-compat-headers | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |      babeld-babeld-1.9.2       | NOK | https://autobuild.buildroot.org/results/0fdc4ca19affcbf0057ca7d7f75b1463103a2028 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/ba1fbea392910d3ce79854151d0dff398967afca |     
    arc      | host-vboot-utils-bbdd62f9b0... | NOK | https://autobuild.buildroot.org/results/7a9f2ecc6baefe48124fb4c3ff24d26033d326a5 |     
    arm      |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/d4655750782f208eff227fdf380ae228b51ed86f |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                  ffmpeg-6.1.2 | 2 
                  linux-6.8.12 | 2 
                  bcusdk-0.0.5 | 1 
                  dhcpdump-1.8 | 1 
                    dust-0.9.0 | 1 
                    flac-1.4.3 | 1 
            gdk-pixbuf-2.42.10 | 1 
                 gnuplot-6.0.0 | 1 
  gobject-introspection-1.76.1 | 1 
            host-fakeroot-1.34 | 1 
host-go-bootstrap-stage3-1.... | 1 
host-heimdal-f4faaeaba371ff... | 1 
         host-libxcrypt-4.4.36 | 1 
     host-moby-buildkit-0.11.6 | 1 
                       kmod-31 | 1 
             libargtable2-2.13 | 1 
                 libcddb-1.3.2 | 1 
               libglib2-2.76.1 | 1 
                netdata-1.33.1 | 1 
               pulseaudio-17.0 | 1 
                   qpdf-10.5.0 | 1 
              skalibs-2.12.0.1 | 1 
                       unknown | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/b28a496adb92e032034cc571acc51cceef060c62 |     
   nios2     |          dhcpdump-1.8          | NOK | https://autobuild.buildroot.org/results/3bf4e6440e1a18765213bf4dce9c254d5a8cd942 | ORPH
    arm      |           dust-0.9.0           | NOK | https://autobuild.buildroot.org/results/da5bbb2839ea92448caf0ae1a7e4e4fba5bdc6a6 | ORPH
microblazeel |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/eb8f58565406231ce61ecc7c0318f90f37af208b |     
 microblaze  |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/180835d08d8a2787c6d3d8f4d12175070cf1f4fa |     
    sh4a     |           flac-1.4.3           | NOK | https://autobuild.buildroot.org/results/d30436632bdf36801f23b12f34d0fb76823672ae |     
   mipsel    |       gdk-pixbuf-2.42.10       | NOK | https://autobuild.buildroot.org/results/06c7bb1e2394750eb91550957a26a6ccfe87e204 | ORPH
   nios2     |         gnuplot-6.0.0          | NOK | https://autobuild.buildroot.org/results/ed62b1fe6315d2604c068be2dee8d5b7d2a2a198 |     
   x86_64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/90797b22a403da0d49e940c43c659232373a2372 | ORPH
   mips64    |       host-fakeroot-1.34       | NOK | https://autobuild.buildroot.org/results/c8a966659c9d36905539aa043fbc1c5b14abb5f3 | ORPH
  aarch64    | host-go-bootstrap-stage3-1.... | NOK | https://autobuild.buildroot.org/results/6093024d64b60b9b80f1e2f520ea73ea6dbae267 |     
  aarch64    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/12ea88a6d68479a234a62fae991ba4cfe3c56988 | ORPH
  sparc64    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/3c976e60e9e0b76285222713152d67ca9ce1207a |     
   mips64    |   host-moby-buildkit-0.11.6    | NOK | https://autobuild.buildroot.org/results/2e153f9b36cc3b2d3abc624567d36cba1cfcde6c |     
 microblaze  |            kmod-31             | NOK | https://autobuild.buildroot.org/results/d3ca7add87715b1f29527924b6cd6ab051f51223 |     
 aarch64_be  |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/b8e7818c3492dc6712dc3f365cfaa2f7a544c1e0 | ORPH
  sparc64    |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/f1a356af8f96b69d85dbb7c9bd928ca3b53584a6 |     
    arc      |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/790220181431fa8f4feb4ab7af2b3b8807b30a88 |     
   xtensa    |          linux-6.8.12          | NOK | https://autobuild.buildroot.org/results/8e6167597ce70ceee30552b282d3c713f00da635 | ORPH
   mips64    |          linux-6.8.12          | NOK | https://autobuild.buildroot.org/results/7ae4482dbd764c77e72a19f26b925df3d2892857 | ORPH
    or1k     |         netdata-1.33.1         | NOK | https://autobuild.buildroot.org/results/bb88bf8966670d850fcbe2f2f52c8c7a921b01bf |     
   nios2     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/deb14cbebdf3d1a27e4f51d0b9291ab99c98122c | ORPH
   x86_64    |          qpdf-10.5.0           | NOK | https://autobuild.buildroot.org/results/db73361f90068cccca50c74b25e6283af122ce15 |     
   armeb     |        skalibs-2.12.0.1        | NOK | https://autobuild.buildroot.org/results/b9d560def3b3ccb09b52c12b75e9a0568d838d11 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/911ffe54fed7150103d383fa2576944933ac4bb8 |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

                  delve-1.22.1 | 1 
  gobject-introspection-1.76.1 | 1 
                 linux-6.10.10 | 1 
           musl-compat-headers | 1 
               procps-ng-4.0.4 | 1 
              xapp_xhost-1.0.9 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/e1d115d2d2b02a19fc514b7cb02f7fd0bd62e1ca |     
    m68k     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/94f27c2d510e7c9482bffd64da5ad5ac5cc8498b | ORPH
 aarch64_be  |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/5316233e6073a671a61b4d88bd23ef425760b004 | ORPH
   armeb     |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/750a1d85adc5aaaf9d304e6f45a3ad030b358eec |     
   mips64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/c6b80ea8e34a27959bebce5ec6bda531efcae617 | ORPH
powerpc64le  |        xapp_xhost-1.0.9        | NOK | https://autobuild.buildroot.org/results/6d457d117416dda57c58210c871e946ce428b86b | ORPH


Gitlab CI results for 2024-10-24
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748198  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748226  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748227  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748229  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748233  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748285  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748303  | ORPH 
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748326  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748333  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748338  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748348  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748354  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748357  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748360  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748363  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748366  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748418  |      
            imx8mn_bsh_smm_s2_pro | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748463  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748473  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748484  |      
                     ls1046a-frwy | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748486  |      
                mender_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748493  | ORPH 
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748563  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748565  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748570  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748604  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748612  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748675  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748685  |      
          qemu_riscv32_nommu_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748858  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748926  | ORPH 
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748949  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748966  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748969  |      
            sipeed_lichee_rv_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748993  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169749000  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169749049  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169749055  |      
                     ti_am62ax_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169749144  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169749156  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169749161  | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169749175  |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
