Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FAFBCD4F3C
	for <buildroot@archiver.kernel.org>; Tue, 19 May 2026 03:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1325260868;
	Tue, 19 May 2026 03:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gmGxX9mFUykB; Tue, 19 May 2026 03:18:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDF5260867
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779160693;
	bh=KVZ0NeMMcWf6s4KNsTDYFrN0zpGhywnDm8/5xsKPzyg=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FzkJm8dRS2yBenX4Ep2tEd4lI7+D1CVPdI8SQGyI9kYOkO6e5BGwG7C0iZYFVL0i6
	 YfTnn4PlRmGCQMw/Dh3YZLA4ULhvxjFxD/ZfoE1CSgqlWd80ZqYPXLw38sak8c/bLF
	 HGiiyTgPScVBab4OFfu/MS18Tk/P6JyKNfxI73hYKp/bVK8GZnUmiZ3eHH6hFiEqqB
	 OsV9ryyx1TaGfddncdaDE7ZNzAymNQjtab0giFdvJ2dca6xzbmglnnWUyC94UyKpiD
	 iYC5Mi5MHMEZXi6X2PN0h93q0vI/iPEERmbiUxYI24PR9j4w+TSeFVlRd/w+Dr3DJV
	 vItlHolZ1FC9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDF5260867;
	Tue, 19 May 2026 03:18:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E79C282
 for <buildroot@buildroot.org>; Tue, 19 May 2026 03:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14B5360868
 for <buildroot@buildroot.org>; Tue, 19 May 2026 03:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mriZnzOqJDhG for <buildroot@buildroot.org>;
 Tue, 19 May 2026 03:18:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B893B60867
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B893B60867
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B893B60867
 for <buildroot@buildroot.org>; Tue, 19 May 2026 03:18:08 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4891c0620bcso18227615e9.1
 for <buildroot@buildroot.org>; Mon, 18 May 2026 20:18:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779160686; x=1779765486;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EIII7FisxA7oo7iEmCEsvkI2MGTPa4GNYMyhSMjQuus=;
 b=n5FkAnJWuNoUymdvf5+TV8SE08z6RIEXQgPDyXJJcvRsiIwzzbCVNjZ/b59yLp4oE1
 EymsZzhjlIfcoot8KGWhXBmzcnhGqyJXHBdIomJ2ZG0dfgaH2Nr+9lv6qQ9/GMmJTsTL
 tt7yofjn+4dGhY8AFqyZ7JWeJKOT2IpPgocOUbqG905e0YLd/8E2tfxwQx6lkTqZIzCT
 ioX/zyNldsTYy96mrIlOtUawmGIwvY7NFLwF+rj6kcurM667lvMLj90Y7DsBdM7EGAai
 ZkZ6HOZyT3sWwFHyh30ljsT4/x1Ts4hecFNwCdidAIwiUBtb+Xy3DHRquP1ZZEYNDz99
 PShg==
X-Gm-Message-State: AOJu0YwpIUsW1nN/t6ZdOgTwCuZ5i8I42lO5AD2I4AFkoykl2/kftRhH
 oreCAeyiSjvtLZzlnMBkd9l/JVd8gyHe4k02uzGsCfNM/mFGVNpxWz8uBHsE5JH0
X-Gm-Gg: Acq92OG8WCgbrQsA9sOxm2zVLY9KrGCS23anfVuDBuuXHlqGEHoZgIR/ZxCNHXXVAA2
 0bj2XIS6pCEWUTxHQvi1o7ivlOvzBYod6Yf9uBLC04Q0nIb3Fj96Ookmu+vBpSOyAzkbcbDYPY3
 o6Kt0mDMW+HNdMZ2dNBegYXPlrGpDrTMX3BYxIAC+kFy2xP9VvHDP0tFMeS5FubWUFjfRELUu2Q
 IK0UPTH1RlQsRfRMYaEedwQyJmRBzFMwpeOBxR/HMKXbw6bbQfOhsS3rukeunycwR3rvHQjk8qX
 +6yLXqY2xmb2xbEMkHcV78SdBpmHQAL91lD4dwjx5AbOlFo55DYN9Dzq3elZBXz43VxCUFOtawQ
 AriunQCg4LjAQPaFSvjjGEaO7a8lJLDhFh0TDqjbXJQB0s7m6zkju5S6CRdbvQGPpv4yu64WS0a
 TmJprCrVR0rD5LnBaqBCU0s3ArJl2FXlfEPlcGkE2MEBnQ5r5X9KA=
