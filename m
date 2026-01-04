Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D4EC2A06C
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 05:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0449880CB0;
	Sun,  4 Jan 2026 05:47:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5hfjjv23sEVf; Sun,  4 Jan 2026 05:47:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EC0B80CE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767505659;
	bh=VuRFi1eOenjmO7mIW+tSUnUT0AuZX/3uAIP3lFB5SOw=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ffxvoMiTua0p5I+9JGy3gzQjheiEFCPu5OeonhSm2sJHd0E74fjAiX0SuZgU6DMLh
	 XEBpKUShjayzKYKSHKUx+M2fzgkLtqpPX8e+yloPH2seGkKo1M/D4odEN84yjHTAhW
	 Fhf8ItCaKjN1UVcMRe+wi58z3iEdopB6hOrSvmwW35E0glqCfwA6KVDMYpjQBD+AVk
	 RWMknf1itW9MgVMORy8KY/1tQmK9xfLo96vDxGTrzngimAE1JnrqVYJ4VgemKifMkO
	 jEVLrYvFP7jxOxjpHlGLRLY2ZT7bm3W5EztM5VvlypUMfurtyWG4Y4Ia9o33e1fcwl
	 UcUOWDpF6lbmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EC0B80CE8;
	Sun,  4 Jan 2026 05:47:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E29B2DF
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 05:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 154C480CE8
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 05:47:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SPh21Xtuw-Ez for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 05:47:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DD01180CB0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD01180CB0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD01180CB0
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 05:47:35 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-64c893f3a94so1573640a12.0
 for <buildroot@buildroot.org>; Sat, 03 Jan 2026 21:47:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767505654; x=1768110454;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c4qEjg8yzR0sf6kjPJe7ZO6sgEdvGAg05dTlbBaTJcw=;
 b=FavkK61SXW31jJL0ccvAqqNDscHVvyaA5mIOaOdgfqaGDPCtuYhywmZz01ad3SpmHV
 aAQxVSzHgWdUjMXY3IsJf3d7qoK6pSr9OBBSdi288K4sbTPz//s+A4cC+CH/7tM1bydO
 8/TCOPkQyguffHwcz1OFYSmrZ5ugenwyzYkDooX8PSVBfxqgupvKTgaRUAMs9WmcTGB5
 r1hQoxZ1ukL5TyOe9ONmvB6xQhh2JZGYcEye6kWoDoegcuqOBQbZDXg6kC0NY/7Wdz3Q
 zKYAqwsRFsxkca1DJPEqYPjhtAO88UZ2rpmSRvYoOBKRDVcYtGvSqF0aQKiZuwtNRmr7
 WDFQ==
X-Gm-Message-State: AOJu0YzUO5Oxn5WvO9D9MDhX11YpzU3SnpLzXddW2RJfPYH9CtVl7RIK
 v6lhG4ATK0ZGVt2Q24dLOLBRHHkVvEfxplt86VcVAuEInlATw0e2AnsPWjygDQ==
X-Gm-Gg: AY/fxX7bMK1MBNrDlT9JjzpBLfw1ZC1KJUMhMPR/pojHDy1B9dpZDUgxWyEwVbgMagS
 mh5M0K0VaAib3J4V5NVrHQ7itPZrh/2VDfZ1u/agrRAnAIH7xTPz2n6+0wSSPZ5jOcAy1k+nuHR
 mBp3QZ2EwLXA82+Wr6sZBVfxQiXTNqieAxDBDHuu7cFl3GjsH1KNIRLFHDO0sdX8F0ItYi/PyIj
 CZTpNKs77UG2p4MY4NxyUASYlxOUTLLuBzgutxX3O1f+WstBabRFRtc/1tfCcKfvpfUB/+a2Ue3
 VsPQhnjTqwaqAn1EnYJdFf9GQtF7NeMTndLpzBBRskOMP4v9nOA8dZ8EeaC7OAMdeZOaOsAxQ8y
 JPxAcAvefuqTPak0bpKRwfViNQ6aefFS0aHeI/dm0JqeOkEzQWjmdY/WyfZDZPOiOLeaQoSmpOI
 oL5Gv+KLXPPARYzTFLiQ==
