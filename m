Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3640AC282D1
	for <buildroot@archiver.kernel.org>; Thu,  6 Mar 2025 04:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59AC480EDB;
	Thu,  6 Mar 2025 04:15:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DwV_Qhn_q49p; Thu,  6 Mar 2025 04:15:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50CD180E6F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50CD180E6F;
	Thu,  6 Mar 2025 04:15:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A931E2E
 for <buildroot@buildroot.org>; Thu,  6 Mar 2025 04:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AA6E60B93
 for <buildroot@buildroot.org>; Thu,  6 Mar 2025 04:15:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0m8EwRfZ67eW for <buildroot@buildroot.org>;
 Thu,  6 Mar 2025 04:15:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2CD8D606B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CD8D606B9
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2CD8D606B9
 for <buildroot@buildroot.org>; Thu,  6 Mar 2025 04:15:07 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5e4ebc78da5so300195a12.2
 for <buildroot@buildroot.org>; Wed, 05 Mar 2025 20:15:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741234505; x=1741839305;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gCoMtV3ELlGUyMqA+bSGDP4rnW5ftvdLBcHWMbIVZ34=;
 b=e5WL/YIOYVxXtf9nt8jZuwhN1dTuSHwSfGQUAg+4in4u/BWaSSp0UNFmUOVaJiYgad
 jZ2lToVWUa+ryZGqhXKfahDHX7H/X0TgUZdafSD5HdWoXHP6q+tZO59FWqn2VnGtl6Y1
 GEfGd/UipBYiUTMqwdXgKit+hFBidfRvpWfPwQvExsK66//NVZDII2A604ULsEFFRicA
 f9L1+yZrx9wEq19q1szO80JWvVzVixwqVRqq7ZCp6/bbnk30YWlWyVcEYct6JDc0Rok4
 XkXGllP3hNtEs/D75wLu6cIcXRbTw3mhpWdqmFzzZYx6DSdkAQk0KLa0GJO3Bh8feuct
 rpUw==
X-Gm-Message-State: AOJu0Yy1xtOTfUzuNLwxM+pAz8T0kLagW8v0dunJTjMgS9ivHmXVCPmQ
 bwhMxXrHnVG3vJX+2Mq1HmO8t3Sp6Cv2VC6QUaN6rg72RYECkfBOK3hemA==
X-Gm-Gg: ASbGncuqeww8plP87g9zZG3yRnLTAemMzZc1Na9Cr68VawUvgRZpdRBQ4XPDOGC+DCR
 hUm2oIIScS+VB0Mz+NPufJvLi9JaYaD7RLdon1Pn5ie50iFuRpNE9L/qAT1ZrNdzTypugsAxVdt
 0ltx2UUSDE7KvMvoiNb51A36r+g5e4Myu6yisHluwufyu3DPbYzNSecJKlwSbo/ld0dUYqba/4M
 mPzArj68Mey3f2l/+BWApfeSI48u2E1wyYjP4UV+/T2mbPfA0m1cgzu6Qtcl78mC6of5B8GPreF
 4By3c+HRhwDg8oWFIsESd7av9eRrpzngwMFSKy1YvK0cFoUD
X-Google-Smtp-Source: AGHT+IGOJBoZQS0z7fs2rhaUCYf0A8/pVMGNKkC1qVUmWZf6rrR8VK17vEFR4FD/ryt5ddmCLBCWMg==
X-Received: by 2002:a05:6402:5255:b0:5de:aa54:dc30 with SMTP id
 4fb4d7f45d1cf-5e59f360566mr5469955a12.5.1741234504807; 
 Wed, 05 Mar 2025 20:15:04 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e5c7475e9dsm305962a12.30.2025.03.05.20.15.04
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 20:15:04 -0800 (PST)
Message-ID: <67c92148.050a0220.f37d1.0880@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 06 Mar 2025 04:15:04 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741234505; x=1741839305; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=gCoMtV3ELlGUyMqA+bSGDP4rnW5ftvdLBcHWMbIVZ34=;
 b=dKIp3K4Ip++v+cx/HOcVEZ4pKRKZEfuyoF3BHyksfaUXKjCB3DcVSk88CzTQSfwT3+
 zxwNeClfobf8cv40stLeuLnXFwSIWADS1BXmcbLiiKTG7sbizNWiK9R+OyAGM2fHFcy7
 gXHANWuuY7m/WLSUJ4N8uS1e1NF5IxAFbhhKoE/ev5DJrMf5KLKrIXsH5BBlzhSBiyBQ
 6MCkIVuK/mW+n92QVsRxtsbtJbqde3ApjamXjvIzn8Fov0FBSpDqAsOivBSOcQqRBsUJ
 PmX8MzCfiKgFtaDtitD3ayQattKftBDcul0lVjMmOAcELVWUh3crMAC/eTREeVNyN8+2
 7ksg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dKIp3K4I
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-03-05
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

