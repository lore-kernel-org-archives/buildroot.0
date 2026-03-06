Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF0DF513F8
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 04:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05731827DD;
	Fri,  6 Mar 2026 04:29:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9IBQ2fjWFHS3; Fri,  6 Mar 2026 04:29:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E159827E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772771395;
	bh=vwBz3XKuUvE+9LbequvZDhXVcaXMifNFVzqaNpGKRDo=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fwNkKXucNdl1dc1jQI5O65eZ2CvRfBpoHw7l9cx1iArhaLplHOcab7fWBHqiPcxyT
	 QrUyrKgjfPC79AAILMTnm+Wwlmt0iPt+Cq/8Nsfk2GtmL7zcPy9Ob/PFYaM+SNjD5P
	 0HIiil+l6D86QuRjmJ35I7TpgCxzjf9V+ThafwVLvWKVnXtp6RSfvDlIc4eAuYeVFY
	 DxWRjcr6EDRcFdXWWvxzPqf/LrSYlD690cIVFf68uEos6wjNMuJUlevcn7mHvHX9QF
	 CcyE+Kz8bkUP08trdX5Q8PYURbBaWGWqVDZY6q5v9nDHUmnPp+SVuYoYGJAOyWaQRU
	 J16nKS/kKsSug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E159827E0;
	Fri,  6 Mar 2026 04:29:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FA7A39B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 04:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F39544063B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 04:29:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 31DyBqyPKGCH for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 04:29:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E30544061A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E30544061A
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E30544061A
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 04:29:51 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4806f3fc50bso95455945e9.0
 for <buildroot@buildroot.org>; Thu, 05 Mar 2026 20:29:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772771389; x=1773376189;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FIzMLrz97qe2azz7qycZdj8Sxfttfc3qJcwPA8r7z9Y=;
 b=XS6Alz3z8XVoLf9sLrdzq2jwvQHUtgbRUhrxUQL/r4zYTZx0WpoZRwThzIVHnaiICg
 /Ix6BTxcljXmXn1bgYW99UBbpOWQg0WXE3Ht8+nYT2Qh1X0D2Y9Fi6bO1N4qhNPgFFkh
 HcDUNZHLe6KGaTyddYc5YIhDWXcHfKiK5WB2UFEqGvZMweo6H27ygfDbFt5UxJthoXXf
 fRyaRxibfKK1Oz4fvrMKv/Q9y5LhlMxouS4X+MsX/TtYOnXs9WxNR3ZsB5i0uHdvFbuT
 RKjt04XHhI8bPCyPcwcC6E1+ISxI2+OUfQdZn2XeIvT96gm9GxV5wokfQC4GbeLs3mck
 d7zQ==
X-Gm-Message-State: AOJu0Yww/b4ZG8+ZRfCIYIvZtomihVEr0mz/9tMyz6ydQ5M3MjiBjqnR
 yBHGsGfLszzSuumjs1Va0/OLXOzomlujV0sBkvmnG5+X507xrthBOzskJm1RFirX
X-Gm-Gg: ATEYQzzaCjmdSC4WCXVFc9V3TiKAAL0SsyQtNcD6nrvMnKNgR/vQGhtHL1sLtPP0qfe
 P/m8HjXx0QjzBu6HwvrP5onx/OZtOJAjaV91ybYxWkXmFbEObns3cqBAXJooJgVm9uanKnIHHnd
 2YtE0HzyZz9i75CWRSEeV/jKY8GdbIWCVWxdKM9mlQJR5/iK+Z3xhRNSYQOGhCK0Pl5u5fzJt1S
 yNH9x7d4zhYw9E9hu0vos5E5ekHMC+tl+Bcl809eJnFb9odmSGZ39hsJcXd/qjaxlzYxXZ9kSh5
 ZbvCd1uAuFL52Omc1/cUrFADBuNs89JpZ0uwhb3rIerHvZLsH5C0thrK1Plhsl7MeJNCOa98NYH
 H19OA3QtCJUU3YrZXm1YBAb61aGFov5Sp943mQajcrsHreqNH1zLtyn53ED604sal6kz0CboLh9
 CrJ9Sw26tt+jnux7sKCdDQVsSRsDSaAA==
