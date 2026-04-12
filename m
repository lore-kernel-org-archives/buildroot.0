Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1380BF3ED7A
	for <buildroot@archiver.kernel.org>; Sun, 12 Apr 2026 03:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29D2483E0A;
	Sun, 12 Apr 2026 03:29:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f_BDmWFQCF68; Sun, 12 Apr 2026 03:29:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8149A83DFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775964582;
	bh=YgQkZ772DKuvVSUM/BKd9MWHl9POZczMyUpAoOVAQo8=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ExCZdw+QZW/CAj4jO3oLDTE5l1wRC6n62i67P1y+nLsHi2vU2RQR9sixCNd4oBZUf
	 V2c2TmRQJwv0gVehsWphOZ/zAX7jqAoNyowPa/Rw7664Hq/8+Q+5AqRK7nEOgTZ6hG
	 /7A+UQYaiGr0eotpJL+Wn6iAI5lo5DPKLHHH/cFJTrD28zbbhrxYRUfcck/AZAmxx+
	 Sc415LlfAn1Zunvh6Tq0G+7226yrNErrCQP1pHw7p6080ubN0qhax6ui8qloq3aojA
	 ZXjCe3Jy65JzSFS+1I+J9sdTwlhFh0rvKow/2F2ZlnjOew8L+/alrYslB+0sjG9/e9
	 rnbHREhM1njhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8149A83DFE;
	Sun, 12 Apr 2026 03:29:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B4C71194
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 03:29:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4AF560AAE
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 03:29:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JNCmiBT9h58B for <buildroot@buildroot.org>;
 Sun, 12 Apr 2026 03:29:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A5F6260A9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5F6260A9F
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A5F6260A9F
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 03:29:37 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-43d75312379so49403f8f.1
 for <buildroot@buildroot.org>; Sat, 11 Apr 2026 20:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775964575; x=1776569375;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6SP4jtxVzXYChLYgxs5v420wMmZRWHyUvSCEHcmBNaI=;
 b=Jt+j7Kl3pLRv2H3j/AZ3I2eTLr5ykwybek99ONYlJWia/p685HjC97c2zHuwLR82E4
 b8IR5gv3R/kEZK4rcOo99ZXlJEjJCS2t0arNcUro59wVko/vLNTKwxXKX2CkqTbDSz6M
 M0V/hO8/xzpqUU6Nlk1b1zcY8ezjEX9zVVaWCByT1zYTJVNrgLUaQNAstVc0ltUAdp0m
 e1qS/KoSMh2gf+B74HTjMxnnq9nPsM+hN6HXoa8tt1SCoH2y5e2Y0XjIJSLcZjdjDWlf
 WrZkif/Wlda6WxTtqGHTmTJNJvPKzcFslQcNpnesEBrTJ14mCULjb6vyoCFvpRrbxHF/
 tMaQ==
X-Gm-Message-State: AOJu0YyDVCq+CDhk2i9Csc78JduJ8e2n96AwrbF7WMMv0tJRGVOdfAra
 Cg5RyMOnluhFLdi5J5CNfuGaSGA2oiP56tcIs0W2cbCgBHDvwh0hwlDMlfrcIjAd
X-Gm-Gg: AeBDies+BjSp8Tow5iYooofq4Mdnm8b4y1EFyBYOwZ0qo+rgd94Ox8KEU0BhKTlSiOA
 Qy9iZpYuuAJetSF926xLBRoTa8FVK+TONyMi/UP5vqSen0B5uYmSNMySmLZGRXvngZYquwwJu0r
 SnOZB9Zo4HgqIsulZRvyJqAU/gKO+KOaUPwXBcF/n2bcnHvWZbRoC7ahrSrqO8ujVuGMfUzqDvZ
 59TaG397JbeNbbjLWqqB4oYZ3SD//wdOXyx3VWxENlV0eVn8DI4kga/aLUsAHzYjgzl9LDQ0bW1
 lGaEYyNP8qHtE/w+d5dJkSotq36/I16uNx4oRFAgf3LLL6dAYMYCRDINpJ1LHvT886mr36TthJC
 0Avtfr/f3PZ99dxwXuofgynheZqODhqlKuWqCi/eFwi2968+liwaaIUgYDorITLCoewG6CfImeC
 yldL1G2CWsvzHB3DF08iYBD48nHZ59CnhJC2pbDjPz
