Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E80FCD98C7
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 03:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D7BD40FE2;
	Fri, 12 Jun 2026 03:18:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eroQKK_Y6wRu; Fri, 12 Jun 2026 03:18:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D93440FAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781234315;
	bh=2Cph69TE+eGhyeWZCzK4K4g/YIvPno3OuA3St2mshmw=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pdsjRz1EDjuQTUTjNIAPaff6xjC1kGuDCiDTSYfpmmsVQTSEoMYh8LR83bnwkNvGL
	 LOfi4gvzOgq/JIOc5vOrMWTvCQBBW6Fp9lknCiGTWbx0onCe/Tq4GqRMPpOBFWjrN0
	 DF79iBAULaIZX1Zc05k4PFaoAR3xP9ANwNRUC8mDUuxLT57sTz2qxZdhNSC7V/r2E8
	 uxUkiQrMumMaraeC9SccjztVDEB4t7PwssiARW9A8aFb8P1dkKZ5p+59tQwNJZvla1
	 ev+5u9Q6UTAnYgpc2EacJKlzApMOEdLgh98ygF4oJl9xtqRjH9srbEgDHId510MvT+
	 0Tp/25ybXMdNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D93440FAA;
	Fri, 12 Jun 2026 03:18:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EDAE12F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 03:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D02560E83
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 03:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uCKkIWr82eW7 for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 03:18:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B293860AB9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B293860AB9
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B293860AB9
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 03:18:30 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-490b7866869so4283225e9.2
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 20:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781234308; x=1781839108;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m59x48ea7dF1YbqKHXEieqbh4G1KNuYx6ukmid3zO44=;
 b=RwHBjwutFQtCAzRVjOvOfKR7S+P+umjw9P8uFzmhM45wnAQPeps0kYh0PguS9Sacw6
 3yO46+27Sho99ie3xP//mGY2IE+GMdnNnYb2ZOaa8086/Z5vOam/ceJzwuudjJmZ03IJ
 T+j0fkZlNI7aFqgfuXRRxlNL4jJZ/4Pm2TKS0Iaa6tV3euIwUnBo3s2V2CbKGAX353HA
 W2BhT9FlkEUdat/WA73txIFNhdSYMXzmE7Yo4qc++KAKfbAuMBjHkTdT7BR2cwLJu6gR
 D2YxFqRMVbAs5FLXdMrw43cWmRzVkdaSTbmhKtAz7l3JR2a2gSAlTWUWlvTarKugTNdv
 0qeg==
X-Gm-Message-State: AOJu0Yx5CDDgsXP2Llf4qpTWRWNWMqm5tV6ZPqz2E/fkNJ3Mkk3obJjU
 omoDNlJ6w4IeJOlvIUJbKrfXZsBNyJltkgtecEiGVykXr2D/mPfBXjvxY8CXJ4y/
X-Gm-Gg: Acq92OF7GZpDC2MPrBOY22LOeybj1dU6MDPVJ+dUc+srtI69RG/fw9lkEdBEVu9bSkX
 miC4zoHrc9FOmud/KIH9x6ZXamIPEDepgfjcWDWC31DMKak0yus0yDfDLRjWb0GLMrAWTiOzem7
 DuVQf8SiajLZcgYmV2S0SXl/HK1Mpq8vp7fQSy+rVxOYiGMsJSFInoFgiZO5TKXL/VkzULGbgUU
 wnHD88r3PmjXvUL2oCf/jGXgLZJzo8HklFiUnLplTvRQfB/BGiJ2MlawTcEZroc6h8a173Dk43J
 umDoeIrvgPfwY+PVhi1Qkr6EzaZYxOepO52y7290QYWkK1lLxAGB8KPjrtRWKnH3qAqxd9zDpyQ
 ucnvaWq1SXlYNdClicQMe9VHHYF+p6DgDJfTYaNhMor8OjSZUA1AgkRxt6Sw2ezyA4jCaMS9b2/
 gD/tNx2GmyuBxDuT6NZfkTxsFxpWbjv02VFyev
