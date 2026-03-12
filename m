Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BA6FED2C8
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 04:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4ED541813;
	Thu, 12 Mar 2026 04:22:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YOLY5tAqunm6; Thu, 12 Mar 2026 04:22:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 128C0417AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773289378;
	bh=T0Nb9Gbyo6XyMmUsQGFdnpBfHxFvL9xz38ab7BS+UBs=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WTWvNLgb812i6uxBHsgqo5TOaM/1v0ROPmTSGQ+DnR1LTsV5boEv1dzNFhBb5gKq3
	 IV5nwHkgU5/AfBZXPHtuzOklf4Lor9XufsszUp9XNBCgTvbC+h8enZ0sHB2qGrJFcm
	 y90b5HrNNy80x3GM3jzjV4oN8+FLtOrKdZev9O6aQcd2SmGnDGj5P6ySUi/u7d9BgE
	 tqLK7J+nlHg7ue1hqEezOvHBT9/wTlN096CHiHQLKMnw2W7By/RkoRoOk1qzZGsSXU
	 uzmWaNOJRExpqk34NQ58p93BAW3te3cino0l6IlMYjV3FvqQbk+hLHJpo42qe1xB2w
	 O5drOtAl7ABhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 128C0417AD;
	Thu, 12 Mar 2026 04:22:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C4370228
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 04:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B484B61C46
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 04:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZkIv7J4N-iAH for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 04:22:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C05CA61AB9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C05CA61AB9
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C05CA61AB9
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 04:22:53 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4852f73d0a3so4754435e9.3
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 21:22:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773289371; x=1773894171;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZcEjXev7G16CBUQXZVS1Tq7T4EemqbHSylU1rM/1Ap8=;
 b=PbW4KbTmEAaaH91Pz99FIRWe6VMFECMA4jzdDAQ0bRXZZnAhJ9spPaW7bJV9BDzLf0
 AhnuB/SSdqHgZM7IZ7RSMiaZtjQLPFBcjNtEEgXUE5bn3nWWnsOyXvcemxAP0sG6ZS9W
 uMsDepMRGeTQ118SBepz98mgSHchHXlu5/7iBei7gR+53xcPAX5/BaUq/to+Ff3z8btK
 D+cqKAOEpzlyRWpc+3aCV3x2bhVICJOsnojmjo/78Z49Hfdj4K1qrEn3YkwzFN9RvODw
 J1M8PuhO+H5tqoenSWJnHPEdH/nU8NfltXxrept9v0x9tOCPQyhwDoiV/3UvCUtg69G2
 UrEQ==
X-Gm-Message-State: AOJu0YyxD5BgIqFnN9EYh7jFpX8a3gfkluhcj2f7rIb0kc0mDh/tATib
 w8FxcBnrWFV1w0f5uJSCdQXDmu9Eb1okSMtUulGJUEPVxRiepHzI0NMAk37iKCr8
X-Gm-Gg: ATEYQzwwD4kvx9rVPCfsKdcUJsyroFhkHRU9GxYnCPqJb6i97dtedFEmCYMg869WluI
 DXjX8KwX++TGgzVmjFJkHZhvqatKQSkR1pPdKa0nMfdfg8XDUA0NNWRfyPDbSqDoDGdvho+H2h9
 +ouy80ybTiIc2DhVlQsgnNTy5tkKEbrppixKAXpsmC6/4PNYYRoy69dKTKRY4Xx8wAKTkxLIJpR
 Y4FhO9+NQXBtKk9O0JWOHfAuaPw+courrUN8dgrESMo4ljDkh7elJ6kFK/bV8UngW5dBtf6kV8F
 T6o7ferISfjOAftb5+ot+DhXtf32BUs0pB6o+SYcIbi3OAlrg5uM6hDB4OIcAr2JrO6sD9DE0iQ
 h+ygbAJaCU6QslyBkJEg0AW7XrbFU35aA04khgrkYhLNFc+jkY6yIy1zFZkOS9AgPtXx+AKB/qd
 DPr9oQPg2+BP+zfDyV0whMW/+ons0fZA==