X-Received: by 2002:a05:600c:c099:b0:488:e10c:d17f with SMTP id
 5b1f17b1804b1-488e10cd37amr27533315e9.16.1775964575204; 
 Sat, 11 Apr 2026 20:29:35 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63e50200sm20814539f8f.29.2026.04.11.20.29.34
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Apr 2026 20:29:35 -0700 (PDT)
Message-ID: <69db119f.df0a0220.1eaf90.aec1@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 12 Apr 2026 03:29:34 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775964575; x=1776569375; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=6SP4jtxVzXYChLYgxs5v420wMmZRWHyUvSCEHcmBNaI=;
 b=ADF8V3ZIkcq7AWmHoX7uPpEL5PYaJU12DQKzbvZIKFoMKuExOQOgm5MPJcPlIPnzGE
 SRTrzQke1ieYTp4PDQ+4ifMSzAT7YSrzU+mE92KNTPs6UOUEHB65lGe32jn4Vtn+eKqO
 CuDvzJOcObsxA6E2O4YrwjDdI3Jl4Qi4WciajcWDajZRM8SV6ws2c/HoptIdeTkdOjJj
 Fex0w5yNa+q4BJnX8l32qBnlzI1Hs6nOzB4zZDqMSODQcrcS4HUatLvs0lk+DR+OW3U1
 rHzDIX1M3m7814eGI16aPFXF1EjKYXNimgRX1BEYvwGnVDhl0xtLtyLxkxHRuUZKh29k
 XX1Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ADF8V3ZI
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-04-11
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

Autobuild statistics for 2026-04-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 14  | 14  |  0  | 28  |
  2025.11.x  |  7  |  7  |  0  | 14  |
    master   | 55  | 92  |  1  | 148 |

Classification of failures by reason for master
-----------------------------------------------

                   perl-5.42.2 | 6 
odhcp6c-f19dd37fb467c9cf10c... | 5 
                       unknown | 4 
glibc-2.43-17-gdd9945c0ba40... | 3 
       shadowsocks-libev-3.3.5 | 3 
                 systemd-258.4 | 3 
                  cairo-1.18.4 | 2 
firmware-utils-c42a3bc53da8... | 2 
                flashrom-1.7.0 | 2 
  gobject-introspection-1.84.0 | 2 
                 host-gdb-14.2 | 2 
              host-rust-1.88.0 | 2 
                libcurl-8.19.0 | 2 
             libgphoto2-2.5.33 | 2 
                  libnfs-6.0.2 | 2 
                  libnss-3.122 | 2 
           oath-toolkit-2.6.14 | 2 
             parsec-tool-0.7.0 | 2 
          powerpc-utils-1.3.11 | 2 
                     shim-16.1 | 2 
                 aichat-0.30.0 | 1 
           at-spi2-core-2.58.2 | 1 
                   atop-2.12.1 | 1 
                 babeld-1.13.1 | 1 
                   dante-1.4.4 | 1 
                 dhcp-4.4.3-P1 | 1 
                   exim-4.99.1 | 1 
              gcc-final-13.4.0 | 1 
           ghostscript-10.06.0 | 1 
               graphene-1.10.8 | 1 
               harfbuzz-14.1.0 | 1 
                 host-gdb-15.2 | 1 
          host-xfsprogs-6.18.0 | 1 
          imagemagick-7.1.2-15 | 1 
      ipmitool-IPMITOOL_1_8_19 | 1 
                  libbpf-1.6.2 | 1 
           libmicrohttpd-1.0.3 | 1 
                  libsepol-3.9 | 1 
libyuv-4825d9b29eea4dac2460... | 1 
     linux-5.10.246-cip66-rt29 | 1 
                 linux-6.19.11 | 1 
                 linux-headers | 1 
           lttng-libust-2.14.0 | 1 
                  nginx-1.28.1 | 1 
             ntfs-3g-2022.10.3 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
               pax-utils-1.3.7 | 1 
python-remi-2022.7.27-37-g1... | 1 
              python-xlib-0.33 | 1 
            qbee-agent-2026.10 | 1 
                   s6-2.13.1.0 | 1 
                suricata-8.0.4 | 1 
                   swipl-9.2.9 | 1 
                    szip-2.1.1 | 1 
               trousers-0.3.15 | 1 
          usb_modeswitch-2.6.2 | 1 
