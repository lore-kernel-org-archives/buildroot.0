Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBEB9CEB2DF
	for <buildroot@archiver.kernel.org>; Tue,  1 Oct 2024 03:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7718681143;
	Tue,  1 Oct 2024 03:18:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MXqfI4yxD5AS; Tue,  1 Oct 2024 03:17:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 861F78113B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 861F78113B;
	Tue,  1 Oct 2024 03:17:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 807721BF369
 for <buildroot@lists.busybox.net>; Tue,  1 Oct 2024 03:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79D6D402C4
 for <buildroot@lists.busybox.net>; Tue,  1 Oct 2024 03:17:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MUqvVNQQJzIr for <buildroot@lists.busybox.net>;
 Tue,  1 Oct 2024 03:17:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 668CC40217
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 668CC40217
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 668CC40217
 for <buildroot@buildroot.org>; Tue,  1 Oct 2024 03:17:52 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a8d0d0aea3cso769226066b.3
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 20:17:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727752670; x=1728357470;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o5KLAvgpGogwGSYYntv6XS04zURwFwWCr6B/dLHn3Tk=;
 b=NivFp3P3G+smQpKuHLAYrF+9kINSRF7HxaryEp9T3VeKewZVuFIZqJ+au74jNBIcyQ
 nmQBkSwy7QaEyyWFvCwnJtNiR7OQ3ObnpgNr9DpMt7a4RGPlPBzOlGA3r6M8Ios5qu5B
 X2NbwDfMCmJLjGK2gPFEkrvYRz50f7JPMwrLNvTMvNzyW7ixTdGoBbZjQ9wqHRY1hJRF
 H7ZQwwUAvWraRrEpAylQ/3oF1bQarTC8LzpSMkdf0vucE30LoK7tpEckjP7NubfHjxy1
 hcedOCpqvKwLvP0gsLkmMoSujgzsl9jtvLBjGxM696Ij2SScLczMzeoctyr/HcO+kjCx
 4VdA==
X-Gm-Message-State: AOJu0YxtM3B6nbq83GaIrdU2fSsiNycRXlnt6F/HAh33E/CDcwch0kbP
 Lx34URa7t7LKhQTJPCOLL7eExpvXoffO/jKrTMLOeVQFT7dC3piJVZ/poSsB
X-Google-Smtp-Source: AGHT+IFdRTFkGY9cX+WDxUyuTUj+1COjPq3O6vRn6EjLoODzDJLj5YfeLCwCtlKu81bfOLupr08miA==
X-Received: by 2002:a17:907:3f9e:b0:a7a:b070:92c6 with SMTP id
 a640c23a62f3a-a93c4a880acmr1281305966b.50.1727752669398; 
 Mon, 30 Sep 2024 20:17:49 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c27c5b52sm625748266b.53.2024.09.30.20.17.49
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 20:17:49 -0700 (PDT)
Message-ID: <66fb69dd.170a0220.2ffe55.576a@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 01 Oct 2024 03:17:49 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727752670; x=1728357470; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=o5KLAvgpGogwGSYYntv6XS04zURwFwWCr6B/dLHn3Tk=;
 b=B+jATgH+aDxtB88FrdzVVsP5jQmRW0uRwCCM05zDrH/iQXfPsGUdCV6ErFkJUiC26a
 8aWqJJ3ZxjM5LyFMmPdjksuHRhWm/R1tpdc7itM7wdtSgOhGnJAZVV9AjgRgKet2FFZL
 pLZl1+zfM6m1sIZrCv2hLLMwKPSNrbMrPj6VnMz0oD8rhyvvBzi0pUbtolriEJfNRO/q
 iK0nwWRpIWXk8A8Zgabyd/hVNyRWiwZl1r7OV2SDN0XLIV7XCClsefDbzYx9mBB/s9bX
 0wieEbbfdYjRpvd0OQZgJWezd2ayjlJkvHHSpe08rGgBju18e/cpIHrGKHsBn2or+oO7
 CClA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=B+jATgH+
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-09-30
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Autobuild statistics for 2024-09-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  7  |  5  |  0  | 12  |
  2024.05.x  | 22  | 20  |  1  | 43  |
  2024.08.x  |  4  |  3  |  0  |  7  |
    master   | 17  | 405 |  0  | 422 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 76
             bluez5_utils-5.77 | 41
                libcurl-8.10.1 | 30
               procps-ng-4.0.4 | 17
                  linux-6.10.9 | 16
                  ntp-4.2.8p18 | 12
aubio-152d6819b360c2e7b379e... | 11
                  bind-9.18.28 | 9 
              libopenssl-3.3.2 | 9 
                 apache-2.4.62 | 7 
                 coreutils-9.5 | 6 
          cryptodev-linux-1.13 | 6 
                  ffmpeg-6.1.2 | 6 
                 gnuplot-6.0.1 | 6 
                    bsdiff-4.3 | 5 
          host-binutils-2.43.1 | 5 
           host-doxygen-1.8.18 | 5 
           host-librsvg-2.50.9 | 5 
              host-rust-1.80.1 | 5 
          linux-5.10.162-cip24 | 5 
     linux-5.10.162-cip24-rt10 | 5 
                       unknown | 5 
                elfutils-0.189 | 4 
            host-binutils-2.42 | 4 
                 pixman-0.42.2 | 4 
               postgresql-16.4 | 4 
android-tools-4.2.2+git2013... | 3 
           at-spi2-core-2.50.0 | 3 
                   duma-2.5.21 | 3 
            gdk-pixbuf-2.42.10 | 3 
            host-ccache-4.10.2 | 3 
         host-libxcrypt-4.4.36 | 3 
libg7221-dbfc29d4806ecdace5... | 3 
libsilk-4268a02240c35c6055b... | 3 
                 libv4l-1.28.1 | 3 
                libxml2-2.13.3 | 3 
                  cairo-1.18.0 | 2 
                  curlpp-0.8.1 | 2 
glibc-2.40-18-g564178076272... | 2 
               graphene-1.10.8 | 2 
           host-checksec-2.7.1 | 2 
    host-python-greenlet-3.1.1 | 2 
                  libsepol-3.6 | 2 
            linux-fusion-9.0.3 | 2 
               linux-pam-1.6.1 | 2 
               mariadb-10.11.6 | 2 
       matchbox-keyboard-0.1.1 | 2 
                   mimic-1.1.0 | 2 
          obsidian-cursors-1.0 | 2 
                     ace-7.1.1 | 1 
                acpitool-0.5.1 | 1 
                    azmq-1.0.3 | 1 
                   bird-2.15.1 | 1 
                    brltty-6.6 | 1 
                 dhcp-4.4.3-P1 | 1 
                  evilwm-1.4.3 | 1 
                   eza-0.18.22 | 1 
              fftw-quad-3.3.10 | 1 
                     file-5.45 | 1 
              fmlib-LSDK-21.08 | 1 
                     gpsd-3.25 | 1 
      gst1-plugins-base-1.22.9 | 1 
