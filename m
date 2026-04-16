Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7880FF433DD
	for <buildroot@archiver.kernel.org>; Thu, 16 Apr 2026 03:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF5A1606BB;
	Thu, 16 Apr 2026 03:26:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zDETFTPWDC37; Thu, 16 Apr 2026 03:26:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB4126069D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776310000;
	bh=4VWJgqSEt5ufiIDFyOg+fNdIuVqomRMptWinYxf4aHk=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZZiNOMWeOqWEQol1WMRav2xNWLDP5LlpEZ7AGhLLVfp8l0jgMshKb6JmmLdD4bBRt
	 LPWVDYZdKNa8XZG7S0NfxspVmXX1+A6a0dpyI2GPxdqxN4rtv9PYyVunjNsd6PO2JC
	 GqkV35Ml8aWZz3Aik/4frYuKImFjjXRry/hAQfT1XezP0xYg62i/tHFvtiMniOVK/z
	 TUjs+ng9wvgrkr7QzM1KojIxhgAJuE3qnHZH8HsOEkxWWowOlcYIDxknfRCFnHcAaK
	 vQ1wr0yWGNiAHA65Y2I5YMbRUvB+plB5AWbroabkuy4kPtFftLPuVvt8mzH8STGOcf
	 y4cNqhgZVOWbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB4126069D;
	Thu, 16 Apr 2026 03:26:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C46E8127
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 03:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B55E880761
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 03:26:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MeCQlEcNF8V0 for <buildroot@buildroot.org>;
 Thu, 16 Apr 2026 03:26:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4AB1D8075F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AB1D8075F
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4AB1D8075F
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 03:26:38 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-488c2690057so75310695e9.0
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 20:26:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776309996; x=1776914796;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kCB+N8iPmHzo5nGlwPkXPSTCO4wYMCvxsX4Z5MxZRoI=;
 b=IlY4zwYmBn/a0N3hpC7FRCHjR0UjyO7vVI8Thg5DzlMMsb/b14xIXNQMo2EPSqpRCt
 Qw+yQXydUN+GkGmGdEgQHpmqIp45nx92TsOHuyiL420Dyw9SBxtwpkhy7/8qxlwsQSG/
 9KSxZZAT6kBJG+84m0ttrHgGafdu+y3q9o+C0qShhPdkpH06Y1zg+gr3G3k55kJrZ9D7
 XZ74JoCmmYNxpiU/upHzLxPnDPJJ0GqTgbpLyvwm1QTKfgVDLMdW5zhgNxYDeABHd2u+
 7vrgCieujG2V0A/UvohbhTb8nygw+NjwAExyYXmC5vHDBA9yp5h/Uh3Qmn2ZXrn9V5P3
 /rJQ==
X-Gm-Message-State: AOJu0YwH08/zMcGpF1MYRjxGOH6wESkah4dpNkhud3aCHwrCSpkaPY19
 zkeftusENWp7RFxeVeubyFbHzbcgVBzBCmhNZh0UhNQw4VumtMWLFI5HTYCWHIgv
X-Gm-Gg: AeBDies6L8R+EHUqA7fyhQ48LzQ57hNIyI9O1enTCDwqGOCWR3k+UWplfFYSKG/b64k
 NMbzUosHw4KaLnLjaWkXNbkygR1Qjzpkb+wudeIXzH35P7fcRliCKdApNh78TYGXDS7rarVzNLe
 sebr7+UhYFV/5l2xKCZ38+wA1qdb3003abJSQVkUnfewGR5mf0Ktx1wzgA8JhVTGpmUQVRxo+eg
 QdfvHAJZ5/sbR2oPRQ9QnT3pW9g8BWzF5YRozW3+Dz/EpDkpNlCmya91W0wlqWXqw3+dVT3bdO7
 TkM8wpZQx3Hs4tlRrN3s1xftouCTs2PaS0sbnKqHDGIjwVT3vtcjLH4j4UCpMdWbKGWgniVcH2H
 DaHmUFGGB2QFBGwfWmvbHl4b1NQLvsNP7eWYNEGEmmQulYN3V8X6raFPMoGzboBdv7MtCUj0xwL
 iKhS2Ce62yfPza8Lz1aH4gtiQmd21tBaXmPWr8CQAW