Autobuild statistics for 2025-03-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  1  |  5  |  0  |  6  |
  2024.11.x  |  2  |  5  |  0  |  7  |
    master   | 13  | 129 |  0  | 142 |

Classification of failures by reason for master
-----------------------------------------------

                elfutils-0.192 | 8 
  gobject-introspection-1.82.0 | 6 
                 linux-6.12.17 | 6 
                  ntp-4.2.8p18 | 5 
                       unknown | 5 
                  ffmpeg-6.1.2 | 4 
                 libcdio-2.2.0 | 4 
                  bcusdk-0.0.5 | 3 
                   linux-tools | 3 
                    mpir-3.0.0 | 3 
                 openssh-9.9p2 | 3 
               valgrind-3.24.0 | 3 
           at-spi2-core-2.50.0 | 2 
            gdk-pixbuf-2.42.12 | 2 
                 gerbera-2.4.1 | 2 
               graphene-1.10.8 | 2 
               harfbuzz-10.3.0 | 2 
host-heimdal-f4faaeaba371ff... | 2 
                 libv4l-1.28.1 | 2 
          linux-5.10.162-cip24 | 2 
               mariadb-10.11.6 | 2 
                   perl-5.40.1 | 2 
rtl8189fs-94cc959d56c1425fb... | 2 
              skalibs-2.14.2.0 | 2 
              udpcast-20230924 | 2 
                    azmq-1.0.3 | 1 
     bandwidthd-2.0.1-auto-r11 | 1 
                     bc-1.07.1 | 1 
                   bird-2.15.1 | 1 
             bmap-writer-1.0.2 | 1 
                     cpio-2.15 | 1 
                cryptopp-8.9.0 | 1 
      docker-cli-buildx-0.16.1 | 1 
                  dpdk-24.11.1 | 1 
               ebtables-2.0.11 | 1 
                espflash-3.2.0 | 1 
              fftw-quad-3.3.10 | 1 
                   flann-1.9.2 | 1 
               freeipmi-1.6.14 | 1 
fs/erofs/erofs.mk:69: /home... | 1 
fs/erofs/erofs.mk:69: /home... | 1 
                   fwupd-2.0.4 | 1 
                    gcr-3.40.0 | 1 
glibc-2.41-5-gcb7f206537240... | 1 
        gmrender-resurrect-0.1 | 1 
    host-mender-artifact-4.0.0 | 1 
    host-python-greenlet-3.1.1 | 1 
              host-rust-1.82.0 | 1 
 host-softether-4.30-9700-beta | 1 
                  jack2-1.9.22 | 1 
                   libcap-2.73 | 1 
              libeXosip2-5.3.0 | 1 
           libfreeimage-3.18.0 | 1 
           libpciaccess-0.18.1 | 1 
                libsoup3-3.6.1 | 1 
               libtasn1-4.20.0 | 1 
               libunwind-1.8.1 | 1 
                  liburing-2.6 | 1 
     linux-5.10.162-cip24-rt10 | 1 
        ltp-testsuite-20250130 | 1 
                     mtd-2.2.1 | 1 
            netstat-nat-1.4.10 | 1 
                nushell-0.96.1 | 1 
               openblas-0.3.29 | 1 
             parsec-tool-0.7.0 | 1 
               postgresql-17.4 | 1 
               procps-ng-4.0.5 | 1 
               pulseaudio-17.0 | 1 
         python-remi-2022.7.27 | 1 
       riemann-c-client-1.10.5 | 1 
             stress-ng-0.18.05 | 1 
           uboot-tools-2021.07 | 1 
             util-linux-2.40.2 | 1 