X-Received: by 2002:a05:600c:c4a5:b0:483:afbb:a077 with SMTP id
 5b1f17b1804b1-48526919979mr8725825e9.1.1772771389207; 
 Thu, 05 Mar 2026 20:29:49 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae3f267sm1013623f8f.31.2026.03.05.20.29.48
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 20:29:49 -0800 (PST)
Message-ID: <69aa583d.df0a0220.229781.5d32@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 06 Mar 2026 04:29:48 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772771389; x=1773376189; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=FIzMLrz97qe2azz7qycZdj8Sxfttfc3qJcwPA8r7z9Y=;
 b=M88cLszVgtuOsEpugAhxx/MqsiF486VUmcAFbM1rHQAbLSafNihTLnBh5RrGunIB0M
 /gmByM10VULwui+juIOjkN4f+V5XupbBYPYcL3rhet/clp2fFbbTovOlXyZvU+7onBZ9
 YyO2nEOOL/+jCSymZpYVOWYCRFzOtSzets38ZLJ+yl1ucONmB6Co1jV17O2l/O/nHX/u
 rKnkipIepiDoPv5ewDFNBG9vHImoeVm5f1Wg4+e3ILUMdTRn4GlrrBAMj24CEIt7XJZs
 SHtuOFxnGzI8z7D2KkD2VSWtMP+nv4oLUCFaklUPiuIdsmmo2xovWXHBUMxCWYzWMRWO
 9h9A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=M88cLszV
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-03-05
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

Autobuild statistics for 2026-03-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  9  | 27  |  0  | 36  |
  2025.11.x  |  2  | 17  |  0  | 19  |
    master   | 41  | 109 |  5  | 155 |
     next    |  1  |  7  |  0  |  8  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 10
          host-faketime-0.9.12 | 4 
host-gobject-introspection-... | 4 
                 linux-headers | 4 
                   dante-1.4.4 | 3 
              libopenssl-3.6.1 | 3 
                    fcft-3.3.2 | 2 
                    ficl-4.1.0 | 2 
  gobject-introspection-1.84.0 | 2 
                 host-gdb-15.2 | 2 
              host-pahole-1.28 | 2 
leafnode2-9543ffaf82406f943... | 2 
      libabseil-cpp-20260107.1 | 2 
             libgphoto2-2.5.33 | 2 
                  libnfs-6.0.2 | 2 
                pipewire-1.2.8 | 2 
             pptp-linux-1.10.0 | 2 
python-remi-2022.7.27-37-g1... | 2 
            18xx-ti-utils-R8.8 | 1 
               aircrack-ng-1.7 | 1 
           at-spi2-core-2.58.2 | 1 
                    bat-0.26.0 | 1 
             bmap-writer-1.0.2 | 1 
                 c-icap-0.5.10 | 1 
             dahdi-linux-3.3.0 | 1 
 docker-credential-gcr-v2.1.30 | 1 
edk2-platforms-1e64c1109ae2... | 1 
                enscript-1.6.6 | 1 
       freeradius-server-3.2.8 | 1 
            gettext-gnu-0.22.4 | 1 
glibc-2.42-51-gcbf39c26b258... | 1 
                     gmp-6.3.0 | 1 
google-breakpad-f49c2f1a202... | 1 
               host-gawk-5.4.0 | 1 
                 host-gdb-14.2 | 1 
       host-gettext-gnu-0.22.4 | 1 
         host-libarchive-3.8.5 | 1 
    host-mender-artifact-4.2.0 | 1 
                 host-rust-bin | 1 
                      icu-78.2 | 1 
            igd2-for-linux-2.2 | 1 
            igh-ethercat-1.6.8 | 1 
                jemalloc-5.3.0 | 1 
libdill-32d0e8b733416208e04... | 1 
libfutils-c326ce0cc2a735438... | 1 
                 libiconv-1.18 | 1 
                 libmbus-0.9.0 | 1 
                libmpeg2-0.5.1 | 1 
       libpagekite-0.91.251215 | 1 
     libphidget-2.1.9.20190409 | 1 
               libpthsem-2.0.8 | 1 
                  libsepol-3.9 | 1 
                libsoup3-3.6.6 | 1 
                 libzlib-1.3.2 | 1 
     linux-5.10.246-cip66-rt29 | 1 
                  linux-6.19.6 | 1 
        ltp-testsuite-20250930 | 1 
                 mbedtls-3.6.5 | 1 
                memtest86-7.20 | 1 
            minizip-zlib-1.3.1 | 1 
                       mrp-1.2 | 1 
           oath-toolkit-2.6.13 | 1 