X-Received: by 2002:a05:600c:4fc9:b0:485:41c4:e2e4 with SMTP id
 5b1f17b1804b1-4854b11acfamr85005635e9.23.1773289370789; 
 Wed, 11 Mar 2026 21:22:50 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48541ad1e4esm202954565e9.8.2026.03.11.21.22.50
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2026 21:22:50 -0700 (PDT)
Message-ID: <69b23f9a.050a0220.8de43.f62c@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 12 Mar 2026 04:22:50 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773289371; x=1773894171; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ZcEjXev7G16CBUQXZVS1Tq7T4EemqbHSylU1rM/1Ap8=;
 b=Lua/k/cf10OwUzt4m2bkoPd0mhf+001py18/mU0qCtz3nG16x/bUWMENTTlYWF1X9T
 ov/x5rmguYVHcwu+YLUqjkLhgLCUuPuqvnDcycJcVsu3q9Y7vb6uqa1uzNvjKvm80T24
 JkLb6rEWhChcTxT4ZxohHZHKYqBWmYOwfQkXPmGztLzPtQJsdyCnc5lcyrHsseavRa7m
 Gjqi3wS8ReFuUimPsa1z28BkIpEpIzI54tg+pPd0BWZj6G/SlDGKZwbM+3x5/JlHzWXF
 jOVw0oZqY6wNa6M15icLKBa8Ift6UU4UAfBRA4NyQ2LREyiAP8RDXhVbWKxpukD5QSW6
 NRTw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Lua/k/cf
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-03-11
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

Autobuild statistics for 2026-03-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 13  | 32  |  0  | 45  |
  2025.11.x  |  1  | 14  |  0  | 15  |
    master   | 39  | 116 |  6  | 161 |

Classification of failures by reason for master
-----------------------------------------------

leafnode2-9543ffaf82406f943... | 6 
                  libnfs-6.0.2 | 5 
                       unknown | 5 
host-gobject-introspection-... | 4 
              host-guile-3.0.9 | 4 
                 libmbus-0.9.0 | 4 
              libopenssl-3.6.1 | 4 
cegui-e7a03afc70c6182a091ff... | 3 
glibc-2.43-10-gc3ceb93dc4f6... | 3 
                        gnutls | 3 
             libgphoto2-2.5.33 | 3 
     libphidget-2.1.9.20190409 | 3 
                  libva-2.23.0 | 3 
                 libzlib-1.3.2 | 3 
                   perl-5.42.0 | 3 
                bpftool-v7.5.0 | 2 
             dahdi-linux-3.3.0 | 2 
                    ficl-4.1.0 | 2 
            gdk-pixbuf-2.42.12 | 2 
  gobject-introspection-1.84.0 | 2 
                 host-gdb-14.2 | 2 
                host-odb-2.4.0 | 2 
              host-pahole-1.28 | 2 
            igd2-for-linux-2.2 | 2 
                     kbd-2.9.0 | 2 
     kvm-unit-tests-2025-06-05 | 2 
                 linux-headers | 2 
odhcp6c-f19dd37fb467c9cf10c... | 2 
uhttpd-15346de8d3ba42200249... | 2 
          aardvark-dns-v1.17.0 | 1 
                   atop-2.12.1 | 1 
             babeltrace2-2.1.2 | 1 
  binutils-arc-2024.12-release | 1 
             bubblewrap-0.11.0 | 1 
                     cpio-2.15 | 1 
                   dante-1.4.4 | 1 
              e2fsprogs-1.47.4 | 1 
                enscript-1.6.6 | 1 
                    frr-10.5.1 | 1 
fs/tar/tar.mk:38: /home/bui... | 1 
                      gd-2.3.3 | 1 
                  giflib-5.2.2 | 1 
                gnuchess-6.3.0 | 1 
                haveged-1.9.19 | 1 
                   host-gnutls | 1 
    host-mender-artifact-4.2.0 | 1 
               iproute2-6.17.0 | 1 
                 lcdproc-0.5.9 | 1 
libdill-32d0e8b733416208e04... | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
          linux-5.10.246-cip66 | 1 
               linux-pam-1.6.1 | 1 
                 mdevd-0.1.6.5 | 1 
            minizip-zlib-1.3.1 | 1 
                       mrp-1.2 | 1 
                openntpd-6.8p1 | 1 
                openssh-10.2p1 | 1 
                openswan-3.0.0 | 1 
            optee-client-4.9.0 | 1 
             pptp-linux-1.10.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