X-Google-Smtp-Source: AGHT+IFO7d3TQeAwKtaa2gLwk9U/ofXJ10lxjr9suOswmhAxNypGNAud6j4qzJNfqXyIpciYoK+nFw==
X-Received: by 2002:a05:600c:4588:b0:479:13e9:3d64 with SMTP id
 5b1f17b1804b1-47d6ba88e33mr45754495e9.15.1767500259643; 
 Sat, 03 Jan 2026 20:17:39 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d6d3447e6sm69127355e9.14.2026.01.03.20.17.39
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jan 2026 20:17:39 -0800 (PST)
Message-ID: <6959e9e3.050a0220.3cf769.dbd9@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 04 Jan 2026 04:17:39 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767505654; x=1768110454; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=c4qEjg8yzR0sf6kjPJe7ZO6sgEdvGAg05dTlbBaTJcw=;
 b=gf/WOhJhTIKqvC+NcgI5Mk46+FLglOYTR8iJAFd0bPg9VFx8kROlmpXOhCBegOL95w
 9qtRKAjq8AIWuqCf1+ZigivjQf1xgtKS3SLCoBt9AhfDYKCYJQ2vGREd18aCrj8elfhP
 vEs93fZ/sNS3XDgFNYRAjuGmIk+JgIPq0onXRjC3ZkpyFzRntPK7ISkoLEqn1dY5Aql4
 P6DDIrv2MehTLXMrxoRpPRR4eFwgT8bhke+2evFIwp6GbRtUa0ZksSpzEoBJKGhFYzzj
 tpixv+lXVLYBpvmeHSwoq9H8s2Dj/sXMsH0CKTI5B5w2faqYXuRgLa5VujwkdZcZL0rM
 BWzg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gf/WOhJh
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-01-03
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

Autobuild statistics for 2026-01-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 20  | 55  |  0  | 75  |
  2025.11.x  |  5  | 13  |  0  | 18  |
    master   | 47  | 123 |  0  | 170 |

Classification of failures by reason for master
-----------------------------------------------

                   dash-0.5.13 | 8 
             babeltrace2-2.1.2 | 7 
                   cvs-1.12.13 | 5 
     libphidget-2.1.9.20190409 | 5 
                    mpir-3.0.0 | 4 
                netdata-1.37.1 | 4 
                openobex-1.7.2 | 4 
                       cfm-0.3 | 3 
glibc-2.42-3-gbc13db7393773... | 3 
                 jasper-2.0.33 | 3 
              libopenssl-3.6.0 | 3 
                       unknown | 3 
             dahdi-linux-3.3.0 | 2 
  gobject-introspection-1.84.0 | 2 
                 host-gdb-14.2 | 2 
libftdi1-v1.5-62-g5e67403c4... | 2 
                  libsvg-0.1.4 | 2 
     linux-5.10.162-cip24-rt10 | 2 
             ntfs-3g-2022.10.3 | 2 
                openssh-10.2p1 | 2 
      spandsp-3.0.0-6ec23e5a7e | 2 
                tpm2-tss-4.1.3 | 2 
           at-spi2-core-2.58.2 | 1 
                      atf-0.23 | 1 
                     avahi-0.8 | 1 
azmq-v1.0.3-54-g819b24035cf... | 1 
                  brotli-1.2.0 | 1 
                   dante-1.4.4 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
                 dc3dd-7.2.641 | 1 
              e2tools-0.0.16.4 | 1 
                  ffmpeg-6.1.4 | 1 
firmware-utils-c42a3bc53da8... | 1 
            gdk-pixbuf-2.42.12 | 1 
                 glibmm-2.76.0 | 1 
               host-4th-3.64.2 | 1 
          host-binutils-2.43.1 | 1 
              host-guile-3.0.9 | 1 
    host-mender-artifact-4.2.0 | 1 
              host-rust-1.88.0 | 1 
               host-zeek-4.1.1 | 1 
             igt-gpu-tools-2.3 | 1 
                   iotools-1.8 | 1 
                  iozone-3.508 | 1 
                  jack2-1.9.22 | 1 
