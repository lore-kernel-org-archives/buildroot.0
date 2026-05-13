Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF10CD343F
	for <buildroot@archiver.kernel.org>; Wed, 13 May 2026 03:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 665A440AE5;
	Wed, 13 May 2026 03:19:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6-lPL5WHowW4; Wed, 13 May 2026 03:18:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E374840857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778642339;
	bh=sVXpSF1M8os2OYcTOmj1vV90odGNKmWH/jTK9CwzOLk=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YdUWHM4gy+AAv65FXUwo3eDjHXAiE5dJPiZEkpEHY+ljM5fuK2I929qwEz8FuJgkm
	 AcDtAtDGC8N6Aj7hvZCOYvTY5oCnIpYlJGtpnGwXkeR7R7IfglGCUo8RBupJq6jreG
	 Eduq+iu/B1enLA7+ItJW09ihkPcvi/e6MvDdmQwmpcq3uUFF8tWgtFa69t16OoA97H
	 IHi3cWk1VokGap0U7RT6SH8J2rc/WFAuHuypCGOFg3vRaTOJTGtv26KHs5LEy3nZsc
	 +ce23tdXV1KRshYEhufWFZ7+llFCP1o/SrCB1ype/lIZ5VtR4NLwUJ7i+UZPzLnOMW
	 Uu7DsEbNwgdCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E374840857;
	Wed, 13 May 2026 03:18:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D46CC223
 for <buildroot@buildroot.org>; Wed, 13 May 2026 03:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA3C54078C
 for <buildroot@buildroot.org>; Wed, 13 May 2026 03:18:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5dCAkmvQOnrH for <buildroot@buildroot.org>;
 Wed, 13 May 2026 03:18:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D48EF40094
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D48EF40094
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D48EF40094
 for <buildroot@buildroot.org>; Wed, 13 May 2026 03:18:55 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4891e86fabeso71259295e9.1
 for <buildroot@buildroot.org>; Tue, 12 May 2026 20:18:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778642334; x=1779247134;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UguTWmQjqlozKlXLxQIS9RG66yg7jrO+qXB/9S1R2Ts=;
 b=jnTjZBFWzpuu48WPTYDgxxNJTL5NgPDRiHBbQolAEe99znnKt7qvvLrEVGaCPpXm6a
 DGIgH+3b8ckQDCMfSfdk/Hohc+QIdIH/W5luUdGpVwQbO9OQuIXc71KM0JG9UVmZVPay
 T4Sks28ex9DgHSoT4GQqNXM5U24uSUqDdSJ+auKe5nNTwv12e3uFzF1QKsnhzXucpUhN
 AaIZf3/7c9UwUE8BVyhkxiXgw8p/KNlfgOnIu4NlsYdD7RRvMvxnuPkctirTOCCouikX
 htTIZPnE7tf5W9HYjGtXojMg6gSTmsfC0bct6Bfhv5lF6iLHaE5OxQlLwtnbkFSfCOpA
 WgNA==
X-Gm-Message-State: AOJu0Yxepln7+jd1Wo0Ys5ravtXCGDeoMWKCtqM3JOUvlhkAZbZO//bB
 VB/ORwmLiqIwY6beNgpaTQARyLcrR8erT8TsFfVjEDrO1KWRo34ecGaesBxFJZwd
X-Gm-Gg: Acq92OFN8NCG+L18wHS4DNAymnvp8KH/+6K41QzqEhd+WMKsdyrADJj+WXjY0GTzkZo
 VQQwwjWOGkb9mSBX2ElDCA5ew99hv51kZeGH4tQ5QTLHA4CYeiCwoN4K0d0XIDwmLdWVeo1JuPA
 kC6st18mhlrs/6EUADcCHRerTs2fN8WCedzM+YGSHselsJlbvpPYlUqn9teLrbmH6AzZh6vuEF+
 7hYWJYaLdQ540H5HARFhh+A30m90OtYJIVb/m9QMdXcsa5qTu6j03tdPd0yKHmgGAxlYLnEgx7F
 DPLiY2xmALbetIcA1Dnt/ob4xE8fcHHgiViYG9KuUMPtq45+qSeszpsQVF2RYfnDkp5TaoTrtpt
 07ifmaOaTAl9YOI2+ex/xufUwrq020E9TMvNhYaQ359fUoxQJSKyUJkjErVFUVwlgJWOgZp1zK+
 UMnsN4AfBVsbxB++4MYEvf1iYZ0WzJnw==
