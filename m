Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D581EFF8875
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 03:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57EBC6172A;
	Thu, 30 Apr 2026 03:21:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PG9hiA1emamH; Thu, 30 Apr 2026 03:21:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECEC86174E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777519318;
	bh=rP9GRZREdxGldtumt70HuFfp2ugKKKjYjTK765KcAug=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aoOR7sl/TMSmU8Hn4tyQo75/TXswiAvQmaRJdre77RX9TRumXpPfaxsjM/D3e+N4O
	 y0My0RX6jcx8YLe7gBnNSEGxrGs3ZYIepcQ+7bgkuc9c8qxpnraeed0C0BbRl3p8LT
	 OI0AkkPC1mG8MVC+UZmAE+E7I8lesYrfQ18fD3u1BDZN5aj3x5+8O4Z5UCIA2Lz0yB
	 suEJFT0COBA2RJL+eHbUcAFTEssC9XztTTPHCX5aI5UVVuPr/CvEYc911VuP+gtgzw
	 Rb3bpdA/qrRv4rUW+IZzs4nQZY5XwMyXuXY0G/OmVaBwWYNWGYoOazttq8mRxsDAMo
	 3OKtNu2dhBTJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECEC86174E;
	Thu, 30 Apr 2026 03:21:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7965918E
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 03:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AF2342307
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 03:21:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bFlHCCcaKBZl for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 03:21:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ADB73422EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADB73422EA
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ADB73422EA
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 03:21:54 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso2658635e9.3
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 20:21:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777519313; x=1778124113;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cC/TK5WoL268gNxEhjp2sR/o4aodoRAmic7vckQjuIk=;
 b=qN5YVhCThr4WD3snZUDN2NMaperF4qRW3TnagGQ0Ta+CEezEpOlIMNGmLRbE6UfE37
 IoAii9L8I5mQvkfIFhOakrvGpDrO6P2vsZKCMG6KS/M5wb1JDX/fz3NfPyhKBd8z5NWd
 Tx+OUfRkYL9CLTY8CebBDTaUiFGUKL7UQIUFF1ovsVXKvbmHi8dEbZhGM4gwlXcEExy8
 MLEnA7UvxC7RSnDDgSO+c1TGYTdSCRUB/lA8bjvYBq+R/cEigEp7DQr7hSGXJ+KZGNNg
 NWcow3zRetLiLtAjPXZeNQeazCJe7cnW1Uz56us924U1/2rLxRCDo6cwrI5CE+fN34fa
 PU6A==
X-Gm-Message-State: AOJu0YwXPkeQdfG2d1WXXNQfV/whYDnhdCfutqRBcVYI2u/7z0/p6DbA
 UarFbca4jkE54YQtIZdMnCqhdrZs11F+dEppUsEfRLqyMTyg3tWdQ4PQttBz58xU
X-Gm-Gg: AeBDievVBMJXcgrmCBKKycZFO48uuQ72w8iPtlquTy3W8hTj7Tmuoys5fp9L1k1ppqN
 S7ixzE2V7mroJ+raPz9mL2YgFtyxp5I56woduRbo1vaxZjJrYqSIBKEo4vEpPr3nxXzbvDn4Pot
 wwcovH7TXvaWqInalJxyuRbiN1kx4XxbUKqffHNTAaEdzRX/jYphhO6OakZPwtcfC52RE6Ejk2S
 Gi+oTv/WPQgcXeWLWqGpO4qJNo3dZEsL8iQl+SSyX4jFllPY+QCn9vvasepBcFDPy6A+bK3EbRL
 KL2MIqQ7HbOARJDgtOLE5unsFISHgd60BQYUOyy42VLIeFDsbyL9qaEV+u+E6a7jmK5cHddK9J2
 1u5A++fWc9JJwd/vK1kxBpbXlHsxsr4NaXWUTAaTQAQJObXxmURsZtlMK5zYZ5xN17ce4KZDnMZ
 ccX2sNpc8FPoYurrFcAOBiaAnox9hcLFfUYSnsRsd0
