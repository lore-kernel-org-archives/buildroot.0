Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B054C5321D
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 03:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6695881062;
	Tue, 27 Aug 2024 03:17:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0UKmDq6daNRp; Tue, 27 Aug 2024 03:17:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D78881065
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D78881065;
	Tue, 27 Aug 2024 03:17:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5CB241BF86D
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 03:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D64C607D0
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 03:17:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O84OD7Q41tek for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 03:17:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 64662607BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64662607BE
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 64662607BE
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 03:17:26 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-428119da952so44296845e9.0
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 20:17:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724728644; x=1725333444;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rt5XBW4f7ThfXuTfQ9wPK/5gBthowtD47S02WbiXAc8=;
 b=lCE5xamNqye8hrOUF6On83c/xk1jJm6XZcxA7SFmZhzpcI0ZOR7N2pwXvcOkjqiBDW
 JK9Q2XLu9QYJ1HbZysuH3jlfhLeSy2LSDUbXgV3sLp+Xl1mX7PG5J/C+X9GvhRfXVVde
 5UMCrux2+2mOpCYipcHsePd1osXy4oqFvrWTCT2/3O2jzuR/cTMxJQKW9/bZTJ/UJLSl
 a+FzouMGH8WV43LUaNY4ApKuOHjDlvFS6Et48nekF/4DYM0vOhF+hPl4Xeh3nnmSFduM
 ec5otSYd/Gp1/bg6rO3DOCFJCoA8RIYXe/D3Hia+9MzJTmTdc+VuYDQNEETPUDpDHKBZ
 Vhbg==
X-Gm-Message-State: AOJu0YyfyiUwapsD+NkWzqGq14edDN8UGq0oN+Dt+exQ9BkZe/C5knVT
 ulDuLgzZl0u8Zg/snN0t3L6M+50ecJak3xM6zHSposYCj3Ga0ERIDfbdQw==
X-Google-Smtp-Source: AGHT+IH4y6QoZmdQlFS30Kn61Tho5VH+hs7TAItjxGgGB3SIixtjuDvQrji5C5rl/lISC81DYDCceA==
X-Received: by 2002:a05:600c:4753:b0:428:d83:eb6b with SMTP id
 5b1f17b1804b1-42acc8de7c6mr84427745e9.15.1724728643968; 
 Mon, 26 Aug 2024 20:17:23 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ac514e1d0sm169516375e9.1.2024.08.26.20.17.23
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2024 20:17:23 -0700 (PDT)
Message-ID: <66cd4543.050a0220.5d305.e85e@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 27 Aug 2024 03:17:23 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724728644; x=1725333444; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=rt5XBW4f7ThfXuTfQ9wPK/5gBthowtD47S02WbiXAc8=;
 b=UOR3V1VNxKoxcV+D8D0N0h63GdzVT1H55uLOdeqt+MlrtCTMFTqSQNV0WO23KhkXf8
 CqGJotjyyfssbp13bEzdVUCgB9JapvDVl/RugLpCvR71bRPgvurPfxikejsMJYNTUDpB
 dGpfwA7JHvDYlG15zQ9MgXeWwJLnuUxTsxhU4kZ4y20dLt1v9k+Ky4cR3QrbM2SULSYo
 FMOdSbGgBJBVm77QUukoUwpLXva74AWBj9rf02lqTx/8DwQ77G9ifZ1asDDu0R8eoFjq
 xC/k9iVTh+Fuh/2kvhn/1HmGL0L/9LzhhnWO6wBmebMikbBTy201CZ0tu4ZYwqDTE5aE
 QQGA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UOR3V1VN
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-08-26
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

Autobuild statistics for 2024-08-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 11  | 19  |  0  | 30  |
  2024.05.x  |  8  | 14  |  0  | 22  |
    master   | 112 | 199 |  3  | 314 |
     next    |  5  |  9  |  0  | 14  |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.76.1 | 9 
                       unknown | 9 
               procps-ng-4.0.4 | 8 
                  babeld-1.9.2 | 7 
      python-autocommand-2.2.2 | 6 
                    szip-2.1.1 | 5 
host-heimdal-f4faaeaba371ff... | 4 
               ipmitool-1_8_19 | 4 
               libglib2-2.76.1 | 4 
                   foot-1.16.2 | 3 
         gobject-introspection | 3 
     host-moby-buildkit-0.11.6 | 3 
                   httping-2.5 | 3 
              libopenssl-3.3.1 | 3 
                  ntp-4.2.8p18 | 3 
           python-daemon-3.0.1 | 3 
                  ramsmp-3.5.0 | 3 
                   swipl-9.2.6 | 3 
             armadillo-9.900.2 | 2 
aubio-152d6819b360c2e7b379e... | 2 
                    fcft-3.1.6 | 2 
                  ffmpeg-6.1.2 | 2 
glibc-2.39-74-g198632a05f6c... | 2 
            host-ccache-4.10.1 | 2 
             host-delve-1.22.1 | 2 
         host-libxcrypt-4.4.36 | 2 
              host-rust-1.79.0 | 2 
 host-softether-4.30-9700-beta | 2 