host-heimdal-f4faaeaba371ff... | 1 
 host-softether-4.30-9700-beta | 1 
httping-0e26c53d5fe504eb720... | 1 
                  jack2-1.9.22 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
               libcap-ng-0.8.5 | 1 
                libdrm-2.4.123 | 1 
libilbc-829b08c7902ceb87a26... | 1 
                liblinear-2.45 | 1 
                   libnl-3.9.0 | 1 
                  libva-2.22.0 | 1 
          linux-headers-6.6.50 | 1 
                   linux-tools | 1 
                    mpir-3.0.0 | 1 
            netstat-nat-1.4.10 | 1 
               openblas-0.3.28 | 1 
                pipewire-1.2.2 | 1 
               popperjs-1.16.0 | 1 
               pulseaudio-17.0 | 1 
           python-numpy-1.25.0 | 1 
                  quagga-1.2.4 | 1 
                 rtptools-1.22 | 1 
        s6-linux-utils-2.6.2.0 | 1 
                tpm2-tss-3.2.2 | 1 
             util-linux-2.39.3 | 1 
               valgrind-3.23.0 | 1 
                xenomai-3.0.10 | 1 
                  zeromq-4.3.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |           ace-7.1.1            | NOK | https://autobuild.buildroot.org/results/c77464b15cd3f5929d14b01d28bc53e3b94d08bc | ORPH
 microblaze  |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/84ebfb878d0c3d947c86903a6dc026455ba974f4 |     
  mips64el   | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/de359f19dd1673d6264b8fab076014d362d21012 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/422073f74e0c819c6a5627983ec98abc902508b4 |     
   mips64    | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/dc3818703079435aa1779403d732c4d50e3179e3 |     
powerpc64le  |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/c10d5fdf00df80b1e35821e53d378846412709d1 |     
    m68k     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/55036562834390291ce0d6420d2fe42b8152ed4a |     
   nios2     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/b67750df87cf1cd3504cef7814b27840bfbfdb74 |     
   s390x     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/fd88110ca838e64b1c8fe7101520a46bbabe7e50 |     
    or1k     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/afaf9d216647c0eff6a342dd2ce13511e067f8a7 |     
   s390x     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/c69d4023b940a2812f25237dc8a37ab86fbcb819 |     
    or1k     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/4c1fe5daa9983e4dff85094c8fd3fd4232ba8612 |     
    m68k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/bf1a2d395f5d063c8002e8a79013b7a37a86d4fe |     
   sparc     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/8cd7afb39b77604c4ae493aeff9c42d790b41267 |     
   sparc     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/2df5397f8ce90ce0a06a4de359a6fc684d83e636 |     
 powerpc64   | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/91fba5fc8510dab0425637c15af2061261ac5a20 |     
    mips     | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/1e48deb912b30406101e06bedda1a44c33ab5e54 |     
   mips64    | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/545ef25afcabcf341177239933d4bb5586fe6f9a |     
 microblaze  | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/4b86ab60c4212017b642551ea23b2ca364757f13 |     
  sparc64    | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/18c0331c0d367461cc4fd0ee014ca84d1b7a57fc |     
  sparc64    | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/29773e999d77ed36e29c8b2675d1683294a86140 |     
 microblaze  | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/0fc8a61411664cfade51887cd7aecb8aa7d6ab07 |     
   mips64    | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/386835bb5c6c34fcec5b9821d3fc70d32b09e0e3 |     
 microblaze  | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/78411ec7951fe5967d169fa17b7b3168781f8817 |     
 microblaze  | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/1b0ea946305d6aa72dfa179f0488d983d09c81a0 |     
   armeb     | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/8b761596dfc69c59056c98678faa793fc902d413 |     
   mipsel    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/46cbffbad65d020313bd64929c3b25e104f65733 |     
    arc      |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/e75af3a21d3917b4a097e276050d7d55b9851fee | ORPH
   s390x     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/b962444c5f67f9b77e3f521a1798a418017cced7 | ORPH
   s390x     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/130edeba7f512ed4bf2c1b4a4ec32bffb9dc8794 | ORPH
    sh4a     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/fb09fb6ff20f38b5d2d801d38c40f71dd14a6047 | ORPH
  powerpc    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/17b7fb08b41ccd6d8dc6a5a27ac7674d50ed34f9 | ORPH
    arc      |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/a2ba001fe319b57e76122af86bc332c4a521ae42 | ORPH
powerpc64le  |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/4dabb0684b4b4c587a827124d894605c0543f28a | ORPH
 microblaze  |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/4e27803e16557587fae3a21b0ab007e73fe7803e | ORPH
   armeb     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/cdfc52fa209fad0acbcf2fefd4b75c6663ec7f83 | ORPH
   s390x     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/0429e2bdbbeb4d0b868156448f98b93041f19905 |     
    i686     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/25be48a4721826d14450472b7e18c77c85d74a87 |     
   mips64    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/6ba06b2ec730cee3bfd66a083d1276125a6b9f6f |     
    sh4a     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/77b13f03cf446007ef77bc29ffa111ef41e2d8fe |     
    sh4a     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/6532c4b9ecfdfb293a61419e432e8a93071a1751 |     
 aarch64_be  |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/07db0e679c0ce37a6d72ce7ed8072ff4632d3e70 |     
   sh4eb     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/0b4c1211ff8cead4dddc47350c2b622c79d72dfd |     
   s390x     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/d37f54ab65255ed4a4a208a34de298460a22cbcd |     
   armeb     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/c25e37041653c5d5c92b8c824f0972c4b3b8c41d |     
  mips64el   |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/899302842f1a87226311023ccede33c9310fac0b |     
   mips64    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/a3b744d425b79acd0adff2d4f6475cb73b3b927f |     