wilc-driver-linux4microchip... | 1 
                 wolfssl-5.7.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/e7ea281109dc20a255687083f9f1650531bd6f7a |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/25c2782f57cc3b73f23a629ab2a17414b0f5168b |     
  riscv32    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/0919d1ac8e7fcd2212d35e4919ca4d02598338a5 |     
 microblaze  |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/b8fe8cc8787c749134b3c69d6eae96685501aa36 |     
  mips64el   |           bc-1.07.1            | NOK | https://autobuild.buildroot.org/results/ae58c307e7e89dc27ab95916d2fa3c4f7264b85f | ORPH
   x86_64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/c8530c87cf2477977a6654b8d947c8ce86d3458e |     
   sh4aeb    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/ac73409315c785c0d5dbe8f935d84ea13442d5b2 |     
 powerpc64   |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/f661d77c45693afbef3047c441964a9e0c4a93f1 |     
 powerpc64   |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/b89342c6006531295b4f4341ec320e3ff19d5446 |     
    m68k     |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/d650b9eb88a6b196ec2f87b9119f3e106db8166f |     
  riscv64    |           cpio-2.15            | NOK | https://autobuild.buildroot.org/results/2b9ec580929d2145667b3194f8432a2044f357e6 |     
microblazeel |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/af5c29f21ad2b7ea8d3d31113f3de70ae8316891 |     
   s390x     |    docker-cli-buildx-0.16.1    | NOK | https://autobuild.buildroot.org/results/b2efde9fff957272748d26c801daf45783cce152 | ORPH
   x86_64    |          dpdk-24.11.1          | NOK | https://autobuild.buildroot.org/results/c87e236f38577ecdf8b50d428c572295ef9b0fc5 |     
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/4107ed79f12a045c690eb623d83750bc716a07a0 |     
  aarch64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/e81102b08b1c90d620293121bfc0ec9a4fe23643 | ORPH
 microblaze  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/86bb567e716eb5948f7ea0ee52f3d80733bedfa8 | ORPH
 aarch64_be  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/79c117530939b071b9b2af82f77b175ba687dfe2 | ORPH
   armeb     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/191c454ec95fe860b7fb20ea7f87df3ec0e12137 | ORPH
 microblaze  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/ff1b2b352e1cfdffd89b81b4fa4f661d618160a5 | ORPH
 aarch64_be  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/73d0c827911888e93fb1771bcba2f2cbfd483235 | ORPH
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/6b13321f81708922c6143b66355c69d1e512ef10 | ORPH
    or1k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/fea45a51b56e07d14fb662fffdc26c6833fa283d | ORPH
  sparc64    |         espflash-3.2.0         | NOK | https://autobuild.buildroot.org/results/9a0c94ab0459e6655ee8d59485cb015cb24f694a |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/0798ee1aa6238bf72f6a5957238d874660505849 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/73657b460e2ff296c1c5283dabd276b995cd77a0 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/0930eec7b18c6fb6da5c5f9a9eadc9ed10722bda |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/41d581c206c4a83d8ab162a749adb026b7b78e03 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/090b77d716c666695ad745878689129dee9c0b4e | ORPH
   mips64    |          flann-1.9.2           | NOK | https://autobuild.buildroot.org/results/7be9e2d1b7cb6ed8b5950c4274e2350d085b078d |     
    sh4      |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/b40b7a52a066b63b1d797420894b1f265c3db734 |     
  sparc64    | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/15cc2958bb6c2db93d9706d0c7b439757fbccc1e |     
   armeb     | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/4d3583c223ea201a3f75b4fa7f6f958f31e38d13 |     
  mips64el   |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/68b9c15b75d2ff5024c24ad6db50cb9e92196b92 |     
    or1k     |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/d87945516e20475864cdac1edcf7e22b02cbb202 | ORPH
   mipsel    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/8ef2ce6d8ac09161723c9237fe277b6a648f8016 | ORPH
   x86_64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/af8734b1cac831d99d666a4b31b142a98cb5dfa3 | ORPH
    mips     |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/060709d91cd32023e03ad57b7c1798369fa1766e |     
 powerpc64   |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/2bc6013bd049c5f1a449361cb62880e0824aebfc |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/c6ca8b1de31a770b533089cd3c9b1842905e453e |     
   s390x     |     gmrender-resurrect-0.1     | NOK | https://autobuild.buildroot.org/results/888466468a4aae99301dcfde063374426c422817 |     
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/9e44fe1f9d931529225f64ed710e00548bac7a88 | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/8a108741380edc5d629331985f4cec7eb60a12ad | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/b49a8c6be2f218a0c94c5a6593f2c8b40b4a2847 | ORPH
    sh4      |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/75911f9d815ede8fedf77d9ad7ea071026f87e69 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/52d55ec658efb0fc90f5fb1695b7e798b6bf393e | ORPH
  powerpc    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/9c712f1152d7f79352c341bc716e62433585e9f0 | ORPH
    arm      |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/72a19686fbc378228bae83e43f6fd00a5a094995 |     
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/a5c0381f89bbbbb5c54b1a25aa7a16d71c221041 |     
  riscv32    |        harfbuzz-10.3.0         | NOK | https://autobuild.buildroot.org/results/33368e5b44894e522a6c5eab2360b5bb8a6c1efb |     
    or1k     |        harfbuzz-10.3.0         | NOK | https://autobuild.buildroot.org/results/8112bd989711f3d058ede7654160932db334cb95 |     