odhcp6c-f19dd37fb467c9cf10c... | 1 
               openscap-1.3.12 | 1 
                openssh-10.2p1 | 1 
            optee-client-4.9.0 | 1 
      passt-2025_06_11.0293c6f | 1 
           python-zlmdb-23.1.1 | 1 
                 rtptools-1.22 | 1 
                s6-dns-2.4.0.0 | 1 
              skalibs-2.14.3.0 | 1 
                   slang-2.3.3 | 1 
                   swipl-9.2.9 | 1 
              tinyproxy-1.11.2 | 1 
               tipidee-0.0.5.1 | 1 
             tpm-tools-1.3.9.1 | 1 
uhttpd-15346de8d3ba42200249... | 1 
ustream-ssl-5a81c108d20e247... | 1 
               valgrind-3.26.0 | 1 
                 vmtouch-1.3.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/44cd96494bde679e3324fc0f67ea91e20abad5f2 |     
    arc      |        aircrack-ng-1.7         | NOK | https://autobuild.buildroot.org/results/2fe6439cbc5eb518176f86740cd3fa1bb5c668ce |     
    or1k     |      at-spi2-core-2.58.2       | NOK | https://autobuild.buildroot.org/results/d761c3381169a5d5d621e45ca80e3e1169bf1c97 |     
   x86_64    |           bat-0.26.0           | NOK | https://autobuild.buildroot.org/results/f59bc08861e6a5b2a1b39095775f8d0d5001edbb |     
   armeb     |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/c18bf06e0c34bb3d89038719009e9113913ab2b0 |     
loongarch64  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/d414d738ddf063de05406af1fe9b00b07f785fa8 | ORPH
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a221e55e8f17bf7b5424675fcc7071431ef25f31 | ORPH
   armeb     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/23a7f5a4474596aac0d94e6c9b983b2a0f336e2e | ORPH
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/f48e5f1cebca588cb6e10a1a7030d08f1d1bd94b | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/132d46d6eeb94c0d2ef32a09fe40afae2e0f2376 | ORPH
  aarch64    | docker-credential-gcr-v2.1.30  | NOK | https://autobuild.buildroot.org/results/bcbedaba3caf4874ac6697306f56ff6875c22e2d | ORPH
  aarch64    | edk2-platforms-1e64c1109ae2... | NOK | https://autobuild.buildroot.org/results/a137629a04b0e190cdaa4851054edd811244be1b |     
  powerpc    |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/3506eb374ee807f830861acdafc7e96943533ca8 | ORPH
    m68k     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/095fd2c6ac5a4142626882bda5626896f7ad4c79 | ORPH
   mipsel    |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/4da46008b1adc208d7f82fa56023d9b718e4d247 | ORPH
   sparc     |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/0c0c1e0408ed00ac699182f948423538a0f213c6 |     
loongarch64  |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/1c70c7161a68ddf3467f5b441b624464b5705c53 |     
    hppa     |    freeradius-server-3.2.8     | NOK | https://autobuild.buildroot.org/results/554ebcbb42f25cfe52e54c5d2c1d8b0165439b95 |     
   xtensa    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/e78bd2ebfdc697f8108f51591bc4e662ba9c5d1e | ORPH
    hppa     | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/f8ffade559671908dbb4fb118453f0c3316f742f |     
    mips     |           gmp-6.3.0            | NOK | https://autobuild.buildroot.org/results/0418da160a9983a943c9becaf1b10af2c9cce813 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/80329b8de79b983685550090ed8b0fa3aadd3fd8 | ORPH
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/8e06dc4f367ba81be745953e08e8b448f583a451 | ORPH
    arm      | google-breakpad-f49c2f1a202... | NOK | https://autobuild.buildroot.org/results/1bd69fecf7de831b56410bcb57bf8a6b8ddd41fa |     
