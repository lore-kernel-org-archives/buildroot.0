Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95117CD98D2
	for <buildroot@archiver.kernel.org>; Sat, 13 Jun 2026 03:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 243D461444;
	Sat, 13 Jun 2026 03:19:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nEJEGtHuO3wy; Sat, 13 Jun 2026 03:19:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2D1461443
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781320783;
	bh=xDUumAwDBy3Lwkb14d3ffJHeDFAT80C+T21TasIrBvo=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YRazEEhB6x6YNdshRe6hTRb0rZ9O1FwmJbENfMFER3wA0wpkK5Rr9WXuMQFvrSMtm
	 8l7E9er+o2FpB207b+2+JVHEKy7jtsDivFqGAeYIN39S5W+ZkhrBY9G4SKa4q6+0Nq
	 F8dkOmdm9GODOCKZR1ESj7OIeXf/1PHW4nFacNeFBgz9r2wbhtkNYz7aeL5LO+9xwF
	 D8fDHCe1d+Rz4PHe1y+ztvnvxoScTqguuaDbfxrDte8w8xGhKIjPT0yA4gX1Mhciue
	 rd0SzZ3jCp5+PS7fxMvOCxLnpJXqbJ3J4AToy93uAxTH4WD7vW1CvIyQh8XWyVvIDU
	 ML17807urbsjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2D1461443;
	Sat, 13 Jun 2026 03:19:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 18459DE
 for <buildroot@buildroot.org>; Sat, 13 Jun 2026 03:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2A9961445
 for <buildroot@buildroot.org>; Sat, 13 Jun 2026 03:19:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A8B-cNcP0xgg for <buildroot@buildroot.org>;
 Sat, 13 Jun 2026 03:19:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 45C5F61442
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45C5F61442
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 45C5F61442
 for <buildroot@buildroot.org>; Sat, 13 Jun 2026 03:19:39 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-490cf3000f0so16249915e9.1
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 20:19:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781320777; x=1781925577;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zz4Fj64VWfV0E241tF4b2SULzHjY0yUS2+OIp6PDqSA=;
 b=Mfj3dnj0IcSckgI2Z1Fg+jsttc7K2D4VbBfVXdYnzOhYLOEyrZUM3xhB9nUKEwS6q4
 pv9QGlXmg5Sy65RQb94uKLbZWyN+Mser6I2TRy2lD7jdULm/qAa82gYqHV11k1rkZoud
 txguZfDiE/8QN8TopDTsrEoyq9LIImwrLr5YDi1gRbWepOx50vwtQgYU/Mvg6PvnFiOq
 DKrb9PU0xiQN0ll6MOhLz0DJIjfA+Xc/LdCPNdwR5r6vKJO+1gW5Z2NZWVKxPP5g5UTc
 QG/hVv6dlh3B4SCMfsZk74ZaP6V7KbnI0HhXDss+xh/UlyBV6CqQBAPH+nHEGIlrdr2H
 ZFKg==
X-Gm-Message-State: AOJu0YwLOpdjhhz1q24tTSj6XaBIVPVgYZgEu6rBzjlwQQFpB29paDwt
 PX3yrWOPUp9hk1BmkiI2RizOjNR9GnWRXANhtdm/CyiLWTX9xt9XPOEYec/j3SJa
X-Gm-Gg: Acq92OHAV+VXdCYfQzHk+XFA4lQvfJWQ2G1XPodr3EmDKuRI+6cqH+akm7QVEkGJrqM
 omsvrdyKmwA7I/NL5KCUTEtUUl4InkS8KhjKM83u+NJQqwri3jHSg0GiHIZiLK9iI8XoKYKRNN8
 pi2egQsQatLayVEwJkQsD4nCJF+9T/pjhohCGAqOTqLMHUkS6VOvJRTzjPfeFzG0AC6fHfPrarF
 qX0rieD4HcxL8my4ALgdz4KEB7QKDh8PkZ3Uho0N949OszAuA5+N6QO/kyjTyyNY6HKkpZK7Ft2
 2EAWWWAoppcxK3hjVlTUh6GvNNwGeLTQQh5keLnADRzEfNe3hxO0wPCQoAL0t0N2jJwa6f/w9mh
 vGbN3rHCYuq8yEEQRmsdWHg8zNK5eINpP5O4KhFs0D++cg9TeghG7ij6jAORETNtFtkBlpNT9hb
 gCYwv5m3H/DaQml7MOx3vZuG7U6A==
X-Received: by 2002:a05:600c:c3cd:20b0:490:d3ef:fa4a with SMTP id
 5b1f17b1804b1-490ec4ea4f1mr51195995e9.14.1781320776387; 
 Fri, 12 Jun 2026 20:19:36 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492203d08bcsm36496695e9.13.2026.06.12.20.19.35
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 20:19:35 -0700 (PDT)
Message-ID: <6a2ccc47.a0eaf6fb.843d0.d744@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 13 Jun 2026 03:19:35 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781320777; x=1781925577; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Zz4Fj64VWfV0E241tF4b2SULzHjY0yUS2+OIp6PDqSA=;
 b=rcagYjUaSwWVGKZR8ZU6m8cT71YHfg6clP+P8rBkFhCoieOFoE/JDAfs6rIyfNMAKO
 K/lc4ne8gMnWC+8CPGSqzxVWdPmVGl5qasnJa7Fp+Xq9Dw8/2LOFzjPqD+5s3rL5JEHf
 3/BQOXnwmiKJhYfcbwmH6YYbixtJyTuwA+zxhYyy0EAJYaUMioSglvWwEpSkynQqqkf7
 Ts/vK/rO/PmwAp/7l0jEqywSbY3ZUaQ1odEl7qEmoIux6uHT/G3OkQrKA445zaLzK/TK
 4ZYOdo0bIBl9rzdHpk2Rzzu4Y6X5sCH9pecFho6LvwOPWA3C68jupUTTbYhf4jlSvy91
 RmKA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=rcagYjUa
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-06-12
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