X-Received: by 2002:a05:600c:5249:b0:488:c40b:c8bf with SMTP id
 5b1f17b1804b1-488d680577dmr321355125e9.2.1776309995837; 
 Wed, 15 Apr 2026 20:26:35 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488f0e9a770sm33626835e9.19.2026.04.15.20.26.35
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2026 20:26:35 -0700 (PDT)
Message-ID: <69e056eb.050a0220.3491fa.5ddf@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 16 Apr 2026 03:26:35 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776309996; x=1776914796; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=kCB+N8iPmHzo5nGlwPkXPSTCO4wYMCvxsX4Z5MxZRoI=;
 b=Swp9U+ods1hhDOFBZeoJTOYyWlH3ZQxbB3LeImt+pZr55+HKouh+2IjEC9asFyJ9L9
 kRHPviXP5WZ6iqTomxyHv5M/98pm1YVwSHzL/j85D0plltzRQ7hvDZcLVk+MpoUpPQxl
 A5Q3rrWfOFTo6/Lf2MeTkvX3vd3jf2OMIRJE3zfi5R9M+r8JUMJnQfmGNySaC2+4MEXF
 AduzFB+pKiwfNRirK8KFXcXEiE1ND9rbNOluHz+vAHBGxaczDqxExh8Jkf0teReXYjDI
 pkkpfOHg+R3cNwvfFXD8Ms6My8iTjP1XmSV8eGcKp9nelxVGYKyZ7u/98xwAZOE0Ccud
 XXxg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Swp9U+od
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-04-15
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

Autobuild statistics for 2026-04-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  |  6  |  0  |  9  |
  2025.11.x  |  3  |  3  |  0  |  6  |
    master   | 36  | 58  |  1  | 95  |

Classification of failures by reason for master
-----------------------------------------------

                flashrom-1.7.0 | 4 
glibc-2.43-17-gdd9945c0ba40... | 4 
             dahdi-linux-3.3.0 | 3 
  gobject-introspection-1.84.0 | 3 
            host-protobuf-34.1 | 3 
odhcp6c-f19dd37fb467c9cf10c... | 3 
              tailscale-1.78.1 | 3 
                       unknown | 3 
            igd2-for-linux-2.2 | 2 
                  iozone-3.508 | 2 
                  libnfs-6.0.2 | 2 
                     linux-7.0 | 2 
phidgetwebservice-2.1.9.201... | 2 
                  cairo-1.18.4 | 1 
                  ethtool-6.19 | 1 
                    ficl-4.1.0 | 1 
firmware-utils-c42a3bc53da8... | 1 
            gdk-pixbuf-2.42.12 | 1 
                 host-gdb-15.2 | 1 
              host-guile-3.0.9 | 1 
              host-rust-1.94.1 | 1 
