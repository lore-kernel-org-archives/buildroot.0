Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A40C0219E
	for <buildroot@archiver.kernel.org>; Tue, 11 Feb 2025 04:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7BA460D68;
	Tue, 11 Feb 2025 04:14:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mXZJzKzl2i8h; Tue, 11 Feb 2025 04:14:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D117060E05
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D117060E05;
	Tue, 11 Feb 2025 04:14:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 53BC96C
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 04:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3704160E08
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 04:14:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id frcdqhRHUzev for <buildroot@buildroot.org>;
 Tue, 11 Feb 2025 04:14:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2853E60D68
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2853E60D68
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2853E60D68
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 04:14:24 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-54505c79649so2346254e87.3
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 20:14:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739247262; x=1739852062;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=brYnnz26+fcereNTmTf9cvoq+EZInUcWrS1UsUsYXHA=;
 b=hoG6OUuyQiqA5H7Jq5wjqiE888ap9TGUbJ9juqAEYPklxIE+vDLg9ihJ7cU43bl/3Q
 smV5x7O/zJ3AbBlle763PIgmMYq1VkE6nM8qDevGXcacuyGMbKMnrShkJI+F3ViWHWHL
 dZ1UY+tSDcWKIuMp6/cyaGiDomNN2mjhq3QGAAj/GVuuhSgeITOGntbeg3JOZDDRZ+wZ
 ghyuCucceqTlIuSMDhThcs4POB7vYseKWFam7j6g/EJIrS9h8lSJP/r8FuHON/Oqmtbf
 5z3Cb7b6/EadrBtXvg/foBFT5g9tRu3Co5ij3+zxdc1Q8mDAt7AKh9XiahMu6w9NhjAw
 VdWA==
X-Gm-Message-State: AOJu0YxABbeWYoTlL7pwRzZAa9010Uit+be7yleUxLWfJwaNle/GlnlP
 aEjTIidUVOwUSuPuPLZ5CPqQoLOWs0zmmBSGPsg1B0gBQ7D2eAPB7XAKsw==
X-Gm-Gg: ASbGncs2ulIZFVl/fwrk2hy/abTjXemDpmx9gAGmIqV/XsZ9yixRv+Ax14M0IvfngsL
 RnQlnx2i2hBt0FTIm0YSK5Gap0+M3ngx1i00/aOJfG48JRTJ/3FpuzY7w1kxzLQDXiLGaLVRYHt
 eWkw1e/cDMkY3B7t/yTewtgvMsJt9innjvNVuuTKvvBGFSrPm6Lk9lEvz0IaYdIQu/E8tRBjxHA
 140EvbzshNpYqEpo9hrvVy64kpDK9/g97DnLnTRt7nZzVdeGtI9e1EGwOW8vR5YWU0fG/44X1lX
 WmR4Q789qIY7Aj0cwX0=
X-Google-Smtp-Source: AGHT+IEgWg1EUxLnyLHGStYICbrCXyoOu7XB0NAKRfDe701LRlg39/TQ5Vm4rlFkYkS2+q/B8OrUPA==
X-Received: by 2002:a17:907:3fa4:b0:ab7:db5c:8abe with SMTP id
 a640c23a62f3a-ab7db5c8f56mr150091166b.57.1739247250340; 
 Mon, 10 Feb 2025 20:14:10 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7b5d8d4a0sm434563766b.159.2025.02.10.20.14.09
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 20:14:10 -0800 (PST)
Message-ID: <67aace92.170a0220.17b7b.ae2e@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 11 Feb 2025 04:14:09 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739247262; x=1739852062; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=brYnnz26+fcereNTmTf9cvoq+EZInUcWrS1UsUsYXHA=;
 b=LskMPoD1r3zfGLrlk2yd/b4G6ywhmcjBaGtP2pwITcPwMjB78w1M76bwOouDxic9hR
 Rscm620QmzLBJ6PNc1i2Q5ytQUXwyT55qCy5zGVpfFCrFt3jqt9lHneCe8/TbwA3XHNF
 87IToeb4R+Dfb0CiBpdbSSCXOLke174lEdq+pMCsflCc0dFBLxPHOXV7SGfd27n7yfve
 0bPMzOy7Pgb2q3UccAo9/BLLCcUUuLkzfjDZlOLazUj3pO/xAIh9ETdc4uYYSLshi7T1
 uTmTmC4tXmbBJOySvvgM4g8A0M5J5S1kvXmGIHZF4azJC4L3YLeE9b3+hzLTyZqEaUvn
 RHlQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LskMPoD1
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-02-10
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

