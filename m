Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A910F532D4
	for <buildroot@archiver.kernel.org>; Tue, 24 Mar 2026 04:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76A34828BA;
	Tue, 24 Mar 2026 04:22:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NCrYDTDgGakI; Tue, 24 Mar 2026 04:22:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C329828F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774326166;
	bh=3zKU3S6D84KDjm1mnyQNH7FnMq9SwemMRH/iM/YhQz8=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AdviSVy6oFKWuQmSPs8vD2V2/7wbx//fpHyBNfqJcjBq+Xo5U/NJ3gEozUUDmUZqu
	 t5rL1xDj5kfoG6MPiGwLZONmafcDSqqPxV8SrKseEh3weUfUvoyfjP97vcXJqzOw2z
	 pqLusfic68vEBc9L4jhg/ZlXR/bhz0EkTqgOOoFPAPCXh1IG+DUVdh16Uk1T5ldtaS
	 rWQLmWfP8gtHdpXIDlotmIL3cPxRpbejx+fLq9fPNTjVPqcVAest36km6NR3bRCoNM
	 QWBZlJeSEsC3czGxwyl1KdXetDhh8yy+1ZDRJSWDsooUuio99ZF3eTk5kaj0AOa5I/
	 BDV4M3P8xVC+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C329828F7;
	Tue, 24 Mar 2026 04:22:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 096CCF4
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 04:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E345140F3E
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 04:22:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IATR7ASZtiI7 for <buildroot@buildroot.org>;
 Tue, 24 Mar 2026 04:22:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CF66740DD2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF66740DD2
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF66740DD2
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 04:22:42 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-48540d21f7dso40480825e9.0
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 21:22:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774326161; x=1774930961;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0dNc0/ev87vZn9/vuURM5hhFeubI3ljhKIf1SDzpGIU=;
 b=OdF7wfN7OJnGlUclrdEWQvJqjPCgTDYhzSrdY+cAzqzbvM5ph9Ey9nydwCBJut5DBS
 P7mQsioaRLfJtrZqWyBTLdZZJ1Vsc4/GlV0EsgSpwk7BT64yzdE6W4gMV1C+RhiOMC8L
 tmbOKLJmOPhSgK5EA9OVxipNy18YZVdEMBHBwBOgXvUJty4fh1+cUwRjP7o0H+PWT90w
 yfiiLZ2is5neQ31KD9VfFCystKjwVEZyTDMWLd+XG4XkGwj35Wm+Xdo9ZUpFy6z7FMF7
 vGAYVbe6WE8AxKonn8XVW2bx6Qc1KJgPwMe8b+zoW45B05JBJiVV+u7EN29izYiHjYjK
 kZCA==
X-Gm-Message-State: AOJu0YzpDwWKTxgLHa3EORvMePkUAzlVcRxrCmxOZBcq7RHZCFVCUhzv
 S3MTT1cwEnW/SXyEkl2TLxaSeaqV2KSEaNRQEqqQXwpPuI+/i/EfmlwJu6Tjlz4v
X-Gm-Gg: ATEYQzyPJgBUp17HXc7Dvzgl4/uzCuBYGfuI4nQY67jam8rsDwNk1Exwh+ahyfVG9sO
 dWBH+YUO8UzaWcikX8Se1Kipd5nHMPG7tm8zo80EdYfl3kw3UssPsDiBcsGvy2jpwOMqBF5P6mV
 p9ca72y5x6IbWm1S9Fpe3YQ2FYMRhLGPrAUEBuyDPNBL7cacZ9FlUPxo7JZgquU9P0H9adPcoUS
 2Hy39nKMTfT1XzezwfE/nd/ymTsrhS41nn06KTCDea9K/XhWkf+H/cHJlFbDH9b6AUQxYWogkNp
 NJeViG+Oke11vK2z9KexirXe74ozjNpGnL5yYNqag0skb4PA6un+Y8wvMNko4wv8aEa5xR7puXZ
 Pdgl7MwgGf7mtD/Gq9FGTsKrtP/FyLSeQTNCoFc4YcJh43j2m0drkwB0cSmjXxHIFm5jvTojv9W
 kGG8LhUFA7wu7z4cVxXBdpLqZfdg==
