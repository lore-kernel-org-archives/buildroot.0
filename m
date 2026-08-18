Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E47AC5DF67
	for <buildroot@archiver.kernel.org>; Tue, 18 Aug 2026 03:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE8A14073D;
	Tue, 18 Aug 2026 03:23:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lWaBClH0n8Aj; Tue, 18 Aug 2026 03:23:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 896C240711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787023432;
	bh=iXfhMs7VmgmyPB3j23FHAge7+IHCqM4o88zBOVmw4s8=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VaHyJh1emAlMSVGMhzRIIvJVc52Ek4BG55HBHnQT+VmBKZtFRcDUBi3Vps7A7JgDe
	 oFtm1vOH7+3WP1t/Lqy21mii1rB3uRuOmSIoWDfCuvE88ceAh9xd6Q5kIrKFKYcsJA
	 0g3bSxK1JYh+4YMU+iMOmmLV1EGlDq9y/gdqpu9kngaGLNeRiws0UjOVUqjB5yzqD4
	 nP7B5XmPlnIViZ4AqY0pmNnURKsm6RFcU1at17pCCWslGJIaLknjA6SdVIerXeXmeE
	 otMIldbx1jprHylOupiuPYmVIUoAvYzYyKWP8sD5EHJn70aCo6R3GIniCxF5IiWOk7
	 V5xXimx1e1zFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 896C240711;
	Tue, 18 Aug 2026 03:23:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C808F194
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 03:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9BD260763
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 03:23:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AQ0RE95qPrDx for <buildroot@buildroot.org>;
 Tue, 18 Aug 2026 03:23:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 39D526065E
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39D526065E
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ruhRj1ww
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39D526065E
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 03:23:48 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-47f84023916so3912285f8f.3
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 20:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787023427; x=1787628227; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=t+d+ZkmvWPsyxP39F3kILhufAeIchG2a562ViYCIsJI=;
 b=ruhRj1wwYlwipQLf7KRRPweHAm0UjRAvNKddzgEOXa+RWSVrWb7P2ycq0wXP8KgPGT
 G10LUQuMcsM0NzjxH3Ze4l8UPMAcDFAprkDjvNWC9iH1ykyQQ7sWcITrNU6aE8U4HQ1w
 ANaFtqo33Y61JEfQwvVPmFlhgr1AS8Ue+S6I06pAWTeeIdTD9QoKrj6Z2MIZYUrFC9pn
 xLJPvVyJcseHBIcXkLf4nOmATH8srvtcWH6eoHSeik3FN1I0Oqrk5eVe2ClnQHFsjddT
 kAjUWDT93nkBPxVX/1wLEDxcBVpWO7WQHe+ZqPOK4oT0Qps+0ws3wN3mUOps0spggKi2
 Xw/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787023427; x=1787628227;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=t+d+ZkmvWPsyxP39F3kILhufAeIchG2a562ViYCIsJI=;
 b=s9kUg0/D5gjc1clbrrl4ULA5ckfOe+34PwHSlnXprlRxTyS1F6YwjX7sMIMjWBIwzT
 K4YzkKM2bfb5l+x46JAHrLcxaKGc+NTFRgk1VaYq5GhK5KRStTpq//FsuY2af93iMCrT
 6zqmwvAq0qSGSFP8TtFrAeoR88VdoluYhs46CSgb4NGaHLsAcz7FlisHquX61YdkZnvU
 5BHxojmo6G2D5DHJxq77ABXgMEAQon8JKOQi3Imia1iYx/1dcpSmVwdhryGEClxyHq0T
 Dk5QNdBivHAenYW8rywzrOCo0AjoNfeM3+lWGVSpJvSn/OmVTCeMpTCoZoJamTiYd0t0
 I/zw==
X-Gm-Message-State: AOJu0YyjQGYafN4qkK05N0tVe8PfFTOd2VN6URgFN1+1uCFrzD1K6yrj
 2M/drZzuScFVkku0SuvdvrECJcinc55ogwH/tClj4Xnoqdbton8bb2OpoUj+odq/
X-Gm-Gg: AR+sD13iHEU9/4vPw59ulUOrKhlgX+pOVdTMDRkTHTjPLhA0JQ2lRcJ69l6P/grerKU
 DFQGQ6RHoOq4AyY+NRmc2W1gpddlxnF47z3IkmFdNBlZpkRTj/2RM8v6LcCLVEEfecmHOZwSv7N
 Adv/A04MQCHPe3MxOikzzevnBBBAzVqKNtx82pRYwb1LMSk7/gpyfcbxxiFIOw8wfiwNVBDY3Qo
 yr2V/CJIUbPwkS3mQCnHiK6dIYl4ekCj7uGnEeBlZS6NWanqVKL9fb7k51cfSY+gXfcZRnaER3z
 hZdKCCOPJitMejhk4bQQL4kpdYm+b91eng+YbPf1z1wEZY3s61NCwk3bJHVYDN/UNVZgq4WEigr
 6qk5iXaca2wRsGKxW4wEFv5k/+FQQ/W+GmOVSBepPvkPePzM2nXuNV6gMduGIE1Orko9d8y0fQj
 rwsmSSsxTc2WTWHaDELIcMEUOZppqD3iylOICqdDW7ZLepzlt/AbyQw4P0k+dcdU8=
X-Received: by 2002:a5d:5482:0:b0:482:a36c:a5e1 with SMTP id
 ffacd0b85a97d-482a905b0a1mr6424789f8f.1.1787023426445; 
 Mon, 17 Aug 2026 20:23:46 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5b783c6sm9193268f8f.31.2026.08.17.20.23.45
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2026 20:23:45 -0700 (PDT)
Message-ID: <6a83d041.c69142e7.3bbcad.13b4@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 18 Aug 2026 03:23:45 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-08-17
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