host-vboot-utils-4b12d392e5... | 2 
libdill-32d0e8b733416208e04... | 2 
     libphidget-2.1.9.20190409 | 2 
             libtorrent-0.13.8 | 2 
               libunwind-1.8.1 | 2 
                  libva-2.22.0 | 2 
          linux-5.10.162-cip24 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                  linux-6.10.6 | 2 
               linux-pam-1.6.1 | 2 
              luabitop-1.0.2-1 | 2 
                  mender-3.4.0 | 2 
                ramspeed-2.6.0 | 2 
             stress-ng-0.17.07 | 2 
android-tools-4.2.2+git2013... | 1 
             berkeleydb-5.3.28 | 1 
  binutils-arc-2023.09-release | 1 
                   botan-3.5.0 | 1 
                    brltty-6.6 | 1 
            cairomm1_14-1.14.4 | 1 
                 coreutils-9.3 | 1 
           crucible-2023.11.02 | 1 
                cryptopp-8.9.0 | 1 
             dahdi-linux-3.3.0 | 1 
             docker-cli-27.0.3 | 1 
                elfutils-0.189 | 1 
                      ell-0.65 | 1 
                   eza-0.18.22 | 1 
                  fbdump-0.4.2 | 1 
                      fd-9.0.0 | 1 
              fftw-quad-3.3.10 | 1 
                     file-5.45 | 1 
                      fio-3.34 | 1 
              fluent-bit-3.1.3 | 1 
               freeipmi-1.6.14 | 1 
       freeradius-server-3.2.3 | 1 
                gerbera-1.12.1 | 1 
                    git-2.46.0 | 1 
                gnu-efi-3.0.18 | 1 
                 gnuplot-6.0.1 | 1 
      gst1-plugins-base-1.22.9 | 1 
             gstreamer1-1.22.9 | 1 
                 hddtemp-0.4.3 | 1 
     host-python-maturin-1.7.0 | 1 
host-riscv-isa-sim-00dfa28c... | 1 
              hyperfine-1.18.0 | 1 
                 lcdproc-0.5.9 | 1 
                 libcddb-1.3.2 | 1 
                libdrm-2.4.122 | 1 
                libesmtp-1.1.0 | 1 
                liblinear-2.45 | 1 
                  libsepol-3.6 | 1 
               linknx-0.0.1.38 | 1 
                   linux-tools | 1 
            live555-2021.05.03 | 1 
                 lockdev-1.0.3 | 1 
             matchbox-lib-1.12 | 1 
                 mesa3d-24.0.9 | 1 
                   mimic-1.1.0 | 1 
          moby-buildkit-0.11.6 | 1 
                    mpir-3.0.0 | 1 
                  musepack-475 | 1 
                   ncftp-3.2.7 | 1 
                    ncmpc-0.49 | 1 
            netstat-nat-1.4.10 | 1 
                    norm-1.5.8 | 1 
                nushell-0.85.0 | 1 
          obsidian-cursors-1.0 | 1 
               openblas-0.3.27 | 1 
                 openssh-9.8p1 | 1 
                   pcre2-10.43 | 1 
                   perl-5.38.2 | 1 
               popperjs-1.16.0 | 1 
  python-pypika-tortoise-0.1.6 | 1 
         python-remi-2022.7.27 | 1 
            qpid-proton-0.35.0 | 1 
                  quagga-1.2.4 | 1 
            resiprocate-1.12.0 | 1 
                ripgrep-14.1.0 | 1 
     s6-portable-utils-2.3.0.3 | 1 
                  screen-4.9.1 | 1 
               suricata-6.0.19 | 1 
                   taskd-1.1.0 | 1 
ulog-0389d243352255f6182326... | 1 
               w_scan-20170107 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/6b287c949232a42a43c6ece1fbac204214b10b79 |     
 aarch64_be  |       armadillo-9.900.2        | NOK | http://autobuild.buildroot.org/results/75ea53f72135693b84878b8c866914af72eed459 |     
   nios2     |       armadillo-9.900.2        | NOK | http://autobuild.buildroot.org/results/217700949c7db77bfb13aea8e44ec96fdced5b1c |     
 aarch64_be  | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/7df143571df0b0d2eabbe6e6c30e4bc4e91d8fd0 |     
   sh4aeb    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/032e8ddfa79178804190067d1e760216d535d6b5 |     
    mips     |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/88396d08fe17f2fcf2143c9f608e092d65918df4 | ORPH
   nios2     |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/55230b3707d515d45ad71989e250e2aaa617151a | ORPH
  sparc64    |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/004a02013bcfe2425cdf1ddbd83ea6560de93d53 | ORPH
    or1k     |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/810d08f09df0e093a778bf029c75cc9d16200706 | ORPH
  sparc64    |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/1a1e476e231eceded50eb88feb419e1e12fb31bc | ORPH
