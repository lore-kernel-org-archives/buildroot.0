Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D56C3ABC3
	for <buildroot@archiver.kernel.org>; Sun, 11 May 2025 03:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EE4460A56;
	Sun, 11 May 2025 03:10:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T0L9tbBkyMuP; Sun, 11 May 2025 03:10:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4EC560A63
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4EC560A63;
	Sun, 11 May 2025 03:10:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C4661C9
 for <buildroot@buildroot.org>; Sun, 11 May 2025 03:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62155404F6
 for <buildroot@buildroot.org>; Sun, 11 May 2025 03:10:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R5oxd2QF3SZz for <buildroot@buildroot.org>;
 Sun, 11 May 2025 03:10:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C9645404C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9645404C1
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C9645404C1
 for <buildroot@buildroot.org>; Sun, 11 May 2025 03:10:16 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-441d1ed82faso22962625e9.0
 for <buildroot@buildroot.org>; Sat, 10 May 2025 20:10:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746933014; x=1747537814;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DDsyEQVIF6Dc3AvE9miOUVe+8OSLtLo3PlqSbvvLMm4=;
 b=hAtOLAsebc9FXfOwc4EaT9egTW+ZXj/55JrTIYftPq3aG3/glEHJ8kdx+KFPX28azJ
 SbfXbSPjza2bYxpFUqlfXclbdBBuYqzGSqxh7XAVnwWbZVigGYiL9yyG72vOVzQAruEe
 /bRSvxvQyK9B/p0pvrKm/1ZEhizF3tYFO2DovK6xk7miu/vYrMKpmae5wKvY1GvavXDm
 n+VLOv8eE8OovINEDJxBfXntd89KKnjOQsOeZFGH2Hx93wVBbeUxK0c07wUIVUAjzrcU
 9xLfcKpS8v/S79CstE601Pw/sDyckSbJrGLAaK27Rcge+TUnwWZmzFibUTHbULiCRv8Z
 wDIQ==
X-Gm-Message-State: AOJu0Yw6VlOXLFEtUaphC3cAZT7KvoXiZowLN712BlbXZssEWMi0eHon
 bRbJSMOG0gBPGjXwGPi8VqHcHINWEkXNmYlXbEYlvrT5X51mRh3ci2oVOA==
X-Gm-Gg: ASbGnctIQpiCpoKlAIgkOlK+Tr6cagaFPgqgn82pfXDsxZjKqTv73QhcgRpxqs0El1g
 tNk9r6EwP92ouE87BnPrXuFF1FeJnhZGypfEAcwMfoViN+zCL2QyhKhfJQEwB++lNKC/v9kBYhu
 ZSMwRevkfTebckOPOF9TqaQHlYIL/9VsH58aPwItDlduP8tHFA4Wf0z2ghm6EAgzUOo/mEVZDjy
 Btw/Gkc5om9x9XiL1cG8aAa2tfzW6zPLsY91NOq4hNttSf2KO8v14B4l+BPzHCnUWkMIUShtyTX
 65XaGiGpPoxfgQSJxOZO27IM/dp+aX3BWzJdORyChJAt97bDYi1Dcn28zpYL9yGIQg==
X-Google-Smtp-Source: AGHT+IFI50oh8/70YV8jTW0ogkcQr6B0s5ADhzEKO+hPMX10u4KiXljTfT1fIXciIQNpULF6VCOFcg==
X-Received: by 2002:a05:6000:2212:b0:3a2:21c:20af with SMTP id
 ffacd0b85a97d-3a2021c21d1mr2336561f8f.7.1746933014262; 
 Sat, 10 May 2025 20:10:14 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f5a4cc44sm7847022f8f.85.2025.05.10.20.10.14
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 May 2025 20:10:14 -0700 (PDT)
Message-ID: <68201516.5d0a0220.3af0c5.4a61@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 11 May 2025 03:10:14 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746933014; x=1747537814; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=DDsyEQVIF6Dc3AvE9miOUVe+8OSLtLo3PlqSbvvLMm4=;
 b=NSxGiwWoW9gwsHH28f1uo1ejWw2skZR4fqJlMvP2DSaEqaNMz0r2wfdtReO6DuEfRh
 7DuM1OgBp4mL21su/WesoLUhclJeg7r9qdc+OTtwyyxorwCD30K8+Zzbo0VVCoqJIsTr
 oPw+M3cHl2w5TSzFB9W0NwOiiZ589p7u9WOQACRFfz1+8bXBUT5XMARdErXh3KZ9ezyE
 ufkvjLkdYNCbyqlViRwNZYfRDF2uM6lcnZiaWuZkntrj+Oelr3YkeTIQBxFYV8IX5+in
 jss+RQxwqqYIaMxg8SPh5C12wluf57M/gsH2MZVPaOzgl5kmUE4rbRmPknEt0Z4JmAqP
 TWLQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NSxGiwWo
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-05-10
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