X-Received: by 2002:a05:600c:828a:b0:487:219e:42d with SMTP id
 5b1f17b1804b1-48a83d6c250mr17735495e9.11.1777519312432; 
 Wed, 29 Apr 2026 20:21:52 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a82301b7bsm39320345e9.11.2026.04.29.20.21.51
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2026 20:21:52 -0700 (PDT)
Message-ID: <69f2cad0.7b0a0220.68f7e.7cbb@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 30 Apr 2026 03:21:51 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777519313; x=1778124113; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=cC/TK5WoL268gNxEhjp2sR/o4aodoRAmic7vckQjuIk=;
 b=Y7wQQMCXCPH3rOmol2S3PIzYTZQfJo6Xi51pJIwYILOshcxvjuAdQ4kUZ4ldpXEyfE
 wxwjCh340vCmNyi+2o5p1jnRYP4O/ePs7R6CfVNFPJ7CecANHlG+TkgvJRoPC76Y2ni4
 4iQn8Y6UVwSVj7IIhLORrcGPb4bu09URBjyAAuYqMubmtV62mWrJ8IfkJlqK0BPPnS3l
 fmGRRebPdhssyhZy91fsw/NXqmxlMHpkACmRXffwH3xbA2V4cHcLkdNzDxGROfI2EuyL
 WBnNCZeSIGff48kvBr3Vs+g8L3coqzECCDixdK4T3r2XdvkOC0E2vh1HWoc3ySy8kUbA
 6MvQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Y7wQQMCX
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-04-29
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

Autobuild statistics for 2026-04-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 12  | 13  |  0  | 25  |
  2026.02.x  |  4  |  9  |  0  | 13  |
    master   | 42  | 84  |  2  | 128 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 6 
glibc-2.43-17-gdd9945c0ba40... | 5 
                   perl-5.42.2 | 4 
             util-linux-2.41.4 | 4 
  gobject-introspection-1.84.0 | 3 
             dahdi-linux-3.3.0 | 2 
                   dante-1.4.4 | 2 
                      fio-3.41 | 2 
                 gnupg2-2.5.19 | 2 
                  iozone-3.508 | 2 
             libgphoto2-2.5.33 | 2 
                libnss-3.123.1 | 2 
                   linux-7.0.2 | 2 
                  ntp-4.2.8p18 | 2 
odhcp6c-f19dd37fb467c9cf10c... | 2 
      passt-2025_06_11.0293c6f | 2 
phidgetwebservice-2.1.9.201... | 2 
uhttpd-15346de8d3ba42200249... | 2 
                  cairo-1.18.4 | 1 
firmware-utils-c42a3bc53da8... | 1 
                     grep-3.12 | 1 
              host-guile-3.0.9 | 1 
                     host-rust | 1 
                 lcdproc-0.5.9 | 1 
                  libbpf-1.6.2 | 1 
                  libnfs-6.0.2 | 1 
              libopenssl-3.6.2 | 1 
            libxkbcommon-1.9.2 | 1 
                 libzlib-1.3.2 | 1 
                 linux-headers | 1 
               linux-pam-1.7.2 | 1 
            live555-2025.10.13 | 1 
        ltp-testsuite-20260130 | 1 
           lttng-libust-2.14.0 | 1 
            minizip-zlib-1.3.1 | 1 
                       mrp-1.2 | 1 
                    ne10-1.2.1 | 1 
                  netsurf-3.10 | 1 
               nushell-0.108.0 | 1 
           oath-toolkit-2.6.14 | 1 
                    olsr-0.9.8 | 1 
   openvmtools-11.3.5-18557794 | 1 
                    opus-1.6.1 | 1 
                 protobuf-34.1 | 1 
                    sbctl-0.18 | 1 
      shadowsocks-libev-v3.3.6 | 1 
                 sqlite-3.53.0 | 1 
              strongswan-6.0.5 | 1 
             subversion-1.14.5 | 1 
                 systemd-258.7 | 1 
           uboot-tools-2026.01 | 1 
ulog-0389d243352255f6182326... | 1 
          usb_modeswitch-2.6.2 | 1 