microblazeel |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/3642648fc6999b2d9a1c4adf2e429b920cc4bcfb | ORPH
   mips64    |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/00836375e5437e11b898ce5b1e062e6247010fb2 | ORPH
  aarch64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.org/results/fbc4d71a3aa356e609161abb64a640b8abe024c3 | ORPH
   arceb     |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.org/results/79e4097cc7cf13d079d4b4308afeab6daa4393cc |     
   mipsel    |          botan-3.5.0           | NOK | http://autobuild.buildroot.org/results/84344123c2dd124796761433bd21963e54429af0 | ORPH
    mips     |           brltty-6.6           | NOK | http://autobuild.buildroot.org/results/0cd4832c9abc2495c66a22c151d2aedf0d971dd1 |     
  aarch64    |       cairomm1_14-1.14.4       | NOK | http://autobuild.buildroot.org/results/7de97f5c364efb64a29254ff4f99b3167448cc7b |     
   sh4eb     |         coreutils-9.3          | NOK | http://autobuild.buildroot.org/results/7778f5a7b711d2934c4c8be1b46138a49a36f390 | ORPH
    arm      |      crucible-2023.11.02       | NOK | http://autobuild.buildroot.org/results/91c9d7ba6671a83521f6a2b4194298504b5c9eaa |     
 microblaze  |         cryptopp-8.9.0         | NOK | http://autobuild.buildroot.org/results/91b74bf91e507c26b99c51d43df8dce386b7bc0f |     
   s390x     |       dahdi-linux-3.3.0        | NOK | http://autobuild.buildroot.org/results/b8f3c9bb7cd5b03343ba8f191c29afae83c4c020 |     
powerpc64le  |       docker-cli-27.0.3        | NOK | http://autobuild.buildroot.org/results/ac1813d6543b6f62e40f01e5f695c317b83c78e5 |     
    arc      |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/e913a8f3ba25853518e10fcc2478ed909d289896 | ORPH
   sh4aeb    |            ell-0.65            | NOK | http://autobuild.buildroot.org/results/893a59340f4d1259c270bac227e189fc3bfa9a3f | ORPH
  powerpc    |          eza-0.18.22           | NOK | http://autobuild.buildroot.org/results/6e8e691491f25bba0799a17cee7997b8d4867934 |     
    or1k     |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.org/results/95af4d528dd676d25aea0dfaa19adface892972d | ORPH
  mips64el   |           fcft-3.1.6           | NOK | http://autobuild.buildroot.org/results/6aeb5f9c73cc644a1a0c42fcf76f28f42505db73 |     
 aarch64_be  |           fcft-3.1.6           | NOK | http://autobuild.buildroot.org/results/ac58c0d7b8071d415200dd33641ddb0d25ff6169 |     
  aarch64    |            fd-9.0.0            | NOK | http://autobuild.buildroot.org/results/dd9299696366692444c8d0daa9fff2c40128d305 |     
   arceb     |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/2940c82ac5ceb4c8eb117772617b6d231759d0c3 |     
    arc      |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/9b7d2fd6d571e50ac021d948322de35a211508df |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.org/results/72b6ada902d3ccce8e67a401473c4958cb41d88f | ORPH
    i686     |           file-5.45            | NOK | http://autobuild.buildroot.org/results/abfe66cec3680d396c5774ba492f34599e513edc | ORPH
   mips64    |            fio-3.34            | NOK | http://autobuild.buildroot.org/results/a62c7309a38d6624c58a9c40277f172e6782d123 |     
  mips64el   |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.org/results/c4791114e1b23aaca5d153df50fd4b604c6663be |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.org/results/963b272c945134f7edf613bf1d203155670d62c4 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.org/results/63cdd9640b6ef31f85c0c807147526c30b12bb88 |     
microblazeel |          foot-1.16.2           | NOK | http://autobuild.buildroot.org/results/2e9ef51eb6f6521031fd201248b7073a73d11a0e |     
  mips64el   |        freeipmi-1.6.14         | NOK | http://autobuild.buildroot.org/results/b33e72b3348427f2f772e5c29dd3753958597058 |     
   s390x     |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.org/results/32d071520f0339e8a9d4603b8089f9cf933e4aca |     
   s390x     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.org/results/a0b5f541ddb31aa0ab168442896d04d205d9f5e4 |     
 microblaze  |           git-2.46.0           | NOK | http://autobuild.buildroot.org/results/981255855d91fad49e1eb9fd997aaa54c3705eac |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/6cfe330be8428678f86dec87df2daedf99501200 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/6cc9f11cde839c814601c2c81386b61f1dc4040c |     
   x86_64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.org/results/b94bc890b740bb7ef6a9122df57ee46629db3244 |     