Autobuild statistics for 2025-02-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  2  |  4  |  0  |  6  |
  2024.11.x  |  3  |  4  |  0  |  7  |
    master   | 19  | 225 |  0  | 244 |

Classification of failures by reason for master
-----------------------------------------------

                elfutils-0.192 | 20
  gobject-introspection-1.82.0 | 10
                   host-go-bin | 9 
               pulseaudio-17.0 | 8 
             fontconfig-2.16.0 | 7 
           at-spi2-core-2.50.0 | 6 
                  bcusdk-0.0.5 | 6 
    host-python-greenlet-3.1.1 | 6 
                 libcdio-2.2.0 | 6 
                   perl-5.40.1 | 5 
     linux-5.10.162-cip24-rt10 | 4 
                   linux-tools | 4 
                  ntp-4.2.8p18 | 4 
                       unknown | 4 
     bandwidthd-2.0.1-auto-r11 | 3 
                  ffmpeg-6.1.2 | 3 
                  libsepol-3.7 | 3 
          linux-5.10.162-cip24 | 3 
               mariadb-10.11.6 | 3 
             matchbox-lib-1.12 | 3 
                    mpir-3.0.0 | 3 
             util-linux-2.40.2 | 3 
                    bat-0.24.0 | 2 
                  boost-1.83.0 | 2 
                 c-ares-1.34.2 | 2 
             cni-plugins-1.3.0 | 2 
                 coreutils-9.5 | 2 
                     daq-2.0.7 | 2 
                   duma-2.5.21 | 2 
                   fwupd-2.0.4 | 2 
                      gdb-15.1 | 2 
glibc-2.41-5-gcb7f206537240... | 2 
                 hddtemp-0.4.3 | 2 
host-heimdal-f4faaeaba371ff... | 2 
    host-mender-artifact-4.0.0 | 2 
                libdrm-2.4.124 | 2 
                  libnss-3.107 | 2 
                  liburing-2.6 | 2 
                 linux-6.12.12 | 2 
             lirc-tools-0.10.2 | 2 
        ltp-testsuite-20250130 | 2 
              luabitop-1.0.2-1 | 2 
                  nginx-1.26.2 | 2 
               openblas-0.3.29 | 2 
                    php-8.3.16 | 2 
                pipewire-1.2.7 | 2 
                  rt-tests-2.8 | 2 
rtl8189fs-94cc959d56c1425fb... | 2 
              atkmm2_28-2.28.3 | 1 
                   bird-2.15.1 | 1 
                  bitcoin-28.0 | 1 
             bluez5_utils-5.79 | 1 
             bmap-writer-1.0.2 | 1 
                   botan-3.5.0 | 1 
                    brltty-6.6 | 1 
                   bullet-3.25 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
              containerd-2.0.2 | 1 
           crucible-2023.11.02 | 1 
                   crun-1.18.2 | 1 
                cryptopp-8.9.0 | 1 
                   cvs-1.12.13 | 1 
               ebtables-2.0.11 | 1 
              fftw-quad-3.3.10 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
                 gerbera-2.4.1 | 1 
            gettext-gnu-0.22.4 | 1 
             host-clang-15.0.3 | 1 
           host-cryptopp-8.9.0 | 1 
          host-dbus-glib-0.112 | 1 
              host-llvm-15.0.3 | 1 
     host-moby-buildkit-0.11.6 | 1 
 host-softether-4.30-9700-beta | 1 