libdill-32d0e8b733416208e04... | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
         libhdhomerun-20210624 | 1 
                libnss-3.122.1 | 1 
              libopenssl-3.6.2 | 1 
                libressl-3.9.2 | 1 
                 libzlib-1.3.2 | 1 
     linux-5.10.246-cip66-rt29 | 1 
                linux-firmware | 1 
                 nettle-3.10.2 | 1 
                pipewire-1.2.8 | 1 
           python-html5lib-1.1 | 1 
            python-numpy-2.4.0 | 1 
                 rtptools-1.22 | 1 
      shadowsocks-libev-v3.3.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/1c10d97a9a54afdf85fcf6285856ab29a8978b40 |     
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/d8b33ba7141283da0ee391774a63c7ac096bd892 | ORPH
    sh4      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/de68c0434d4a6738c752366b5d50f37374b03640 | ORPH
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/862765a52109d638865a137f4689fd62b7bdda41 | ORPH
   sh4eb     |          ethtool-6.19          | NOK | https://autobuild.buildroot.org/results/5bb088220c8029df4f537ccea5c82184c4ed9815 |     
    arc      |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/53bea966ad7396add10ab4eae06336675bd4ab9d |     
    arc      | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/59247f17b18b0019314a8ae0c0d62df3830abad6 |     
   sparc     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/574f17b8d1f38dd429a5e4749550b3bcef61df9c |     
    mips     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/899427bb01aa869706fb114773cb5f3d891cb23c |     
 aarch64_be  |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/37920f93caeda78e89ccc8c08603680af7f2187b |     
   mips64    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/88c67953c60dd4c7e5dbf6a00913b9056998c1b3 |     
  powerpc    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/5440bc094223809e595cf28e11a20090cc1160df | ORPH
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/1c0e754049a3d467701ff1c5c0c04f5ec365baef |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/c673d1135e84a0a2f3be2581e4911e2ac5edfbca |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/00a6fa12106f0303d65989964629087ad3a46b0a |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/cc0a37c94170bf2ff3d2260ec6d468080a7f86e0 |     
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/a3a0dec2af04d0004d189b718dce41d44838b423 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/f6b754a3ce307a22bd462fc1e763e8afcbcaaf74 | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/879564728acd3656dc9b8ac0b3c78072146a37b3 | ORPH
   mips64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/2b21cffadc4079e023575e17dff9daf17274b4af | ORPH
  mips64el   |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/2fb1bd4b21be1d8af8246add593662879958c9d3 |     
    sh4      |       host-protobuf-34.1       | NOK | https://autobuild.buildroot.org/results/909f7a14c7d831db70bd0a7679b0f0d923b19059 |     
  sparc64    |       host-protobuf-34.1       | NOK | https://autobuild.buildroot.org/results/4fa2b91ea6e3ae5c69a44ba6912ef748fb4e1f9a |     
    arm      |       host-protobuf-34.1       | NOK | https://autobuild.buildroot.org/results/15077969c3ef60b007e2da516bf9c6127afcca23 |     
  aarch64    |        host-rust-1.94.1        | NOK | https://autobuild.buildroot.org/results/1aa5087255ae0b1d1d40d6c02202bff734deeec6 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/ec3c9b493943f93b822cceb64e27c4b1d575f5ca |     
    m68k     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/45d676045d5cf2e3286d132a3202007db9ac9985 |     
    arc      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/26540da4395c98f26d4258361c26178a60410041 |     
  aarch64    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/e9a381707fb6a88b486774eed380bbe48d031ebb |     
loongarch64  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/0f1c4cb77b35afb183cdbb2b7c2527032ded3c29 |     
   armeb     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/06f3343c43fa088a40f777f80fca142c413d0950 | ORPH
   mipsel    |     libhdhomerun-20210624      | NOK | https://autobuild.buildroot.org/results/699d9e0cbbe22976058b8553dd7e7ea7f76f5860 |     
  mips64el   |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/83990f480ef46d4e23ec8fc2beb45c3b854f4cad | ORPH
microblazeel |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/2e3c7e7b5552160a65ffc96e721ca3050d592b5c | ORPH
   armeb     |         libnss-3.122.1         | NOK | https://autobuild.buildroot.org/results/a79bdd04db8586310e7bc4575805d1d49233bf93 |     
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/85cf2b4c50bde02731960580368e080465b38a4f | ORPH
   armeb     |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/88c3bd7ec01b36ba34813d6215df402829db8be2 | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/859de293d05404bdf065f46f9135a147d39f1ab1 | ORPH