microblazeel |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/fa512f3afbbf7cc1066213a5ee83bf232639df29 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/d8bb24fa4528bd3314e42361975a27e50cbe6ca3 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/54a16c90455049d15c1fbd15f6441656776dbfaa |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/248d1b22a4f9388649a00bae273d45de3fc468a2 |     
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/f4be1069bbd6536688c35eea7df4ee346200ccf5 | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/ec2cf7a9996ecde90d67a6817b59ef229f037c3d | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/52ba8dbf4733a3df7d10ba56156d785ab4d74681 | ORPH
    mips     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/7fc6e759441b15d3126244710b5f95039a001386 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/cc50644dec8e2bfefac4c63ef9365bebc007ece1 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/87e5c6407f4ff3eb53b623ae02938a54fe1c26b4 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/5f19aeb3b21c5e9705853ab7c48446cef47481a5 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/e7f183df2410689a8a300b7dc175443cc66b5149 | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/a584bea518dd2f27cdddc2301a88b4b6595aa8e9 | ORPH
   sparc     |    gst1-plugins-base-1.22.9    | NOK | http://autobuild.buildroot.org/results/868e2d6a0323855d34638b8df490df7a199bb309 | ORPH
   armeb     |       gstreamer1-1.22.9        | NOK | http://autobuild.buildroot.org/results/7cae02816bf7598fc2037d395e611be817281458 | ORPH
    arc      |         hddtemp-0.4.3          | NOK | http://autobuild.buildroot.org/results/d68a81f1dafc22428cfacef6d2c1449ba1018a85 |     
    arc      |       host-ccache-4.10.1       | NOK | http://autobuild.buildroot.org/results/e75a01ec0ce9cfc791bbd19f1f5418d1b2132b8f | ORPH
    arc      |       host-ccache-4.10.1       | NOK | http://autobuild.buildroot.org/results/c8b965122cc72174b53d82510794b4f4ec1bcb36 | ORPH
  riscv64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.org/results/df2ac45721626ba0f90dc2a15341dad56495a7db |     
   mips64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.org/results/64c4daaff51c07c696833fb8685850109a16d4fc |     
    arm      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/63b3e890945f03ff16546fcaa90b1560b490ee60 | ORPH
    arm      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/73d2ae3907d757d9ab550b9aa008379d58571d0e | ORPH
 aarch64_be  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/e7ce58b7edfcd661fbf86e96a75ac3b72ee7e770 | ORPH
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/b0161749c7d59e1a46782c9176a154d0f19138d9 | ORPH
    arm      |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/4d6ad5d05421eb886a19532bfc573abde6e94841 |     
  mips64el   |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/4339f98a3083fdceb7673913d15041969014d296 |     
  riscv64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.org/results/b227400dc5799b7a5dd22b59cb439b8a0ed4f52c |     
  mips64el   |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.org/results/afb83c6a0fe90425965d23d02decd3381c92dc92 |     
  riscv64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.org/results/9d0e40a92bee43394af0328e0606c52498cf7fd6 |     
   x86_64    |   host-python-maturin-1.7.0    | NOK | http://autobuild.buildroot.org/results/2eee0bd5fbeb76507c57de00ccb87ec750c9fef0 |     
   mips64    | host-riscv-isa-sim-00dfa28c... | NOK | http://autobuild.buildroot.org/results/94e7c4a62111172e32e8e687bc5c3eee229f6451 |     
  aarch64    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.org/results/cc5585f8753d6b1bdb137ddfe0c22ceaf91ca7ab |     
  sparc64    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.org/results/6d24086a91c4cca2dcf26502a29b235a70c90c03 |     
   sh4aeb    | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.org/results/f68d17256781cd958080efa33f72fa5e86d89df4 | ORPH
  sparc64    | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.org/results/1a9b90bc33ee118c18834f26ad41c219bf88765a | ORPH
   armeb     | host-vboot-utils-4b12d392e5... | NOK | http://autobuild.buildroot.org/results/b656bc38b9dd09b038d69396e088c91e937ed261 |     
 powerpc64   | host-vboot-utils-4b12d392e5... | NOK | http://autobuild.buildroot.org/results/955f504ef22eb95a89675245da2f2db87c97f110 |     
   nios2     |          httping-2.5           | NOK | http://autobuild.buildroot.org/results/41c380557fc3d3e440858f3ac7527437221caca7 |     
    sh4a     |          httping-2.5           | NOK | http://autobuild.buildroot.org/results/7fcc15b564386e0e8976ed18ae7d4fbc176665a6 |     
   mips64    |          httping-2.5           | NOK | http://autobuild.buildroot.org/results/45efd6cf342036e840772b39d47a7c94c996ab9b |     
  sparc64    |        hyperfine-1.18.0        | NOK | http://autobuild.buildroot.org/results/5c233f9daa22c74a6237e73aa0a143dd66028307 | ORPH
    arc      |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/3bbeb1ed4adee1ac22cb7f9b2e9273f5f1efb7fe |     
   mipsel    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/2d485c9de61f6844b31ae7ab1a4b2faf36ffefcf |     
 powerpc64   |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/2fc9322205d7b014ccd2b86a87fdcd16b6ba2146 |     
    or1k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/e32383ddf0ea537010165f550a24486c065ea281 |     
    mips     |         lcdproc-0.5.9          | NOK | http://autobuild.buildroot.org/results/a619ac5f262ce1bea67e7a831550a8c86cdc7a42 | ORPH
   x86_64    |         libcddb-1.3.2          | NOK | http://autobuild.buildroot.org/results/abb8d5c6e8869b1996705a59acf41d225efa484f |     
   xtensa    | libdill-32d0e8b733416208e04... | NOK | http://autobuild.buildroot.org/results/c34ba400ba47012e2a503732037abd04731e1585 |     
   armeb     | libdill-32d0e8b733416208e04... | NOK | http://autobuild.buildroot.org/results/bd2c388cca8d9692bb30c1f981ea1a9e16296b82 |     
   sparc     |         libdrm-2.4.122         | NOK | http://autobuild.buildroot.org/results/5335a5ee3ca7e940c99c31388414482528a9ed5b |     
  sparc64    |         libesmtp-1.1.0         | NOK | http://autobuild.buildroot.org/results/3ffcfaa490b13df3f1d6b48cbd630dc025083498 | ORPH
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.org/results/eedf0b866a701e25a3323910c756860b8e6532c7 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.org/results/8b12ad1d034de5dee67c52dbcfc618a7a1d7fe74 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.org/results/380a4eef3b5ef4663b94adef415158834fc7ef21 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.org/results/62dee118cdc7122bd6432a24a48cd55c2d3f63cf |     
 aarch64_be  |         liblinear-2.45         | NOK | http://autobuild.buildroot.org/results/d2cc5a8d0d815b0c7a186744e1d92df1f2d0d8f9 |     
   arceb     |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.org/results/17c0ad070c7249542cafd0c646527fadc987f4e4 | ORPH
 microblaze  |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.org/results/f6208448740c9e08737f7ec5677b4d502f9876f4 | ORPH
 microblaze  |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.org/results/610a3e1d8cc2ffbdb5a53aa7199faf6f774cf9bd | ORPH
   mips64    |   libphidget-2.1.9.20190409    | NOK | http://autobuild.buildroot.org/results/c0be3984f977cbcfd427a34ded115ad7c5fd1a05 |     
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | http://autobuild.buildroot.org/results/052da3ac09a996b1c7d43d0381bf2c98690d0839 |     
    arm      |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/1ef150b8295f39c9dc9816d83ea348bd23330e46 |     
    m68k     |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.org/results/033aa57acc27751bc05b9a3fc06a4e09827a527d | ORPH
   armeb     |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.org/results/10df1aaaf478298aa5f78026b3ea2ce56429cf54 | ORPH
  mips64el   |        libunwind-1.8.1         | NOK | http://autobuild.buildroot.org/results/a2044a7499c4baccc59fe4bf1b348d75f1c9f18d | ORPH
   mipsel    |        libunwind-1.8.1         | NOK | http://autobuild.buildroot.org/results/830f07376c722cbfba07a6059c2f99aafabed181 | ORPH
    or1k     |          libva-2.22.0          | NOK | http://autobuild.buildroot.org/results/6d51d75c65649d888534523daec4d388b60497a7 |     
   mips64    |          libva-2.22.0          | NOK | http://autobuild.buildroot.org/results/86a07715de87d770655f46a63e2d10ef91ce2738 |     
   mips64    |        linknx-0.0.1.38         | NOK | http://autobuild.buildroot.org/results/761efe9ee3a539f07f37165da42d9bd70724e25b | ORPH
  mips64el   |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/82081892c05e3b11038c3f5a607613de823a647f | ORPH
   sh4aeb    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/5bf6ebdac762e3b80c83bbd55b108893f45a4073 | ORPH
   nios2     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/311f27e90f463fea0fe47915d7867b1684237c74 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/b85ef5afe5709f68a815e429b0d26e8aa59979ce | ORPH
    sh4      |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/6b60b3396c9129be716cce098fc7a96b6f5ea104 | ORPH
 aarch64_be  |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/271037c2f2bf096148751e72e8f6c941936e6d81 | ORPH
    i586     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/2d3115c23e119887056b513505fab7b5e41ca3cc | ORPH
