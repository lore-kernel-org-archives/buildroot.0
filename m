Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C773AD58B0F
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 04:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C55E40D0C;
	Sun, 15 Mar 2026 04:27:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lKam6Yjks_cs; Sun, 15 Mar 2026 04:27:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6003E409ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773548835;
	bh=XcuhBIuXD5rDwv+TjOIZT7ckyK2SjOd6I3ZJxz6FqNQ=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B5bq/qkMGIiGV8DSkkbgc7xk8J21QjKWY563NK3jTmNrMV+XodR3XZZpAUBciqPSx
	 VfRueN71ePcDws2X42v0oF60bpx+w5SwW5Y2Ut5cxLEJ+cOu4OrkoNcdRrixuM7poH
	 FuEE2v2C9Lzsxgu/SMsppPooeMXdOMt4lVmhUOatT6gbx5kncDivr7g4tdHqYl9rAR
	 FQRHzAIUJ7dMGug6OUYIObwVuf/jA0SIvrPysq77mvDaPJg8ZcauOPU0vW/dHFmLvF
	 GTnZtKPvpFEaugC00q77Nbdj6prgL04qXo35nzPcIrkUFaH8l1qtJo7RM2UTe4tji5
	 fFISmVplao4Lg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6003E409ED;
	Sun, 15 Mar 2026 04:27:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E94F1B4
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 04:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 305F6409ED
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 04:27:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jukRA30EjB75 for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 04:27:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EC848409EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC848409EC
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EC848409EC
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 04:27:11 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-43a03cb1df9so3361196f8f.1
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 21:27:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773548829; x=1774153629;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mEn2H6uraDvxniuz84VtSMvK4AGEVCUgQhcZoximhQg=;
 b=DKPefOmzQ6i4sfK/f8QGlpGtSOWQvDSVgjeR66g12Jlku/wB0f0Pa8DyGmXJUwXk5m
 36dCEIBw76HDOGvTYVsDLKQ22xKfBdMzmFG5WwA0yl/drmhrNQAvVkCru/CYikYjKpUj
 cflLNIn2wMhnFC7ahfIZRg9HviLhiPPQovWV1pgJq+vFHFcM5EfiZ2BQya3A9RkQ9+ey
 xvAMlgURg2CwDhn+fE3vcV2ErAr4iMjb+XUUZGjSn9LwqNd/1xf0gwLVyjw4eHNEprAY
 LRfDDPyw2o3f9DHXgSY+LKiLcqMTNo0Ette8GVOuXySUk0/COROEmbZB6bhj7Gb5Va1s
 J0Yg==
X-Gm-Message-State: AOJu0YxiehnYXIEa9rEkqoyjVzFFp3Z7Fsbn+yN0c9+/4RAOAk2NTSZ2
 dtzFAn2oRFynoUqz9i4NSJK6DJA9PGInMOBj5womh+fi/LdfyotFx8bqchGMGV7m
X-Gm-Gg: ATEYQzx11QnZ5vfsCp3pmErRPY4AnUhDDWuYqdbynRug69H+aPd9L2DIOIEgU5mCytj
 h66k63ZGMR5PwBJHWevEEmmLpddFUNMpXVBgLBadfa3KRwjdjozXMEHNlk8er1eljV7V7My5ive
 +mcgXNAcQlDAvlwf8oUNeJ3riK7IHIYPJdlSBb8IgQMvOwtQHiVVyMa4uaj2/njc0c8LYU/WyC4
 Wz4wDbV/cAiBkYhBpPL9WRUAsUdJ+aUVQK5G0Fx0H11UCn4ck7COpq9Q+IDIKPVEWYcKPl9aL9h
 56l90Cio3dtnKorroXHPGLSn6uuUGrcJekLVnmvS6looCpXRct6FLE53w/Q40yE/pQNCoqB6vW6
 nHlFKatM/v/m5aldiUYaCc69LNm66CYP3VYKcwfrI3/qaK6pjgfoTs2qE3lkZUlIr4GnzqDCu8Z
 IuxM4o1d/xLmqCSK4wq9PjwWo+7ZVuTzsZaEtL