ustream-ssl-5a81c108d20e247... | 1 
        util-linux-libs-2.41.4 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/0909add1aaf2e88cd4ca8e28fb32da1470b6c749 |     
  powerpc    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/157cc265e2ab1f0629fff09c1600a5d9c09365c9 | ORPH
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b9515693d9380bff4fbccdec71fb31f2c00ddbf0 | ORPH
   x86_64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/8b7c3345e0ee75d3072c98ec31e2310dd531f970 | ORPH
  mips64el   |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/9f49b2d6f6e5c1d7ca3d367d9d32050ca68f6096 | ORPH
  powerpc    |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/4d16f2cb3e7b255d3bbe9dcafb94812e138ca43c |     
    m68k     |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/a5f5109ec3488ee1626059d9120ba21bb2aa6a04 |     
 aarch64_be  | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/5f15892fbe9d611236710f2bb1ebe16b2748f2bd |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/3fd367ee777c02276d2b3f9676d2849d883db6ca |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/efae377d6d42cb8cb5c7a62c59d3fdea7d2deb1b |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/9a15ed0be713d137b5b48a2d5e4e58d214f99858 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/9b21c68f16fa575e20d49b36db5ee78485e90a36 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/da330a1c83cf863501b9a0f4e7531b5697208684 |     
  aarch64    |         gnupg2-2.5.19          | NOK | https://autobuild.buildroot.org/results/130c258aed6abee5867c0ffcf8a8392224e45400 |     
    i686     |         gnupg2-2.5.19          | NOK | https://autobuild.buildroot.org/results/a8f7e29651dd07a797858c1c3f8d76532ca306de |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/2b4171340d33da782e8179c3ab9c660784155212 | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/1a9966c7a0215417f9545f2ebb61387953e96034 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/9ed4579b23e8be529c85be14fafbcde15767b501 | ORPH
   mipsel    |           grep-3.12            | NOK | https://autobuild.buildroot.org/results/fbd103b055464c2b365e7efa5d2b409efd06bf7c |     
   x86_64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/c24fadb031fc56ffd02aed2bfb3298788924217e |     
 powerpc64   |           host-rust            | TIM | https://autobuild.buildroot.org/results/b3f527cc7d16f64541b3a11e0997a134afc4a2b7 |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/9d75c90b63a52d234fe409a659ff47b2b8cb179e |     
microblazeel |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/909b49a5bd56e1b6262dcf75314b7c756e972218 |     
 microblaze  |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/c8bb2e533c0401ef03929555cf2aebe619fd4662 | ORPH
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/5c8179e224f3f06d781a533298acaade61cb19ed |     
    arc      |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/d836ac487fd3ae5e75f5f24f24c19bec80f70238 |     
    arm      |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/de767aa902ad2adda2ad0c54e6212e2f38cf8b0c |     
   mipsel    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/6627409593c3694ba5e1d03c75b00d5d001ad03b | ORPH
 aarch64_be  |         libnss-3.123.1         | NOK | https://autobuild.buildroot.org/results/6a0929cbefca42ac3cd055b8abcb7a93471b29f9 |     
   mips64    |         libnss-3.123.1         | NOK | https://autobuild.buildroot.org/results/14fea70ccd5e2a25809c73c28df62d9a7b498dcc |     
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/caa778a0845753ad31cadb58b56bd7a21e8150c8 | ORPH
  riscv32    |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/e32832f220a80dd8cf2a2e1553a35584184bcfad |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/b6c21ef0f48310cd3d3aaa771ab7286119d1d453 | ORPH
   armeb     |          linux-7.0.2           | NOK | https://autobuild.buildroot.org/results/7d65dfc2386b375283e80509745769801da2f67d | ORPH
    sh4a     |          linux-7.0.2           | NOK | https://autobuild.buildroot.org/results/3550f98f91701637dc706993a8be84a9e501c4bf | ORPH
loongarch64  |         linux-headers          | TIM | https://autobuild.buildroot.org/results/e146e69640286b0d8afe78a45224001daecbdec1 |     
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/88a223e9f4e3e6deae3b514ac88d6423f36eb66e | ORPH
    arc      |       live555-2025.10.13       | NOK | https://autobuild.buildroot.org/results/a511da415aa1d7914b52797136741ec8f67892f8 | ORPH
   xtensa    |     ltp-testsuite-20260130     | NOK | https://autobuild.buildroot.org/results/14d1c099096042f2258a7b1f70b1c207861d0663 |     
   mipsel    |      lttng-libust-2.14.0       | NOK | https://autobuild.buildroot.org/results/da25ef831105524a2e41d127aa2658c32d1cbd23 |     
   armeb     |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/1bbada9ff292475430f15a9c4c42b2a6ce4673c6 |     