X-Received: by 2002:a05:600c:6309:b0:48e:8dec:19ad with SMTP id
 5b1f17b1804b1-48fce9b7e4fmr9540675e9.12.1778642333382; 
 Tue, 12 May 2026 20:18:53 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fc8d1f669sm43094215e9.4.2026.05.12.20.18.53
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 20:18:53 -0700 (PDT)
Message-ID: <6a03ed9d.97b0ce82.c4330.597a@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 13 May 2026 03:18:53 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778642334; x=1779247134; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=UguTWmQjqlozKlXLxQIS9RG66yg7jrO+qXB/9S1R2Ts=;
 b=lqXllIFCSgF99d81qd+oywUoZ8KxHH/UEcs4xqUA76eIQoR1M0eNMNettP5m0GGRlt
 PhAhlPgLsw6TLZHkGVqQ9HV5BNKzYZFjRvCdBrETcykoioG1OCdb8F+K/tcsNbMGBB9A
 VqlvPcwP7abqkpFHVd7PFy4arkV72foN6TDQOWkBja36Yw7hx2PRjXb3PP+65uxKg9JE
 2J4OHrRLOOHceGxclCnXMD9CtCnmXZn6dPgBS2CG/LIkYgsfrLI/8hsFpAyw/PtMeABt
 WTeo7K5YZE2tjr2GSNEFqIpTD0mbgsDBjvqU5vKkSMxCRmE5jYw2O9Gfs0+8EwmzCmFP
 mG9w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=lqXllIFC
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-05-12
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

Autobuild statistics for 2026-05-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 14  | 21  |  0  | 35  |
  2026.02.x  |  9  |  5  |  0  | 14  |
    master   | 45  | 99  |  0  | 144 |

Classification of failures by reason for master
-----------------------------------------------

odhcp6c-f19dd37fb467c9cf10c... | 7 
                       unknown | 6 
                  libnfs-6.0.2 | 3 
                libnss-3.123.1 | 3 
                   linux-7.0.6 | 3 
               linux-pam-1.7.2 | 3 
             dahdi-linux-3.3.0 | 2 
firmware-utils-c42a3bc53da8... | 2 
glibc-2.43-27-g4070d808bea1... | 2 
    host-mender-artifact-4.2.0 | 2 
                  libbpf-1.6.2 | 2 
           libmicrohttpd-1.0.5 | 2 
              libopenssl-3.6.2 | 2 
                 libzlib-1.3.2 | 2 
                       mrp-1.2 | 2 
      shadowsocks-libev-v3.3.6 | 2 
               trousers-0.3.15 | 2 
ustream-ssl-5a81c108d20e247... | 2 
             util-linux-2.41.4 | 2 
               binutils-2.46.0 | 1 
                  cairo-1.18.4 | 1 
           crucible-2025.05.28 | 1 
                   dante-1.4.4 | 1 
                enscript-1.6.6 | 1 
                    frr-10.5.3 | 1 
                 gnupg2-2.5.19 | 1 
                 gnuplot-6.0.4 | 1 
  gobject-introspection-1.84.0 | 1 
               gst1-imx-0.13.1 | 1 
host-am335x-pru-package-5f3... | 1 
                 host-gdb-15.2 | 1 
            host-mfgtools-0.02 | 1 
              host-rust-1.95.0 | 1 
          host-xfsprogs-6.19.0 | 1 
                  iozone-3.508 | 1 
                iproute2-7.0.0 | 1 
                  jack2-1.9.22 | 1 
            jpeg-turbo-3.1.4.1 | 1 
                     kbd-2.9.0 | 1 
                  kexec-2.0.32 | 1 