powerpc64le  |      host-faketime-0.9.12      | NOK | https://autobuild.buildroot.org/results/5ba92326557e0145eca8b8b4bacf1af04d535508 | ORPH
   s390x     |      host-faketime-0.9.12      | NOK | https://autobuild.buildroot.org/results/0df108c07d60701a8dbd6100bf9e80ef47a8941c | ORPH
    i486     |      host-faketime-0.9.12      | NOK | https://autobuild.buildroot.org/results/f785c6e6f2ac52fbbbd89eef3c486c65c681e0f2 | ORPH
    or1k     |      host-faketime-0.9.12      | NOK | https://autobuild.buildroot.org/results/3ae063abfe250ff4f186ce4c1c3c06bb42c9b17b | ORPH
 powerpc64   |        host-gawk-5.4.0         | NOK | https://autobuild.buildroot.org/results/a4c28ac789aacc9d23e54c560742fd6b60674d9e | ORPH
    mips     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/0b959a68ea1101ce39ce59a70ca1e6a22a4c2711 | ORPH
   mipsel    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/424e9ef891a9bb842f02f4154680eb50e9163958 | ORPH
    arm      |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/c811e7fe1e4fda916b3ceeafc6b3257afcddf662 | ORPH
powerpc64le  |    host-gettext-gnu-0.22.4     | NOK | https://autobuild.buildroot.org/results/90daf4417f0c4a1e22814f244f26002d73d60a96 | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/50117d18789961c0e491629786423978161f4851 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/316cc1c87a8d291838ac0b34065df135b78ea4fe | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/73ba797c62f25e4b4290cfedb268f56e54ec0edb | ORPH
loongarch64  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a80aa3e311310e2faccf0137d95ffeac4400e39a | ORPH
   x86_64    |     host-libarchive-3.8.5      | NOK | https://autobuild.buildroot.org/results/47e9f90100e238d831049d945dfffbc94f631395 |     
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/940b28e9ddc77560d3b74d56bfa9f40812c828ba |     
   s390x     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/0cb1d86d0db297de277aba076e45ba97704974f7 |     
  riscv32    |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/17b3e02e39eaf1e22925f430a88ef7aba5dc46f2 |     
 microblaze  |         host-rust-bin          | TIM | https://autobuild.buildroot.org/results/0f546aa011b636969293e3ae5c5fa3769693e8be |     
loongarch64  |            icu-78.2            | NOK | https://autobuild.buildroot.org/results/6fa06f011f88f319b9d40eaa505539ebc511d3d4 | ORPH
    mips     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/d521de2b3ef83ea0114cb1ee7517bcde7f56de95 |     
   mips64    |       igh-ethercat-1.6.8       | NOK | https://autobuild.buildroot.org/results/bd085a72c05eefaf4d799eff27ad148cc61250c8 |     
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/41188b4bf21e87a61570bf795405331768b206ae |     
   armeb     | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/9f39d375cd6e342320efed2a76d23cc966da49f3 |     
  powerpc    | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/33e5d25139f71846d33108c306431185b0515d57 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/965dfca2c4b9969b22a1444d80f8e6b228f92083 |     
   mips64    |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/dd86ecd66a30d92414a605eed0eaa888a29bfa66 |     
 powerpc64   | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/2ee6e585639cad663d4a25260460fc002717b218 |     
 microblaze  | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/16d925a825a74ba4a3ea14ed44baa7d24de9505d |     
    i686     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/9eee543107c4bb09f7cdca96df35d170c0f81de4 |     
    hppa     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/772e6b201c753eceda1ddb24a1d55261c88e3f61 |     
    arc      |         libiconv-1.18          | NOK | https://autobuild.buildroot.org/results/8a86749d691a3ac6192ee1a2a06f00caaf5f8e49 | ORPH
 microblaze  |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/72f1f055bbccb382b3645fbb5b4fdf03996459e8 | ORPH
    i686     |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/c067a39abe14abceaf4a017f5c4fe15e97d47653 | ORPH
  aarch64    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/e4eaafff7eb999a78bf6f3792074036f5656d84e | ORPH
    arc      |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/b91ab0abbd14137b78266226699837e8b4d722ae | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/887f8298279d83e953e3a3e6827091cd6e826d29 | ORPH
    hppa     |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/7aa650f23d799d3490fdda3f458e5dcefc0e0125 | ORPH
    hppa     |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/62f17ef5e4d390fd9e577206b4dc60b0031b9b23 | ORPH
    arc      |    libpagekite-0.91.251215     | NOK | https://autobuild.buildroot.org/results/e564d3c47d1a11ccdf08f31153832792f8cc2a65 |     
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/dcc14c9485fc4bcadf96a752a5719e13144ae268 |     
   armeb     |        libpthsem-2.0.8         | NOK | https://autobuild.buildroot.org/results/e40f43b1ccfa90ddd0726e1b52648c80070869c1 |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/fd32edf398aa139366828a832216f05b56d777a3 |     