X-Received: by 2002:a05:600c:35c5:b0:48f:f64c:c314 with SMTP id
 5b1f17b1804b1-48ff64cc4d1mr218084575e9.30.1779160685877; 
 Mon, 18 May 2026 20:18:05 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9e768acesm44865544f8f.7.2026.05.18.20.18.05
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2026 20:18:05 -0700 (PDT)
Message-ID: <6a0bd66d.8507f887.3b030d.3b3e@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 19 May 2026 03:18:05 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779160686; x=1779765486; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=EIII7FisxA7oo7iEmCEsvkI2MGTPa4GNYMyhSMjQuus=;
 b=b8lkHubrCw7OEVADKTsdB6ePgbnpN7N+I7ARpVvNy7EVMTwGu4X8II2ITOp/2Q1ib/
 WmRl/AMVuRXnJtQyHbAsMOp6OX2Hp38X4YCfET2hVPtv8noHIDFkP1IRW/yRb52NQ3lz
 CJodkVceYvIE1sXA0urZVDCk4fmtK5kwdNN3zOQn/IwuTpoLVfAHC2d8Jv/c+5v1srT4
 /sKqqAo0UAP1lieVX0N/wwM5AR5vRecmTdDoyrC/Ul6XD3vAUFKqKfbN29cNr2438Vbj
 UlGOZNa6WhbsgRU3G9K8MtECaPpqWkqxPyQXdainTkKIA5U5cKzVRgu46vXM8tgzBjLi
 PwfQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=b8lkHubr
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-05-18
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

Autobuild statistics for 2026-05-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 23  | 42  |  0  | 65  |
  2026.02.x  | 12  | 17  |  0  | 29  |
    master   | 61  | 139 |  1  | 201 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 10
glibc-2.43-27-g4070d808bea1... | 5 
                       unknown | 5 
  gobject-introspection-1.84.0 | 4 
              libopenssl-3.6.2 | 4 
                   perl-5.42.2 | 4 
phidgetwebservice-2.1.9.201... | 4 
            gdk-pixbuf-2.42.12 | 3 
           libmicrohttpd-1.0.5 | 3 
               linux-pam-1.7.2 | 3 
             dahdi-linux-3.3.0 | 2 
                   dante-1.4.4 | 2 
    host-gcc-bare-metal-15.2.0 | 2 
host-gcc-initial-arc-2024.1... | 2 
                 host-gdb-15.2 | 2 
              host-pahole-1.28 | 2 
            igd2-for-linux-2.2 | 2 
                  iozone-3.508 | 2 
                  libnfs-6.0.2 | 2 
                   linux-7.0.9 | 2 
odhcp6c-f19dd37fb467c9cf10c... | 2 
                openssh-10.3p1 | 2 
   openvmtools-11.3.5-18557794 | 2 
      shadowsocks-libev-v3.3.6 | 2 
              skalibs-2.14.3.0 | 2 
         spice-protocol-0.14.4 | 2 
                 sqlite-3.53.1 | 2 
            vorbis-tools-1.4.3 | 2 
            18xx-ti-utils-R8.8 | 1 
                apr-util-1.6.3 | 1 
                        assimp | 1 
                  bcusdk-0.0.5 | 1 
                   bird-2.15.1 | 1 
           clinfo-3.0.25.02.14 | 1 
                easydbus-0.1.0 | 1 
              fftw-quad-3.3.10 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/oci/oci.mk:105: /home/bu... | 1 
                 gnupg2-2.5.19 | 1 
                 gnuplot-6.0.4 | 1 
               graphene-1.10.8 | 1 
                   guile-3.0.9 | 1 
                haveged-1.9.19 | 1 
host-google-breakpad-f49c2f... | 1 
            host-mfgtools-0.02 | 1 
      host-uboot-tools-2026.04 | 1 
          host-xfsprogs-6.19.0 | 1 
                iproute2-7.0.0 | 1 
                       jose-14 | 1 
      libabseil-cpp-20260107.1 | 1 