Autobuild statistics for 2026-06-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 16  | 32  |  0  | 48  |
  2026.02.x  |  4  |  8  |  0  | 12  |
    master   | 84  | 310 |  0  | 394 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 32
                host-odb-2.4.0 | 16
               host-dracut-110 | 13
                       unknown | 8 
            18xx-ti-utils-R8.8 | 6 
              host-guile-3.0.9 | 6 
                    olsr-0.9.8 | 6 
                   perl-5.42.2 | 6 
                 gnupg2-2.5.20 | 5 
       host-gcc-initial-15.2.0 | 5 
       host-gcc-initial-16.1.0 | 5 
host-google-breakpad-f49c2f... | 5 
host-vboot-utils-7dfa482d6a... | 5 
                 uclibc-1.0.58 | 5 
amazon-ecr-credential-helpe... | 4 
             dahdi-linux-3.3.0 | 4 
                   dante-1.4.4 | 4 
            gdk-pixbuf-2.42.12 | 4 
                    grub2-2.14 | 4 
          host-binutils-2.45.1 | 4 
              host-pahole-1.28 | 4 
                  linux-7.0.11 | 4 
            minizip-zlib-1.3.1 | 4 
               tcf-agent-1.8.0 | 4 
am33x-cm3-fb484c5e54f2e31cf... | 3 
              erlang-26.2.5.15 | 3 
          host-xfsprogs-6.19.0 | 3 
                   i2pd-2.59.0 | 3 
            igd2-for-linux-2.2 | 3 
libfutils-c326ce0cc2a735438... | 3 
                  pdmenu-1.3.6 | 3 
                 rtptools-1.22 | 3 
                 sudo-1.9.17p2 | 3 
                 systemd-258.7 | 3 
               alsa-lib-1.2.16 | 2 
                     bc-1.08.2 | 2 
                   ccrypt-1.11 | 2 
          cloudflared-2025.8.1 | 2 
glibc-2.43-27-g4070d808bea1... | 2 
  gobject-introspection-1.84.0 | 2 
host-am335x-pru-package-5f3... | 2 
            host-binutils-2.44 | 2 
              host-bison-3.8.2 | 2 
            host-go-src-1.26.3 | 2 
      libabseil-cpp-20260107.1 | 2 
                 libavif-1.4.1 | 2 
           libmicrohttpd-1.0.5 | 2 
                libmpeg2-0.5.1 | 2 
     linux-5.10.254-cip72-rt32 | 2 
          lua-lunix-20220331-1 | 2 
                  ntp-4.2.8p18 | 2 
 qcom-db410c-firmware-1034.2.1 | 2 
              shellinabox-2.20 | 2 
       sp-oops-extract-0.0.7-1 | 2 
                    szip-2.1.1 | 2 
                tpm2-tss-4.1.3 | 2 
                     apr-1.7.6 | 1 
             berkeleydb-5.3.28 | 1 
                  bind-9.18.49 | 1 
                  boinc-8.2.11 | 1 
                bpftool-v7.5.0 | 1 
           crucible-2025.05.28 | 1 
             docker-cli-28.3.3 | 1 
      docker-cli-buildx-0.25.0 | 1 
                easydbus-0.1.0 | 1 
        edk2-edk2-stable202602 | 1 
                enscript-1.6.6 | 1 
              execline-2.9.6.1 | 1 
                  ffmpeg-6.1.5 | 1 
                      fio-3.42 | 1 
                    flex-2.6.4 | 1 
               freeipmi-1.6.18 | 1 
fs/btrfs/btrfs.mk:55: /home... | 1 
fs/cloop/cloop.mk:33: /home... | 1 
fs/f2fs/f2fs.mk:64: /home/a... | 1 
fs/oci/oci.mk:105: /home/au... | 1 
               gocryptfs-2.3.2 | 1 
                     grep-3.12 | 1 
                       gsl-2.8 | 1 
                   gvfs-1.57.2 | 1 
            host-autoconf-2.73 | 1 
    host-gcc-bare-metal-15.2.0 | 1 
       host-gcc-initial-14.3.0 | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-17.1 | 1 
                host-gzip-1.14 | 1 
    host-mender-artifact-4.2.0 | 1 
              host-rust-1.96.0 | 1 
         host-ti-cgt-pru-2.3.3 | 1 
       host-xorriso-1.5.4.pl02 | 1 
                   iotools-1.8 | 1 
                iproute2-7.0.0 | 1 
                  janet-1.41.2 | 1 
                     kbd-2.9.0 | 1 
     kvm-unit-tests-2025-06-05 | 1 
   libcdio-paranoia-10.2+2.0.2 | 1 
         libdisplay-info-0.3.0 | 1 
               libdvbcsa-1.1.0 | 1 
                 libiconv-1.19 | 1 
                  libnfs-6.0.2 | 1 
              libopenssl-3.6.3 | 1 
              libsodium-1.0.22 | 1 
libuci-f3fc0b76040685829191... | 1 
                 libv4l-1.32.0 | 1 
               libxmlrpc-r3335 | 1 
       linux-firmware-20260519 | 1 
               linux-pam-1.7.2 | 1 
        ltp-testsuite-20260529 | 1 
                moarvm-2024.12 | 1 
                     mtd-2.3.1 | 1 
                   ncftp-3.3.0 | 1 
                    ne10-1.2.1 | 1 
                netdata-1.37.1 | 1 
                 openmpi-4.1.8 | 1 
                openocd-0.12.0 | 1 
   openvmtools-11.3.5-18557794 | 1 
                    opus-1.6.1 | 1 
               pcsc-lite-2.1.0 | 1 
               pulseaudio-17.0 | 1 
       python-tpm2-pytss-2.3.0 | 1 
rtl8812au-aircrack-ng-c3fb8... | 1 
              tailscale-1.78.1 | 1 
                      tar-1.35 | 1 