ustream-ssl-5a81c108d20e247... | 1 
             util-linux-2.41.3 | 1 
        util-linux-libs-2.41.3 | 1 
               valgrind-3.26.0 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |         aichat-0.30.0          | NOK | https://autobuild.buildroot.org/results/3be8d6c0db3900a35e663010135e15868a75cdf4 |     
    or1k     |      at-spi2-core-2.58.2       | NOK | https://autobuild.buildroot.org/results/c3631a951e7ea7f3f7d7ede1476531703c8c1ba4 |     
   sparc     |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/be27a50335cc0d95a2c54dfbf96340180fedf256 |     
loongarch64  |         babeld-1.13.1          | NOK | https://autobuild.buildroot.org/results/60eb1974508cd2f713f3b121309daf56b2d3d567 |     
  aarch64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/74adc83f9a110da0c77d4d52971c33ac20ba73e4 |     
    m68k     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/012c38c7e357930b5ccbb8e90f198af7c7899be5 |     
    m68k     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/985f4eccc40496fd776eb38c612b0a55f3351601 | ORPH
    arc      |         dhcp-4.4.3-P1          | NOK | https://autobuild.buildroot.org/results/6986d5770c8e9c07198fab871da6fbd897b68f87 | ORPH
    arm      |          exim-4.99.1           | NOK | https://autobuild.buildroot.org/results/ff9dd06420377f3674fd874a244d9c2e2c460ccc |     
  aarch64    | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/d582653790a8d0a094db648f6e701dcd9c94b07a |     
    or1k     | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/cdeb43a3d0e15e94d9b38537ec0286b7d7e5fa9f |     
    mips     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/8f28260e3aafe87b7cabacbbb3b456c39daea61d |     
    mips     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/747bee204f8b752c947733d50c060571e6c6284f |     
  powerpc    |        gcc-final-13.4.0        | NOK | https://autobuild.buildroot.org/results/05b3d5654795afa2ae53f47e7f598f59ad69d68d |     
   armeb     |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/1c3895b07d61dab2ffa1b28257b3476bc38ea616 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/095c72ac29379bad0736e0fcc269adfd17adeab3 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/9b875d3f047b0f566c3f7a7d68d0cfe2eaf13294 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/6ca13a19610946a91abe1e58782f8412b8c531c5 |     
   sh4aeb    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/e0e50b143985c55b6adb32f43e400e3577cc1ba2 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/d5bca458784f12159c58931c550bc3711971db50 | ORPH
   mips64    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/b4f67a1e461d56a15d6d5c8e92754c8271cd4aa6 | ORPH
    or1k     |        harfbuzz-14.1.0         | NOK | https://autobuild.buildroot.org/results/fac56c2e59933ab78bf15b0d30319cba49ef775f |     
   mips64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/df78fe92ec1b0286b9396a2cbc514a99ac180073 | ORPH
   mipsel    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/49720c811d7c6aa30e3334656705c9d662666574 | ORPH
powerpc64le  |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/72be7e4f8508ad671581da3cf86823569f8ed8e1 | ORPH
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/f614ad214b932cc627e5e79f51c7354c1caba03b |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/99ad848e5dbd737a93638e46ae47c35f3d613033 |     
    hppa     |      host-xfsprogs-6.18.0      | NOK | https://autobuild.buildroot.org/results/458631fb9c895e57e7f8db311a1b2915fd87e1ee | ORPH
    arc      |      imagemagick-7.1.2-15      | NOK | https://autobuild.buildroot.org/results/8c389aaaccb718d1a6ad5f6c894a4cf7febdc13c | ORPH
    or1k     |    ipmitool-IPMITOOL_1_8_19    | NOK | https://autobuild.buildroot.org/results/f4d6b2ce9d7eb4538d95abf9a34a0c3eddb340e2 |     
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/45df308307891358ff8aa8fc9dac56f2b6af4463 |     
microblazeel |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/0e047a2849eb556d824e35884b97804261994d9c |     
   mipsel    |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/baa74a47464ed3e21d0adad64dd0c7c708c9ef85 |     
 microblaze  |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/34a74b8e7bd01b83915059d0e92d9778f57d3dde |     
    m68k     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/110051bfbfe5ef780974cfe332b1c024259689ba |     
 aarch64_be  |      libmicrohttpd-1.0.3       | NOK | https://autobuild.buildroot.org/results/3e0acb47d13cee2fac681343b940688d855a3b77 |     
   sparc     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/3719b79afea8a43f6745688a8cc13f1191dee52b | ORPH