rtl8189fs-876e627a5b6a80217... | 1 
              skalibs-2.14.3.0 | 1 
                 systemd-258.4 | 1 
                 vmtouch-1.3.1 | 1 
                  xerces-3.3.0 | 1 
                 zabbix-7.2.13 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |      aardvark-dns-v1.17.0      | NOK | https://autobuild.buildroot.org/results/21c31a9a3508793400b7c4fe274ea93357b37e5d | ORPH
    or1k     |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/2a95315c0a187be75aa251dca4b7d52c5a4c53e6 |     
   sparc     |       babeltrace2-2.1.2        | NOK | https://autobuild.buildroot.org/results/2763afd43591e1be035f807d352f4787b2c203a3 |     
    arc      |  binutils-arc-2024.12-release  | NOK | https://autobuild.buildroot.org/results/ca5d840c7a620f55d55b9ac445bbb5ab965c6eb1 |     
   s390x     |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/c1cd3817112f866a0dab7a7995c741fab517342a |     
 aarch64_be  |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/e5ea1c6e260a43fbb99376890298c5ec52011ae3 |     
    arc      |       bubblewrap-0.11.0        | NOK | https://autobuild.buildroot.org/results/e739b15b12a2b32bc55a06b9af90427f607cff6d |     
 aarch64_be  | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/b013addd596b3eda110748726c807c1ae15baf6d | ORPH
  sparc64    | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/58c59a8909d6ebf09c5fed626499cdb9e71a331f | ORPH
   mips64    | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/5b1326120f746b04d61e5bb796870d1edb8c71a0 | ORPH
 aarch64_be  |           cpio-2.15            | NOK | https://autobuild.buildroot.org/results/b62775cb56aead74c67ca7cb39ad157552dc39a5 |     
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/ae93a254a85d6f2efcf8af25c88a359ee059b09d | ORPH
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/c10b8e8f749da963057cc5d0fb60ce497cb8367a | ORPH
   s390x     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/8b89b142584b608999d656ec55ea88da07faa315 | ORPH
   x86_64    |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/5a1f93234ee4df0221fd8e3a2a0756bd24378dbc | ORPH
loongarch64  |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/f5a8d08a7c6857dcec77570e450b11f52a309af3 | ORPH
  riscv64    |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/0437f3b4b9e74ee7085bca055d572f8e1709299c |     
  powerpc    |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/eb9e06e20d55d2695c31a1588c335c3ab81d0513 |     
   xtensa    |           frr-10.5.1           | NOK | https://autobuild.buildroot.org/results/324162f565cad1d43665170e4cd7b11c5b0fc598 |     
  sparc64    | fs/tar/tar.mk:38: /home/bui... | NOK | https://autobuild.buildroot.org/results/7d00f76f1c1e6c182cb13253894fa2c7bb0f762e |     
    m68k     |            gd-2.3.3            | NOK | https://autobuild.buildroot.org/results/393663de7f8b5c46bbf1f09a58b5a1aaaaa83157 | ORPH
   sh4eb     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/e26a2165201242c35f1fb6b1cc7cc19978b6c35c | ORPH
