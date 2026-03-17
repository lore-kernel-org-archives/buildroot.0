Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436F6FB5EAF
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 04:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF76240AD0;
	Tue, 17 Mar 2026 04:26:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vrTYa6QgrmDw; Tue, 17 Mar 2026 04:26:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC3F940AE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773721612;
	bh=6o01YU5CMoSEUH09CCKNpu4A6ar6ZoYxTdAq3u/SpxU=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tCSO7111cimvxci7+8MsV5mkW5PFxxW3vW4R2zx3lWIT0hdq4/CRCfwA0kgd1zm8k
	 LACG741g8ktDd73FpEj9SHCEF0JHGAf7P37x8aO3uVugOBrUTio2BiMtt/RXXTp7EK
	 QRPPBHDoZWPisBrCj9xru+K06pQu0hlXp9l/5PFjSZWAIpfoJKq7FEXOwam2Eauac+
	 ChzrHT3DPGnd4JsefMluYwLMYlxCzIU8NH5tOSnPrj8oKVfUBqSb5YEcV9XZ4BSwLD
	 MXnbgKQ5M+hTwVt7MgoGIGwzCfSQrDD9L9qT7hUtcgrJiyi5Gkricuu7k6mrTYi6JZ
	 7nkzFVsJp9nEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC3F940AE3;
	Tue, 17 Mar 2026 04:26:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AFA98D3
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 04:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B7276075D
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 04:26:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nQW_m7MWyKSH for <buildroot@buildroot.org>;
 Tue, 17 Mar 2026 04:26:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2002D60689
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2002D60689
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2002D60689
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 04:26:48 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-43b3d9d0695so284680f8f.0
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 21:26:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773721607; x=1774326407;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nn4Yeg/kP92V+lCnSQSvoNhD4a0t0UbSPpEfoeR6rPs=;
 b=X9b9nVFIIVhlsB4/f9D1dGJWL2DH+osgRVyqEgq+zDOZB3X+qrpc3YRx0rHW8dKzWA
 qBJbgt2W1E0bvOH7h2c81csGLhXC+Fj1kAFvKbKl4zg0opFzGestQ79BEOschoaobpvy
 Ng1JuhMiA5TnejeEpdbwEiJOUlOqSrfNewrIVE95F6YbL3BKJOMRSe/DN9EJL2jdOYKG
 +EmVtBT+FeVf8703lO/dkQB2hxkQ4tmjYv87vrxFjEmq2IcY9VJFiwXK+eTTA/Kg05a0
 BXHso7wctrq7gHH6GHJrcZNEmJdHNEs68FmXHVXM7NryYEJS/Wp1mCdSs5csscSbqKUH
 lprA==
X-Gm-Message-State: AOJu0YyIu/7YMtSL1IvF9TqaQNlgOoCNEPDV8DggqdwoUrpBCol0ToUy
 hChjGKvbB4iM6e+PZuEAl5pjzJey2043MFAiV5jH9hbcXWlfO90Jmli2YRuGRqff
X-Gm-Gg: ATEYQzzcyjChCT/0hlVIiLSSjYZ17mwA7JMqJn6Q/TcxvfqY6rUOl5Vjxc0DLZ13VGR
 uJK0fkItZWhUNX1VwMIc8Acch9uuJz+KWehQA4SJ9tOlwgPY95qPs4mOT8IUjRDgMe9zAYJB9Zb
 9pe22B9nREDP4CUBgjrfd8CfxvIlNfUvlw1lSae2v11zk3+CRLfkoRMh03Mu3pqzM67UWkn/Z6z
 /rHM/Wx49oBsk6uc3Gi++SLuH35Fvw/YEv7aBxv5txbcIGelZNdRi6cZAg3KqKJpIVebamlnYKr
 arVhX9dn+nJUxTBgNWhUOw2Q/CDHFuIJ2pLFPnKymXbdWnS725/xkzZ9zAjC0JTROqreTZMTfhx
 IlWr/rs4kjR5K9NPaLE9UmkMGyeHwOixkhJqQEozqasREhvSGovABEePkeIUfzp05tZuxAHPSVa
 M9+IXjoNMMNyt92rz+Toxj98e/jg==