Autobuild statistics for 2026-08-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 10  | 24  |  0  | 34  |
  2026.02.x  |  0  |  7  |  0  |  7  |
  2026.05.x  |  4  | 12  |  0  | 16  |
    master   | 57  | 241 |  2  | 300 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 14
               host-dracut-112 | 8 
              jpeg-turbo-3.2.0 | 7 
                   perl-5.42.3 | 7 
                    attr-2.6.0 | 6 
            host-gauche-0.9.12 | 6 
               libgpiod2-2.3.1 | 6 
        edk2-edk2-stable202602 | 5 
host-google-breakpad-f49c2f... | 5 
                    olsr-0.9.8 | 5 
                  ffmpeg-6.1.5 | 4 
  gobject-introspection-1.86.0 | 4 
                host-odb-2.4.0 | 4 
                  iozone-3.508 | 4 
               libecoli-0.11.3 | 4 
          libmicrohttpd-1.0.10 | 4 
               linux-pam-1.7.2 | 4 
                  readline-8.3 | 4 
             alsa-lib-1.2.16.1 | 3 
                   atop-2.13.0 | 3 
             dahdi-linux-3.3.0 | 3 
                   dante-1.4.4 | 3 
            gdk-pixbuf-2.42.12 | 3 
host-am335x-pru-package-5f3... | 3 
libesmtp-v1.1.0-14-g335ee8d... | 3 
          linux-5.10.254-cip72 | 3 
   openvmtools-11.3.5-18557794 | 3 
                       unknown | 3 
          usb_modeswitch-2.6.2 | 3 
            18xx-ti-utils-R8.8 | 2 
                enscript-1.6.6 | 2 
                    flex-2.6.4 | 2 
    host-gcc-bare-metal-16.2.0 | 2 
         host-gcc-final-14.4.0 | 2 
       host-gcc-initial-16.2.0 | 2 
                 host-gdb-15.2 | 2 
                     host-rust | 2 
              host-rust-1.97.1 | 2 
      libabseil-cpp-20260107.1 | 2 
                   linux-7.1.8 | 2 
                   linux-tools | 2 
               openblas-0.3.34 | 2 
package/vim/vim.mk:88: host... | 2 
                  prboom-2.5.0 | 2 
                 rtl_433-25.02 | 2 
                 rtptools-1.22 | 2 
               tcf-agent-1.8.0 | 2 
uhttpd-15346de8d3ba42200249... | 2 
               valgrind-3.26.0 | 2 
                 xenomai-3.2.5 | 2 
                     bc-1.08.2 | 1 
             bfscripts-3.9.7-1 | 1 
                   bird-2.15.1 | 1 
                   ccrypt-1.11 | 1 
          cloudflared-2026.6.1 | 1 
             containerd-2.0.11 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
                   dbus-1.16.2 | 1 
      docker-cli-buildx-0.25.0 | 1 
docker-credential-acr-env-0... | 1 
edid-decode-6f117a8f8c0e76e... | 1 
                    ficl-3.065 | 1 
       freeradius-server-3.2.8 | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/tar/tar.mk:38: /home/aut... | 1 
               gocryptfs-2.3.2 | 1 
                     gzip-1.14 | 1 
                 hidapi-0.15.0 | 1 
            host-binutils-2.44 | 1 
          host-faketime-0.9.12 | 1 
       host-gcc-initial-14.4.0 | 1 
            host-go-src-1.26.5 | 1 
    host-mender-artifact-4.4.1 | 1 
       host-xorriso-1.5.4.pl02 | 1 
            igd2-for-linux-2.2 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
                     kbd-2.9.0 | 1 
                 lcdproc-0.5.9 | 1 
                libcurl-8.21.0 | 1 
               libepoxy-1.5.10 | 1 
                libmpeg2-0.5.1 | 1 
               liboping-1.10.0 | 1 
                libsoup3-3.6.6 | 1 
            libunistring-1.4.2 | 1 
                 liburing-2.12 | 1 
                libyang-3.13.6 | 1 
        linux-headers-6.12.103 | 1 
         linux-headers-6.6.151 | 1 
        ltp-testsuite-20260529 | 1 
          lua-lunix-20220331-1 | 1 
              mariadb-10.11.18 | 1 
                    ncmpc-0.52 | 1 
                   nqptp-1.2.4 | 1 
                  ntp-4.2.8p18 | 1 
               nushell-0.108.0 | 1 
                 openmpi-4.1.8 | 1 
                    opus-1.6.1 | 1 
package/vim/vim.mk:87: vim-... | 1 
      passt-2025_06_11.0293c6f | 1 
               pax-utils-1.3.7 | 1 
               pcsc-lite-2.1.0 | 1 
          pkcs11-helper-1.31.0 | 1 
rtl8192eu-9664b2bfc4bcba55c... | 1 
rtl8812au-aircrack-ng-c3fb8... | 1 
rtl8821cu-7f63a9da2e8ed8340... | 1 
rtmpdump-6f6bb1353fc84f4cc3... | 1 
        s6-linux-utils-2.6.2.1 | 1 
                    sbctl-0.18 | 1 
                  swipl-10.0.2 | 1 
                  sysprof-49.0 | 1 
toolchain-external-bootlin-... | 1 
                tpm2-tss-4.1.3 | 1 
           uboot-tools-2026.07 | 1 
                 uclibc-1.0.59 | 1 
                  uftrace-0.14 | 1 
