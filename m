Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30BBC531FD
	for <buildroot@archiver.kernel.org>; Sat, 21 Feb 2026 04:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4439840B84;
	Sat, 21 Feb 2026 04:23:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OOCSwtNPdyYr; Sat, 21 Feb 2026 04:23:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1848B41A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771647820;
	bh=3j3KEXUUiRki8l32Y9tUMpImKsYilEH7k+tP180lhAQ=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=W4i5DFm0TBdlnr76X9yZPdANapb7ARc0rd3tgGNXe2DixDXNbtMJJU/xKiSOYp/mH
	 vhbUCMd3RFS9cyaciSYQUVd5USS6BIzVVsTL3u1LDI+a+E0UP1v/2cB1Yr7lRWdwZW
	 lgauUGWRz66QKA+9o66ONZaMN8q2WTIBQtt3EAo7r5aWJx0RynnCkYtoTiqMe03PS/
	 1t0g/Pmw/ahhVBjMesmbx7hpBexx7bYGTxUGNDCbTYa1E/zEAv6v15BE3QDBxNAH4G
	 6M2LgqqhBAGILIRg2DV9VRP0ZHA0MkQZUZtrsbd6OyLU620oEHbsu0nVj6viE0xSVy
	 gHiOmipBTdTUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1848B41A4B;
	Sat, 21 Feb 2026 04:23:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 004BD183
 for <buildroot@buildroot.org>; Sat, 21 Feb 2026 04:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E41E260F2F
 for <buildroot@buildroot.org>; Sat, 21 Feb 2026 04:23:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Uz07ij9-oSJ for <buildroot@buildroot.org>;
 Sat, 21 Feb 2026 04:23:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7175C60AB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7175C60AB2
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7175C60AB2
 for <buildroot@buildroot.org>; Sat, 21 Feb 2026 04:23:35 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-436263e31abso2459553f8f.1
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 20:23:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771647813; x=1772252613;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=igPZDx2QGE9BLSfW5HNcHtIwpz0kgzU0cxNsQ5OxJtg=;
 b=gHXY9SYtPo+UcbP+judtMC0v0TXN7w73J7h4H1uqvc3JLgWTxxBtvKpp3z+RBz+wZv
 EwrO8yKMp8U9cwHF/qjBJqoftVt/MmeHtAlViKnYej/isCIuUgQhUNsHcQVVOQ08nEbG
 dKy6T16pchEyiYdl7AHe3yvAMXapKOrwSBcDRjMgVNkysVj0pJ3epC9PdnkUwfv8Q110
 aUCC5rlmcOHrMur2ZXHBWYqCyqVjZJC0TME1k9zV5En0tUgBQmKve55kTeqZRG9B6fmw
 +awXBe8qMV8uA0Rdgr7jqPwcMD0w/idZmHooC8vBvCFIGCXToksFs50Gwx/q/ZLXC8Fh
 WPpA==
X-Gm-Message-State: AOJu0YydWCOXeA5884MnffZthRZViS9v1J08uieQasbFdbunyohaNfSF
 EsipWSkK1MV4aMA555is96uqFbvNXAgpt5tRiWJn1JdNmhI0ZzsIYoPYczGVLmr9
X-Gm-Gg: AZuq6aKcniQ7t0n5nHSq1ZbetpSflVqrW10siYcrt4AXGBGh2irDu/tCd991KMm0JEJ
 iMHUmxaU+tnWWRFKSO9QiBWOZ1k2YdQc0CsDpDrbPs1N8NddK+yC2FxIKDxy/zxC48s+TUzfIxo
 ahJ5zufuX5LofpeTNpxn9HZuIkLQo1pkSpgOJFLnPRh5g/dcQqDgu9AbWAfrbrH9qyHsf69jKqE
 FNzvAlNEfdW1g8/F9QqpEc8rBnGeKbsywnKbE+Qsd+Usyz2VG/234bteR4cy4NVk1PPVPy0ubNI
 aI2x4W4ttSPDxQcKADih8d6XXSuvf8KdT0lsvy38JcL2HmzNrBZ0e7/aaa/9zerNsmKymAvMF0+
 szO+UzETROw1sN4t5HKbaLj35ufDWscr20s0BPIvioan2tvDq8PPzXey3vedwTdaqlZXVvj534y
 pQLYLTEglm4W4mVOlcgYFnrZt4sB+zHA==