libfutils-c326ce0cc2a735438... | 1 
                libglvnd-1.7.0 | 1 
                 libmbus-0.9.0 | 1 
                libnice-0.1.21 | 1 
              libsodium-1.0.22 | 1 
           libsoundtouch-2.4.1 | 1 
            libxkbcommon-1.9.2 | 1 
                libxml2-2.15.3 | 1 
                 libzlib-1.3.2 | 1 
  linux-headers-5.10.254-cip72 | 1 
        ltp-testsuite-20260130 | 1 
                    lua-ev-1.5 | 1 
            lua-sdl2-2.0.5-6.0 | 1 
                   mpd-0.24.10 | 1 
                    mpir-3.0.0 | 1 
                       mrp-1.2 | 1 
                      ndctl-83 | 1 
                 nettle-3.10.2 | 1 
                  nginx-1.28.3 | 1 
                    olsr-0.9.8 | 1 
                openocd-0.12.0 | 1 
      passt-2025_06_11.0293c6f | 1 
                pipewire-1.2.8 | 1 
          powerpc-utils-1.3.11 | 1 
                   ptpd2-2.3.1 | 1 
            python-numpy-2.4.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
                python3-3.14.5 | 1 
                  stunnel-5.78 | 1 
                 sudo-1.9.17p2 | 1 
                 systemd-258.7 | 1 
                tpm2-tss-4.1.3 | 1 
uclibc-ng-test-132c6134d691... | 1 
uhttpd-15346de8d3ba42200249... | 1 
ulog-0389d243352255f6182326... | 1 
ustream-ssl-5a81c108d20e247... | 1 
             util-linux-2.41.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/4485f4bcaeb8f8e6b0a11930b30616c3d97fb228 |     
   xtensa    |         apr-util-1.6.3         | NOK | https://autobuild.buildroot.org/results/585578678c5fe6832ed103f90158ed113cc2f7c2 |     
  aarch64    |             assimp             | TIM | https://autobuild.buildroot.org/results/33639a3f067dc1875b3a59447a1910e5935f496e |     
powerpc64le  |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/4385c8d77071dfd615d7150f6f47241640ac780a |     
loongarch64  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/7e8dd199d691fed2fa096328fece3507d78966ea |     
   x86_64    |      clinfo-3.0.25.02.14       | NOK | https://autobuild.buildroot.org/results/6bad5adca152ff4cae46078c23a755fddd4bd6d4 |     
   mipsel    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/9db9c7d8153012f587894b77140f12f92d2169b5 | ORPH
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/3bec9891b1f207162f9fc9cbd0a079f129480f1c | ORPH
   s390x     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/be62c7cceaca996e2ebf407964c9958e249fc2c1 | ORPH
    mips     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/61ed349ba3e507ec43c875a78b910e4b264021c0 | ORPH
 aarch64_be  |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/54dc9b6de12676c6a10da3c834a60fb456b7d2d6 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/1eecd49f9eb5787aa3f8245d2bb59cb26202b6ba | ORPH
  riscv64    | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/4448528ddd2f0c7d60acf017e09f7a8851f9510c |     
    i686     | fs/oci/oci.mk:105: /home/bu... | NOK | https://autobuild.buildroot.org/results/21bea9047a88aae8faeada79156f2645c8a214e7 |     
    or1k     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/88dbbbc89274ddf37ee0fefd195dcf22d6711c97 | ORPH
