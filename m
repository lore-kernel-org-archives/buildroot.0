Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D200D116F1
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 04:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 105EB60A54;
	Fri,  5 Dec 2025 04:25:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wANsUICvV6OI; Fri,  5 Dec 2025 04:25:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB7C860A57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764908719;
	bh=BERC0DzZyiByuu1BFjIg4662G3w73qeT/CZQ1hNq610=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lEmRfowlXNAXmYZLVwAQV0Mq1a7MwSByzgbnebdeDXBHcuPG/MaCV65wm6AaMp3JQ
	 N5eRXMwygZ4679b+6fh5U+fwssp7+LkEJ6IWmJ1ltfOn3BFZ6xfopVo5AU/UTiC9G+
	 wYu5CMBqr3R54uag8P4c5LUfl/ejME/9Oy9LmKRyBiLvOboEzaM8C4FmGIVyDsl8nP
	 Zd2YWvF4xsrYC31HunkQgkd0FObYmFVMlax6XkxDADQqWQdC5dlbLgUchEfvFOxW1S
	 6AkaEdP7Dnkb6j9Xzdhzgixsajf+sp6nHnvGMjcD9zNBBM1o+1/633fQvRw2Lice6U
	 g5KAONK1L26TQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB7C860A57;
	Fri,  5 Dec 2025 04:25:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 71022199
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 04:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51E59821FB
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 04:25:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PJomLMlWB1O2 for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 04:25:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D9BF981E00
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9BF981E00
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9BF981E00
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 04:25:16 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-477b1cc8fb4so11221125e9.1
 for <buildroot@buildroot.org>; Thu, 04 Dec 2025 20:25:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764908715; x=1765513515;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FYavF2gYEUYpV7rkxj5TXBjOKQlTWpLs7dwumqd6OUw=;
 b=E1gnjt6hItdYmTSX6MlzlCuSCzUV6H4JlPizL0f+08mtx8VLTrCBdQCpgrO48dZlW8
 YsZGNVARuUMsd2ltNuMtPxM1NfM5FJsYd7pyzQ0HERYMJS8FU3Y8BBjIdKdlz0fPJ1ym
 bjTP/gNrxStIaFGarijQocVBseZ064SzCXH02lhy4f828FR9zKT7g/QHqznUGIfTIvTP
 3cYiWwmC9jNX05AD9H/qisqFO7DtBQKPFUvZkpA0AOtIpMh9s3/kLVJ6AzEH/NLuC2QQ
 mH7ca/CsskQkaFVYJjYK8UI1oknQrj6YsgV6x2v1RCsGkdrGKWincXcxPwlqLKxdBFFg
 L3Hg==
X-Gm-Message-State: AOJu0Yynw6dNcVmaFUOIPiIlL5LQ6JuhWlbaDFH1DFfnfSFmOM0sp2FX
 teodQwsFactaieVAgPxbJMBLDVXJ4bn3q9OHmsBVdmcEM5X1TXRoFgDxeGTeNQ==
X-Gm-Gg: ASbGncuQqo4GmeSAzyklOlSIoo4J5oRlz2R9NYjJq5a9CeELBXdw5PdJPn0VU/NyqVh
 HTRgbtfbOPqXJKDEqMLsebOfT3M3XKvZyVOSyA7jES3Cgzt4nMpvtsARlzqfHOLAcSDmLr5aywY
 x02+M/rzIdhafBXOWzCJObXrk5+4et3/dBH9ESqEw++3NKODaRIn4+DxYw6qDA2XfOmsKT3OkIC
 fJR8qNf0GLCQeUD8BqNtxUhMPAVLuAVkGca+3SlfsOdSPtQIDVyl8sYPRCcSxj2bD9nnjNnQYD0
 jXiwJ7TklYAr1yKV93i+TUSQ374i2DhB750v8/qR+pyWbYpHrOtPAcpqIlz+BkMOjMB+S8bsRYd
 awOPcfzVtHQRLpbkI7mq084GOfzbCsdVgc6548iRgBLPaD3MucFi9+jm2u4A874VdD12BZluIQN
 ICeEs8363udddh5IWB0Q==