X-Received: by 2002:a05:600c:c107:b0:490:a298:3859 with SMTP id
 5b1f17b1804b1-490ec50b90cmr8677815e9.24.1781234307971; 
 Thu, 11 Jun 2026 20:18:27 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26f1cdsm1527164f8f.11.2026.06.11.20.18.27
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 20:18:27 -0700 (PDT)
Message-ID: <6a2b7a83.2224f9ac.1726e2.9f26@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 12 Jun 2026 03:18:27 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781234308; x=1781839108; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=m59x48ea7dF1YbqKHXEieqbh4G1KNuYx6ukmid3zO44=;
 b=gpQ2YA2fjKR852sm9/+dArdBn12zgW2CSsCMn3ULAS1+8TnXA1IQiO2w9PAnyUiLYp
 vAvmnMdDwUXIJvbWfBfunGp9GkgDbyT/xzhsdvRB6yxENjI3QSeMwY+U6iaGob4tUEdR
 m8uhvUAZZ/VzX7nvdu2vexiAbLA8ExFBx5C0Kbo/5tv0Ef4fsUJk2mElgmWTGOddSycM
 VgQnfJS8myOk4i//anHygjn1F1NXH9EEX9BqvAfn6d6N2mF0SrYYuQvIwhCRSxVngHV8
 bBUkIgZTBTPUgXEer7fvSpIazthKP3QdCldU79804hZQC8CQcZc5iNl16nZK0WBGaQTz
 pBcg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=gpQ2YA2f
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-06-11
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

Autobuild statistics for 2026-06-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 10  | 22  |  0  | 32  |
  2026.02.x  |  5  | 10  |  0  | 15  |
    master   | 44  | 148 |  0  | 192 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 6 
            gdk-pixbuf-2.42.12 | 5 
               host-dracut-110 | 5 
       host-gcc-initial-15.2.0 | 5 
                   perl-5.42.2 | 5 
  gobject-introspection-1.84.0 | 4 
      libabseil-cpp-20260107.1 | 4 
               tcf-agent-1.8.0 | 4 
                     apr-1.7.6 | 3 
host-autoconf-archive-2024.... | 3 
host-gobject-introspection-... | 3 
            igd2-for-linux-2.2 | 3 
                    olsr-0.9.8 | 3 
                 uclibc-1.0.58 | 3 
            18xx-ti-utils-R8.8 | 2 
              containerd-2.0.7 | 2 
                   dante-1.4.4 | 2 
glibc-2.43-27-g4070d808bea1... | 2 
            host-autoconf-2.73 | 2 
                 host-gdb-14.2 | 2 
                host-odb-2.4.0 | 2 
libesmtp-v1.1.0-14-g335ee8d... | 2 
               linux-pam-1.7.2 | 2 
                openssh-10.3p1 | 2 
   openvmtools-11.3.5-18557794 | 2 
      passt-2025_06_11.0293c6f | 2 
                 rtptools-1.22 | 2 
                   s6-2.13.1.0 | 2 
am33x-cm3-fb484c5e54f2e31cf... | 1 
amazon-ecr-credential-helpe... | 1 
                   atop-2.12.1 | 1 
                  bitcoin-31.0 | 1 
                  boinc-8.2.11 | 1 
          cloudflared-2025.8.1 | 1 
             dahdi-linux-3.3.0 | 1 
                  delve-1.22.1 | 1 
             docker-cli-28.3.3 | 1 
docker-credential-acr-env-0... | 1 
              e2fsprogs-1.47.4 | 1 
        edk2-edk2-stable202602 | 1 
              erlang-26.2.5.15 | 1 
                      fio-3.42 | 1 