X-Received: by 2002:a05:6000:4007:b0:439:fdd5:34d with SMTP id
 ffacd0b85a97d-43a04dc07b1mr15268325f8f.43.1773548829178; 
 Sat, 14 Mar 2026 21:27:09 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43a03cfd18fsm20986134f8f.36.2026.03.14.21.27.08
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Mar 2026 21:27:08 -0700 (PDT)
Message-ID: <69b6351c.5d0a0220.339e3f.3da5@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 15 Mar 2026 04:27:08 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773548829; x=1774153629; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=mEn2H6uraDvxniuz84VtSMvK4AGEVCUgQhcZoximhQg=;
 b=hJa6MojSJsubYhh51AlGY0/k+MGu9PC1dvGdP8ZvMFT4bTiDPYuMa2psmoWfV5tGEB
 qQkSSiKQwPUdhiC9xjUxm94IPvmMrPgyMSCm5krA1te2mPNryVWFNEiHm8/LtRzPwOe4
 6cVW1vAmvTV6cz2afFCsShkxVr2xI3mzcP1rXqDSO9LTnUzGdvu5Ka9XBmSAhL1vpUUR
 bPxaVPfHTGK+pfTdHj7/tUEVtN6GgaQ0Jf1bKo+Roi71A8FLeI2058ZSuvBd/gr3tSYp
 tDai3ddy3QTrdX4Z1SOYtBY6A5crff9nIhSXilWDAPKcK62S0TJHD9lWto3lJAetxAwh
 vPhA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hJa6MojS
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-03-14
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

Autobuild statistics for 2026-03-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  7  | 42  |  0  | 49  |
  2025.11.x  |  3  |  9  |  0  | 12  |
    master   | 44  | 116 |  4  | 164 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 8 
                 mdevd-0.1.6.5 | 5 
              skalibs-2.14.3.0 | 5 
                   dante-1.4.4 | 4 
host-gobject-introspection-... | 4 
        ltp-testsuite-20250930 | 4 
       shadowsocks-libev-3.3.5 | 4 
uhttpd-15346de8d3ba42200249... | 4 
glibc-2.43-10-gc3ceb93dc4f6... | 3 
               graphene-1.10.8 | 3 
                  libnfs-6.0.2 | 3 
ustream-ssl-5a81c108d20e247... | 3 
             libgphoto2-2.5.33 | 2 
                libmpeg2-0.5.1 | 2 
     libphidget-2.1.9.20190409 | 2 
                  libva-2.23.0 | 2 
                 libzlib-1.3.2 | 2 
                 linux-headers | 2 
odhcp6c-f19dd37fb467c9cf10c... | 2 
               openscap-1.3.12 | 2 
                 sqlite-3.52.0 | 2 
                 systemd-258.4 | 2 
                apr-util-1.6.3 | 1 
                   atop-2.12.1 | 1 
                bpftool-v7.5.0 | 1 
               bpftrace-0.24.2 | 1 
          cloudflared-2025.8.1 | 1 
              e2fsprogs-1.47.4 | 1 
            erofs-utils-1.8.10 | 1 
                  ffmpeg-6.1.4 | 1 
               freeipmi-1.6.16 | 1 
              fstrcmp-0.7.D001 | 1 
            gdk-pixbuf-2.42.12 | 1 
                  giflib-5.2.2 | 1 
                        gnutls | 1 
  gobject-introspection-1.84.0 | 1 
                   gvfs-1.57.2 | 1 
                 hidapi-0.15.0 | 1 
host-am335x-pru-package-5f3... | 1 
                 host-gdb-14.2 | 1 
          host-mosquitto-2.1.2 | 1 
              host-pahole-1.28 | 1 
              host-rust-1.88.0 | 1 
      host-uboot-tools-2025.10 | 1 
            igd2-for-linux-2.2 | 1 
            igh-ethercat-1.6.8 | 1 
                   iotools-1.8 | 1 
                jemalloc-5.3.0 | 1 
                  kexec-2.0.32 | 1 
leafnode2-9543ffaf82406f943... | 1 
                  libbpf-1.6.2 | 1 
                libcurl-8.19.0 | 1 
libfutils-c326ce0cc2a735438... | 1 
                 libmbus-0.9.0 | 1 