microblazeel |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/c350e72d35f25b8deb4a7a548e122e10dd0f90b1 |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/81d9d2f14da2250b5a8719e8b895e289a918d488 | ORPH
    arm      |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/20f62d51f7cf49d754e91b8f0082c370cdd3718a | ORPH
 powerpc64   |          linux-6.19.6          | NOK | https://autobuild.buildroot.org/results/03dad2108bbacd7df2dfd42135a561dbf6a2a2f0 | ORPH
 microblaze  |         linux-headers          | TIM | https://autobuild.buildroot.org/results/8c7b9240049d07242b099392c3c98eda0246e2ba |     
 aarch64_be  |         linux-headers          | TIM | https://autobuild.buildroot.org/results/5486783232a36e36f9cf960086921d15dc562384 |     
    sh4a     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/eb2861845cb114dbe8ca9a8729ddaf7e344c82f1 |     
  powerpc    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/da5c3156a4aaca279690d3c7bf26d717c450f942 |     
    m68k     |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/65ba3e17325a0974e6e01a7663bbef0edb4ec80a |     
 aarch64_be  |         mbedtls-3.6.5          | NOK | https://autobuild.buildroot.org/results/9780fa013c5365d2a0f3c897f4379048ba5faffc |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/ef7e0c6e85cbdb9124e32e30647b939c49068bba |     
    m68k     |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/0a04d019ff43de0c756e6315e2a92b15b7ed4200 |     
 microblaze  |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/3579263745439f66adb87c55f51c3096ecb60c88 |     
  mips64el   |      oath-toolkit-2.6.13       | NOK | https://autobuild.buildroot.org/results/85077467a959647a1c5249cd9fd306c5466d8423 |     
   xtensa    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/75345978936871862ad2ce301d6489eb519d1c38 |     
   armeb     |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/694ae632f6b6920c794808b7efaa92a448420f03 |     
  mips64el   |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/7ff505ab3f1e371af2e743dc12f130837be03b25 | ORPH
   armeb     |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/45a6f21da38c67642dc53a3149484dafec014422 |     
    sh4a     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/38a3e88c26b15a25f6747d82e61c58823ef74847 | ORPH
microblazeel |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/5d404e6b7e722b10f72cdbc630a3bc8bd20bb0fc |     
    i686     |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/909ca8f1244fba0b3ad9ae305d7be42acb76983a |     
    m68k     |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/6b2278b7af88cd22ea23d43efb865b2b3ff6eee8 | ORPH
    hppa     |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/827bda2e4bea093594c94ddea1185f71bca423e3 | ORPH
   armeb     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/4a3f4fcd94ab1b12ca4b1063690c01f5227f4465 |     
   mipsel    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/c388e0c37820f3b4294a42061e1f1314f0f6f02d |     
    i686     |      python-zlmdb-23.1.1       | NOK | https://autobuild.buildroot.org/results/3e3be62adbe61c7c9c482ceb8bab29374a49ddc6 |     
   armeb     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/675026e863d90ca84b0c7344c32927c7cded65d4 | ORPH
   armeb     |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/4fac2e99f464dda4aa9bb18c5efee73412d58f88 |     
loongarch64  |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/67c73fa7097bd35c128f43fe07fce29d3f423493 |     
   mips64    |          slang-2.3.3           | NOK | https://autobuild.buildroot.org/results/95bd7e0617b8bb6484bfbd88eaf139c9303eab67 | ORPH
    or1k     |          swipl-9.2.9           | NOK | https://autobuild.buildroot.org/results/e25defa59b1bf1f7290b5ebf9cf625e7ffe583bb |     
   mips64    |        tinyproxy-1.11.2        | NOK | https://autobuild.buildroot.org/results/200e7794375b257f42fd849d6fc442637fb07135 | ORPH
 powerpc64   |        tipidee-0.0.5.1         | NOK | https://autobuild.buildroot.org/results/d6c22c383874e1e2e46008d35fa875aef5256822 |     
