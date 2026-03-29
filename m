Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB1710D1494
	for <buildroot@archiver.kernel.org>; Sun, 29 Mar 2026 03:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAAEA60674;
	Sun, 29 Mar 2026 03:25:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6pYYrxfsWgfv; Sun, 29 Mar 2026 03:25:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E069D608A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774754758;
	bh=QS9pYiDqnfAKZvW4mev60S5mSP+z9tnUR4cCvA3h8RY=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QbVYFcKi6+trEg9CwPFozSTWUzowRkMdUX5eSJShII8GLNQ2RwXx9TUJOpthWPfgt
	 Ktwun4qMdUda4pnneAOPcrktUBrSqqpCwQ15MJtMIhIAJVLKWsCYSfN05XbMzoMqNm
	 aG4uaPv3pOBbwt9QZboMaoB6wt1DoLAVOesxG7uoYSTSIaukQ7FnZe7PLnc2mlO8hf
	 084LgMVUZl/Q7a1SzLDo6cOVBlNZtgskU6hnJBP35i99coSTH0sSOzyXLT3ClNp5Wx
	 7wc/viTclbL1Wh/0e3e7gJvMxze2WMc+BcenqrshPnx5ZfSQAOFY6P84t1ulwNEuhv
	 /39pL3bcqOeng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E069D608A0;
	Sun, 29 Mar 2026 03:25:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 31C022EB
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 03:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23611400D5
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 03:25:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QxXqCS-e_RwJ for <buildroot@buildroot.org>;
 Sun, 29 Mar 2026 03:25:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 099F640027
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 099F640027
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 099F640027
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 03:25:53 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48558d6ef83so32209365e9.3
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 20:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774754751; x=1775359551;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L22dIOBXbLDWuNMNqy+Y4PZf0UFnLLk+fWLM2WPhR7Q=;
 b=Fo7ydDYd50x3FJQOp0OXAGJqd9M5rn9lBzuOSbQvGirFKN7CKUkCLA3U3U2wI8BX8G
 tZ++P4+utyocYfLGHbQIgNj0hGmiM7TmOiGfT71qXmkxQixB+m29UppHv9YfS9z0ExYP
 KUkCd1PDxh4lHxuKxVJlfA/4qgpIe/T27y5wf74VgrqBKKkBVLuaEpDVGLYaV0eIFAlL
 EZhI458fWxG8vkX9Vaw5BiXrirYwG5G0G6mqiLqLYZxTmRAdMl/asOScp8qwV90KUo0E
 Ue9bM/9h6xf7IUq7GnV2QDmZLO6QWp7xtwvtt0j0WXpT0PwfJM2u+UOL1KLRMz9I3dm0
 Xngg==
X-Gm-Message-State: AOJu0Yw4DTI/+FvqosZPgyH1j1i0vosppSjN2GD1GHb589QMOnibOm5Q
 A/aT5f/vhSGfQkDZTOxk0tIFsQ82M5ZbUTU61oTkobJ+IzqeLkAtiES8QgJ5j41j
X-Gm-Gg: ATEYQzzO5/ZCwU2UxBylhoei59eG8VVPFkI62S6/cN22Oa1c04s8nretc0/FKX09wR4
 ZVQbzuwwXTo5Xp6/ERiicszWBGf5ptS1Kj2t4qhybkM79FSRTC8ZT2BsVgi/IncJ5YR4zjVZi3e
 RJAqiNSB//V4pLv7E7uMac+EVXae9Zxi1WO7KSNQGAz3zv2qj7RWyhVH8CSFwR/DURkHv6gnYUP
 XaYbKoXdS6R0NGT1096prdNs/hnBmBfVUlpOg52xSeSZ4l2qqcDlN+CEctvPJvW70Q2FtwmdLHR
 c4CAYanfrc/hUyeC1WxS7h7wk1qp4WlXu6fiKX9xQUOaf4WesF7keveMeBSUk3ewq6CW/RiMbXr
 Wm+1//SnFxEOjNmEk9cEY1EFoqNCQqj9kir5mYMlC2aku3QUlZ0ue9lqH357S0ZKfQU3OCvdcWz
 SwztqSwDmp45ixlVaaYhVH6aO7zA==