uhttpd-15346de8d3ba42200249... | 1 
ulog-0389d243352255f6182326... | 1 
waffle-v1.8.0-95-g5f1f48287... | 1 
   webrtc-audio-processing-1.3 | 1 
                 xenomai-3.2.5 | 1 
                 zabbix-7.2.13 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/05068a0b6d8aedb4cc283ee3d6ace6eb7663793b |     
    arm      |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/1363f201f3aa05b2ab4e2b6a521f974b7f089e73 |     
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/8c507814921aae0d3394775f70e68da0d11c4de6 |     
   x86_64    |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/4b2976d58f29b6418c24e30032a15578db92d875 |     
    arm      |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/165ecac0af4f741785ca53c6f1e62c19a455e1e4 |     
  riscv64    |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/d5bba4cab6c5de4b1df9819c05399e50e2265e88 |     
    i686     |        alsa-lib-1.2.16         | NOK | https://autobuild.buildroot.org/results/ff8b9234c7d25ca3b536564c8bdc60d2d3274128 |     
    i686     |        alsa-lib-1.2.16         | NOK | https://autobuild.buildroot.org/results/d3c382a016fcfa2c8fcdfa76de5b5f3f3f181d59 |     
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/ba3f72cd04e62abbac4e0bbc462da40bd8f47720 | ORPH
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/8a2ad9c353013f1b1e92ec24632f1b0a346b4782 | ORPH
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/b9be2a1fc3739ed6963f9f82612867d359e38890 | ORPH
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/2cc997265fdee5dcd1a4cdc54f9ea39074b9ba5f | ORPH
powerpc64le  | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/eedfc46c7c1ebcc70db9b383f26175212e3e1801 | ORPH
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/f0f9d605f7f11e079580f626bfa07d8ad78f5ff4 | ORPH
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/0319e0522304dfb27b644f0bb51106f7c6456aad | ORPH
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/0068a0cd6698b36193a7307c18c854ff6ef601c7 |     
    i686     |           bc-1.08.2            | NOK | https://autobuild.buildroot.org/results/0be1c56023f854ac7d1e59a12fc1ae9fa8c45156 |     
    i686     |           bc-1.08.2            | NOK | https://autobuild.buildroot.org/results/a3dc07e21f0bc1a2ca53c81ad28d38a0bdf14ceb |     
    or1k     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/8e6305001bb056600e3707d87031ba71528aa6f3 | ORPH
    i586     |          bind-9.18.49          | NOK | https://autobuild.buildroot.org/results/0c16789e37c506874b585d2a93c5cab7a5b4c1d9 |     
    i686     |          boinc-8.2.11          | NOK | https://autobuild.buildroot.org/results/1c2ba1679650cc5278c1a195e92570f9d48588cf |     
    i686     |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/fd7c3127a6456cd4953696af144b347fc3ae45ff |     
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/95889598f7acd68d21a4bb5daf9bbefd0296a237 | ORPH
  riscv64    |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/c4aced35ec02945b93b629528f9ee3e9968523fc | ORPH
    i686     |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/a1200eb42579a4c776d193741060f9c1fea8ca38 |     
    i686     |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/af16fcf1196dee1dd4f8ee743c398ca3a40dde78 |     
  riscv64    |      crucible-2025.05.28       | NOK | https://autobuild.buildroot.org/results/547aaf51828ad3dcaf4bc853f057902862be3d11 |     
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/31b6935e9f4f4e0bcc0d7ab0a356e02f93388519 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a1137fe88b6bfa5faeb07c03ef97cc63d3648eb1 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/3e403fe6fad561362fde06d146d82c0400d3493e | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/35186467956ccc4c93d24f65e7b726480368df6e | ORPH
    i586     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/ca0fc99cd9604c1c7631410e6010278496656a53 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/0f100ca0044bcce549ddc257fb888d9b4f46710f | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/c2d06bf99d91a1c7588f11cda5a7dad1f4972b44 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/5dc6d2af6b528deb20e4dca2a7a1115fa850b9fd | ORPH
    i686     |       docker-cli-28.3.3        | NOK | https://autobuild.buildroot.org/results/3976024c12e850266ffbfbe3c8f8682eb62060bf |     
    i686     |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/8174d68a918572b2955b04a4cdd998e0dd046421 | ORPH
    i686     |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/bdf89b8539e54b4fd7f8c883e3c64ba84656dd52 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/d317a3de150dadc94de15856164c665a9fe3eb33 |     
    i686     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/26627ca298b0557da351bcbf344f1ae5369c585c | ORPH
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/a1b0a6f39e2e5aaa6102d99b338aca9232d815ff |     
    i586     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/54e11a3d84e6544b6128f653a1c63486c732a395 |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/8b30bcdfd61429aad1817a739dd4153e66a98ee5 |     
    i686     |        execline-2.9.6.1        | NOK | https://autobuild.buildroot.org/results/852b3b345698cf1d1151fe9985058dff1762db78 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/05968b5abed932b966fe06a36abcea7cad67e39a |     
    i686     |            fio-3.42            | NOK | https://autobuild.buildroot.org/results/1bd699f8b3b2b704a08435785e7e3771385f7830 |     
    i686     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/e2b369b91e6c14f44b044001756d9b2994499cb2 | ORPH
    i686     |        freeipmi-1.6.18         | NOK | https://autobuild.buildroot.org/results/5e68ab8faa9d08051a58eb5d7ed6d435d6e7302c |     
    i686     | fs/btrfs/btrfs.mk:55: /home... | NOK | https://autobuild.buildroot.org/results/44ebd38ca2ac937d95663507f9663bb53cc4e0d8 |     
   sparc     | fs/cloop/cloop.mk:33: /home... | NOK | https://autobuild.buildroot.org/results/e10d34a95571c090b38670f772347ef7a326a53e |     
  riscv64    | fs/f2fs/f2fs.mk:64: /home/a... | NOK | https://autobuild.buildroot.org/results/f63a7e58bb2df54554e1e27651389cedea097b99 |     
    i686     | fs/oci/oci.mk:105: /home/au... | NOK | https://autobuild.buildroot.org/results/cf1129ebb1f7af6a77a78b488e0059b550f915f1 |     
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/4d143a22125928d48f68f390fead4ca9a7cafeba | ORPH
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/4b2444576d8d3802abdd2a3735b5e7a77c6963bc | ORPH
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/f3b1f64c296b8746d96e3d7616a87285847c043d | ORPH
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/48ef4ace97ae89264471de2212d6017340c63ec6 | ORPH
  mips64el   | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/d195ce0140e7f43e21e31fe71789f6bfb39e6b95 |     
  mips64el   | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/dc785e60c40f0e7ef2034f6d11bd802323b4b4a9 |     
  mips64el   |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/c1372f48d1b538c1676b24be88c71d51b650cc9e |     