powerpc64le  |       tpm-tools-1.3.9.1        | NOK | https://autobuild.buildroot.org/results/763550a32ce1cd3c147b1e2e011fb3fcfeb214d4 |     
   armeb     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/1520aac77ffeaf2f5d233d139bfed36c74103d00 | ORPH
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/f9bae65937c7b53ef1ca8052000737d2dd5b4d96 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/400106782788ea095c20709015b81cfd7cc1959e |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/bb8a04585b0a6b96e84e8f0080d00cccb8223313 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/efb29d8c5d1363202e85b2525717d651ade519b7 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/1add865d5e374b9dc6238ab5c066ca34368b73c2 |     
   sh4aeb    |            unknown             | NOK | https://autobuild.buildroot.org/results/aa088abb1bae9744727ea9d0c474b249502e3b8c |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/46404d3e57dba88d962b31dbc470bec381cf4eac |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/6f38d8793b16dc05d3fe80ff47aaf1edab5c3477 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/7966b4fe45d640094e5a3c5957d4511cbf0a2945 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/b45fc60066e5762fc62986f99767f04c16682402 |     
   x86_64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/ada19118876512231c3aa57cd43e6f2b6cf3e606 | ORPH
   mips64    |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/6671efc7e660353f025e7b7c370db94b7686c869 | ORPH
   sparc     |         vmtouch-1.3.1          | NOK | https://autobuild.buildroot.org/results/4176e555ddf0d934f90198dd8476338e725d2a2c |     


Classification of failures by reason for next
---------------------------------------------

cegui-e7a03afc70c6182a091ff... | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
                 libmbus-0.9.0 | 1 
                libsoup3-3.6.5 | 1 
                memtest86-7.20 | 1 
               openscap-1.3.12 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/55196ac9d82b076ee9b5ce7297734c5df73710d1 | ORPH
   x86_64    | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/d671b45342aa4d8be1bd021665eb9bc0da962656 | ORPH
   sparc     |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/5a07004033cd43f1bfdaa36315c6afd3bddec10c | ORPH
loongarch64  |         libsoup3-3.6.5         | NOK | https://autobuild.buildroot.org/results/11ce48dc7aa7aa062cb84cf0d47cb17a85c90f1b |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/fc14be4f2e5b1db2f7313156b50c9e2e298b06e9 |     
   sparc     |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/7dfc35a34dc0ecb050398d8cd7999939144d0c50 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/5a7b119cf15d96dd398edd43f35e924480164fa0 |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                       unknown | 3 
          host-faketime-0.9.12 | 2 
                 libmbus-0.9.0 | 2 
package/linux-headers/linux... | 2 
                  brotli-1.2.0 | 1 
                   dante-1.4.4 | 1 
flashbench-2e30b1968a661474... | 1 
            host-coreutils-9.8 | 1 
                 libzlib-1.3.2 | 1 
        ltp-testsuite-20250530 | 1 
            minizip-zlib-1.3.1 | 1 
                   perl-5.40.3 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/e49332381abd73eaa99daa9893ce50123e9723ef |     
   x86_64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/94593f826ec056f1736fcec4ff1243c105fa959d | ORPH
  riscv64    | flashbench-2e30b1968a661474... | NOK | https://autobuild.buildroot.org/results/1c47594ee2a6108251eb301e921dfc7ef4ccf76e | ORPH
  aarch64    |       host-coreutils-9.8       | NOK | https://autobuild.buildroot.org/results/9b2cabb187c0c3e398e318535853f2996dd59f59 | ORPH
   arceb     |      host-faketime-0.9.12      | NOK | https://autobuild.buildroot.org/results/65fc3731fe883052b8dd339f1bdb5b033bb1615d | ORPH
   s390x     |      host-faketime-0.9.12      | NOK | https://autobuild.buildroot.org/results/8788870f4a00e31207e1df63a277285b2d005e5f | ORPH
    sh4a     |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/61c7caf4aa7a6f3c6478eb314081ab8e7433a3ad | ORPH
   armeb     |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/6733684c830cc78288e0b31119331b56095dc20e | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/4f45619702b84aabc21cd30ce279c5e9116c9cf4 | ORPH
   sh4aeb    |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/e238c0cdf799fba15a5854a2044889a604eb79d6 |     
    or1k     |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/fbce33c956e709ea847f14edf9408edd95fd207f |     
 microblaze  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/affaf848f310edc1149237c4519875cf3e913856 |     
  aarch64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/d1d2b0caa36835f10a17f7ada947e3e6e1233586 |     
    arc      |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/6b792aff2a058aa438b96772852a0f2ddccb7830 |     
  riscv32    |            unknown             | NOK | https://autobuild.buildroot.org/results/3dd6386a96820c24adef25ad56c6c33e221105a0 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/11cde03c812c58977b2d7c84122d937895e4a77f |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/9d76e4a61f0352c7d1a52056f37589a105b1afde |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                host-odb-2.4.0 | 2 
        host-python-lxml-5.3.0 | 2 
              libopenssl-3.4.4 | 2 
                   dante-1.4.4 | 1 
                  ffmpeg-6.1.3 | 1 
