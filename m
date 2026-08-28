Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08125C61DB9
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 03:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCD4280E8C;
	Fri, 28 Aug 2026 03:27:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SAyZWo2KzSuf; Fri, 28 Aug 2026 03:27:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787887664;
	bh=/2xrmTGO5wpOMLgMqeBt2XIBKFiGiKKNYBd7wvtW2a8=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TBvBXFS921r9j/l5JV6laHV2RhTT2jHPphsf/zwKkHBtDRSyLYXck4D2ux7zhUh5J
	 uHKX7qS4O/km0S9Pkq0QirpmCLLm6FRbgPP3bRRQRYn4Sgf6gTJeIorETPjLWFw2An
	 A/40vGDM6eVW/Qa1w2IcMIEsgRKbqxkAs2s3VwxHgEBrZGM3HVyC7hHtnhaYlvtMYh
	 X/afJoQWvn1fG85CXliWLEMsSYL/62vZ6Yu2qtplKwhdJoWFfaxfTPwxjF3MATWeNA
	 +d6sbP7ep+Amvw0TwLVkSQtb17cDiORwaprI0ey+rBtrPELNKe64KcDs6zDZ8nFMgn
	 YmNrkZRwF95rA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A77B580DF6;
	Fri, 28 Aug 2026 03:27:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B2C66334
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 03:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 997324005C
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 03:27:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oQWItfy2NBOw for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 03:27:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=EbbrLb1G
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 960FE4005A
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 03:27:40 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-495437bb891so4606705e9.1
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 20:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787887658; x=1788492458; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=aYrjkazFQ+1ErzCyVuCq7GieKI+LEHsYyzVvHmKqjgg=;
 b=EbbrLb1Gxa8TeHTs2LoeJUCjAW+utqfq9SQYOlaZYwEOvjgtE+9nUZIkq5wCFRZpTK
 zI1nwQhmAC5pXy3s1aWxsRkiWS/eiD0ZAnYu1pez2bXAfwW3TKLuwCHRYc6yEYI9zu6G
 Io2NgX3MDuJwY6Bvbj+K4S6XjOkSaU7MpUSGiYuj/KSysG9mYXLnuE93IdbD0m1i7Igc
 VzDXLf1FOsQBIEInybrjwWRUjXX2ugdsmZQNlI8sNdQdncwwTFLshfcThloKkchRNqVK
 dz2WZY7RwEA/cjX/0JAHz4CHAnhx82tGpc95nchxsczReiPsJiqqgPXTTFp2xuK2B8Jg
 spIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787887658; x=1788492458;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=aYrjkazFQ+1ErzCyVuCq7GieKI+LEHsYyzVvHmKqjgg=;
 b=a6gP1onHjoHHz4ZJmzVvHT2zy62mlRaMLhD2l4AkwOYk0bUUZ5+Y6T1ggcvEVmS1qL
 H5GbdFslGC3U3da6mZyXIUI6+2W9zDwUqLhCmiYunx8E2fQt21Ugf9MG3uh8+nli0kmo
 8a92duZjhTWnXd2W2BYNOSZ/DrYl/tIwIZVr7mQjqiU/NmNgGjxmllVCL74V+lZM9S3R
 7tVKtSgp7ZTKTyrkLLA6w5QBuuYhJufB6ibnNPavjBckYwTfyV6+d6xwCTv5I42ekmct
 Fe6yOjRKMI5KL+89/jPGn20lIXzKhGUQwCUn6PqXOVwoffK+IqZe1hlwuoJ+GDJ7Xi2e
 XbCg==
X-Gm-Message-State: AFuF++k/poRNmug7uWz2wzHL0YF/0tUqG2zlupvsD7+QnDfrW+Wrmftf
 mU0qTB4bjDS/Pg8FqnHTbecJ1rcw+I5WBgTG6vfK08yKdoqXIoaWe2iou7sGta9o