powerpc64le  | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/965877cc10a9f1293c35997c0fa424caec2fee42 | ORPH
microblazeel | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/052e6c5a94122d894d2cbd3c129abae455eeeaf8 | ORPH
  mips64el   |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/7d878443e70652931cedba0fb59fcfbc68b68a0d |     
   s390x     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/f5328e96664a58bf073853abf119e027629486d7 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/43bdae5999a7639d685a0eea8f4404515094f5c8 |     
   armeb     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/dff3152f14bba686c42d26d647608b4f3f4ab9a3 | ORPH
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/1638f26271ca03c94f9666872427ac98957fb7c0 |     
   arceb     |          libcap-2.73           | NOK | https://autobuild.buildroot.org/results/35ed4564925a028e7434d4ae379ed78992a7e1a8 |     
   mips64    |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/856661a026e4b7d67f23bb505b4428360a926460 |     
   x86_64    |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/ef5d418c52d930c8b8553dd5bac64b3c4d0dd6d3 |     
    mips     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/c828ab98c499a226a93c87e51dc59d368fc0c3d9 |     
microblazeel |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/ce92a0d7fbb7024c6aaa2fe999f3a531a35436e4 |     
 powerpc64   |        libeXosip2-5.3.0        | NOK | https://autobuild.buildroot.org/results/2e626cf530ee66b0fd10e59d1d51be7011b51565 |     
 aarch64_be  |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/4da826686705720dd219cc729727e9e6c8e781df |     
 aarch64_be  |      libpciaccess-0.18.1       | NOK | https://autobuild.buildroot.org/results/ce835625a9f51d5a6205648382f3b54dd9851461 |     
   mips64    |         libsoup3-3.6.1         | NOK | https://autobuild.buildroot.org/results/5e5960868f4f228ca9c69df78a90049b7f778f87 |     
  sparc64    |        libtasn1-4.20.0         | NOK | https://autobuild.buildroot.org/results/0230054826ae453d05b3b6442c5c19349a433f86 | ORPH
    m68k     |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/9254ef685e0957dd8d9989073aee4be7674b07ca | ORPH
   sparc     |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/c8ecc33d9b7131b208e35e8248d099d1953514fb |     
   mips64    |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/336faa9bf078e6a8bb494bc91b2fd6a62bbe3870 |     