microblazeel |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/7bf57a087ffeb2b0a444b5b3d754f0aba7d0c20d | ORPH
 powerpc64   |          libnss-3.122          | NOK | https://autobuild.buildroot.org/results/30d8b1f0609650520c6c489a3d962117e2877779 |     
   armeb     |          libnss-3.122          | NOK | https://autobuild.buildroot.org/results/1aa2f357daefa8f9cc40dfabfe1d79cf02b943e8 |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/4c80003d703c9bee78575785c27636302b7b6834 |     
 aarch64_be  | libyuv-4825d9b29eea4dac2460... | NOK | https://autobuild.buildroot.org/results/1253b6c55726e740a28c9409ac0778eeb31928e3 |     
    arc      |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/c4155a5b1c8222b4fa1b6578df3a141145404701 | ORPH
   x86_64    |         linux-6.19.11          | NOK | https://autobuild.buildroot.org/results/57b80b59246488d8caf40e6ccc20a1e9b25f1015 | ORPH
   mips64    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/8af6e91f3f9f6c151335d537d2304993226bfb02 |     
powerpc64le  |      lttng-libust-2.14.0       | NOK | https://autobuild.buildroot.org/results/f15cc0456eef19a2a265227c224a3085943a7a94 |     
   sparc     |          nginx-1.28.1          | NOK | https://autobuild.buildroot.org/results/0fd5f81149c5d6d815634b01d4b0ba8ec9c5cb6d | ORPH
   mipsel    |       ntfs-3g-2022.10.3        | NOK | https://autobuild.buildroot.org/results/046668c9826d27107a89730ee8eaaa79e98617b5 | ORPH
 microblaze  |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/2639a6449875061241e059ab895b60beefd089b2 |     
   s390x     |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/3c212ae33fa0b9a540eaf539ac03518ee030981b |     
    i686     |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/2173371ace513ceea617d69a092fe3e0867eed6f |     
   s390x     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/f7ed60a7c108e532b9e58bdb9a10fcc8ae0df52b |     
   sh4eb     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/30cfcad471472ebbfbb1ab7ef72d05996e64fd14 |     
    m68k     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/db247f2078d42571049811c02714869ec2958876 |     
   x86_64    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/fe674d8c3529f1005704a693063eafbd94ba32b8 |     
    mips     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/d7243e67be70a7ae977961b51b97201f649a1b8f |     
  sparc64    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/6c29b71cebd2e9db4543bb5a7ff4e25c71a6d49a |     
   s390x     |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/4966b7d257a1f23dd464ed6e26dfe33bf214413b |     
   armeb     |        pax-utils-1.3.7         | NOK | https://autobuild.buildroot.org/results/f987cc3e6880d288e9a4eceec65003203afaebaf | ORPH
   sparc     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/4263e334d154d6f20fb08a786ba28cb92e1b7473 |     
  aarch64    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/7653fb8c9503a4deed935c5cb5dc0777b9d432e4 |     
   s390x     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/f19f8ee7335618f2ebc477646c91681206b3ba18 |     
   xtensa    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/355686a8974ef9c4876b468607af8915afcf8385 |     
    arm      |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/78ec6f14276ce398380d52de22cb729ca4dcc0fe |     
   mipsel    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/c889b610723b2541c3339021076a020f593cc7a8 |     
 powerpc64   |      powerpc-utils-1.3.11      | NOK | https://autobuild.buildroot.org/results/d9ae73671261657c1aca3fdc41bfe034a5e0bb98 | ORPH
  powerpc    |      powerpc-utils-1.3.11      | NOK | https://autobuild.buildroot.org/results/69617ba6cdb51e5f177abdb3483967b356cf633b | ORPH
 microblaze  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/6005418855308b8ef96719b4e73a94857e3cab79 |     
microblazeel |        python-xlib-0.33        | NOK | https://autobuild.buildroot.org/results/61d7e0547e7b9a8cfa53d6fa2075dd93f7b8af3d |     
   x86_64    |       qbee-agent-2026.10       | NOK | https://autobuild.buildroot.org/results/4195c2c6f31d6dba35b1dafa8c5c85f2f5df306f |     
  sparc64    |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/05d0f3a40e667581eaa920e74848471802cbd775 |     
   s390x     |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/68fa8226c73235a66d5ebf3f02ef141b1676cd14 | ORPH
   s390x     |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/88ec25bd89d8edef7fec7d3faa49ea4fea5dd353 | ORPH