X-Received: by 2002:a5d:5850:0:b0:43b:45c6:7ad with SMTP id
 ffacd0b85a97d-43b49842667mr3341132f8f.29.1773721606386; 
 Mon, 16 Mar 2026 21:26:46 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b468cf785sm9405060f8f.12.2026.03.16.21.26.46
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2026 21:26:46 -0700 (PDT)
Message-ID: <69b8d806.050a0220.11cc4a.1056@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 17 Mar 2026 04:26:46 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773721607; x=1774326407; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Nn4Yeg/kP92V+lCnSQSvoNhD4a0t0UbSPpEfoeR6rPs=;
 b=LqRnnkAfzoKWv1bIsT/Yzytz03T0MAFDN6hb/CS7JHS/tcaySgtogmXLiG2buEgpt0
 UREeHu1INg0gvKqWy/GysedDoOCkuDM3lwp5jHAJJH5K+KCAMlRIIJwWGshOsU8iMGx0
 uiklfB42Y4tchB+q4PQ35e07oiqMfohdss3ir52tgJgb2ghAv+W7rNvdOxX2d9Ipi9xN
 J5VLrhkTdoV2YLR5x+I+3JhNWgSXaD4IoK7SnqtJVL5+3160QrnlSbqtW8+sDs+OYru6
 8m0Ru9lIPvjiOjnccHROAhHzXkp5HzoSFNDGIionawNLISA7u8bFbxH1xQtgecNKuCrm
 gFQg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LqRnnkAf
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-03-16
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

Autobuild statistics for 2026-03-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 19  | 39  |  0  | 58  |
  2025.11.x  |  7  | 19  |  0  | 26  |
    master   | 59  | 166 |  5  | 230 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 11
                 mdevd-0.1.6.5 | 7 
                flashrom-1.7.0 | 6 
host-gobject-introspection-... | 6 
                  libnfs-6.0.2 | 6 
             dahdi-linux-3.3.0 | 5 
     libphidget-2.1.9.20190409 | 5 
                 libmbus-0.9.0 | 4 
       shadowsocks-libev-3.3.5 | 4 
glibc-2.43-10-gc3ceb93dc4f6... | 3 
  gobject-introspection-1.84.0 | 3 
          host-mosquitto-2.1.2 | 3 
            host-protobuf-34.0 | 3 
               iproute2-6.17.0 | 3 
leafnode2-9543ffaf82406f943... | 3 
odhcp6c-f19dd37fb467c9cf10c... | 3 
                openssh-10.2p1 | 3 
               pulseaudio-17.0 | 3 
  distribution-registry-v3.0.0 | 2 
            gdk-pixbuf-2.42.12 | 2 
              host-guile-3.0.9 | 2 
                host-odb-2.4.0 | 2 
                  iozone-3.508 | 2 
                  libbpf-1.6.2 | 2 
                libcurl-8.19.0 | 2 
libdill-32d0e8b733416208e04... | 2 
                 libzlib-1.3.2 | 2 
                  linux-6.19.8 | 2 
                 linux-headers | 2 
               openblas-0.3.31 | 2 
            optee-client-4.9.0 | 2 
                   perl-5.42.0 | 2 
                 rtl_433-25.02 | 2 
                   atop-2.12.1 | 1 
                bpftool-v7.5.0 | 1 
                 c-icap-0.5.10 | 1 
                   ccrypt-1.11 | 1 
                  delve-1.22.1 | 1 
              e2fsprogs-1.47.4 | 1 
                    ficl-4.1.0 | 1 
firmware-utils-c42a3bc53da8... | 1 
                   flann-1.9.2 | 1 
               freeipmi-1.6.16 | 1 
                 glibmm-2.76.0 | 1 
                        gnutls | 1 
               graphene-1.10.8 | 1 
          host-binutils-2.45.1 | 1 
    host-gcc-bare-metal-15.2.0 | 1 
           host-libtpms-0.10.2 | 1 
            host-mfgtools-0.02 | 1 
              host-rust-1.88.0 | 1 
            igd2-for-linux-2.2 | 1 
                     kbd-2.9.0 | 1 
                  libenca-1.19 | 1 
libfutils-c326ce0cc2a735438... | 1 
             libgphoto2-2.5.33 | 1 
         libhdhomerun-20210624 | 1 
                  libnfc-1.8.0 | 1 
                libnss-3.120.1 | 1 
              libopenssl-3.6.1 | 1 
                  libsepol-3.9 | 1 
                  libva-2.23.0 | 1 
            libxkbcommon-1.9.2 | 1 
           libzenoh-pico-1.2.1 | 1 
                linux-firmware | 1 
                   lrzip-0.651 | 1 
        ltp-testsuite-20250930 | 1 
                       mrp-1.2 | 1 
                    nodejs-src | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
                openntpd-6.8p1 | 1 
                openocd-0.12.0 | 1 
                openswan-3.0.0 | 1 
      passt-2025_06_11.0293c6f | 1 
                    polkit-126 | 1 
                 protobuf-34.0 | 1 
           python-html5lib-1.1 | 1 