X-Received: by 2002:a05:600c:a408:b0:485:9a50:3370 with SMTP id
 5b1f17b1804b1-48727d735a7mr98012725e9.8.1774754751219; 
 Sat, 28 Mar 2026 20:25:51 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48722d23679sm351642965e9.9.2026.03.28.20.25.50
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Mar 2026 20:25:50 -0700 (PDT)
Message-ID: <69c89bbe.050a0220.1af07.76c3@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 29 Mar 2026 03:25:50 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774754751; x=1775359551; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=L22dIOBXbLDWuNMNqy+Y4PZf0UFnLLk+fWLM2WPhR7Q=;
 b=jkQdQS1qQeGg+ofX70abLw5/CBzgotfoNLzLh4LD3b8Ejwgjci5oKyjLk1tbg5udtv
 +nyejkf2ZpV8qxNCAiMWoSgk8Tpd7YF1siCVVYJl8qef4XfNBNfMRgI+xq0voO/jDO0Y
 kguTUkUga9kKltF8vwLdGim+xUnRR3MEbU5kqkCTyBIT7YfttwiWXD/f+sUoUDESUeTC
 gXMOq2odH2FrUvOF50zA42RgQUFa+6FRVyjpMi9V2775/h0Lw3WlnT56pFavbRHEG1ZJ
 xiyrrAVyBZK5S/K3OiUMXnyj7iS8UkyWYLsu2TEqbd8aSazWDMuxJF9PgAokKGSUEB2o
 2IGw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=jkQdQS1q
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-03-28
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

Autobuild statistics for 2026-03-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  9  | 33  |  0  | 42  |
  2025.11.x  |  1  | 13  |  0  | 14  |
    master   | 24  | 141 |  2  | 167 |

Classification of failures by reason for master
-----------------------------------------------

                flashrom-1.7.0 | 6 
                  libnfs-6.0.2 | 6 
host-gobject-introspection-... | 5 
leafnode2-9543ffaf82406f943... | 5 
                       unknown | 5 
glibc-2.43-17-gdd9945c0ba40... | 4 
                 mdevd-0.1.6.5 | 4 
odhcp6c-f19dd37fb467c9cf10c... | 4 
                   perl-5.42.0 | 4 
             dahdi-linux-3.3.0 | 3 
            host-protobuf-34.0 | 3 
            igd2-for-linux-2.2 | 3 
                 libmbus-0.9.0 | 3 
     libphidget-2.1.9.20190409 | 3 
        ltp-testsuite-20250930 | 3 
                       mrp-1.2 | 3 
                openssh-10.2p1 | 3 
                openswan-3.0.0 | 3 
uhttpd-15346de8d3ba42200249... | 3 
              fftw-quad-3.3.10 | 2 
  gobject-introspection-1.84.0 | 2 
host-am335x-pru-package-5f3... | 2 
                 host-gdb-15.2 | 2 
           host-libtpms-0.10.2 | 2 
              host-pahole-1.28 | 2 
              host-rust-1.88.0 | 2 
libdill-32d0e8b733416208e04... | 2 
libftdi1-v1.5-62-g5e67403c4... | 2 
                 linux-headers | 2 
                    lua-ev-1.5 | 2 
            optee-client-4.9.0 | 2 
       shadowsocks-libev-3.3.5 | 2 
               tcf-agent-1.8.0 | 2 
            18xx-ti-utils-R8.8 | 1 
               asterisk-22.8.2 | 1 
                bpftool-v7.5.0 | 1 
                 c-icap-0.5.10 | 1 
                   ccrypt-1.11 | 1 
