Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E296AC55171
	for <buildroot@archiver.kernel.org>; Sun,  2 Aug 2026 03:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA88980D8B;
	Sun,  2 Aug 2026 03:25:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ywriHodKcDN; Sun,  2 Aug 2026 03:25:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E96480D7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785641100;
	bh=1X2ZFe0X+u7hsEjnYDBpmOAT/3/b8KOcrRen8LmEVAs=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=d/jIlRlXpYcbV6xkN+Nvi3Wgd1wkIH1u2P4Y45hrc6RgiEacIPicjHl1PjmoVkv/v
	 X0LIE2fxE00kvGw/YAV4qO9eBOuRSA+eaaovgk+vbLOpRnzClga53qN1SQ+VqH0o6l
	 6XRg9ShKvqLn8XYgY1++LpssQHlxi+DGprmQFaNKN1knnXtZ7hcGuJ0/SeIFxHp/Hm
	 NKmzEPJsAzEcPlx8Jl17QfpMunrzlKHND1NJ+ACs1h9gRTadGNIEl6h2OGTr1Tm5Ow
	 KTFJMRwEQ1ARXP1NkCFdQ8PQyQqrouyqniPvs8deCYj0rfieEeZV12//UTACc32iCE
	 /lVnnIJ+R3EQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E96480D7A;
	Sun,  2 Aug 2026 03:25:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 490CB1389
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 03:24:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F05760635
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 03:24:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QuHJ4JS5qZDe for <buildroot@buildroot.org>;
 Sun,  2 Aug 2026 03:24:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CC1096061E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC1096061E
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CC1096061E
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 03:24:57 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-49558ce01afso7695675e9.1
 for <buildroot@buildroot.org>; Sat, 01 Aug 2026 20:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785641096; x=1786245896;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=hl11QDFuNkBC4unsif3HclRubn1Ju3fWmjnT/tuJMJY=;
 b=cQtiZqkPAuptxG7zVfnPGUOpwRjgryAd7H3OAIbisZi9NzzVudb+nscl8/xBh3DXUS
 7iR87yBmrgLpgJ9aomTGvHfq+mV6ruDvFnC0hQoUG+b+7/ilDEkQ70gB8xIK0Za+Up1p
 ZBf1rQ8UPoQJYfxDu8l4M16/inwvxaGG7pLpFKM6pfqta8InRMr4TxZ6y+9wnY/RY4gs
 ck9uM1yzh77hf0H/3VhOqRJ0GtsT7KRELn3hxdXFhztCLN1XPl86+bXbyYQ9t9XuWyNX
 cSCeLxKODAuVUglCA3Bqwzv5RdQBhODyfVvHNJJnDajP4FZE2v4nPLl7q/9rzqxTdJhY
 zheQ==
X-Gm-Message-State: AOJu0YzrKq1lCm8bX5kyv8u2/IbS8Yb4I0MC6MF5ebFChsWvX2345zkq
 sOqY/OFAivQLnLyI56nBTaZAdpETsJTANsH1UUiEcdeeTWebDPpcjpDsazv2rfXm
X-Gm-Gg: AR+sD11KSf0J5YPcA+1T/iDYZMDFYAGRYm6mvCHMGaAKo7cy/bBJgYPECv2ajUc+Bju
 zPlxwrNaWKoVXZiS3vYg4OdHYIKfGfryXxmU4qmRKn7kgkjyyvtxk1hv8UeR6rVU96UO58HuivW
 y0SBblplGxzMcQafcvHwu/7K17slSORsad5r5TNitbxPULxBWp572QcfpJfF2WOw+sgQTlOhdog
 05JvluMf0RHl9t23S/RcShVfVWUelpxTgU2IRcg3Uvxcf2TiAdyRO5oXqDtNhaisXVtKvHiw/EF
 puNkkSNw62wqDjmestC0F+ZYX8xZBzMkkJUZy65HLdh9U6paA/3rVgShuJ9lt70UbGMyC5yuTxM
 LIwC7Jn5mgFNy3X4FLPWV7Q4zsN+Es++XU0cp34H3JP7zAtEhwSKphFUeCwNhQTzYhscj266gnE
 y12u3NNUhCGFtv0rSytGrArY1LDb6wNjIC6PLlIevI/WiwQQNtkQSqUh7Fh+1mSvA=