X-Gm-Gg: AR+sD11MhkSiOqkanSIcVWgpCb6EPCOQug5k+vBa0vA1YxFPfQxmGsMu/wjvnltRUjG
 61PWooHAdefTR0NL0F1uThlkf9QACeqMkn8pX7Bjs/OpBLcqfdchpVVGjHMplx/eXAyT2EbIN+/
 GJhlR+iVVF09otNZhDdwMbLLoe7ROrFuju5HpygT3DPghcHMmVPo8MRWXurF8+VLXgDfL2Rsixp
 G2y/PNqy8slQ3szJtT4pqtVD4fZ1jpF8UpK0ip3Iq34YtMzDEnGb0iWtvmVVG2HGNmQDYcj84oV
 GVH/KFN0TE7z4w4sbF+gTDi/Y2VLXjyTKTQq1Ol7lyXezW9hw9cvVwfRFCaFnE60+WBZIYts6AM
 HPokex12jOyPgorlfFyD5fm9Jr7X/mEVFndSafFXwcUR5knX6hvL/HkytNmHhv7JvE/OMaRgPcs
 exwHLWBT3l1NeGLMjmn0XcWpZPawXf8G+Oz87ONWmQKntgG22duiT8NBMV0HuhDmdzrz0iWsuZy
 g==
X-Received: by 2002:a05:600c:4e86:b0:49b:4eb6:6ffd with SMTP id
 5b1f17b1804b1-49b91a65d9amr35724145e9.5.1787887657850; 
 Thu, 27 Aug 2026 20:27:37 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b9268e134sm17352745e9.4.2026.08.27.20.27.37
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 20:27:37 -0700 (PDT)
Message-ID: <6a910029.1bf49ebf.5bfba.f489@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 28 Aug 2026 03:27:37 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-08-27
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

Autobuild statistics for 2026-08-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 17  | 27  |  0  | 44  |
  2026.05.x  |  2  |  6  |  0  |  8  |
    master   | 23  | 85  |  0  | 108 |
     next    |  1  |  6  |  0  |  7  |

Classification of failures by reason for master
-----------------------------------------------

                    olsr-0.9.8 | 4 
        edk2-edk2-stable202602 | 3 
        linux-headers-5.10.266 | 3 
         linux-headers-6.6.153 | 3 
                   perl-5.42.3 | 3 
                       unknown | 3 
                cryptopp-8.9.0 | 2 
                 lcdproc-0.5.9 | 2 
      libabseil-cpp-20260107.1 | 2 
               linux-pam-1.7.2 | 2 
                    ncmpc-0.52 | 2 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 2 
               pcsc-lite-2.1.0 | 2 
                 rtl_433-25.02 | 2 
               tcf-agent-1.8.0 | 2 
           virglrenderer-1.3.0 | 2 
am33x-cm3-fb484c5e54f2e31cf... | 1 
                    attr-2.6.0 | 1 
                   bash-5.2.37 | 1 
                  broot-1.58.0 | 1 
                   ccrypt-1.11 | 1 
                 ddrescue-1.30 | 1 
                diffutils-3.12 | 1 
                    emlog-0.70 | 1 
                   exim-4.99.5 | 1 
                    fcft-3.3.2 | 1 
                  ffmpeg-6.1.5 | 1 
               graphene-1.10.8 | 1 
            host-binutils-2.44 | 1 
       host-gcc-initial-14.4.0 | 1 
       host-gcc-initial-16.2.0 | 1 
                 host-gdb-15.2 | 1 
          host-libglib2-2.88.3 | 1 
    host-mender-artifact-4.4.1 | 1 
       host-nodejs-src-22.23.2 | 1 
          host-xfsprogs-6.19.0 | 1 
ivi-homescreen-a038ce00031e... | 1 
               libepoxy-1.5.10 | 1 
libfutils-c326ce0cc2a735438... | 1 
libuci-f3fc0b76040685829191... | 1 
                  linux-7.1.10 | 1 
        linux-headers-5.10.267 | 1 
        linux-headers-5.15.217 | 1 
         linux-headers-6.1.184 | 1 
                   llvm-22.1.8 | 1 
        ltp-testsuite-20260529 | 1 
                 openmpi-4.1.8 | 1 
                openntpd-6.8p1 | 1 
                openocd-0.12.0 | 1 
                openscap-1.4.4 | 1 
               pulseaudio-17.0 | 1 