loongarch64  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/a1729d5f95f73cfc1ed50fe39d85045592a5c9ea | ORPH
    i686     |          giflib-5.2.2          | NOK | https://autobuild.buildroot.org/results/42301e4b12a858c5ffbe54a6c62793bf2a22d733 |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/15781d859c8d1b46464948f7b6f7c1bfdf4cb566 |     
    arc      | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/73ce0035af6bea8f8e9ad7715a507310cde878a5 |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/9b0b1bd32327b10bd304c2574550aa3d239a29d0 |     
 aarch64_be  |         gnuchess-6.3.0         | NOK | https://autobuild.buildroot.org/results/1cba7fe21314f5ac2a21cfb647d04d4b7ffb4a86 | ORPH
    arm      |             gnutls             | TIM | https://autobuild.buildroot.org/results/cca8961d889a91350efdb957565156eecccab001 |     
    or1k     |             gnutls             | TIM | https://autobuild.buildroot.org/results/b661e84d69cfd03ccc03463ee3a079370ffabe03 |     
    mips     |             gnutls             | TIM | https://autobuild.buildroot.org/results/9bd608bf446aede8f553fbe0bf5c67ccc4dc2d10 |     
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/650144e95e15081d8f529baa0109ad600edd346c | ORPH
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/76acd997d98280199b496c7dd6459bb782516410 | ORPH
  mips64el   |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/f866e936d88006813caaa2e973968db74095bfeb |     
   mips64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/fc156e37f21a26e4f74e76dfaa787306f09944b4 | ORPH
 aarch64_be  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/75adcf1aee552e323dc261ee3e83c8c6ea487919 | ORPH
   mips64    |          host-gnutls           | TIM | https://autobuild.buildroot.org/results/14090981b507df3dff21beb572a0abd5c827fb27 |     
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7dc26964d4d8481158522f34817fe1b14cd79895 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/274cb311a06c77a056a6f745814e4783e215922e | ORPH
   sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/55893dcdc8313559e3cbc99886db39c9298bc802 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/030a683c19d2b305968ef65ba7264f87084a9d54 | ORPH
  powerpc    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/9f0a6001028f65b7c713c131619565fa3786f60c |     
powerpc64le  |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/363d9aedb181f57c2c12ac1b2daadadbcbd5e168 |     
   armeb     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/867ef7b3e93a3a53ac4825da060e478c1a6d641a |     
  sparc64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/6c63f7afc1135b0425de3001674f762042910330 |     
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/80dfd79e88404a4b6e8b23ccf523ee8427b7aa30 |     
 microblaze  |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/303300e2f1ea25f7509b9b96657a13e148caa6d2 | ORPH
powerpc64le  |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/0e947318f572fdfaa56a07158d2ca4c48cec4185 | ORPH
   mipsel    |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/25c3d4649e88786b9497d6cdce38a70f3b339d33 |     
   mips64    |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/53f95491b7531a33ae5bcfe00cef4131a60b3558 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/7dfaf0486867e78553d7923e5f08cafd9c86b6c7 |     
loongarch64  |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/b5240cdad5b34d16d1b026203d1274d9f301a76e |     
  riscv64    |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/f3efe6e9322afdad2fed62ea32c4099e1b05a9d1 |     
   sh4eb     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/471c13786a5adcde4ad28429f57da214d9bf36e6 | ORPH
   sh4eb     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/feebba64a1479f042317e2b12fdcfcd60a144bda | ORPH
  riscv64    |   kvm-unit-tests-2025-06-05    | NOK | https://autobuild.buildroot.org/results/29992f6aa12271d4a85084597c718335971f6a87 |     
  riscv32    |   kvm-unit-tests-2025-06-05    | NOK | https://autobuild.buildroot.org/results/e0824f78374a6fb7b83e6d37b535334cf0ec26ac |     
 microblaze  |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/33cad4de5dde512a0d613cf5ee11cfe66456b835 | ORPH
   armeb     | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/1b85deb18975b080c347b45e42c86b473dedbb31 |     
   mips64    | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/484002f6a5b8e6166437687e5265450ee1ca9b1d |     
 aarch64_be  | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/fa92981d91798450a86577d48439608b5b92d64d |     
 microblaze  | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/7a70411bea2c210119089c2234192131afca3417 |     
   mips64    | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/f3bbbd991147afd675b170891713660ab3d22055 |     
    or1k     | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/d875a290ffa8515f6d649bcde86bcec09b750316 |     
   mipsel    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/bed9a6da03dec73f0728f5b6cb2f194c23a8c743 |     
 microblaze  | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/db54c4cb524ad326eb132bf8a51ed83048abb74f |     
  mips64el   |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/8624055a3e55ec7d672ef08171f12346d555d276 |     
  powerpc    |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/4c50e1acf9d2f44e5065fedae0d3ed87a6cacecd |     
   sh4eb     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/4570fe9877224a1c10c6c4a5ae0fef78590808e6 |     
   xtensa    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/f8630b0d1a44c1de621ccaa92358e6268eab6e11 | ORPH
    i586     |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/d66c54ca9f2c988ec8d9fd3d36650e438ec3c0b2 | ORPH
   s390x     |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/5c365319f72e95c4414f06e6793b2666d6bb3308 | ORPH
  mips64el   |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/f785e9ed41ea2392f14534555202544bfeda7b06 | ORPH
    mips     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/1253036d08faa0335e9273733f0de48b9b59c4ac | ORPH
  mips64el   |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/017159090fcf99b6ea197bb91a66a84e340816d8 | ORPH
   mips64    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/cefb46506cfda5e8a8084c84f8d6bab93bb3b417 | ORPH
    arm      |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/d63c32041ebe289f948bf99fe6d171687601b3b7 | ORPH
   sh4eb     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/18daa11c3e0f424d7add310189a363464d07e8bc | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/e2a28ca6797379ce1f4cc3c6164317f70b0ecf24 | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/15cd3cfa60d3ee41ee04cd812bfcafb1bcaba4c6 | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/24e47ee65b07fd54417b432fee505056cbf93b65 | ORPH
   mips64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/91b4a8a3bfd5cfa9e1b10c3efab846cd46973b54 | ORPH