X-Received: by 2002:a05:600c:828d:b0:47e:e48b:506d with SMTP id
 5b1f17b1804b1-486ff0291ccmr205576105e9.16.1774326160371; 
 Mon, 23 Mar 2026 21:22:40 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4871105c58csm8848895e9.15.2026.03.23.21.22.40
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2026 21:22:40 -0700 (PDT)
Message-ID: <69c21190.050a0220.39b55f.7ce5@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 24 Mar 2026 04:22:40 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774326161; x=1774930961; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=0dNc0/ev87vZn9/vuURM5hhFeubI3ljhKIf1SDzpGIU=;
 b=sLfk7boF/jJy0K1A+VZGHvFeObb2CjPhUOXN+J/UNr4pRciNgI1Hc+efaToeitu/oX
 wJm1xtQ+nF79eF6sB5g9dV+5sOny52g6ZveA7+CDnDJ/mFd27Ft6Kzb6PvHbMKyYLHmD
 RpdFlZ7Ap33FalvfaPRYFq/d+XZvQlfdZ74keAy64xLiGH4z+ldAsKPBXiQhk7tRirHd
 KE4nBreGpfrRZqx9mXgBZINwfumi09ej47KbikVfBjSp3zBe2rs42NglzLASgNAvyW+5
 vFl17esQxQEztHp2qAREySYF4SpnSCElhDlF+EuEQkA/hWiA4UhX9WPYz9XzyZX05Qiq
 BfGw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=sLfk7boF
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-03-23
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

Autobuild statistics for 2026-03-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 17  | 40  |  0  | 57  |
  2025.11.x  |  3  | 20  |  0  | 23  |
    master   | 50  | 155 |  2  | 207 |

Classification of failures by reason for master
-----------------------------------------------

                 mdevd-0.1.6.5 | 9 
                   dante-1.4.4 | 5 
host-gobject-introspection-... | 5 
     libphidget-2.1.9.20190409 | 5 
uhttpd-15346de8d3ba42200249... | 5 
                       unknown | 5 
  gobject-introspection-1.84.0 | 4 
                 libmbus-0.9.0 | 4 
                       mrp-1.2 | 4 
ustream-ssl-5a81c108d20e247... | 4 
glibc-2.43-10-gc3ceb93dc4f6... | 3 
              host-guile-3.0.9 | 3 
                  libnfs-6.0.2 | 3 
odhcp6c-f19dd37fb467c9cf10c... | 3 
                   perl-5.42.0 | 3 
                 vmtouch-1.3.1 | 3 
                  cairo-1.18.4 | 2 
          cloudflared-2025.8.1 | 2 
             dahdi-linux-3.3.0 | 2 
      docker-cli-buildx-0.25.0 | 2 
                flashrom-1.7.0 | 2 
                 fwupd-efi-1.7 | 2 
                  giflib-5.2.2 | 2 
                 host-gdb-15.2 | 2 
              host-pahole-1.28 | 2 
leafnode2-9543ffaf82406f943... | 2 
                 linux-headers | 2 
                openswan-3.0.0 | 2 
                   qemu-10.2.0 | 2 
           uboot-tools-2026.01 | 2 
             batman-adv-2025.4 | 1 
                      bmon-4.0 | 1 
                 c-icap-0.5.10 | 1 
                   ccrypt-1.11 | 1 
cegui-e7a03afc70c6182a091ff... | 1 
                    dpdk-25.11 | 1 
                 dump1090-10.2 | 1 
              e2fsprogs-1.47.4 | 1 
                    ficl-4.1.0 | 1 
firmware-utils-c42a3bc53da8... | 1 
               freeipmi-1.6.16 | 1 
                   fwupd-2.0.4 | 1 
              gcc-final-13.4.0 | 1 
                      gdb-15.2 | 1 
            gdk-pixbuf-2.42.12 | 1 
            gettext-gnu-0.22.4 | 1 
google-breakpad-f49c2f1a202... | 1 
      gst1-plugins-bad-1.24.13 | 1 
                 host-gdb-14.2 | 1 
    host-mender-artifact-4.2.0 | 1 
            host-minisign-0.12 | 1 
          host-mosquitto-2.1.2 | 1 
      host-uboot-tools-2026.01 | 1 
                   i2pd-2.59.0 | 1 
               iproute2-6.17.0 | 1 
                 lcdproc-0.5.9 | 1 
               libcgroup-2.0.3 | 1 
                libcurl-8.19.0 | 1 
                  libenca-1.19 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
libfutils-c326ce0cc2a735438... | 1 
                libgeos-3.14.1 | 1 
             libgphoto2-2.5.33 | 1 
               libunwind-1.8.1 | 1 
            libxkbcommon-1.9.2 | 1 
                 libzlib-1.3.2 | 1 
          linux-5.10.246-cip66 | 1 
                  linux-6.19.8 | 1 
                   linux-tools | 1 
                  linuxptp-4.4 | 1 
                   ltris-1.3.2 | 1 
                     mdadm-4.3 | 1 
             ntfs-3g-2022.10.3 | 1 
               openscap-1.3.12 | 1 
             parsec-tool-0.7.0 | 1 
               pcsc-lite-2.1.0 | 1 
             pptp-linux-1.10.0 | 1 
           python-brotli-1.2.0 | 1 
              python-xlib-0.33 | 1 
                 rtl_433-25.02 | 1 
                s6-dns-2.4.0.0 | 1 
         s6-networking-2.7.0.4 | 1 
       shadowsocks-libev-3.3.5 | 1 
       sp-oops-extract-0.0.7-1 | 1 
                 sqlite-3.51.3 | 1 
                 systemd-258.4 | 1 
             tpm-tools-1.3.9.1 | 1 
               trousers-0.3.15 | 1 