libdill-32d0e8b733416208e04... | 1 
libfutils-c326ce0cc2a735438... | 1 
              libsecret-0.20.5 | 1 
           libzenoh-pico-1.2.1 | 1 
        ltp-testsuite-20260130 | 1 
                  ltrace-0.8.1 | 1 
            lua-sdl2-2.0.5-6.0 | 1 
            minizip-zlib-1.3.1 | 1 
                    olsr-0.9.8 | 1 
                openntpd-6.8p1 | 1 
                openssh-10.3p1 | 1 
             parsec-tool-0.7.0 | 1 
      passt-2025_06_11.0293c6f | 1 
                   perl-5.42.2 | 1 
phidgetwebservice-2.1.9.201... | 1 
            python-iwlib-1.7.0 | 1 
                s6-dns-2.4.0.0 | 1 
        s6-linux-utils-2.6.2.1 | 1 
                 s6-rc-0.5.5.0 | 1 
                     shim-16.1 | 1 
                 sqlite-3.53.1 | 1 
              tailscale-1.78.1 | 1 
                 tbtools-0.8.0 | 1 
           uboot-tools-2026.04 | 1 
uclibc-ng-test-132c6134d691... | 1 
          usb_modeswitch-2.6.2 | 1 
               valgrind-3.26.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        binutils-2.46.0         | NOK | https://autobuild.buildroot.org/results/4ea3f67c2496146419c6e0ab40afce13c591cb5d |     
    arm      |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/25f55c09785b8e8531fa7d07d9c24bbc26ffd9a0 |     
powerpc64le  |      crucible-2025.05.28       | NOK | https://autobuild.buildroot.org/results/e8b32b5b52cad59a03add17b0cf6d336537a1025 |     
   armeb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/329096ea4f9fadfc905c5c283edd54ede1172e5e | ORPH
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/85983e048b8dfb297d893723865c0c7fef4e0132 | ORPH
  aarch64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/af548e4a933cb64cc420946fe0926ce208045b0c | ORPH
 microblaze  |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/d19d3ce84fb495f6677e100e4bb4731f02b07a92 | ORPH
  mips64el   | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/a6a8a4ac6b034f766670ad6bcdfb042b97f93488 |     
    arc      | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/c28e11568910e0edab5b25166be403ea3d788bbf |     
   xtensa    |           frr-10.5.3           | NOK | https://autobuild.buildroot.org/results/31b39bd4fca21e4ebce64f7790a092bafd3465a9 |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/ba7db49f235ce5f63f7c543f156c0b5c19b41ecb |     
  mips64el   | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/250eb9f184a4ce8d856d6f8312f944010b9d4d0e |     
    or1k     |         gnupg2-2.5.19          | NOK | https://autobuild.buildroot.org/results/53085a6b7d404c4ee9444f70f1feee59386b2ac3 |     
    m68k     |         gnuplot-6.0.4          | NOK | https://autobuild.buildroot.org/results/ea83be2e0af66279e8cb3010081ea44b1b5f7660 |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/010e5f503ee4df3f195b5a9ad91bd11785082dca | ORPH
    arm      |        gst1-imx-0.13.1         | NOK | https://autobuild.buildroot.org/results/92b679031ce444abe9e588105e218ea78920abfa |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/e30baca0199f7e6c328d3923b1c18f413c0e866e |     
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/27d89db78a67ece9f7e11df42420c98458db52de | ORPH
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/24199d179f764b1fc7fdc0d07fd1047afe2fecbb |     
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/ef6b33edec9b88ff64b9c5ace66414862eba9c34 |     
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/a24ad4e4d933dc01eead852f987a13e718ffa1c7 |     
   x86_64    |        host-rust-1.95.0        | NOK | https://autobuild.buildroot.org/results/54f9131d5ca936dcf5ca67fabd546d61250931f0 |     
   mips64    |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/72279651f4d73fa6ce4e1df338ff5b639a1c37f9 | ORPH
    arm      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/5d7a102274eeb7a996c3b487fcfee08d7097778a |     
    arc      |         iproute2-7.0.0         | NOK | https://autobuild.buildroot.org/results/e9ad77954f5126307a3571a573fe1aaacb08bbbf |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/49c34ba000455f62cb6585539afd82220b2755fe |     
 aarch64_be  |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/09be43cf98667fce43a934904ec5bf6cf0d044e2 |     
  mips64el   |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/23253eec9b12475d1103cc3ab5c048103a28bf0c | ORPH
  powerpc    |          kexec-2.0.32          | NOK | https://autobuild.buildroot.org/results/53bafc454533aeafc21116a99d87391b3049e12a |     
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/8d9b83f2ae12d2c9987119b398df1bc93ef19e69 |     
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/9b92463ddd041d098b1a5cb579df0cee79e04937 |     
  aarch64    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/ff959aa9145d0208b6132698cac013298beeb144 |     
    arm      | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/f9056410e9c9a7eb6512b5408013b27f90a9e93f |     
   x86_64    |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/4b4f3fd516b35f02efa675896c24961034b97394 |     