httping-0e26c53d5fe504eb720... | 1 
                  hwloc-2.11.2 | 1 
            igd2-for-linux-2.2 | 1 
                    ipset-7.16 | 1 
                  jack2-1.9.22 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
                   libmd-1.1.0 | 1 
                 libusb-1.0.27 | 1 
                 libv4l-1.28.1 | 1 
                  libva-2.22.0 | 1 
           libzenoh-pico-1.1.0 | 1 
            live555-2021.05.03 | 1 
              mosquitto-2.0.20 | 1 
            netstat-nat-1.4.10 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
                 openssh-9.9p1 | 1 
               postgresql-17.2 | 1 
               procps-ng-4.0.5 | 1 
                  procs-0.14.9 | 1 
         python-remi-2022.7.27 | 1 
                 rtptools-1.22 | 1 
              sdl2_mixer-2.6.3 | 1 
                sysklogd-2.7.0 | 1 
               valgrind-3.23.0 | 1 
                 wolfssl-5.7.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/21bd057948510c94807d958e655abb1419a22c87 |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/84a0f5d37fab57d9242e1b09379d6277dc51a8b5 |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/1d0071ad5368ddea1bde70465a3121c97038bea5 |     
   arceb     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/2efc97e490638c7a948114a3b635da14791f8f94 |     
    i686     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/0d8101e74fc3cf3705aa3c2189affd8cc3288366 |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/4da5367752b74486da96c5feb0b77a97860ea3dd |     
  powerpc    |        atkmm2_28-2.28.3        | NOK | https://autobuild.buildroot.org/results/428c7cfdabe2c1c2cac143611ecbed7fa39a3066 |     
    or1k     |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/97512be8624ac11fd6277c3fbcc3908aa6cc1a49 |     
   sparc     |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/3c5045ddb801b60eed48114fce3804f1c42b661c |     
 microblaze  |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/6f2e7491a27a282aa22e7ce0bb2a559b65796b87 |     
   s390x     |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/891601cfb4a2e74d98a84b75c65196b010d13c1c |     
  powerpc    |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/15d90e86f3891516c9553c423eac6b0b76d70fd3 |     
   s390x     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/164fdb4aaabffa6cd51af490d75824480a4a4a35 |     
   xtensa    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/d669fc13aea64e07357b4f194871d39fe889056e |     
   sparc     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/9388fc7651fcf826934c9f1155f71f53fa401927 |     
  sparc64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/18600e64676c9cbaf57cdbfebf7046f2eb637545 |     
   s390x     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/209a690432d0be40c2fe96fee322a1563cd4a9a4 |     
    arc      |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/1f0848226ba62d7d0a5abbbacb8527119bf564cb |     
    mips     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/508d1db32c6f074426f63398a43e694572898835 |     
  powerpc    |          bitcoin-28.0          | NOK | https://autobuild.buildroot.org/results/cc2a1e65202ec711a886c084ec8bebd4e172c151 |     
  sparc64    |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/552f06030a3b838a1653d7b1d559fbf33c425db7 |     
  powerpc    |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/6535e48434cc34e8c86a3da0852169509743060b |     
 microblaze  |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/afad6e864a15dd46e042bcd9d51e3af634e99c39 |     
  riscv64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/5a94a7dd47c1c3a96f5de3bc1c97752c3a3f1439 |     
   mipsel    |          botan-3.5.0           | NOK | https://autobuild.buildroot.org/results/552da525c0c936f1b68471afbf0e31ac9aa9a7e5 | ORPH
  powerpc    |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/0c91d9b4804645f4a31a25760a24efa9c9be052f |     
 microblaze  |          bullet-3.25           | NOK | https://autobuild.buildroot.org/results/89b728fd8318bbf0599960c39d48151a450f5268 |     
   mipsel    |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/b6372cc6cb25b0164126ce7aa1e82daa5f423f8d | ORPH
   xtensa    |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/feca32e9413b4eba529e5208cf63699faf654f36 | ORPH
   s390x     | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/f067ee3cf828be430f956faa1577a0168220a43b | ORPH
   s390x     |       cni-plugins-1.3.0        | NOK | https://autobuild.buildroot.org/results/784700d06da1723755e5e47febc396ef3396a3cf |     
   x86_64    |       cni-plugins-1.3.0        | NOK | https://autobuild.buildroot.org/results/eead7305a83a24df4f2dfa9597be87b317d93b58 |     
  aarch64    |        containerd-2.0.2        | NOK | https://autobuild.buildroot.org/results/a59bc999e9620ff6b9d97138a2de898aadc07529 |     
 aarch64_be  |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/1f763b29654db329c2c267a143e9546cc6f5c503 | ORPH
    i586     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/adeeb5412e9857ea151a7f53dc66ebdece578902 | ORPH
   s390x     |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/aabf683c90f89a3f3ad40ebbf2a6fb5cfd98ce4b |     
   sparc     |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/3a18c6ff24779ba62d6800a3b7163631878aa7d4 |     
   armeb     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/b35dd8d6bf6fb09036594976870c351e1ba55d2f |     
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/aa6c4d22edd21167157979f353005c4bc75dda3a | ORPH
  sparc64    |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/e5f31b27f6ee5057ed14b28fa5ddeca3b35a5067 |     
   s390x     |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/79a4c8045abf81d58f7ae445a4206b2afb9e9791 |     