ulog-0389d243352255f6182326... | 1 
               valgrind-3.26.0 | 1 
        wireless_tools-30.pre9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/0d67db6abf8246cd292759063922d623ba5ffd96 |     
    m68k     |            bmon-4.0            | NOK | https://autobuild.buildroot.org/results/a2849dd21e6362842c6d2c0219770d7d1f6121e8 | ORPH
loongarch64  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/38aa48d40ed2ca86cc2f5591ac2fc1415c07f3e5 | ORPH
   xtensa    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/7d60b7f52f69996df8bc7baaed246c1d732bb265 |     
 aarch64_be  |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/a7512c6492cb4b334167c596ecfc163574a0e5e4 |     
 aarch64_be  |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/bce2bdc5adea5cdf11ed567a1d8e84621a2ddef5 | ORPH
   mipsel    | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/2a46d67b4257ed16b9dae785c67bd983061c3191 | ORPH
   x86_64    |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/5a8fe4b8b7e322da9a77b8a6381b72e8b2c91fa1 |     
   x86_64    |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/ab0a93e5a8b50398abf7bba807cc01135b5f631d |     
   mipsel    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/49a1f279049843bcb0fdb83edd67f6092d287826 | ORPH
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/fa1cd49148021594ed51a2cadeed35569fca23be | ORPH
   sh4eb     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/255737b96169073f1c2e24b2aae5c1e9aac6ba4b | ORPH
microblazeel |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/0e6d708d16eeb721ed26c45d6e3f2d801fb0e029 | ORPH
loongarch64  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/c9b8dfd8acb90f69e6fd0a862b0a4a56f6b4dd77 | ORPH
    or1k     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/82b538106f9479247e0de891d3aabc8838355141 | ORPH
microblazeel |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/8c44c6911caa81702898c5cb150c4cfd83df04d1 | ORPH
   x86_64    |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/b40a4994611b6acafed58f74c51398a62f8ff5d9 | ORPH
   s390x     |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/38ef3930d97d54fd643e8304bb1fdf888485bf75 | ORPH
  aarch64    |           dpdk-25.11           | NOK | https://autobuild.buildroot.org/results/552ce3775d9a6e0a01f30208fdd91b3e03640598 |     
    m68k     |         dump1090-10.2          | NOK | https://autobuild.buildroot.org/results/3f1c2efdf21997ef914d209d1ed6a640d6bfb9a7 |     
 microblaze  |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/0bd7e1bef19bfc4184825ac6ad78fccf4916de8e | ORPH