powerpc64le  |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/4a015e900ed4d6bb4cca6adde09402cfb1b4ed82 |     
   mips64    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/b8385e9ae8b1ffc190170b9c2911e42cae5b98f9 | ORPH
   armeb     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/243bc40a166a34cc029726f144ffe64a43918974 | ORPH
  sparc64    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/fd7ab2902255214a260f217e8f1119b80d6d8ec6 | ORPH
 powerpc64   |         libnss-3.123.1         | NOK | https://autobuild.buildroot.org/results/e89e1b8598abfeb13b3dcf0b06eed898265b2dae |     
   armeb     |         libnss-3.123.1         | NOK | https://autobuild.buildroot.org/results/e4bba2e1017acc2c967aa748ff6f09020fd6818b |     
 aarch64_be  |         libnss-3.123.1         | NOK | https://autobuild.buildroot.org/results/b3742e66c6dee985c3b51eac3046f87ad3740e23 |     
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/bbf4b73ce22aa00ee3f5b46138056d602b6e1146 | ORPH
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/15266607226f12ce6f5425df0bd8f46bdc810ce7 | ORPH
   s390x     |        libsecret-0.20.5        | NOK | https://autobuild.buildroot.org/results/d893ee458e23f716d7407bbb0db76c8b7e06477d | ORPH
  mips64el   |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/c699d7f2e78c36c9ad0e39de9b995a7fc8faf362 |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/59bb162f534b9adf36168665ae604e4e88fa3ad7 | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/f4c72736e9dc425532071911874ad2482ebabebe | ORPH
loongarch64  |          linux-7.0.6           | NOK | https://autobuild.buildroot.org/results/c35d5aca224cab379bebb8176470ca5a94085408 | ORPH
  powerpc    |          linux-7.0.6           | NOK | https://autobuild.buildroot.org/results/bfa38ff3d502791aa03de94ad83832eb104ba486 | ORPH
    i686     |          linux-7.0.6           | NOK | https://autobuild.buildroot.org/results/3c3d9b0243859425a802e5a957ce3d6f8c4303e1 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/f7bcdb130cdb1cdf5f81ea1e7777c4deefc7fbd5 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/b95af8f2091783aff77ead278ea7c9fe2c08b16e | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/19c4ccbe3fbb330913f9a7cd864a8462bba6b0bf | ORPH
   xtensa    |     ltp-testsuite-20260130     | NOK | https://autobuild.buildroot.org/results/c7bffb645c04b141626ce988990ec6f2db5ebdca |     
   sparc     |          ltrace-0.8.1          | NOK | https://autobuild.buildroot.org/results/052dcdd7e64ed1bb4543dd898a71ba52b5863c46 | ORPH
 aarch64_be  |       lua-sdl2-2.0.5-6.0       | NOK | https://autobuild.buildroot.org/results/811f6b23e29d8deaf84d1e367ac93e1789f9fb0f |     
  mips64el   |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/4142eca902dcad01877d806038d883a5a8cc7cd5 |     
    i686     |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/65dc94f9de9f61a26516da1b233b16d1e3503412 |     
 aarch64_be  |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/900352c3ec2b428dfc8d81faeec6851d96601e1a |     
   s390x     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/04cfc6edba70d1e304f9979336eea75404195ca7 |     
   mips64    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/3c0a9f49aead00aa87a3d169b23ddef6ba9b4987 |     
   mips64    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/dac6baaadff54bcbddc2549d7ae129e5bb42e0bf |     
  powerpc    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/836b042aa3c4dea28f4ce0f38824d830be2e1fc0 |     