powerpc64le  |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/87c341177dd86f3571effedbad28beeaf784cd69 |     
  mips64el   |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/30f41fd0ec75f85c8c92771172bf39d234c8276b |     
  riscv64    |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/e30f5c67b97e8cb2c4312785ae163843d448c101 |     
    i686     |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/25f8921efad40af5188b3fbd3575d060ef3aa1d4 |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/de120225ef81616fb5e4e3b85cbacf930f86f308 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/3ff6590e93a16fc1ed6cfc6fa39f44577bebfe49 | ORPH
    i686     |        gocryptfs-2.3.2         | NOK | https://autobuild.buildroot.org/results/b1cffe8a83455d8b5d7bb05f6d619cd6d347eb44 |     
    i686     |           grep-3.12            | NOK | https://autobuild.buildroot.org/results/8398b2efa4185b99909ca078eed7ce64248205a7 |     
    i686     |           grub2-2.14           | NOK | https://autobuild.buildroot.org/results/7d50a2914c5e603622bd065f325999ded7c1f57a |     
    i686     |           grub2-2.14           | NOK | https://autobuild.buildroot.org/results/d5af06de81f9073fb8d2f33604ba1c6da73d3606 |     
    i686     |           grub2-2.14           | NOK | https://autobuild.buildroot.org/results/664589a142a7bb92150c493bb587db0f2ea2de52 |     
    i686     |           grub2-2.14           | NOK | https://autobuild.buildroot.org/results/d94911744a9faef26bb5bb86836fc48061cdf929 |     
    i686     |            gsl-2.8             | NOK | https://autobuild.buildroot.org/results/29c265c87f7e2e18a043ff8c243a70126156c5cb | ORPH
    i686     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/a86168ab64775a82ddbd64ee0c64c17f8b4294b8 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/9a07e4c8fc82382983cafc06e916276d3fabb4e4 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/6a87c479600e47272349e62daa3ee5fbb9a819f7 |     
  riscv64    |       host-autoconf-2.73       | NOK | https://autobuild.buildroot.org/results/80551f4ca3d1c1a0dcf496cb4fb5d0b7d0d80beb | ORPH
  riscv64    |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/771e16376dd709c7fa4db390155124c2da787062 |     
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/410e9b28a10d4f7dfbaa9b5796bd6b82320241f1 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/72a31495278b2288aa139776bce9581597c1c2c7 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/f5382e3873439ac8a459d9d8057e4c382ea5dd20 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/409389a196a6bee0f3098a566335d9192aa6001c |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/0ce2f3b8d3783f36b0f506fee177182468e4c065 |     
    i686     |        host-bison-3.8.2        | NOK | https://autobuild.buildroot.org/results/ad4911bf5f95196299da4ff330bb125e054b4dd4 | ORPH
    i686     |        host-bison-3.8.2        | NOK | https://autobuild.buildroot.org/results/9e38c178caac5cb020b7a42fbb54a5aea9993792 | ORPH
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/5473adbc1ded6450e5a2c455cb125b110e1a97d6 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/2d5f26af4ebf64abdc5ac44d5b355af3969046b8 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/8e7790af7089c82d1043c371cc80585e3e0eac12 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/6a1bdc995a3d523be2a9a85f52fe9e9ac1a85a8c |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/82ada829a382d82adcacb50f8a274bb3ac1c3433 |     
    i586     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/49b6787618bc2a1557ba49ad331036ea16159600 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/30eadf6632d1ed465118e9f7f9e5f0707627a622 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/eeba123e98b1999f3c7b58bfb0f6ab91a5eee2aa |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/868af77577df9c0c2ecc5ff661bf68a7931b559d |     
   sparc     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/7cfb776269e9e75b749327fac68fc396b275cb3d |     
   x86_64    |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/3c73ac897366d5bba6d2b522552f469883c14087 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/a0ef1ae0ea159ab4c1b82118e3bb6a7b88504023 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/b7740b2d50f0c05a9ce86297ed6a4769fb8cea3d |     
    i686     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/a2d1cf47431b236071cc7263f948fb19ab29c435 |     
 powerpc64   |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/a905ab1d388fb10eb600ccb05e27f14de59fa88c |     
    i686     |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/664da5601b5942996500cb44b1b6ed8e824732a3 |     
    i686     |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/0aacd8f849a19a58fcdb0d5c1073459c46973894 |     
    i686     |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/3e8babff0819c24af08a715a2e32f8e815e9f074 |     
    i686     |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/e06f462872ca6744d04f8f8783f30d0102225659 |     
    i686     |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/ce1d10b2dcdcbbb615e9eedd5d7f6113b09b37a9 |     
    i686     |    host-gcc-initial-16.1.0     | NOK | https://autobuild.buildroot.org/results/988605c2dc8746b199d959c7dae24d28bb4cf7c5 |     
    i686     |    host-gcc-initial-16.1.0     | NOK | https://autobuild.buildroot.org/results/88f738ad5f90f59034f09d4141c5f78effcd9239 |     
    i686     |    host-gcc-initial-16.1.0     | NOK | https://autobuild.buildroot.org/results/6466c0f62adc5a8b904ee440a05e54b5741d933b |     
    i686     |    host-gcc-initial-16.1.0     | NOK | https://autobuild.buildroot.org/results/384ca9fd6561134faf87bd804bf616537b821012 |     
   x86_64    |    host-gcc-initial-16.1.0     | NOK | https://autobuild.buildroot.org/results/9ca2a979353f4d7c635a4e883ed6dbff283d552f |     
    i686     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/3b659ea7d5d32679977f1234a6dca7697cd35c41 | ORPH
   armeb     |         host-gdb-17.1          | NOK | https://autobuild.buildroot.org/results/363d889aa62043f38bd551187cba2d8b1e2e06ac | ORPH
    i586     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/cf6e3d9f5ae9b313454c82cef759aa69ba54190a |     
    i586     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/0411e9487224350b0c69aa144f6065193b4c3da6 |     
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/19b3dca45c41aa7d8453f582e2c96009ea751ba2 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ce5eced29d7b07a0900ef7f6f4c17ac92bd58fe5 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/09300224ed69f98d8938d15689698fddacec7247 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5165b05cb639d0775cbca40f23a94e892ef95c90 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/19a5078c2683ee13ef042b3a8fbaeb706bd2c075 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/616331e3150831ff2eba6e1e9147305b5a86299a | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c7aa2d3d43a4804f863f51cf3345a83e56992954 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/dc401319294dd0dc05debb5f155cc745509052c7 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e4d6764105d72b6ea5738bbb457ba1fcf104246d | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/619b5f2f310000de25d651bd6e287210e8ee361b | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3ece1953fdce72ef81afe9e08f75c8197744202c | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8b077d8b209888d7e151d601fd9f2123f55edfe7 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d86784e7c59359416fb271a29f5a1cb1f1cac0a7 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/dc43878cd3c1f0744d79d887a1f1f3fe146251b3 | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f4e5113d3c8af17d83e9ed7d1149c776d66b0b5a | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/080cba05168abfba148be4abc4c96dcaa7c6fa6c | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ac31d2a2f919581f4bda8e24ae697571c5a79708 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3656678dfe6ba2aa9bcd8ce004a86de9a45c3731 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/27df73c2ba6c731794150e980036b856bfaf1c11 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/92f388d7deb5d12ef6450fdcf745dd5a7e1a796d | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/baaf2f771be39a7a934a6a3a3dbbf4862813dcff | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/85159157c89364dde3059b686c32c8fc63eddbe2 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/557725b992302f35bec3bc773252752a180379b2 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/97e71aa607492d356c2b1c137eac4aaf45ec6ca0 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6aba376098ab31202ad941a92bcb5bb79d0bb6ef | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/116e2966583393579cc91d49d298ca9f9f7d90bd | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2a30a531510285963ef86af9d865eed4e1768307 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6494a8e3b925cc2fde80e581f88911abe8c48546 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/362634f4f6553f08df8f8238302f863e37961ba5 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3c5d1186967edb984c21dbca06ed066591b23a25 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/aa90b77f2d356cbd1da7f55fdb272bfab17c3ce8 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f20b9b7ca135af0e781ae859dc838c81a0c8d6c7 | ORPH
  aarch64    | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/26f4050136d61dc9e46f344f5e4a3fda4562dfba |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/516dc845f94491bc0d8b61f0b1ca45f6417940d8 |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/33bc4ccca7ef134d7f4f628ddac11bd403ae7537 |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/14558ae254993a54e4d32380cb437263a0e2f6d9 |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/cf1a8e681c9fc98151c27db94b993fce307adf2c |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/8cb15123388cfc070199370e619f95e91bbc94ce |     
  aarch64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/b6c17fa0edee49263319e37ec3ba4537f9c8cfbb |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/035f252770cca5672f18a559d82df749f6a290a6 |     
  aarch64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/61a1e563c6c37072601c5ddd66c13c31ba52bb0b |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/3aa8e47d2ed90a08795ffdff390af987482c8592 |     
    i586     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/3202e1418bc3df1b503d144a1bec54fa8b78ae6b |     
    i686     |         host-gzip-1.14         | NOK | https://autobuild.buildroot.org/results/77d80fdbbb9484631c230817b38d1f4c7ff300e1 | ORPH
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/a9cee855ac96f235244338bcc188854e18719f36 |     
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/f275ff2b076188408732189ba54e566947c153dd | ORPH
powerpc64le  |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/50f1db129d94be28f53e60c5885147a6a18f80e4 | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/3cacb6df600399b2d697059f09b2949b8f6e0b8e | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/5c38b29e0241f47d5c74635198646834119bfee5 | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/d0ca00acca2cffc4063aaebaf27989746f5044e9 | ORPH
   x86_64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/02216250a7777c9b5ebe4c014a0d093450d27da0 | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/ac97bb26a06cb094eb00381ae042b556cf6f2351 | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/e2398863dbac17f05a40f196a6a794a05bc0eda9 | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/1c40db989828d34e76a9c5dde849987a4112d36a | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/592bf58d8adbe18a5c1dedaf956b745232ada356 | ORPH
  riscv64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/02107949d831d6664791a4c504fe990e6b5d9874 | ORPH
    arm      |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/cadf0ef8e735b9ed13ea1f355e10a11d9518dd9c | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/deb1524ee77a07b45dbb34cab0ea70584ff2a1f2 | ORPH