libuci-f3fc0b76040685829191... | 1 
                  linux-6.19.6 | 1 
                linux-firmware | 1 
                    lua-ev-1.5 | 1 
          lua-lunix-20220331-1 | 1 
                     mdadm-4.3 | 1 
                moarvm-2024.12 | 1 
                    olsr-0.9.8 | 1 
               openblas-0.3.31 | 1 
                openswan-3.0.0 | 1 
            optee-client-4.9.0 | 1 
                   perl-5.42.0 | 1 
          powerpc-utils-1.3.11 | 1 
             pptp-linux-1.10.0 | 1 
       sp-oops-extract-0.0.7-1 | 1 
             tpm-tools-1.3.9.1 | 1 
           uboot-tools-2025.10 | 1 
ulog-0389d243352255f6182326... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         apr-util-1.6.3         | NOK | https://autobuild.buildroot.org/results/163ca7b91bd17d1d1c6b5b6a4211ee57ad8c63cb |     
   sparc     |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/bfb03d83db0b06ea53d6a4ceffd5ce3f96da740c |     
  sparc64    |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/039226111650e288e7037539c47d8dd2763cf1fd |     
  aarch64    |        bpftrace-0.24.2         | NOK | https://autobuild.buildroot.org/results/8f2210e34bc70a93edb682af91b6ed8e8e32d889 |     
    arm      |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/97f3fa8fd9767b04bb0ecfce28ebc62441ea1c81 |     
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/1e8df8a47a4aa321eced7b3d929f871a663d225b | ORPH
   x86_64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/065771c6059daf99bed7076ae55263a8d1966349 | ORPH
 microblaze  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/7131a43d28c2f1ed85a77c67583265698f89c9b1 | ORPH
   s390x     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/c6a9d5e7ed526816233c22a70b39b4c597faa401 | ORPH
   xtensa    |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/6430a667177399cc4e7c0271e935368a7446de69 | ORPH
  riscv64    |       erofs-utils-1.8.10       | NOK | https://autobuild.buildroot.org/results/d8388c4ffe601552d474934c263bc861d3aa2df1 |     
    m68k     |          ffmpeg-6.1.4          | NOK | https://autobuild.buildroot.org/results/2cc616842daa21d1f572cfcb7e0e587d7cb3626a |     
 microblaze  |        freeipmi-1.6.16         | NOK | https://autobuild.buildroot.org/results/d168177d38f9fa8ee98fd3be0b04766656b7be00 |     
   armeb     |        fstrcmp-0.7.D001        | NOK | https://autobuild.buildroot.org/results/6821b44cfd9893009da62776505edaa697c2fddf |     
powerpc64le  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/5da0aca5769cbb09c3a74e4303f6c91e6c8a8478 | ORPH
   mips64    |          giflib-5.2.2          | NOK | https://autobuild.buildroot.org/results/093a93cbc67900dbbc1594278468291314fce356 |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/9bc692603d89bcf75afc71ee0f5e42015d31255e |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/b2dcb8c6177d0845b798ca0c874e26195bfa8f1a |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/21b9e46da52d192436a030e101bc1c4c3ba46354 |     
    mips     |             gnutls             | TIM | https://autobuild.buildroot.org/results/92fab97974547e0a9348dc4a66f41ea65f397302 |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/a7c5cf8219ac9d3f7697c054d168c1fea4020f70 | ORPH
  mips64el   |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/153c492719602e02dc6d7905a5729b5e8344416e | ORPH
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/8c1eca42f3c78a50fde815b787d2c7a63efc8319 | ORPH
   armeb     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/bb45b34e0824fa415c3d6041ffa50df69d7f9233 | ORPH
   x86_64    |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/24ff48f90c47c88fe64084cb9f77df4b60a10f8a | ORPH
   mipsel    |         hidapi-0.15.0          | NOK | https://autobuild.buildroot.org/results/a486ece3941e7734993a2a5e727195b10d01586d | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/13111a446d7e7574154d367e30c49a1077144217 |     
   sparc     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/7bf4cf527e5903c4525a50fa07961070ae4ce74f | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/979c6a5e2bff4b0b0ef5d43809d7e3691e8beff0 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8bbdac5603e833ff60b44be061d6943e6caf07b6 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0adae581f2e0aae6180139f1645d43e73553a133 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fdac5445cb81768e6e17bc3462e4c6907fc036cb | ORPH
  sparc64    |      host-mosquitto-2.1.2      | NOK | https://autobuild.buildroot.org/results/320f0f50ba4a41556b740dd6d5be8b1c812765db |     
   sh4eb     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/da8c0307d687d1b2b25b07ca5ddb9735b94c7031 |     
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/d74400fc4aa30e3806c8335208b9b729b4357501 |     
loongarch64  |    host-uboot-tools-2025.10    | NOK | https://autobuild.buildroot.org/results/5e0bbdb60f90efca96d04d6cd11ee113e6fa57cb | ORPH
 microblaze  |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/0b0fb8cb14b3236034e49763c016cffc4b797837 |     
   xtensa    |       igh-ethercat-1.6.8       | NOK | https://autobuild.buildroot.org/results/0ba7163e5012309d3a31aa7186ca95a9d5c8de69 |     