rtl8192eu-9664b2bfc4bcba55c... | 1 
rtl8723bu-ac3d2f564bdf6816f... | 1 
        s6-linux-utils-2.6.2.1 | 1 
             superiotool-24.05 | 1 
                 systemd-258.7 | 1 
                 uclibc-1.0.59 | 1 
               valgrind-3.26.0 | 1 
            vorbis-tools-1.4.3 | 1 
x264-baee400fa9ced6f5481a72... | 1 
                 xenomai-3.2.5 | 1 
              xwayland-24.1.13 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/498a65ed257d259631b400fcfff79a8ca714c831 | ORPH
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/e381d0789a7c1a7a8e38e50cc4069fcbede08dcb |     
    i686     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/94592b74962f39f5c198d6d3490da7e32b37fb24 | ORPH
    i686     |          broot-1.58.0          | NOK | https://autobuild.buildroot.org/results/03c88c15207643b2fd0f2089cc869f9c96d8ce06 |     
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/4a7ef396d07184715b41ac624bd1361e2b8514ad | ORPH
    i686     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/f62e6afa7b974f1b8eb9c535a3c6616408a1bace |     
    i686     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/cf9acdea24b4cc175282a06db5df72c52faffad7 |     
    i686     |         ddrescue-1.30          | NOK | https://autobuild.buildroot.org/results/d6ffeebd780aba1f75dc4d2177514b7188821101 | ORPH
    hppa     |         diffutils-3.12         | NOK | https://autobuild.buildroot.org/results/ba847d72b6ee0a18af3ff3b4e45891c7bd62c68e | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/aa134bdd0d77937717d4989946a81383e92274c3 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/5559b0078bed2e08ba5f1d4363dc25efc476344b |     
   x86_64    |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/016ef8a0d43cfaf569a2dbe2f418bd0571c9ab60 |     
    i686     |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/3e665da50a5d597ef475a3f6481acdc249c3949d |     
   armeb     |          exim-4.99.5           | NOK | https://autobuild.buildroot.org/results/54ffe54efa183be6bfce7d69840bf68e4fec27ec |     
    i686     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/412cbffd8e511fe6e1c9517423a5242037d18931 | ORPH
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/323f0c404f67503f32021cd55719cae9e0806494 |     
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/456d93a98bd08b974aa0a0adabe8f426e90658ac | ORPH
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/fb81db1fe1926b6ea914cc060c31767de79df3ff |     
    i686     |    host-gcc-initial-14.4.0     | NOK | https://autobuild.buildroot.org/results/c4a4b5c4488c59061ba20dd4cb13415613eda748 |     
  mips64el   |    host-gcc-initial-16.2.0     | NOK | https://autobuild.buildroot.org/results/497c6426183a6d8009b8d4c3f83793ede15637f5 |     
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/d3cfad85574645023cafaaed765376a499fe208e | ORPH
    i686     |      host-libglib2-2.88.3      | NOK | https://autobuild.buildroot.org/results/83148a3fa346130ff5e90fe2851ae4abb5b1a020 |     
   x86_64    |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/4500c8d3b1c8852b765041e9738482e39172da85 |     
    i686     |    host-nodejs-src-22.23.2     | NOK | https://autobuild.buildroot.org/results/1025cc9988aba26d49d1120771befc340e7f2150 |     
    i686     |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/bbaf5854dbcda29983b96ef5cd715ab01eac337f | ORPH
  aarch64    | ivi-homescreen-a038ce00031e... | NOK | https://autobuild.buildroot.org/results/00b58d5fd772547cd4f47c1fc1141b458c188269 |     