microblazeel |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/2d1edd15fc9b3cd050bc28950bee84600cde5dd7 |     
  mips64el   |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/d4391445d0456484db1c45a7b3816c8eca31f125 |     
 microblaze  |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/e45dac6f8dad7cc0943d194f92377f4d9b53a3ca |     
 powerpc64   |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/613c724cad6a06b3fb385ebb65ac22c27b148b90 |     
  powerpc    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/7b9a75f6479be7effde614ecda8816b1effce1ac |     
   arceb     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/9847754b72bd590539dc4085cc447357957d2a74 |     
 microblaze  |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/51a3fb1f98351b7d07b6525584942782c0599a0a |     
  sparc64    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/341f98aad7e9a022c24ad0569c9438e51adc3750 |     
   nios2     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/8095d7adaab54d0d1d59bdfb46653586492d73c4 |     
   sh4eb     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/7a993a64f1f18da8a30da56684ec3a3327472c09 |     
 aarch64_be  |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/f4dc7edc8fb8db58b90fee27fb9ee493fc805f03 |     
  sparc64    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/0835103b31d93e45034913dc8c1472bb4682806f |     
   nios2     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/40008a45972448ac6343164a95c8a1277d0a0d7b |     
    m68k     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/315e0121a2fabfe716c039518079351800f5eb75 |     
    m68k     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/977e0516620415a36176e18f88a97a318059c351 |     
  mips64el   |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/263220c253eab5f966b0fef10c7db94461d4a2a8 |     
   x86_64    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/f0b951f5a9a7bbe6b7fdcd7aa7ef0d32c42a033c |     
    i686     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/e2868cfcd5e6b043cd5cc65a24d93358bf8492c1 |     
 microblaze  |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/299101eacf345eae87c0eac2cd663fe626247a9e |     
   armeb     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/93df9e7bd8fee3918ccbfba45dea429b5692bbb3 |     
   s390x     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/a48a5a95c4a37ff9040775d4ca7fb101be6fa985 |     
  riscv32    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/266b928d3fd94f9f33c879e3d0348e7db3c878f1 |     
 microblaze  |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/05396d1efca7e32af9a39fadd444147a852faf5f |     
 powerpc64   |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/d63b9cda8f8cb52d8e1046a5b2bf8af869aa5a4a |     
   s390x     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/78b84c3e0c610396686b3e832c20c99b5de0116f |     
   nios2     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/0829e9caf138ad03e3dd8b85c42ee4df44a8780a |     
  mips64el   |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/b27635397de2d5392071a98a9c362c08b0958d46 |     
    sh4      |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/2d557df6e76a8c99c932da5c1b440a4fd04150c8 |     
   mips64    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/43d3b50b15fbfd7121940a6936c2826b182b405b |     
  powerpc    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/3e8df9e02dae2c89bf7830e36e33a482a12acac7 |     
    or1k     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/479d0bc33274abbb319b85f7050f17510e038c00 |     
   mipsel    |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/37b50c5c14d52e36ad16aacbcb1afa6d3b1aa5b3 |     
    sh4a     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/58c5b07571b87490a08ef7cfc4a0ba61b89db7db | ORPH
   armeb     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/7ee84ec52ab420b16ac1a31d9379e29c2adea1f1 | ORPH
    or1k     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/5ee51d953e09abd44d5251bd302fcd47bf4c3f7a | ORPH
microblazeel |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/33c04001fbe36cc8c4d7b8cf165ca34ec489355e | ORPH
   mipsel    |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/6ab824a9c4fdb70ff6e3e9421c47f7a37af0b8d8 | ORPH
    sh4      |          cairo-1.18.0          | NOK | https://autobuild.buildroot.org/results/1f5d144ebe623624a0981cc7022967dfefca12c7 |     
   sparc     |          cairo-1.18.0          | NOK | https://autobuild.buildroot.org/results/709b369071a7d9c2db13cb89d654c02e1e8c150a |     
   mips64    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/b5c42db3530a9f35275a18756dc17bef6efff756 | ORPH
    i686     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/625136d3e673620df5bdf2ae73aa6a2e7e8d6831 | ORPH
   x86_64    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/fb5f6a74feeee83bc69230e4c1031fb0df609b59 | ORPH
    sh4      |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/e4f9d11b2667eea7873f3fc0dd1b24663c6d3a12 | ORPH
  powerpc    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/533d6d6608a72bc491a33ee9a151b6b707276406 | ORPH
   mips64    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/34e8b16d96f5891787b446823db2937fb0b666d7 | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/96fef2e704bce4a7d8b4ed68518c31205c79164f | ORPH
    mips     |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/f1c104064c18be50490eb3f830b9c934bdbc6a47 | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/4f5f061fd46992e52a87f8017a8df4f61f418844 | ORPH
    mips     |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/a2d8e1e02003e1913570d1c07d19e4b3f36d9c42 | ORPH
    m68k     |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/369b1ac893200314d6c4b9c7d8563798febab39d | ORPH
    mips     |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/b372bfcca1d2f0f2e252ae28b6f9ad87c3e4d686 | ORPH
  aarch64    |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/24e73a2da170ba8046bf3e10fd959f9a9ba38984 |     
  mips64el   |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/f3aeb3f99c7caa875a0a317f2ab62bff1d9d376c |     
   xtensa    |         dhcp-4.4.3-P1          | NOK | https://autobuild.buildroot.org/results/d020a74f392207612e5a5e0a0f586190f1451e96 | ORPH
  sparc64    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/a3e0e94488cf50912b313a9af3a976f76b5ec826 | ORPH
 microblaze  |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/9dd89ef97a73da29ef38cca0ee3de167b882d3b8 | ORPH
  sparc64    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/b0031c0681c35ad547b93f450538a454d3002cd1 | ORPH
   mipsel    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/172c60bce586643643d4de95fe2962af03100967 | ORPH
   s390x     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/d39f2167976065a4dda891cb30250b9ab09b280e | ORPH
    or1k     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/337c090df8c796722dd7c4a4a4054448ae60cab6 | ORPH
powerpc64le  |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/1f3d8b23bf511ba85149c72787f35beebf364e5c | ORPH
   s390x     |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/b41605152050104ef5de74e05afd1767217fb9c9 |     
  sparc64    |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/4bc6341637248f678818af6ef8fe89b528a83d61 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/108408a33206448ea102d1d5779290e405e2378a |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/1bba768596729706bdb6ce7d7c45dda2a8d6807f |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/f950c80f83f0faf6aa9df0e98b49b0a822d0cb8b |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/7a6bf4ab3cfed7de9b9d1403b4b5c99abd6a3562 |     
  riscv32    |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/5194eaf056dbe01679fa61f4594362afd9831af0 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/023174b21d86fd02a004f6f0386a894ca18dcf4a |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/ae1844f3903621859c8b5705154baf96442024f0 | ORPH
    i686     |           file-5.45            | NOK | https://autobuild.buildroot.org/results/4df8da80c426cb61230b1eefc73da4c329500c4b | ORPH
  aarch64    |        fmlib-LSDK-21.08        | NOK | https://autobuild.buildroot.org/results/1dcde2aac458fe327ade58407fba74df05378257 | ORPH
   mipsel    |       gdk-pixbuf-2.42.10       | NOK | https://autobuild.buildroot.org/results/08095e5990c0b837971054d000faf81fdace5104 | ORPH
   x86_64    |       gdk-pixbuf-2.42.10       | NOK | https://autobuild.buildroot.org/results/4859378043feaebfa80497d2ea8db54372c2de4c | ORPH
   mipsel    |       gdk-pixbuf-2.42.10       | NOK | https://autobuild.buildroot.org/results/703d7ed197622c3cdd3f3f48106069f72950479d | ORPH
  riscv64    | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/43fb9b6c9445bddce014635b52e80f2ac61e92f4 |     
  riscv64    | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/a54e49d61f4df2c5fd65ec8c78cc9e3e107c5d8e |     