firmware-utils-c42a3bc53da8... | 1 
gemmlowp-16e8662c34917be006... | 1 
                 gnupg2-2.5.20 | 1 
                   guile-3.0.9 | 1 
                   gvfs-1.57.2 | 1 
                 hidapi-0.15.0 | 1 
host-am335x-pru-package-5f3... | 1 
          host-automake-1.16.5 | 1 
            host-binutils-2.44 | 1 
host-binutils-bare-metal-2.... | 1 
         host-btrfs-progs-6.10 | 1 
    host-gcc-bare-metal-15.2.0 | 1 
       host-gcc-initial-16.1.0 | 1 
            host-go-src-1.26.3 | 1 
              host-guile-3.0.9 | 1 
    host-mender-artifact-4.2.0 | 1 
           host-python3-3.14.5 | 1 
          host-tipidee-0.0.5.1 | 1 
libcamera-apps-v1.7.0-10-ge... | 1 
               libcgicc-3.2.20 | 1 
libest-f8a6e5b53a5f70e72fe4... | 1 
                libglvnd-1.7.0 | 1 
           libmicrohttpd-1.0.5 | 1 
                libmpeg2-0.5.1 | 1 
                  libnfc-1.8.0 | 1 
           libplacebo-v7.360.1 | 1 
           libsoundtouch-2.4.1 | 1 
             libucontext-1.3.3 | 1 
               libxmlrpc-r3335 | 1 
                 libzlib-1.3.2 | 1 
     linux-5.10.254-cip72-rt32 | 1 
                  linux-7.0.11 | 1 
        ltp-testsuite-20260529 | 1 
                  luvi-v2.15.0 | 1 
               madplay-0.15.2b | 1 
             matchbox-lib-1.14 | 1 
                   neon-0.37.1 | 1 
            nodejs-src-22.22.0 | 1 
                  ntp-4.2.8p18 | 1 
                  ntpsec-1.2.4 | 1 
                openntpd-6.8p1 | 1 
               pulseaudio-17.0 | 1 
                s6-dns-2.4.0.0 | 1 
        s6-linux-utils-2.6.2.1 | 1 
                     shim-16.1 | 1 
                 systemd-258.7 | 1 
                tpm2-tss-4.1.3 | 1 
           uboot-tools-2026.04 | 1 
uclibc-ng-test-132c6134d691... | 1 
uhttpd-15346de8d3ba42200249... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/867c60cbe9c96a84af60fc4f88b31a2f2553b1b4 |     
  mips64el   |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/fb53bb0a6d7b7fe063ebcb3db899780133cb1da1 |     
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/a0453cf024a5c16aa70cca9c19c28d8da1e8a01d | ORPH
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/c081326dc78289b2a75a43dd83faab004973e17d | ORPH
  mips64el   |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/eb02b6711f0f04dd04d8f92b83a78a56a9eaab4b |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/84a4e77752740c525bf0fcdbcbae324c77a72331 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/0a970559492e8abefe2dfa7914dc9f4d9d985abc |     
    i686     |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/90f44d582190f273ccb06bb21d5056ce1a0055b2 |     