kvmtool-7ad32e5514aca2b6d19... | 1 
            libargon2-20190702 | 1 
libdill-32d0e8b733416208e04... | 1 
                    libev-4.33 | 1 
                libglvnd-1.7.0 | 1 
                libselinux-3.9 | 1 
               libunwind-1.8.1 | 1 
                  libva-2.23.0 | 1 
               linux-pam-1.6.1 | 1 
                   linux-tools | 1 
                   lsof-4.99.4 | 1 
                    make-4.4.1 | 1 
               nfs-utils-2.8.4 | 1 
      passt-2025_06_11.0293c6f | 1 
                  pdmenu-1.3.6 | 1 
                    quota-4.10 | 1 
                 rpcbind-1.2.8 | 1 
rtl8812au-aircrack-ng-c3fb8... | 1 
          sane-airscan-0.99.33 | 1 
sunxi-cedarx-b8f52d913f7372... | 1 
                    szip-2.1.1 | 1 
              tailscale-1.78.1 | 1 
toolchain-external-bootlin-... | 1 
           uboot-tools-2025.10 | 1 
uhttpd-15346de8d3ba42200249... | 1 
        wireless_tools-30.pre9 | 1 
                 wolfssl-5.7.2 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      at-spi2-core-2.58.2       | NOK | https://autobuild.buildroot.org/results/f6bb8683bd31a1e7afd873b3752df9268fb89ab6 |     
loongarch64  |            atf-0.23            | NOK | https://autobuild.buildroot.org/results/43617b0d4250f2a9c18cfb62893bd83abb56e4d4 |     
  aarch64    |           avahi-0.8            | NOK | https://autobuild.buildroot.org/results/61737a9cdd43a974577efcd06123cbf5d6e38434 | ORPH
  sparc64    | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/1d0048fc8fbf7b4f65f6ca1517ea94070b965e8d |     
  sparc64    |       babeltrace2-2.1.2        | NOK | https://autobuild.buildroot.org/results/406aa0d41f535c95d0a582eb2edf1f7bea689042 |     
  mips64el   |       babeltrace2-2.1.2        | NOK | https://autobuild.buildroot.org/results/0530dd620dbb7b1771370638f4cd5f53d579b24d |     
    m68k     |       babeltrace2-2.1.2        | NOK | https://autobuild.buildroot.org/results/fc957402ebf2c9f370599e495275cc6f068c4baf |     
   s390x     |       babeltrace2-2.1.2        | NOK | https://autobuild.buildroot.org/results/3097c42f5f36f39817ed095f83722b9d2c542ef8 |     
   s390x     |       babeltrace2-2.1.2        | NOK | https://autobuild.buildroot.org/results/68a1ec5483f1f4ca46da57b2d5c6989596f311a9 |     
  mips64el   |       babeltrace2-2.1.2        | NOK | https://autobuild.buildroot.org/results/63a0f1ee073b950146ae7e8807920b0da720b6f5 |     
    sh4      |       babeltrace2-2.1.2        | NOK | https://autobuild.buildroot.org/results/0cc30f000cb3e4608b2e890d59e349b7cf1e6248 |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/eda5f2fb6fbd08a48fb8fd2ccd06b3bd56e9378f |     
   sparc     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/61ba690c47a2461b2facb6ed92f0894111479df0 |     
 microblaze  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/d01d8fe3a63128246ce242de450b016b4ef13baa |     
    i686     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/017df6ac87e5e75074d8ab53bdb67888b6e859dc |     
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/296762fa9adb15c6b0ff9e95fbb639e1b928d11e | ORPH
microblazeel |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/5fbf2b199b83b4e21d28a0d7058b54a2e4e8ca28 | ORPH
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/98f733b7d84581fe2ca4397efa977f273a215427 | ORPH
   sparc     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/c34868228f34f56a262fca95a551f56df57e7980 | ORPH
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/e24e01585ce24f6892e16f522583eeff6e2d4906 | ORPH
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/43d090a227907a73e3eedb59ba60492a2ed6e821 | ORPH
    m68k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/df80ac7b6cc7a107946c3326e49c0821a4f95a3a | ORPH
 aarch64_be  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/2c4d3374b263a36d81adb1d8535fe574d1aff6f5 | ORPH
  powerpc    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/9c02e72991eedb22b3be5e807262a123207cf780 |     
   sh4eb     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/6896fe1969b3fb2ff6552449100b270d2142970f |     
    arc      |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/f564b955139b38af4f092e3f1f8590c46f948a35 |     
   xtensa    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/b6997e29a53dd4eb059155a17b7b0df5798d93ea |     
   x86_64    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/fd8dfcb473c9262fcf5fa4bb76c3efa571a74060 |     
  riscv32    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/26e2aba8540be92e480b57f42ac291a55652ebf4 |     
   sparc     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/eaf08a3bb524f60054cd3c0f45cdab69a0028aa9 |     
    arm      |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/17e13c7dcdcbff34ffb513ef58780db0431d5457 |     
    or1k     | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/306416b129272ca2e75c43b11ee3e7d33c4c5494 | ORPH
   xtensa    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/81694274f93bfd4b1a911283df0ff62e91058a6a | ORPH
  mips64el   |        e2tools-0.0.16.4        | NOK | https://autobuild.buildroot.org/results/91b401308e692fe8b790f3f5e7d9b35ae166aa99 | ORPH
   sh4aeb    |          ffmpeg-6.1.4          | NOK | https://autobuild.buildroot.org/results/3d9294c4626ac54024dcd9aff7d78865c63788a1 |     
    or1k     | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/b736f961b29c88a67394e2035d299f4a46cbac54 |     