powerpc64le  |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/2996d706bdfb70e661496f754d9cfc16e9a20d1f | ORPH
  sparc64    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/773ddc7acf225a7581b547bd77c8def343489599 | ORPH
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/ed5c2e725c70c6bb7354f0d416783eb51b199c75 |     
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/1a5583e492775f1d9692c756b2dbad8960341c05 | ORPH
    i686     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/900cd44c17cf71726c1dddd25ddcde3945cbc6b2 | ORPH
    or1k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/915f4b07bf5c4d6c854e07f4f79155e019d9a4f1 | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/d74f037077fc678e71c22aa39d9611da4b44f0f7 | ORPH
    arm      |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/ebc9b33cc687e3e73bf28268a75365db1a0df6f1 | ORPH
microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/929a9ff9cd72bcea5aced672a9ebbeaa974b1a5f | ORPH
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/db38d1b0f5d2566c87a5e42cfc0a55db678ab7e0 | ORPH
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/2c43b9b851c11492ec8c37fac3b3317f09ee49d1 | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/a1f08c1a1f5ba13db0b5a99c1345ba5328aab021 | ORPH
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/24048c6a7520481d16f58412f2e8ede62e7a834a | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/f8e418ee80f77789c91933c2ddbe0bf7ae9fd0bf | ORPH
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/16751bdb5e844675c602e921be8debd059c9273e | ORPH
 microblaze  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/ae0e921aeaf4c9062d40fb60d1e1cf9f8446100b | ORPH
   armeb     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/d4f64f7b001c55edfed67c152b4e80c33c05495d | ORPH
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/21cb486e04b6799c104b02368d87431447a22894 | ORPH
   armeb     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/bf767f8f8c461f958a929a5d75190ab1e608ab25 | ORPH
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/d02601cabb5220fb2e92bdbc8b53cb8797aa511e | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/47b7f955754b9fafa2749b686f048ed0fe4ce8fc | ORPH
   mips64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/3b4726bfcc9dfc368db9aaf519bb54f2594002cb | ORPH
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/55f1c46a2ec9aaec05a12d5518b4d3d1529cc1f3 | ORPH
   x86_64    |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/f41d17040c5d033bb549740d4d2def78f17a8128 |     
  mips64el   |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/9eb91b94060d1add4a5ba5fc44dab23a4f6b1feb |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/d0f3db6fdd90ce9c93d5edd02389a07519a1db04 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/370540c7ab0e9bc3aa9b0235b18488d959da2140 | ORPH
   xtensa    |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/3b73badc7ba8479416eea21875b1aa5c49d3079f | ORPH
   xtensa    |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/f61c73ed24a6f3345fbfdcc7e9407dc062a24c35 | ORPH
  mips64el   |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/0e0af93e23fba5288e023bc8b54dcf219914242e | ORPH
   xtensa    |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/bb98131395b4efdac78d163c174975f92a851840 | ORPH
   mips64    |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/2159981fc81dad7d62f94690d645f96abcbf28d5 | ORPH
   xtensa    |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/38333d28e776b555a2a3c981abf27a4b854195db | ORPH
 aarch64_be  |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/e4258725a51bf01f35323b42dffb6877c5d7048b | ORPH
 powerpc64   | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/4642e872e1b6df416a4a7e51f8dca8463f204741 |     
    sh4      |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/4f6e27024f0196756a379fb882d51bea65104a70 |     
    arm      |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/795637078269a64a37917336d4c9dc0e858e394c |     
   s390x     |            gdb-15.1            | NOK | https://autobuild.buildroot.org/results/96d1eb9bc4ceddff323e4c452eb1a3244317a9a7 | ORPH
   sparc     |            gdb-15.1            | NOK | https://autobuild.buildroot.org/results/8eb39ac95ce272b4f5a44eec163c4d55f057b4ac | ORPH
 microblaze  |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/6aa23119e3f92a2f0bcd8340a022d469630332e1 |     
  mips64el   |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/f88c4e6ca4b6906bb5d2a94780385e6061bf0a85 | ORPH
    arc      | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/af6d9af328991dd0404d0a69ecaf85bc3a968ee3 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/3636df1c1a6fe84a7a997ac5a7641c42c1b3ac67 |     
  powerpc    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/46a36545fe0c1c4c5ffba8925efc13868c3c4b6a | ORPH
   sh4aeb    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/8428440fe8f8bdc9b171e51524a2238b73aab401 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/1e6b344757ca9f7ca76d4834d2ea163363ae7228 | ORPH
  aarch64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/bbb79b0abb75a4a13bcc3a7601ded39289bee95c | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/1a051922a90650e939e3c4b69a8e66e6510b1223 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/26f77534d48bf9688b646f80ead95b003f68e06c | ORPH
  powerpc    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/4b48d762bdebaa1229daf00307039db9d486e091 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/738f068053f8506a3180f5bf1eea586e0c225a53 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/8a485c7169ba2bf73d0693aadeaa2d51d2ef0787 | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/f20d604aba2b7fbcfcff419f47b77e3ca249a179 | ORPH
  aarch64    |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/d56d478e09348c956e2695320a4c0208c8c8a256 |     
   sparc     |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/af4930ee0270446bf0045bcf5d946900bf608bdd |     
   armeb     |       host-clang-15.0.3        | NOK | https://autobuild.buildroot.org/results/f6fe670baf44bf30d08284403b8a08bd3d1ac66c |     
    arm      |      host-cryptopp-8.9.0       | NOK | https://autobuild.buildroot.org/results/660e75d917e740259db338d1c692ad0afcc32220 |     
   arceb     |      host-dbus-glib-0.112      | NOK | https://autobuild.buildroot.org/results/ea19054fba80371c33a4f79ac2930866e71ef48c | ORPH
   armeb     |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/60ebc6f7716e8289b0c65a0847c92ce264eae812 |     
 aarch64_be  |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/9984a7ef842d47779b4a80c77d3877b61b78f07c |     
  sparc64    |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/0b9a6a7ddf30a2826ade7cce7d9a26dc39a2fb88 |     
  sparc64    |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/d9f8bfb83fe3da29c4ea381a0ee1467acc31a8da |     
   mips64    |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/3e1a1107eea974706362bc5d3cbb9bae6c50285f |     
    mips     |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/7df1066e6b27be5fbe905bc1fda1f5ef4ecd78fc |     
    mips     |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/3ef831d646a85764f10456e1296276c8754c10c7 |     
  sparc64    |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/4af7832ebb2dbfcffa5bd8b95731f54d791158a5 |     
    m68k     |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/740c8e2528c76a7c0750b76cbbf9f3ee0e058618 |     
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/ac2ebefe49765a5c1134951dc0cefe4bdd4c3116 | ORPH
microblazeel | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/ab535424ef51ec1164abbd8518681ced3f5aeebb | ORPH
   armeb     |        host-llvm-15.0.3        | NOK | https://autobuild.buildroot.org/results/433703460d9b0485cd16027d55b0872a101ea31e |     
  mips64el   |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/ca763ab487c0a48501621275a13cf9818bf06cbc |     
   mips64    |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/0c9d9a814188a5a17847ea0202c3ad4f4d08a386 |     
  sparc64    |   host-moby-buildkit-0.11.6    | NOK | https://autobuild.buildroot.org/results/d3784e85b950676fe1a812b85d7932945fae2dc1 |     
   mips64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/0b4437cf317561adb70cce1f2b4d5338fd8fcd61 |     
   arceb     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/adddb16a63d7cb1e78de7c91384519b22f550dc7 |     
   s390x     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/e9d26c77b2a5ef0c6a1ef4a9a26389bf780143a3 |     