powerpc64le  |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/d0ceecaf0cc29021f96cd8268751f3bdc84131f0 |     
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/1ba6200a47bc154808dae09ac87176be1210a1b8 |     
    m68k     |          netsurf-3.10          | NOK | https://autobuild.buildroot.org/results/1cc556f1dac5a71eaacf856f0e8a0b200673ce9e | ORPH
    sh4a     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/b9548ade4ecdee5129ed3db80994e39a1e4fb7c3 |     
 powerpc64   |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/23dec0be6de548ee62acece03c6587846260495d |     
powerpc64le  |        nushell-0.108.0         | NOK | https://autobuild.buildroot.org/results/34a3dc74c7a22911a65d8cb1563e4ef7631c12ec | ORPH
    mips     |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/35a0a81cd6ee05e8325091f235b53cecb2490716 |     
 aarch64_be  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/e351b48526cfa1431c7ccb783eae460b67e17f51 |     
   s390x     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/6032d1f6518d3417aea47b8acec9e1c3b36f25d1 |     
    or1k     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/328a9288279f975da52455138b7b53bdc89c70bb | ORPH
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/d3088e3482836008eea7641a25198f9e964c6e45 |     
   armeb     |           opus-1.6.1           | NOK | https://autobuild.buildroot.org/results/31e93f71b6d7f9f75045c81851291ca08e99ed15 |     
   sparc     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/e9e52d0ec5392eda5bf67687518a9b7efc0d8746 | ORPH
   mips64    |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/71ee394bae4f081a40ec1046621a7f1607222bae | ORPH
    arc      |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/3bafd2fef0d5b5e33137df2679313deda2c04a9f |     
loongarch64  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/d92d7d159b03495367942b6f66e595870fb58b46 |     
   sparc     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/0a2df579b1812f94cd68e26a9fa25526e1b47f30 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/c9973737bfb3264f5869a2fbc61272cd173de7f6 |     
  mips64el   | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/b2ad710aa85c2663503ad10486f722ce531d8cc2 |     
loongarch64  | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/06be1b40ecb32f4bbf41c84448aff3bc8981f048 |     
    m68k     |         protobuf-34.1          | NOK | https://autobuild.buildroot.org/results/8a69025885a8f57c95187989a708947140589c85 |     
    arm      |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/f9e4a4760cf39a246cfb7dca8143260130fd29a3 | ORPH
powerpc64le  |    shadowsocks-libev-v3.3.6    | NOK | https://autobuild.buildroot.org/results/1c8a3d04db8c05dbe038e03bfaa7da0597a08549 | ORPH
    m68k     |         sqlite-3.53.0          | NOK | https://autobuild.buildroot.org/results/68698ba1cd678b35cb74f7b793785a6efa9a83e4 |     
    mips     |        strongswan-6.0.5        | NOK | https://autobuild.buildroot.org/results/ddc6a7336d2095c3a4ad31b6670173c1ccfacb37 |     
  sparc64    |       subversion-1.14.5        | NOK | https://autobuild.buildroot.org/results/14ba2280a1d057d702234d3574313852e97e34c2 | ORPH
   sh4eb     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/5b6404ad9de9bcf71283598f76e2597c88fb1133 |     
loongarch64  |      uboot-tools-2026.01       | NOK | https://autobuild.buildroot.org/results/17ab014d85d5f3a5b88be77ed9824be291e7600a | ORPH
    or1k     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/a4341d5eb8992d3e38717c1e637c463310f364e4 | ORPH
  sparc64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/61aa21c87b859cf816a2a53478c5a4d0bc193c61 | ORPH
  powerpc    | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/1678cf5b37f446b0c185ad0ab3d8cec9e250fb83 |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/1c4e1b0613d9cc1a94459ca01519ed341866a46b |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/ae1f5dfc6c58b5ee70b03faa7de33f289d1e876e |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/c429e832cbd5d77f311f9295a3ae6aca33bc5e89 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/9ababd809687728d63a9aa3af0d235f4d3df9755 |     
    hppa     |            unknown             | NOK | https://autobuild.buildroot.org/results/cf768c1f683ae0f0e346dc44d44278cfa00feece |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/693864dc136c4f2f664e64271be7ee80c21ac7fc |     
   sparc     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/ae17f1a42ba2d81ca2e7161b214539924921804b | ORPH