powerpc64le  |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/3c30a19eeec7f424d633050e65364d66bdadf15b |     
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/256556880d4a832349ae9444585d83abbde824f2 |     
  powerpc    |          kexec-2.0.32          | NOK | https://autobuild.buildroot.org/results/e8ace58df3e255a59e76a659d71c6a24677f974f |     
  sparc64    | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/9083c1791f52e9b206d6981c059cc1aeaad638d0 |     
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/ee0de898cfc861b53489b2116584673a3b05ba7f |     
microblazeel |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/d5a895d08a92a61fab73fd594974b8f9c4df659d |     
 microblaze  | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/8c0c90891e997ae6757d1c0b7f463e422a54828f |     
   sparc     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/ca3e9dba7602e471bc383a2658f704c1ed914d51 |     
 microblaze  |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/ba2118c5480888a6f6563f0d7140c627495636b4 |     
   mipsel    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/646cbff1f6089c3fbe4a61a3a7acbaa4d36e3f29 | ORPH
    arm      |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/13ecfd9881fc0338e619eaeaa92f60ab56051d12 | ORPH
  aarch64    |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/91fa7fec1bfb993e55122ef7b12a1be472d48b94 | ORPH
   mips64    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/2031e89674a337ebf03079b255c2a8330fcb58af | ORPH
   mips64    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/f168368ae0288fa82777999d16f3b617e4a22cea | ORPH
 microblaze  |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/23c5b5ca9c28ad66cb44049fb12335e44643bb5c | ORPH
   mips64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/e313dbae49f32cedd005268122a0e2e0c885069d |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/8e85f7847865b5cf3752d176b1ff80a716bafb17 |     
loongarch64  | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/de2c88accdeafd1b2bfd1b752289bbe45b42cb32 |     
  mips64el   |          libva-2.23.0          | NOK | https://autobuild.buildroot.org/results/b7be6a9b990239f6d35e32237dc8b804b662fafe |     
  aarch64    |          libva-2.23.0          | NOK | https://autobuild.buildroot.org/results/3bdabb48b567e62f5b50ccad2ea11fe17a5b1ebc |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/4191fca19b21c6367bf2b8798c371b3f05a57912 | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/fdbafbbcaf0bee65d286e70bfa871a306fbb76b2 | ORPH
    m68k     |          linux-6.19.6          | NOK | https://autobuild.buildroot.org/results/23e2311ec9f1d9fcd4ebb1cc05e9c849b6e8bdc6 | ORPH
  riscv64    |         linux-firmware         | TIM | https://autobuild.buildroot.org/results/db9302e51e163197e13d27f43bb6af29cae223ff |     
   mips64    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/8fd63e8df6eb88cb1a399e76af84eb4fefb6eb5f |     
   mipsel    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/cd4d07892413dc7f38f1e4d4dcc1e23070b5cc82 |     
    i686     |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/16418d6a8522bfcb5f291d1dd3ba91c8b518f902 |     
loongarch64  |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/8503b2d6e146c40389aa66bf5f725aa2409b43dc |     
    mips     |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/14a4bead75dd91d1c9af4f07038028476c249ced |     
   x86_64    |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/0e8582ddab6480b501258c51bee6b8dde3a5063a |     
  aarch64    |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/b56043d64c843ced61fc37edba15983e3d95eac2 |     
   x86_64    |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/7b171a0acc49201df54e476b45a105a4c641054e |     