cegui-e7a03afc70c6182a091ff... | 1 
               collectd-5.12.0 | 1 
               dvdauthor-0.7.2 | 1 
                    ficl-4.1.0 | 1 
                      fio-3.41 | 1 
                flannel-0.26.0 | 1 
            gettext-gnu-0.22.4 | 1 
                gnuchess-6.3.0 | 1 
            host-libtool-2.4.6 | 1 
    host-mender-artifact-4.2.0 | 1 
          host-mosquitto-2.1.2 | 1 
                host-odb-2.4.0 | 1 
                   i2pd-2.59.0 | 1 
                  iozone-3.508 | 1 
      libabseil-cpp-20260107.1 | 1 
                libcurl-8.19.0 | 1 
                  libnss-3.122 | 1 
               libunwind-1.8.1 | 1 
               libvorbis-1.3.7 | 1 
                 libzlib-1.3.2 | 1 
          linux-5.10.246-cip66 | 1 
                 openal-1.24.3 | 1 
      passt-2025_06_11.0293c6f | 1 
                 pixman-0.46.4 | 1 
             pptp-linux-1.10.0 | 1 
               procps-ng-4.0.6 | 1 
python-remi-2022.7.27-37-g1... | 1 
              python-xlib-0.33 | 1 
                 rtptools-1.22 | 1 
                s6-dns-2.4.0.0 | 1 
              skalibs-2.14.3.0 | 1 
                 sqlite-3.51.3 | 1 
                 systemd-258.4 | 1 
               trousers-0.3.15 | 1 
                  uftrace-0.14 | 1 
ustream-ssl-5a81c108d20e247... | 1 
                 vmtouch-1.3.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/1fd83b52c608c778e1997c78667a5f9e5dbcd97d |     
  aarch64    |        asterisk-22.8.2         | NOK | https://autobuild.buildroot.org/results/bd26d3db56fc08525d9fb94ce583492dd7a5e509 |     
 aarch64_be  |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/d76a18f51c88d8506f869874139c1115fa1de03a |     
    or1k     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/af3e83e75077025f0b4542d9b4c08ed24d2ad9f4 | ORPH
    or1k     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/ca7f61deaa23621ab689ee4254306fc039406b85 | ORPH
  aarch64    | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/d4fda283836b1911b32959ee70606fa9855d2701 | ORPH
   x86_64    |        collectd-5.12.0         | NOK | https://autobuild.buildroot.org/results/387c321b3e180b22f9477f48926a850317d72ac3 | ORPH
   armeb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/1815f5507cbaffe600b3f49401a1b9779193da55 | ORPH
    arm      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e1a3e8812f1ce3a1d76c8655a62e0a90d6c5b29f | ORPH
   xtensa    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/6334bec0c826f3128b1ffeb8f64e1883c5250d7e | ORPH
 powerpc64   |        dvdauthor-0.7.2         | NOK | https://autobuild.buildroot.org/results/0c050e00d161056f5b738fe06be092e11bd833ac |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/28e4e96fca3a28b5297249ee0c1e66c389afdbe0 | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/a79971cc1dfd5c397058649f800633c0aa3bf761 | ORPH
    arc      |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/0fabd1d52b9199eb333788bf63b9cf3adcd75463 |     