powerpc64le  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/fb203e9b2a55d8d43d7473481942382799ea5dff | ORPH
microblazeel |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/06ae1e5cee7de1f71d7d4d4750c121a39837a657 | ORPH
    mips     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/14bc7a5738e63ec890adbc5eec290f39323e87d1 |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/ae1976d823347bf3ece8971d6d12e75de7897590 |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/aa255dadf8bbf831be158b0a759155e430e31e7f |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/1b5dd4f9c1b425fe87bebfbb18e772300e9a5f24 |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/1cdbd7cfb4f2dc6a4b9f4c3fb7a37fc89ce78efa |     
   mipsel    |         gnupg2-2.5.19          | NOK | https://autobuild.buildroot.org/results/c3dfd80dea45c4062f106f5f1242a20b8e2b011c |     
    m68k     |         gnuplot-6.0.4          | NOK | https://autobuild.buildroot.org/results/863c2956ba09ac72e27bdf35e56c19316ca88f26 |     
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/d0a7cdd55801b01bbee4a1a1918e05eb0d79802f | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/cdde50f0de345aab0016decd8cbb5e2712d19397 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/d4f712145d90ab77adac5480a9ce1a242e46253a | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/b2fee2634c7bfb5dbdfec75282abf1d4ed5dae8c | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/5ab4d113166f03484f88c2a5c15ec107996d9b58 | ORPH
  aarch64    |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/49fca714be2cab4340beab9c0f87b9de8e03afaf |     
 microblaze  |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/3dfd01d08cd1889e38500cce1642e461dd192c21 |     
    mips     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/4e71abc108162ba62a61a99c0c7373db5e866e44 |     
 powerpc64   |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/b11627d81f691c016531beff6f796d38b6901ade |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/65dafc26dd6162dc87afa50805b73939269f5c2e |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/6ab8b4247b25b014966b2e0614c174d2a7e5d26a |     
   mips64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/86edc7d3985e20ba62dbaccc591853193ec0eef9 | ORPH
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/2e54f9c0c6266f20311f14180aa375e1d03a46f5 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9edcbec76673f53e5d23d2b30cdf9b880ff4f7f5 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/38566cec7cf60d54c2ba3c80d3031c719d8475b3 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9d139345d7bc0bcb9ced9d0b5382433de18d0b2a | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c20c91bb9a91b9998d022d0d74429bcd9093aaf9 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d567808e2cff84caf588a2d6123f363967bb39cc | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b5c30db52bd4f97eb3e518d08f6b36929140e51a | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e0044d82665bedab8b6ae0bd11a77447f72174f7 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/754e82c7f5be57588e1ad2dabfd1bf30a2cca1d9 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7bf24d27fe315268544b2921b6d47f4822b7912b | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/07eae34abeb8b1bc2aaf33edc25a38721a8345ae | ORPH
  aarch64    | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/57360ff59703d9a1fab596dd6864468a71359fb1 |     
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/de233c075aa7ef43d201fea4dbe0addeb31d9283 |     
  sparc64    |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/52051dc6822538f028195002198b7b8d59a4624b |     
loongarch64  |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/d6ca880beb5a72fce8bd3da818410453f5b709a1 |     
loongarch64  |    host-uboot-tools-2026.04    | NOK | https://autobuild.buildroot.org/results/520ed2c4aada97bc0971ebd72d863e8e8fbd2390 | ORPH
 powerpc64   |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/256aab883826d96d7cb8b9dce0ef91a8fbbb6716 | ORPH
    arc      |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/6d93e5a4184371990064e6c54f20aa2205a5396f |     
    arc      |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/f4a79e307647838deda3acbde2b2270a514cd5da |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/c09227c8dc7d04344a6342153b2a254a16477594 |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/c9b2fd5a11c336f11a85a4e8ad0ec2c6c3722ff0 |     
 microblaze  |         iproute2-7.0.0         | NOK | https://autobuild.buildroot.org/results/ee691b12ee6f0f1da00158b5ef81e26040ccba6b |     
   xtensa    |            jose-14             | NOK | https://autobuild.buildroot.org/results/79998638f62ff765758cb33113b74c1998d444d8 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/421babe451a3c56b6d9660f25bbe642c825d7a31 |     
    sh4a     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/6a373d4688a33611b2fee353de2ce38ed9b4b5ed |     
    mips     |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/bfef2a5fd9bb3467a15ddebae932dc773966c2e7 | ORPH
   mips64    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/60ea4e9b29138ca92390984c18abb1863c8d9683 | ORPH
   s390x     |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/0b9c3e36bb595adb9cf8d49f32380589ddc283d5 |     
   s390x     |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/c3cbfafc8ec55fbe92c8517b5269586007db0ceb |     
  aarch64    |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/139a837c226fad1e3de742fddcd9b0b13cfbabaf |     
  mips64el   |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/8373bb884ba9859c210d358c1d1d4370cb40bf29 | ORPH
    hppa     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/96ad643709d539bf9a16c5cde2b01dadc5e41ca2 | ORPH
loongarch64  |         libnice-0.1.21         | NOK | https://autobuild.buildroot.org/results/8b37e4a4df8afbc00a10a87cc3e0e11e841247af |     
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/28aa7e28d4a81c39855d97eb0a563b54c1a7b0ae | ORPH
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/1f28716660c7918b9db470472ac9cb32cb1b3264 | ORPH
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/fe0ba31912ea300038b6fdd589012fb946278ac4 | ORPH
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/458497f0b261d645f27695a928641c3343031096 | ORPH
   mipsel    |        libsodium-1.0.22        | NOK | https://autobuild.buildroot.org/results/0e1753d357d5764145330a44871ad1a05235751f |     
   mips64    |      libsoundtouch-2.4.1       | NOK | https://autobuild.buildroot.org/results/e754d2e398e1cf42f23eec223adeaa695afe8bfe |     
  riscv64    |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/618a0906c208820d2381c16a9746ddc4cc196daf |     