microblazeel |          bitcoin-31.0          | NOK | https://autobuild.buildroot.org/results/1410bed440fbb4be742b51c191c662fd1397e8d1 |     
    i686     |          boinc-8.2.11          | NOK | https://autobuild.buildroot.org/results/24bebd6719f21f99f603bd220657424a176a9b69 |     
    arm      |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/4084db599813bce7123e846af2a2b56be49d525c |     
  riscv64    |        containerd-2.0.7        | NOK | https://autobuild.buildroot.org/results/f448bef761e81803103517f3c93fb6c7eb474a67 |     
    i686     |        containerd-2.0.7        | NOK | https://autobuild.buildroot.org/results/845e0337cbd6ee56653c0ef5ed6e51bc58a9e8bd |     
  riscv64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/454d0fd5ff2a139b101379c3829ecfef2a9a2a31 | ORPH
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/f39d0299648dba6dbbf806e9cece926811ffc769 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/cf52ff585167f48f76f52817803367117f84f15e | ORPH
   x86_64    |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/b0882968152ab7b58320a3390233b4976ea0151f |     
    i686     |       docker-cli-28.3.3        | NOK | https://autobuild.buildroot.org/results/39fbb6d77cee4d54d6ad46f6bb9c1f2b0537cc0f |     
    i686     | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/5e899def0cecb218f870ace180fcda46952734a3 | ORPH
  powerpc    |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/80a0386ac992eb9549387e1543c4c4aba1aa74bc | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/ca62aacdeb41b0961e9f99917b6fbfe5d0ce9c32 |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/db701134fe03dbf368fcee94f0431833577c425b |     
    i686     |            fio-3.42            | NOK | https://autobuild.buildroot.org/results/69f0bca9a995e2567324a2e0fc3eaf553daabd13 |     
  aarch64    | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/b1cf3accd01fdd67230cf08d48875cb1feaacf9b |     
   mipsel    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/20609e2ef80e1c566a33c58526104e7d2809866c | ORPH
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/ef367f08b26f0003bd1094c00c0977bbb125f8ac | ORPH
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/b9cfac295a6430b0529fa3dd8cd193b21698ba75 | ORPH
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/15283a038fb39059639b77e1d87ba3dc999952e9 | ORPH
  mips64el   |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/cba551f27604b70cd9c3032e053d71f46f33fd76 | ORPH
    arm      | gemmlowp-16e8662c34917be006... | NOK | https://autobuild.buildroot.org/results/062c7ca129da5aa8e5c197c36e4e027547fe3f97 |     
   mipsel    | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/02cdd1d0ce13f255dd5958157f08ae98b8f92629 |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/904dc0a27e2344dd37d07e6030a45f9ca66ea552 |     