wilc-driver-2fe5db970acc0c0... | 1 
                     yq-4.49.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/3a85ef442e25751fb609bab4e37ab2e9507c24c1 |     
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/87f5db189e0b4239e4e717106f33a2a7ab3238f3 |     
powerpc64le  |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/3586b3545f816b0acf8102394b1310bd2e2a9138 |     
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/e09eb7a26fc9970d9908736ff257d727002ea7d5 |     
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/8b39c6aa72ecf8461be1bf6521bfb42106c4b9a1 |     
    i686     |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/0962d950d109bd83c951967d084d5c9eb4f80192 |     
    i686     |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/bd7aba0afba40a005b9e6ee4ea3afb1623c37e2c |     
    i686     |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/7e62dfa659b38a9785041ecd8071c6420a91a1c4 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/fd3ef8ec26adb1b0d6c94a62f0a39278dc7eb06e |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/dacd014d68110414112dece6ddcaa03aba034a65 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/23b7a50a599b797d78df80f96fb4cd992635530a |     
  mips64el   |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/738ee0f5366c411442a0c956e300e39076b56558 |     
  riscv64    |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/ca0b946b70848b107b19a067ff47f7568185e528 |     
    i586     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/efc75b61a11b8f35842af4937e93c332f3fd9173 |     
    arm      |           bc-1.08.2            | NOK | https://autobuild.buildroot.org/results/21a08a9496b508cef6882a95c4a6bd11c8762b10 |     
    arm      |       bfscripts-3.9.7-1        | NOK | https://autobuild.buildroot.org/results/e29afba092ab5b4deb4cbe835a1f55c5317316b6 |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/35d1f8374e843b6199633ecd58f24de0545527f8 |     
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/9788a270c7477d05ff4493fb857a86b3056ec06c | ORPH
    i686     |      cloudflared-2026.6.1      | NOK | https://autobuild.buildroot.org/results/6982f5695afe90e2878aadd91e438caf0d546b21 |     
    arm      |       containerd-2.0.11        | NOK | https://autobuild.buildroot.org/results/041770b8c988ca048839a998462e7a41377aa7ee |     
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/7b2365cbf54265d2364aa45347c45597fb94ea4f |     
loongarch64  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0cffb88f4266cd2666ad6132ee9cc4ad39347fea | ORPH
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/02958e40a5c532625f4c02887dbc8d6ba62d86eb | ORPH
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/6c6f72eb8887a80d2edef478c497edee35dc6b3e | ORPH
    i586     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/84fba1b1f8345555a473c162d949c025ac4a4899 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/764a1c4277d6d44bc0e2f8043f7ea7c1e79ee0ab | ORPH
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/b70ee25be7f288a227c9c1be45879a3219f122aa | ORPH
   sparc     |          dbus-1.16.2           | NOK | https://autobuild.buildroot.org/results/8a6edaefe57e6979c15ae593320cb0ed84eb1530 | ORPH
powerpc64le  |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/6a0c91c4271de01ea3150ce1f46b1a31f13b98cd | ORPH
    i686     | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/1635f4b5d2308c6169447002431c456f216552bf |     
    i686     | edid-decode-6f117a8f8c0e76e... | NOK | https://autobuild.buildroot.org/results/bdd269038b1a707dde17a6684ab04470ad2def2e | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/52a6006433321be15b438978e649a7ccea9afb57 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/1a4c5b719d3f135bb80b9c27ce0b826d8deee263 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/b63569c23b7fe12f253b880a758edb973300f786 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/9382f107e5f78a798720f34cf146142a6de190be |     
    i586     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/f8fbc4b6774c30124b2fd8dd9adb6dc756e52727 |     
    i686     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/2bdf76ef51374d68c83932a6a64efa42caad473c | ORPH
  riscv64    |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/1a5abf95cdab99602d0142c6c0960de1d92cb3e2 | ORPH
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/7f762f38653dd9efad659abc79b3658e16d5a2d7 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/b3d8584cff3ef8df58fce6293a2121fe33b30e2f |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/e5971314240478a800879e062c09f6f915d23150 |     
powerpc64le  |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/c11578e4ef0732107ae7ca9cb5fa078d9c08628a |     
    m68k     |           ficl-3.065           | NOK | https://autobuild.buildroot.org/results/9a53730521ff7b7b25e3c32f3c92cee20ccb94c8 |     
    i686     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/723ff5962d927eb7a7d41efade497f7648e1edfd | ORPH
    i686     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/3851f55f854a77e64a07f8eea23d0c028e2056e5 | ORPH
    i686     |    freeradius-server-3.2.8     | NOK | https://autobuild.buildroot.org/results/8ce40e1f9fa0da1d8efe16d35f07cd14cfc53f93 |     
    i686     | fs/ext2/ext2.mk:65: /home/a... | NOK | https://autobuild.buildroot.org/results/30a3987fda37eb1027f8f899a3e6941bdd3246a8 |     
loongarch64  | fs/tar/tar.mk:38: /home/aut... | NOK | https://autobuild.buildroot.org/results/ae2d498833e6a352287ff3c238f2d02eb3fe7275 |     
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/27dfed8c58acfa0ad8a8153dd7cff348760847df | ORPH
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/dacf2a33187eb36513a646b4928c7054a7931d7a | ORPH
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/2a3c307b0b34176c36943b8aa7858fb33669198f | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/5537a66f8d4f4e2d854654fdec5580191115886c | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/d174b557d4c93bbca421277256cd93e83dc2a10a | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/e8e51ef542caae64d11af77b7b660249356e04a3 | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/c409c3a00209778efc6ff055708fd321d8cf0e9f | ORPH
    i686     |        gocryptfs-2.3.2         | NOK | https://autobuild.buildroot.org/results/b16d7c97d9c43d79698e3d65be3e3afc312c097e |     
    i686     |           gzip-1.14            | NOK | https://autobuild.buildroot.org/results/b6b6a5ffdc3e53065c6c9f59b0587675dffef795 | ORPH
    i686     |         hidapi-0.15.0          | NOK | https://autobuild.buildroot.org/results/2435626f8cce2c7c1a58ad8c8720eadf3e49c867 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/a2052faaf5543bec8a86cc4cbab0abc9eec91460 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/46fd8dcd21e76903a48e616b9c37bca0ae38d7bd |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/3527a96dfdcc4dbb25e76e7a3af9af5d707c2abc |     