flashbench-2e30b1968a661474... | 1 
host-binutils-arc-2023.09-r... | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-16.3 | 1 
                host-gperf-3.1 | 1 
              host-guile-3.0.9 | 1 
host-heimdal-f4faaeaba371ff... | 1 
                 libmbus-0.9.0 | 1 
              libmodbus-3.1.11 | 1 
                libressl-3.9.2 | 1 
              libsodium-1.0.18 | 1 
                  liburing-2.6 | 1 
                 openssh-9.9p2 | 1 
               pulseaudio-17.0 | 1 
                   slang-2.3.3 | 1 
                  tllist-1.1.0 | 1 
             tpm-tools-1.3.9.1 | 1 
               unixodbc-2.3.12 | 1 
                 vmtouch-1.3.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/b5e74e8198f9d864a29aa4360dab88c883148187 | ORPH
    arc      |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/9a92eea1ed9e0de2cbd80bfcdb54c83dafb53531 |     
  sparc64    | flashbench-2e30b1968a661474... | NOK | https://autobuild.buildroot.org/results/230bd5764c6356be66e1961faee5e0c2de2ef4a1 | ORPH
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/9adb0b36dd22d98735bdd045086d4950ed4f3b42 |     
 powerpc64   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/9f1767d858c2ab86aabd602d67f4434d13065711 | ORPH
  riscv64    |         host-gdb-16.3          | NOK | https://autobuild.buildroot.org/results/2a6de0a7f8bb07df59201938d222781e705b9317 | ORPH
    i686     |         host-gperf-3.1         | NOK | https://autobuild.buildroot.org/results/40fbe83112a571bd402f8478c3e49ce977bdcc8d | ORPH
   mipsel    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/970e3d315df4d38fb91b52725889ec323776f7ac |     
microblazeel | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/c5a215d399507d786b6ac21128789430f559966a | ORPH
   mipsel    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/e6f3fd4628e26eca992751377950dddc2ded297c | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/129428cda845928cbb2983f71d1617b74546546a | ORPH
 microblaze  |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/116db0f433123be024ddd6e2526a1606271bfdab |     
  mips64el   |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/ddcfd34d18d4ec36c7f57fe1379b8120f33fe6ce |     
   mips64    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/a42b6b4595ad61327b8b8066ca07ec066f4deb3e | ORPH
  aarch64    |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/128382813f124733cee4304a9e27f9dc18dc9f1e |     
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/5aba57a687f6c28e7f62f00a341bad8699317069 | ORPH
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/4182e47aaa32ea1013061793f7f9f0615d05408d | ORPH
    arm      |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/7da61405cf9465135f9c255ed7ff29995e4a5fc7 | ORPH
microblazeel |        libsodium-1.0.18        | NOK | https://autobuild.buildroot.org/results/36f9ab07f0662246f8c0515ff27e04b329bdfcc3 |     
powerpc64le  |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/554bf7f70ff0d9fe17d362bff44cff986f87c6a6 |     
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/8b0efbc0053edfb01787d7b4fa8029bdff0a6196 | ORPH
   sh4aeb    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/fd3a7972fff4b0c0bfdf377672d72a934df393c2 | ORPH
   s390x     |          slang-2.3.3           | NOK | https://autobuild.buildroot.org/results/092392770b15daa41364e1168c45e9dc261dbc79 | ORPH
    or1k     |          tllist-1.1.0          | NOK | https://autobuild.buildroot.org/results/6856a42bb242bce9ec8dffa91b233e833078ab43 | ORPH
  mips64el   |       tpm-tools-1.3.9.1        | NOK | https://autobuild.buildroot.org/results/ed3abdcc33a4fb1769ee443332eb95d74783eb12 |     
    mips     |        unixodbc-2.3.12         | NOK | https://autobuild.buildroot.org/results/bf01c648f3bed706a56c50986a0ee539ba753e35 |     
  powerpc    |         vmtouch-1.3.1          | NOK | https://autobuild.buildroot.org/results/5f5b3e38aa0a25be3cb8331e9f37bea485a42cfc |     


Gitlab CI results for 2026-03-05
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/13358389406 |      
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/13351567574 |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