microblazeel |           mdadm-4.3            | NOK | https://autobuild.buildroot.org/results/2acabb1fd0b68e3ff37796d98abacb764824731b | ORPH
 powerpc64   |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/e048e97151165a10e8f26b545793cb6a0e329042 |     
   mips64    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/1940b6dff70422b703050e367818ac37b73b8106 |     
   mips64    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/cf580b8bce898f45ca09418f75a9b8028221c3ef |     
  mips64el   |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/283aa2d8f484a7e71b11e90279b86a925c8854cb |     
 powerpc64   |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/37d0f2fda20f5f76fc36eae00f8fe605a6256248 |     
   mips64    |         moarvm-2024.12         | NOK | https://autobuild.buildroot.org/results/a73bf0f6826976af72f7807eebe39eb638d333ce |     
 microblaze  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/968a5f01decca34784296e1e9af2d0c0bb21fc99 |     
   x86_64    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/2d996c88c936fc0c57857637c427669bdb579b32 |     
  aarch64    |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/dab8a66abcb4d020d19672bd57bfc01d2da43862 | ORPH
  mips64el   |        openblas-0.3.31         | NOK | https://autobuild.buildroot.org/results/050cf82f4318dca4ba64776dc613f0d3065db2cf |     
    mips     |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/c0f521e4548a9e0833eb8c5843ee8c1529654de8 |     
   armeb     |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/71d841636456985c969bcfa3091085932089b297 |     
 microblaze  |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/a023b7b07cf7456449f2ed09269227a84e743459 | ORPH
    arc      |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/0c41df03ee6a4f610826443ebdccf7c470c4b274 |     
  aarch64    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/8e0511cc03c73e20eeaddaba15d766b88a55e883 |     
 powerpc64   |      powerpc-utils-1.3.11      | NOK | https://autobuild.buildroot.org/results/3636e2a5832b26351e1f0681b039b621b91024f2 | ORPH
  sparc64    |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/49dc445a2729834aca46d7e5a4b2acb729e3fa38 | ORPH
   s390x     |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/fd2bfd23f6862c24c18902f76d6ad81d2e4138b0 | ORPH
    mips     |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/7961c855806da093b5f21d8bd2873dc3b3047495 | ORPH
  aarch64    |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/794a7a286cb358d91d31aba89b821fb64aa26030 | ORPH
    mips     |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/791f6e218156edfb7ed88f7eb2769dede8a101b4 | ORPH
   sh4aeb    |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/0722fbfc2b7bd3b33670287c18a1113dd8b72179 |     
  powerpc    |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/e1fe90843dc8ceaa2fdf6303f3d3bacc2c651dc9 |     
  powerpc    |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/763f101fa858aed2b4f4e3b81057938902b9c12b |     
   armeb     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/e061828b940bfc9728549efd0bb17b89a8879f55 |     
  sparc64    |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/4e7974c13523b9499f6dff5516d90bbf1dc68073 |     
   mipsel    |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/16cc2dfffe92f3a19afd5d513b395eb25c639768 |     
    m68k     |         sqlite-3.52.0          | NOK | https://autobuild.buildroot.org/results/6ceae4f4bee87d60f8ae7e4b610743c9b44cd4d8 |     
  riscv32    |         sqlite-3.52.0          | NOK | https://autobuild.buildroot.org/results/e496fc01331b1068a4955b8d0a629979cca87b60 |     
   sh4aeb    |         systemd-258.4          | NOK | https://autobuild.buildroot.org/results/8f83d379db50d8fe5edcdb8e3feb3ba75520f564 |     
 aarch64_be  |         systemd-258.4          | NOK | https://autobuild.buildroot.org/results/d6c19ade369665424e8484bdde9a834372a621a6 |     
   mipsel    |       tpm-tools-1.3.9.1        | NOK | https://autobuild.buildroot.org/results/ee176c910b3bd4f28aa0d27d394b5045238dd9e2 |     
   mips64    |      uboot-tools-2025.10       | NOK | https://autobuild.buildroot.org/results/1487a90af7859773f0830b333aab0023f8ac8644 | ORPH
   armeb     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/72fbe330f4b3bae24c91900fb3a9b7ad3b86ab3d | ORPH
  mips64el   | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/b61702811699fb55cd38a14e84a4c0b493b81254 | ORPH
    or1k     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/f91e0229d1a93bdb8160e18ae7aa868f2ea46653 | ORPH
    arm      | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/516dbebb9583ce601a25719383b7f0feadfe868b | ORPH
 microblaze  | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/f8d3d9f0239c212f446fe7257af94601000f4fd8 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/f95f2d5251df21d64922df3e2e5ee3bfb5fa5e8d |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/668b0b24a6ea62e6af91c61fba624a2bf88f6b4f |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/40e7c2bbec7ffd46da47c993e64356969fa6cda9 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/c1fc30a1c03a75b953e1bde077c40b5b24afe165 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/c37d395d8bbb75cea0c7c8699bbd44229ba085a0 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/bbed893cb0131e6e07b23d8593db2a124b50f81a |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/744dc2aa1036cbb62427c425c2b110cc41bfb3e1 |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/9aea90feb9802e04647f7c701ca5926a8896ecf4 |     
   armeb     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/22e7f58327b7dc8c92e4eb278f580b5cb6423ce5 | ORPH
   armeb     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/83ea80efce357b9e02f640b72c15903301ae5324 | ORPH
    m68k     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/b85fe4672d7d09f8318cf1f222cfb087c806c923 | ORPH