powerpc64le  |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/85fbb33101f1675b80653331122e3ae19b84484b |     
    i686     |        host-dracut-112         | NOK | https://autobuild.buildroot.org/results/8b180ce59788ac139e161a99967f0579b9b523a9 |     
  riscv64    |        host-dracut-112         | NOK | https://autobuild.buildroot.org/results/dd4b26ded2e742229a321e17caf55c4dd8b22eaa |     
  mips64el   |        host-dracut-112         | NOK | https://autobuild.buildroot.org/results/e14b0580cb9a4c3b9aeccabb6d1724edd3fc0f87 |     
    i586     |        host-dracut-112         | NOK | https://autobuild.buildroot.org/results/3def7011d55afb02f1ab92cdf1bd540c3f1eb6a7 |     
    arc      |        host-dracut-112         | NOK | https://autobuild.buildroot.org/results/58a8410826e553aa40e9929d5c5fd350c51e89e2 |     
    i686     |        host-dracut-112         | NOK | https://autobuild.buildroot.org/results/93f862682df424c097e236e2b4ae0f314408eec7 |     
    i686     |        host-dracut-112         | NOK | https://autobuild.buildroot.org/results/c68bdf25a99788bd6b7deb3afce120b04d1a3b10 |     
   x86_64    |        host-dracut-112         | NOK | https://autobuild.buildroot.org/results/5ea97c1205e5a47ffd38a5e8cc46967659dbc0e5 |     
    i586     |      host-faketime-0.9.12      | NOK | https://autobuild.buildroot.org/results/814a7825d5c3ed37cce2c1cdd89a30d195467a3d | ORPH
    i686     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/d4fc587555909276ffb381e2ba00d207691716a4 |     
    i686     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/9a9c9b2dd04b85e992dbdc6b78a68a629126b5d3 |     
    i686     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/3d66435fd321eb1adc2e1cec21a2d1577a0c4e5f |     
    i686     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/c18728a7e7a8d7df136de367377665df53b4d053 |     
    i686     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/3ef16de0b8bc92020e75ddb2a3536af39f1b322e |     
    i686     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/e8db7f407112f7610fb3b230775ca302b76e4e63 |     
    i686     |   host-gcc-bare-metal-16.2.0   | NOK | https://autobuild.buildroot.org/results/fa7e566780eea854deb49963ffead5717186fa1b |     
 microblaze  |   host-gcc-bare-metal-16.2.0   | NOK | https://autobuild.buildroot.org/results/b22cdb89d495edfe57c83553e3a549d28c453e54 |     
    i686     |     host-gcc-final-14.4.0      | NOK | https://autobuild.buildroot.org/results/f1736b6b99eccbc638c817202b16ecb5e5639d20 |     
    i686     |     host-gcc-final-14.4.0      | NOK | https://autobuild.buildroot.org/results/b9b348c8a90a9f7aa775c8cef8b787bb6e06d438 |     
    mips     |    host-gcc-initial-14.4.0     | NOK | https://autobuild.buildroot.org/results/907b91e0fff03b18ff6d10e17212b5ec1d9ebb09 |     
    i686     |    host-gcc-initial-16.2.0     | NOK | https://autobuild.buildroot.org/results/be79381e27b3ebfe2f3a7d0d09042859e7d16187 |     
    i686     |    host-gcc-initial-16.2.0     | NOK | https://autobuild.buildroot.org/results/70198d208c15b0aaa6a27f1a54050dd1daf38a2c |     
    i686     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/59084e827fb0963cebe18e216c0e2e3b60d3f651 | ORPH
  aarch64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/5bc2ec529792e1817fc3b090494ad807585949f8 | ORPH
    i686     |       host-go-src-1.26.5       | NOK | https://autobuild.buildroot.org/results/afe844771c7a19ac36fe3f2f0380c7b4719f2370 |     
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bf46752d703aefa8f51d518c812300ec978922a5 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/60a7495c1a57de0f3de071e7ef74f97f73f06595 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f386e81617296038962c480d536384832e8a21c4 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/11c024fcf08b52e95e14850d879859b67e34fcba | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2b20f61ce079998b8b784875af0d69ac5b433b6c | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bfac3c11393462926651bc496447198de2ff1cd1 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1c9070e76f0d05e1fff98ee89756a469be2a7b24 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4c6b2287676072c6acf337fe5f2299d303360b93 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d309c42d2bf0fd1b57e14d43d27826ad880e0e53 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3d7aa99f102b79599ff487777bf69bfacb0544a8 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fd67ec71a1f565e115ec7558466012be4b4c0f4e | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/80d43ec6680752354da228ceea1d1dc9cbf9adcc | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4baf9fe4d35843e385427bede574d625fea5816e | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/94cb6976b7ef7bb26badb7b75c159afd6e80417f | ORPH
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/b15f312a52e366314bf864b107b049a58c43ef84 |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/0de2d6aa77399f487dc6d1995ec920832f54a4ca |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/5c9431c943e9bfd7d656317f46749edbef42e48d |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/4aa1efda0eb80354753b8a444c51d88765a8ca50 |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/1ba9591e4270d173a821b48436232ca5f8191759 |     
  mips64el   |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/2a41114214645ec2675dc5aa6cfaeb3b7ff10b05 |     
  mips64el   |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/f1fab7adfc7b6410521e775b36b370e225ea5b0e | ORPH
   mipsel    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/e1026a5270aeb98d255183b3d854c241a68d82ff | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/f22aad144c9b92713a4c68894798c24359774ebe | ORPH