microblazeel |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/0e1a7c0d99b43be824fa5f1fc714f72e7ec59fa9 |     
   mips64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/83c029f432bb4ea383ed66b163afa6e88faf8bdf |     
  riscv32    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/e812138ec88a1123199284a5c9ac2308a5460f96 |     
    m68k     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/4f0178b17084c3480e39abe178ed36488a2747f1 | ORPH
   mips64    | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/5e9196f901e335cdf947c1f07c9f74752957b2c6 |     
   x86_64    |          hwloc-2.11.2          | NOK | https://autobuild.buildroot.org/results/596f6621cc27822f82ef16017693161b06dce114 |     
   mipsel    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/d805b1e81b67095efb3e74852ca81442513c8e9e |     
   mipsel    |           ipset-7.16           | NOK | https://autobuild.buildroot.org/results/0a05138b5ec927f60079fe86972551184c738c00 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/48923dacdba82d3bef39fc5a2d600a8720c6240a |     
   x86_64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/24db14e60fd3a258802e9b4296af47dec6efd960 |     
  sparc64    |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/939a07cb312a76ffd2e653bd843f427c2b67ebd3 |     
 powerpc64   |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/7ee4897249467ee416bbdfb462f5f3eec792cf73 |     
 microblaze  |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/4cd157f3ba00a75e81db604c66cf1d97588d7217 |     
   armeb     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/2cbf6c770a1e4749612a6c79bb2c1952054bb77b |     
  powerpc    |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/283962768144c8e6bf2ac23793b45bbeccd2a4d0 |     
    arc      |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/24e11b27fc2beafe33c0109389de1af0fc006758 |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/eed7c23990b37ca5a2c4915ea45da26c1780ab10 |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/07adfa49591f62749d6ce2e9f0907d733add8cc7 |     
   mipsel    |          libmd-1.1.0           | NOK | https://autobuild.buildroot.org/results/9f275584b33b037dd05dc30ec50a1de7098d2ee3 |     
    sh4      |          libnss-3.107          | NOK | https://autobuild.buildroot.org/results/563b518f3a9a3b111371a17ae329bf7aa829ce02 |     
   x86_64    |          libnss-3.107          | NOK | https://autobuild.buildroot.org/results/ccc4650a8ac9f55bb66d7b2bb16726697da9b229 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/d4e4db70eb01c40ebe059d0aa6b5aab85bd7364f |     
  riscv64    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/d5a350ddd6768cb540415e7cdc56a1ee630fc39e |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/7166ed64177ba90c57cfce733ab71c13b86f72d9 |     
 powerpc64   |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/a30e32c377dc44c28a67381c055c15afd41ff51f |     
    m68k     |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/2ef4b2998a10a993f208c31876c5bdbb0b6f507b |     
    arc      |         libusb-1.0.27          | NOK | https://autobuild.buildroot.org/results/5aecc194eb89750d230007d1c3d5ef3b52874524 |     
   x86_64    |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/ba0b0fffd46ae3910c983009a61e4176347a34a0 |     
    mips     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/9929e542447d27a1aab6975fd60c820a1574bde4 |     
   mips64    |      libzenoh-pico-1.1.0       | NOK | https://autobuild.buildroot.org/results/40287f298f073a12a0e963860206f0ef94830556 |     
    arm      |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/10df9c846627cb781610102dd8b82ffb698ab607 | ORPH
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/3594241a180e3603146044518f2d03040cf23f2c | ORPH
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/a89673c9d5291fd9d57170593c08d56819c664f0 | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/67c3db5b4a729a3425b9a42ac39f8ece089539e7 | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/acf4254dc34096a621ea1aa95e5a5c93aeebe557 | ORPH
    sh4a     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/ad5f852a9e91e2cdb35f5041e16276f9c6a9725f | ORPH
    mips     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/2c919e1faab4e7b4fbec700e9172d90a24a0459b | ORPH
 powerpc64   |         linux-6.12.12          | NOK | https://autobuild.buildroot.org/results/57cb864ac996d36360769476c50536958ce88897 | ORPH