powerpc64le  |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/0b56b7d49f5e347998b86e3cd2a4e5a89d097a38 | ORPH
powerpc64le  |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/f27bbc64ef6d2d2220877a22d9e4eac101f3f7b8 | ORPH
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/3341142f0cc3ff5fcc3b41a7de63d4b572bfe96d |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/32733485a163c9a5950a9ad0a055fbb524831147 |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/08c8c2796910d4f2cc7668bbe3fcde3fb0217760 |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/0c4d342755befa24d68c26e0ab70b3b8c13af7bf |     
    i686     | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/d99ae6dc31fbe1b4b918e759045a08849c1569ea |     
    i686     |          linux-7.1.10          | NOK | https://autobuild.buildroot.org/results/e2fd4b23dca1bf47eb471ad30099c41721bfdcf7 | ORPH
    i686     |     linux-headers-5.10.266     | NOK | https://autobuild.buildroot.org/results/2b93fefa39f977353ef286d6d82185bab4ab54d8 | ORPH
    i686     |     linux-headers-5.10.266     | NOK | https://autobuild.buildroot.org/results/52147f961fd5f2e6728ed3c2d36de5b2a8e45688 | ORPH
    i686     |     linux-headers-5.10.266     | NOK | https://autobuild.buildroot.org/results/d42bdc600f56a3ba0d464d7323ea1e75d56a704c | ORPH
  mips64el   |     linux-headers-5.10.267     | NOK | https://autobuild.buildroot.org/results/a5d691e5d026a3a49b8a6fcb54e6a44a0b8b1206 | ORPH
    i686     |     linux-headers-5.15.217     | NOK | https://autobuild.buildroot.org/results/e1354e6edf17f334f45185dca9dfb623e8033aed | ORPH
  mips64el   |     linux-headers-6.1.184      | NOK | https://autobuild.buildroot.org/results/c0133ac79adcc0cbf96846b9289ef2972ff769ec | ORPH
    i686     |     linux-headers-6.6.153      | NOK | https://autobuild.buildroot.org/results/a50a7573769088c7da0624b8cea12d3dcbec5c27 | ORPH
    arm      |     linux-headers-6.6.153      | NOK | https://autobuild.buildroot.org/results/643b0fe2075fb158a880525dc18ec34e8c60e5e4 | ORPH
   sh4aeb    |     linux-headers-6.6.153      | NOK | https://autobuild.buildroot.org/results/2f70ecaca434091b34592cf10ed981bd2285f38c | ORPH
    i586     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/6b1df221704516f59ac81300092df9ee293edd34 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/eb246092b7c76526ec363aeb0f57acc955eedae6 | ORPH
    arm      |          llvm-22.1.8           | NOK | https://autobuild.buildroot.org/results/6a5912be21885e581741b0239570c92b6fdc5fdf |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/fa4d82a1b3063a286404ed0343ffd4fe7e663a3e |     
powerpc64le  |           ncmpc-0.52           | NOK | https://autobuild.buildroot.org/results/74fc02c81f85ed86ef99ab5d3903592dfefcc2ea |     
    i686     |           ncmpc-0.52           | NOK | https://autobuild.buildroot.org/results/6da2fea5b2ad701e302b8fb25115dd0548f239b4 |     
    i686     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/74eb73abcab936959e9997bb093e8a0d2838aac8 |     
    i686     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/286718eb23284ee29a769baa23fa48fc0107502a |     
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/1b91b44be61e791b8473c845ce7322ec35906d81 | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/6b96f35dabbe231bec4eabd8178e072363482331 | ORPH
  riscv64    |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/dec92b25138e85a1c12d12960b244789cb03dbfb | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/52619b45336dbee6886ede47aa4863ff2d4365bf | ORPH
    i686     |         openmpi-4.1.8          | NOK | https://autobuild.buildroot.org/results/6a22d4defb597d3aa3a0099044ff15aeda393525 |     
    i686     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/1e97a37ba072ee3f17f1a06aac655d6179cfc1d2 | ORPH
  powerpc    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/dcc70e1ca030b68bf35771785a4e25e653c91252 | ORPH
  aarch64    |         openscap-1.4.4         | NOK | https://autobuild.buildroot.org/results/b81666a6f652b0788318a72d4bf65254537821f5 |     
    i686     |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/227f7fd491fccf4ae54c70adb02163638f792b77 | ORPH