Classification of failures by reason for 2025.11.x
--------------------------------------------------

       host-libunistring-1.4.1 | 2 
          host-faketime-0.9.12 | 1 
leafnode2-9543ffaf82406f943... | 1 
             libgphoto2-2.5.33 | 1 
                 libmbus-0.9.0 | 1 
                libxml2-2.15.1 | 1 
                openocd-0.12.0 | 1 
                   perl-5.40.3 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      host-faketime-0.9.12      | NOK | https://autobuild.buildroot.org/results/ca95505560c271f8f790bbc95aa9e6805ee1e422 | ORPH
  mips64el   |    host-libunistring-1.4.1     | NOK | https://autobuild.buildroot.org/results/416b2fb55fee0f03cd950a99263ed82cb0f38868 |     
 microblaze  |    host-libunistring-1.4.1     | NOK | https://autobuild.buildroot.org/results/e5aed4bc4a46867dd11199b746ff865d0736d585 |     
loongarch64  | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/2e4dd1940fe72fb6b3fe9ac4067196ac8d519145 |     
  mips64el   |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/31ba7f6e8373bfdb46a532e7a5634220f323a8f3 |     
   sh4aeb    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/186d7e27cfef5c02ac339ea43fb46a6c7a37f380 | ORPH
   sparc     |         libxml2-2.15.1         | NOK | https://autobuild.buildroot.org/results/75ea39fa26a56d1abb9c398987dd3e7e04dd5ba8 |     
microblazeel |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/5e898bfbb3f1b2cee83ecccbf3c445f7b4babc75 | ORPH
 microblaze  |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/bfe568f707d9acd545dc227ad1011d5fb4b6b936 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

          host-faketime-0.9.10 | 4 
                       unknown | 4 
                host-odb-2.4.0 | 3 
              host-pahole-1.27 | 3 
  gobject-introspection-1.82.0 | 2 
                 host-gdb-14.2 | 2 
package/linux-headers/linux... | 2 
       sp-oops-extract-0.0.7-1 | 2 
                  boinc-7.20.2 | 1 
                bpftool-v7.1.0 | 1 
                freerdp-2.11.8 | 1 
            gdk-pixbuf-2.42.12 | 1 
                 gerbera-2.4.1 | 1 
          host-binutils-2.43.1 | 1 
host-binutils-arc-2023.09-r... | 1 
           host-libtpms-0.10.1 | 1 
host-vboot-utils-4b12d392e5... | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
leafnode2-9543ffaf82406f943... | 1 
               libdvbcsa-1.1.0 | 1 
                 libmbus-0.9.0 | 1 
                 libwpe-1.16.3 | 1 
        ltp-testsuite-20250130 | 1 
             netsniff-ng-0.6.8 | 1 
                   perl-5.40.3 | 1 
                pipewire-1.2.8 | 1 