python-remi-2022.7.27-37-g1... | 1 
                   qemu-10.2.0 | 1 
                 rtptools-1.22 | 1 
                   s6-2.13.1.0 | 1 
                s6-dns-2.4.0.0 | 1 
         s6-networking-2.7.0.4 | 1 
              skalibs-2.14.3.0 | 1 
                 sudo-1.9.17p1 | 1 
                tpm2-tss-4.1.3 | 1 
           uboot-tools-2025.10 | 1 
uclibc-ng-test-132c6134d691... | 1 
          usb_modeswitch-2.6.2 | 1 
ustream-ssl-5a81c108d20e247... | 1 
             util-linux-2.41.3 | 1 
  wireguard-tools-1.0.20250521 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/8ce2e22efdd75fd445e8dcd72d5c9001059093bc |     
 aarch64_be  |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/d20ff816467819ef7fa1aa11f14c231bfe52a83a |     
   mips64    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/d5a26cec1266d1e4df00f31b7cb4a866b11ee027 | ORPH
  powerpc    |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/23b6a38da0ca906745fcef3cea577d322c2b3c25 | ORPH
   sparc     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/ece16c6136b4dc8234e94a20d1c2b7ab062d0ea0 | ORPH
   armeb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a5bb244031c0e66b3fbb4163d59d837c2249bd7b | ORPH
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/ff757ea23b92682b75ce9eb2cc94b1ea1d6dafe8 | ORPH
   mips64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/1130962efd23601cfede444224c3cc2251ae746e | ORPH
   sparc     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/139357dec851c0679d9f38181021dce33f41e0e3 | ORPH
   x86_64    |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/c505915582db83cc7aecaa448e7164b59f1c9daa |     
    arm      |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/340aab610f39c5e610f9dc9aa3840b489f23febd | ORPH
   x86_64    |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/729345f8295186b45b882c5582e953e2e4305b38 | ORPH
 microblaze  |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/375a0a6620adc7b2a02d9ab3705c622b80c8401d | ORPH
   x86_64    |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/30eaa9e29a3412cf525796d21090bdc69cf95717 |     
    arc      | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/e51b15996c9bf457640e223b30617f2e79f732ff |     
   mips64    |          flann-1.9.2           | NOK | https://autobuild.buildroot.org/results/d9d402d72a5e0b2423a9947503134abe61803716 |     
   sparc     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/4ff98e278310ac88e3cc4e1ad6819b9979de4a51 |     
 powerpc64   |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/23f3edc028f7e756accfda442304b938aae60253 |     
   mips64    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/bcfdb0cd642f4d08ba7072863297018896c99084 |     
 aarch64_be  |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/f36111686849fb1f97b951ecd132de6c22e04f29 |     
   mips64    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/3242ab98f1c6be324d0698be2e0e0e26cac57c57 |     
   armeb     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/fa06c85367613550f6b3c96aee226655f95312e7 |     
   mipsel    |        freeipmi-1.6.16         | NOK | https://autobuild.buildroot.org/results/50171df82972d394dd6062183bb4b3c7c97c48a8 |     
   mips64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/6901fa86b73308aa460552fb33c4606e8e54b403 | ORPH
 aarch64_be  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/ba4367edd1b902b1debdf345bf7d80ae30ca5315 | ORPH
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/52a8fb5a9400127b4a06fd0dc2cfbd37dc2b4f94 |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/0d819e31cd300b9486bf2df6692af831e4d03c41 |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/9d340495d60335b7746bb462e4ccbed550724c07 |     
    or1k     |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/4d4f35eb94c1be0d1e89c0d45351049d6397fb00 |     
microblazeel |             gnutls             | TIM | https://autobuild.buildroot.org/results/ae36a4d43410050c444f3fec57b6418d2815d9dd |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/776964d64433432de605e4d6fe037a9e33d01d2d | ORPH
    sh4      |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/02069aa5c9aefabccfcf9f975e1b723445ba0388 | ORPH
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/0605eefaa3224324082b909fdf2338d45597ad28 | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/f7282f56da64a39dfa6095b17b61172fad77d97e | ORPH
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/b5b1412da1d64ecd1ee2badc41c11044d65213ca |     
   mips64    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/9c8dcef65bd8750aa2ade126b2740f661a3bb50d |     
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/15e76331d24fd557cfd6a13dd575e0bc2a5608e5 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1dd2e787d2b19f81429958ca76939986172bb553 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/45c8ed3054a17cd9e32eb9e60ded090de7f88b22 | ORPH
    hppa     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/84a080c72b989783e1f34d7b488237b99183312d | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7a4a2a104cd95d458dd55cfe4b52aedf93c78ad7 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/93f9b457c065745e648c960ee887d460f823a764 | ORPH
   x86_64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/d2c23971d3bf8026b090dff0c6f1951e2bd948c8 |     
   x86_64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/879e1f3f8ee56b4abd7667c918a63f34c2b518aa |     