powerpc64le  |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/a3de2978a99acd03b7c06a76ceddb8fdcb7fffeb |     
    arm      |         flannel-0.26.0         | NOK | https://autobuild.buildroot.org/results/f4ab77e85427158e9ef16d27c673367598bcca5a |     
 powerpc64   |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/8f3a383a31306f68b3344e79ab0a437a90c68432 |     
   mips64    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/4ba49a41d20bba69258c4a7762123912f11ef55f |     
   sparc     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/a0ab61360433714678c9b51661fe9ba957b2b790 |     
   armeb     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/c19bb698322a5db0af9276e385e6be7e5785831d |     
   armeb     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/4d8820a541edaa62dc61f4e33fc92929c597566d |     
   sparc     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/6327c919dbc9a4c61c4d364a6a25bc177571c9a6 |     
    arm      |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/709f7da1af59910302b687866c5de5febc246080 | ORPH
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/a1cc40ee17d3366106e03a9bf600b2ebcd36566b |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/efc0313a3e072d0d254edf0b3839f8c21fa8cad6 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/d7b93ca6ad38a43206a9978800f17527a89b9072 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/dfe4e4ced8fafa3ae20bad72154e7a79a0725577 |     
    or1k     |         gnuchess-6.3.0         | NOK | https://autobuild.buildroot.org/results/5ebd95017c0ecc7d860624cc5882b2d9b5547a85 | ORPH
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/26e2124c35510f321d0eda1bc1c7068d6186eaf2 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/b17e7fc47adc0a61c73b09cdfeb86cbac318bd8a | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/4f9c11d7063abe8d14fe35f003c17b6752c05db5 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/19f94d2f38b9a2d04024e6b1175fec65cd5fe1c1 |     
   mipsel    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/be6b7277ecbd4131b2effa7b1cca2379959c6879 | ORPH
  riscv64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/7b7ab8deeba81bd437db6e51837510456f756524 | ORPH
   sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/df5efb49f0ebf59972b6d87b33a583b9ad7b8836 | ORPH
   armeb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7e3fb2161d89381f6f10b3869361b8cb14d58b1d | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/45ebc2bd18218e555e41fe8281b6e384199ee356 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6e3cba7d539989825de7bd2b4d1addce77eece74 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/36367deba88d86ce3f6124f7eb96494864e42c12 | ORPH
   s390x     |       host-libtool-2.4.6       | NOK | https://autobuild.buildroot.org/results/07c907d06804d2a5a4c88bd3963102e908df23c4 | ORPH
    mips     |      host-libtpms-0.10.2       | NOK | https://autobuild.buildroot.org/results/ec030e278d03cca58d71b4d8f735adb0a1bf7716 |     
    mips     |      host-libtpms-0.10.2       | NOK | https://autobuild.buildroot.org/results/95a3eb35a22dd108ee90a4ed4bdaf6b6b8629585 |     
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/b83f91c2ec7a3e3c6fa93dcfd4b60253575907c5 |     
   mipsel    |      host-mosquitto-2.1.2      | NOK | https://autobuild.buildroot.org/results/37d426add30946354a6fe066503e7aa2310b8e7a |     
    hppa     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/c7af908ce2ebfbe1b1ad4b81e7090db90ec16dfa | ORPH
    mips     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/f931f558d80de50e2e3e383c37c97c114f16bef8 |     
   x86_64    |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/f5c2f5907ef5aa206db3198e80661f08927e0083 |     
  sparc64    |       host-protobuf-34.0       | NOK | https://autobuild.buildroot.org/results/6cf93c1ec6cfdd9eae4ce9193621b11f40989793 |     
  powerpc    |       host-protobuf-34.0       | NOK | https://autobuild.buildroot.org/results/d5e4e196126ec2aa510a0893f83f7d5f6d38b28f |     
   s390x     |       host-protobuf-34.0       | NOK | https://autobuild.buildroot.org/results/dd9dc972abe3278ff36fab97104ec6c435833365 |     
  aarch64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/a8c508e9c5ef231a2f37758d4dc6bca51b931fc8 |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/47ec3a0608a86e447dad25659de8c54075d2ad53 |     
    m68k     |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/694240616eb5ca53f0a5ed5264e6d6db3f68324a |     
   sparc     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/32d63ef70f72d997a2757f28560c38f414576e67 |     
   armeb     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/03fbf4208bba7a6d21892e12ec017af66945c467 |     
   sh4aeb    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/aa17a8d9396972c3327cad088ee45573b25a5c9f |     
    arc      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/7ac20e0cf7dd1b9b7f4f799b828b03cde8bdc51d |     
    or1k     | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/39e21f78e2a0c5d303c387f1597846c85a431e49 |     
   armeb     | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/83c4a2c0d3c7c535f45a5f74d60fe13d527c6d5b |     
    mips     | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/73d17b49e1467b518b78c1909b3e18a172951e26 |     
   x86_64    | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/bb0de3091d84fe22f5c2511f67e2af8e9b27a15d |     
    arm      | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/8fd5198ef1c13bad88b1a4a3babac3388e23d2bb |     
   mips64    |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/79f7ada89ba16e40d0d498b86c82259c301e4c44 |     
    or1k     |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/9c28cf712567f07341cdf7e2676337e686bab536 |     
 microblaze  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/56c2c38fc35b8613e4ee2175e0952e565d4607f5 |     
  aarch64    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/57d95dd866f41a5e7f5444b187d71c5d7fe029a3 |     
  riscv32    | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/ece3157172735f17b86ff1c4a8f99ec201f73208 |     
   mips64    | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/e7d750713ecbb26f0d4116084d1ca4c9769a7ec0 |     
    arc      |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/80adadb0d2ff499a61047e7736ad83b60b65f082 | ORPH
 powerpc64   |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/c4b712652b6470063572d8ccd8077c5ec82f8055 | ORPH
  powerpc    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/f985473a809fcb0f2622dd3a4528ccf67ce43181 | ORPH
  mips64el   |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/7b955a5cea2d646f68afa579cc8bed37dae15ffc | ORPH
   mipsel    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/f50643788b8eb07b9ee36069b2ba4b6cd1be6b57 | ORPH
   sparc     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/255b07e38a7548d73052800aea9fda1adba63630 | ORPH
  sparc64    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/bf7aa3ba0ccee935115abb43253ce583572efb20 | ORPH
   mips64    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/c9b4c985806a4a65e2e6caffb0c77b1069b2bdfb | ORPH