microblazeel |         linux-6.12.12          | NOK | https://autobuild.buildroot.org/results/5c3a3e67d66e24732e3c9fe1a5e8285cde369587 | ORPH
    or1k     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/2aa3ef15a30341cc3090e91cccabf98225dc4cab | ORPH
powerpc64le  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/97a95d47e58fc0b1295a112cd2634b6f19d6597c | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/50c05694a94a1315000293a1b69dd208b191cc9d | ORPH
   xtensa    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/8a2317c854203fcb926450a723c831e817519216 | ORPH
   mips64    |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/1b7b87f117ccba5b9a0935b6d8bbc05124193b30 | ORPH
 aarch64_be  |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/fd4c4c07fe0e0edfbcf55b98c0ec98ade893c959 | ORPH
 powerpc64   |       live555-2021.05.03       | NOK | https://autobuild.buildroot.org/results/a5b512d2e2592c4645817ff8c7876bc4c71eee4e | ORPH
   arceb     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/23d360b42676affc601f37b9b3084cd9e1c93c25 |     
   xtensa    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/0a1e87fe16fbe53f5f1675462de27ac7b3d900f7 |     
   x86_64    |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/c28baf66338afb19df84e867d2604f533fd73b9a |     
   s390x     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/502c83ee41ae89dd512664079f8745f1426d831e |     