microblazeel |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/5025fb4bc56e41462c997de60fec57b6516342ef | ORPH
powerpc64le  |           host-rust            | TIM | https://autobuild.buildroot.org/results/77a4ee52ab15b424a033ef8937c76626126c4dc9 |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/ddd5abccf068a895ab91c87805e07f3da107313f |     
  aarch64    |        host-rust-1.97.1        | NOK | https://autobuild.buildroot.org/results/8f4ba252e0af500dc52ba36693f22621e93181eb |     
   x86_64    |        host-rust-1.97.1        | NOK | https://autobuild.buildroot.org/results/5b1837f6adfb8e069fe866312838b1beb3c6a014 |     
    i686     |    host-xorriso-1.5.4.pl02     | NOK | https://autobuild.buildroot.org/results/d6beb96f0d8b0ed86af49b7ca7102729819bc60d |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/4eb8e76abe9a81006f2ea518703aa903c1b46348 |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/547f511d85be5e005f2985f9a46825f830de20ba |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/69cca5626dd5a617472599759724d03f3058328d |     
   armeb     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/c741abb596e1b95bcad7a7eceab94f9c7bfd2321 |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/f17cbb4da49203d71ce1d99b32c6ed541951679f |     
  aarch64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/66c3cc98bbeadfb7d17424c93c20b74748e42cd3 |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/c5678c37c3d8155aeb0c8c967b7708b4cbfe3629 |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/9aed271f9c6e33f6428f2a9242665fb31af366e6 |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/430b66c40fc5683060b217e7fe90b885d4457339 |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/ea368b1ff3584f3368dbf1f4e12d3d926ddd3f39 |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/82d2bdef219f0d2f7c1a9ac2ce53398941b8abc0 |     
powerpc64le  |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/476a9764d7d998cf11faade8f4b559f8ba2804dd |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/7373fa1448eb325f84c2db0ca2fc434b455cc011 |     
    i686     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/01b3c456965fc5f218a3c100fedf9f3a2fdcf8fa | ORPH
    i686     |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/2e3f9c75cc91bbf7d9853afbbca0ad4d276ab571 | ORPH
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/2375d1604691c97abaea2236c17b003534eae3f3 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/3d0186aae9be554139ac4cb5eb64b57c393d1d85 |     
loongarch64  |         libcurl-8.21.0         | NOK | https://autobuild.buildroot.org/results/88da527ab432b67221b7c4e3eb112ce40b9418ae |     
    i686     |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/dfd0c26e883ab05ca69e254c7f29fb9c75dcde88 |     
    i686     |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/d17d99785033419dc578d97bd85c2c7085ffc264 |     
    arm      |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/72c15c1596a7f4830c30ccc185000e5365d0be13 |     
    i686     |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/73fccb7d83b1cec8cec3a33053f7847c48fc9de6 |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/b1b7335756e1e4354a2bc2ba91b971202ceed88b |     
   s390x     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/b9c0f3c96a83e0a80f181593ebdeb4df6a3f67b7 | ORPH
  riscv64    | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/34d4cccf4cb0b20b6cfa844fc7260e12192d8e7a | ORPH
   x86_64    | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/24ff2ab042895c8c2cadfc226ab6145383dd6825 | ORPH
    i686     |        libgpiod2-2.3.1         | NOK | https://autobuild.buildroot.org/results/f01b5840fcf86236ae8083683ccd47081c7d8e42 |     
    i686     |        libgpiod2-2.3.1         | NOK | https://autobuild.buildroot.org/results/484b1d84621a95d60f634483c03e9f95552e999a |     
    i686     |        libgpiod2-2.3.1         | NOK | https://autobuild.buildroot.org/results/2113b69e40d20b812485f70963fea4eff61bc42d |     
    i686     |        libgpiod2-2.3.1         | NOK | https://autobuild.buildroot.org/results/ab6afcc412abad94a3ca2bd0617ebabb37f499f0 |     
  riscv64    |        libgpiod2-2.3.1         | NOK | https://autobuild.buildroot.org/results/f3251b3ce19e4424151526e79563de3388a7f868 |     
    i686     |        libgpiod2-2.3.1         | NOK | https://autobuild.buildroot.org/results/da9eaaeed37da06a3d2892d07b80b973d118797a |     
    i686     |      libmicrohttpd-1.0.10      | NOK | https://autobuild.buildroot.org/results/b7f13a0253cf664e04067f66aac51af33b08e4e1 |     
    i686     |      libmicrohttpd-1.0.10      | NOK | https://autobuild.buildroot.org/results/958518775920c816407f2b38022e1dff6f558bb4 |     
    i686     |      libmicrohttpd-1.0.10      | NOK | https://autobuild.buildroot.org/results/c118b6a28ee66f6a290c1ef9e857bce1f63b9646 |     
    i686     |      libmicrohttpd-1.0.10      | NOK | https://autobuild.buildroot.org/results/8347c5596874d1b981631f9d1b0be87c8d7dd76d |     
    i586     |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/d3ae7bf87a7db60e6cc78afe72eae9aeae240200 | ORPH
    i686     |        liboping-1.10.0         | NOK | https://autobuild.buildroot.org/results/0a13e1a3d29f116d3b1cfbd13e8ada782d35fa89 |     
    i686     |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/fe90711381caad34c3474746f1db2f289cb60fe3 |     
    i686     |       libunistring-1.4.2       | NOK | https://autobuild.buildroot.org/results/25d35c315ef173ff3d2733ae14a0825f9d0957fb |     
  riscv64    |         liburing-2.12          | NOK | https://autobuild.buildroot.org/results/525ebc044c7d63d6edfa36172499ffe77e83fb1f |     
    i686     |         libyang-3.13.6         | NOK | https://autobuild.buildroot.org/results/137957a7fb51bcaf5dfc7663d38d9c6c9aa413b5 |     