microblazeel |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/0fca3a1787f68e847a3f078efb4a9cfdb9fe1105 |     
   mipsel    |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/971b26b4e12a54d7fcad24373c2be5d41d01a0bd |     
 microblaze  |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/ac2e43990c263678222a21da3925ed426f536ee5 |     
 microblaze  |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/f8eadb423d2168ed9417c8658da5e9d4def46236 |     
    mips     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/a0aed3eb3441e4503ae4217d9e32af11cf1caa10 |     
   nios2     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/9540ccbbc9a79218cdc143d7b26e3511631fca47 |     
 aarch64_be  |           gpsd-3.25            | NOK | https://autobuild.buildroot.org/results/8eb0818f7e4512899720d4e9c7a163ec4451ba96 |     
   xtensa    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/6d50f5ce1f32e2492e5eb7a59dea7eb02283b892 |     
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/255b344eecb3d3d88409aff3bb41bd6f20a47501 |     
   sparc     |    gst1-plugins-base-1.22.9    | NOK | https://autobuild.buildroot.org/results/61321096bbddd3dd5ef1e8f28c2bd0a7b872467a | ORPH
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/201c1eddab3409ec7e5d8c21cb7dc9eb5e430939 |     
   nios2     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/805be41af5d97744db138d6b005296413bfb2762 |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/7e1d507766ff31540f42daefd470e80b8caee435 |     
   armeb     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/1af07e078fca126648e30a57b826a3cdb71ff98a |     
   arceb     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4579bafaddad4a5555a257a2ced81bb19c7d414f |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f6fb47759450c86411dd190d97d8ebde1bc52bda |     
  sparc64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/88ec727ae7676748f377a90a99ad2009ec5e83c9 |     
   sparc     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2d7263f1cd522a852526b82a80de49c043770f3c |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2568d5acc7a6f6723737ceeca86a9dec7624d020 |     
powerpc64le  |       host-ccache-4.10.2       | NOK | https://autobuild.buildroot.org/results/a47c83737e122c3633d2cb6588f162c834ccbdbf | ORPH
 microblaze  |       host-ccache-4.10.2       | NOK | https://autobuild.buildroot.org/results/5f314bc41a6ada3e335febbb67136a5c4c75955f | ORPH
  riscv64    |       host-ccache-4.10.2       | NOK | https://autobuild.buildroot.org/results/af11c7bfa7014e7215dec59f9938ed4f087396e1 | ORPH
   s390x     |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/550b59c785c88cdf20b0415d04f12e85b296fa21 | ORPH
   mips64    |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/951570ae6b4a8fb6cc3761431ff91e67dc382e1d | ORPH
 powerpc64   |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/dc55471c94fb017769e2a14b123d504d63911c76 | ORPH
    sh4a     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/33146a47bf864933dc9b8e268d18bd0d5de90d0a | ORPH
microblazeel |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/34fc3159746ff647ac1682f8dd4b6aeec0d5062b | ORPH
    arc      |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/5d017c8ab5a79f6fd31eda8f64a91480054047b8 | ORPH
    sh4a     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/a41c0dabd11f58314e04d2b86f246bbe20983388 | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f5c613f11c81e7fb1c38159b30f4ec94d1b14b98 | ORPH
    i486     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/587ae9dc9edb66c1e9a93e31e0cab8f82fb09571 | ORPH
  riscv64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d4ceb066cbb19b679868e7d690ac2d0ac6a76282 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ea9d3e7cbbc7272b35f0da9ef1277e2808709fef | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/30f495e488fcab9635b8130577ed4a93181aa9e9 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f1b8590cc8bed05095f74e3de05aad725eced1c3 | ORPH
microblazeel | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2acf3dcbd0260c9f00d9d39a3c1f7f2b02ac2118 | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8f0da8e90d17b703e878df9c599bcd0a1a946e46 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6cd9e95da8b69a39e8d6ac35dcbed89cde4432a8 | ORPH
microblazeel | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2d6d6647772d4f17f695ac54cd8979bdaba0ecde | ORPH
   armeb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2e71b12a6f8ebeb20caefd0c16bd15e63c935125 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2f01f9139d1c70a892757759d9f9fd5ed9a601f3 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f5fa98ba14120346dbc84cea787bb0160db1ed4e | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1d7bbb9669f19b50ffafcfaf29f810ac1a48a378 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bc7bd7106ad62c2ee66525bc3203aca52c75499e | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/02f79ade28e91bef7e9ba15680eb7c9b58377a38 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c55c5d582f4aadf880100f28150722db325f36c4 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bc63296fde73795a4374350a20efed2884ebf675 | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a28f558bd4ea5cacd5cc8a64adcd72bbdb1ef638 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/70aa25a0e39c12de9b316ce86a74e45ae3df6f89 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/654f1f85ec726f9c964810b6175dfb85eafdb4b1 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/97b7dfe7aa5e810286304e2eb89a965881d69dad | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c7d6a2aa75e7a184ae6a5eee339e9eedf832b427 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a1290baa0eef61b6b4840e4f4d8bd59ecf7862f0 | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8ee1bc2fbf7da38deded0ded076b6808e4eb86ba | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0b3b2f88c5fa1030e79ce56fb9835528f51d4760 | ORPH
   sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bfc5143c849b33e69e9ace88d57389f93b6245f6 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9754ee00e025f332527d08808d21a90af54dd17f | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/cc1ef63d9f1bb772b4c501eb04cf1194979e5c43 | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f7af7ec9724f0af7150989805c9b0df09ad75ab2 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d1a5963e346a932f5fb0ed2799fddc3eb9cb8336 | ORPH
   sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c8d3dabb2765d698ed98700e6201cfd9a315420d | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4c7cc14c295002461f60e1f3c50f9cf804e30cb8 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7848bea82ac86477bd9d7ca6515d97f7ce0facfd | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3e576aa7a54b37829d1bee601b2ccb4d67ba0021 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c8950c97bf7b022a2b76d510474e46940f6cc06b | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b53c4c33f3140002b36dd0c16f23c204a7bf69f5 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b866bd0bb02ade046c193c273c18736f67d7de85 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4906db858c69b76031b703bbbcaf8e59ef23d766 | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0b24765b9f462aa07d0396649c40a3d6a1687413 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2f6641f4fffea337c2f007436762940f6c7f16f7 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/cfff516f1a18cb058fde2b3b92816dbce885cbf8 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/09f1a32408604aa6c9c869afe65f077c6261ea33 | ORPH
    sh4a     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/032f88616f9e086f599a2f951ada5860538532c4 | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/32ca69bedd6cf73a2650458cedfc460c68412b95 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/cccba160504f1da86be335dade0a961bbbdec6e6 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9af029ebdf543ab98dcf0d8c6ba5678d2f534586 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5493dc5ea73277c3e84b8beedda83da2b01b696e | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d5f28ebb6b21f6718b7a4f129ccb9fd287043716 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8565c7831dfe8fd5395bb9fc72d9206cc8a1981f | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/aec1578a3af59fc7b1bb9302cc1ced7f7eafd2ad | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2e83d1ae07435cc34dd9bdc8a911f9d2ad9f3461 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ca0ef949550376ac9cffb286bc3aef8b9627ddf2 | ORPH