powerpc64le  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/28f6ae97cac439446de84c74850097f60a27ec0d | ORPH
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/a0f15152fa7d2eaa9c18ef3500029673f731f977 |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/3ab41125563cd48ba3d0acde4bbcfc3ddc138785 |     
   mips64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/868dfcb4edd989eeec02b647d17888e93f847577 |     
    or1k     |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/0dcd948b73eb9cc0ee1e541f5c4e9560e9b3ba43 |     
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/bee19f4be30a202a7a69e1b3ab2eb67d029a57b1 | ORPH
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/be6c69f7b7dc3a59debde045eb49133b8fa65be9 | ORPH
   armeb     |        host-4th-3.64.2         | NOK | https://autobuild.buildroot.org/results/a9e68f825c9bb638408725d16b2c3bde0d741879 |     
  aarch64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f9b27a3324b68ea01db83e9fdff71b3bf05f0a66 |     
loongarch64  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/367ab6b093c4080d52f01bbddfbda89509cce255 | ORPH
 powerpc64   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/c308a84a97793823e743f69ce49c612d6fc3f5b1 | ORPH
   x86_64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/999fd6f187432c3202bbf23736110e3790e88d95 |     
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/25e190a30a523d818ab124579c112ded6e1c6a0b |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/adea624fc8281a31bc10b540f44e60d78e86ea24 |     
 aarch64_be  |        host-zeek-4.1.1         | NOK | https://autobuild.buildroot.org/results/d92e7280203f62e9baf94161a28b68c3c899e4a0 |     
 aarch64_be  |       igt-gpu-tools-2.3        | NOK | https://autobuild.buildroot.org/results/6502fcb809be9216eb408a355d89645bfd66e73d |     
powerpc64le  |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/8a3c3b4d04e84e9d340a10030856c1076be8fbae |     
    mips     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/130817c92ba334e22c8b155b47430bf6a2741e28 |     
    or1k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/f93bc4831870846b097cffe142a7e5dff63b6f65 |     
 powerpc64   |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/1724efe822a69723d414e26a0b9c63395a8ecec9 |     
powerpc64le  |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/ec3b381f11cac21dc64975401c7945c21bbb774e |     
  powerpc    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/96ef5672142a9561c97a07a7a21fe473cc633deb |     
   armeb     | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/2c7573c28e7a39fbf95839c3fd45df7c1e960a47 | ORPH