powerpc64le  |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/23b62ec72118ee5bf149ad7f78de84d3643fca07 | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/632cde0bc804f0df0e9854deece5042cf4f6533f | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/a5f70e354060ae7f0b5810d456dc915d25d84298 | ORPH
   xtensa    |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/e01012f6d6b9b89bf1132c9a48403bc8d80e1c23 |     
  riscv64    |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/0d399d863af1743b9de98b4f0ce42781a270daec |     
  mips64el   |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/25915c4d78d9ae5e91809a0bbbdd14e660b8ba03 |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/15134e9a011e020d722040e4db7d5b484e3870a0 |     
   x86_64    |        host-rust-1.96.0        | NOK | https://autobuild.buildroot.org/results/ee0e72a321ed19cedd579d04650a3171d8ea47dd |     
    arm      |     host-ti-cgt-pru-2.3.3      | NOK | https://autobuild.buildroot.org/results/eb85262bb119b7b56f5831674c66953e6084d5fc |     
powerpc64le  | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/b68ca47fe033ffac07690fdbaa1efefe8c9685c9 |     
    i686     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/53b77341caa1ec7beb6ce4b43c0a428fe94b2f8b |     
    i686     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/9f5c1b1e36501ac50eb83f327e6b252b76690dce |     
    i686     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/298fa65c39812918e5a3fc1b5c219c340eb24bc8 |     
powerpc64le  | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/1d55999878c9019ce7b09ea10ec3784223f2ae91 |     
    i686     |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/9b3bc1393b612925800ec3389b2f0ae045e7b8f0 | ORPH
powerpc64le  |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/ab5692615943fcc76163d371d1f068d7ea5a5348 | ORPH
   s390x     |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/30e3d93638a4caa32f15b65d3b39df601d4fa903 | ORPH
  aarch64    |    host-xorriso-1.5.4.pl02     | NOK | https://autobuild.buildroot.org/results/c81db7192b1d19ba64cd4efff1d7ce20dacb09d7 |     
  mips64el   |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/a454cfbc35fe2b23931762061e0d1c4877699997 |     
    i686     |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/5e1c4f9e4542d5537b73cf86e35213a78999cf73 |     
    i686     |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/d23a5933ae99299efb814aca15cbd821f8dde749 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/02424f2cc525dcdaef381d0bce98be0b8db294ef |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/90b6cdee1a22f54cf64617f4c5aac0057cf979ae |     
    arm      |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/08d5e72590b0934c334e55a2f063f80ce7dbbe3d |     