python-remi-2022.7.27-37-g1... | 1 
           sane-backends-1.1.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          boinc-7.20.2          | NOK | https://autobuild.buildroot.org/results/ab75f3cffab594e8669f51372ac4b2db4796988b |     
  riscv32    |         bpftool-v7.1.0         | NOK | https://autobuild.buildroot.org/results/7c37c8cff64bd58823513e2ed9a16a8f988ec0d3 |     
  sparc64    |         freerdp-2.11.8         | NOK | https://autobuild.buildroot.org/results/9bb715fcebcf304078a849894ce9c66f7cdef153 | ORPH
  mips64el   |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/d48df041ab15282665ce7d3d3e2f8b773e3edaa0 | ORPH
 microblaze  |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/ef6818830c92c711107e6636e9875b093730c3a3 |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/81887a91ba715b316a4dcf4ca5a50209c657ff27 | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/2f043a7d4c8ef777993524f7dbd9ba30cf708658 | ORPH
  aarch64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/099387e0425e2df3d07b113c42243d091aed575c |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/402843ddd3626a3e66f890f9f954042805bf3359 |     
 microblaze  |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/b3534c8ae18d00c4be0a146d88d22d146abc8563 | ORPH
    arc      |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/ff19602bc98bb02d7fa78d987bf18972f75c051c | ORPH
 aarch64_be  |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/a398f5feb62c368e4d4c44b5260df413ef0509ac | ORPH
   sparc     |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/560e039708d8650e626342ef37e7ae5ecf77881a | ORPH
    arm      |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/9267409d13d1fb2fb6726659bfa778f8086f9217 | ORPH
powerpc64le  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/ff1a072fdae854f377bf57b4e7dffa28fb12e30a | ORPH
   armeb     |      host-libtpms-0.10.1       | NOK | https://autobuild.buildroot.org/results/252b7f157fac9044f877e9244e8c27b543f05526 |     
microblazeel |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/2a153bfd795c68000a04345beef5e399dc3c9159 | ORPH
   mips64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/81d0f73114af24f13e4d35dc5a995aaaecb5777d | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/fb3d60e02c5da8060da03517310ea2cefc2c8504 | ORPH
   s390x     |        host-pahole-1.27        | NOK | https://autobuild.buildroot.org/results/444a48f048710ac1fe91458b6fddf245c8d20457 |     
    arm      |        host-pahole-1.27        | NOK | https://autobuild.buildroot.org/results/1d16c3e5f09efa9acff72a59ba0ffcdd4d8f4db9 |     
microblazeel |        host-pahole-1.27        | NOK | https://autobuild.buildroot.org/results/51b74044aed4db32e92bf9ff4f41e51de26360fa |     
   x86_64    | host-vboot-utils-4b12d392e5... | NOK | https://autobuild.buildroot.org/results/1624b6c987fee7606128772ecf24c3e5684b3bf8 |     
    mips     | kvmtool-4d2c017f41533b0e51e... | NOK | https://autobuild.buildroot.org/results/df8ed30dedcd4a81df7e57e6356514c1dde528d9 | ORPH
   s390x     | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/5cf48e8137918f31df0025f3693d21dfc2cec205 |     
   x86_64    |        libdvbcsa-1.1.0         | NOK | https://autobuild.buildroot.org/results/674a104c09d6f49be76e2cc79ec42810066c884a |     
 aarch64_be  |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/363cc9d31368e988f7960805c0fcb831b3bdd053 | ORPH
powerpc64le  |         libwpe-1.16.3          | NOK | https://autobuild.buildroot.org/results/cbf62751732ad6aedddd8b85b72d8e2086a3549c |     
   mipsel    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/0ff7c308201be118f6ab2ef1e5aa622e599289a2 |     
  sparc64    |       netsniff-ng-0.6.8        | NOK | https://autobuild.buildroot.org/results/834b8e978a0942cd7931b5c691695969b6ec0c89 |     
 aarch64_be  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/eda758fa5c5bcbd86291579389c1ace65eb15d81 |     
 microblaze  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/52d31df513d2ec177d391b5cd3920df762f04ee0 |     
   mips64    |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/022316a656dfe215f8a0ee1690c6d2ee8909cbfb |     
  mips64el   |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/45e196b9606aa3ab5a1803f3a73a106dc03070b3 |     
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/f1740117bbc0d959e17bdce499df7f0430bf1fb2 |     
   sh4eb     |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/4323be174c951d1d043774024ab76a5519181a16 |     
  mips64el   |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/f0ea99825d7a37ae23bdd2fa1a191381bfe1360a |     
 microblaze  |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/6acd33c5d0477af2bbf05716cb3a75006f19d50b |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/2e6fab59e9bb4734877df99ff1871786ebdca829 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/57970b0e54121e551ca8766bb333061029ed8080 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/063dd679fd3edeaebf22c80f97f99c84b1dba482 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/8cbc0e7aaafe06a3d2b9be431d879d191dcfbda5 |     