Autobuild statistics for 2025-05-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  6  |  0  |  8  |
    master   | 13  | 86  |  0  | 99  |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.82.0 | 5 
host-go-bootstrap-stage1-1.... | 4 
              host-rust-1.82.0 | 4 
                openvpn-2.6.14 | 4 
           at-spi2-core-2.50.0 | 2 
             bmap-writer-1.0.2 | 2 
                   bullet-3.25 | 2 
                   cvs-1.12.13 | 2 
             dahdi-linux-3.3.0 | 2 
           dmraid-1.0.0.rc16-3 | 2 
              fftw-quad-3.3.10 | 2 
          host-dbus-glib-0.112 | 2 
                 host-gdb-14.2 | 2 
                  jack2-1.9.22 | 2 
     libphidget-2.1.9.20190409 | 2 
           libzenoh-pico-1.2.1 | 2 
              luabitop-1.0.2-1 | 2 
           oath-toolkit-2.6.12 | 2 
                 pixman-0.44.2 | 2 
                       unknown | 2 
                  cmake-3.31.5 | 1 
                elfutils-0.192 | 1 
                     fd-10.2.0 | 1 
                  ffmpeg-6.1.2 | 1 
                    flex-2.6.4 | 1 
fs/axfs/axfs.mk:32: /home/a... | 1 
glibc-2.41-5-gcb7f206537240... | 1 
               graphene-1.10.8 | 1 
               harfbuzz-11.2.0 | 1 
          host-binutils-2.43.1 | 1 
host-binutils-arc-2023.09-r... | 1 
        host-f2fs-tools-1.16.0 | 1 
  host-gdb-arc-2023.09-release | 1 
           host-libtirpc-1.3.6 | 1 
                   libcap-2.76 | 1 
                  libdex-0.8.1 | 1 
           libfreeimage-3.18.0 | 1 
             libopenmpt-0.7.13 | 1 
             libqrencode-4.1.1 | 1 
                libressl-3.9.2 | 1 
                  libsepol-3.7 | 1 
                 libv4l-1.28.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  linux-6.13.8 | 1 
               mariadb-10.11.6 | 1 
                 netsnmp-5.9.4 | 1 
                  ntp-4.2.8p18 | 1 
                 openssh-9.9p2 | 1 
package/gstreamer1/gstreame... | 1 
      passt-2025_02_17.a1e48a0 | 1 
                   perl-5.40.2 | 1 
                    polkit-125 | 1 
               procps-ng-4.0.5 | 1 
          sane-airscan-0.99.33 | 1 
                    sdl-1.2.15 | 1 
              skalibs-2.14.2.0 | 1 
               valgrind-3.24.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/d9049b09877e98d2bebc1b90e87b450f7d3cb15b |     
  aarch64    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/167072e3ec9f2ad22abb44e75bd08af3afe0f749 |     
  aarch64    |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/78a35a52ca40d409b0640b24e2d41120d85a5ad3 |     
  mips64el   |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/c4cab738ebf911f9f3e9a2e551d28e4f9ed17756 |     
microblazeel |          bullet-3.25           | NOK | https://autobuild.buildroot.org/results/1edfddda7cd70b57c8d6f4c8b95dfb1e1a3da10c |     
    arc      |          bullet-3.25           | NOK | https://autobuild.buildroot.org/results/df4a27f51cd7fd374df09374f337fcd5f4e4bd87 |     
   mips64    |          cmake-3.31.5          | NOK | https://autobuild.buildroot.org/results/310b36f07fbd20ca322c8e30d6fcd9b9a600213d |     