loongarch64  |      host-libtpms-0.10.2       | NOK | https://autobuild.buildroot.org/results/a96cca839a43d57acc900cbe94bf8fc194b8d0c4 |     
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/64682850f3d6a0f475b3084706f0a6797efed909 |     
 powerpc64   |      host-mosquitto-2.1.2      | NOK | https://autobuild.buildroot.org/results/bca83ae6f6e91a704bc063f4be6a19dc6d7730ea |     
    arc      |      host-mosquitto-2.1.2      | NOK | https://autobuild.buildroot.org/results/ec4e15a28dd2f6340c783291be47aa695a3de9f3 |     
   s390x     |      host-mosquitto-2.1.2      | NOK | https://autobuild.buildroot.org/results/9eee2a6c9db108fad302dab804ffeffed2379ace |     
   sparc     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/7b8d5dcbb90e14817973e4e42d44d240cd8f42ec | ORPH
   xtensa    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/ffbff3294c762c363eb872b3c5a5b3ace2e814e9 | ORPH
   mipsel    |       host-protobuf-34.0       | NOK | https://autobuild.buildroot.org/results/aa95499217b5ff82330c492b2e9cecdf5ab3a46f |     
   x86_64    |       host-protobuf-34.0       | NOK | https://autobuild.buildroot.org/results/249df588dc3e0e93418d7284d6ef64f88c26f192 |     
microblazeel |       host-protobuf-34.0       | NOK | https://autobuild.buildroot.org/results/33dccc9db4f61a5b1acb45abde84567fb5fc809e |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/41b6811a1f2f6283d5857fdb36d49bdc98c1a23d |     
    mips     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/bd6c03d5f8a75bc71f3ece36d7211f096c9cae57 |     
    arc      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/bbdeba79856107afd9f676a0bd50e577285348dc |     
  mips64el   |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/25b835becb96172e53b55e43ccd3c0b90427ca63 |     
   x86_64    |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/78a31177158c57abba9c58bc658869460795e009 |     
    mips     |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/2213769dd3be85c6685e9c304390536b9ce65564 |     
   sparc     |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/b7d39eceb43028778416b37b498c86ee469d32b3 |     
   sparc     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/2f0f974bba20f8cc366d3e70b2ad73e2d2bf1ad4 | ORPH
 aarch64_be  | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/c03f4491a9ab093dbfd1eaf969e15efff85755aa |     
    hppa     | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/bfed4b92c599a21dd11e7ae38d0e7ce2296d1499 |     
   sparc     | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/ee3b687aa1e9fd95576826740cb05c9f225f5e57 |     
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/1f186d9d02d0dfc6153986190cd7554dedf0c8ae |     
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/5ce206de5d18fdffbe95eb2fbbf68dcbb75864b9 |     
    i686     |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/cb430816e2e3f4340db300984da3efda1bb5b202 |     
   armeb     |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/1afe7b6bf1b730591124718c7e5a14bebd34fb29 |     
   armeb     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/a10fc48a2b4a5565391062eb2e84d99975d1cf56 |     
 microblaze  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/56b2aa238d3b20630adbf2316731635e43cd5ae7 |     
   mips64    |          libenca-1.19          | NOK | https://autobuild.buildroot.org/results/b675eb877adf59e7a1ef762264039e39f3e39469 | ORPH
   sparc     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/30e808174d068a8a128c748751fafb62d4f4bd37 |     
    i686     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/716486cdd745581aa5e1fa7a0cb1965b82dcd3a3 |     
  aarch64    |     libhdhomerun-20210624      | NOK | https://autobuild.buildroot.org/results/edda0318b811dc1aaad88c43ba3e99c2024b424c |     
 microblaze  |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/43591bd3231b42d79f36bb2ddbe7050095caf819 | ORPH
 microblaze  |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/100437c79840bfa0fd02628cc92221307bdaf347 | ORPH
  mips64el   |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/d0918968ef32a131c24831dd804ef9982c161a26 | ORPH
    arc      |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/4306373be1b8ec770f4b0b3620b316d21c06c437 | ORPH
    or1k     |          libnfc-1.8.0          | NOK | https://autobuild.buildroot.org/results/9d0af3c756c95416c3c24847bc2a7da7ac171de1 |     
    sh4      |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/0b0c6407865eecb117eef7f7dc913c01f4aec32e | ORPH