microblazeel | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/06dbd81f446f505a59ab934e39d8a58a61dd8c70 | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/443945944b1823487f64c9c5688304618f9cfdf2 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/21a59f822c5a5b6262e8592ca0a52a2dbb2adae6 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b06e20fde712228fe41d04d5167e36897d6334f4 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5b1b12d865089bf4f3eb15d818b67710d43eb4be | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/eeb002b1583833745bb7d4eeba7751045e1c2390 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ce8eb52d55da743ae5fe622e337652eee0478f1e | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4da710f1d05bac90eae6d789107010c5c0f9a6d5 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4942dd1e04e4628a66b3d93797029dacbc00d9d5 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7718d20f6b0fc450311e447dea1360a27be6ff6e | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/350d274beebe35f8512a02112cb929eaae045c17 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b1016f325e772e81bcc7bdc5816172dc4b2e2308 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/01ed61f5c621cfcd5d60e78f8d06afa19084c7a4 | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/23d3d42607a9f529974fa370501af1b400ea4aa9 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/732205379c75ed18476afef695cb7aae9c637486 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/67bb60165d121a9c79c66d30f62da45e131eff89 | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/05884175046fd9e40d398a7f27286b0c809d8714 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a1d2d7d40503192c71e667f7650c9145405631f4 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/65db5d97baf82fc13629cf6bcb2b820a608946d1 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b55dcbcbd7a8e30ccde8362e1206a5d64f49c9bb | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6a39b50a9cfd3f09f0d2d96db1b64291bb0ad35e | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/eee210fc6a86352a2ca6b35aac659c830c0e04f3 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/336928a682243b4ce60bfb66618ea4170fddee0f | ORPH
   sh4eb     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/8db6dab1f9ffee86229b145cc6bcc79d3bfded79 | ORPH
 aarch64_be  |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/dc7cca4a8e7f8601aa342d661a2f0ce0f611a979 |     
   nios2     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/cfa729a647aedafd2602b935dd56e506c75f5bd9 |     
 microblaze  |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/7a8bc2b3a3c5b33d8b6d44acaeb2dc21eafc02c1 |     
  sparc64    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/71e75bd7f36814727d3ffd1abf69bbc609e8a3a4 |     
   x86_64    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/654ebdca9055050aa74ec7db7755c178d9957339 |     
    mips     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/e0db2abac68530950f2d86159754c36b032c6b2e |     
 powerpc64   |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/ab169e62ed603587b3e8af980b7fdd51c13770d3 |     
    m68k     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/5739df611283b3352ff9620084ef76b0a127468c |     
   mipsel    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/e28eafcfdd068e3362ae987fdc394f25031e3710 |     
    i686     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/fdcb4bb70d3544e9428819ffc9cb96b7877e112d |     
  sparc64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/6d6f61533692543edd2639e670caac3817f79267 |     
powerpc64le  |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/0ae82f092e2212635e3c331281ab62038913c2a3 |     
 powerpc64   |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/4404f3a45b24625f8d5d2386902e44b105a1d329 |     
  sparc64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/7c61b55fcf0eeef3c0739a995b787e28f1752b67 |     
   s390x     |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/cf3c3bd8132b7ff51744e03e04e77c7053e08c05 |     
   armeb     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/8aa1e8879a3bdb38870793574ccf622a0c1a2dea | ORPH
   armeb     | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/952fd9660dc7cbc8d33790777925ef94d88051c2 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/d908b3892b489e4db9542447255c78cf3a738d2e |     
 powerpc64   | libbroadvoice-f65b0f50c8c76... | NOK | https://autobuild.buildroot.org/results/bc6189594fa96fc97600b6f213fe56850784bc79 |     
  riscv64    |        libcap-ng-0.8.5         | NOK | https://autobuild.buildroot.org/results/ee45507b4d0306d761ac2d9a174f44bba537313a |     
   sh4aeb    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/ae50d2d5b5c114b1de4816f5333ec639dd40d233 |     
  aarch64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/1fc06017b518832a449fdd8a46fbb701225c7a35 |     
   s390x     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/89078b88dc9514602bb2b65aed1c3dd5152e6dfe |     
   s390x     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/d8a0d1e9e224d1050b0488767f0c947a02230f68 |     
 powerpc64   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/b26f893236442c5e96dcb7c7f42b7e4e2ca2079b |     
   sh4eb     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/0b91cfbf36290c4479a6ef7371f97973dee4f5be |     
    i686     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/446ac2f8e85f44ef9f2e24116d25b57fc7ef2b45 |     
   s390x     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/851dbd31cb2fb4190d8089744ee2392fc7302a1d |     
  powerpc    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/1937407a351e3a31cb3361e5518c8a7da80d725a |     
 powerpc64   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/1fc650e791c9c13ee406f4f8f340cc76196efb5a |     
 microblaze  |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/291ab6fafd4a4d3cf6c3b5e373d048670078e634 |     
  sparc64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/f264a4815a6ab01f0f9f3ca13ba45cb444be8b91 |     
   armeb     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/084e44c81a3a93b34e92c8c8b5237d6b1862550f |     
   mips64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/becf5a79809cfc898c95243a57a7733dab09543b |     
    m68k     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/c6476a3101269d7365170dfecfb42e031ccf98a8 |     
   xtensa    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/7554b0239b47f1e314ba319de116a9901e7c5877 |     
   sparc     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/19f8783369c4e5040d45771cd40311c6b5a2c0a2 |     
 microblaze  |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/046d85b720b86654afb32f90fadb4929b7dd7b68 |     
   sh4aeb    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/6273a41876cf82de5d7f2c36313179d286032bea |     
    i686     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/27b68eb90f9a6faa2243dcbdfba12e126ed1d295 |     
 powerpc64   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/d49dfa4ebba43184d13272aa36e080b6328bfd99 |     
 microblaze  |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/794de8c30f9ba1e4da432d5b79027073dc3fbfb3 |     
   sparc     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/c2f36571f29577361d43e07eb3c39db66b1ae1c4 |     
  aarch64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/4b65bade1b0775fb8b84cb3eec36e160d30d9040 |     
   nios2     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/a688190037d02ed440efdb3a7bcf656dc59e2c32 |     
  riscv64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/101c00676f6c1545041779bb2bd702af92fa4285 |     
    sh4a     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/1a8e2ece8a6e4515a7797114dccb719e5ef56cd8 |     
   nios2     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/c4ed73f50ebb066689f7b60866a8e65a673eaff1 |     
    mips     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/7d99691466d4c7d20e9c4258ac39c8b137c226fd |     
   mips64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/469fec46819d218bda0d9a54a327f42cf208c4f6 |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/ede41c015347b1ec04ee55af0f56133631a34774 |     
    or1k     | libg7221-dbfc29d4806ecdace5... | NOK | https://autobuild.buildroot.org/results/0cc4d214e03a7c27ed6eeb7377b9f10609564d08 |     
    mips     | libg7221-dbfc29d4806ecdace5... | NOK | https://autobuild.buildroot.org/results/acc41096da915dcfab235cca26b5603790eb9086 |     
   mips64    | libg7221-dbfc29d4806ecdace5... | NOK | https://autobuild.buildroot.org/results/7811129db85e010c9d7b1712aacc6a41530441ba |     
  powerpc    | libilbc-829b08c7902ceb87a26... | NOK | https://autobuild.buildroot.org/results/8da77442cc985a8a6c5873cb4f7b79fbbc2f78ea |     
  riscv64    |         liblinear-2.45         | NOK | https://autobuild.buildroot.org/results/a5b720f2db4d330e94aaddc599ea592c5878e1fd |     