microblazeel |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/a34029646c4ad84af4e36175f285d9da7caf086c |     
 aarch64_be  | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/7ef292c26894c39989d634bbbd5f9154857c8426 |     
 powerpc64   |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/4db9f28f210a78bcff711777b81723c0a3ec2087 |     
   armeb     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/77983b5f254483cf15e5215dccf4af2498e729f4 |     
   mipsel    |        freeipmi-1.6.16         | NOK | https://autobuild.buildroot.org/results/88e8d9a331a5f20166c91b9d8fb052a1bf77daf1 |     
  mips64el   |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/e8d74e2c3bf46f18fa0f70dab058745be1f34c2c |     
    i686     |         fwupd-efi-1.7          | NOK | https://autobuild.buildroot.org/results/9ca94ac27f679eefffd25e8b709c1e9a494c3524 |     
   x86_64    |         fwupd-efi-1.7          | NOK | https://autobuild.buildroot.org/results/0e730d369eb0759c4204450cb73ad1b63589cc4a |     
  powerpc    |        gcc-final-13.4.0        | NOK | https://autobuild.buildroot.org/results/f46cd688bb908716036b9e5ea4ad336264f47c30 |     
   sparc     |            gdb-15.2            | NOK | https://autobuild.buildroot.org/results/38645389cc5fdb1d5fdfa5d6f6eef417a975ea41 | ORPH
 microblaze  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/eb3683b4d2f09ad5761d907a53fda708cedc28f9 | ORPH
    arc      |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/6d8c080df33a65b4d9c5846e78b3ea41d4d2016b | ORPH
    or1k     |          giflib-5.2.2          | NOK | https://autobuild.buildroot.org/results/73a6dfa4f1801dbf88119df2e2479a1807905a15 |     
    arc      |          giflib-5.2.2          | NOK | https://autobuild.buildroot.org/results/50c55a968bb80938baaa4c1227d8a1e07ed7de3a |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/3922204cefee8f14699fe6c8796c3d7ab5ff7b1b |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/a541847da13c74ea3b14b9eb63fb68c8d80a78bb |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/f617694ee64e92600b9626a7ef3c0c9f79299309 |     
   sh4aeb    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/b497f88ba8513e133b640aaced492131e31500e3 | ORPH
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/531f75cb04b7d277e0a801c3ea57d0c53195d24d | ORPH
  powerpc    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/179c8a00de8d123ff5134d69ac0830693c47437c | ORPH
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/3bf060318c5d50a2e519a884d15594ec04b4df17 | ORPH
    arm      | google-breakpad-f49c2f1a202... | NOK | https://autobuild.buildroot.org/results/aca0713d1ecd01e83151b6f6eebab91d0fcda4a9 |     
    arc      |    gst1-plugins-bad-1.24.13    | NOK | https://autobuild.buildroot.org/results/6c7954af727cb5ef2d518330150875bbd7c5def6 | ORPH
   mipsel    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/79bb145c0142abc19d3227949f946e2977bef0f4 | ORPH
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/89290e4afe8cb020757aa24b036f588493f1435a | ORPH
   mipsel    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/4a5d796d6e051c0492e5ccfa5291c42bbd24a7ff | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/aa3e78d09a8f03f07fbad1d7d846fb9bd5c6f484 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/05864f15ce31062628e7cb514e1f0f4acc5ba2a9 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f9f3852abc4435d328ef10cbba27a1309cbb5de4 | ORPH
    sh4a     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/593cd1a6c7a32125d7200a652b2fead1e2f1de85 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a0e14e9973b570fb7a1977369d2c4edf1faaeb7d | ORPH
powerpc64le  |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/3aaad686cefcbaeab37bf888d09acc51da036ace |     
  aarch64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/5f09ff214514e78fe938ab2c4a4ec9cc706374d6 |     
  aarch64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/15d3930ec1af926e0a81956fafec65f74f28cac0 |     
powerpc64le  |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/a57f88edbb9f0101994142bbd0ad771ad522a4bb |     
   s390x     |       host-minisign-0.12       | NOK | https://autobuild.buildroot.org/results/9e4b38a5419b434d945e171887663beaabca9f14 |     
   mipsel    |      host-mosquitto-2.1.2      | NOK | https://autobuild.buildroot.org/results/5e931eb616ea847ed6f628d632d9b735053952af |     
  sparc64    |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/3230cc1bc03a5d133b634e1d54579f6554ffe47e |     
 powerpc64   |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/9942504140b2f80d300bd5eb44bda5651a432792 |     