loongarch64  |       libargon2-20190702       | NOK | https://autobuild.buildroot.org/results/4b82be5c42a4de8c4a625f8e34b7c649039332ca |     
   s390x     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/c9149cc72a1db7c226d3acb6a36a62c50e18c763 |     
   mipsel    |           libev-4.33           | NOK | https://autobuild.buildroot.org/results/ad6c78df23f4ce62550d65fe8c57feebede205e6 | ORPH
  riscv64    | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/c426d8be1442f88f1b71a0ddffe686f1df0b0ea7 |     
   sparc     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/d7994f8fe818342bb82a6d3566a1bb52d11fb043 |     
  powerpc    |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/d01e3bb31e402e9f132285228ac5f48efa6a8d3a | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/efbf597816ba3a91107001162f2cab63bb18889b | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/9f1ce878a88dce03d63dc1ccf5ae64bc0a4d2b04 | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/1bf5114ae9e9e0b89f982c2c89783cea7ad19cc6 | ORPH
loongarch64  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/e6d708fc44767265606c77fd9506849a9ebb26b7 |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/52c2ee5280a4db0e4956a0e524c12a78ea54dc7d |     
   mips64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/832194990c0f09227c64203af08f6498fef83ffa |     
 powerpc64   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/8817e1378811aeaea6b6c22b29741b054e4789f8 |     
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/3a00615551a2e92570fcf46c113589f38694887d |     
  aarch64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/2a94e3d7d1208ef4e63436ec57fc3026aaa480b3 |     
    m68k     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/906844633bfc2dc474a272f23d83a249126c9c7d |     
    or1k     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/1d83598d797a6e795e079ae260c2bf7e3ae1850e |     
  mips64el   |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/707e8c0316fd7c7cde766b00cd823965aa5a236a | ORPH
    or1k     |          libva-2.23.0          | NOK | https://autobuild.buildroot.org/results/2015e88ee9e7d97eccbc3848f6d85f61cec6e40e |     
 aarch64_be  |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/0f56ee321098c35757dc00b18c745d40aa7ac2be | ORPH
   sparc     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/9543a61859238b005d92622e704e1123e8c4a54f | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/828c7582c6654677ddc54cae24bc96dbe78d77cd | ORPH
   sparc     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/19e1735a1149c9050a59c95585416ad081c992ae | ORPH
powerpc64le  |          lsof-4.99.4           | NOK | https://autobuild.buildroot.org/results/81e234a8c0e6b83fd135a44597c3623712164ef6 | ORPH
  powerpc    |           make-4.4.1           | NOK | https://autobuild.buildroot.org/results/a1b4640021c24f0dd6124908e6878fadddae5b92 | ORPH
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/2a5e857b38e75ce8f0c474a821e79e3fcfa1629b |     
   mips64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/e688d0d7dce59545425f5e936d96d9dba2637df5 |     
   mips64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/b6742202db7636de97771452afd64b01a636353a |     
    i686     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/3b3749b959874edca1043de082d4c99e83b4223f |     
    arm      |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/3485a3848a3095afebb4822457825e0fddc9a15a |     
   mips64    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/506073632dae3a7d7b4cdcb7971ef886229608fe |     
   s390x     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/cbb6e8b4fda090125c13d5c5d34786c58ba5dacf |     
   x86_64    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/69c6c323ce645907228a227d366016654c21bc8e |     
   x86_64    |        nfs-utils-2.8.4         | NOK | https://autobuild.buildroot.org/results/84e9001385f76ecf576efba0aefb65536bc635bc |     
   s390x     |       ntfs-3g-2022.10.3        | NOK | https://autobuild.buildroot.org/results/49cc1d7a05e2778e772a3bff99fdd747fca40839 | ORPH
   mipsel    |       ntfs-3g-2022.10.3        | NOK | https://autobuild.buildroot.org/results/6a6ea21a5e9539ad675843b5a37519f9514a2a24 | ORPH
    mips     |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/060d04116e8c5d95389edc920cd95da5fbafaf29 | ORPH
   sh4aeb    |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/6ce68dac1db3150c7b802c8e70b52ba5503309b5 | ORPH
   mips64    |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/57ed2cd76de30c70e7506d1a4dd71c6716a37ad4 | ORPH
 powerpc64   |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/90abbdbb71577627e460b28cdfd9612bded31944 | ORPH
    mips     |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/b0e1d2a7781146e89b5396b698391a5595633223 | ORPH
  powerpc    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/1eb43a0eac63b56c9655d0cb26b3122fa9e596a4 | ORPH