microblazeel |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/13a5c6efd0fd6df388f30dfa6bc076866730d54d | ORPH
    hppa     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/ee57441cff1b606d96014f3492259cd91b8e8b27 | ORPH
 microblaze  |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/8da5011782cae7c1364d8165cbed7efc6322ab71 | ORPH
microblazeel |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/00397c94c61ca4aa74318be6c7f25fad0f5ebf04 | ORPH
    sh4a     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/9c11a2a49e3a78b228b8c28b29061ef43ba408de | ORPH
 aarch64_be  |         libnss-3.120.1         | NOK | https://autobuild.buildroot.org/results/8d8bcf357886ae5ecb8010a1b662ccb14660eef3 |     
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/36ee00e1851560a132d2681198b536ba990048e4 | ORPH
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/5f67af922cccf5d5941d1c06296b3b133007a8e3 |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/e2e39abc0b4a6813ef77082c8216a815f585a61e |     
loongarch64  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/cf816e5708d6b567db9f94282684f647b8deea39 |     
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/3e180588524260d474b293ca2f64bb0b6125504c |     
   mips64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/590b8ea28ebfd09122e2bbdaa84756fd2685d899 |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/581174d1b3ed1e5bf6a7effe7a4a9913be487008 |     
 aarch64_be  |          libva-2.23.0          | NOK | https://autobuild.buildroot.org/results/b46a24b670ce4e600de179857f83624cddc2d3a4 |     
  riscv64    |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/6d5ad60634775ff415d9b93d8c173f1dffaaa39e |     
   sh4aeb    |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/f4ac6cbe844d26c1c16584a20481a8b3e1910ed8 |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/6cb1eb71094106917d8e6f4e0f518ae4514a2011 | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/330d0dad0dfbc7514382f14e3c4015d77427c455 | ORPH
   mipsel    |          linux-6.19.8          | NOK | https://autobuild.buildroot.org/results/86897206807e563539fec21f562512900afb7058 | ORPH
   x86_64    |          linux-6.19.8          | NOK | https://autobuild.buildroot.org/results/fc5d62b4d3ebb6d1ae4a522ecd18167212170fde | ORPH
powerpc64le  |         linux-firmware         | TIM | https://autobuild.buildroot.org/results/add5332720fd5fd880a0d6cd56600cf4b02966e0 |     
   x86_64    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/af37ea087cdb50cbeecc0cdf281b931bbea7d885 |     
  riscv64    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/a285c608e888ccbcc064dc1dda05bf6fbdaffd41 |     
 microblaze  |          lrzip-0.651           | NOK | https://autobuild.buildroot.org/results/defd8495d0df2e1f9ae6533ce5465b05c20b351f |     
 aarch64_be  |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/6df5f33d093c1a9cddac6d0d02b60f87415493b7 |     
 aarch64_be  |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/aa39b4e36a01d9a9984b595e0fd814677d6e53d6 |     
  powerpc    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/08895ea295f105352bef2f595322ebbd60dbef57 |     
 microblaze  |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/1f1c10664a8684f9f3a66da7a824e5dba14c4a9a |     
    i686     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/c2cc105557e7610bf634d877c818596bd568ef32 |     
    sh4a     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/79b50932f82adbc0e8dc6a472de1914dc419966b |     
 aarch64_be  |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/d02ecda157b836de66417b8e8ae698313e45d900 |     
 microblaze  |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/474c648ddb1c348de346ad2232f4fe94335af2f2 |     
   s390x     |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/95007ba3d0b6b2777fc28c3ca8b42bf9ca16ba19 |     
  aarch64    |           nodejs-src           | TIM | https://autobuild.buildroot.org/results/766bd464c4a9a36a4cbd149bd986061791f5298a |     
microblazeel |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/2791408d89a772b2505c65a2781cc738998c4c40 |     
   armeb     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/506d3e62deacc27d8cecd6b29a347d22bec21ce2 |     
  sparc64    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/d502c6f64b6eb5f6c2c114ccbaec0992a61ff5a7 |     
    or1k     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/4c3e3b9d70f2840412e87eff2015b015922454f1 |     