microblazeel |         libxml2-2.15.3         | NOK | https://autobuild.buildroot.org/results/c6c423c868a6eebac5521a92419aa691a3bbd579 |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/96116cc611d073315aa2ba0a1ea2989f6fe54614 | ORPH
    m68k     |          linux-7.0.9           | NOK | https://autobuild.buildroot.org/results/e0861accb06869fb7e64c182985d7dc23c4002be | ORPH
    sh4a     |          linux-7.0.9           | NOK | https://autobuild.buildroot.org/results/4be453058bf1db41ddf03765262294c81114a4d8 | ORPH
  riscv64    |  linux-headers-5.10.254-cip72  | NOK | https://autobuild.buildroot.org/results/a77aa59b9c99b3af679d7a83cd6d2391493a9140 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/466be2dfe5a44ba1bcc71e02e293884d2c185603 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/9d8447f42bd9579a4e05ed95c2a055f565fa50fd | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/5c8195c9830eb00f111c91437d3e5bde6fd88408 | ORPH
   x86_64    |     ltp-testsuite-20260130     | NOK | https://autobuild.buildroot.org/results/1ad15820c58c050003766a1cd3bb2ae5594c5138 |     
 powerpc64   |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/4d7cec6a625745bd0634a2d92adc24e8548684c0 |     
powerpc64le  |       lua-sdl2-2.0.5-6.0       | NOK | https://autobuild.buildroot.org/results/cadac0b451ad56745d2fb67df9acb0785d0db855 |     
    or1k     |          mpd-0.24.10           | NOK | https://autobuild.buildroot.org/results/c72d11535857a447acae806397c451b167e00b13 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/892380695bb95b6fb94e7b5793977820d8cdfa09 |     
   mips64    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/2c556120b4fe95014461bd9a999b4e68a894a6f2 |     
loongarch64  |            ndctl-83            | NOK | https://autobuild.buildroot.org/results/fc510d7e6c94f16e66be0010a2dea6f5286d9245 |     
    or1k     |         nettle-3.10.2          | NOK | https://autobuild.buildroot.org/results/005a76e459fe08659d3ac3c4233d8cc958affa9e | ORPH
   sparc     |          nginx-1.28.3          | NOK | https://autobuild.buildroot.org/results/de07840b21243b1c651476ec7199bfc44568d567 | ORPH
   mipsel    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/549e9ac7d714b3760d42f9e8c1c1cd80fa7fe6f8 |     
    or1k     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/2d0cbc8508335c4eaeec248cd87efd12b819ff06 |     
 aarch64_be  |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/753f2e5c437d190177eb43db067f29646a9bfa93 | ORPH
  aarch64    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/df828360aee4bdccac562a07e042c86f2218f1b7 | ORPH
   mips64    |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/3c8136df1e95c3da86217d92e0d6f17ca799fc2e | ORPH
powerpc64le  |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/643a2c0738a2742b2a0fad70ecd3c01f86936e65 | ORPH
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/a16f1a06197f55664c06eacb41ee38e21849b4e4 |     
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/5c6407b9f8ac1959717e18d81d629b4a4455b06d |     
    arc      |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/a00801907a70f2293973025f53952ddfccaa29c6 | ORPH
   sh4eb     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/ae04da7bc05aa36f9cebd9b46d9440bed3959de5 |     
    m68k     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/c0629182412d1135443f8ca44fa6eae7c13341d1 |     
    arc      |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/708af78d8a770f25f015c34d06a0428785e179fc |     
    arc      |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/33305beda4877ef2291560cd5aafc50eaec2e791 |     
   x86_64    | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/77df2a338806a3d32cce5cd076c6bccce8f2052f |     
powerpc64le  | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/a6849f3a5b019006d2b102b0b2e9b79341249a26 |     
    hppa     | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/7e7fb782d2f38e3d391936ede34b869b2af33bcf |     