microblazeel |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/4c3683537df6984d8f4ad036d0cf98968ed6bc23 | ORPH
   xtensa    |          linux-tools           | NOK | http://autobuild.buildroot.org/results/b992e75bfce827bf3768868550533939a56310b2 | ORPH
 microblaze  |       live555-2021.05.03       | NOK | http://autobuild.buildroot.org/results/758e29dc71b4420b6cd0db38ca8f13ccd1167d0b | ORPH
   armeb     |         lockdev-1.0.3          | NOK | http://autobuild.buildroot.org/results/ebce813b23838872ed6ce6fcf1744d1a8b2978bb | ORPH
   mips64    |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.org/results/550b5cc31b18cc9acb2469f7b359062e0a74ba38 |     
    m68k     |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.org/results/b50a884a7a915f64cf161505c5c2036462cd6917 |     
  powerpc    |       matchbox-lib-1.12        | NOK | http://autobuild.buildroot.org/results/95bc8605eb530cdf9ea26382bc0779b323b42bfb |     
powerpc64le  |          mender-3.4.0          | NOK | http://autobuild.buildroot.org/results/818f8c156311010d03d2f64b42231f486b543837 |     
  aarch64    |          mender-3.4.0          | NOK | http://autobuild.buildroot.org/results/27d8249f6288c1638b31d36d1af118bd31bb60e9 |     
 aarch64_be  |         mesa3d-24.0.9          | NOK | http://autobuild.buildroot.org/results/07d39a0185586e8aa734a671da874391b91cda55 |     
   nios2     |          mimic-1.1.0           | NOK | http://autobuild.buildroot.org/results/961beb0e4b6555ac5a2a980f43ec8555b2056437 |     
  riscv64    |      moby-buildkit-0.11.6      | NOK | http://autobuild.buildroot.org/results/800c2b4cf1576d99bf67702932f94d709ed12d3d |     
  aarch64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.org/results/81c07159c9d97ee2278ab100c2cd7b94453f4ce8 |     
    i686     |          musepack-475          | NOK | http://autobuild.buildroot.org/results/87c629b36f2ca059e76ec325365dfc063743867d | ORPH