powerpc64le  |      linux-5.10.254-cip72      | NOK | https://autobuild.buildroot.org/results/d7707030506174195a87652f4b576352bcfa02ce | ORPH
  mips64el   |      linux-5.10.254-cip72      | NOK | https://autobuild.buildroot.org/results/d024f23fdf7844a9996365e72824f5cb2be93ce0 | ORPH
    hppa     |      linux-5.10.254-cip72      | NOK | https://autobuild.buildroot.org/results/6add87f805a05cc503756a711f3d2d933d4a1eca | ORPH
    i686     |          linux-7.1.8           | NOK | https://autobuild.buildroot.org/results/bd123c6ab9c99adee56ebb5bda95e09ba5a8d640 | ORPH
    i686     |          linux-7.1.8           | NOK | https://autobuild.buildroot.org/results/1771b7ea9ebe818ac8df6834bdc8f97209bf1bd0 | ORPH
    i686     |     linux-headers-6.12.103     | NOK | https://autobuild.buildroot.org/results/c4a988faf384842f198cda26af71a0a29ee93e1f | ORPH
    arm      |     linux-headers-6.6.151      | NOK | https://autobuild.buildroot.org/results/429b51a4840ef48f16768399ee008274b6143230 | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/309cd41f1fc7c412c16e1ab88e3ff6c64bdaefad | ORPH
  riscv64    |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/bc529e707b5f48ec01a0d5dec8129a0878c9c4c3 | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/8e15eaf507ee1fba71f69e48c00ed17fd5541538 | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/cb4b96940844e86bdea59d12c0c8f65f96b64922 | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/29730dfa1e96564a7ab30e9ab692c2769514cbf3 | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/ca3bb428ccfb4a4c6f6ed60c6a62520ec9f59886 | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/91c213d8ee698ef8914515fdcc56ffaf0d55de93 |     
    i686     |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/6cddeb2108580864deb9ee524b1c39e9ee1f62d0 |     
    i586     |        mariadb-10.11.18        | NOK | https://autobuild.buildroot.org/results/973d590c65008b1ab3bf52dcfef8fa0bec98ff67 | ORPH
    i686     |           ncmpc-0.52           | NOK | https://autobuild.buildroot.org/results/43f38c5bfe6699dc0f1522c2896017d62cfc878e |     
    i686     |          nqptp-1.2.4           | NOK | https://autobuild.buildroot.org/results/d2df888356517fa3754901880bb2eea310b7d2e5 |     
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/21ddb63ec1bffc655d7132e8c30d31b8538fedb8 |     
  sparc64    |        nushell-0.108.0         | NOK | https://autobuild.buildroot.org/results/22c7887b439c7ac19b8efe00cacb76d8aed7c7de | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/cbda176b247fd314ad4cbd63007ca20c08ca9aa1 | ORPH
    mips     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/e1948eed6d6bec02eb0907c632fa569809110c6d | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/dbdbb5c0a6975650e59b2c57fa7534b861d45a36 | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/5d18648c4f45b12ef90fcaa6f3e1270d1f54be84 | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/bee455a22cf8e7688f44498f7d05247a2b635c08 | ORPH
  riscv64    |        openblas-0.3.34         | NOK | https://autobuild.buildroot.org/results/a527caedf22c1d723fafcf7a5b36f4ee616b5c81 |     
    i686     |        openblas-0.3.34         | NOK | https://autobuild.buildroot.org/results/7ce0e7084975ed224073bb51572f533975305880 |     
    i686     |         openmpi-4.1.8          | NOK | https://autobuild.buildroot.org/results/b0d69e520f9eebfef884e3bd50858e597816d1cf |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/9af216e9d34b297490eea584c68a2f608b3baca1 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/89c20583cd1150548e02310aba9621d00c073676 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/c4f5818aa2cd241499dfa0b03c4fec6c365ccb86 |     
    arm      |           opus-1.6.1           | NOK | https://autobuild.buildroot.org/results/9e478ddbe351499f0cf0d1b01339f7136df38e16 |     
  aarch64    | package/vim/vim.mk:87: vim-... | NOK | https://autobuild.buildroot.org/results/a8fa1452bd30f2b368c258954400f5a7d9a25264 |     
    i686     | package/vim/vim.mk:88: host... | NOK | https://autobuild.buildroot.org/results/f3eb10096e22bbcbda102eb7d5aa00893fdd3abd |     
    i686     | package/vim/vim.mk:88: host... | NOK | https://autobuild.buildroot.org/results/3f7108777c99f65268360ccb4ad970c126bd467b |     
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/73a812c4a39988c884293992557764fc946d393c | ORPH
    i686     |        pax-utils-1.3.7         | NOK | https://autobuild.buildroot.org/results/5194aca7ec252af24f44e6fe8532e0fd81dc96e1 | ORPH
    i686     |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/fbba65b1e65d3cf3da0c1e18e26847afd0c38c9b | ORPH