loongarch64  |    host-uboot-tools-2026.01    | NOK | https://autobuild.buildroot.org/results/f941d935f8ed1ea473fe8dbc326d0277cc842c52 | ORPH
 microblaze  |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/89e0879529f56b554d01e7035f9a0a3ffdf2a4e6 |     
  powerpc    |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/362a63144abe480feb8c487116a1755ae7d0cf02 |     
  powerpc    |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/622cb5bbc49d1ff109fd87df91b1899c73ab7268 | ORPH
 aarch64_be  | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/b041495d1ca67f8a88d329ea4fd3b935bc3b91d6 |     
    or1k     | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/f54d96bba82c1113429af4db0134cae702ac5003 |     
    mips     |        libcgroup-2.0.3         | NOK | https://autobuild.buildroot.org/results/cf475d57a4631bab6a2d570111dd17be6d7a8182 |     
    arm      |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/65afb815e923fde60115ed5f191bc1c12bbbfbda |     
    arm      |          libenca-1.19          | NOK | https://autobuild.buildroot.org/results/698984cc5aaf239c7b662df89f8461b4ca414c9c | ORPH
   sh4eb     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/6571a1820c143dec52d9623185a879fdf75098d7 |     
 microblaze  | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/105b7d9655357084eae47b003288a1c0a169f2ae |     
    or1k     |         libgeos-3.14.1         | NOK | https://autobuild.buildroot.org/results/a065d68b4fa823786fb0fefd33c2369e3966811e |     
    sh4a     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/a1ef8f8e61437efb77b7e7804cce78d279f5cd24 |     
 microblaze  |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/a04a2416091ae3fd25f51bfbc81e0faa223aee38 | ORPH
   mips64    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/fb15a79062843f9e8fb183256572dbf95db2ec6c | ORPH
  sparc64    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/1db84e960159bc440ea05e014492a4ca79a4d7ee | ORPH
   armeb     |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/f59a99e99b4c9ccbf9893ff5c8f6becaff63a89d | ORPH
 microblaze  |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/45f52af8138c33d93ad6bad7236cd7d3dc7249b0 | ORPH
   sparc     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/b0754ef96432a1246d1a7469050255c882454141 | ORPH
    mips     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/0c0344156d359bcdc44c45399bd07cb3280f0f29 | ORPH
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/ea7eba99e7d494052c4fb8cdc8f7fa247784df28 |     
 powerpc64   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/5f6a09fbae6ba665b89b2f87df08a445b3b34811 |     
   mips64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/394375ab469a917a3bf0ba56e72fb557d899e85f |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/6a7f3146d1f603e764170ed6e3ff3c6c51214936 |     
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/b1fd0c1da8051d6445d18c14f176b2a5a2854860 |     
  aarch64    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/c31f87db47a5a86f1063f2d9936c6f8d9ba6f275 | ORPH
  riscv32    |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/a1510a483d77bd4d2761c8eadd6a1d30e7897571 |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/c3c4309d30b00e0d33087f1bd42b979f2d9fb6bb | ORPH
    mips     |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/211b6fb0f203db68f1f7282b8636acd1a86a4f2d | ORPH
   x86_64    |          linux-6.19.8          | NOK | https://autobuild.buildroot.org/results/aa6fcf461a889cd2331ef393744af0c94e2f742d | ORPH
   x86_64    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/9488dd670194ec076d3c1cbc8a41660cace84796 |     
    or1k     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/d290890f5d2c611e7ea7c1fcca382a275b1146ae |     
   armeb     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/49f5cd99906dc7b89feb3aefe4c88c5dae777f79 | ORPH
  riscv32    |          linuxptp-4.4          | NOK | https://autobuild.buildroot.org/results/cb1aeeb1447c65c6a59d6865e73cd4f6200291d2 |     
microblazeel |          ltris-1.3.2           | NOK | https://autobuild.buildroot.org/results/5dc94632def0d011fe290c8cae40320c297fa4f6 |     
  aarch64    |           mdadm-4.3            | NOK | https://autobuild.buildroot.org/results/6b147aaa5b9190cfb41e17a2949a3fd25a928017 | ORPH
    arm      |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/009f0cd65027da12dfe6a6ee67361531ba4f6dc8 |     
    mips     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/6b5bdbddfbbc7906e9dd16cd40c8b5e003f491e9 |     
 aarch64_be  |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/d6171ac22e724c62ea96e9546f860a939575f38c |     
   s390x     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/2663e4d519fea7fcb015a4facee8ef98102198e4 |     
    sh4a     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/9f458e791eb8f86ac85c741a3460a7d12c07543e |     
   armeb     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/760378c8bf7628adbadfccf5e656465c1aa33d6d |     
    arm      |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/b916161c7c968c0f79657273f68820f1c9d44795 |     
 aarch64_be  |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/b30cdab8f009558f192bcb56dd859158847a383e |     
powerpc64le  |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/6713fe07543c2b4c4fb95453e0a01ceaf8451338 |     
 microblaze  |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/a0b85851ad831846a4c5cb9be3dead23544456d0 |     
   mipsel    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/490afdaf58a85c765271a07bf20ea441be673cbc |     
  aarch64    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/67ab3531e260fb5da2f56b0f5f7cc9a6d3016bb6 |     
    or1k     |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/21368eb65a98b9a439a2bde0976abbef7d927370 |     
  mips64el   |       ntfs-3g-2022.10.3        | NOK | https://autobuild.buildroot.org/results/72f719851ee437d44ac9c3afdc289ef309ff757e | ORPH
    m68k     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/31f6de7f5d78fe4b01972a7ab2f1558cad4ea331 |     
    m68k     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/7e611df9754d8202bc36fa24068ea824233c136a |     
  mips64el   | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/077b93fc5dbec3b624d4e1502e33a2b37454354b |     
    or1k     |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/a38ad7da8836227274b19022347134f2c54d338d |     
microblazeel |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/b5b728f2701bef3661f7b722ee892ac686175f8e | ORPH
    arc      |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/f9c7fcf22a5479870bf10962eae19ea6ced1af85 | ORPH
   s390x     |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/89c5cfc69ffb46f32cf594d608f0eab5e82424b8 |     
    arc      |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/d5df6cb492ab7222167655ed119e60dfc63ebf9b | ORPH
   armeb     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/71213383b9ee51d82df5fd18b196b13ee6bb3a0e |     
    arm      |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/44f44c219ccc56f4f8c3d3315e18d678474066f7 |     
    i686     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/afc212a8394ed8c967109aa56f84fd0fe45268e9 |     