loongarch64  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/771c4c7392c53150861755ac66cf0e55f6895452 |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/7783c3b865c8f9fe4b287a03ca3788f62776ab30 |     
 powerpc64   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/7931b5770afa457e846667ca627d54d9fba328af |     
  aarch64    |          libva-2.23.0          | NOK | https://autobuild.buildroot.org/results/111af067a0e89d811e0321598d82fceb6d0a713a |     
 aarch64_be  |          libva-2.23.0          | NOK | https://autobuild.buildroot.org/results/afd41dd7f53acd366845b599a331b8c37da6dac2 |     
    or1k     |          libva-2.23.0          | NOK | https://autobuild.buildroot.org/results/d1af2584f4662fc09df5783f1bf1e4ecc01594b4 |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/6e5a77da4e0d8c7247202d5f20595f6ae6096674 | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/1750ed2d2037b68927fd67a11df24df632b3945e | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/6be40b89e7ee6aca12d7ea365782cdc0f1bd4349 | ORPH
    i686     |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/512a633cfac297e4008c08366b1a87a4a6c21306 | ORPH
powerpc64le  |         linux-headers          | TIM | https://autobuild.buildroot.org/results/70c8fdd57ec7e69c72ae4b74eda2aa3c001e4721 |     
  sparc64    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/82cfdcb5abc712b04e2edb77f17646cefaecde71 |     
    arc      |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/6789f7614240b626a48fd6ec154248bbcf6a3998 | ORPH
  mips64el   |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/60854381e6f288ff0353b1c217da06bf33768a28 |     
    m68k     |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/373471a51917beb734a5aa04073a9fc129f4d690 |     
    arm      |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/19bf1ed844f6aab27e55ee02a6929b46cd38ca90 |     
  sparc64    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/afc6b2ee862ea71d3bb8f869c67b809c1d9a0210 |     
  powerpc    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/c1f309dea05c6c1d589f928d9be7a344842d04bb |     
loongarch64  |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/3793ab3ade47a5143afbd45ed290d663ce365521 | ORPH
   armeb     |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/20facd8bb92c279572caf58a9ae54977e74baaa7 | ORPH
    m68k     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/f8eaaf735653d25e1556d36898ec05c528ff6af5 | ORPH
   armeb     |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/04241013ac051f6c2c0f0c31a2d8a55573f4a358 |     
    i686     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/7ff0c68707a51a1d801c240f1080c3a77eeb348a |     
 microblaze  |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/72667efa1751b10e0b76ac3bbb79c8447cdf479b |     
   x86_64    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/1face27f0620e3a14b961cc538c631406900b7c4 |     
 microblaze  |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/08061a13c8aa34b2552857957d960df5820d1e95 | ORPH
 aarch64_be  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/209bb75feeb4ab02b818ccf2b9a13ff2a3449db3 |     
  powerpc    | rtl8189fs-876e627a5b6a80217... | NOK | https://autobuild.buildroot.org/results/2a61165ebc150173f3906fb5ef79225c2fedc6c9 |     
  sparc64    |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/ed407464a2465e0cc1f288175b71975304db8864 |     
   sh4eb     |         systemd-258.4          | NOK | https://autobuild.buildroot.org/results/b31bc56f3f0934a16428aa3e627ea1a0f515ad2c |     
   mips64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/e430d610a74ab163584b3f6462af2678499fa0fb | ORPH
  mips64el   | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/503b75c4022d3ad9d86ee0cebbf64bc3cbd45336 | ORPH
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/dfe809a171377cfa999615dd167655e7c1866801 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/c3d300058ba5441fe5e6c387455bafbdc12a8241 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/8d489e79ec75ab3ccc7bb4cda6dad1d9c1fbdbc2 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/a33636a8011c7d83b9de4613d8621eae4c704b80 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/3fa028d38eb3dc9a0a914cf8bd7b630b64afdbbb |     
microblazeel |         vmtouch-1.3.1          | NOK | https://autobuild.buildroot.org/results/180b11848364f77dc530d0d2ed36ffd45c57a6aa |     
  sparc64    |          xerces-3.3.0          | NOK | https://autobuild.buildroot.org/results/e724d4d4feccdba7eb0129468738931fda190bcf | ORPH