powerpc64le  |        openblas-0.3.31         | NOK | https://autobuild.buildroot.org/results/4a7fbf0b8c287d3121e557505ece135fc0589284 |     
  mips64el   |        openblas-0.3.31         | NOK | https://autobuild.buildroot.org/results/2bc1739df3d203547114b83e71335c397ec0fb93 |     
   s390x     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/c4b54f9f8df6a6a4fe6285b9f3dce0bcc4165388 | ORPH
 aarch64_be  |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/d1d653b13df87b2440fd7edbceac037bd7c14dd1 | ORPH
  powerpc    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/fd6d29681dd86b20503897bd0412994b52e2adec | ORPH
    or1k     |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/45eed87801801991dbfd35f2c2429fd483119a99 | ORPH
   mips64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/53c4bfe7c4e9be95fb46c7dd1eb7abf6ce4a1d5e | ORPH
    or1k     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/1863c274efc79793aeda04837e673abd8ff0243e | ORPH
    arc      |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/a90ad7542f9702f64a795f16f1146bf5f62c937d |     
  powerpc    |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/3707a2d1b10b8457901743bd7c993f069fa7e84b |     
microblazeel |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/af4a0b973002753fa78708449094c7fbeb326c28 | ORPH
   x86_64    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/39435db64c21d4ee2360364eff6c77809abd00da |     
   sparc     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/ab5b3ada0b13a6577ef2594c628987ff313daca4 |     
    or1k     |           polkit-126           | NOK | https://autobuild.buildroot.org/results/901833acb622c40ba58984c27c7656efe9e7d13a |     
    m68k     |         protobuf-34.0          | NOK | https://autobuild.buildroot.org/results/e2f6cf6e579a743915343bff2c23e0564227543c |     
   mipsel    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/a9b8a559009483dd0251e60b983a1f9ccf2d650b | ORPH
microblazeel |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/f1c559cccc1ee86a8662196f1ccbfad3bb046e49 | ORPH
    or1k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/258d0f1b2ad8bef4e205088ef1e17c278e006ade | ORPH
  aarch64    |      python-html5lib-1.1       | NOK | https://autobuild.buildroot.org/results/b270cba4b7b81160a9b8de76a6c59f74d285d541 |     
 microblaze  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/656d0a2e3f5586536a41ea99a2f29169c0a0b37c |     
  aarch64    |          qemu-10.2.0           | NOK | https://autobuild.buildroot.org/results/b5fbfab18548742a2f705078849382ba74fc447c |     
  sparc64    |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/e91e7693c12589cecefe3331276a8f48f6c27500 |     
    i686     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/26db72f99b45aeb05e0fcb0dc645367ff32916b8 |     
   xtensa    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/a66f69571b6a37a94186552d1e7a04923a7938a7 | ORPH
 powerpc64   |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/814f4fc6a28d32a947795cb1c87558f1559cc3bf |     
  mips64el   |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/3e9910c7b044e6288a82e2362ef6905d9fc1453d |     
microblazeel |     s6-networking-2.7.0.4      | NOK | https://autobuild.buildroot.org/results/c23de26815ee615d3e28b28eaf392d99f5d5211f |     
 microblaze  |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/f23bd90832f859dda5fb5b0b21673cc30910314e | ORPH
    mips     |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/faaec8856b4c7d4377233c260beccc5d7764dda4 | ORPH
microblazeel |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/84f76105055c11464d22016eaacf377cf03011ca | ORPH
  mips64el   |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/2b4803afbbc9dff493ef3e31f15aaf3135cbd4aa | ORPH
   armeb     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/bdfbbde611caaeddb71af3a848b7da3d4813081d |     
   mips64    |         sudo-1.9.17p1          | NOK | https://autobuild.buildroot.org/results/76683017b7b15ab23c77316e757973b76fb42f0c | ORPH
    arc      |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/78f1fc777abb43003612f1b9f8139eddc94ebb27 | ORPH
  aarch64    |      uboot-tools-2025.10       | NOK | https://autobuild.buildroot.org/results/a3abbc33d677715a28c03c911ce75a2f3090791a | ORPH
 aarch64_be  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/7b286cdac2ef9a4e5344ab5c60545e1afce5e85a |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/50657ad2246e4d1250f27f469f3a6da96c101234 |     
   sh4aeb    |            unknown             | NOK | https://autobuild.buildroot.org/results/b82112a9739b5304853a8556b6548b5226c48941 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/031caa3e6f330e47ddae5a423088de6813139779 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/13c67c76dac6b96e7069f86e2f42414317e6c75f |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/4333bcc4f1f33cf53f0fa5ebe25ac52f03bce925 |     
   sh4eb     |            unknown             | NOK | https://autobuild.buildroot.org/results/3c5658e20e2a00b1b0fabfb775b474eaf5214f6b |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/93b7502d249fbe4eb6e22fdef89026bc3b0f9847 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/5f79bccdeb131dd17ed478c02b9e63293baf72bf |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/6d23a7cae54d1ba6d9096e5da0faca8db09181a7 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/314ada5d317dfd8295fda15e4b0ec3a2ba0bb329 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/407bae9dc45f0a7120e67d3220e8a3324c20d8a6 |     
  riscv64    |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/b917d461220bb84336a2f7eac2f0fe872e33a707 | ORPH
  aarch64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/426e87cee5dc8db4359192d9c946ab17e3cdfcc5 | ORPH
   s390x     |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/9206836d70fe98fd513a91d0fd774cc919727826 |     
  mips64el   |  wireguard-tools-1.0.20250521  | NOK | https://autobuild.buildroot.org/results/2cd987cafabac6455a03b0add2627fbf149053b9 |     
    arm      |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/5f4c6ac041a4693db2ec81c98cbca2897a8a2180 |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                   perl-5.40.3 | 2 
               bpftrace-0.23.3 | 1 
              e2fsprogs-1.47.3 | 1 