powerpc64le  |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/326670ff66d63b2e9128e9ed06f111b8a6865527 |     
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/24163e6236202a41c4513297782d1c5b4871d99e | ORPH
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/d6157b3308c4cc27eec4ec8919e288f65939138a | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/fd7317b4bd1516cbd5d2440ce51a3e1fff2e87ac | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/644cfd6ba049c964bf0b927c233c24002ec301ca | ORPH
    i686     |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/8fb16b486667107335ba46277f14968c605d61a9 |     
    i686     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/b3522374e111f1df8b39f198de65e0a595e9a465 | ORPH
    i686     |         hidapi-0.15.0          | NOK | https://autobuild.buildroot.org/results/28911c7c297f5775b2725c194b80a886aaf2ee5c | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/56abcad3d5dea0d815df6d9e6606cea9f4ab4b3d |     
    i686     |       host-autoconf-2.73       | NOK | https://autobuild.buildroot.org/results/f766aa3eee5818d3c00cd1411e6aa911cc0f8619 | ORPH
    i686     |       host-autoconf-2.73       | NOK | https://autobuild.buildroot.org/results/125c4d4f877a3a166f8a416eeaef257fa47ef89c | ORPH
    i686     | host-autoconf-archive-2024.... | NOK | https://autobuild.buildroot.org/results/9e6f4bd30156efc856d94c443c38cd84776054f0 | ORPH
    i686     | host-autoconf-archive-2024.... | NOK | https://autobuild.buildroot.org/results/6dd43d3586aa17f98f63c4d2c71bbf53f9a92a05 | ORPH
   sparc     | host-autoconf-archive-2024.... | NOK | https://autobuild.buildroot.org/results/430e8d5acd8e8fcde0e9269d68328bb1458dcf32 | ORPH
    i686     |      host-automake-1.16.5      | NOK | https://autobuild.buildroot.org/results/a5386f2fc5bf5e5394d3e62888f153af7a1c76fa | ORPH
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/cbfeded74bf49984b9285527d2caf948b87f65bc |     
   sh4eb     | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/2b128f19bb3a07a8b11209cb8525d6795167e7d0 |     
    mips     |     host-btrfs-progs-6.10      | NOK | https://autobuild.buildroot.org/results/f15fa417fd23ba4b02b3bbcd7c0daf0248f01c10 | ORPH
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/c6d6ae651b78d0b5a8ab983c12efba24a6564f58 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/a251cb9098168b94aaf7274cd75266144d8be54b |     
powerpc64le  |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/6f4433cef4b3a29269fa8d551b14278ffc34d13e |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/4a1024d6c0b22fb2f1b69e5e25e88e09935be92b |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/160d0763f6e8543f8f749c6f4217f0f302475262 |     
    i686     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/10e1b9fda0110af2db9c83a180efc974ab8e2c97 |     
    i686     |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/59f6edc52894a4d3c2db83759d64ad31f3995e65 |     
    i686     |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/bb52f9c98db1fc5a83194b19b80c9bad7ae95b74 |     
    i686     |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/e7dff989088c604eb1471928c0fe53e14b522a2e |     
    i686     |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/9aa9ae5e924020e13ad2d8367036abc6bcebe924 |     
    i686     |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/1b72bbc0ff9162e264351a16059f09c3a6444719 |     
   s390x     |    host-gcc-initial-16.1.0     | NOK | https://autobuild.buildroot.org/results/7790fc3509a8ac3d75ce1f7ecf18e4983daf9254 |     
    i686     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/f5b00c8f68bfeb74ad7bd0ef7264b5c00a161fb4 | ORPH
   xtensa    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/da65df4b8d81227d215b640a464f4a90531a3289 | ORPH
    i686     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/d0185eba13a96281c8c376c776707c53f22b5306 |     
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1a355ae204fe06c4458baabf6fd74e9308e1f92c | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8c5056b025da09c567c3ef95fc3b4a3752214b3f | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/866c8cf9b1156d80b030b8e575869c1ce0ef4d70 | ORPH
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/d0aa85f848696e0db6623b1759d3059050584f9b |     
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/ddec50bb3642115a60b8d15f649e10e25424cc93 |     
  mips64el   |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/709a54efa1dbad37b64ad2601ff6d44628b5f263 | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/30b714028a538b7acf777d7e21ddcf85e201a666 | ORPH
    hppa     |      host-python3-3.14.5       | NOK | https://autobuild.buildroot.org/results/3fcc8666aaf5695b259f788cd851b6eec3fde69f |     
   mips64    |      host-tipidee-0.0.5.1      | NOK | https://autobuild.buildroot.org/results/e5fc19c416fe7d42c48acb72ab023eabe301c0a7 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/287072d581ba12fd3f6d0b3d2ba29ba6a1834a5d |     
  mips64el   |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/bc5c765d142c0e7fc6c7b41b8596e60de594554b |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/8116452af09bc01e060df7152eddd5aa124e2ae1 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/2ac38cbed723ca96e013ead0b869db90084206e1 |     
  mips64el   |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/42176f1005cc65f1ce67c6345cae59853e8277b8 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/1f3b95c29f756a977d3bf96fa8b33141e098c934 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/2f24c067ba947743e234c514bd3a067f808a7504 |     
    i686     | libcamera-apps-v1.7.0-10-ge... | NOK | https://autobuild.buildroot.org/results/3756dae96641f6d5083082edb4d447453a173922 |     
    i686     |        libcgicc-3.2.20         | NOK | https://autobuild.buildroot.org/results/eb4c3c8584e3941b0c55d153ec978b3378c50deb |     
    i686     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/26f4109c5a70865c6da8e1c3e40a19edaf6c7926 | ORPH
    i686     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/b0b812c80167a4c5aa08f86fc4b625463b2829a7 | ORPH
    i686     | libest-f8a6e5b53a5f70e72fe4... | NOK | https://autobuild.buildroot.org/results/149aad6f98163faab14232a9d3013c197579cbb4 |     
    i686     |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/72eb67187031acbf4ac333d27ae95eabbadbf3fe | ORPH
    i686     |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/d8d20819fb6bc2bb2c7b1940922791313ff809d4 |     
    i686     |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/89fad93425a4d8e92757f2776e3757d489311f83 | ORPH
    or1k     |          libnfc-1.8.0          | NOK | https://autobuild.buildroot.org/results/e7e68a2846c176f2eca989c2ff995fffcddbcffd |     
   sh4aeb    |      libplacebo-v7.360.1       | NOK | https://autobuild.buildroot.org/results/6c5868f1af6792fb5890b4b40a9a1c60b85d36d7 |     
    i686     |      libsoundtouch-2.4.1       | NOK | https://autobuild.buildroot.org/results/82a30d7ee7f71cd4613813dc7920d6b4d7e3a757 |     
   sh4aeb    |       libucontext-1.3.3        | NOK | https://autobuild.buildroot.org/results/05ba18a7c56aa9b438d205d55aad188c40bf47b6 |     
    i686     |        libxmlrpc-r3335         | NOK | https://autobuild.buildroot.org/results/4b43c9d7d3323681863ea070ea04e89d602d3d95 |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/f843d2ca7fa9774f2982828ee8e99f986a8c9c29 | ORPH
  powerpc    |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/1d1f6aa3f1c39f68c6b6d592c6201f970f402412 | ORPH