powerpc64le  | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/31863c2eed85c5bf56e7116b306b1596c34ca9a7 |     
 microblaze  |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/5bccf6816e0caa8c720be2e6e3aa8c5133a189b7 |     
 powerpc64   |      powerpc-utils-1.3.11      | NOK | https://autobuild.buildroot.org/results/03f0ffd8e8ee739001825a33182623df1e3f51bc | ORPH
   x86_64    |          ptpd2-2.3.1           | NOK | https://autobuild.buildroot.org/results/b875d73654c59d7f908d9dcf21c454df1361fa31 | ORPH
    mips     |       python-numpy-2.4.0       | NOK | https://autobuild.buildroot.org/results/7175701cf105d3e2b69a09ae75c932e58caab830 |     
 powerpc64   | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/4b4b4442a648770e7c5e0699e44dc316ec3634a4 |     
   mipsel    |         python3-3.14.5         | NOK | https://autobuild.buildroot.org/results/52b2de5a79ab56e9f028047b98744d0034e97884 |     
  mips64el   |    shadowsocks-libev-v3.3.6    | NOK | https://autobuild.buildroot.org/results/a4ada3e2a0d960c3f6d7f8021da05d3b9f86d176 | ORPH
loongarch64  |    shadowsocks-libev-v3.3.6    | NOK | https://autobuild.buildroot.org/results/150172346b3019a5483f0a4b5ba050b7e61274e6 | ORPH
    mips     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/2d17991f48859364d61163be5eb20d8426441e09 |     
   armeb     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/2e64f6900e38fd7019fa266bf671d4d786999998 |     
loongarch64  |     spice-protocol-0.14.4      | NOK | https://autobuild.buildroot.org/results/25160d627cf0672661be66adb8ca438ba9f6398d | ORPH
    hppa     |     spice-protocol-0.14.4      | NOK | https://autobuild.buildroot.org/results/6880687e2571a545bfd730367a081993220622c5 | ORPH
    m68k     |         sqlite-3.53.1          | NOK | https://autobuild.buildroot.org/results/682d765919991e4167c5f50a3fc0d898aed5072a |     
    m68k     |         sqlite-3.53.1          | NOK | https://autobuild.buildroot.org/results/3ae7e7fa95f1658334ab816aaea032c5c49a5b7f |     
 aarch64_be  |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/96c58bc89e367b786c49be59a4256a7127e334da |     
   mipsel    |         sudo-1.9.17p2          | NOK | https://autobuild.buildroot.org/results/0e9f0207606189226151dcce001a65936da82417 | ORPH
powerpc64le  |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/15f330cf0f836742f13e3ed0163c196b5562f89b |     
   x86_64    |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/fd90499acc400ade79eacf0b8c61375673060d5b | ORPH
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/c9f3b0bfe16a729537750dcd99928df71e6f0c24 |     
   mips64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/2e8e265735ecdac16addaa4fb80af877da6f310c | ORPH
    or1k     | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/16ccc548f83952138b40d65992a866ee363edf18 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/4fb4ee5e46e51af10699631424f355935899f4d6 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/a71059a66d1e2d719e9bc0f3193fc45bcc637c4c |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/603c85e1c5f0e329439ef68d7155742220aa1cc1 |     
    hppa     |            unknown             | NOK | https://autobuild.buildroot.org/results/958f1dfbca2aefc35d1d2e3cf3fa3f40f25ec288 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/138eee52dba0e4689a30e78d5fde38e2fb260564 |     
 powerpc64   | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/99dabefa78c2f88798410858f9f9f6ab86d7e213 | ORPH
   mipsel    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/af887b5f4703b890549d764fad03ced20342c58a |     
 aarch64_be  |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/6833d835fcd2bfb3c496536d520462ebe583c2ae | ORPH
   armeb     |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/1e91019717c19ce21431ea990f7c6995908bd55c | ORPH


Classification of failures by reason for 2026.02.x
--------------------------------------------------

     libphidget-2.1.9.20190409 | 2 
                       unknown | 2 
           at-spi2-core-2.58.2 | 1 
             dahdi-linux-3.3.0 | 1 
                      gdb-15.2 | 1 
  gobject-introspection-1.84.0 | 1 
    host-gcc-bare-metal-15.2.0 | 1 
                 host-gdb-14.2 | 1 
                host-odb-2.4.0 | 1 
      ipmitool-IPMITOOL_1_8_19 | 1 
                     kbd-2.9.0 | 1 