X-Google-Smtp-Source: AGHT+IH3cCQwnflBzbJycCyBHEzoevpnOFSIjCSA88RjTQN6kLaw4x1C1HewbXh9lVCAxAVuUL5zqQ==
X-Received: by 2002:a05:600c:1d0c:b0:477:9c73:268b with SMTP id
 5b1f17b1804b1-4792f39cc97mr46213115e9.33.1764908714682; 
 Thu, 04 Dec 2025 20:25:14 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d331af5sm6285994f8f.31.2025.12.04.20.25.14
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 20:25:14 -0800 (PST)
Message-ID: <69325eaa.df0a0220.7cf0a.40b8@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 05 Dec 2025 04:25:14 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764908715; x=1765513515; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=FYavF2gYEUYpV7rkxj5TXBjOKQlTWpLs7dwumqd6OUw=;
 b=GRC9da1ahziQ5+Nwk4HKWuZ+zcRsAALwsTRRrLR0/CJ84+C5Krd18Mt0brNNknoCHy
 gEvk1nicDJM44TTxJ2BCwODRP2rg2KTC63zucl7+FsLoIt0BcHUq7voUb4yhhCKU9Kk2
 YfGNS2iXoRGpChdHuXXYhYEZa5pWhGkeCr1NBKr5I6LdhlUQ4reZAvJOFVd33bmG0R62
 YF3a0CosriZ5mXG4NOqtpClOcxL0i7WU81x0sU5NyJbzvaH0thEov6RTpWcjySLq7OjH
 2imNKKYtUg9303Ha/7XChqpz9cHu2ZYTewBhmwVh6BO5ptDMRIK2gPjYllm2YcjBSTy+
 7X2Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GRC9da1a
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-12-04
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

Autobuild statistics for 2025-12-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  5  |  0  |  9  |
  2025.05.x  |  2  |  3  |  0  |  5  |
  2025.08.x  |  1  |  4  |  0  |  5  |
    master   | 42  | 69  |  1  | 112 |

Classification of failures by reason for master
-----------------------------------------------

             dahdi-linux-3.3.0 | 4 
                 dc3dd-7.2.641 | 4 
                    mpir-3.0.0 | 4 
                    brltty-6.8 | 2 
            gdk-pixbuf-2.42.12 | 2 
                     kbd-2.9.0 | 2 
              libopenssl-3.6.0 | 2 
                  libsvg-0.1.4 | 2 
      passt-2025_06_11.0293c6f | 2 
      spandsp-3.0.0-6ec23e5a7e | 2 
                       unknown | 2 
             bubblewrap-0.11.0 | 1 
                 c-icap-0.5.10 | 1 
          cloudflared-2025.8.1 | 1 
                   cvs-1.12.13 | 1 
                   dante-1.4.4 | 1 
           dmraid-1.0.0.rc16-3 | 1 
             drbd-utils-9.21.4 | 1 
            erofs-utils-1.8.10 | 1 
              fftw-quad-3.3.10 | 1 
                      fio-3.41 | 1 
                        gnutls | 1 
            gstreamer1-1.24.13 | 1 
       host-gcc-initial-13.4.0 | 1 
              host-guile-3.0.9 | 1 
              host-rust-1.88.0 | 1 
            igd2-for-linux-2.2 | 1 
                  iozone-3.508 | 1 
               libconfig-1.8.1 | 1 
libdill-32d0e8b733416208e04... | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
                libglvnd-1.7.0 | 1 
                  libnss-3.117 | 1 
     libphidget-2.1.9.20190409 | 1 
          linux-5.10.162-cip24 | 1 
                 linux-6.17.10 | 1 
               llama-cpp-b6865 | 1 
        ltp-testsuite-20250530 | 1 
                memtest86-7.20 | 1 
                nushell-0.96.1 | 1 
               openblas-0.3.30 | 1 
                opencv3-3.4.20 | 1 
               pcsc-lite-2.1.0 | 1 
                 pixman-0.44.2 | 1 
               pulseaudio-17.0 | 1 
                python3-3.13.9 | 1 
        s6-linux-utils-2.6.2.1 | 1 
                 s6-rc-0.5.5.0 | 1 
                 samba4-4.23.3 | 1 
           sane-backends-1.1.1 | 1 
                  sdl2-2.32.10 | 1 
uclibc-ng-test-132c6134d691... | 1 
                  vsftpd-3.0.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |           brltty-6.8           | NOK | https://autobuild.buildroot.org/results/1f412a6486f78ca2e62655870f1abd3ebc9061cd |     
  powerpc    |           brltty-6.8           | NOK | https://autobuild.buildroot.org/results/633f6431c2718bbf27ebdc7334d2b4407c0077d0 |     
    arc      |       bubblewrap-0.11.0        | NOK | https://autobuild.buildroot.org/results/6898e2c2d53e35799ed485b2faa107d4fea22744 |     
powerpc64le  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/b14f6d8fbaf927029417304631e8f17a8d60d1f0 | ORPH
    i686     |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/ba2ebca2651026edce4c2f0945fe4f2b46bd8c87 |     