X-Received: by 2002:a05:6000:604:b0:435:9a2b:53d0 with SMTP id
 ffacd0b85a97d-4396f1816c4mr3694802f8f.45.1771647813059; 
 Fri, 20 Feb 2026 20:23:33 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970c00768sm2715867f8f.10.2026.02.20.20.23.32
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 20:23:32 -0800 (PST)
Message-ID: <69993344.df0a0220.186cad.07b9@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 21 Feb 2026 04:23:32 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771647813; x=1772252613; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=igPZDx2QGE9BLSfW5HNcHtIwpz0kgzU0cxNsQ5OxJtg=;
 b=TBSb5UfnBNMDUu//rKyS9Sx6OaCU5aAUA7vTfgpRLSyJdxytmpmZhd3y21rJ5+D4Ql
 R8RdslYBmvhn1UZQEgp2QRDZyLrXbD/dYWPFffySXFsfJG1SDrMqomKsNla72AeC8jN5
 zxzl2HG8fRPjqncMyyOSdlhv3YMah5qwYJeCbCZ+ja9UkhlJzEnuLFDNczMDnoRZz6EZ
 z730KQ84z1LdJtZ7AyPG0x+zCvzR/Hy8fSCAKWAD0Ed9nvzHMxCuZuXJYl/G+vE/UnKq
 UEQET1axzz9kWXkxqkZwTJLRQStzdbIn7YjWBvoYFCNIXoB2wxpQjQxlfV4nBNN8/1ua
 4JCA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=TBSb5Ufn
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-02-20
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

Autobuild statistics for 2026-02-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  2  |  0  |  4  |
  2025.11.x  |  0  |  4  |  0  |  4  |
    master   | 45  | 52  |  1  | 98  |
     next    |  1  |  3  |  0  |  4  |

Classification of failures by reason for master
-----------------------------------------------

               openscap-1.3.12 | 5 
                 host-gdb-14.2 | 3 
                openswan-3.0.0 | 3 
                       unknown | 3 
                 c-icap-0.5.10 | 2 
             dahdi-linux-3.3.0 | 2 
              e2fsprogs-1.47.3 | 2 
libdill-32d0e8b733416208e04... | 2 
              libopenssl-3.6.1 | 2 
      passt-2025_06_11.0293c6f | 2 
           alsa-utils-1.2.15.2 | 1 
                  cairo-1.18.4 | 1 
cegui-e7a03afc70c6182a091ff... | 1 
          cryptodev-linux-1.14 | 1 
                enscript-1.6.6 | 1 
              findutils-4.10.0 | 1 
               freeipmi-1.6.16 | 1 
              fstrcmp-0.7.D001 | 1 
glibc-2.42-51-gcbf39c26b258... | 1 
             gtkiostream-1.8.0 | 1 
              host-guile-3.0.9 | 1 
                  iozone-3.508 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
                libglvnd-1.7.0 | 1 
             libgphoto2-2.5.33 | 1 
                 libjcat-0.2.3 | 1 
                  libsepol-3.9 | 1 
           libsoundtouch-2.4.0 | 1 
                linux-firmware | 1 
                   linux-tools | 1 
                openntpd-6.8p1 | 1 
            optee-client-4.9.0 | 1 
                   perl-5.42.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
                   qemu-10.2.0 | 1 
ulog-0389d243352255f6182326... | 1 
ustream-ssl-5a81c108d20e247... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
loongarch64  |      alsa-utils-1.2.15.2       | NOK | https://autobuild.buildroot.org/results/d31f4a0e6f744283d80b455b98aef6a7f9cceb0a |     
    mips     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/0fec63e1fc698f7eb2d5717af27d661cbb795152 | ORPH
   mips64    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/17c49a22eedf6f9f0bf31052d2e28326f428bc82 | ORPH
    m68k     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/5fae79a7499b5c10c3bd96af4ee85f40b3662d31 |     
   armeb     | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/be06e3474006d758cd9937d13f05b8295e5220b6 | ORPH
  powerpc    |      cryptodev-linux-1.14      | NOK | https://autobuild.buildroot.org/results/f5deed9e0f82218affbda0255ac309e07861c272 | ORPH
microblazeel |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/79f82cb508800b67bb53553f44227616e0517dda | ORPH
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b02a2bf4daea997aa58d9447a926b189fc769b39 | ORPH
    i686     |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/4b5b1a9ce85159c2f50047f6815ada46f9cb6e69 | ORPH
   armeb     |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/45ccd98d85bc0714ef8def071ade6dd491ca4760 | ORPH
    m68k     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/4c24bf9599bb964f1b2153cba96cc9030dd56526 | ORPH
loongarch64  |        findutils-4.10.0        | NOK | https://autobuild.buildroot.org/results/c1a651ed39225a01c1519b01b126b2bc9f805aa6 | ORPH
microblazeel |        freeipmi-1.6.16         | NOK | https://autobuild.buildroot.org/results/31a5927895aba155e113d1525ecf6b4c5a040068 |     
    m68k     |        fstrcmp-0.7.D001        | NOK | https://autobuild.buildroot.org/results/61463cc30fdd949efda29f4d230941ae0369afa2 |     
    hppa     | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/408f992306f196b7e5f65160da8f8f72b64f373b |     