powerpc64le  |          libnl-3.9.0           | NOK | https://autobuild.buildroot.org/results/4bcb52f15b9267c46947ec8cd9e1e0aa652276d1 | ORPH
 microblaze  |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/daa1d3c0a06ec2bb717c3de3a37452a6b240862d | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/dc8ca406c02a9a9792630e334bed7cbc081fa23e | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/616de4985ead6ce45e3af208afbf8c0d87eaeb36 | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/f5559e61d39b06249885db13dda0a42fb17bea53 | ORPH
 microblaze  |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/bdf11df70130312b25f250a1f92e946a8057b0ac | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/337019aee59e955107aa8b52ae6a808dd6efaa74 | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/7679b42f3497b6bb955d9eff200c8e83b274c795 | ORPH
 microblaze  |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/376ae13c307cfb9b2b53fb1291c44a25dd9c1478 | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/c5ee001b1de5246e66e4ec902c710fb0750de051 | ORPH
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/ee3c5e2efac65c3cd0dd1d17225c3e955839a06b |     
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/a6837cddf4a57287e2d0eb51707cd9e558eea394 |     
  mips64el   | libsilk-4268a02240c35c6055b... | NOK | https://autobuild.buildroot.org/results/a92e2ea8f77c3cea09045f600ab4eccad1d2fffd |     
   arceb     | libsilk-4268a02240c35c6055b... | NOK | https://autobuild.buildroot.org/results/9ddf5bf19c751db71930ba6100f1292d1d898bb7 |     
   xtensa    | libsilk-4268a02240c35c6055b... | NOK | https://autobuild.buildroot.org/results/36998f920bbc7b36140c63eab61102cb496765ca |     
    arc      |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/3b44323051f510484fb51394d718abb965cad257 |     
   x86_64    |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/4adfccc7c8498ca708d35842917e340a269bbf2a |     
   armeb     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/de0ec1d4215d64cab661ca7a2584b4c62e7a0738 |     
  mips64el   |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/412c26911b9ba41c36fd8016c480cbd1c9c3d307 |     
    sh4      |         libxml2-2.13.3         | NOK | https://autobuild.buildroot.org/results/9c9b26cf51ee3a643f59aa7271ba511ff7dad13c |     
   mips64    |         libxml2-2.13.3         | NOK | https://autobuild.buildroot.org/results/4489353057bfc7d67bda9502cad58fec2f5766c2 |     
  riscv64    |         libxml2-2.13.3         | NOK | https://autobuild.buildroot.org/results/b9269cf2fb54312b34417a7e0d93a5874f5fcb16 |     
   nios2     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/66686e4fc467905b68d7811dea973d6424cab4d1 | ORPH
   xtensa    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/8de595040e8efb3bcdba262b0e0d3cec68328a1b | ORPH
   arceb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/496607e292d7bb803a177eb2576254ef624b15e5 | ORPH
   x86_64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/462cd776ebc8f7c7066d8c41b01020379d58e46c | ORPH
  mips64el   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/99f3eef3db312d515733bd4d0e762058ae9f673d | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/fc824ff666174a998f838802ebd65bb5daf95805 | ORPH
    sh4a     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/ff99679c0c32bbd85f7a6ade999822fcc9dcef45 | ORPH
   s390x     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/8db40b2b52adb60e33409e6d47ecbf4fcd02c631 | ORPH
   s390x     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/f62b3946507e2bb1005b77a106563f21a757af77 | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/831bef397f7b7885f5879466fe0ddd116636df3f | ORPH
   arceb     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/f2e56e0f97c74364e057facd498a1c1cd22a951b | ORPH
  powerpc    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/6447b413c86c17e6223d18c24d101b7173e656b4 | ORPH
 microblaze  |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/6ca3435cb16e2831f04450443a432087e6840ea2 | ORPH
  mips64el   |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/d3f9450a3aa62ddcd740b52d9041cb25d2da65fd | ORPH
   mipsel    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/954a5f493cc68a7e283a37f6377488c18d2f7640 | ORPH
  powerpc    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/c04e778d601325c4d51452ae419158ab6b4f034b | ORPH
  mips64el   |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/2acaac5b2055e7055ce07228d7c4d4d9be550a92 | ORPH
    m68k     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/4c357f58be5b92267be50d62e7c87ab0833abb6a | ORPH
   mips64    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/1d2ba9017c3cd1546eada85f6182523117f407f6 | ORPH
   sparc     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/039a68cf8a0efac50711bed1cc11a5dfae611e35 | ORPH
  riscv64    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/00043b69785c53cab40d44d0c2ef12297bd9b486 | ORPH
    m68k     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/e1eddbade572b05490d70041b678a19c166a9425 | ORPH
    arc      |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/d048bcf158d1720081e5de0fe9afba96720a79d7 | ORPH
 microblaze  |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/3e2e89d1fe489531c50b545d2c4ec3261f6449af | ORPH
    sh4a     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/c20330df85a7eb52dc823c45ab6dc226378303be | ORPH
  mips64el   |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/2bb4fa84dd2f148d0d5e151bd66886de7b82e8d6 | ORPH
powerpc64le  |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/221715c63c4f99bb02b7e840b21ffde869e9ca4e | ORPH
  sparc64    |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/0c9e574ca0cf9ebecbdc0e6fdfa395fb34e53f75 | ORPH
    sh4      |      linux-headers-6.6.50      | NOK | https://autobuild.buildroot.org/results/760004e0b3e3d2a556735c83a157ef8291cc47bc | ORPH
  powerpc    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/ef0880edf223fcd43e27756b00c8b928f9c627fd | ORPH
    arc      |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/ddb11e2632727f2a5a1d519259d2a367183241fb | ORPH
  riscv64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/d59814705d3f3432537fa5fc0ccdaa6bf6a4c3ab | ORPH