powerpc64le  |          ncftp-3.2.7           | NOK | http://autobuild.buildroot.org/results/0d66ff59d930045fdabacc090452d054a3968c69 |     
    i686     |           ncmpc-0.49           | NOK | http://autobuild.buildroot.org/results/5feea0754400ae9ee161132ff00546ec27aa98d2 |     
  powerpc    |       netstat-nat-1.4.10       | NOK | http://autobuild.buildroot.org/results/9ef86ea5d3c186a1111a046f7efba85eb028d8df | ORPH
    i686     |           norm-1.5.8           | NOK | http://autobuild.buildroot.org/results/a01083c4bb12b2dc37691b0fba41ae12065a3888 | ORPH
   mipsel    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/268975d454a90b6212559e635f66af93e9daebda |     
 microblaze  |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/23ad6a3aff08d302e8e378a7adc193943ac8ba3a |     
    arc      |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/1ca209b622046a5ccaf327ef022ba2476bde4855 |     
   armeb     |         nushell-0.85.0         | NOK | http://autobuild.buildroot.org/results/0902df3eb9dbaca747fbb1f9a0d4e80128a3b878 | ORPH
   sparc     |      obsidian-cursors-1.0      | NOK | http://autobuild.buildroot.org/results/fdeeca5705718e2b18da95ea20744a6ea3f233f3 | ORPH
    i586     |        openblas-0.3.27         | NOK | http://autobuild.buildroot.org/results/d5384b2b55c0cf6a0d7a66d1715148f0c2ff7dfc |     
    arm      |         openssh-9.8p1          | NOK | http://autobuild.buildroot.org/results/c359fb5c1662e9f68cb15e2c24e1d4d6dbfdab28 | ORPH
    mips     |          pcre2-10.43           | NOK | http://autobuild.buildroot.org/results/1017f5178f605240d22f884bb64a55cae4a9d9ba | ORPH
   x86_64    |          perl-5.38.2           | NOK | http://autobuild.buildroot.org/results/45e427815e7f81619ee8d06d502e7ae4dec6dd32 |     
   x86_64    |        popperjs-1.16.0         | NOK | http://autobuild.buildroot.org/results/d7600b71b6bf30683fc808e149d1073f2f81d5d7 | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/f7bbfa260396f2c36f3b2b5bb429dda6d6c2f5d4 | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/25b726190a07d7ca7220e5680b20b2633e027e87 | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/399b2df416123e13e6eaa3bd4a8e334cba255f2b | ORPH
    m68k     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/5415525ee4a7a87db4650c0e7cf6aa3db0b3486f | ORPH
   s390x     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/831db27cebfe832cf5e87c2ca0558476ea521e0d | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/8a0914cf91dc7c82b1366615830b1ae69e75627d | ORPH
powerpc64le  |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/97ac0bc1dc6916b4795a98e6327d1a8f172cc5df | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/7d95e289107a00b4ffc9646feb63038a8ca6bce3 | ORPH
 powerpc64   |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/0930b3613b2da263ed7001226985c635b31d3e1a |     
    i686     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/b29d3fb312c8bd04c9cc8a631ac3332525bb6e68 |     
 powerpc64   |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/ce9bd7679bb3dfcc13a47ec30531f4330b967a5e |     
  sparc64    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/92ccb17a0b9212e266f7b74261b00cabdc80e883 |     
    or1k     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/656b8b7d87a14e48fed0465e53e37fa2709d145a |     
 aarch64_be  |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/ae90ae8eb1716eb6b253fd0fcd96465a68e75cbf |     
  aarch64    |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.org/results/9d42c569fcf8259b9bd9bdc7f4a9dcac4f638e04 |     
 aarch64_be  |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.org/results/56fb66b3bd2f0f49fc6701a79cffd543084078ef |     
   mipsel    |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.org/results/d32e7f3a769475d3ab049ec3a196103aa223e46c |     
  aarch64    |  python-pypika-tortoise-0.1.6  | NOK | http://autobuild.buildroot.org/results/ee3098564bc7aafb905f1b0fe2db92e84cacd005 |     
   mips64    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.org/results/2738808604974b3e81935ef747fbed4c5ffe02c3 |     
    arc      |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.org/results/2c57ba13a878e55c44f0b391a34f73d7c91ed37d |     