powerpc64le  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/e45604b631545184cc29b62c6212e17e8fc7c981 | ORPH
    arc      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/a02a3c0bb983379e238c6c4060fde0a3b5a46835 | ORPH
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/787a3098bc84015ec728e6607315bca9c06ed7ea | ORPH
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/1456cf22b85e8fd41a282792281b4e368da4cc3b | ORPH
 microblaze  |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/2e94de4c93f4c70c8f26bb7ea60505e55113f7eb | ORPH
 aarch64_be  |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/6f2386be4713d743e74208b8c6e65a6dd84c8f43 | ORPH
    arm      |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/b36b74b3c3c648b941407d9c85b3388af0f478db | ORPH
   x86_64    |           fd-10.2.0            | NOK | https://autobuild.buildroot.org/results/c38c1185561055b4efe7c940cd03d524915341b8 |     
    i686     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/3443f856218b1926cd8b8fa521febb4657d62163 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/c27eacbc6e18f9f9330cd973bdb1164b1151f024 | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/c907f4d3841b3f0dfabb2c0a2f25538aeb6a2c04 | ORPH
microblazeel |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/6b134b9033c91cd0e505a1e686c31a66e8c066d7 | ORPH
   mipsel    | fs/axfs/axfs.mk:32: /home/a... | NOK | https://autobuild.buildroot.org/results/0a0245f027e6cad068009e0754307635fb3934f9 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/0b9870afa810eb209622626109d51248c926d2d7 |     
   sh4eb     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/f922f1c26ce9fa6dd5e09fdfe1fa466d4eacb36f | ORPH
   x86_64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/267d2db5f304c66b871be9e9450fcb4e8a7849f9 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/ba7375017ca96ebba3630899c251dcc31a532dbe | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/8b12962e2486d781ded05d25b6c78042983e2f3b | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/f8421b01de686628a61ec7a4cb70405f414216e7 | ORPH
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/4d049b7ff6db6ef0d5c20906497b8e0d17bb9742 |     
    or1k     |        harfbuzz-11.2.0         | NOK | https://autobuild.buildroot.org/results/d343f3f1887192f51c2eb6268c952e1af3100e00 |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c60e2405859a2203f7c968b39c859fdf56fbd70f |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/78b4e1da8d89a577c428b73ab7e40b03f413fd6d |     
   sh4aeb    |      host-dbus-glib-0.112      | NOK | https://autobuild.buildroot.org/results/b63765e88bd9fda2d62f3fbab58b0b9f94db161e | ORPH
    or1k     |      host-dbus-glib-0.112      | NOK | https://autobuild.buildroot.org/results/dc9b1d5ab52eb461a0fec99b1a07ae4518464cd9 | ORPH
  riscv64    |     host-f2fs-tools-1.16.0     | NOK | https://autobuild.buildroot.org/results/eb2eff3471dd3d7c04dc34460152906f1e59412d |     
  mips64el   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/f1c6529c16600e0233ebf189df7c1f24d419d436 | ORPH
    m68k     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/82484e19f3f9de62db66ea79d86c4434f526361e | ORPH
    arc      |  host-gdb-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/e2a877ee2780025367e1c89e24f2ca5eb0a03866 | ORPH
   s390x     | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/de7ab795a9801177f625a1e2550041c385bcb8d9 |     
    arm      | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/b5cdfedcdacf302e33e71caeca236c5e83226109 |     
   s390x     | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/35889549d541bcce7973479b6c76eb43dc940d28 |     
    arm      | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/2b842b8de4c91ac98a75bb463b9ea8785d6e9bcf |     
  aarch64    |      host-libtirpc-1.3.6       | NOK | https://autobuild.buildroot.org/results/2bb67f3004f4170803dc6e2454feccf80f43bb56 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/0ecd27380c956ed32a67e035646070cb2990aaf0 |     
   s390x     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/0150ce0ad86e432e7799a4d4f842984a81345543 |     
  aarch64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/9ae28b0029be71565e65cd3e6dca34a0ffe75b2a |     
  aarch64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/1f60a247838e717a69805d8e8ba0e47e0fc95702 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/6ea8b3a39706d92980b0c5d61e4a3313f7d753f2 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/56c1bfaf87f7cba6f22fe4d5363fcd26149118fc |     
   xtensa    |          libcap-2.76           | NOK | https://autobuild.buildroot.org/results/a3e6061cccb7b76a709d2e137de2eddbb8559f5f |     
    mips     |          libdex-0.8.1          | NOK | https://autobuild.buildroot.org/results/484b04b4d9bd422a14c6f45230c904f8ed277f64 |     