microblazeel |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/05d2c20bd1e4cbedcc193d75e6621fcc8909eafc | ORPH
 aarch64_be  |          libnss-3.122          | NOK | https://autobuild.buildroot.org/results/a4ea0276a398fcab1441db8e3b812cd05a3da4ca |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/03db0d51b1155bcd450622c20bcbfb060fe0f5b7 |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/55af46452d3c7d726f0d175b31bac0e73872c44e |     
  sparc64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/8e42dabef5f2ddd02ab4a69cde4513d2df1a5854 |     
   mips64    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/b01152cbc1d596139f0ff1ac2a91b2cc43ba2185 | ORPH
  powerpc    |        libvorbis-1.3.7         | NOK | https://autobuild.buildroot.org/results/801d62bfb1b3d4f78dfe5df4983ab5432385b137 |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/d6f912016c3299db0764c38988171fe026dfde20 | ORPH
   sh4aeb    |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/a9e4079bf16a6b6dd823eddad0456a6221119333 | ORPH
  powerpc    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/1546a336539d1e896e104691f4b519e439276ebc |     
  mips64el   |         linux-headers          | TIM | https://autobuild.buildroot.org/results/b1e23a59696dfa3eeb9efbb32b99dd9c76f430dd |     
  aarch64    |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/a239508f2f15f0fe826af5b28f99c10a54a13244 |     
microblazeel |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/163680f370303f24b24de5a5f52863711a0f456a |     
 powerpc64   |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/225c833f3e5c152e472587d1c462548818c7f095 |     
 microblaze  |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/20a52b03e635025a209f28659713c9941fb2621b |     
microblazeel |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/17f64b29b984667d67518ceed837501b6a13b068 |     
   mips64    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/1040ffb93202fa4c99103ab151842f523ad149e6 |     