microblazeel |          quagga-1.2.4          | NOK | http://autobuild.buildroot.org/results/a7ffe5776dc6601554cad68d78df04c4fd95120b | ORPH
   s390x     |          ramsmp-3.5.0          | NOK | http://autobuild.buildroot.org/results/b3b4da4e6eb3074eeb391e0a1f331fbdf78ac7a2 |     
    arc      |          ramsmp-3.5.0          | NOK | http://autobuild.buildroot.org/results/a74f7efb93e08f6319c965eac308400e6dd74dd0 |     
  aarch64    |          ramsmp-3.5.0          | NOK | http://autobuild.buildroot.org/results/4fc6193df46523a8b27e4bce7671873c79cd921a |     
    arc      |         ramspeed-2.6.0         | NOK | http://autobuild.buildroot.org/results/f68fd6b76deb5288d68b71f32c1faed8b1594e2d | ORPH
   arceb     |         ramspeed-2.6.0         | NOK | http://autobuild.buildroot.org/results/ecd1542cba509cd45a4605bc06088b4d9506ddf4 | ORPH
 microblaze  |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.org/results/dd8b0d76277e21eb6c9b056e68728c43260b3d63 | ORPH
    i686     |         ripgrep-14.1.0         | NOK | http://autobuild.buildroot.org/results/09cfe248965c1abde94dbbc7635c41396efb492e |     
   arceb     |   s6-portable-utils-2.3.0.3    | NOK | http://autobuild.buildroot.org/results/5e03056b257cdd5c8ef65c13f4d1a23b2673bb22 |     
    m68k     |          screen-4.9.1          | NOK | http://autobuild.buildroot.org/results/870748e4a63c3dbd5d1c51dea9c8bf18dac6419b | ORPH
 aarch64_be  |       stress-ng-0.17.07        | NOK | http://autobuild.buildroot.org/results/71bcebba3f3b0ea5f881e0a360022293a23546c3 |     
 aarch64_be  |       stress-ng-0.17.07        | NOK | http://autobuild.buildroot.org/results/924a5a46f89cbfe9bcdf3ac480129061dcfbe414 |     
   armeb     |        suricata-6.0.19         | NOK | http://autobuild.buildroot.org/results/69f8a0e88c315c7a9fa1c96f702e0eba1ec6ab1c |     
   x86_64    |          swipl-9.2.6           | NOK | http://autobuild.buildroot.org/results/fb937f56d46870fed033cd0275030e38c54659d0 |     
  mips64el   |          swipl-9.2.6           | NOK | http://autobuild.buildroot.org/results/51a2113e524aa81dec3db8e09ea0665687a768ed |     
  sparc64    |          swipl-9.2.6           | NOK | http://autobuild.buildroot.org/results/5f404709a27caa7f2ed367e8b9356c1f84d7d445 |     
    m68k     |           szip-2.1.1           | NOK | http://autobuild.buildroot.org/results/b0814423f7c94fade8e4a1f44e8bc042aa8c5aa8 |     
  aarch64    |           szip-2.1.1           | NOK | http://autobuild.buildroot.org/results/81701281e53acf20e242520c1a50e769bb48bd1b |     
  riscv64    |           szip-2.1.1           | NOK | http://autobuild.buildroot.org/results/5d81f736ac0bc4f263eaffe99e296a6e53d1c88c |     
    mips     |           szip-2.1.1           | NOK | http://autobuild.buildroot.org/results/f5fb43cf7fe7c51e4b6bc7efac2c760445cbd7e5 |     
   nios2     |           szip-2.1.1           | NOK | http://autobuild.buildroot.org/results/f459dbc1929f79f12f94fee5f6b85c8157231f3a |     
 microblaze  |          taskd-1.1.0           | NOK | http://autobuild.buildroot.org/results/5095755c08c5c8ac30cbc25828fd4ae9abc509c1 |     
 aarch64_be  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.org/results/9f2ece5a16f301e3ce136a25d33727973ba7dfa6 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.org/results/24912e1806ebd7602ff3a431943eed4935801118 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.org/results/39084a52452d97904786184535a4f5d8f4034258 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.org/results/11d38b7e2e58ac5413f93987594bf9da4ec03103 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.org/results/4b64499e46eccd686bacde5ccb9537201537c223 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.org/results/ef52bb56f372c74c831fb7bb7e17fe193c21f04d |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.org/results/ec85e70d34a9bf6b135b5033c8996131cb21bc98 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.org/results/5993d9cf13ef2201f8dd1e812682ff4d7dfa7d4f |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.org/results/ecb4b165842d1c4e0e25b17e31f2cb3ac42a16f5 |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.org/results/b0d1bb782429be0b91d3cf12aa8dad13a53cdede |     
   xtensa    |        w_scan-20170107         | NOK | http://autobuild.buildroot.org/results/5cf680322b6f1d1f065548063a747367b8be6e48 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

host-heimdal-f4faaeaba371ff... | 3 
glibc-2.38-81-gc8cb4d2b86ec... | 2 
                       unknown | 2 
               asterisk-20.5.2 | 1 
                elfutils-0.189 | 1 
                  ffmpeg-4.4.4 | 1 
         host-gcc-final-11.4.0 | 1 
                librsvg-2.50.9 | 1 
                  linux-6.6.37 | 1 
                 mesa3d-24.0.9 | 1 
                 openssh-9.7p1 | 1 
                    php-8.2.21 | 1 
                    qemu-8.1.1 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        asterisk-20.5.2         | NOK | http://autobuild.buildroot.org/results/b472f97343e2b9f5b03b25b0783000a7004bd892 |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/2a922e53a89d96db2b50ee8845d77103bf36e5fa | ORPH
  aarch64    |          ffmpeg-4.4.4          | NOK | http://autobuild.buildroot.org/results/57b76861347885ff3bad4424f4a45691223f01cc |     
 powerpc64   | glibc-2.38-81-gc8cb4d2b86ec... | NOK | http://autobuild.buildroot.org/results/f6f6d23363773fdac97db4406bb8a8de12551e06 |     
  powerpc    | glibc-2.38-81-gc8cb4d2b86ec... | NOK | http://autobuild.buildroot.org/results/ca7d93d28256697bb81bf0a543c91949ce689256 |     
 microblaze  |     host-gcc-final-11.4.0      | NOK | http://autobuild.buildroot.org/results/0a7506c7b746cabbf19edff360950a52bea99ec1 |     
 powerpc64   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/9a3f5dae4c24b04134c3c58cb4baa4fa73bff546 | ORPH
  aarch64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/1392846286e243406469f21d34b91d729bd81d81 | ORPH
  aarch64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/f3c46ed372bb4d3054bf1c685f85678ae68e67c3 | ORPH
   x86_64    |         librsvg-2.50.9         | NOK | http://autobuild.buildroot.org/results/4eb91755e64141253b114a927b67fba63a31691b |     
    sh4a     |          linux-6.6.37          | NOK | http://autobuild.buildroot.org/results/66500c7d1ac4d5a351fb5aa58be5af46f58655f7 | ORPH
  mips64el   |         mesa3d-24.0.9          | NOK | http://autobuild.buildroot.org/results/92e2df07f60bb1ebffd5da1f927fbbacbf129df6 |     