X-Received: by 2002:a05:600c:8b14:b0:493:e983:806e with SMTP id
 5b1f17b1804b1-4980c66d8e5mr99086065e9.3.1785641095539; 
 Sat, 01 Aug 2026 20:24:55 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4980819a030sm106912595e9.6.2026.08.01.20.24.54
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Aug 2026 20:24:55 -0700 (PDT)
Message-ID: <6a6eb887.459cdc55.b664.16d2@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 02 Aug 2026 03:24:54 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785641096; x=1786245896; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=hl11QDFuNkBC4unsif3HclRubn1Ju3fWmjnT/tuJMJY=;
 b=e813vV5mB1XuMsqm9kMb3XMzRI/qoZt2ySzBB9BAsKwnIgMDzfUglpTMdBKOudD9ii
 xPYiH0t6OJi3mwr5eWbCxtIEiZJPJ7dmPtEUFk4TZ210wkvqbNBbf64v4sIBjQTfeGRH
 xbIoA0EU3iAMuroSVGPEpqlw+tGlxGPkjOELE4HKGuHxlRiOw/fBwdWR6TgtfeGu6/rK
 xJxKVsq715i/PLKnMIIqEgfjFp2bbu9XksDZyO/4jYnUNqfqKzoxUn+C9iIE/DfEx6bi
 ssAht2xKXDd9EehJD8x1vwcSBKnFye5AWDNRCOzFVa352Ot2HBLVxDEsG08B6Njxa0xG
 2L6A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=e813vV5m
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-08-01
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

Autobuild statistics for 2026-08-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  0  | 11  |  0  | 11  |
  2026.02.x  |  0  |  1  |  0  |  1  |
  2026.05.x  |  2  |  1  |  0  |  3  |
    master   | 28  | 58  |  0  | 86  |

Classification of failures by reason for master
-----------------------------------------------

glibc-2.43-45-gdae425b55420... | 5 
                   perl-5.42.2 | 5 
              jpeg-turbo-3.2.0 | 4 
        edk2-edk2-stable202602 | 3 
  gobject-introspection-1.84.0 | 2 
                   linux-7.1.5 | 2 
   openvmtools-11.3.5-18557794 | 2 
               tcf-agent-1.8.0 | 2 
                   atop-2.13.0 | 1 
                    attr-2.6.0 | 1 
               collectd-5.12.0 | 1 
              containerd-2.0.7 | 1 
                   dante-1.4.4 | 1 
                easydbus-0.1.0 | 1 
                enscript-1.6.6 | 1 
              erlang-26.2.5.15 | 1 
                    grub2-2.14 | 1 
host-am335x-pru-package-5f3... | 1 
            host-binutils-2.44 | 1 
          host-binutils-2.45.1 | 1 
           host-coreutils-9.10 | 1 
       host-gcc-initial-14.4.0 | 1 
              host-rust-1.97.1 | 1 
               host-tcl-8.6.15 | 1 
                host-wine-11.0 | 1 
          host-xfsprogs-6.19.0 | 1 
                 lcdproc-0.5.9 | 1 
      libabseil-cpp-20260107.1 | 1 
libftdi1-v1.6rc1-2-g92d657b... | 1 
libfutils-c326ce0cc2a735438... | 1 
              libopenssl-3.6.3 | 1 
libuci-f3fc0b76040685829191... | 1 
           libzenoh-pico-1.2.1 | 1 
                    lua-ev-1.5 | 1 
                    olsr-0.9.8 | 1 
                  stunnel-5.78 | 1 
                 systemd-258.7 | 1 
           uboot-tools-2026.07 | 1 
                 uclibc-1.0.58 | 1 
                       unknown | 1 
        wireless_tools-30.pre9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/7c28a8bcfd271888b86cdee803f542595958664f |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/ff528a714c5b80caf49ba7de9f2d52fdf36f1bec |     
    i686     |        collectd-5.12.0         | NOK | https://autobuild.buildroot.org/results/64a9471e8b5a7574f3b42360375bcd034ebd911b | ORPH