loongarch64  |         zabbix-7.2.13          | NOK | https://autobuild.buildroot.org/results/7fae8174b6f9abb205671f455d363448a37508ed |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                host-odb-2.4.0 | 2 
                 coreutils-9.8 | 1 
              e2fsprogs-1.47.3 | 1 
            host-coreutils-9.8 | 1 
host-gobject-introspection-... | 1 
              host-pahole-1.28 | 1 
     libphidget-2.1.9.20190409 | 1 
                  liburing-2.6 | 1 
            minizip-zlib-1.3.1 | 1 
                openssh-10.2p1 | 1 
           uboot-tools-2025.10 | 1 
                 vmtouch-1.3.1 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4aeb    |         coreutils-9.8          | NOK | https://autobuild.buildroot.org/results/7cd4efbd17c24388498832745c35bde3e5710902 | ORPH
    m68k     |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/278dd19ff53c03d791fd49b76df909ef713df130 | ORPH
  sparc64    |       host-coreutils-9.8       | NOK | https://autobuild.buildroot.org/results/e291f8b559a7e71582d016b1b92e3c81eec2c3a2 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6c285080619b5669ea28ace20873f14b2b86be55 | ORPH
 microblaze  |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/dcf50c9e16dbbcba46e59ce6ced06005078dd851 | ORPH
 microblaze  |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/88b9d2f659f8ae61b7627a34dc243b0ea7e1f377 | ORPH
 powerpc64   |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/0a22d9b28df6f05258db4e2883c30b30827933ba |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/9302a45710eec015f986eaf629ba6c7c24e6ac2b |     
    mips     |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/59d487122d59d1c8a2da470d89d882a9b2228bda |     
   arceb     |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/f47248ab8ce96e4762a8de51858b0a7770829550 |     
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/edcbc3653536fca3eb45695fc0a2b00eeb7b5977 | ORPH
microblazeel |      uboot-tools-2025.10       | NOK | https://autobuild.buildroot.org/results/6be62f748100fa13b114a90822f08b96964a06a5 | ORPH
   s390x     |         vmtouch-1.3.1          | NOK | https://autobuild.buildroot.org/results/56fea859d611d350fcd7921a417b89baf0fc6599 |     
    or1k     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/b754c0cc364bfbd5ee650438ee60e5d14c915948 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-python-lxml-5.3.0 | 3 
host-binutils-arc-2023.09-r... | 2 
                   perl-5.40.3 | 2 
                       unknown | 2 
           at-spi2-core-2.50.0 | 1 
                   dillo-3.0.5 | 1 
                 gerbera-2.4.1 | 1 
                  giflib-5.2.2 | 1 
    host-gcc-bare-metal-14.3.0 | 1 
                 host-gdb-15.2 | 1 
                 host-gdb-16.3 | 1 
  host-gdb-arc-2023.09-release | 1 
           host-libtpms-0.10.1 | 1 
                host-odb-2.4.0 | 1 
 host-softether-4.30-9700-beta | 1 