powerpc64le  |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/086bab043dd5740c566135a5ccfe9b1278617e84 |     
   mipsel    |         iproute2-7.0.0         | NOK | https://autobuild.buildroot.org/results/647e99d1c146a446e12c64886ca22349e08f3b3d |     
   xtensa    |          janet-1.41.2          | NOK | https://autobuild.buildroot.org/results/bde7cd44e94972fdba084529576621ff2cabda70 |     
   x86_64    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/b460fa3e71d7f751215de0490e9e953fe2e12ac8 | ORPH
  riscv64    |   kvm-unit-tests-2025-06-05    | NOK | https://autobuild.buildroot.org/results/2f650b31b8722a3a75806bac3dae798088059dab |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/fcb4211a01b87d3ef355f31a1ddb804a42bdd502 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/b5511f091cedadbfbba94435d40fdc06e592ec91 |     
    i686     |         libavif-1.4.1          | NOK | https://autobuild.buildroot.org/results/11cd71fa8ee887250d3b238cd78fe9018e8097be |     
   mips64    |         libavif-1.4.1          | NOK | https://autobuild.buildroot.org/results/0dd988e4e9223f1d3d1db9415c4102b9be6cf7ba |     
    i586     |  libcdio-paranoia-10.2+2.0.2   | NOK | https://autobuild.buildroot.org/results/59c46fde31929c1b4415f54c57953dae3b35b1c8 |     
  riscv64    |     libdisplay-info-0.3.0      | NOK | https://autobuild.buildroot.org/results/8b097c6e1000635871d22ec3b0bdbbfacae73423 |     
   xtensa    |        libdvbcsa-1.1.0         | NOK | https://autobuild.buildroot.org/results/e170ed86818629a4396c8e7f2000bc11fadfd34f |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/cbc84db71d2834d4f1d3cf6009008bd3c1f7ca34 |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/e8dfb6642f1503842068b10da3bafae07f0402d7 |     
powerpc64le  | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/dcf54cef4e7fe41ac656da36d900d075963f9644 |     
   sparc     |         libiconv-1.19          | NOK | https://autobuild.buildroot.org/results/1669374a5bdcb8e33f0e84757051cf45a6d9537e | ORPH
    i686     |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/10dbf724b2d51742b3a4b4bf9b7f7b5f95fc4a26 |     
  aarch64    |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/2135d7a7215a696dd656827b55a68616f50dba68 |     
    i586     |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/83dc41eb82fb41a84c04b78cabbac58f448a5535 | ORPH
powerpc64le  |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/6f3a45e159c2c1fed9168df7bbb9908f7c584828 | ORPH
  riscv64    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/60884975a73773a6b1c4bbae6c1b5fea326e6460 | ORPH
  riscv64    |        libopenssl-3.6.3        | NOK | https://autobuild.buildroot.org/results/01edd19be9fcfbae9cf8ba23e4107e30704389d8 | ORPH
  mips64el   |        libsodium-1.0.22        | NOK | https://autobuild.buildroot.org/results/d95805cb6c061d26d9275adab36e5c94b067c86d |     
    i686     | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/9e55ad152b64636e6a241ab66317ee54a4ab1bf1 |     
  aarch64    |         libv4l-1.32.0          | NOK | https://autobuild.buildroot.org/results/7ce52d2be0cb114f765f73e3c975aa2b1a48117e |     
powerpc64le  |        libxmlrpc-r3335         | NOK | https://autobuild.buildroot.org/results/7b20368bf767da7aecaacf7042b66b0c7ef5a684 |     
  mips64el   |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/142395810ac7953c529af03374ea524ae71e8997 | ORPH
powerpc64le  |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/bee33acf65ae548314a3d57857063711a2ac78d1 | ORPH
    i686     |          linux-7.0.11          | NOK | https://autobuild.buildroot.org/results/9bd628a989a7c1b29cb59e7ca33fc4c63c2d41d2 | ORPH
    i686     |          linux-7.0.11          | NOK | https://autobuild.buildroot.org/results/bc962176f17c4d8a5cd9131c391bbd4dc1ac87b3 | ORPH
    i686     |          linux-7.0.11          | NOK | https://autobuild.buildroot.org/results/e901e7f9aba7cc08159b02dd31866c7979d3a2cb | ORPH
    i686     |          linux-7.0.11          | NOK | https://autobuild.buildroot.org/results/561990e1c55a8d42eac3c648c642cae6f8fe1c2d | ORPH
   x86_64    |    linux-firmware-20260519     | NOK | https://autobuild.buildroot.org/results/5b03b5206741a2a7d2e51dd0b6b2830e4485ff10 |     
   x86_64    |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/b09df845a6981e6a48221217d47900cd786893c3 | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/7caddf33e9e07d7c817fa9457f6807387e0a9d4b |     
  mips64el   |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/a7ac2a92b9f965fc538164f35a48541ba47b6b47 |     
    i686     |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/1b10ed0fac12b71b4d6dbdee7e68ea22f33908fa |     
    i586     |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/1d914072af7d8ce9de7df66f58799bc2fcd1c93a |     
    i686     |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/d01294f7be8336cf24a8b4086637eee6381b0636 |     
    i686     |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/980829625a014eb60f2b2aa130f5b0926952d349 |     
    i686     |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/85700076096700f193920e95317d0dc6b12936ce |     
  mips64el   |         moarvm-2024.12         | NOK | https://autobuild.buildroot.org/results/10444d2f5d9e8942bebece91e7e667aa00c1793d |     
   x86_64    |           mtd-2.3.1            | NOK | https://autobuild.buildroot.org/results/e24c4a62703a5546f6609f3235ebad8f66c42f22 |     
    i686     |          ncftp-3.3.0           | NOK | https://autobuild.buildroot.org/results/3be8f8f9050f8948620367286455a1fe31237530 |     
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/8478ff4a048f1ecf9eb76412eb3915495cd04583 |     
    i686     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/5f6e38754e37a939752903187432b9c8d966f04c |     
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/becd73658082863ac4e82be70a865f474f81462e |     
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/627ce87c2b99d74967437d4adb7607afc8a41a1e |     
   s390x     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/f3840bb2f99abcd651111173603129555d822052 | ORPH
   x86_64    |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/b79aaf6b3cb5d51f3d59bd9f125a7d33efa4b9c6 | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/400cacd526d22f64656ab478f07660b1a9b04982 | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/f945352913b13d7f9cb237205f28bed40ba2f742 | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/6dd5a2c71677ade847490d02fdfd8d94e031ba67 | ORPH
    arm      |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/ffc5532db0d3e673ce85f9548fb6dbffea18a59c | ORPH
    i686     |         openmpi-4.1.8          | NOK | https://autobuild.buildroot.org/results/8500b76f356851e03c3a894dab0f959a76b67869 |     
    i686     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/3ffbc70726c5357f74013bbeb05c7d3a3567b8a2 | ORPH
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/01f0399c68638b1b8945de7226418216965c5d64 |     
    arm      |           opus-1.6.1           | NOK | https://autobuild.buildroot.org/results/879c8b05a7d8a7b76b76388acde250aa6ca81f9b |     
  mips64el   |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/a87f602475191dd56fdb39ec5194bc88b13e529c | ORPH