powerpc64le  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/5dff0f2aa61aae9ba02411c37ee01bf8068a8967 |     
   mips64    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/801649a1f3d7c0fa28936e623b5d0cbff2550aed |     
  sparc64    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/a011ab1a7129c4c8dd00393cf41d10aff360572b |     
powerpc64le  |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/7aab798af0d09117c77e146026b7ce4fd215b3d0 | ORPH
    or1k     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/d2c5bc45beb54a1b1f3f567daebd926c6a207590 | ORPH
   mips64    |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/d0c8ba73a5061112ab795e15309d20b7475881d6 | ORPH
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/ec2e4962cb5ba050ba0e93235c4151048da54e93 |     
microblazeel |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/7c6a9841850b778e7aaa94df3469aa5944c33039 | ORPH
  powerpc    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/7a58df32a70a003bc522a60ca49cace90e56e747 |     
  mips64el   | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/257fb637331d848dc36b374f9b10129cfdc4d438 |     
   s390x     |       python-iwlib-1.7.0       | NOK | https://autobuild.buildroot.org/results/2f1a9a05e2841e8569f80fdf7dbf42ff8d107035 |     
loongarch64  |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/6fdcd4b622c377b92dc1328b9c4240b360ea667c |     
   xtensa    |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/e5e291023a59b150fd43d4d85a52654578164f50 |     
microblazeel |         s6-rc-0.5.5.0          | NOK | https://autobuild.buildroot.org/results/3a4e7f74e0e0b1efd30b12cb5cca9605047767ec |     
    hppa     |    shadowsocks-libev-v3.3.6    | NOK | https://autobuild.buildroot.org/results/067108c0d170944da48b4da27752109b2e501027 | ORPH
  powerpc    |    shadowsocks-libev-v3.3.6    | NOK | https://autobuild.buildroot.org/results/0e210aac0fd80b2c6ae828af67d00f0f2d1c080c | ORPH
  aarch64    |           shim-16.1            | NOK | https://autobuild.buildroot.org/results/baef1846b2fd91195085095c36966296b8821bd4 |     
    m68k     |         sqlite-3.53.1          | NOK | https://autobuild.buildroot.org/results/0d917a6ffa842b95928d4250eccc412ef218e3ff |     
   mips64    |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/28113c6ca843a46e18ee99721b57e6921d70c1dc |     
  sparc64    |         tbtools-0.8.0          | NOK | https://autobuild.buildroot.org/results/367bdf76b05f10c3f213ac925b0fad963bc8a113 |     
   sparc     |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/316d70b5edd3632002fd2ca9532ee3eb973a1662 |     
   xtensa    |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/98dc996a438613a670e22371e30569c8e2a23f80 |     
  mips64el   |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/29a41898860711c3df65f08371c3887db5e3c530 | ORPH
    arm      | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/e9ad24601ba03b0fba2ab225cb3eb638e0881cf4 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/56abaa850a8560be6af157d79cd7ce6f31f720b1 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/bbbe17897b4fe1a4fba5dbfaef6dffde4611155a |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/474f199368035dc512e5ed95ecd914ac5aa6dbca |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/39af39830b612a33bab67f450634353d3db04ecf |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/e406c8bb4197d60bea080cb5aaa3f7768e294a55 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/8a9120a084e8bfc0a380339144306bf58ce7b75b |     
   sparc     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/643ca9e4f54ac34137a4ed4cd5a7bbb08183c2d2 | ORPH
 powerpc64   | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/4c52a96423c370e1cf8ee9ec41b1f7a351d68375 | ORPH
    or1k     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/e98fbc210f80a623d20371592eadf22ac2312a7c | ORPH