leafnode2-9543ffaf82406f943... | 1 
                 libcddb-1.3.2 | 1 
                  libdex-0.8.1 | 1 
                  libsepol-3.7 | 1 
              libsodium-1.0.18 | 1 
                 linux-6.12.73 | 1 
                 openssh-9.9p2 | 1 
             parsec-tool-0.7.0 | 1 
             pptp-linux-1.10.0 | 1 
            quickjs-2024-01-13 | 1 
             stress-ng-0.18.05 | 1 
               valgrind-3.24.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/dbb9612b3bd40ba40e586474b8cd9ac1854ae032 |     
   mipsel    |          dillo-3.0.5           | NOK | https://autobuild.buildroot.org/results/c622b6e81da82f56939f56ebc81177a923f4badd | ORPH
    or1k     |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/ab43f4d81311ed8aad6bf57dcc9017d38493ec18 |     
   x86_64    |          giflib-5.2.2          | NOK | https://autobuild.buildroot.org/results/622fd48b31a8f69c38cbc97ff2229f5ca1d02145 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/27091d5dcf4b0fe4853c731a427dbc29d858e330 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/45d062e2878f9c1c71901d7f5a81fe82cd61e46c |     
   mips64    |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/727358063c2458623b1e530467b3f1e2ce880785 |     
   xtensa    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/9f1f2973c692ed242e44fb83258fe41e47df1074 | ORPH
    m68k     |         host-gdb-16.3          | NOK | https://autobuild.buildroot.org/results/9a3ef9c102dbfda915cdbdc37fdbf02e8e65bcd5 | ORPH
    arc      |  host-gdb-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/b17c11f21fa78ab5604e9ca4eb20e414f12d57c9 | ORPH
   mipsel    |      host-libtpms-0.10.1       | NOK | https://autobuild.buildroot.org/results/1682e99effe93a5c557c1d0fe463a13b057ede3c |     
  sparc64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/ca90fde54d2f3308e652509bf252dd8f12199b29 | ORPH
  aarch64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/c80b486a66d78e6a7539ea1945ca7b7270150cd2 |     
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/e3520ae8af746ac3a587097e87b6da61cf42a619 |     
  powerpc    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/a09932ae5e998e0318455853911d92a0cf35de66 |     
 aarch64_be  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/282bd522e8b84701ed191b640f5c04002014bc3a |     
powerpc64le  | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/c0566b2c74492d8dd83bc9e8840db4a928751019 |     
   sparc     |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/7996a2e7167dea0d2ac14879b26ab83dc588a05b |     
   mips64    |          libdex-0.8.1          | NOK | https://autobuild.buildroot.org/results/231d554434d96dcd56acce17547211c55a0520c5 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/b035c1331f4ce68c33600346d931ac49fed26ed8 |     
 aarch64_be  |        libsodium-1.0.18        | NOK | https://autobuild.buildroot.org/results/86aaee914340b8ad1fb671f6362a48c36c0d4ab8 |     
  powerpc    |         linux-6.12.73          | NOK | https://autobuild.buildroot.org/results/8338c1680e95d247a1b655f4dd1b0ca4554a1ac6 | ORPH
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/614e60ae8cf32351fefb4cf52ae5a0906eb0ee1a | ORPH
  sparc64    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/e57b75c3f9e467209fa135952a7714d185eb8cf0 |     
   s390x     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/36937aab2d0ed6db41b61b5d36100002b33475a7 |     
   mipsel    |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/f5723cd57cf0eee179a611327cba944bb91a4a71 |     
microblazeel |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/07f6c5db0bc7b9a2deea6ec7e8a78d2a7a04f136 | ORPH
    or1k     |       quickjs-2024-01-13       | NOK | https://autobuild.buildroot.org/results/7e4c8f5059799e20c7f28f9e33a12b6a4c77ffb7 |     
   sh4aeb    |       stress-ng-0.18.05        | NOK | https://autobuild.buildroot.org/results/56f2f6e13237aafcb05e048c1680b2ad76d0e334 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/35e2e0c88449823b16a452f228c6f49770f88afa |     
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/c37ca235682012d08c1d16d0ba20f4d6f08b18cf |     
  powerpc    |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/0bc14bad8cd5d7f9e16f7c77482bc45b1932afe8 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