microblazeel |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/e313ddc5f2298f859a4cde074ecb134bf0bc2959 |     
    i686     |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/bf8f2b33a97d26963922c8103d60aa9ddba10869 |     
    i686     |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/524da69a9552eaac7770d158e895daf2a0f5c477 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/7d9190f4ce031129906352c5dee5459fd47ebca5 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/4f75a902e8c8b2bbd271d9c6a38056f451d2ab5b |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/321ba6029ad1631ed57b8e60852417dc903c9bed |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/b8274d517bfbe162bf650ba202d4558d1ded0a22 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/88e1bd4cd073197b8ae4faefe8852c90391e0e59 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/4bcd544805d845cc383748eb9ab7806017fb8885 |     
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/30b7342b36af2d4d25c802fd2c2312fa777f5ccd | ORPH
    i686     |    python-tpm2-pytss-2.3.0     | NOK | https://autobuild.buildroot.org/results/b87d0fd9e5991c3ace4fc17188fbc6d63ab28b56 |     
    i686     | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/7982f068c2bfbf56feefe8703710d5115cb28ddf |     
    i686     | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/c00820f35c6b269487572f7eae3e9e3e5c1c1540 |     
   x86_64    | rtl8812au-aircrack-ng-c3fb8... | NOK | https://autobuild.buildroot.org/results/05e9cef32f07f05192dab0a23139a81a8980c806 |     
   x86_64    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/50a3db69a84a7e7f65b136950fd0e1e2abd017bf | ORPH
  mips64el   |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/0264063db606637426c9549cd7dfb2c039daa222 | ORPH
   x86_64    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/edb9eb19dd5c10f52ae94e51b6c8787cfcd86eb3 | ORPH
    i686     |        shellinabox-2.20        | NOK | https://autobuild.buildroot.org/results/f3ffc3e651890b8160a6e8611a90c71b5c659f15 |     
    i686     |        shellinabox-2.20        | NOK | https://autobuild.buildroot.org/results/a4b772e7e5a69841f2c5c349066a07530ae0ab25 |     
powerpc64le  |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/674e6480537fcf75daa2f553db2f0cfbf87cc09c |     
    i686     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/bd1c4090c102e2620697902756de5ab6efbbab52 |     
 aarch64_be  |         sudo-1.9.17p2          | NOK | https://autobuild.buildroot.org/results/7b109cc88adf592c5c126a7b6958856d9f73675c | ORPH
    i686     |         sudo-1.9.17p2          | NOK | https://autobuild.buildroot.org/results/1c6fcef9746be6dad0a0ae66cb559af57b11732c | ORPH
    i686     |         sudo-1.9.17p2          | NOK | https://autobuild.buildroot.org/results/be3edda726e2191641d7674d63ebc19a00cddf5b | ORPH
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/11fd690bf0abdf4f57f5aeca2d21d3290f5c9d0c |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/7d32b16d04056c7a604ca1e17c32b91d45c8b278 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/c5d207b576744bbe286facf7d6eb0baf923c19c1 |     
    i686     |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/55d8e87300ebd391dbacaf392233739b0f32fe14 |     
   x86_64    |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/6cddeb583027332a62badf9f4b95df3e9675268f |     
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/76b0b87f238b22caa57916c2182b915bfd721e0a |     
    i686     |            tar-1.35            | NOK | https://autobuild.buildroot.org/results/eb90ac013710c9d5268ef8e9c8a6712ae4a27c3f | ORPH
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/b7a53da8aa3f4b9c0de1275c10dad3ee9e721aab |     
 aarch64_be  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/a678d92d5943f084c92cb6068aef30cd4b16fc98 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/4915f66f55a763ad949c2d0fdb633e7c0cf10f64 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/e23d7109d79f1e78b97e7f81a515ffc956125ad4 |     
    i586     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/23d74a69c2662890fa3f0b6ff088fd2692838e1b | ORPH
    i686     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/175d5d4dcf1442c533ef3ea0a46a635d76776024 | ORPH
  riscv64    |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/524362fea8330abeaf7ae7c903fcaec3643be7b3 |     
  riscv64    |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/acbfb678440cbf5b240a3b6b689bce6046f88c14 |     
  riscv64    |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/0f09ba6a4d9718b31626a4ca40d9ee5c35183d13 |     
    i686     |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/95f84b30cdea697c8427be74cf79fd4dfca225dc |     
  riscv64    |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/57439ae3c6c7f21aa3c0ed54e9f3d002cf8e1145 |     