fs/btrfs/btrfs.mk:55: /home... | 1 
            gdk-pixbuf-2.42.12 | 1 
host-gobject-introspection-... | 1 
    host-mender-artifact-4.2.0 | 1 
                host-odb-2.4.0 | 1 
              host-rust-1.88.0 | 1 
                  iozone-3.508 | 1 
leafnode2-9543ffaf82406f943... | 1 
                  libbpf-1.6.2 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
             libstrophe-0.13.1 | 1 
          linux-5.10.246-cip66 | 1 
     linux-5.10.246-cip66-rt29 | 1 
                   lsof-4.99.4 | 1 
                       unknown | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        bpftrace-0.23.3         | NOK | https://autobuild.buildroot.org/results/5196270da9a78583edff94a308efdf189f81a4fc |     
  mips64el   |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/cb3ae71d4e3ba0b6c8ca13e30f9565bd142b0f04 | ORPH
   s390x     | fs/btrfs/btrfs.mk:55: /home... | NOK | https://autobuild.buildroot.org/results/91dec02fa5d3c223cb4ff14e65cc0e1d7fb6d9e0 |     
  powerpc    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/7ec2fb4326ffde01ba98f5e28aba973ee3ec3d52 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3e6c185439723417f810b9ef7af5ab833026de23 | ORPH
powerpc64le  |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/2d7c65d687e63052e679276f034ed7db1013f045 |     
powerpc64le  |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/88db9a3fa1168e690ffce5dd596bbfb19bbea501 | ORPH
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/b742dfdacd29b1daa9404d6f4045ea66ee8aae01 |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/897223bb77356fdaa3d2a651cb01191980b5713a |     
 aarch64_be  | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/1ac3010b00ed643109d076a5d54703981814e4a7 |     
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/da290afa94254a79588f1b9496b43821d4f202b2 |     
    i686     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/3f48de8d9a48804bf0cef883477df5ddd78f0806 | ORPH
   mipsel    |       libstrophe-0.13.1        | NOK | https://autobuild.buildroot.org/results/74598af3aebea4c229418e016e310b90a4c88382 |     
  mips64el   |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/98a5fd8133d63fd77d7272a8151666ba30b587fe | ORPH
powerpc64le  |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/1883cbb01586dc02c11305b66dc1ff4cca0f3b32 | ORPH
 microblaze  |          lsof-4.99.4           | NOK | https://autobuild.buildroot.org/results/eebc9d0bd84be854aa22c62f727d1ead2f3189eb | ORPH
   sparc     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/7b9bbf3d7796628ef1409eccb6e3f64d0344ad07 |     
    i686     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/611023a6317600285bd2b7b7b00b90369a477446 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/c3f27c054679b47286c3422467e01c2aa56d001e |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-python-lxml-5.3.0 | 6 
          host-faketime-0.9.10 | 3 
package/linux-headers/linux... | 3 
                  iozone-3.508 | 2 
leafnode2-9543ffaf82406f943... | 2 
              libopenssl-3.4.4 | 2 
cegui-00b4e1fe174da53b7ed72... | 1 
              containerd-2.0.7 | 1 
                   fwupd-2.0.4 | 1 
            gdk-pixbuf-2.42.12 | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-15.2 | 1 
                 host-gdb-16.3 | 1 
           host-go-src-1.23.12 | 1 
                host-odb-2.4.0 | 1 
 host-softether-4.30-9700-beta | 1 
            igd2-for-linux-2.2 | 1 