powerpc64le  |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/192c80bf9bc140ba46d1a58fbb36db3a1100d6f1 |     
    arm      |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/fe403f6d556af3b4eefcdfa200384eab5a976f5d |     
  riscv64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/c41870d92606450182401f517e6396d6d0a42641 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/71ce98ced11aee6c4c60af8117ef7564a849b340 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/9014547b47d9d35da19fe6be364f141948d44a9b |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/81e2eb207ea0d2aa9b4a4a6a8a76d28d94147f89 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/30d47ec2e708beb5446edbd0243feaa535ccfaa5 |     
    i686     |      pkcs11-helper-1.31.0      | NOK | https://autobuild.buildroot.org/results/ba0d25caf756ab8d6193f383b8ebd30ee23ca1b5 | ORPH
powerpc64le  |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/a5ce5e5df735d7b29838c8af845189834aa8c599 | ORPH
    i686     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/5a5f88177c9a69c7d5bcda03b208a610fa559f4f | ORPH
    i686     |          readline-8.3          | NOK | https://autobuild.buildroot.org/results/625ee9c05b7c3a521e9a52d1c852f647b4daf3af | ORPH
    i686     |          readline-8.3          | NOK | https://autobuild.buildroot.org/results/40cbb3666226e7a7818e62f479661a78405a066c | ORPH
    i586     |          readline-8.3          | NOK | https://autobuild.buildroot.org/results/e96af57cb0e0ab2abd0314005c3e89352984d662 | ORPH
    mips     |          readline-8.3          | NOK | https://autobuild.buildroot.org/results/94cbe344b81c035ca2e3bcaac5358e6e8fdb2eab | ORPH
    hppa     | rtl8192eu-9664b2bfc4bcba55c... | NOK | https://autobuild.buildroot.org/results/6c7d85fcdb33dfee6e5ac0cb71cdf6c42d0c59a5 |     
    arm      | rtl8812au-aircrack-ng-c3fb8... | NOK | https://autobuild.buildroot.org/results/623d4fce1f0a3be98d93722f05d97c7c85ccc60c |     
    i686     | rtl8821cu-7f63a9da2e8ed8340... | NOK | https://autobuild.buildroot.org/results/188cd766c2ece6349a33292f4e97a0702eb2a9c9 |     
    i686     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/91993c35a7c7c36f94c9dc970fbb9af693524714 |     
   x86_64    |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/750751cd272765bfee0da4cc18a74af6377a3fac |     
    i686     | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/fb7c2d1126e85b8974a2c2fa40ad5f129a37de48 |     
    i686     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/7ca997ef0abd6e59ae6f5e5899dae0c3ffa2a82d | ORPH
    i686     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/80da7fcaba7b41f1e09cea93475d9dc71ab768e2 | ORPH
    i686     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/0afb2e9b717b6f6b4385105a274c4c0adb2cd0fb |     
  mips64el   |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/f07fa4c7f9c30982ce2b91e156a2f3491e7493c5 | ORPH
    i686     |          swipl-10.0.2          | NOK | https://autobuild.buildroot.org/results/175346d5437cbd6c2c459fb90e6f79169b5348ee |     
    i686     |          sysprof-49.0          | NOK | https://autobuild.buildroot.org/results/e817dc901cf3e96c84042290a05957194fe139e4 |     
powerpc64le  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/81da283c438df3cf02433d4b857f211dcf8f0bd6 |     
 powerpc64   |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/c99a4820faf59d32c70cada6545c5e6692375244 |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/cebf21c3a57bbd7f56a775e31ec99befaabf058d | ORPH
    i686     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/67c5ae935941fadba5940be88634e5bacae2725a | ORPH
    i686     |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/43a21c119c12082ece4d0f0c96c3bcc62de17ae6 | ORPH
  powerpc    |         uclibc-1.0.59          | NOK | https://autobuild.buildroot.org/results/46448883b1682718aeff066d204349d8e9a3b1d1 |     
    i686     |          uftrace-0.14          | NOK | https://autobuild.buildroot.org/results/218e2737b284fa6b595de6db9e0f70cc83beb25c | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/303383c8097f34305d9c34fc2b701a3f30264113 | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/2e5324b4e449bf0943ade6d763c6dd6366d0e333 | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/b523f4c1b00bbdef5b6d6b1d5637a5e740945c55 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/5defda94d9c17e56f30ee89127171292c0c22e51 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/7745ec124a7f9a02d2746192d5c9a288aac8a483 |     
    i586     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/ef82bb9ccb690305adb0accb4ea5e1bbdb535739 | ORPH
    i686     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/26454f862a20aa640b45f137cf82f82cdf13f33f | ORPH
    i686     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/3f8b03d4d1396021a276d6441e58b5158f53b4f7 | ORPH
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/861e5b2cd3465a188db88bf24ebc20eac65b42ba | ORPH
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/523eaa857d30f3cc2dfdb352da9c77e38ea61c4d | ORPH
    i686     | wilc-driver-2fe5db970acc0c0... | NOK | https://autobuild.buildroot.org/results/6662d3ed65a727b28542f7ca8edd65843fc44827 |     
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/609ccfbfce34ea03f01534afd4a411e60012b1c6 |     
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/9d2ba01259b40f46f1ed070fd689dbc7544ab1dd |     
    i686     |           yq-4.49.2            | NOK | https://autobuild.buildroot.org/results/50cdb3a6ccf733661c7c6ea5e8739dc0df3deca5 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

                   perl-5.42.3 | 3 
                  ffmpeg-6.1.5 | 1 
  gobject-introspection-1.84.0 | 1 
               host-dracut-110 | 1 
              host-rust-1.96.1 | 1 