loongarch64  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/0c3e59561d8fa4668a02dd892e5d567af0d69649 | ORPH
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e062500f9c7dcf6f8400be8bf22c732cd5a013cd | ORPH
   sparc     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/567361a516095474d76c94595c03961c9927ab0a | ORPH
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0383158cfb8bc503ee64fba4e1263e51912b0f01 | ORPH
   mipsel    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/81c9c258407249d5d1a401c81b9899c6734f6c81 | ORPH
   x86_64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/a7e0614662c9fb0457b3c103dab02b12b9495d47 | ORPH
   x86_64    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/12abbda92e95bb691f20415e6565980c9ca023b6 | ORPH
  aarch64    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/ede102fd8dd81ca676492c5b66ad5f7029579921 | ORPH
   sparc     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/1c9966408158b09399c2e637da789a80be1529a3 | ORPH
    m68k     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/d9b44133780bf03be3317356e528dd5bafd40c16 | ORPH
  aarch64    |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/f74d42da964054d24b66fa61444bfca629b8d236 | ORPH
 powerpc64   |       drbd-utils-9.21.4        | NOK | https://autobuild.buildroot.org/results/cebb40008a8e718c8e1c27ff03936e9ba6c257c0 |     
  aarch64    |       erofs-utils-1.8.10       | NOK | https://autobuild.buildroot.org/results/251be18a87d2656115e19449207a80f0c766bb8c |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/84e3b876af6bb1f24de80c587a6c492e9f270861 | ORPH
   mipsel    |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/f7f2d13b0b6e2a4ceff5b96d051c63e361f792c1 |     
   s390x     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/5ec7783c9aac57d09f4e895e625fa8cd321a891e | ORPH
   mipsel    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/6d3e7b33d86ac8f8742a585d8115b0d7fb2eb1dc | ORPH
powerpc64le  |             gnutls             | TIM | https://autobuild.buildroot.org/results/c43c3cda604639b7896cf598a2ec88a31cd29d32 |     
    or1k     |       gstreamer1-1.24.13       | NOK | https://autobuild.buildroot.org/results/97b516b99a4f2fcd26abab15aee27098b4f4eb21 | ORPH
    arm      |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/103f915f43bf585c7333ff96a8b86f7d3ee20a0c |     
 powerpc64   |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/5faebf6397c89ba9bfd27386d7202fe37ea1ee66 |     
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/0d2d3b1c40bcd324eda12f307ff69bdd5dff7776 |     
    m68k     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/4323de3a21e600acad2fad5a209e93c0204f244a |     
   x86_64    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/ece4e8a0d69453ea3d3fed0a085320e4d7020839 |     
   x86_64    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/e31dc59525d3d36fc3fa07f60d6e7cf92e5fc34e | ORPH
    arm      |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/ca6eda6e58a151ca0bfdf2baf583a766ad9b4224 | ORPH
    arc      |        libconfig-1.8.1         | NOK | https://autobuild.buildroot.org/results/63866ea7bf5bf8f6d15f7435718e3057e811fb92 |     
    or1k     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/b477c53a65f624b439173496bfe1dfd422c3a0c4 |     
microblazeel | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/42e0bef98f40bb67ec4e97fbba30f5642c883889 | ORPH
 microblaze  |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/d3ce9630fe681519a47c1e7842be51821a2303a9 | ORPH
    sh4      |          libnss-3.117          | NOK | https://autobuild.buildroot.org/results/104c3ae04d4bd5f2f8ddc474517db6aaee154a5e |     
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/b61bbea9c82a1d4e2320229dfe8a99c3974a8826 | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/c5f9fb41f45e89aa104ac5fb0a22f3c17b859df4 | ORPH
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/6c20c7e45e7430f514bfa4daf84350932948df5e |     
   s390x     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/a04ad5be6f4954666a1537e46cf593b36721b5e9 |     
    arc      |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/135c3a9df693059af299c4cf14e20af436968b6f |     
    mips     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/f0d52f08d5985319ce4bfc6732d9a4549e013671 | ORPH
   sh4aeb    |         linux-6.17.10          | NOK | https://autobuild.buildroot.org/results/caf3be48f3c5b281571de6a8f17116bbfb241311 | ORPH
 aarch64_be  |        llama-cpp-b6865         | NOK | https://autobuild.buildroot.org/results/7b43f05a41602b261cb4ffa3bd31ead5f0b57740 |     
 powerpc64   |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/9e490cc0cc6bb0019db725bce306e20d46f064ef |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/c9b2e63bb68e8e97009d040f4da9714c4ed4e95e |     
   mips64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/0dea1a0a8477dc8e4999e3580dd8421af46c4804 |     
   armeb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/8b75c643daee5a160e25386a4d1d360945d0716e |     
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/27e649b1cbf8db5b8631b0f0da9f3d107b67c5c0 |     
   armeb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/d0e0f3468585ec71025caa8e5fb54837fe084726 |     
  powerpc    |         nushell-0.96.1         | NOK | https://autobuild.buildroot.org/results/d6f6b0b98b20a795a02b0370e1f8c3bc58a5dd5a | ORPH
   mips64    |        openblas-0.3.30         | NOK | https://autobuild.buildroot.org/results/060c673adb5da5a122d61e4778cc6d1c99e037ab |     
 aarch64_be  |         opencv3-3.4.20         | NOK | https://autobuild.buildroot.org/results/8254bd8e0a094b3f662edc3515c9bcf90ef915a8 | ORPH
   mips64    |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/4fc054046a86cae99c37e7ebc78d72c4eae38059 | ORPH
   arceb     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/539fdd06fa34a77c0bc97b007c18f8f8d12ad7d2 | ORPH
   arceb     |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/44ef20f38ca0d81a4391de399a7840bcee86d61c | ORPH
  riscv64    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/a303f809d93e5c8d8cbc876d6f8acf4a01bd69e5 | ORPH
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/bb31bcdee9d00646712d55b248e72a6487deedf1 | ORPH
  sparc64    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/28fee0f8368ae3dc1d607ebad4881b736e360f07 |     
   sparc     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/fd4fae0bb22e70eb76a689558543cd0952e30ab1 |     