kismet-52bcb902e36b2df1562c... | 1 
libuci-f3fc0b76040685829191... | 1 
                   linux-tools | 1 
             parsec-tool-0.7.0 | 1 
                    polkit-125 | 1 
                     pound-4.8 | 1 
             pptp-linux-1.10.0 | 1 
squeezelite-71c012ad9ba102f... | 1 
toolchain-external-bootlin-... | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/972eb93dcb41d36585dc687cb662b7230fe93168 | ORPH
   s390x     |        containerd-2.0.7        | NOK | https://autobuild.buildroot.org/results/7abe4a994eacaccb34878013b9dcc3dfdf6450cb |     
  sparc64    |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/4d3450c9efc36c445b363db026ee7e0b3b2f706d |     
microblazeel |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/0bdad0e421e076832c9eb1b9c9a9d0177f5b0f3d | ORPH
  powerpc    |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/4dd3f9f4c7be18d93586aac4bf1ba92d80d28dce | ORPH
    sh4      |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/cfd32f8b71e429842c757989c58a8e3ada4c90a2 | ORPH
   arceb     |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/815de0651fbb98a2b9f18611c797dc0b066cf2d5 | ORPH
   mips64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/ea0b997c94559ba09966022286c760a80bef4e58 | ORPH
  riscv64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/6e21c16e85416472d913fd9aadd4f73d1d2780eb | ORPH
   mips64    |         host-gdb-16.3          | NOK | https://autobuild.buildroot.org/results/f6eb1cec3db346c48a2549425945d0667404903f | ORPH
   sh4eb     |      host-go-src-1.23.12       | NOK | https://autobuild.buildroot.org/results/9b28a99fc8bbcefc5078327c9ae10bfdd87f076a |     
 aarch64_be  |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/fd1cb7c426b23f69820ca67634cb61d83f9e4db4 | ORPH
   x86_64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/0850798c236c5852d9b780426b713013688c87dc |     
  aarch64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/fb8742b5e7b3701e99c7bd8325fc76ae9a24e7d9 |     
 aarch64_be  |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/77c0027f07ce27c46b8a24f336789efafc0077b2 |     
  mips64el   |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/805b47860626660f3ab9637560186e8033933e84 |     
   sh4eb     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/9336e86a4b9b59ca035fda516e2f1a8f922bcae0 |     
 microblaze  |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/583a75558cde801c8dcaded0597cdb90c1a29384 |     
   s390x     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/bd7636a02e19c42211e7a7ce403e79e6ee61cab0 |     
    sh4      |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/60613c26d2cfa79ab8e34bce72d438d23534ad3c |     
    arc      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/261cdd3ebc3903af25148974b34e8d14ac0c7b20 |     
 microblaze  |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/1433c4b0490c2db72dc589c853c393967938f9f4 |     
microblazeel | kismet-52bcb902e36b2df1562c... | NOK | https://autobuild.buildroot.org/results/1429e376d6a71b9ed09bb71d4fc5dd504dc9b365 | ORPH
   sparc     | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/e4a26a42ffa27859a6629c42ec324535284d03ee |     
   sh4eb     | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/1f3d3e5d06b7d12678d84ccfda5a4d6163528b32 |     
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/722793137d726df294ec15247c66792f7aab2a8f | ORPH
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/eb6b8a13b8a6ff8bdc257795bdc72e4a412ed2fa | ORPH
   sparc     | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/ca787ba5d3362f2f972d81c7c6eed4b1905bf370 |     
  riscv64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/2263546ac817833b898f15e420df7e738f2de602 | ORPH
  riscv32    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/1f1e2684ffb743eee667ec57d8a0714c78b1fe4b |     
    sh4      | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/4aada78867e66c0cd640710e85bf2b4adef20022 |     
  sparc64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/cf0a0a7f2fa57e8a343ef99687b4b6959be1f39c |     
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/18fed1d2151ec07a142a4b9e0b398090bf32b95b |     
    or1k     |           polkit-125           | NOK | https://autobuild.buildroot.org/results/85c5648effd19b9030e5b9fe30ce668afe07fce2 |     
   s390x     |           pound-4.8            | NOK | https://autobuild.buildroot.org/results/c1acb790aced3c87f04fa305a03029b077eb6d9d | ORPH
   armeb     |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/080b844c7b35e0a551a10280e88759fca9bb20ea | ORPH
   mips64    | squeezelite-71c012ad9ba102f... | NOK | https://autobuild.buildroot.org/results/acc92b2cfc551ad672c622db3569523288699f25 |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/3037742b1539c26fbef2f02e54ea22ce099008ed | ORPH
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/a1118054ff0dcb997788824ce5bbd4041c4604ed |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