powerpc64le  |          linux-7.0.11          | NOK | https://autobuild.buildroot.org/results/79805dc9ef15ca08d37976183d0124b5531c55af | ORPH
   armeb     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/e172e866eb26a0ef488fec7e7a8608fe35765b37 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/96f4eec201fc4e69b9c91ca1be8d561ec2adb17c | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/e8c4f5b4c9a2f9c429b8637b3038ac938ee81e96 |     
    i686     |          luvi-v2.15.0          | NOK | https://autobuild.buildroot.org/results/dd0d43fecbb74fc1b6c9e0cd01af0c229fefe72e | ORPH
  mips64el   |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/61d50e9a8c166da76b528726f2a772e58312e66c | ORPH
   mips64    |       matchbox-lib-1.14        | NOK | https://autobuild.buildroot.org/results/ddcd9f0dd394985490062b5f06bea1524b6ae986 | ORPH
    i686     |          neon-0.37.1           | NOK | https://autobuild.buildroot.org/results/f9cdac0f4baf1272f09e09d2b799702efc5e4074 | ORPH
    i686     |       nodejs-src-22.22.0       | NOK | https://autobuild.buildroot.org/results/5262e7d80705b8a8b213588c8226919d3bf40cfe |     
  sparc64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/49065208cc6502fa9b84db143ef6c3b688d0c49a |     
    i686     |          ntpsec-1.2.4          | NOK | https://autobuild.buildroot.org/results/4b8b21072c4df7ea838162fe5b9511cf37bef5a3 | ORPH
  riscv64    |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/1583675dac9bee0e9f6ad4b0ad34499968dc3053 | ORPH
   x86_64    |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/12c7701d6cbf1c8ffcaf77f7ea303d917ba4c11d | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/8e231e3c1c8a7a923f6313cc67b0e2eaea44adb7 | ORPH
    i586     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/3b21b95c819fbffdfd61bd86774953b75e7650f4 | ORPH
   armeb     |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/9df686a5d266a556b0f26c7aad29ebfd1e8fa5bb | ORPH
powerpc64le  |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/58b985e9a4ff6959e0b240f930ae0d1fce265cde | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/e0a4ab4c44f827cb993efc33acacd15f14a401aa |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/e5c66a30f18639fb28f2897ef5c904dc0cb8efde |     
    arc      |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/985a1a124bb5b4d9e5cb803c1fefe8b43444f149 | ORPH
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/7cf353fa9c5fac1ad487641c855b81fa13b98eff | ORPH
    mips     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/0acfdb71d4ec2d8f1c467b349ea8d78e1f58a3f8 |     