libfutils-c326ce0cc2a735438... | 1 
                 libmbus-0.9.0 | 1 
                 linux-6.19.14 | 1 
               valgrind-3.26.0 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      at-spi2-core-2.58.2       | NOK | https://autobuild.buildroot.org/results/6e180cc4b5f6bd6ecc000b65ff905423a4ff0219 |     
   armeb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/03fe0e3d768825ef0f295a833f73a3c202bbb8f7 | ORPH
   mips64    |            gdb-15.2            | NOK | https://autobuild.buildroot.org/results/a0809bbc14d2d87e4f50d16ae9ba109260adb561 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/367273974d9819fb5dad457186ca579c61e1f25e | ORPH
    mips     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/d82cf53ccee951b2a51aa8df6571a3ea72f81bdd |     
   mips64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/4c5e8fba1d5e11134b0ba8eadbad45cde1f011be | ORPH
  aarch64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/9c404d59d0cb0e5f605b098485668a48538d2791 | ORPH
    or1k     |    ipmitool-IPMITOOL_1_8_19    | NOK | https://autobuild.buildroot.org/results/e3b299d0da22fbcd9b84569a0a924fac7b91a083 |     
   xtensa    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/10f5c3da31bea6d517a3ddfc69d5f2b2bbc6fc77 | ORPH
    or1k     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/98b6363b84276303d7dbd7fab3fa0db396f6731c |     
 microblaze  |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/5ae4545a3c4807630c0879eebd8d5e3c1f7c989e | ORPH
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/5bbddb9bf72043e1b8627f5961bd5ce14223b0f9 |     
  mips64el   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/1003fa3255fb639282c9ce1747f08fccab74862f |     
   x86_64    |         linux-6.19.14          | NOK | https://autobuild.buildroot.org/results/0aac8a7df48cbf6bfc5fb5fc6b05860823689743 | ORPH
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/a699cb01f9fc73bcec6e64e46669f8dc90b9d010 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/ca2ebe95fe0b7e26ebd10169a0e38e5687e9d557 |     
   mips64    |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/f78848bcf46a22e835db1bded9bc9b583db844fa | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                   perl-5.40.4 | 4 
                 host-gdb-16.3 | 3 
        host-python-lxml-5.3.0 | 3 
                   dante-1.4.4 | 2 
host-gobject-introspection-... | 2 
                 libmbus-0.9.0 | 2 
                bpftool-v7.1.0 | 1 
                  cairo-1.18.4 | 1 
            gdk-pixbuf-2.42.12 | 1 
  gobject-introspection-1.82.0 | 1 
               graphene-1.10.8 | 1 
host-am335x-pru-package-5f3... | 1 
            host-binutils-2.44 | 1 
host-go-bootstrap-stage2-1.... | 1 
host-go-bootstrap-stage3-1.... | 1 
host-heimdal-f4faaeaba371ff... | 1 
                host-odb-2.4.0 | 1 
              host-pahole-1.27 | 1 
 host-softether-4.30-9700-beta | 1 
                   libks-2.0.5 | 1 
              libmodbus-3.1.11 | 1 
              libopenssl-3.5.6 | 1 
                libsoup3-3.6.6 | 1 
             libtorrent-0.13.8 | 1 
                 libzlib-1.3.2 | 1 
               openblas-0.3.30 | 1 