loongarch64  |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/c36113ef55a6230e70417be7931f59e73c6d7f69 | ORPH
  aarch64    |           shim-16.1            | NOK | https://autobuild.buildroot.org/results/075eba7dcb00a3712f7665699d4a176247041369 |     
  aarch64    |           shim-16.1            | NOK | https://autobuild.buildroot.org/results/ccae466288359a130fa75a1c468a6f41d1f92590 |     
powerpc64le  |         suricata-8.0.4         | NOK | https://autobuild.buildroot.org/results/48984ab369d01fae9b53b7b1f51e874bada0619f |     
   s390x     |          swipl-9.2.9           | NOK | https://autobuild.buildroot.org/results/e3742c4cbac8339cfcab66dc6fe35788fa30462c |     
powerpc64le  |         systemd-258.4          | NOK | https://autobuild.buildroot.org/results/9939397561de8d66c70a791df82b7fd476702d68 |     
    mips     |         systemd-258.4          | NOK | https://autobuild.buildroot.org/results/5aeffd60ee9490f197aad69829baa50c04e5414d |     
  sparc64    |         systemd-258.4          | NOK | https://autobuild.buildroot.org/results/559ce3c3b0653e936871d3e3b5875514c28eeb8f |     
    arc      |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/3fcb804b832d8bb3b3936df38f663760e32aa717 |     
   mips64    |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/93646397d44a61004c17dcf610b6783a45a24204 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/a9817336aa2200533a093fbe97b7ffe04ef0cfb6 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/49611561e012330ef65c748d6721ed0feca472a9 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/207afba5624c897047bb7d37fc6e2900c2950510 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/20fa49ff4ba310ed8d605192be6b053917adb973 |     
  riscv64    |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/bc310d2e802f70f685de4b1548be5272e3fe9a17 | ORPH
microblazeel | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/7150d4c80a49ce9da0e20a47ee63a07535df3bad | ORPH
 microblaze  |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/e6532273599a4be474aa69cd476dfc696df22fc7 |     
    mips     |     util-linux-libs-2.41.3     | NOK | https://autobuild.buildroot.org/results/81d82bec364ae908d30f242b5f40837b775f21cd |     
  mips64el   |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/f9283f82f5079826d5dbfd3ad9ff9a0dd88f43c8 | ORPH
microblazeel |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/05bffca6c77db907828c554df60c8bc741921b93 |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

package/linux-headers/linux... | 2 
          host-gcc-final-8.4.0 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
                    php-8.4.17 | 1 
                 sudo-1.9.17p1 | 1 
                       unknown | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |      host-gcc-final-8.4.0      | NOK | https://autobuild.buildroot.org/results/d6c6711cfaf93fdbdbd045a1a32746f3bef8344f |     
    or1k     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/aedfc9c423d1b39c707d3ffc3999d991198c1659 | ORPH
  sparc64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/98fc8523a3155eaa7239e07872c50ab6952a070a |     
 powerpc64   | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/d4627ecacfc135ec6adea7661487f2c626e928dd |     
    sh4      |           php-8.4.17           | NOK | https://autobuild.buildroot.org/results/af984f963cf136acea07e5bca0ad362c8e8abe44 |     
    arc      |         sudo-1.9.17p1          | NOK | https://autobuild.buildroot.org/results/7d98288550a332843962ed4287f6b13e1b28e78d | ORPH
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/b4aecfd3364572daed412b78f1e5ec4c772fce24 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

              libopenssl-3.4.4 | 2 
        ltp-testsuite-20250130 | 2 
          cryptodev-linux-1.13 | 1 
  gobject-introspection-1.82.0 | 1 
                haveged-1.9.19 | 1 
        host-python-lxml-5.3.0 | 1 
                  libbpf-1.5.0 | 1 
          linux-5.10.246-cip66 | 1 
                 openssh-9.9p2 | 1 
                 protobuf-29.3 | 1 
python-remi-2022.7.27-37-g1... | 1 
                     shim-16.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/b93141234135ef2ff8a377f554d327eb790f601b | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/1a8d522dc549e08bdc996b27a199636cf3d7472f | ORPH
 aarch64_be  |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/644b5b8bcb651ed2f86d6f2de7c49d5aa74b2a1c |     
powerpc64le  |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/5997c3b848997a9c89742c3de952d98864cdabbd |     
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/646ffa55b45f591a2ad616fb02ebe09567a3d398 |     
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/5f73095539e49bdf7835054b2c2ed78962604400 | ORPH
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/98275ddbf9d54a3c04913cd39a65d2f2edba821b | ORPH
    m68k     |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/eeead89c62144d5b6967d8a27cc4e61494e23651 | ORPH