loongarch64  |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/c0b1eb4989ca92c6e90422f0fb8c8d6fbec1e159 | ORPH
loongarch64  |      python-brotli-1.2.0       | NOK | https://autobuild.buildroot.org/results/00098aab11bb7052a72d42786231dc7504c3da72 |     
 powerpc64   |        python-xlib-0.33        | NOK | https://autobuild.buildroot.org/results/519e87b97724a92ef5bae94f0645121e638b411c |     
  aarch64    |          qemu-10.2.0           | NOK | https://autobuild.buildroot.org/results/ebbb380c199243b99511d8250f47b771b33e08d0 |     
  aarch64    |          qemu-10.2.0           | NOK | https://autobuild.buildroot.org/results/ea90a6acbba8713da47375e90a6eb6ee08308296 |     
 powerpc64   |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/cc66e825fde1f82d187bf3baa8fefbc9ff78ae17 |     
   s390x     |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/c7c9de78ab5cfd9f37073bcbc8b8ec821786ce0e |     
 powerpc64   |     s6-networking-2.7.0.4      | NOK | https://autobuild.buildroot.org/results/7b18fa697b77379c9b716625019976b5328b78c8 |     
   x86_64    |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/1b6237e829ca0087ae43929c3369a0174b1ca87e | ORPH
loongarch64  |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/88f3fc0254b7a031761f713f0bf80b52ac5d9d78 |     
    m68k     |         sqlite-3.51.3          | NOK | https://autobuild.buildroot.org/results/ee9ec83f6253a801da6c6d49352e00e60e0216df |     
    arm      |         systemd-258.4          | NOK | https://autobuild.buildroot.org/results/20cb3ce181ff0e72a790ab5a684cc3362ca8cc1f |     
    m68k     |       tpm-tools-1.3.9.1        | NOK | https://autobuild.buildroot.org/results/6e12e682b7e8115b274acd9f2973a6dbe85b7dd7 |     
   s390x     |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/e48f69de1e069cf9240416d7f1a358a2e9b658e3 |     
   mips64    |      uboot-tools-2026.01       | NOK | https://autobuild.buildroot.org/results/813375651f94bbc36bae7b383dcc072b79fc1504 | ORPH
loongarch64  |      uboot-tools-2026.01       | NOK | https://autobuild.buildroot.org/results/f92c86eb8f22886ae532bb324e9e7d488470fa2e | ORPH
loongarch64  | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/2ab170399a926f3f9acd6bfc9189e0bb50d1a563 | ORPH
   s390x     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/6566e3f2e469eef179b0cf62d3b22de8e8d8af1a | ORPH
    arm      | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/952da91de69e69549fe2b88f8dcf78d0a580c0ea | ORPH
   s390x     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/5e3520c74517ebeb282f3250620c6f870cd3a743 | ORPH
   armeb     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/2f4906ea8f696784667b507b85ce6b0b65830740 | ORPH
    hppa     | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/fc4573c9fae1644465da84ada99f14425ba9c5bf |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/5fb4278e0206df1c015889302a966adda03a2d8a |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/552ae3762e8b12fb88ddc846a751b272550a6a0f |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/df462d46311f487c2a77d7cb4d8dcad9abd7891d |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/4f55c49e6d5ce7371a55794bf0792720c368a37b |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/f145c3f07881b9884dba06ab043a8bc3405ad6c3 |     
    sh4a     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/1f9f1342e8e6b6b1df63ba430df4e7cbf9561b3c | ORPH
  mips64el   | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/657a11f85783146918fe90fa7e71a5069e82eb96 | ORPH
   mipsel    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/1c31f44a41d12cc850c1a68540b8e5191f0bf199 | ORPH
 aarch64_be  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/1a5ff0c792ceb1b0569250e8726aaa13f3e494df | ORPH
  powerpc    |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/52e7fa3441bdf721c4f1e44dedad71a5b400874b | ORPH
   sparc     |         vmtouch-1.3.1          | NOK | https://autobuild.buildroot.org/results/0d11712a41a5227ab31c1cfdabdc45f149a73984 |     
powerpc64le  |         vmtouch-1.3.1          | NOK | https://autobuild.buildroot.org/results/0fa36f91762515df6a71d4265de310e83a370a04 |     
  sparc64    |         vmtouch-1.3.1          | NOK | https://autobuild.buildroot.org/results/59949a99f3f265c4f7bb863a336565bf9a7640dc |     
  mips64el   |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/bddcfa92d89396d114c729540626c65119609c87 |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

            host-coreutils-9.8 | 3 
           dmraid-1.0.0.rc16-3 | 2 
            gdk-pixbuf-2.42.12 | 2 