powerpc64le  |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/6b1ef25e3694604dea47be57d1edde4fcfc3ddd0 | ORPH
   armeb     |           linux-7.0            | NOK | https://autobuild.buildroot.org/results/e4c2fab660a8b9ec5b5b0e56775a8c99d0b37130 | ORPH
    i686     |           linux-7.0            | NOK | https://autobuild.buildroot.org/results/93fa204360c7c06b964348aa3cb04386162cfb75 | ORPH
   s390x     |         linux-firmware         | TIM | https://autobuild.buildroot.org/results/455bb459bce09d2323594db85866e26e86617f5f |     
  aarch64    |         nettle-3.10.2          | NOK | https://autobuild.buildroot.org/results/f719396fd5d19488dde79b13c0240abc4a3295fa | ORPH
loongarch64  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/fb2a4c14bc22650b596736255daa447b84c17190 |     
    arm      | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/f61bfc4203893be14c5352093e917b2bfddc19bb |     
    hppa     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/78e1a8af254dc3ce3b0fdac6b9d90e610a0d6ad8 |     
    i686     | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/23af1f149e23203c020b5526560ed84b1d34edcf |     
    arc      | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/910a5c12f32536ffa26b071552c3699be2ffc8e8 |     
    i686     |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/45f17667480ecf7547b57ec092bfa8d46dee7a26 |     
    or1k     |      python-html5lib-1.1       | NOK | https://autobuild.buildroot.org/results/46c76fcb19ec0df36bf0413af52628d39bf5dd9e |     
   mipsel    |       python-numpy-2.4.0       | NOK | https://autobuild.buildroot.org/results/dc151fd4cbc00f63971fa806a948dbb913947eca |     
   sh4eb     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/1e4ae1710314e9f78eab6986db2b3a6a2cab0a2a | ORPH
   armeb     |    shadowsocks-libev-v3.3.6    | NOK | https://autobuild.buildroot.org/results/ca8c1004df5e3f92cf2f9ea905b37344c002810a | ORPH
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/c072209e13d46d0db8646ba4c5e16cd34eea56fd |     
   x86_64    |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/cba8db3c739394b60e344e152459e4484c97e55a |     
   mips64    |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/d92542c24757a92d5988979abce440a25b5c830f |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/b3825d790fe657d4a34545b6c2ae8644dfbf7cf9 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/a166c443451fc44fd4d22c8ca0326ce30baf2cba |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/50d48af9c12eaaca7ff474505463bb31dc3cffb5 |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                   dante-1.4.4 | 1 
               harfbuzz-12.2.0 | 1 
               soapy-sdr-0.8.1 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
loongarch64  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/abc60a14d448983a8ab4716b7d7f1e3bf55e732b | ORPH
    or1k     |        harfbuzz-12.2.0         | NOK | https://autobuild.buildroot.org/results/84c84b44c272373932bc155e61434fb06a76a248 |     
    m68k     |        soapy-sdr-0.8.1         | NOK | https://autobuild.buildroot.org/results/59915684ac889dd20e10eb3717975663429122fa | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                    ficl-4.1.0 | 2 
             cni-plugins-1.3.0 | 1 
             libopenh264-2.5.1 | 1 
                libsoup3-3.6.6 | 1 
       riemann-c-client-1.10.5 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |       cni-plugins-1.3.0        | NOK | https://autobuild.buildroot.org/results/7ec3c9a98a50420bdfb7d0791453172a88ffae98 |     
    mips     |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/5938d41a3bf3b44004862e73abc7477c46383053 |     
 aarch64_be  |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/230b40580df80d53d91c5a42742abb90b89ea10e |     
   mipsel    |       libopenh264-2.5.1        | NOK | https://autobuild.buildroot.org/results/a1bd5234c7461c17f558c07e4dabf3f52073d35f |     
 microblaze  |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/eddf10256f8c7aec2d6c2bf44fa629bf25d5d931 |     
    i686     |    riemann-c-client-1.10.5     | NOK | https://autobuild.buildroot.org/results/c2fc1d5d87404f30a1e32ae4c87d42fa64427384 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