loongarch64  |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/7f0539adf114733fbe9b4b0d483351cefc98e000 |     
 powerpc64   |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/560b88bd5f9090d86aea04fac5027b71d16eca31 |     
    or1k     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/b343eaceb97240651dfc78b602b4acd13be5f13e |     
    arm      |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/550869595527d50c46b291ea1161b8d35ea000f8 |     
 microblaze  |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/6b5785f1e2d90eafb5b23962c7a040729f5d8ea2 |     
   s390x     |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/d3c4dffb6cd74ad2237c159b9cbc01d3fbe84452 |     
 aarch64_be  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/7f4d7ab3b04269edbf365bb213f0d51e24afaea8 |     
   s390x     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/7d15c48e0a239adc57e10b7c15f5d5b0e168cb9c |     
  aarch64    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/884c18f1926b69611aa4544c99a887097326a1d9 |     
    or1k     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/d55898c32e86c837bf03a5be0d66a4527d7a12fd |     
   sparc     |         openal-1.24.3          | NOK | https://autobuild.buildroot.org/results/3fb94c918fc2f406ffe2e4156f55ede214288baa | ORPH
   mips64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/98d67bfe43208685dbe5a6023bd153ad3e30031d | ORPH
   mips64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/45e7ea724f8009735072cd1bbb55ae51b7981154 | ORPH
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/a5029f2a1438b0333964ee2603a0f96f17ca2418 | ORPH
  mips64el   |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/152656ce9b86ed004923ad81f4ef419916103daf | ORPH
    arc      |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/61dabe34155a2a884f1c17efffe097d3b7f3dc84 | ORPH
microblazeel |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/1490ed0c808f007089b3d951b3740d2e7a325085 | ORPH
   mipsel    |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/6bdd6b22c63c91c6085d2b32d0602f38932be724 |     
 aarch64_be  |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/31738a16bc8a190af82e8f1537226cf5967cce4c |     
    arc      |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/f58f327a1b944b86246b915b6d81dd53beee6491 | ORPH
    m68k     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/c3c10323d0da47b761408e962346b7e08e0d519d |     
   x86_64    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/62fbf770fdd49268eabd9f027d6ba1a8b16f08ca |     
   armeb     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/b26709c672d92b3fe08ecb741e1a927990854bc0 |     
 aarch64_be  |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/2b11e5a8192f8b121d5a912b5aa3ca83c4e8e112 |     
  riscv64    |         pixman-0.46.4          | NOK | https://autobuild.buildroot.org/results/70a6230dcc0b1b2f780e05e9bc999338d94cbe47 | ORPH
powerpc64le  |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/39264de1d7ded28b3f9fbf487972622f94845516 | ORPH
  aarch64    |        procps-ng-4.0.6         | NOK | https://autobuild.buildroot.org/results/48c8935e9192201b0dca2b92fae9e50bf50e9218 | ORPH
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/801936b79ae8b2ff529e2ced107baede7ffa5483 |     
loongarch64  |        python-xlib-0.33        | NOK | https://autobuild.buildroot.org/results/303f86eb6eb56dee1f74778e09d2e3792d387347 |     
    hppa     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/39c9615e57615f20af2d19e40c7f5713099952e5 | ORPH
loongarch64  |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/6df52f3dfaf835e83e810c2d779011a4695bfbcc |     
    arm      |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/0576d7dec59262288cf7f120b11fa5edc563cde5 | ORPH
   mips64    |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/7bef884c73e1c123be2ee23bdf108485bb1f92ab | ORPH
    mips     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/fc7c003c500148f8b72e7608a108eb717335d2d1 |     
    m68k     |         sqlite-3.51.3          | NOK | https://autobuild.buildroot.org/results/7ca1a5557dfa15eefe8621abdf26dfa7d06ee0af |     
 powerpc64   |         systemd-258.4          | NOK | https://autobuild.buildroot.org/results/690e46ce234f701c8070b41dcd8cea3e5019340f |     