powerpc64le  |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/056702050abdf3b5c2794586706077c0faee9d83 | ORPH
  mips64el   |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/0bd6a6beb7f9223a61a5382d7ac6b19a1518c7e0 |     
  riscv64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/2384cb000c3ffcebc7e9e6462af7791a9cec64ee |     
  riscv64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/c6dd199d6fc8b3a050769545129929e58abbf433 |     
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/47a5ff5cfc617b2084add219b337d1402db32c4d | ORPH
  sparc64    | rtl8192eu-9664b2bfc4bcba55c... | NOK | https://autobuild.buildroot.org/results/5481ce402cf5f5d678def7c01a1229a317fae6bb |     
    i686     | rtl8723bu-ac3d2f564bdf6816f... | NOK | https://autobuild.buildroot.org/results/d7036d2c48304db58a5c7514f1abc281d1162ee2 |     
    i686     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/21e786775c2d1b20a4bf15309cfa0087b3da02f1 |     
    sh4      |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/64ab83c1a97e73cf3dd3afa8ef4900eb0bac53ce |     
    i686     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/09e4ac190641f9296e0ac8a77844e60598875fdb |     
    i686     |       superiotool-24.05        | NOK | https://autobuild.buildroot.org/results/16e226ba0d65c790c2a05cf44d535d2d8905acdd |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/5c93abf6bfb033cb9398f4ed5716681e13037f66 |     
  aarch64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/effbf8feb75f171f9f982415953096432af05314 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/1586657f8ad5abcd42570c5e00b12e9567c4f231 |     
    arc      |         uclibc-1.0.59          | NOK | https://autobuild.buildroot.org/results/5b91c3d7fbbe2324e8abbdd7bf0940d8c82182c9 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/0b56d881a33790fd85f4b94459d319487cc1c0d8 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/caec8f27af4cd237b2dc761df6f12a1ccfaa34e4 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/bca6af2a2cd44cbd4b0333308748a8aadf0b16fe |     
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/1d1be5c73094863cab2342328cbc345ef64cb23f | ORPH
    i686     |      virglrenderer-1.3.0       | NOK | https://autobuild.buildroot.org/results/dcdfb422b66ac4e0bab08c915d37f58c68f67546 |     
    i686     |      virglrenderer-1.3.0       | NOK | https://autobuild.buildroot.org/results/9a6cce98efd5a0f1b910d3a5ee585a05ca3a47c6 |     
    i686     |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/b0bd0f5ac23119007a7f297dbb543cd01e4ff50f | ORPH
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/f5b1e6252bb9cee1328a96d9f8baf0051cfc2d99 |     
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/1dbd55e8a274544e48aae5a6b33790a0ecdfc0c9 |     
    i686     |        xwayland-24.1.13        | NOK | https://autobuild.buildroot.org/results/1065dd594ed447d5a4ae436305940919b77ed4aa |     


Classification of failures by reason for next
---------------------------------------------

        edk2-edk2-stable202602 | 1 
                    flex-2.6.4 | 1 
                libkcapi-1.5.0 | 1 
                  ntp-4.2.8p18 | 1 
      passt-2025_06_11.0293c6f | 1 
                 systemd-258.7 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/4a50dda0b7138067a42b99f9531e8ad934ea520f |     
  riscv64    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/813950ac738b7085b6a62c6c454aa7273c83de55 | ORPH
    i686     |         libkcapi-1.5.0         | NOK | https://autobuild.buildroot.org/results/dacb037535544ca123eab6a7197d1728f926fa9c |     
powerpc64le  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/75eacfcdb5a1b3390e2437e7dee98c4f3fa071c9 |     
  powerpc    |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/0367d83a6e56416298d90043efe2275a4482f8a7 | ORPH
   mipsel    |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/79e0711e0d57377bc900a1fc95f50245422df108 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            host-go-src-1.26.5 | 1 
libfutils-c326ce0cc2a735438... | 1 
                   linux-tools | 1 
    python-cryptography-47.0.0 | 1 
                 rtptools-1.22 | 1 
uhttpd-15346de8d3ba42200249... | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       host-go-src-1.26.5       | NOK | https://autobuild.buildroot.org/results/1de441b18bbe497f2b01d14ed7c83ca8d3dd9f57 |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/6af72b95861ea0f1622ed7428b8cfbad0ccb4f15 |     
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/d4ea2517dfc4d4d64a05aec7538455f0dc698f42 | ORPH
    i686     |   python-cryptography-47.0.0   | NOK | https://autobuild.buildroot.org/results/a32d081f4adceb0fc7bddc1ac51b172f899a6141 |     
    i686     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/b00e2022c4c35b989693cb16e50e5a857c281cf1 | ORPH