microblazeel |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/6dadff148b8196910660e8b50a17c657aa23e118 |     
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/4bb7a7fa131704217a953f63e2121d6e15025f79 | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/140607fd26e7d2f089ede9cf518a1addec02c378 | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/23f8a05bb69f0d95e99a582136e23a3bff470e02 | ORPH
  powerpc    |         linux-6.12.17          | NOK | https://autobuild.buildroot.org/results/2470ec13bfa58d60938ad8ee3031036c00cf29ac | ORPH
   armeb     |         linux-6.12.17          | NOK | https://autobuild.buildroot.org/results/6f1c17389e04c1fdd096ec41085a19e6aa477e10 | ORPH
    m68k     |         linux-6.12.17          | NOK | https://autobuild.buildroot.org/results/e3015cd83e46283b062834c52fbbc32c41bc59a2 | ORPH
    m68k     |         linux-6.12.17          | NOK | https://autobuild.buildroot.org/results/d4e603a4d4abbd7fd1a335cbfe1a2ec5f1bbb5ab | ORPH
    m68k     |         linux-6.12.17          | NOK | https://autobuild.buildroot.org/results/4aefa9efeca4d830c392ffeffb8b7ef05f5a5647 | ORPH
 powerpc64   |         linux-6.12.17          | NOK | https://autobuild.buildroot.org/results/2fbe8f36bfea30b01818d56b40bfed2577eb0cea | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/54a10e3c8c5938cdbb4a424695bfbdd9039d234d | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/2fbb9ce7536b1ffd380738ceb1ce002a50c69046 | ORPH
    arc      |          linux-tools           | NOK | https://autobuild.buildroot.org/results/cea59127ce7c9610e36de955d16f30b385f604c4 | ORPH
    m68k     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/ef7a05f90153289e9def10e01c42f2df9b83c6ea |     
   sparc     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/231c4e10b8c14805e45e41e8d7bcb0e9d5cddcb6 | ORPH
powerpc64le  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/fc13a2774ff74670cd68a7983339c91317443ed9 | ORPH
   xtensa    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/344abb899a6e316ae54f742238bdb547489fc3b0 |     
  mips64el   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/1dc4a35dd18b089f505d5694ed710c66d3638f15 |     
   x86_64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/b308ff727c580165041d9d541cc304115b54bfd8 |     
    or1k     |           mtd-2.2.1            | NOK | https://autobuild.buildroot.org/results/44813eb7946e705110f3e0f7a36add4ddc90ed00 |     
  mips64el   |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/552ceb3d6a8b04eeac265548e87cb7eb285c0068 | ORPH
   arceb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/49e52926868366dc876157d5d94a17ec6008caab |     
   arceb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/18db416d5868e7b3d08e5df039e9bc7002846fe2 |     
microblazeel |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/855fb172fba72a02a226a09cac0e094767027e7a |     
   arceb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/eb9953668bd27e0e74a0fb6bec74dd7c96e747f7 |     