powerpc64le  |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/1317c7784314874f47eea10cdd5a9eb2c128f6bd |     
 powerpc64   |       libopenmpt-0.7.13        | NOK | https://autobuild.buildroot.org/results/3a8c0caf63e3117a4d7dcf8aae4e4e892f918117 |     
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/e3c9425e7af52f34fb6836613d13d59855fbd014 |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/19ed189b4a5e4098624cd400d35d41e119c5c446 |     
    sh4      |       libqrencode-4.1.1        | NOK | https://autobuild.buildroot.org/results/23ca5c814b1ceb7398ed39235efbbaac0132a06f |     
   armeb     |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/0d545b7f4739f52f963d6cb30aae9f5be33feb2d | ORPH
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/82c86e056760fd96ccd98536fe01b7dc65aab444 |     
    arm      |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/9cb9fe9cd9e9aedc1f048e11e6e3e3b1a75312db |     
    arc      |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/721d74fd841236534ce6defd0ae1b5afc6d8825d |     
    arm      |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/1cd1630bc929524a38982c3f7eba3d435c45ecee |     
    i586     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/02f5500b26fc7b7dadb0b1570811626c3229c17b | ORPH
 powerpc64   |          linux-6.13.8          | NOK | https://autobuild.buildroot.org/results/52d4949d7ec6de0e2d05d2cf882341d52316c7bf | ORPH
   s390x     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/b50659c6c1baf53eed922bf3a6d70d14f080e18f |     
    arm      |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/6391710dd6f8635ef3921584352d4cf5d2a2813b |     
   sparc     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/08cf77d7ac1df73ecca5ee00cd2289316b895b05 | ORPH
   mips64    |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/028dc2b464b6fa26a8f07e5d29e84c8eff10ba99 | ORPH
microblazeel |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/86117b379201849065ca6e433e487b90523a0650 |     
powerpc64le  |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/b0c66dc288a9009b75b51110a9928f25ed4625fa |     
   mipsel    |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/04bce1709f5df143e1efa6986627635212a92d35 |     
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/ad75f36827799d01169c5cba25f18622f691fb77 | ORPH
microblazeel |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/ac60d29fbcd9fb8ddb21b76b3b185e45e580c006 |     
   sh4aeb    |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/92126a74df725f7fff3e68b18a37c2968f439abb |     
    sh4      |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/a75428c4b342c3d65ce611a528197f44039ea608 |     
 powerpc64   |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/2006b8319d6a54a55e775dc254d82dea08c73b24 |     
    or1k     | package/gstreamer1/gstreame... | NOK | https://autobuild.buildroot.org/results/211b3a65ae105f7f29be00f4a0bf6c800ae526f2 |     
 microblaze  |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/5bf1632c9cadc3ec932d8280d990a02d80ba73de | ORPH
   armeb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/9c94a4c93b473d3aaf4dcfe57a10760e3d2e2c34 |     
  riscv64    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/f5d87e9a08bc48c4aee3e4bd02c209975a11aa11 | ORPH
  riscv32    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/f504cad75a1eff95b32020f8e1fbc64aaf7c6c64 | ORPH
  powerpc    |           polkit-125           | NOK | https://autobuild.buildroot.org/results/f107c9ddc036add7fc2329bdf91830bf4c5302fd |     
   mipsel    |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/aedb4356ff2eb3ce8629e36c7505654f22502042 | ORPH
 microblaze  |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/ea07a11c07e87657be90a52ce95a30d14e7b161d |     
    or1k     |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/39c6c8c237f54d11aa7ac722db48463fa7be3d53 | ORPH
    arm      |        skalibs-2.14.2.0        | NOK | https://autobuild.buildroot.org/results/3c992b73c5a2f31122bdffe8a81f1bceab65710c |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/c810b61a700d1bf208cf7fa4ec015db19c93c8f1 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/bceed8395a1c5d2e620bd7c5009faa013b403e35 |     
  powerpc    |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/64242494e35095ac08b911f993029665f109264a | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                host-m4-1.4.19 | 2 
glibc-2.41-5-gcb7f206537240... | 1 
               host-ola-0.10.9 | 1 
                 openssh-9.9p2 | 1 
                pipewire-1.2.7 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/95228f12cbdbbfd9d3496c44bba2ccc65a4865f7 |     
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7c843113a08606ea138273f46aac06fa582875ff | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/28b1a55dcf9b170d91ba063454af11cd4a9c911a | ORPH
    mips     |        host-ola-0.10.9         | NOK | https://autobuild.buildroot.org/results/3c4942492dd439cc414814dfd0655d35136d8ae3 |     
   mips64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/7d8cd8372a30933ef5f134473785619837ecdd3a | ORPH
   arceb     |         pipewire-1.2.7         | NOK | https://autobuild.buildroot.org/results/f9b68d5059155a490acd07d190d7b3df5a613f76 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