powerpc64le  |        containerd-2.0.7        | NOK | https://autobuild.buildroot.org/results/507e2f9c28fd834bf0d09a6136754ca7a1600a38 |     
   mips64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/05310016d42a20fe4a99d533211428a1f1e84312 | ORPH
    or1k     |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/7bcb28b68f090518028d54d193a8ac776fb06712 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/c13df3459a693fe47a66ebcda304f00d05c563f5 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/2c7b32ecc098c52f2f319e7ef15f078c4dcc08a1 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/4d469120ac2c7e019d52d1b9c357b2f9214a6704 |     
  mips64el   |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/1490dc1b52b24a9c63882fa07d19c171f8a48d89 | ORPH
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/d835036ba70e87a65d0536f63f3929ff55de8e76 |     
    i686     | glibc-2.43-45-gdae425b55420... | NOK | https://autobuild.buildroot.org/results/487deaaaa178b07063addd26964f8ae78a00c719 |     
    arm      | glibc-2.43-45-gdae425b55420... | NOK | https://autobuild.buildroot.org/results/28159f29e38b0475ae33fe73a9cab04ea3a8835f |     
    i686     | glibc-2.43-45-gdae425b55420... | NOK | https://autobuild.buildroot.org/results/22afc952e0c05648d538d13ea593e5ad8c4c03c7 |     
  mips64el   | glibc-2.43-45-gdae425b55420... | NOK | https://autobuild.buildroot.org/results/fbb79c8464d667a15f1d831241c17fa675c0ff1d |     
powerpc64le  | glibc-2.43-45-gdae425b55420... | NOK | https://autobuild.buildroot.org/results/ba61299c0025a46e72fb3370c564e242a1e98953 |     
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/4fda1229ee325211bea4a185dd08435224402b18 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/6b2e36df1a323ee0d3c3b217ec89b1dd82bd97ae | ORPH
    i686     |           grub2-2.14           | NOK | https://autobuild.buildroot.org/results/cf88bbe9c87764fb3c5b500d29fbe6b6e8c91aff |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/30149ff60ddf0295688e142f9dab3a225077a16a |     
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/212b766d8f31f7a3b7c3a08c86f3b576c2972104 |     
   x86_64    |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/29d659bf89930d061caf0b2f707448690b254a9a |     
    i686     |      host-coreutils-9.10       | NOK | https://autobuild.buildroot.org/results/c5201e668bf24d77697efdad65e972a135198bc6 | ORPH
    i586     |    host-gcc-initial-14.4.0     | NOK | https://autobuild.buildroot.org/results/ac36f0b8741e6fa03311829448aa0670ff9dad5d |     
   x86_64    |        host-rust-1.97.1        | NOK | https://autobuild.buildroot.org/results/4c5965a988e2575cf17bade09b3967f12277bb97 |     
    arm      |        host-tcl-8.6.15         | NOK | https://autobuild.buildroot.org/results/007d94020c7969e7884a9d975cfd8125968fdcb8 | ORPH
    i586     |         host-wine-11.0         | NOK | https://autobuild.buildroot.org/results/19c6a8aac8a3539eab1547954f2640ae5e6d63c4 |     
    i686     |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/969a97438f8d4bb964c0bb23feb050d156f5188b | ORPH
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/5a01e7435724785b94788847b1fe7e4b69ea3abb |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/7a1d667f259a226c912f9e37d117d3686a96cd07 |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/7c320fef33ef9b815fcf6fee5df84fa706520980 |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/be1d5af4b5e9d2d809de25c3a3f9581a62e71f1b |     
    i586     |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/499ffd261a29270dfef984a63a0f1a51622125ed | ORPH
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/1d5c68679202a33b83303e568b4da1ecf5fae825 |     
   mipsel    | libftdi1-v1.6rc1-2-g92d657b... | NOK | https://autobuild.buildroot.org/results/e5e5a5a91859f317f093f235e7a4f9c19e88eec2 |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/a5f0f873f2577284b8919d4830652e36a0cf108a |     
  riscv64    |        libopenssl-3.6.3        | NOK | https://autobuild.buildroot.org/results/3b0e423be2b14e20455ae95ec4ba8de642183af6 | ORPH
  riscv64    | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/d85345814c4418d080c7e8b4e83a8432fcc529b7 |     
    i686     |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/feda60490110c54b3096f2d23908e962f6f52be7 |     
    i686     |          linux-7.1.5           | NOK | https://autobuild.buildroot.org/results/7652cfeabf74510bb271c383d88b7c1d26852e10 | ORPH
    arm      |          linux-7.1.5           | NOK | https://autobuild.buildroot.org/results/8bf684b42cdb7fce85240078e3cc4265d7d03dae | ORPH
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/f9c14a8950901354152b689564265939450251e1 |     
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/8300b2523d4e39ab71aa99fcb0cd17c61f8e7a6b | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/3d5b80f0c9eb448b80bf8c3753f2a8ec6a11f11f |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/dd65c343bd460aebcc18cab76d4485dae227b191 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/795307329d80abba341dbf9211ff9cb8868cb617 |     
  riscv64    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/6dd4f7e2a93cf23084f3d84319b9ec3b4941196f |     