microblazeel |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/1ee58561af3e2a89dd457503cca6c48a703425d6 |     
  powerpc    |         nushell-0.96.1         | NOK | https://autobuild.buildroot.org/results/02ef2958ef7b6253b0246fa53ad0e723861c9613 | ORPH
   mips64    |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/103f41a2323e6533b9c26a92d773225e697d2f18 |     
   mips64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/b072f5dae3b6aec958655157a3e923515124abe0 | ORPH
   mips64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/9e3b639cc73a0826c36ba256405885bcb326ea66 | ORPH
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/81dc6f078fd96d5afaf0617ba22fb9f643882bf5 | ORPH
 powerpc64   |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/1843d27232e8dd279fdb6ecff371d9b675d168a6 |     
   sparc     |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/56a12d346c87eeb87ea7bb8754fe47e69478302f |     
   sh4aeb    |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/753d4548a87d4e79bcc73f2af81c58d624405df7 |     
    mips     |        postgresql-17.4         | NOK | https://autobuild.buildroot.org/results/cc8a0d63015fb297c1751f3a9af40131f6fc8087 |     
   armeb     |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/1be39442d279272b8025126455d94fa6ba9c5b19 | ORPH
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/1401eef3ae9e4d48f6935cabd737b69b24b841fc | ORPH
    arm      |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/e3ee93e79c1e0075ae25774a321ba6de38e27c9c |     
 microblaze  |    riemann-c-client-1.10.5     | NOK | https://autobuild.buildroot.org/results/a7d0f6f0da120c8f5e58c36ab84158b4f450faff | ORPH
 powerpc64   | rtl8189fs-94cc959d56c1425fb... | NOK | https://autobuild.buildroot.org/results/b63d039d63c9a687db4a64426e1b704d5aa1490f |     
  powerpc    | rtl8189fs-94cc959d56c1425fb... | NOK | https://autobuild.buildroot.org/results/e0f143dd498534c757a63f9d912b3a4ab7f371c8 |     
  powerpc    |        skalibs-2.14.2.0        | NOK | https://autobuild.buildroot.org/results/a763da2e9d0ec7c006f40d3ee1c92dfcdebac6bf |     
  sparc64    |        skalibs-2.14.2.0        | NOK | https://autobuild.buildroot.org/results/8ae9ebf16f8447fb1faa8f527f19146b2fa7f733 |     
   sh4eb     |       stress-ng-0.18.05        | NOK | https://autobuild.buildroot.org/results/b4861c896d085b758c512e7f9039d6124d3ad79c |     
 aarch64_be  |      uboot-tools-2021.07       | NOK | https://autobuild.buildroot.org/results/647f6562ced768ce2142dab4c6e71fde06022709 | ORPH
  riscv64    |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/fb1575851b399e21bc316c0e03c92df5ed9b1633 | ORPH
   mips64    |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/d572fe61b132b0dd833a5def5187b51c65911b65 | ORPH
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/0f2d29903b600c2b4f6c67d92d73d0f9cadcfdd2 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/5aea57c2d54656e96a14b8b624f49a6b7163b40b |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/ff61903b76a662dd0d36bd1f501b78a418be9215 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/8038516b6082993a45f2693c6e26a0cbcfd84257 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/a3f4bad860e1cfdbb6e276dd6bfcc61018f2f1a7 |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/4f50bc4c5046ed50e0ae1cc7ccde91caacd86660 | ORPH
   mips64    |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/70c3f5dfdf31727aa07891b9671e05f70ad421f6 | ORPH
  mips64el   |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/f6cca34f3e9b3ee479280e58057c0610bbc316bc | ORPH
  mips64el   |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/b4ea70f47107b8123e285723c51682a4c0a34884 | ORPH
   mipsel    | wilc-driver-linux4microchip... | NOK | https://autobuild.buildroot.org/results/d0f1bdc4c77294f8f42fc70bb3fe8dbbd88017d4 |     
  mips64el   |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/77ee793b2becea283f4f8625457fa0992e1ac955 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

               host-go-1.22.12 | 1 
host-vboot-utils-bbdd62f9b0... | 1 
                libglvnd-1.4.0 | 1 
                   linux-tools | 1 
       riemann-c-client-1.10.5 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        host-go-1.22.12         | NOK | https://autobuild.buildroot.org/results/f1fc7db7b2d3f081784754a1206b918ecbda5cef |     
   mips64    | host-vboot-utils-bbdd62f9b0... | NOK | https://autobuild.buildroot.org/results/22da83802c4e1d522f52563741f3d66486013e54 |     
   sh4eb     |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/9859825d1fce696fb83731d22f9116ca6eb1bf1f | ORPH
   s390x     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/4b7caba52c239e2fdcf261a81c2f350327cd0583 | ORPH
microblazeel |    riemann-c-client-1.10.5     | NOK | https://autobuild.buildroot.org/results/c4796559c7e8354a0963735611f1e726400b92d4 | ORPH


Classification of failures by reason for 2024.11.x
--------------------------------------------------

              fluent-bit-3.1.3 | 1 
              fmlib-LSDK-21.08 | 1 
               graphene-1.10.8 | 1 
                 pkgconf-2.3.0 | 1 
                   trinity-1.9 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/1c06ce37ed9d6ece0910a5d7b0ce16af23e632ec |     
  aarch64    |        fmlib-LSDK-21.08        | NOK | https://autobuild.buildroot.org/results/1efb616c2335a4be477f3b6b4b8185593c4ae926 | ORPH
  mips64el   |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/366cd7251f8b8713e57625af02905d4e8c5d35b9 |     
  riscv64    |         pkgconf-2.3.0          | NOK | https://autobuild.buildroot.org/results/9c54abe76f435d4a6e9e0747c914658cad9a35a9 | ORPH
 powerpc64   |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/d5484d9ab1011d002ba2a16267964739419327cf | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