powerpc64le  |         openssh-9.7p1          | NOK | http://autobuild.buildroot.org/results/8d529a819a293600a30947bdd0bbbc965742e8ed | ORPH
   sparc     |           php-8.2.21           | NOK | http://autobuild.buildroot.org/results/dc3c90c5fe2c8db80745f88b627456befccf96f8 |     
   mipsel    |           qemu-8.1.1           | NOK | http://autobuild.buildroot.org/results/d0de86efd31169a22d56c56e2211a961beaa26d9 |     
   mipsel    |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.org/results/c1f9539d5d7759491cfe4308f0e4d36d9a67c4a2 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.org/results/021985487348ba289920b97402b3006652ca9449 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.org/results/b1829cd654f7e93fa46d544c30606d368f6495a0 |     
    i686     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.org/results/7a5697f13a652df5eba57bfefd9dbc0ad76b14ff |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

glibc-2.39-74-g198632a05f6c... | 2 
             cni-plugins-1.3.0 | 1 
                 coreutils-9.3 | 1 
                   cpuload-0.3 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
                  fbterm-1.7.0 | 1 
ibm-sw-tpm2-5452af422edeff7... | 1 
                  ledmon-1.0.0 | 1 
          libcamera-apps-1.2.1 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
squeezelite-71c012ad9ba102f... | 1 
tftpd-e52af4207a6e09a1ba21f... | 1 
                 wavemon-0.9.5 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |       cni-plugins-1.3.0        | NOK | http://autobuild.buildroot.org/results/c4f0d225bc50c688d22908f8cd34295ba1d56826 |     
   xtensa    |         coreutils-9.3          | NOK | http://autobuild.buildroot.org/results/b5d99fcecbdcb7a7e25fbfb750794b0b7a2ce805 | ORPH
  aarch64    |          cpuload-0.3           | NOK | http://autobuild.buildroot.org/results/eb2fff5c7a448b4b47d441fbf704b293b2fed80f |     
  aarch64    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.org/results/560eeea9e27fc2f6833220c4f94e977a18ca183f |     
    arm      |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.org/results/1d8e2089181c409aef7ada5a35b6460f03155563 | ORPH
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/492cf5e3c8fcf49fa53ae0fa1c50d3c49531ada0 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/a8eada7fa876ca26dc3cf3ee6272c8927e9938f3 |     
   arceb     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.org/results/b29db136d1884191ffca7b77daab8fad43f236c8 |     
    arc      |          ledmon-1.0.0          | NOK | http://autobuild.buildroot.org/results/6c568141871ed926e60615db3d313fd37761fede |     
  mips64el   |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.org/results/e1fe035df0af87fe317ac6d0712c5da72131b5cb |     
    arm      | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.org/results/d4ead36117af44380cefdddac35e975ee7909654 | ORPH
   sh4aeb    | squeezelite-71c012ad9ba102f... | NOK | http://autobuild.buildroot.org/results/542c18df38fe4597671f189680b62267f6a1cc91 |     
   x86_64    | tftpd-e52af4207a6e09a1ba21f... | NOK | http://autobuild.buildroot.org/results/57713a3a8e9787db3ed5f9cf84cc6a2cf46fdef9 | ORPH
    m68k     |         wavemon-0.9.5          | NOK | http://autobuild.buildroot.org/results/47bb738d2d72813ff36099ca0aa93869b1ab5ae3 | ORPH


Classification of failures by reason for next
---------------------------------------------

             bluez5_utils-5.77 | 1 
                bpftool-v7.1.0 | 1 
                  fbterm-1.7.0 | 1 
                  ffmpeg-6.1.2 | 1 
                gnu-efi-3.0.18 | 1 
                   host-go-src | 1 
               libglib2-2.76.1 | 1 
             libgpg-error-1.50 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/5081f82f400d4d389dfef98a3042cc84d93652cd |     
   x86_64    |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.org/results/738a447d9667796b2609b73a44f8a97c86fcbec0 |     
 powerpc64   |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.org/results/03e122006defd5be8854c90887b8ff09776d08ec | ORPH
  sparc64    |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/f629b5c333ead6702231daa0cf4fd182694d5064 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.org/results/47699e9e577b3505ba7dd1bfc40c09de341061d5 |     
powerpc64le  |          host-go-src           | NOK | http://autobuild.buildroot.org/results/51ea29d661adcb7e1d3934bb8769d5852b8421bd |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.org/results/5a14fad8ab598b2179c2b41d0b4d095e721814c1 |     
  riscv64    |       libgpg-error-1.50        | NOK | http://autobuild.buildroot.org/results/59a3aadfcdced5d468bba1fe9017aeaed9ab5467 | ORPH
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.org/results/a0d43e938aee44ab7902d312437a4ef4b6fddb4a |     


Gitlab CI results for 2024-08-26
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/7662352757  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/7662352758  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/7662352374  | ORPH 
                  TestMtd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7662352378  | ORPH 
     TestPythonPy3Fastapi | https://gitlab.com/buildroot.org/buildroot/-/jobs/7662352481  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/7662352524  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/7662352147  | ORPH 
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/7662352573  | ORPH 



-- 
http://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