microblazeel |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/e75db383d97bcfbd8064a00457dde3c147ac4997 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/6fe7c626038e2287a30b4fa52a38b0a83c199e51 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/7a4afeab6cd24f403b08a4e58b4e153f4c9dd4a2 |     
    i686     |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/59cf1463af46bdd6549806923581a7e5ca80b814 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/278fdd113a8779fb49be1fd8041619b5653d2186 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/e140a1cf7a40ceaa90563e35f99c1358d1a6a121 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/8d8b5907ff23341dfbee5354612751e161931104 |     
    i686     |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/ca5e3a29712db681b76309dfdbbb364118ad526f | ORPH
  riscv64    |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/69ab2d74d3f236bbd3ee91eda84f37174749d128 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/12ba3a21225663de1e04c5daaa1e2bf4a1214de1 |     
    i686     |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/6241ca07e2ac3966dc82dc43ba225d9a12fffbfd |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            igd2-for-linux-2.2 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/a331ebbde8ac900bb231306f4425a63abacbedeb |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                    lua-ev-1.5 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/d58de3fe80809068074631d78abb067199f35966 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                  boost-1.83.0 | 1 
  gobject-introspection-1.82.0 | 1 
    host-gcc-bare-metal-14.3.0 | 1 
       host-nodejs-src-22.22.0 | 1 
        host-python-lxml-5.3.0 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
        ltp-testsuite-20250130 | 1 
            minizip-zlib-1.3.1 | 1 
package/linux-headers/linux... | 1 
                       unknown | 1 
               valgrind-3.24.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/2668a7f7d60562edf3e101f9cb1acbcf2a94e825 |     
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/8ec93d3f0c8dfb2947a8cb87b7a848aec7c6a94d | ORPH
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/8bdb76beb84e774ab106948ffdddca7c8d2831d3 |     
    i686     |    host-nodejs-src-22.22.0     | NOK | https://autobuild.buildroot.org/results/f47266f5683a5f6072c94039387eb6cf6226c6e6 |     
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/b92533f2ca4129bf11869f3b96cca18833cd0312 |     
    i686     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/c20d0ed446f0856e3a32928cb1b4a8d52a910462 |     
  mips64el   |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/d9fc647c9516e8ba3a9d585e9b004c9a026b01ce |     
  riscv64    |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/77d0f5573ac228cd4574dd0921cb34475f13d118 |     
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/050d640065b7584cf9bb71ead35c366e1c0bbbb8 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/e9bbad420f441d00d1e08d9c9e3411e4b1d5892d |     
    i686     |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/671dd1d81ed9d18504fd26b0dfc0a2bd4c988ae3 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