Gitlab CI results for 2026-03-14
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_aria_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/13458392408 |      
       acmesystems_aria_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/13458392412 |      
    acmesystems_arietta_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/13458392417 |      
    acmesystems_arietta_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/13458392423 |      
                   andes_ae350_45 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13458392439 |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13458392447 |      
             asus_tinker-s_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13458392492 |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/13458392501 |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/13458392507 |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/13458392517 |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/13458392528 |      
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13458392565 |      
                 bananapi_m2_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/13458392593 |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13458392600 |      
                        coolpi_4b | https://gitlab.com/buildroot.org/buildroot/-/jobs/13458392643 | ORPH 
                engicam_px30_core | https://gitlab.com/buildroot.org/buildroot/-/jobs/13458392649 |      
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/13458392712 |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/13458392713 |      
                 hifive_unleashed | https://gitlab.com/buildroot.org/buildroot/-/jobs/13458392724 |      
                 hifive_unmatched | https://gitlab.com/buildroot.org/buildroot/-/jobs/13458392726 | ORPH 
               icnova-a20-adb4006 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13458392729 |      
                       imx8mm-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/13458392759 | ORPH 
                  imx8mn-ddr4-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/13458392765 | ORPH 
                       imx8mp-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/13476921637 | ORPH 
                        imx93-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/13476921908 | ORPH 
                    imxrt1050-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/13476922027 |      
               iot-gate-imx8_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/13476922237 |      
                kontron_bl_imx8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/13476922531 |      
              kontron_smarc_sal28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13476922591 |      
               linksprite_pcduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/13476922837 |      
                            nezha | https://gitlab.com/buildroot.org/buildroot/-/jobs/13476925235 |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/13476925705 |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/13476925854 |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/13476925901 |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/13476926014 |      
                    openblocks_a6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13476927418 |      
                  orangepi_5_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/13476927478 |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/13476927633 |      
                     orangepi_one | https://gitlab.com/buildroot.org/buildroot/-/jobs/13476927733 |      
                      orangepi_pc | https://gitlab.com/buildroot.org/buildroot/-/jobs/13476927991 |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13476927934 |      
                 orangepi_pc_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/13476928043 |      
                      orangepi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13476928132 |      
                    orangepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/13476928833 |      
                  orangepi_zero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/13476928470 |      
                   orangepi_zero3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13476928572 |      
               orangepi_zero_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/13476929183 |      
              orangepi_zero_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13476929024 |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13476929475 |      
                  pine64_pinecube | https://gitlab.com/buildroot.org/buildroot/-/jobs/13476929483 |      
            polyhex_debix_model_a | https://gitlab.com/buildroot.org/buildroot/-/jobs/13476929797 | ORPH 
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13492838038 |      
                           rock5b | https://gitlab.com/buildroot.org/buildroot/-/jobs/13492843606 |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/13492852552 |      
                 sipeed_lichee_rv | https://gitlab.com/buildroot.org/buildroot/-/jobs/13492857237 |      
            sipeed_lichee_rv_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/13492859445 |      
               sipeed_licheepi_4a | https://gitlab.com/buildroot.org/buildroot/-/jobs/13492861189 |      
             sipeed_licheepi_nano | https://gitlab.com/buildroot.org/buildroot/-/jobs/13492862771 |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/13492864092 |      
                     ti_am62ax_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/13492886674 |      
                     ti_am62px_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/13492887058 |      
                      ti_am64x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/13492887779 |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13492887948 | ORPH 
                           ts5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13492888199 |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13492889586 |      
                zynqmp_kria_kd240 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13492891215 |      
                zynqmp_kria_kr260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13492891306 |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13492891348 |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13492891487 |      
                    zynqmp_zcu104 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13492891623 |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13492891794 |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