kismet-52bcb902e36b2df1562c... | 1 
                  ntp-4.2.8p18 | 1 
           oath-toolkit-2.6.14 | 1 
                 openmpi-4.1.8 | 1 
               tcf-agent-1.8.0 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/dd54258d8e8459c45c462fad92adea660c11b570 |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/f2ec9eeb3e9fb72480ead9a12cad21ad8ca4c5da | ORPH
    i586     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/92570d2d8365c62db96b801f1788d835130dfe2c |     
   x86_64    |        host-rust-1.96.1        | NOK | https://autobuild.buildroot.org/results/75c0ac249cec43d9947cb25071179840031d2254 |     
    i686     | kismet-52bcb902e36b2df1562c... | NOK | https://autobuild.buildroot.org/results/e58f942866381ca888aceda6bde9d0499f5afadf | ORPH
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/1a0fd4d36b2124716f20e358cf51d77feafeacd7 |     
    i686     |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/2d41be500f9112090897ec343013c6b66c7a174d |     
    i686     |         openmpi-4.1.8          | NOK | https://autobuild.buildroot.org/results/068f4c61c355afa1de99a793ca82f032cd049a0f |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/ee9afeb3fb0c7d99a496dde5bdb9e1dde96e52dc |     
  aarch64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/82d1dc785bf8ee303809d6eb0948d53043909422 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/dbd4c9c727ddb2f3250febf4c4dc9fe512dfd42d |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/d175079d5d2013e857ed7577795efc3cc6736515 |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

             bubblewrap-0.11.2 | 1 
              erlang-26.2.5.15 | 1 
           libatomic_ops-7.8.4 | 1 
                    olsr-0.9.8 | 1 
                openssh-10.2p1 | 1 
uhttpd-15346de8d3ba42200249... | 1 
                       unknown | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |       bubblewrap-0.11.2        | NOK | https://autobuild.buildroot.org/results/180adeeba11db0df08b95a4b4db8093e7bcbb20e |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/1472bf9ec8233fcb9702b93c7454635b944334af |     
  aarch64    |      libatomic_ops-7.8.4       | NOK | https://autobuild.buildroot.org/results/ab2d7e5d0b975aa2103e3ae5b283042094ca1b44 | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/6484c3b4b0bfdc6faf236ead2be187ab0f8ea840 | ORPH
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/b0da7cd35b6b0b0b3d7d818ecc70b15f8ff71bfb | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/27273bfdf2731ae48463d81f296e027fa8da6f1b | ORPH
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/4b72577dca88d9e4f26aed21c263b3ce8721bcfe |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

    host-gcc-bare-metal-14.3.0 | 6 
                  ffmpeg-6.1.5 | 3 
                    azmq-1.0.3 | 1 
                   cli11-2.3.2 | 1 
  gobject-introspection-1.82.0 | 1 
                haproxy-2.6.27 | 1 
                 libzlib-1.3.2 | 1 
                 logsurfer-1.8 | 1 
                memtest86-7.20 | 1 
                  mender-3.5.3 | 1 
           oath-toolkit-2.6.12 | 1 
                 openssh-9.9p2 | 1 
                  pdmenu-1.3.6 | 1 
                   perl-5.40.5 | 1 
           php-memcached-3.2.0 | 1 
                     pound-4.8 | 1 
toolchain-external-bootlin-... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/afe7eac2c6be87c0e73ec937c67be8ba4a7d6de4 |     
    i686     |          cli11-2.3.2           | NOK | https://autobuild.buildroot.org/results/2fdb01de262f5e2c29042783d06e09d366513337 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/8e0f96a7da96e106356320172fb6b47d0b78920d |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/77967c9f180381c66f6bbc151edda3807955b2fc |     
   arceb     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/de1763e356d28a792bae736c1e3a2612065bb881 |     
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/3072457f255924a8629617f513f2399dd3531c45 | ORPH
    i686     |         haproxy-2.6.27         | NOK | https://autobuild.buildroot.org/results/faf9433c86cbd023ed08e074db88136ba23c67da |     
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/503a864df7ce0b0e48714782afb1bb0f8ed85529 |     
  mips64el   |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/57b243ff23c8c491d441335eaa0ac3e7b08dcfd2 |     
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/c9d00bfedc3474c16bccec8b61e06b8b90ad3fe1 |     
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/a186c7fef56305296f1e98d3f642b9095405d49d |     
    i586     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/8cc4dc0e1b4d9f8258fb0c5fef90169cfa51776c |     
  aarch64    |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/f2d47924a4351976ce0e0d2fe3e9b2b7390f4afb |     
    or1k     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/aa11037f5ec27656a75b88379ceedceb45375edb | ORPH
    i686     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/298af544aa204b2d81172ed43bd490adcd0e2783 |     
    i586     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/7bc06ab6ec48c4dc605f7a1206507862437b0b95 |     
  riscv64    |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/5041e55d1e389c5b805a64a20b46fa159381fb9e |     
  riscv64    |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/b77667a33eefd097d1827cd72e4cdc25b0e38235 |     
   mips64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/f0120dce04e0fe56228c4d514c7ba26c305ef00d | ORPH
    i686     |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/2f7b5209dfd7f2a31e10847e42bfe9e62cad4d4e |     
   x86_64    |          perl-5.40.5           | NOK | https://autobuild.buildroot.org/results/2a445d88df6fb78cb31c84e5e66d9085a5090dfb |     
    i686     |      php-memcached-3.2.0       | NOK | https://autobuild.buildroot.org/results/03216bc85e30681fb404fa15897aee6c9f93c7ee | ORPH
powerpc64le  |           pound-4.8            | NOK | https://autobuild.buildroot.org/results/677ff07202e1c495ed7e3eee7522a3d0b0bccb95 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/fddf073c09f87ab2deea57c4d71d7021702baa38 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