microblazeel |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/ed52a79e69b1eac200fb6e93bb4d2bafe8fc7480 | ORPH
   x86_64    |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/d5179a370d8f4f8bf4a49eb56b228cf198dc6eac |     
 aarch64_be  |           quota-4.10           | NOK | https://autobuild.buildroot.org/results/fb0adbb7687d8db4228e2fc1ce7a7272486fd3ef |     
   xtensa    |         rpcbind-1.2.8          | NOK | https://autobuild.buildroot.org/results/48bfa95ca0f27eb2076aaf589345d63fbd3cf126 |     
  powerpc    | rtl8812au-aircrack-ng-c3fb8... | NOK | https://autobuild.buildroot.org/results/6b4f17518e049a91a36be74c78cb8cde89b73bb3 |     
 aarch64_be  |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/1e55f83ffa45a471b399633a1c39caca70a02c0b |     
    arm      |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/48af80bdda62ca70d73bc01e0939f548c3736c0d |     
    arm      |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/dde2ab1c97459cc8fee34991593df4a25a8dd801 |     
    arm      | sunxi-cedarx-b8f52d913f7372... | NOK | https://autobuild.buildroot.org/results/18ae6300fecfa559f030d19ddf2e43a83f20ecbf | ORPH
  riscv32    |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/3ad862a817d02ec039c42d7c27a867f1c0f354fa |     
    arm      |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/e8b09b67356628b7f9600637b863513dacf7a4a7 |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/600fb8cac2236804e66ae090884ffaf7aea643d2 | ORPH
   mipsel    |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/9d35340842e8456ca4779a8e2339eed21bb6aed6 | ORPH
 aarch64_be  |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/26b5aa5be68557555820776cd547adb3bc08b7e1 | ORPH
 powerpc64   |      uboot-tools-2025.10       | NOK | https://autobuild.buildroot.org/results/82359e57cb729b90887e8a52e827a09091468f43 | ORPH
 microblaze  | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/2cf3f992f09ac017ff632011b16d675f05409f65 | ORPH
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/30ab1cb923ee96b4e4d784124336d08d73317335 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/7ef35c356bce2f371b0a585ae2dc8ecbe3efc57a |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/4c67e3865e79681fd66cfc0a2883fdc5eda51abf |     
loongarch64  |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/8e7048d7c70cda9d05c8bd504d859dd736a72b2a |     
  mips64el   |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/a8ebad93537d91725bc3c052098bb1016ac0acfb |     
 microblaze  |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/d1d5c4776b313fd79e9fb36a47cb12be78063d02 |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                       unknown | 3 
                   cvs-1.12.13 | 2 
             dahdi-linux-3.3.0 | 1 
firmware-utils-86739f2b3ae9... | 1 
     linux-5.10.162-cip24-rt10 | 1 
                 nettle-3.10.2 | 1 
                   perl-5.40.3 | 1 
               python3-3.13.11 | 1 
rtl8822cs-0ef9ddd619d2a386d... | 1 
      softether-4.30-9700-beta | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/a829c53dcda90772efedae887d3edbd1dbbf08d7 | ORPH
   mipsel    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/a21c870f953491c5623867b5590869398b8b107f | ORPH
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/cab23910c2612dd3e55109bcd428226f2a14d266 | ORPH
   mips64    | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/22fb0d6f9073129288a330423dae517c4d49df08 |     
 aarch64_be  |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/e76ce8960733b05a87d9b38b94aa1d56e36a406f | ORPH