powerpc64le  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/500d5cfd18abf4074336439e24772cab9a8f2c37 | ORPH
 microblaze  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/a10a226e644619c5b804ffef604493eaf367469f | ORPH
  powerpc    |    matchbox-keyboard-0.1.1     | NOK | https://autobuild.buildroot.org/results/8535edb90acffbffa664d96a12d6b00f878b9b02 |     
   mips64    |    matchbox-keyboard-0.1.1     | NOK | https://autobuild.buildroot.org/results/9ca39e6d145e38984e27699ff70c8b495bb3b75b |     
   armeb     |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/fcf7b0f96f54c9183b1e823d883b2e263e0bb3c6 |     
    or1k     |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/1b2b03b6bac528b0871b1e128c81ef266e941271 |     
   s390x     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/7df3a9d640502eb9cd9597ecb58f35619bc85383 |     
  riscv64    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/323c8a36180c0e2f352db0a18550b5a90064c1fd | ORPH
   xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/5140159a12727ffdddeb0a67e5366c1dd25a07e3 |     
  powerpc    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/51d2a56e82d2bbb85c50cfc2774e73873c6b6efe |     
   xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/ad233d1858eb492dde7ec17d60c105b08cd3f244 |     
  powerpc    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/1a6e55ac880e4b42526ecd2cb4a7324d3dea4960 |     
    m68k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/3cf3283bf5b17fa71933c52d27fe27d2a2404df8 |     
  riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/ad2c44b5849437923e658db528527a961cd93ee8 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/e7505870f960545d6cb03731dac1761d44ee797b |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/f960e70f49889b955fabc54b4bb01afcc96d90c0 |     
   xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/4b2a0fbcc1e36fe07af531714f3dde52e33b9369 |     
    arc      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/7c501f102bcc521cb6c5c17550353bed19d25735 |     
   armeb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/a58989e8f07fa5c4f240e4879cf42d1dcd1e6890 |     
    m68k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/1e87e6413e9a9db36de1c5afbe8cf38af560287f |     
  riscv32    |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/7eb4b8a435bd586cc23cdd748d19fe5ec3f73778 | ORPH
   sh4eb     |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/f6fad5077fd1e6f60cffc5112b5519ca0158e064 | ORPH
  mips64el   |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/bceb2929113f181381be1c787b68d978f05db407 |     
   sparc     |         pipewire-1.2.2         | NOK | https://autobuild.buildroot.org/results/a213d6b953ed581f389baa1bbfe17a356b192767 |     
   armeb     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/db1cfb660a2d5e6b6763643caa1fd9759fb50552 | ORPH
powerpc64le  |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/542f918848932d1b47cc62a91bbf92df7355e69e | ORPH
   x86_64    |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/c275bf19eb99eafb3d8ddde91e1c923f2c97f15f | ORPH
powerpc64le  |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/601b0cc70362bcb85f1a46cd85bed9e1ecabac7a | ORPH
   mips64    |        popperjs-1.16.0         | NOK | https://autobuild.buildroot.org/results/7ce448318f1b19ebdec33565a841e1f7c0e0aa8c | ORPH
 aarch64_be  |        postgresql-16.4         | NOK | https://autobuild.buildroot.org/results/ada5c2b101dbef26e7b334604496b871a5619f48 |     
   armeb     |        postgresql-16.4         | NOK | https://autobuild.buildroot.org/results/a1047f3f55d0e40f7f3361989f2b834154f731ad |     
    or1k     |        postgresql-16.4         | NOK | https://autobuild.buildroot.org/results/a925b8f451acc3c165e04382ff60fd048ad33d38 |     
   mipsel    |        postgresql-16.4         | NOK | https://autobuild.buildroot.org/results/7b0b8da78b8902cb42f627e98e07e2874693d7df |     
  aarch64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/036115ec2df9552f594bfbbca6f039cf99cab0cd | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/f7d1563e633578c31680e77c3a9d83afd219a6e3 | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/49d116b676bda125a819f34cb24abe760a753be8 | ORPH
  powerpc    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/c71911909261fb0d23365689daf20c2e3f234a68 | ORPH
    arm      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/0e312ed99da75c72a6b52282674862a46625c28e | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/061cb46d39c41470a993375eb4d96efb6eae1de9 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/11fd5983ca7f7c62445e8aba6bfa5e6ed5d251d1 | ORPH
   mips64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/d054e5a4c11abe6721d93c86836bd909bd31434c | ORPH
    arm      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/f5795614acb1ef78e061766ed1930f4cdd35f394 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/61a6135bdf661cef0a569b4e5d8e44cf87fd1ad0 | ORPH
  riscv32    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/50954f76c575e443925f64b6c3a48f213364d745 | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/70091c39ee4d57a9c30b72309b6d9868a2e7b9c9 | ORPH
    mips     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/918e9356e41346b1826116a44e6f343674af5ee9 | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/0fece409898070addfe7133410dcc8ff12a4cdf9 | ORPH
powerpc64le  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/da7d5eb74c5f25f1e92b2b05a94240a1b6928c87 | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/a1a8ba3543a62c5d46455f6354b9e7b81b8e847d | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/fb63be72af13cfa4bb32cd74ea5e77447caf57ff | ORPH
 microblaze  |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/75ad19a671638557407cf586017e1190efdc2030 | ORPH
  riscv64    |      python-numpy-1.25.0       | NOK | https://autobuild.buildroot.org/results/9084d544521bb95a855b796a5cf20c752dce7ecd |     
    arc      |          quagga-1.2.4          | NOK | https://autobuild.buildroot.org/results/a6d263e50d77905a807cd93e321008da94690d65 | ORPH
   sparc     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/9a6f527506b146710a1d8fd901e00b2535e5b5da | ORPH
   xtensa    |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/780b04cb8a052d14e2046a1a8925ce973006e5c1 |     
  sparc64    |         tpm2-tss-3.2.2         | NOK | https://autobuild.buildroot.org/results/15eb89954b10be93177066afd5eab836f6aa7179 | ORPH
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/c0fdff88e92c4155d2bacf81df9229530672c817 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/c77370b6f3c029f2706e2d5ace0da634a8e4986c |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/4b39d034009cc0dcb68d2cbe4cdbd0a446d9e563 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/419f5789ea5c770374568b07d997b8cccf09bc19 |     
    sh4      |            unknown             | NOK | https://autobuild.buildroot.org/results/27e1f7d92f87fd6dbbef423b6a745c93a847006a |     
  riscv64    |       util-linux-2.39.3        | NOK | https://autobuild.buildroot.org/results/643d43c7941d1d1122d1862aa461d66ea61db5d0 | ORPH
  powerpc    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/e513bffcf9fc42918e8ac65f00ba7a69e231cc0e | ORPH
    arc      |         xenomai-3.0.10         | NOK | https://autobuild.buildroot.org/results/f5bfdd7e98d3a7afc9da7fa15914b3a8f115c02e |     
microblazeel |          zeromq-4.3.5          | NOK | https://autobuild.buildroot.org/results/93f7b51ca3f15097d90cb8b06d33b4b5ba78eb53 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  bind-9.18.28 | 1 
                host-go-1.22.7 | 1 