package/linux-headers/linux... | 2 
                       unknown | 2 
                    azmq-1.0.3 | 1 
                  cairo-1.18.4 | 1 
                 host-gdb-14.2 | 1 
           host-libtpms-0.10.2 | 1 
      host-uboot-tools-2025.10 | 1 
             igt-gpu-tools-2.2 | 1 
leafnode2-9543ffaf82406f943... | 1 
             libstrophe-0.13.1 | 1 
                 rtptools-1.22 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/70362140d8e8fac766f0f60a7dfb99ee7ae0cbd8 |     
   x86_64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/537b26933eb85d2b043959aef307c64846eeef99 |     
    m68k     |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/a8ff4546411784936927416af088f2e4eaea3293 |     
 microblaze  |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/a28668c3f49a89d0109b038453550309e8a6feef |     
    arc      |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/ebc513da580b1d7f8ccf00843774f71254a59127 | ORPH
    mips     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/caeb4e206a7c862bff13884b9210e246eb742b8e | ORPH
microblazeel |       host-coreutils-9.8       | NOK | https://autobuild.buildroot.org/results/75ae34f78a7a61390dc3841a5b8ab2154ec11212 | ORPH
    or1k     |       host-coreutils-9.8       | NOK | https://autobuild.buildroot.org/results/8d1201ec3943de96f4cd9130ff1dc540a8341c70 | ORPH
    or1k     |       host-coreutils-9.8       | NOK | https://autobuild.buildroot.org/results/b4d456b57647091e5bb516eb35dc757a6a0dad4c | ORPH
    i686     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/ebd00250475cf8c42cd97fe64106727431e5226b | ORPH
microblazeel |      host-libtpms-0.10.2       | NOK | https://autobuild.buildroot.org/results/5ec2568f9df5819fe12564ade681c7f3a0027ac0 |     
loongarch64  |    host-uboot-tools-2025.10    | NOK | https://autobuild.buildroot.org/results/8ee5242d03dab8320dce3bdc7ad13b2c92608bae | ORPH
    or1k     |       igt-gpu-tools-2.2        | NOK | https://autobuild.buildroot.org/results/45c00a7d05c5d105124b90a995e1a7b9d76ed798 |     
   armeb     | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/0fa9b651327dd12db5e1183466f9d5e0debceca8 |     
    i686     |       libstrophe-0.13.1        | NOK | https://autobuild.buildroot.org/results/6439942918eca0038f8f54db3e6fa24ce530d420 |     
  aarch64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/b60bb96a8c32eb2b36db1eb6f572171d2ff8c2d6 |     
   arceb     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/bccf7c95744db879b6c8cc7381fa6d28d957a41e |     
 powerpc64   |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/75ce82cf9025c5fb22a80a0860a83f1a3b8fcf3c | ORPH
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/317e0696607da3f96ebdc21e57d7dcb5eefdb32b |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/bf79498df42dee9e2ebba01be12ea3475a392dba |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                host-odb-2.4.0 | 2 
        host-python-lxml-5.3.0 | 2 
leafnode2-9543ffaf82406f943... | 2 
        ltp-testsuite-20250130 | 2 
                   perl-5.40.3 | 2 
                       unknown | 2 
                   bcc-v0.31.0 | 1 
                espflash-3.2.0 | 1 
                  ffmpeg-6.1.3 | 1 
  gobject-introspection-1.82.0 | 1 
               graphene-1.10.8 | 1 
                   gupnp-1.6.6 | 1 
          host-binutils-2.43.1 | 1 
          host-faketime-0.9.10 | 1 
           host-go-src-1.23.12 | 1 
              host-pahole-1.27 | 1 
              host-rust-1.82.0 | 1 
 host-softether-4.30-9700-beta | 1 
                  libbpf-1.5.0 | 1 
                 libgee-0.20.6 | 1 
                libglvnd-1.4.0 | 1 
              libmodbus-3.1.11 | 1 
             libtorrent-0.13.8 | 1 
                 linux-6.12.77 | 1 
              mariadb-10.11.15 | 1 
               openblas-0.3.30 | 1 
                 openssh-9.9p2 | 1 