loongarch64  |         nettle-3.10.2          | NOK | https://autobuild.buildroot.org/results/cfbecb55ab5384c68f0be2693b496f4587727b0e | ORPH
    sh4      |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/b5b4d073bce9175682d038e437958c8cc104c1b2 |     
    sh4      |        python3-3.13.11         | NOK | https://autobuild.buildroot.org/results/699c11088586086c96cac1b6228032d76e6dc771 |     
 aarch64_be  | rtl8822cs-0ef9ddd619d2a386d... | NOK | https://autobuild.buildroot.org/results/4f97fdcedfce0fd2c7b88540fa60fc62dc932544 |     
    or1k     |    softether-4.30-9700-beta    | NOK | https://autobuild.buildroot.org/results/25e86a6a1d5755eb8f6aaba72bc6cc6bd69481cd |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/550b60fbef3be4cd93b6750a190ac16e4f2ce951 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/868ed9670bac2a2687cb7dc887591d1d89a5f926 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/dbc8eaeb0d0c65c3a50c2adefc362fcb6f2433aa |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           host-libxslt-1.1.45 | 12
                libxslt-1.1.45 | 12
                collectl-4.3.2 | 2 
                  iozone-3.508 | 2 
libsvgtiny-ea9d99fc8b231c22... | 2 
                       unknown | 2 
  binutils-arc-2023.09-release | 1 
                flannel-0.26.0 | 1 
                      frr-10.3 | 1 
  gobject-introspection-1.82.0 | 1 
               graphene-1.10.8 | 1 
    host-gcc-bare-metal-14.3.0 | 1 
host-go-bootstrap-stage2-1.... | 1 
    host-mender-artifact-4.0.0 | 1 
             host-nasm-2.16.03 | 1 
           janus-gateway-1.1.2 | 1 
                 linux-6.12.61 | 1 
                netdata-1.37.1 | 1 
                 openssh-9.9p2 | 1 
                   perl-5.40.3 | 1 
                pipewire-1.2.8 | 1 
                 pixman-0.44.2 | 1 
                    polkit-125 | 1 
                  rp-pppoe-4.0 | 1 
                rtorrent-0.9.8 | 1 
                 sudo-1.9.17p1 | 1 
               syslog-ng-4.8.3 | 1 
               tcf-agent-1.8.0 | 1 
               valgrind-3.24.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/ce5aff54ebd6551ae30a47fa0b60d22e62ac85fb |     
  mips64el   |         collectl-4.3.2         | NOK | https://autobuild.buildroot.org/results/4e1f16048c33db4c860212cb47e538bbc07ba170 |     
   arceb     |         collectl-4.3.2         | NOK | https://autobuild.buildroot.org/results/ea382d248f1dab0b623f532e38e24c8775411bcd |     
   s390x     |         flannel-0.26.0         | NOK | https://autobuild.buildroot.org/results/08a543e29b59614fbeb654ffa3e38998d2433157 |     
   xtensa    |            frr-10.3            | NOK | https://autobuild.buildroot.org/results/4c285fa7bb18da9e0c85d2f0a81f8173b65d8a25 |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/442c083c9e1447f6df5950ba136e4cbe929c31ed | ORPH
   xtensa    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/519a8a6ac0350e318a80342262786513973cca62 |     
powerpc64le  |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/082dcd1a0958345fc853b58cd02e884ebc1a5dc8 |     
    or1k     | host-go-bootstrap-stage2-1.... | NOK | https://autobuild.buildroot.org/results/7d306823e2397b747b5822fcb5921ee3c93185fa |     
   armeb     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/64edbfb46b76ed530b0cbbbc19eee682db7c655f |     
   xtensa    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/725b160e38118d250b96aeb8babfa7e99e941ee7 |     
   s390x     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/01b7e17305f20992b20cd1d593f1176fa7496915 |     
powerpc64le  |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/6dfde727e0c8ae4672d4feeff40be9948004b673 |     
    or1k     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/69f37e6ff2c6003bf70f67459deca35559e1a524 |     
    or1k     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/da5b925d098c2ffcdd803817878a4bbed5396c18 |     
    sh4a     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/a7d95d8a6cbae04d93ee06e1ffbdd5d355fd8339 |     
  riscv64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/e75ff108eb40053b32cb16368be388f06376eeef |     
   xtensa    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/24c7bafd6de8154a4e393d20ebcbb6d9933a7026 |     
   sh4aeb    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/65eec67573ef237cb51a741b3233aecb5b1067e7 |     
    sh4      |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/e536164b7cc5db8c66f3f793180f0cce1f2929bc |     