powerpc64le  |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/8cef1d101713d55a14508ee2783419438af639d9 |     
  riscv64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/31cfe92100262b43d868565a1ffcc038a75c9db2 |     
  mips64el   |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/7c63ce74230642b0d64e3f8f67ef0884ab55979a | ORPH


Classification of failures by reason for 2026.02.x
--------------------------------------------------

              fftw-quad-3.3.10 | 1 
glibc-2.42-51-gcbf39c26b258... | 1 
                  janet-1.40.1 | 1 
                  libsepol-3.9 | 1 
                openswan-3.0.0 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/11516dbffd97b4662080c685f53ca1923386f06b | ORPH
   x86_64    | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/467a9dd37fa008cc6a8aa6f67dc933fafc50b585 |     
   xtensa    |          janet-1.40.1          | NOK | https://autobuild.buildroot.org/results/5cb668387421a0eb8af6f0a807da537af8a82984 |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/e50bfacf2fbb186f3b5a470c6d1b5504de769ab3 |     
   armeb     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/98ec62d30363304e18f266a809e7d5c565c872d4 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

              containerd-2.0.7 | 2 
  gobject-introspection-1.82.0 | 2 
 host-softether-4.30-9700-beta | 2 
                  iozone-3.508 | 2 
                 apitrace-10.0 | 1 
                 coreutils-9.5 | 1 
                   dante-1.4.4 | 1 
                 gerbera-2.4.1 | 1 
        host-python-lxml-5.3.0 | 1 
    host-xlib_libxkbfile-1.1.2 | 1 
                 libzlib-1.3.2 | 1 
        ltp-testsuite-20250130 | 1 
                moarvm-2024.12 | 1 
                  octave-9.3.0 | 1 
                 openssh-9.9p2 | 1 
package/linux-headers/linux... | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/9bdd8578a6d25b20acfe0c0ef094ff5023277650 |     
   x86_64    |        containerd-2.0.7        | NOK | https://autobuild.buildroot.org/results/154be8d3e9e46c2ef29892f73303aaea67be05b6 |     
    i686     |        containerd-2.0.7        | NOK | https://autobuild.buildroot.org/results/17867eb7c7aacfdf2f19914fab122953c14e2b98 |     
   sh4eb     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/eb0791e4ffdd3c61cd7e491aea5de498cab275a0 | ORPH
    mips     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/cb3df60c75b607f5a506d95c6660d072dca13261 | ORPH
 microblaze  |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/d5ba3d6ef4b1a2b7c29ea06dfae693ca6bf3dc50 |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/75a1ed97d3ca13882fd219047745bfe4e555b6f8 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/f1715c1967035021da4c3ef264cff5237af20c64 | ORPH
  riscv64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/9c91ffb33e20c8262431b525f6497344f29ea8fb |     
    or1k     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/6b36fb4a54da6b77c052602c5fa0fa592e2a59c7 |     
powerpc64le  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/45cac16622b91ab50cb9a534f6af78f1fc015b5f |     
   x86_64    |   host-xlib_libxkbfile-1.1.2   | NOK | https://autobuild.buildroot.org/results/5ea87b48a12920ee772ea11df2bd65e903ec2715 | ORPH
   arceb     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/e342a356c7af37ab2df5f918e0a006353250035c |     
   mips64    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/91aa02a4febc929ba7c961b401c61ee98acfcffd |     
    or1k     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/7f029555fdc4a9cd715ddeeda655d31af4d0f924 | ORPH
   mips64    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/9124dacfdb84daed44f0e2d30cb3a4c605a4e8c1 |     
   mips64    |         moarvm-2024.12         | NOK | https://autobuild.buildroot.org/results/7b7cdbbce8512c1fbdf7e19b480db82346de484d |     
powerpc64le  |          octave-9.3.0          | NOK | https://autobuild.buildroot.org/results/a935a39b1f3816c84ba9719b2c38476cc7c6759b |     
 powerpc64   |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/ffcdd60e6f78439b5cc7fcb02f6d82f5dc37773b | ORPH
   s390x     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/4b5b24c0a2195a411c201c6f9a6fd089cc963225 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/2c5158184334e706c2ac5e3e2be71b0acbdea3e3 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