microblazeel |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/2d8f7c7fc2026801ce1a0c85851c41278812326b | ORPH
    i686     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/9b7072cf1e99d7841f515c78c863cfb9a4d4e907 | ORPH
 microblaze  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/cc925d2eee5eec347a71d0581fcae864d4ed6726 | ORPH
    sh4      |       matchbox-lib-1.12        | NOK | https://autobuild.buildroot.org/results/b2f26f24b94f2439a430ad32fe215785a0a38ed3 | ORPH
   mips64    |       matchbox-lib-1.12        | NOK | https://autobuild.buildroot.org/results/cdcff7e5cc1e24c56e0b0c5e23dca8edee9215f7 | ORPH
  mips64el   |       matchbox-lib-1.12        | NOK | https://autobuild.buildroot.org/results/babf1cc6bcc05401a2b545f066b28a9870e65c1f | ORPH
    or1k     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/6cccf35f815b45321f0085c1722b801d4227f622 |     
   sh4eb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/b440fd200e23178b7d8268ce02905990d86aa604 |     
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/f6f0e18ca54854e79bb69e77db5b055a0fcf951f |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/b909d4a69bec5ba61c85172543e8cf899aa57f3f |     
   mips64    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/d5e2161d598d4e600ad88311bd104a16c78406e4 | ORPH
    arc      |          nginx-1.26.2          | NOK | https://autobuild.buildroot.org/results/a0e0a9788e86dec9f38c5a347f8c6dafad96c3f6 | ORPH
   sparc     |          nginx-1.26.2          | NOK | https://autobuild.buildroot.org/results/99b65e505db709a7fa447d494ac8a1abee74993f | ORPH
   xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/3098ae9c6c399ae05b6c1806480aeb6e4f748fbc |     
    or1k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/67fd2c73ce958d97b5bbbc342caf778c6b279996 |     
   arceb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/63956f9013e31eb3cc45960290ad6f7609aef853 |     
  powerpc    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/a4a6c03d82270f7fa03b8f2728aa15e475f228ed |     
    or1k     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/4420cf7846775c94430ce422794c0205e741d991 |     
   mips64    |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/7b0ad75a6d22886e3415abfc0b835ccb0cd1192e |     
  riscv64    |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/d6bc2bf6f02faaa0a2d8dcb6b3fbaad24ce635a4 |     
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/3ec1faf1acfacec0d42f02eb0b717a4520bcbe0a | ORPH
microblazeel |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/d1d768562de9e8fefe2f1c17f213ee039826b0d4 |     
   s390x     |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/47d9a0584ff085a171088dd70650b39c532f13ce |     
    sh4      |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/52a61a29647678b47de9d2e80524bc8e2c025e91 |     
   sparc     |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/66c90207b777a793d2607bbf512ec07188493691 |     
powerpc64le  |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/cb2ff0d7a90a48768dde96d78ba8d9b0d9ed702d |     
    sh4      |           php-8.3.16           | NOK | https://autobuild.buildroot.org/results/d66a97a9b505a796b5819642a6e9f8ffc9b7861c |     
    sh4      |           php-8.3.16           | NOK | https://autobuild.buildroot.org/results/704b355230708b3f7a2acf6b43cf6c800cca4b28 |     
    arc      |         pipewire-1.2.7         | NOK | https://autobuild.buildroot.org/results/c5d38a0662b9d58aab2d4e2a82ef244cb003ab67 |     
   mips64    |         pipewire-1.2.7         | NOK | https://autobuild.buildroot.org/results/d582b7f2809bd000846433a1b6a529f127c323c1 |     
    arc      |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/06e63299e2dab7ee700656a8f39340c6ab208c9a |     
    i686     |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/24d0023b837f956122e0cdfae29c980e9ba709c3 | ORPH