powerpc64le  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/b77faf31a87d899b0e22b730f98f716690eb839a |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/9361dd1b318889aa98a37485c1883eb577fab505 |     
   x86_64    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/2be73cf060a95e9a1eb9ac35c41a6f64806ff185 |     
  riscv64    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/8d803b03197823169721bcb7847e7f15c233a744 |     
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/163044e2d4d185e382092e34ea08bb8a690ce9a5 | ORPH
  mips64el   |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/c1ab4018e8bad002a0eeac8ddc5b4d1849a51013 | ORPH
    i686     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/a8e1cd74d355b19b74fcf7df9f1607b815af82d9 | ORPH
loongarch64  |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/f5524728619107a28ed50071b293458fec7e75c7 |     
    i686     |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/69f54a4e18f13d901ab5c2a6fd6f56b719bea219 |     
 microblaze  |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/caf331e1259b6309858b27c10c12346b3ce62a15 |     
    mips     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/56743d8df848d495fa5ac7439fb1af24e88c1268 |     
   x86_64    |           shim-16.1            | NOK | https://autobuild.buildroot.org/results/0528f9071ff69ab014149b5ca2253c5e324e15b0 |     
    sh4      |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/efb1d5b75c68d3ba2c044012f73f4620cfd79bd4 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/125bb715590ce52923417234d22e05c89a682a7d |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/8c051bb79c07e85eae1dc6f15646ba1273d42b6e |     
   armeb     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/440233a7d6ad410262cd7d156b01a0eb92c929e7 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/8e063f3b92a2a7cfc25a264fa42da1d6cec044ff |     
   mips64    |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/5f2544710877000f8e0aaa9dd2267237f2341e2d | ORPH
    i586     |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/834dc9da1d1ecab51a867f66d360d7347132593a | ORPH
  riscv64    |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/566cfbb3fb6333da039a67237b3a0006110bca09 |     
    or1k     |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/896fc370f6b91746541b748cf35f4f304a6832ff |     
  riscv64    |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/6e3f1d2aa95658eafc6417d644482e5a391dcad8 |     
powerpc64le  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/139f5070f7381e583227a5da104c67e43e961f14 |     
  aarch64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/7f4e5934d99e16a74f13efd13a64026940a9d9fa | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/ae57efcba74e275ef8f5bc8a2a60097b07d91e23 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/42fe3f8405481568e1fa0067325a948638f94b19 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/79251370c59f273360c1b2cd5976c9603dc471d9 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/5a2dcf437d248db39f747a9efe5425243ea6c743 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/481d933da676e407aa037aedc871a00abe3d9e8e |     
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/3a69347a109220c9140fb3ca4087275d09d0945f |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