powerpc64le  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/e43b5c8e3ecb8ec131c818f47cbe0aeb0728e9fd |     
powerpc64le  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/7fc3b5db7cbf6b70a5c4dea1c9fbcb9fba4ffe2b |     
    hppa     |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/7bf593f68e051bdb2612d62e86a5a0b4c62be176 |     
   x86_64    |          uftrace-0.14          | NOK | https://autobuild.buildroot.org/results/1c98feaa4b1549250f22dba77320915c62e48d98 | ORPH
  sparc64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/a1cfec03f56e7956151fd2cbc22c856b724cf358 | ORPH
 microblaze  | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/2c5f29349afffb51db2743ad54438cd3268e35dc | ORPH
    sh4a     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/149aded52e09fa857184e6526a20e78244137708 | ORPH
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/e33d6e9941d25e9211c81c71113cd33987b62215 |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/1a40b4cb73a1d541b115b3a900e450be36505b0f |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/f9dd5b5055a4b53355196bc7bd4d65bc57ce474a |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/5d59f51afc8d95c3769af7d5f46457dc3b4fe172 |     
   sh4aeb    |            unknown             | NOK | https://autobuild.buildroot.org/results/086bd57438605b2b24250ad7c9ad31f09fb2013c |     
   armeb     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/20275d5a1963cb37f81e354240f972152b651104 | ORPH
loongarch64  |         vmtouch-1.3.1          | NOK | https://autobuild.buildroot.org/results/28cfc654f675ee34019882c50d2817b3072b073e |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

       host-libunistring-1.4.1 | 5 
             pptp-linux-1.10.0 | 2 
                       unknown | 2 
host-gobject-introspection-... | 1 
                host-gperf-3.3 | 1 
    host-mender-artifact-4.2.0 | 1 
uclibc-ng-test-132c6134d691... | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6d5b0e5cedc40061ae45a65ef8a69334cb11e641 | ORPH
    i686     |         host-gperf-3.3         | NOK | https://autobuild.buildroot.org/results/7a34ebb6b2dd554c254817f5fc4d0ae63f9eceff | ORPH
  sparc64    |    host-libunistring-1.4.1     | NOK | https://autobuild.buildroot.org/results/05a93c0624d54ded0202355584bc9fd87e380883 |     
powerpc64le  |    host-libunistring-1.4.1     | NOK | https://autobuild.buildroot.org/results/d6e09ac31e29c74ff25b4c5df32ac0f37ed66f52 |     
    sh4a     |    host-libunistring-1.4.1     | NOK | https://autobuild.buildroot.org/results/ecd1c4bf129d7da42b7f6a4a102d98cf154d5e3d |     
 microblaze  |    host-libunistring-1.4.1     | NOK | https://autobuild.buildroot.org/results/62a8ecb390ec4ec6199116c87216e3463f2f5b4e |     
   xtensa    |    host-libunistring-1.4.1     | NOK | https://autobuild.buildroot.org/results/b16d9e337341614bf65ee3363f1934b955efc78b |     
  riscv64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/b6a79dc70e5bdac28d0d213927148a9dd7c6113e |     
  mips64el   |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/4456fd5805c6c428c912b2d6a1f39531824d3967 | ORPH
   armeb     |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/f2e3afb937fa03c33dee675d794e29d5c5896330 | ORPH
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/0fc546bef4b488a958cc1823c6e5c1e21a93f91d |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/6db0a1d9c973b7ea340081015bdfa5804c0f5212 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/cf2db9e564c95d265c17845b24ca3fd032e19de9 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                       unknown | 5 
          host-faketime-0.9.10 | 4 
              libsodium-1.0.18 | 2 
        ltp-testsuite-20250130 | 2 
                  brotli-1.1.0 | 1 
             cni-plugins-1.3.0 | 1 
                   dante-1.4.4 | 1 
                  ffmpeg-6.1.3 | 1 
host-binutils-arc-2023.09-r... | 1 
            host-libtool-2.4.6 | 1 
           host-libtpms-0.10.2 | 1 
    host-mender-artifact-4.0.0 | 1 
host-netsurf-buildsystem-75... | 1 
              host-pahole-1.27 | 1 
              host-rust-1.82.0 | 1 
            igd2-for-linux-2.2 | 1 
                libdrm-2.4.124 | 1 
              libmodbus-3.1.11 | 1 
              libopenssl-3.4.4 | 1 
     libphidget-2.1.9.20190409 | 1 
            lttng-tools-2.13.8 | 1 
                openswan-3.0.0 | 1 