microblazeel |         s6-rc-0.5.5.0          | NOK | https://autobuild.buildroot.org/results/bedb1a6c397e9b014e6f1456e05d9bf305b6d4b1 |     
    m68k     |         samba4-4.23.3          | NOK | https://autobuild.buildroot.org/results/cdc63172c1a71288738895d1bb6e3b7d17465507 |     
   s390x     |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/fd9622b1f02cdb4133391184a3303b8dbff7a965 |     
  powerpc    |          sdl2-2.32.10          | NOK | https://autobuild.buildroot.org/results/3bdcb9af8aaa2fcb4b1ab2d168f3af1901c96962 |     
    arm      |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/11c61df74255ec22e181c027c38c8581c934bf77 |     
    mips     |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/470a6e7cae6c322e684db5016f48677347169c3e |     
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/affe60dc7d1cd6fc7f42f8252ca34f4f7d11135d |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/af454f34efd2ccd53376db1f6d8f0a865bff6ef0 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/5f2b87de27873ec93a51b2dd16055c8225e116db |     
   mipsel    |          vsftpd-3.0.5          | NOK | https://autobuild.buildroot.org/results/661edeafc949390df397fd40a8035330238cbe8a | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

                   atop-2.11.1 | 1 
                   cvs-1.12.13 | 1 
                enscript-1.6.6 | 1 
                   libks-2.0.5 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          atop-2.11.1           | NOK | https://autobuild.buildroot.org/results/039bf5b0a3753ba2dd461cf0d37d3e75e47f88ce |     
    m68k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/d3bdf762667084e797eb7f8dc2d1d33080d8e057 | ORPH
powerpc64le  |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/174d965ba6201294e2e3f8ed06376c318fc8305c | ORPH
   mipsel    |          libks-2.0.5           | NOK | https://autobuild.buildroot.org/results/11a2b89a23a07ab751ebe5dc679096719bb2d626 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

cegui-00b4e1fe174da53b7ed72... | 1 
  gobject-introspection-1.82.0 | 1 
                  libnss-3.108 | 1 
                 linux-6.12.58 | 1 
                     shim-16.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/2bfd9100ed19e459c7a0cd10fcbd373b81e4f73d | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/464dbfc2e25db4bfe91b258de3079b1586810df3 | ORPH
    mips     |          libnss-3.108          | NOK | https://autobuild.buildroot.org/results/c2660445dd095d27f87242b660377b06aae4a413 |     
   s390x     |         linux-6.12.58          | NOK | https://autobuild.buildroot.org/results/16a73a9bf1726e678d1656d1e4cb9492c1a37617 | ORPH
  aarch64    |           shim-16.0            | NOK | https://autobuild.buildroot.org/results/8b0dfc8b2dfa297c38b5f87ac13a793a3c8da5cd |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                  cmake-3.31.5 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
          sane-airscan-0.99.33 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          cmake-3.31.5          | NOK | https://autobuild.buildroot.org/results/a1fa6b8bb04d66f94e2ea164f46bf446eb0c2f52 |     
    m68k     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/2320e20362ccf9d04abce4489b8ba51f633a63b4 |     
 aarch64_be  |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/38af855ffcc9343291502b84b98042358b600aff |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