glibc-2.42-67-g4ebd33dd77ea... | 2 
  gobject-introspection-1.84.0 | 2 
                  boost-1.83.0 | 1 
                 fwupd-efi-1.7 | 1 
            igd2-for-linux-2.2 | 1 
      libabseil-cpp-20260107.1 | 1 
               openblas-0.3.30 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/470f9e638dd2e28f07d583c35c4540f2e6be9850 |     
    i686     |         fwupd-efi-1.7          | NOK | https://autobuild.buildroot.org/results/baca52aeb698f7d8291ae54e3d8fa990893e67b7 |     
   x86_64    | glibc-2.42-67-g4ebd33dd77ea... | NOK | https://autobuild.buildroot.org/results/a98b95d76d8263ef94254a6d6fa9c214ddaea99b |     
   x86_64    | glibc-2.42-67-g4ebd33dd77ea... | NOK | https://autobuild.buildroot.org/results/df7c16f0e8e65beaba2221ab27bfb6d368fa319d |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/73dab857b0ed335d57162731df1cb7a988717604 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/228b65d1a6dca136c43f04e620e67ed0bca3e48e | ORPH
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/1986b3bc82b101b4dd29c0cc14ff5078f2870d5e |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/053d9a92d812ab690e3936f7924900fa094aaff6 |     
  mips64el   |        openblas-0.3.30         | NOK | https://autobuild.buildroot.org/results/901955f6ab3ad62d7e0bf7c8386de2b4fc7dda0f |     
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/330e133c2aad9d496f3cbefb25a8e38f9a499098 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                   dante-1.4.4 | 2 
      docker-cli-buildx-0.16.1 | 2 
           oath-toolkit-2.6.12 | 2 
                       unknown | 2 
              erlang-26.2.5.15 | 1 
                 fwts-25.03.00 | 1 
  gobject-introspection-1.82.0 | 1 
                haveged-1.9.21 | 1 
        host-python-lxml-5.3.0 | 1 
 host-softether-4.30-9700-beta | 1 
                 libgee-0.20.6 | 1 
        ltp-testsuite-20250130 | 1 
              mariadb-10.11.17 | 1 
                memtest86-7.20 | 1 
            minizip-zlib-1.3.1 | 1 
             parsec-tool-0.7.0 | 1 
                    qemu-9.2.0 | 1 
          sphinxbase-5prealpha | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/81cf3396415ee045cd206ff29eac3f96b0809418 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/81ebb5d81afaad060d0df3d4463cc9b0c2d3fc71 | ORPH
   x86_64    |    docker-cli-buildx-0.16.1    | NOK | https://autobuild.buildroot.org/results/4c2fb470296054c446d4c223033037cb19e99c8c | ORPH
    i686     |    docker-cli-buildx-0.16.1    | NOK | https://autobuild.buildroot.org/results/1ef60b3e53bae420f01529198ee1a4b3ac186ed2 | ORPH
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/e889acbe1f13b85b764b54eac3f446f59820d500 |     
    i686     |         fwts-25.03.00          | NOK | https://autobuild.buildroot.org/results/40d1e9c730fdd56d00caa82ea05caa4188c78de5 | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/8559bb304eae2f6f0cd1f489ad29462978af5f89 | ORPH
    arm      |         haveged-1.9.21         | NOK | https://autobuild.buildroot.org/results/ea5a3b7de77393cdf000a27462b8ffb2d1325117 |     
   x86_64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/e41caa3c74725cbfe38f11d26099531342ec90b7 |     
    i686     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/a2cc014f80ecc792454a8199de1e102bb0bd9a82 |     
    i686     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/952ff796667aceffab394faf9528db66d67f2891 |     
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/fe327bb47e0f02866818006874771eda7b260f26 |     
    i586     |        mariadb-10.11.17        | NOK | https://autobuild.buildroot.org/results/5307b850b84016dbce5d4cddbb3bc078028552d9 | ORPH
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/3c28b12d40c9de85da5784bf1807be85e259dd8e |     
   mips64    |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/fcad2c3eb9d6fb6dcb99d6187bcc5804fd0903c3 |     
    i686     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/ed5a6754513631604de50f38d2fab92a0e030323 |     
    i686     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/bf3610e7da7e99969aa9a988cd285adc882ae697 |     
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/ee8e1081d4379572cfd79dcea20c06c1daf26338 |     
    i686     |           qemu-9.2.0           | NOK | https://autobuild.buildroot.org/results/f710a489f9cec03493d225a4b3f7e2321d02ff39 |     
powerpc64le  |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/de2c64464fcd5f927ea02bf351864fb29992b41b |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/62368f166ab30f6d51f613929ea28e2acbf8bfb0 |     
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/4bccda9323e7f54da803e3be9d0d80ffaab43d4f |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