package/linux-headers/linux... | 1 
           python-rtoml-0.10.0 | 1 
                 rtptools-1.22 | 1 
                    sslh-2.0.1 | 1 
              tailscale-1.78.1 | 1 
  wireguard-tools-1.0.20210914 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          bcc-v0.31.0           | NOK | https://autobuild.buildroot.org/results/53861709b14f27810f4c7186a3e0cca75852d7bd |     
  sparc64    |         espflash-3.2.0         | NOK | https://autobuild.buildroot.org/results/5dd04b5de659b6b850107fdc29c80242d0f7c869 |     
 microblaze  |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/dbc0c1edb5db9a5f120569ac970c9db3510edaa6 |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/63a809e949ddfde9229dce94c0c7c9c298ae3183 | ORPH
   x86_64    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/ae4a72772495c391dd39f579da6d16afee4c349d | ORPH
    or1k     |          gupnp-1.6.6           | NOK | https://autobuild.buildroot.org/results/8a401c252d15ff97593a2cb5dcd13e8911eee267 |     
microblazeel |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1e270a5608bb825b67f2228255f7d85333fec932 |     
    arc      |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/96838cdd9472057e6e670241a7a8ec9b1ebc3ad0 | ORPH
  mips64el   |      host-go-src-1.23.12       | NOK | https://autobuild.buildroot.org/results/aaac51366adf7d7a9e766373beaf76a763dc770b |     
 microblaze  |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/4cb4a3043f315b9ae098536deede9002e7cf175d | ORPH
   x86_64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/5d250eddddc99c8f6a7e3cfcd898b8e2a8c77e6d | ORPH
   s390x     |        host-pahole-1.27        | NOK | https://autobuild.buildroot.org/results/51af4ae72e94381a9d17ba21bc791db937fe5e14 |     
  mips64el   |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/22835c4459163c935ad17c8ecb3bdf9871756bda |     
powerpc64le  |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/b7adb5fba49b9b4c70969e90fae81250e5e24bde |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/a137e7ba461f11e62e1de378416dcf40b9418917 |     
   x86_64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/69bd80714d595005b244c25c066c671e33c52d04 |     
   x86_64    | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/05939cc84ed93502bc8ab7e5c45ea479bab314c9 |     
  sparc64    | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/f16510176bc843f582a69d4f8aca4052e794c097 |     
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/6e1f2334006ca1e359d4b3e81d61e46a0aeecba0 |     
   x86_64    |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/019ef447f7453bed8ff1a84e4ee95ef6f43da99f |     
   mipsel    |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/c3e65f2c503d3ec592facb2e07359d857fc81542 | ORPH
 microblaze  |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/777afc2082fb41207e19dad99e47d0486d345c21 |     
   x86_64    |       libtorrent-0.13.8        | NOK | https://autobuild.buildroot.org/results/4fd78a0aa974107f7ad02f25f1f7b03483e16870 | ORPH
   sh4eb     |         linux-6.12.77          | NOK | https://autobuild.buildroot.org/results/ca9d497dd5e65ae0a6de3ed5a6b6c0dc0f55af6c | ORPH
   x86_64    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/a4bb90b44d9ec0a224c9decec79ec0772bd8ff8b |     
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/ffa8c01096fa25fc6f945a6fd0b9dd11dfd08605 |     
    arm      |        mariadb-10.11.15        | NOK | https://autobuild.buildroot.org/results/132a767e58fbcd2dd8ba74c37d7c9b309a49cae8 | ORPH
  mips64el   |        openblas-0.3.30         | NOK | https://autobuild.buildroot.org/results/897e72a13a6d0ed999585f0245fc3c5d348832e2 |     
   mips64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/58ec7fb30ef4e402424c1dd44163a2c697dd6986 | ORPH
 microblaze  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/73eb34a4ab60a629a1a83ff56baef2a249cc438a |     
microblazeel |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/9c15be4e05e5f0e5d0da19b1a42b4a5c8717f75a |     
   arceb     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/b9d5edf51343990b0cb616e9e7c0eb7b460ccfe8 |     
  powerpc    |      python-rtoml-0.10.0       | NOK | https://autobuild.buildroot.org/results/7502f07fcb372e3e97d570724742592f675bb482 |     
 powerpc64   |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/cb1e7be95850e9f1f249df8fccc07ca59b796772 | ORPH
  aarch64    |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/f7835610512e4a03df9ceeb3b5d86e7435f3ae0d | ORPH
   s390x     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/56824b111aa0bfdb798dbe053ee2a28e86f99690 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/b8c7c21711cc5934e54615c6e094f7d7b31e62a6 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/3f19f33bd1dd1da8daca453f3f46185cdfe7b1ab |     
  powerpc    |  wireguard-tools-1.0.20210914  | NOK | https://autobuild.buildroot.org/results/2480b77c51e989723a01f8db5bac550dfbc8aafb |     
   armeb     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/8e9f3391be02c9b51b94c119a8546778fe21559e |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