powerpc64le  | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/5520e416d0e1d088b9c647b8e4fd1619d72203ca | ORPH
    i686     | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/6773f32365442d8020dcfb60dd8c6df7d2af3fc7 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/b1cb9192f0f577d76cd82c2b5b61c8428b94eb69 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/e07e0f943c5a80c675373ecd270434cd10dc30aa |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/f15466170185011194db41fffd76fa4fd9242495 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/1e410a70a67fe7e355acaa14d161ca94ceada342 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/d5574de3554328a3f2f0b75b147aa5ddb06ca3b1 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/6e99351e9ea282219cec84a3810247aefc0cd3a0 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/6a0229857785b6e43a9ac47914f94926ac6c4012 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/ba04ba2a527a15f6c1890cfcf3067d6863bf0bd3 |     
  aarch64    | waffle-v1.8.0-95-g5f1f48287... | NOK | https://autobuild.buildroot.org/results/f41af23078091929b9336ec64da6ae0bbf22eeae |     
    i686     |  webrtc-audio-processing-1.3   | NOK | https://autobuild.buildroot.org/results/e96069fa088f0b267abf6504864daad218425326 | ORPH
  mips64el   |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/6ea51baa5642397a21b47202f6383e28bde926ea |     
    i686     |         zabbix-7.2.13          | NOK | https://autobuild.buildroot.org/results/477f7851b76abaaba825850f8289cf32e921ba1e |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

              libmodbus-3.1.11 | 2 
                    fcft-3.3.2 | 1 
                  iozone-3.508 | 1 
      libabseil-cpp-20260107.1 | 1 
                openocd-0.12.0 | 1 
      passt-2025_06_11.0293c6f | 1 
vexpress-firmware-901f81977... | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/1497965af5977de7e40c579b284233d5d4a31f58 | ORPH
  aarch64    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/1acb265950a2096d2720cd87ff11bd1e88e09d3b |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/73e8c501988f381e7a6868a802cffb996c60cf6a |     
    i586     |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/ce33b1c45f86a3f4cadc0466c97e97b14d1611f4 |     
  mips64el   |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/4b13cf843f8c45bd12f69e7d006b58f94bf358fc |     
    i686     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/bd6c8114d59cc3643ddbdc457152452c4e13cdad | ORPH
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/76b73c0082e01a71ab4201d54efb7b17f0f03406 | ORPH
  aarch64    | vexpress-firmware-901f81977... | NOK | https://autobuild.buildroot.org/results/6749ce0e151681f8f62e9a577d4276f97d17d7a3 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

  gobject-introspection-1.82.0 | 3 
              host-rust-1.82.0 | 2 
package/linux-headers/linux... | 2 
 qcom-db410c-firmware-1034.2.1 | 2 
                       unknown | 2 
                bpftool-v7.1.0 | 1 
                flannel-0.26.0 | 1 
                freerdp-2.11.8 | 1 
                 fwupd-efi-1.7 | 1 
               host-attr-2.5.2 | 1 
                 lcdproc-0.5.9 | 1 
                lesstif-0.95.2 | 1 
           libmicrohttpd-1.0.5 | 1 
     libphidget-2.1.9.20190409 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
          linux-5.10.246-cip66 | 1 
                memtest86-7.20 | 1 
                  mender-3.5.3 | 1 
                 openmpi-4.1.5 | 1 
                 openssh-9.9p2 | 1 
                pipewire-1.2.8 | 1 
          pkcs11-helper-1.30.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
        s6-linux-utils-2.6.2.0 | 1 
                    sslh-2.0.1 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         bpftool-v7.1.0         | NOK | https://autobuild.buildroot.org/results/5d825e2d6e3078761174e6e9b091ad07f1fb1fb9 |     
    i586     |         flannel-0.26.0         | NOK | https://autobuild.buildroot.org/results/e47bbb1710970765ac2aee85de137ce70075d57a |     
    arm      |         freerdp-2.11.8         | NOK | https://autobuild.buildroot.org/results/13d4a30880bf767bf554a19301d66d14d7c4076b | ORPH
    i686     |         fwupd-efi-1.7          | NOK | https://autobuild.buildroot.org/results/b6290137509b51e72bd07091f094c326644a688c |     
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/7274462412d96e02eb48cd8f841b9cc486af9cdc | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/b3e83a0accaac8fd49e886ba3ea1cdbf1ac936ad | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/94163759baff925becbc2d7a419239658f37d1b4 | ORPH
    arm      |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/09969c15543171f5f011e44b54d96ee7b97194c8 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/0223943d7d8e5cc499371bd335897a96f0341117 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/109f6234d0ef3e8cb5eeea3f95ead25ff63ac3d8 |     
powerpc64le  |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/48740e537fec93fc4b7817c4565bd53ac4d38754 | ORPH
    i686     |         lesstif-0.95.2         | NOK | https://autobuild.buildroot.org/results/ff47cf7b95222a7835152195c58cf55991c08ab4 |     
    arm      |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/5b9246a02098c29b2cf2e222c6abea70ca5f7be8 |     
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/a0435f0ce40ac43088808f638763fd67019d07dc |     
    i686     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/df669ce97bde9c1172524db8ab3a1b969d163a30 |     
    i686     |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/8efc3c8f85e9219d45963d2eaa95f6b07e652ee0 | ORPH
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/45f01defc2b9703fcfdfb0b3cd797fe700394ea5 |     
  riscv64    |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/1ec55535d0287e26594de2adeef818f2b6c6e7bd |     
    i686     |         openmpi-4.1.5          | NOK | https://autobuild.buildroot.org/results/862581fd344a9c2c2f76c27d6f4ff28e78ee4ab3 |     
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/d45078d70655538ea6c53cde4d67e7149c594c30 | ORPH
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/3964f4ae851ae45f0c4d927dc75b8fd859b28400 |     
    arm      | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/662ccd434e31bb3cbe6de43bbf30d50fdabeb341 |     
    arc      |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/3f839cd197909e2b48cd2bdce4a1b58011a08485 |     
    i686     |      pkcs11-helper-1.30.0      | NOK | https://autobuild.buildroot.org/results/95c6b63828bb4ca197e14f75f196c18e064edf34 | ORPH
  aarch64    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/10c894d3444fc29ec5739675cfb12aa638cb70fa |     
    i686     | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/475fc41f77d9c39017fd5284bb6737cce11f9e55 |     
    i686     | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/7252fd91cd8aed5e2dc6961f311ebf320fc3094a |     
 aarch64_be  |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/24dfb57ecd67301d84f8477d03dc00a0b496137f |     
microblazeel |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/ecb6cdca280a1eef362814ffb09296b4cb16547b | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/4a34c260759355e6d60e2965eab1cf6d2b503dba |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/4648696ca11f2007fd51dd196f3376a471d9feef |     
    i586     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/9eb9e4fa9b2b65c8dce382febbc7cb50ee3edc5f |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