powerpc64le  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/fc41652e58d956a9b3cbd82a352da046be080183 | ORPH
    i586     |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/72bb63e6d29f0e8350f6b1bd980ce677cd1ae0ec |     
    m68k     |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/494c7feebb49a577920abfb1cd8fe8c9c5b1ca50 |     
  riscv32    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/66082fb4b3fb034d16d16854f582b1ce0e49dafe |     
    sh4a     |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/85646ddfda101705d80624e0ef3257de79c60682 |     
    m68k     |     util-linux-libs-2.41.4     | NOK | https://autobuild.buildroot.org/results/9645be99aa10c33ecf3f5a3b92458ae988cb09fc |     
   xtensa    |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/341622787fbbbecbe39d7a0d48d34b49b984d1c6 |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                    dpdk-25.11 | 1 
                easydbus-0.1.0 | 1 
              host-rust-1.88.0 | 1 
libdill-32d0e8b733416208e04... | 1 
                   libks-2.0.5 | 1 
           lttng-libust-2.14.0 | 1 
            minizip-zlib-1.3.1 | 1 
               tcf-agent-1.8.0 | 1 
                tpm2-tss-4.1.3 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |           dpdk-25.11           | NOK | https://autobuild.buildroot.org/results/0813392af4d944dde54c7dfa2b13d4b481c9eb2b |     
    mips     |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/7853c9fc005ad0de6d80716072c06daeceae4f58 |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/8b9547154d164cc231ba20adc1c9472319d63929 |     
    arm      | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/860b81a9aa1ed81ef4886d3fae582c87880cf7f8 |     
    sh4      |          libks-2.0.5           | NOK | https://autobuild.buildroot.org/results/066979c03083f96ed2a22f53bb8639e781e4db62 | ORPH
    arm      |      lttng-libust-2.14.0       | NOK | https://autobuild.buildroot.org/results/08f979a8653ddf73738900cc80f54b23d7f8bdf6 |     
 microblaze  |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/2f2bd97dd2174ebe2da385031ad010c1533c7804 |     
   x86_64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/551eddfb4cd33038c0ce3b3c17353b642bafc3e8 |     
 microblaze  |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/47b731e6be4b826414b93f2ddab84189239db272 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           oath-toolkit-2.6.12 | 3 
        host-python-lxml-5.3.0 | 2 
                   dante-1.4.4 | 1 
  gobject-introspection-1.82.0 | 1 
                libdrm-2.4.124 | 1 
        ltp-testsuite-20250130 | 1 
package/linux-headers/linux... | 1 
package/wine/wine.mk:347: w... | 1 
                   perl-5.40.4 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/71b4d976cd9702114360c1136d4580261fdfaa8b | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/6ba1f79f6a2fdc195368f92b84938eb3eae8065a | ORPH
   s390x     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/a398d3c116719fdb3f874a0cf853ba4c4ea0b46c |     
    arc      |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/a5927e7a4350d3d03dd5e38dafbee9f3360d7d84 |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/88f6590d19e141f2f4801b4e7faec98eacdc1b0e |     
    arc      |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/b94b25471e875e60ab1cb6da5d5615a715abd8fc |     
   x86_64    |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/9cdfcd60de411347a3f51c736defdff04e39eb77 |     
    mips     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/732ba6f68a08e6814d27562c83cbb375b7568553 |     
   mips64    |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/8f0dd144a02c219f92c67568634b2466ee9e12b2 |     
   arceb     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/3d1ce5ff5ef0475cfb602c54fecaeebd33058236 |     
    i686     | package/wine/wine.mk:347: w... | NOK | https://autobuild.buildroot.org/results/924244943062f0522579b4c7896cf1f5d00a199a |     
   sparc     |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/704c0aec0ffbf797fa1c7210c7908e2d78bdfff4 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/0a03a3a388e4b84929b45586983e6a44e23bda42 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