powerpc64le  | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/ecafdf67ced55437f856a71b061495f8d303b850 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

    host-gcc-bare-metal-14.3.0 | 5 
        host-python-lxml-5.3.0 | 2 
        ltp-testsuite-20250130 | 2 
                  boinc-7.20.2 | 1 
                   duma-2.5.21 | 1 
            gdk-pixbuf-2.42.12 | 1 
  gobject-introspection-1.82.0 | 1 
                haveged-1.9.21 | 1 
            host-go-src-1.26.5 | 1 
    host-xlib_libxkbfile-1.1.2 | 1 
         libhdhomerun-20210624 | 1 
                  liburing-2.6 | 1 
     linux-5.10.246-cip66-rt29 | 1 
            minizip-zlib-1.3.1 | 1 
             parsec-tool-0.7.0 | 1 
       sp-oops-extract-0.0.7-1 | 1 
                    sslh-2.0.1 | 1 
                  stunnel-5.80 | 1 
                 sudo-1.9.17p2 | 1 
               valgrind-3.24.0 | 1 
  wireguard-tools-1.0.20210914 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          boinc-7.20.2          | NOK | https://autobuild.buildroot.org/results/2823ebdde46738ba0334796f130103d081b6d165 |     
    i686     |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/ec19a53288d84eb217f2bdcdefded41dba4ff3e1 | ORPH
    or1k     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/f9535ccc6754ed1d944068bf2eba97201f57597a | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/3b0a547d0c597830d929f0f2b7b95b3cede9c4a7 | ORPH
   x86_64    |         haveged-1.9.21         | NOK | https://autobuild.buildroot.org/results/48928264a0b80ab77537327b9cc95e58d44758e7 |     
powerpc64le  |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/96efab9245e49b6c3ad3bdea0283580a47f5c005 |     
    i586     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/a0b558c4edef4a04664b3170ad024e80dc9d390c |     
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/0a71d4e45835c95eab615afa6130ac1a684d1eae |     
  riscv64    |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/a2323c29f7c1540138a3fe3e90e5bcf06451f459 |     
    i586     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/02eb220d9838d8a6c33456a43482d0760c51e2d3 |     
    i686     |       host-go-src-1.26.5       | NOK | https://autobuild.buildroot.org/results/868538ff4383e660d35dfdfd4206151623f2d67a |     
   arceb     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/b33d62ca0355a704d46d86b03c2b3e4e355ed530 |     
  aarch64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/3753418817d2887e1ec7caa0ac5f7c5118e03358 |     
  riscv64    |   host-xlib_libxkbfile-1.1.2   | NOK | https://autobuild.buildroot.org/results/eec7e8bd075faca5290fff3a7980be9b0ce6ce22 | ORPH
    i686     |     libhdhomerun-20210624      | NOK | https://autobuild.buildroot.org/results/fe61ffb72ec2f3b001e1aef76245dc8a51a553ec |     
    i586     |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/b2bb12e1172f50ffef7981d295455029d1cced56 |     
    i686     |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/c49182abff3c028abc926926724c90d36eb47739 | ORPH
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/94c05b884a5329fb0d429b3110723cc03b8335a9 |     
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/16801d67ae0950df174c230088b37f9012d37297 |     
    arc      |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/3306f0fd41291820a697b406c221c6582be9d090 |     
 powerpc64   |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/fcfd3a6065578c0e574a756c04edb3817f216e35 |     
   x86_64    |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/9c86b57a6e20e12f76373ed0aed991fabca448e1 |     
    arm      |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/2e36221f761bf7342df346767f97d01d1f3f83f9 | ORPH
   x86_64    |          stunnel-5.80          | NOK | https://autobuild.buildroot.org/results/1795a765419cad8064690df10599f8e79e063e86 |     
    arc      |         sudo-1.9.17p2          | NOK | https://autobuild.buildroot.org/results/ad044ebda22bae5cc998040438f305f7f15f7dae | ORPH
    i686     |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/b6dddba5f7764ec28af97c075dc873d4b876f191 | ORPH
    i686     |  wireguard-tools-1.0.20210914  | NOK | https://autobuild.buildroot.org/results/f6835fc5309fc18cce2dcb7eb243b983c7b538f4 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