microblazeel |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/d89e073c83b95fedf55e043e9717d6bb856c4e7a |     
   arceb     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/5dd5455775143975ccb12d808486f9f09a351420 |     
    mips     |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/b59cea067887634d25de21c9d43db9032a68d668 | ORPH
    m68k     |         protobuf-29.3          | NOK | https://autobuild.buildroot.org/results/913eb57e280b0f772800ad564bf8d8d3fc23657a |     
powerpc64le  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/9d4cf5ac4678e026896310b600b54f741a720df1 |     
    i686     |           shim-16.0            | NOK | https://autobuild.buildroot.org/results/22cf9a1d35b06ed5970ca4b114314bd882c148c5 |     


Gitlab CI results for 2026-04-11
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_aria_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/13837480681 |      
       acmesystems_aria_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/13837480692 |      
    acmesystems_arietta_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/13837480700 |      
    acmesystems_arietta_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/13837480707 |      
                   andes_ae350_45 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13837480730 |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13837480758 |      
             asus_tinker-s_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13837480870 |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/13837480887 |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/13837480900 |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/13837480916 |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/13837480929 |      
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13837481150 |      
                 bananapi_m2_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/13837481159 |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13837481165 |      
                        coolpi_4b | https://gitlab.com/buildroot.org/buildroot/-/jobs/13837481199 | ORPH 
                engicam_px30_core | https://gitlab.com/buildroot.org/buildroot/-/jobs/13837481210 |      
                 hifive_unleashed | https://gitlab.com/buildroot.org/buildroot/-/jobs/13837481298 |      
                 hifive_unmatched | https://gitlab.com/buildroot.org/buildroot/-/jobs/13837481301 | ORPH 
               icnova-a20-adb4006 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13837481310 |      
                       imx8mm-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/13837481366 | ORPH 
                  imx8mn-ddr4-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/13837481413 | ORPH 
                       imx8mp-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/13858934713 | ORPH 
                        imx93-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/13858935273 | ORPH 
                kontron_bl_imx8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/13858936501 |      
              kontron_smarc_sal28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13858936681 |      
               linksprite_pcduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/13858938021 |      
                            nezha | https://gitlab.com/buildroot.org/buildroot/-/jobs/13858944782 |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/13858945321 |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/13858945415 |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/13858945561 |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/13858945689 |      
                  orangepi_5_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/13858949548 |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/13858949654 |      
                     orangepi_one | https://gitlab.com/buildroot.org/buildroot/-/jobs/13858949990 |      
                      orangepi_pc | https://gitlab.com/buildroot.org/buildroot/-/jobs/13858950742 |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13858950361 |      
                 orangepi_pc_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/13858950919 |      
                      orangepi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13858951244 |      
                    orangepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/13858951884 |      
                  orangepi_zero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/13858951485 |      
                   orangepi_zero3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13858951601 |      
               orangepi_zero_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/13858952185 |      
              orangepi_zero_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13858951980 |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13858952708 |      
                  pine64_pinecube | https://gitlab.com/buildroot.org/buildroot/-/jobs/13858952993 |      
            polyhex_debix_model_a | https://gitlab.com/buildroot.org/buildroot/-/jobs/13858953430 | ORPH 
                           rock5b | https://gitlab.com/buildroot.org/buildroot/-/jobs/13875850842 |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/13875853384 |      
                 sipeed_lichee_rv | https://gitlab.com/buildroot.org/buildroot/-/jobs/13875855241 |      
            sipeed_lichee_rv_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/13875856297 |      
               sipeed_licheepi_4a | https://gitlab.com/buildroot.org/buildroot/-/jobs/13875857453 |      
             sipeed_licheepi_nano | https://gitlab.com/buildroot.org/buildroot/-/jobs/13875858157 |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/13875858551 |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/13875866683 |      
                     ti_am62ax_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/13875874929 |      
                     ti_am62px_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/13875875527 |      
                      ti_am64x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/13875876953 |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13875877591 | ORPH 
                           ts5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13875877887 |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13875881959 |      
                zynqmp_kria_kd240 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13875885789 |      
                zynqmp_kria_kr260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13875886219 |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13875886481 |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13875887455 |      
                    zynqmp_zcu104 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13875888310 |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13875888824 |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