powerpc64le  |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/1234a50027d2826040df4cceedb276508a36953f |     
  mips64el   |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/88e6e24b86d2a9c22ba24134e774bf6cd1c7d260 |     
   x86_64    |       host-nasm-2.16.03        | NOK | https://autobuild.buildroot.org/results/48245395190d551752905d73b5b103cc3563f335 | ORPH
    or1k     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/75635dfc2c97a6df48a96d76311d3c20032dd22f |     
microblazeel |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/766cc4fbfa44fd8ba836c58bc978dc3a586c727c |     
   mipsel    |      janus-gateway-1.1.2       | NOK | https://autobuild.buildroot.org/results/753fa80250bda42401ffa86b6c1a637f17faa5a3 |     
   armeb     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/d7a283db13650aab16e77b0f381c966c7625c938 |     
  powerpc    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/4c3c997f09e2db112a5ed6111767bb9f8cd3dd86 |     
   arceb     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/92431c9d791e2794d6644fbb6e2274d1fa29e3cb |     
   x86_64    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/4d03540be5b3e764e6d5d3bc3247563da8ad6ce0 |     
 aarch64_be  |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/ed77d7f1ccc01ae585a32d5a6c9c4af0c290f953 |     
  powerpc    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/fabefc4a1000f7176b8c28f61442cc1356e59e0c |     
    mips     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/027e033f77e6bdd9445e8a764838adba1d7774a0 |     
    arm      |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/5a75958297dc269bb0690ef85cd2ba58a1bbfe7a |     
 powerpc64   |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/60db4d68e041807ad444d78115560b62d06e749a |     
    mips     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/ed22e726af9999d28a5dd85eb37716da8b11e847 |     
  mips64el   |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/fcff2fb8594702e36c9fb40b9cc0456e68eb3420 |     
   xtensa    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/4332e660d1896e81ac8725088af3dca39588ba54 |     
  riscv64    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/d1fa8f85b49ec68058a6ab99afa1674dc022ab87 |     
powerpc64le  |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/794d0553c60a33a716174e5e09dea564a8cc4b84 |     
 powerpc64   |         linux-6.12.61          | NOK | https://autobuild.buildroot.org/results/09d5250e39feb49777bdb8881072bae9e493d611 | ORPH
    or1k     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/72112058678ba057686675b8328a508640071a30 |     
   mips64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/52699db0d9fb49ef8fa06e559dabda25ba92d7f1 | ORPH
    m68k     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/6326dc2df3577aa8d012e85c3f996002d8d30ed7 |     
 aarch64_be  |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/3291e1da78958860c753e7c1922ad9e4375cd300 |     
  riscv32    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/864d94ed5baf0bcfa8fbe05034a926d695c1daa7 | ORPH
   mips64    |           polkit-125           | NOK | https://autobuild.buildroot.org/results/f560929f92c3db68e85dca1638031d75a1fc3cdc |     
    arm      |          rp-pppoe-4.0          | NOK | https://autobuild.buildroot.org/results/ba9c80900c3e837b218dcb59609d98f479bc152c | ORPH
  aarch64    |         rtorrent-0.9.8         | NOK | https://autobuild.buildroot.org/results/4d448aa7b9427c8bf771a95b6d0fb7fccf08982f | ORPH
    arc      |         sudo-1.9.17p1          | NOK | https://autobuild.buildroot.org/results/21e4d8adae50194fe9731271033ceb0eaa5a8401 | ORPH
   s390x     |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/0d4f948c9e2d923603471359cbf0eae44047997c |     
 microblaze  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/fc46327b0f0715766c081e492447b30aea7c1235 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/c402b4cb324e67be2c870ae47391ec8506e6669b |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/558d622fbd2144daf975cf22c81c4fd71bd0f516 |     
   mips64    |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/c264799882c0eeb813c93d7e70ffc2ca46b59654 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