host-prelink-cross-a853a5d7... | 1 
               libdeflate-1.19 | 1 
                  ntp-4.2.8p18 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/fe193d8b9df6fda5f7caa41bdf58c59132eba815 | ORPH
   mips64    |         host-go-1.22.7         | NOK | https://autobuild.buildroot.org/results/f2f9d49a1d2ac2dde13e639512773bdba9df7209 |     
    or1k     | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/c49f13bee2d8173f48559432761279b587d0f11d | ORPH
    arm      |        libdeflate-1.19         | NOK | https://autobuild.buildroot.org/results/c507122a64368ba60edbbf04ddfa85ad570f7047 |     
  powerpc    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/5129b28b7eb1205aec6cc84c62c6e40566646c5f |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

         host-libxcrypt-4.4.36 | 3 
                host-go-1.22.5 | 2 
                  ffmpeg-6.1.2 | 1 
host-go-bootstrap-stage3-1.... | 1 
host-heimdal-f4faaeaba371ff... | 1 
           host-systemd-254.13 | 1 
host-vboot-utils-bbdd62f9b0... | 1 
                  ledmon-1.0.0 | 1 
               libglib2-2.76.1 | 1 
                  linux-6.8.12 | 1 
                    ncmpc-0.49 | 1 
                    nodejs-src | 1 
               procps-ng-4.0.4 | 1 
         python-remi-2022.7.27 | 1 
squeezelite-71c012ad9ba102f... | 1 
             stress-ng-0.17.07 | 1 
                 uclibc-1.0.48 | 1 
                       unknown | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/09b8570630b682022f8139032b5d9308b5ff4d4b |     
  riscv64    |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/666c19e33c204ba45a080314c3a6c639b1637599 |     
    i586     |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/b0c12cb9a58463a083ce43257efd1b4258dad016 |     
   x86_64    | host-go-bootstrap-stage3-1.... | NOK | https://autobuild.buildroot.org/results/a18a02645e26b4b75be9df62d0b18de6adae73cc |     
    mips     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/d5b23d1765b2adfb348b1492dbd7bd6d2eadd1aa | ORPH
  mips64el   |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/ad902bb29fcddd063cf446b94315be5e07b26be6 |     
  aarch64    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/32c70a0394ebd6c5a58c12392a62a37c349f2222 |     
   sh4eb     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/6ec7aad51854b36c2525d99ee27c2ed5a6cf4074 |     
   x86_64    |      host-systemd-254.13       | NOK | https://autobuild.buildroot.org/results/1ff917fee05d05bb85eb1199a46886028344d2b6 |     
    arm      | host-vboot-utils-bbdd62f9b0... | NOK | https://autobuild.buildroot.org/results/336e4ca15d2d057a9491c633a06e94c0301fff1f |     
    arc      |          ledmon-1.0.0          | NOK | https://autobuild.buildroot.org/results/79b379c4169fb808125471c8e9a85c282329682f |     
    arc      |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/72431078179865a821a5b3bbd832c0a90113143a |     
  powerpc    |          linux-6.8.12          | NOK | https://autobuild.buildroot.org/results/b6bfb79cc14392dd7e1826f9fac34882606004ee | ORPH
 aarch64_be  |           ncmpc-0.49           | NOK | https://autobuild.buildroot.org/results/c6a39d2bb185d83962bed003fabbc12004d2d08d |     
   x86_64    |           nodejs-src           | TIM | https://autobuild.buildroot.org/results/0722bd62ee230985fc688230b7bc5c6810edb934 |     
powerpc64le  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/d383239259f60e54929f4c8f3a5252f96c1bac04 | ORPH
   x86_64    |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/5eb1e51982e452d3c149161d7b6ae650d45bec1b |     
    i686     | squeezelite-71c012ad9ba102f... | NOK | https://autobuild.buildroot.org/results/3e2fea800cc9ef6b25fe015ac5edab7fc15f7e65 |     
  mips64el   |       stress-ng-0.17.07        | NOK | https://autobuild.buildroot.org/results/ec893940c791ca52ea44313c3cca05cd57d58246 |     
  riscv32    |         uclibc-1.0.48          | NOK | https://autobuild.buildroot.org/results/55754e93e983e1987788aadeed1ac8280935aaba |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/ce14dac3da1d753b75b6d065d9e6b27fed19ca4d |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

                   duma-2.5.21 | 1 
  gobject-introspection-1.76.1 | 1 
                rocksdb-6.20.3 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/f4f39e9bf793c79e3c439da25bc08edf9f33ad15 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/eb4d85ef382d4adca4c5e8a434167a3670ad5f3e | ORPH
   x86_64    |         rocksdb-6.20.3         | NOK | https://autobuild.buildroot.org/results/ba82dd60319fc95d7002e0a0df0eedd280f9bce8 |     


Gitlab CI results for 2024-09-30
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948006646  | ORPH 
           TestExfatProgs | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948007528  | ORPH 
                 TestExt4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948007211  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948009145  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948009149  | ORPH 
    TestFirewalldSysVInit | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948007534  | ORPH 
     TestFirewalldSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948007537  | ORPH 
       TestFortifyConserv | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948006789  | ORPH 
          TestFortifyNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948006805  | ORPH 
             TestGnuradio | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948007574  | ORPH 
           TestGst1Python | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948007585  | ORPH 
          TestLuajitRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008522  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948007871  | ORPH 
              TestMariaDB | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948007901  | ORPH 
                 TestNmap | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008007  | ORPH 
                 TestOpkg | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008076  | ORPH 
             TestPerftest | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008089  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008240  | ORPH 
              TestPyNdiff | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008442  | ORPH 
            TestPython3Py | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008248  | ORPH 
         TestPythonAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008277  | ORPH 
           TestPythonAvro | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008287  | ORPH 
       TestPythonPy3Attrs | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008273  | ORPH 
        TestPythonPy3Cbor | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008300  | ORPH 
TestPythonPy3Cryptography | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008312  | ORPH 
       TestPythonPy3Evdev | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008332  | ORPH 
     TestPythonPy3Gobject | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008353  | ORPH 
 TestPythonPy3Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008375  | ORPH 
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008388  | ORPH 
     TestPythonPy3MakoExt | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008394  | ORPH 
     TestPythonPy3MsgPack | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008414  | ORPH 
     TestPythonPy3Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008422  | ORPH 
      TestPythonPy3PyAlsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008430  | ORPH 
      TestPythonPy3Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008440  | ORPH 
       TestPythonPy3Pysmb | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008446  | ORPH 
      TestPythonPy3Pytest | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008448  | ORPH 
...PythonPy3PytestAsyncio | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008450  | ORPH 
     TestPythonPy3RpiGpio | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008459  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008475  | ORPH 
       TestPythonPy3Sdbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008476  | ORPH 
...Py3SdbusNetworkmanager | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008478  | ORPH 
...thonPy3ServiceIdentity | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008484  | ORPH 
      TestPythonPy3Spake2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008488  | ORPH 
    TestPythonPy3Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008502  | ORPH 
...y3UnitTestXmlReporting | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008507  | ORPH 
                TestRedis | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008518  | ORPH 
                TestRelro | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948006818  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948006828  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008528  | ORPH 
              TestSspNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948006838  | ORPH 
            TestSspStrong | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948006849  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