package/linux-headers/linux... | 1 
          pkcs11-helper-1.30.0 | 1 
             pptp-linux-1.10.0 | 1 
                 sudo-1.9.17p2 | 1 
                       unknown | 1 
        util-linux-libs-2.40.2 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         bpftool-v7.1.0         | NOK | https://autobuild.buildroot.org/results/838f9ee95e16257f82d8079866662fc403c7a985 |     
    arm      |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/1bbefe4cf83987669fb8fbc44d358a135f560fdb |     
  powerpc    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/f967bebc50e22b21f5e8d95a84cf08f27ba8f5da | ORPH
   armeb     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/424aa301af0b32bb279c04c09e9500fabccbd1c6 | ORPH
   mips64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/501feb304974267da9fb4cc0b53c215a6d9d0a4b | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/09d39e52b3f4df98fd6ef1cbab9ece0e2332e67f | ORPH
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/77bd76600cae389aee05068d70c1d41c65829677 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/0dffd8f3d510aa7bf7762ca3c2195816225ca0f1 |     
   x86_64    |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/d01a61f821306b60b027f2bef484c6e978ac737d |     
   x86_64    |         host-gdb-16.3          | NOK | https://autobuild.buildroot.org/results/72f7950fad72e032fb50f80bb9a209fdf1c798dc | ORPH
   sparc     |         host-gdb-16.3          | NOK | https://autobuild.buildroot.org/results/59ceff6d10a120737ddfb1d3febe201946e3f972 | ORPH
  riscv64    |         host-gdb-16.3          | NOK | https://autobuild.buildroot.org/results/537a0c4f549db62cd97e493a44a99462c033ba6e | ORPH
  powerpc    | host-go-bootstrap-stage2-1.... | NOK | https://autobuild.buildroot.org/results/19cb06e400ea49f3e1cf24beeffbccac47d3fd21 |     
 aarch64_be  | host-go-bootstrap-stage3-1.... | NOK | https://autobuild.buildroot.org/results/b7c74d90f1261676a1a10ff690bdce7f991eb259 |     
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a2aedbcc6f007aecb4dd86966af29678cbf7dd8a | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0e5c9ac61baf48ed1af82aa5da69db461c0cb2e9 | ORPH
microblazeel | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/ca42049470fac7347c18d33e02994ab49b3c7b82 | ORPH
 aarch64_be  |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/a6e578ea01f732f421654448fe14543e8633b57a | ORPH
  sparc64    |        host-pahole-1.27        | NOK | https://autobuild.buildroot.org/results/7ca4c53aebfb58ec15ff354b77f49056b87028f5 |     
  mips64el   |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/cf7edc9d3a50d969f3094ac586da95831cb46001 |     
    i586     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/934b3f8ae0a4d8f6c2a2e890906782b87b01c956 |     
  aarch64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/d5bc69a935a169d99115b85c089d762b32d7178d |     
   x86_64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/177b9f80392d0f30a5c99d196ec34880b5c293a9 |     
    i686     |          libks-2.0.5           | NOK | https://autobuild.buildroot.org/results/f90aa886e195a9b9de2ed79b6d209b7634f76e3c | ORPH
  powerpc    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/a8ba6ff0818f60ea3d592a91fd00d6dad53bb247 | ORPH
  powerpc    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/de3f7472bcbed4998798dc03c43473a06d3edfd2 | ORPH
   mips64    |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/495943bda7f0084acab3fb4b4abf5ecef41a928c |     
  riscv64    |        libopenssl-3.5.6        | NOK | https://autobuild.buildroot.org/results/a4ecd22f862f35a2e84c0ecf136ca290388c6846 | ORPH
    or1k     |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/7285d8a32b1da9e807b75ab84aaad598f09af512 |     
    m68k     |       libtorrent-0.13.8        | NOK | https://autobuild.buildroot.org/results/0bbdc5ae3baa447ab78e93066a6d959cf06947f6 | ORPH
    or1k     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/37b77be43ec2a6856c8984508aa6937cad65f45a | ORPH
   mips64    |        openblas-0.3.30         | NOK | https://autobuild.buildroot.org/results/d2c2e14572fd11cf91ebb4117c7b01b32a712754 |     
microblazeel | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/3241748cb7dd32cb6c69fec9624b942aaec5e55a |     
   armeb     |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/3f3765be9f43221d518f3e4abb095f37c81beb35 |     
 microblaze  |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/962b71394633ee9877d53b9493a59d5d063eb3a6 |     
    m68k     |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/d673d2ed54574106f4623a75e7eed90b37dd0abf |     
    arc      |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/7b73ce7c4c138d9d8d5700d7a04cba4e8b09e563 |     
   mipsel    |      pkcs11-helper-1.30.0      | NOK | https://autobuild.buildroot.org/results/bd556578a007cf08e2f7bfe5eb5bd01c39d20030 | ORPH
    mips     |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/76b27e1cde2b5039e8b0a3b54ce2b1ce1cfb11a9 | ORPH
   sparc     |         sudo-1.9.17p2          | NOK | https://autobuild.buildroot.org/results/323cc967de348b33a6f0901a51bd44245191e257 | ORPH
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/39b9d49063d4790e0a15ed51c547cfa4d3ac3d0f |     
   armeb     |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/2a0e97623feadb21059beef25c6ddc935f251e57 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