microblazeel |       gtkiostream-1.8.0        | NOK | https://autobuild.buildroot.org/results/911d0e4ddb263d2309ea0c5f8cb255b92dd80f6b |     
   mips64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/bf5788b68f8128c276cad3821066193b794adab6 | ORPH
   mips64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/362e5e6dc94cf8cc1ed2d0a4c2575683ca6b414d | ORPH
    mips     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/8802736155f226a02e287699286dd3ddd17700f8 | ORPH
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/6a69310d6eeac010ae81cdbde8edc411a927bc59 |     
   armeb     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/164d24e31dc43c5951ce79f3e220a73051040aed |     
  sparc64    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/1fad64457650fff6f9bd7b4131a849243d629fc9 |     
  powerpc    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/c0c221527ff11bbe5dc05327399ec0eb85eb983a |     
 aarch64_be  | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/a65a17748ed0ba723d95bf4c8ec5f4df8d046515 | ORPH
   mipsel    |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/a62b5bfaa78fdfbff7168e25c997e958a40e6a9b | ORPH
microblazeel |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/0858fad4a109c580eb8048d90d44ff154d0c656e |     
loongarch64  |         libjcat-0.2.3          | NOK | https://autobuild.buildroot.org/results/d04127a42f9416a81aa225c1317b2515ea1ac84e |     
    hppa     |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/d3826eb45c901e2b6e8a22df45f154a5f591890f | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/73497327db02d48d67403f6d264380763066e951 | ORPH
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/e3ce13def638654a44e4c2aae0fba5663f3940f3 |     
loongarch64  |      libsoundtouch-2.4.0       | NOK | https://autobuild.buildroot.org/results/1b664851ea9ea354abddf6826a9a9255e8d81f9d |     
  aarch64    |         linux-firmware         | TIM | https://autobuild.buildroot.org/results/e92ffed86db62cd2f0446fa71e86186633ac2345 |     
 powerpc64   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/5cf43aed5da9db39026ea0a8b45dad2de75716bb | ORPH
    arc      |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/2263fde1fab3bff1ff482894f3373adc3abaea1c | ORPH
  mips64el   |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/e222007c196b4ab3fff95995b8b54b28eeea36e6 |     
   mipsel    |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/3527a0d4e6fcffb0ce99a1bfda375c27b1b55228 |     
    i686     |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/290fd907e40a948a8ecc8e8b3d5d237e64cfffe7 |     
  powerpc    |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/addb5cd18bc2610d5639295920b4bc5fa89ed2da |     
    mips     |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/8369a3ce75a60fce7077fa3ea0565ae761134a2a |     
    or1k     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/c91b9a82b891bcd47ca0df720a85a58030d03cd1 | ORPH
    sh4      |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/c060c89951ec9d2c618c6d06f2078013842cadc2 | ORPH
   mipsel    |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/2db766487d9682acf67ef12114b0c45f2e1607ff | ORPH
   armeb     |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/b9226b51eedb87aab43ce39d45acd2b2edffe9f3 |     
   sparc     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/69caf533eb06c589b95386183fd2061f3d7a652f | ORPH
   sparc     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/bd3ef95aa8a83fd8f9c2c808c019731aa9f1ec97 | ORPH
    arc      |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/b5fcd08ad5fbbd14490829ec391df59d5daeacdc |     
    m68k     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/4ea62f8e5abdbe1dd0f012f4a54807c47c745433 |     
   s390x     |          qemu-10.2.0           | NOK | https://autobuild.buildroot.org/results/9e9295cb0581a383ef24b7ad7596511f50b4cfa7 |     
 powerpc64   | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/f79eedde73ad1117f10cb8ff5cce54d0e4b75156 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/ac57e575008a7e5e0c5c9a8bcd156c9d59dd6967 |     
  riscv32    |            unknown             | NOK | https://autobuild.buildroot.org/results/706b2b00b1791eabf29b61f232d618b48cc5e335 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/501da48b79dc07fabbaead07ea0011b3afc396bb |     
   mipsel    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/df2f3db81f7785261f3f4d6e957cc6e42865e5c0 | ORPH


Classification of failures by reason for next
---------------------------------------------

libuci-f3fc0b76040685829191... | 1 
                       mrp-1.2 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/28a75516c0a26f789cb6871a6ad643380e342e2f |     
   x86_64    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/2fb9ea21c9615836851ef1f4a9a5036c0f448593 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/5daa7e35d70781b972930aafd40e23e58bccf683 |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

      libabseil-cpp-20250127.0 | 1 
package/linux-headers/linux... | 1 
                       unknown | 1 
             util-linux-2.41.1 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |    libabseil-cpp-20250127.0    | NOK | https://autobuild.buildroot.org/results/1f7421b8c3ba3fc37a33d91f7bb1b4e5494c90c6 |     
    arc      | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/674a745a36ce7a4f2ec88149cbb472232b2a1464 |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/438b5e1bb6bde3696de2224ed3fcab9e0d8ee204 |     
    arm      |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/42f568a8131fdbd12b0e160b1e2070b39cde943f |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

              libopenssl-3.4.4 | 1 
                 mbedtls-3.6.5 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/95039d7fede3d143781c8c314f318d74b732cb1f | ORPH
  aarch64    |         mbedtls-3.6.5          | NOK | https://autobuild.buildroot.org/results/a5625ec3487ebf93f4845863ddf20bdf145e224a |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