package/linux-headers/linux... | 1 
             pptp-linux-1.10.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/3234299739d8978212ebd67bc4d7a5913cb1dad0 |     
  riscv64    |       cni-plugins-1.3.0        | NOK | https://autobuild.buildroot.org/results/25b52dabec37aa5829562f2f1deca43b9725b8c0 |     
microblazeel |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/239bb987e5e99ca069412488cbdb5e8022b7132f | ORPH
    arc      |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/f490814e10010d4c9b9f4dae18dcaabeedf1eb44 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/0d428caf4677f8a496365949abd4b8052d7e0cd3 |     
    mips     |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/2738d5729e2d198f4d34a2e767a1d5d546b9dcc6 | ORPH
   x86_64    |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/e6004dc2c0c39392e63cc8fda3b9516f1784b7b2 | ORPH
 powerpc64   |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/35403479c6180f15a51d61b98fe6eed1d639a827 | ORPH
microblazeel |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/6ef3f747cc9defb41d0459935ef88a393b5dc882 | ORPH
    mips     |       host-libtool-2.4.6       | NOK | https://autobuild.buildroot.org/results/80d28cac151d53b04465542e7ba478066bce428b | ORPH
   xtensa    |      host-libtpms-0.10.2       | NOK | https://autobuild.buildroot.org/results/d94f7ea0ab407cd20b1e86a97759d6be64489c07 |     
    i686     |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/756db9860549ec178e647f84f90da4fbf59b3d0b |     
  aarch64    | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/45e25c5569c66bf90e37f1b5b8cc6df5df38856f | ORPH
 powerpc64   |        host-pahole-1.27        | NOK | https://autobuild.buildroot.org/results/94208f0c2188849394802c5dde836c7a92021c26 |     
   armeb     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/c05e10646a154f885ee5991fac6d015d1648b0cb |     
    or1k     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/7fcff75b686caa4ec64992d7c8bc3a23a7866ae3 |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/57209d463894ba1cda0a8f8cb88519bf143ac6ec |     
   x86_64    |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/a25ba2adffbd1a8996a6877ef6a6c402887e243f |     
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/6163c140a7ff3fdbd7bd7af02a9474bbf644b44c | ORPH
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/79fe1484f0f7ee38e7adfd224a03dface2d67215 |     
   mips64    |        libsodium-1.0.18        | NOK | https://autobuild.buildroot.org/results/9a620d4aa964e25a2f9bb90b590e97cda0697fe5 |     
   mips64    |        libsodium-1.0.18        | NOK | https://autobuild.buildroot.org/results/ea58540b4ed63a29b514931ba170b8e4b4519f51 |     
    mips     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/a8ab59cbef05ee634345f67aed2c394d4e0232a4 |     
   mips64    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/24df5ffb1539d3bc5188744ab0242f298bad862b |     
  aarch64    |       lttng-tools-2.13.8       | NOK | https://autobuild.buildroot.org/results/bbf6aa7bc3e2aac1af59ec29ec34568f4d6a772c |     
 microblaze  |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/ac0f3158d54494607dc97b3780ac97fa018f0326 | ORPH
 powerpc64   | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/3d7644cffbb9d78172b068639663f8142b7dc7a8 |     
   mipsel    |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/fef5ef827dd2c1b12cdafa7a4331c72cf787c85a | ORPH
    sh4a     |            unknown             | NOK | https://autobuild.buildroot.org/results/73df50fb6bdea6d5ee08399c3889d8278eb3400f |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/79c7c0064b691e2967f21836ce2cdeb571bfe5fe |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/a1adf24836791ec333da05f20489761fc1e56892 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/d78190279bb83344808972673618445fa0701d8e |     
   sh4aeb    |            unknown             | NOK | https://autobuild.buildroot.org/results/e80ac2cce34090f54181bbeb1a5bd46d881ba9e0 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