powerpc64le  |          procs-0.14.9          | NOK | https://autobuild.buildroot.org/results/0526b554c6a74891ff1e6f5f3be07c2ec8d6ace4 |     
   armeb     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/1fa05d7d3631f8686efa0c832a8b621d34355756 | ORPH
    m68k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/fb8e946ffe1e768f3751d95bfc73f18fd63c7143 | ORPH
    mips     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/c9981b3bee131df04bdc961f466883a9d94dcf36 | ORPH
microblazeel |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/65fc61c506dd06da99a00d2c84246959b805c54f | ORPH
    sh4      |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/447c66476c9ed2eac9c1793b66cfb055b4b7e48a | ORPH
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/d2dc8f8c6f26d5d7178239392bca88fc893ac591 | ORPH
    mips     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/5845849bb3e75c46c7821b89017ca43ad3e02702 | ORPH
  riscv64    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/ef3032e6de16d7d1d80ff19a6dc1a02ffebd8a3d | ORPH
    m68k     |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/f83c8a5f089f992cd199c87c5f223b3b7f040506 |     
 aarch64_be  |          rt-tests-2.8          | NOK | https://autobuild.buildroot.org/results/df912ffbcc075a4d0b6488cf2f61c65277aafa54 |     
  mips64el   |          rt-tests-2.8          | NOK | https://autobuild.buildroot.org/results/4d8d12618c8bcdca862e963cd16da51a33912280 |     
 powerpc64   | rtl8189fs-94cc959d56c1425fb... | NOK | https://autobuild.buildroot.org/results/49366fa48adcef1f856863f6b05e914ef9fb326d |     
powerpc64le  | rtl8189fs-94cc959d56c1425fb... | NOK | https://autobuild.buildroot.org/results/0300ee51d834fc353b542a10c71d0c4e2e20ad36 |     
   armeb     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/50a7d7eb03c26b061fe61b23a441220709b3ba10 | ORPH
   armeb     |        sdl2_mixer-2.6.3        | NOK | https://autobuild.buildroot.org/results/c51f0e1b60062ba04a44711f36e085526c05fda4 | ORPH
  mips64el   |         sysklogd-2.7.0         | NOK | https://autobuild.buildroot.org/results/9ae71cc5df20de49aec6e9ae5e7cb5e0faf108ac |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/6c199ee35d74a973e73155f7beac6037711737bf |     
  riscv32    |            unknown             | NOK | https://autobuild.buildroot.org/results/97e5020e23c0c82dbc019a5f2b69d1f3b81657c4 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/334c377dbca747ba75240af90828c9975e3a69d4 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/866a85fcb6772f6a24e387a3cb04d0fa2a5fade8 |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/7230d9caff07da6c55501785ca02772054ade862 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/75eb1bb78995d1dd10c4784334685eb861dbe692 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/77ecc927ceb6df5d4bef81cc2b63dcf610e8c3d1 | ORPH
   mips64    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/548051ec27300cea56e2007738777474912e94ca | ORPH
    mips     |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/e1895a860928a4bce9a9c9a0ee26d810c6a6cf9b |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

  gobject-introspection-1.76.1 | 1 
host-heimdal-f4faaeaba371ff... | 1 
                  ntp-4.2.8p18 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/6b76303d4a2d508b3d2d6e8620251288434fdd8d | ORPH
 microblaze  | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/8b1458f881c7b22665c297f02f62b2005f803958 | ORPH
   arceb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/795bfebe5d60f3c23faed7c521c44e0e2a43e153 |     
microblazeel |           zeek-4.1.1           | NOK | https://autobuild.buildroot.org/results/4ace5a7b4740979ac51521740770ff632e13a580 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                   foot-1.16.2 | 1 
                   host-go-bin | 1 
httping-0e26c53d5fe504eb720... | 1 
                       unknown | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/0450a84a1206274b359ad65a3669f023f526eead |     
   sparc     |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/33763441a065ddb07e944e26ad8f1f6d43b68592 |     
   s390x     | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/2f0225aebe54a5145cff0f9f05dae83461218281 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/66e2fb34fe56747476dc4e66290b8e435593c691 |     


Gitlab CI results for 2025-02-10
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9095017478  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9095016067  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9094990789  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9085451660  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9085451573  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9085451484  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9085451389  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9085451385  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9085451384  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9085451383  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9085451267  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9085451263  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9085451155  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9085451133  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9085450961  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9085450858  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9085450780  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
