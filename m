Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49BB4E98FA4
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 03:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD3D980E41;
	Thu,  9 Apr 2026 03:25:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ykWkQSWK8Xv; Thu,  9 Apr 2026 03:25:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04B7C80E45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775705117;
	bh=Loz2pQ9SCWy9Qtbyfx5rQz/Y6Ck0hHct65X2RN832F0=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MjhiwnYfrNfIPT5OiUOWZ1va6SdE7vqhqYD66ifThRoouwfte27oaquJCIN780cab
	 FunsiCbu/2Vs9SIU3HqbqdsBTz5reAK1pNFv0/apIZRFC0dECiycwi0TNSu2JJ31v3
	 RRcMTQZnCHjpx2/qS+v5WLPIusmnxBVLJDM6f2HxEOBshC96guhQxQZzabCYzaXN8P
	 PTu4zlgwzafxujUCPOs/h4mAjNVp1aids7BLa7G0i5L/ZJfFs/zPVJPhdixGPHPfNM
	 MJSSgKgMYxGLfgS+6CMr/GmzahkNu3Osl8eLs/VX0TjiOkr6ftzbEBzmF7a2J4hEcn
	 xWsRYKZ7XreLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04B7C80E45;
	Thu,  9 Apr 2026 03:25:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C8D461F6
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 03:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BAAAF60771
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 03:25:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cY-mlebmWSiS for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 03:25:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DBC5260767
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBC5260767
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DBC5260767
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 03:25:13 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-48374014a77so4757405e9.3
 for <buildroot@buildroot.org>; Wed, 08 Apr 2026 20:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775705112; x=1776309912;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M2viE7x/FIvliGTQxpq5OKiRrNF+qyFLCNFhZVGZ9CA=;
 b=GoZGfqYm0MQMzo4QfV4kuUsN8OR0o4dmnN4RklGmQmm2hIQzMzgw+Ug7BvZxbKKy7t
 L8ZmgnOwsI2T7VlvtyZ8uM7bDRY08udWGSRJLoyyAseNyJ5KbL55+SMmjkvi/oKXWfLo
 MGfbOtEwf9Nzyo1uUCTnXdpRQaLjRKSVHV1NI34WJsno9HZXX8vSrVV4MY4OWeya9ktb
 sHNPAeTaZGJ+PuxJSrvyOs4Sj6qBZrZCV7P2UmZFWw2xOyrOsg5i2kvR0eSccLYviajr
 rBZ06ANszg0a1CGuJq+zeHvjLaPbrkQmZILy/JVEk/adLZ+g61qAnAQ04psrQ07a88tj
 yWKA==
X-Gm-Message-State: AOJu0Yz7QN7Lls69yaQLOyZrkrqx/Dcm5nI8YJQHzDVIfF0J2IievmEO
 xQNjLMkJt+yeeiqrwdheQnhX6EKKu1Boz0FhkHK08Jb1ei3fI5IZ++DUbQUWohBv
X-Gm-Gg: AeBDievry2+ofJQtilKds9NxCwCiEhWOTrFoWnZJH2EN/bB/Ewo9LaTZManu8d4fH+W
 JEyFsmET+wiph0oKxJ4uX0vXP6I60GW2qUqs4xAsaP43vBvurVOa7hoiOcRifNPaMYR6CKTJzZj
 PnEO1NbTOI5DGqtjDEPjwpInV/+kyt8HraZlzquFLQYLvxiQo3UuxSpYm7cjDa6rfgSO7VuL+bq
 QG/QcCTIBJ0aWstjT78TkHMYMbpKUueQsJSDS+rF4sHSyQhNoGODiJeMkcWWMmnIhB5u3lEtzJV
 dDtT0n+7o9UuuEXV6de1jEMSNUWCondSOcM6V4RixNuosuXklnyZf7EG5o8VtR0gBVP1nu6b8FE
 tUicnsB0DiAX3tPW0FB78zIc4rlmqLhNmuzlZxiJ1xo0MrmOMzCwLt5u/vv3RDrTjxLC2lLpCzC
 9ePZuyBm9L5aQ9XsmadzQUM7QpZJgy1g==
X-Received: by 2002:a05:600c:8595:b0:488:bfc3:ef3 with SMTP id
 5b1f17b1804b1-488bfc314e5mr90237515e9.0.1775705111373; 
 Wed, 08 Apr 2026 20:25:11 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488cd22c77csm34679305e9.12.2026.04.08.20.25.10
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2026 20:25:11 -0700 (PDT)
Message-ID: <69d71c17.050a0220.d8430.d597@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 09 Apr 2026 03:25:10 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775705112; x=1776309912; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=M2viE7x/FIvliGTQxpq5OKiRrNF+qyFLCNFhZVGZ9CA=;
 b=sh8ytmrEsfai9HUiEpwUMos9M2zCvzM508vL0z8XkJQXBTWW0yCIgPo1y09EtYsQY/
 ZrTrJ+uLaVGaucuJ+ha0FwzL6o5MdSsDnbrZCW/mco5HYG12AUvQ75Jzp9VXsDHNbf0w
 3WJ2P0NuMnohrjkrQjdH90ISF+z1bYCofxw21uUMbrxgg33EYZcrL+NxuhaWvrHvD1L+
 REZ7ntDQ4Ar+uz6fZHENlXlVGQ2XGcMEJgXOh8JCSx6i8ZjLDbzNR0M9HW5i8QIzCvD1
 n13ohnewP9Zpo4BGCvACjqqIR8JcTuHMouPdpJKM2i2gjnzsiZNTYRHh4kWU5vmeof52
 N84w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=sh8ytmrE
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-04-08
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

Autobuild statistics for 2026-04-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 10  | 20  |  0  | 30  |
  2025.11.x  |  4  |  5  |  0  |  9  |
    master   | 45  | 86  |  2  | 133 |

Classification of failures by reason for master
-----------------------------------------------

odhcp6c-f19dd37fb467c9cf10c... | 6 
                flashrom-1.7.0 | 4 
                  libnfs-6.0.2 | 3 
          linux-5.10.246-cip66 | 3 
                       unknown | 3 
             dahdi-linux-3.3.0 | 2 
                   dante-1.4.4 | 2 
glibc-2.43-17-gdd9945c0ba40... | 2 
  gobject-introspection-1.84.0 | 2 
    host-mender-artifact-4.2.0 | 2 
     kvm-unit-tests-2025-06-05 | 2 
                libcurl-8.19.0 | 2 
libftdi1-v1.5-62-g5e67403c4... | 2 
                 linux-headers | 2 
      passt-2025_06_11.0293c6f | 2 
                   perl-5.42.2 | 2 
                    sbctl-0.18 | 2 
       shadowsocks-libev-3.3.5 | 2 
           xtables-addons-3.24 | 2 
          aardvark-dns-v1.17.0 | 1 
                   atop-2.12.1 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
                      gdb-15.2 | 1 
                   guile-3.0.9 | 1 
                 host-gdb-14.2 | 1 
            host-protobuf-34.0 | 1 
              host-rust-1.88.0 | 1 
          host-tipidee-0.0.5.1 | 1 
      host-uboot-tools-2026.01 | 1 
                       kmod-33 | 1 
            libargon2-20190702 | 1 
libdill-32d0e8b733416208e04... | 1 
              libgeotiff-1.7.4 | 1 
                  libnss-3.122 | 1 
      libphidget-1.24.20260127 | 1 
              libsecret-0.20.5 | 1 
                libsoup3-3.6.6 | 1 
                 libssh-0.11.4 | 1 
                 linux-6.19.11 | 1 
                 mbedtls-3.6.5 | 1 
                 mdevd-0.1.6.5 | 1 
                    ne10-1.2.1 | 1 
               nushell-0.108.0 | 1 
                opencv4-4.13.0 | 1 
                openntpd-6.8p1 | 1 
                openocd-0.12.0 | 1 
                 pixman-0.46.4 | 1 
               pulseaudio-17.0 | 1 
            python-numpy-2.4.0 | 1 
                 rtl_433-25.02 | 1 
                   s6-2.13.1.0 | 1 
                s6-dns-2.4.0.0 | 1 
         s6-linux-init-1.1.2.1 | 1 
        s6-linux-utils-2.6.2.1 | 1 
                setserial-2.17 | 1 
                 sqlite-3.51.3 | 1 
uhttpd-15346de8d3ba42200249... | 1 
             util-linux-2.41.3 | 1 
            vorbis-tools-1.4.3 | 1 
             xapp_xhost-1.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |      aardvark-dns-v1.17.0      | NOK | https://autobuild.buildroot.org/results/d7cf03aefc757ee62c2184a5990b00550a0cef1a | ORPH
    or1k     |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/e5a61f9cc291fca46ba676715f58bef2c1b5dd37 |     
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/b420bf4180939907dc433a38c57666b292f0078b |     
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a9a3564aa20f07d9297216dfb1d705993c686f44 | ORPH
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7452df7ffadadc4bb68155edfa4fe955ba26828e | ORPH
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/bcb8c89ab6a94e762db3478680f50c7c7bac3e08 | ORPH
loongarch64  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/8ef7b5136e3bcfab6daa99988265aa888390a6ca | ORPH
  sparc64    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/cef3bcecf1779a6789fa72cc8060aaf2e6483d1a |     
 powerpc64   |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/1959e7fb5c7a8287112639b4858b4f52e67ffe7c |     
    mips     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/34110d57162913f3919dc958bb1449fe0c062a87 |     
 powerpc64   |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/4502a91de005085dd7c48e151e3d26aee3feff00 |     
  mips64el   |            gdb-15.2            | NOK | https://autobuild.buildroot.org/results/31a5aa5b68817f7b8ebc4f106aa508db7eeb4233 | ORPH
  mips64el   | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/254d08a4021988db3b426b9689e8ca4995af3564 |     
  mips64el   | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/43673d4d231ff4f553cc88edcb46dad89746af4b |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/467293309bb902abb6b8e109bbde8da3cefb78ed | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/db9d73c45c537252f3ac7116fde75d8ba9e040d5 | ORPH
  aarch64    |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/314525cbfc592b1774462e27caeb4bfca9964028 |     
    arm      |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/a9f4a362dc3b9a31bea907f81b97eaaee7a9f24f | ORPH
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/e8a88ba4f70aac435d6fc36857dfb3c212f19929 |     
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/de125b4c5b0a8ea64fb564431847f4986c11bf0c |     
   xtensa    |       host-protobuf-34.0       | NOK | https://autobuild.buildroot.org/results/26dd88a4336c222b9f3bc71447b7b656995cb107 |     
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/edcd191c292ba3032aa96b72fb25c3740aeda8bf |     
 microblaze  |      host-tipidee-0.0.5.1      | NOK | https://autobuild.buildroot.org/results/0a0d5a4b793b47bd0599a60878dba6edf5110890 |     
loongarch64  |    host-uboot-tools-2026.01    | NOK | https://autobuild.buildroot.org/results/4653f61965b82a0a0433423fa922ab0c6287a906 | ORPH
    arc      |            kmod-33             | NOK | https://autobuild.buildroot.org/results/cf74281a8c6cb4c18e6027b17b768b02ac7ad48f |     
  riscv32    |   kvm-unit-tests-2025-06-05    | NOK | https://autobuild.buildroot.org/results/2e9ae01af0f6fde2b18b82706d8e8bd44f7b95ec |     
  riscv32    |   kvm-unit-tests-2025-06-05    | NOK | https://autobuild.buildroot.org/results/a09a8b358624d819428907a5abab41e2110d24b7 |     
loongarch64  |       libargon2-20190702       | NOK | https://autobuild.buildroot.org/results/1adb3188d087d387e49630f4e029c61bbe851c64 |     
   sh4eb     |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/88c437e1610d4f1f0bbb2c3fe8a5a0a64442be1d |     
    sh4a     |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/9f64e87dd3d070ef8e43254b826c27fb12af036c |     
  powerpc    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/374980c694374e18620a8206ea93bcbb89fb1846 |     
    arm      | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/54bbe028db23ce2b76e511c385ef38a8e70ecb92 |     
    arm      | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/fe02b37aa94cacae0d311fb466413b6b704d5711 |     
 aarch64_be  |        libgeotiff-1.7.4        | NOK | https://autobuild.buildroot.org/results/3c6645d67c593eeb66bd7d06a00fcda1cee7ea2f |     
  mips64el   |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/8b1c452e83fa8778da6305c746826e8cd514613e | ORPH
   mips64    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/9d5b4130f57ca551d62bc57f084f933a9cc40469 | ORPH
    or1k     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/1add8c323bb3b3484ef583eebe7d8a4407a0247c | ORPH
   armeb     |          libnss-3.122          | NOK | https://autobuild.buildroot.org/results/c62e59f57f8c6c811764391b2c153c6750636709 |     
  sparc64    |    libphidget-1.24.20260127    | NOK | https://autobuild.buildroot.org/results/37607d3f99cadeb9cd1f89bb4c212a36bcc93984 |     
    or1k     |        libsecret-0.20.5        | NOK | https://autobuild.buildroot.org/results/cf73cc4b6161ca486f3089678a78cf324be211da | ORPH
loongarch64  |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/d10b78940c6793dea384e2ce3e3ff6f172c23e8d |     
  powerpc    |         libssh-0.11.4          | NOK | https://autobuild.buildroot.org/results/dbddda2de03c0974fd168c21b1dd2fef6a3cba27 | ORPH
  mips64el   |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/d5d83cfe2cade0c0c24a280bd82889236f14b081 | ORPH
    mips     |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/5998d5c670a911e6aee86ec3262f07b292472ba3 | ORPH
  powerpc    |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/138aedf6488b83db5fb27723c0cd36d66f5e536f | ORPH
   sh4aeb    |         linux-6.19.11          | NOK | https://autobuild.buildroot.org/results/ca3bbfcbc1cad77c655a756c4edb956539088983 | ORPH
    arm      |         linux-headers          | TIM | https://autobuild.buildroot.org/results/f1dba5203031c4147d28748a610fcf673021ba67 |     
   xtensa    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/ee52af9dca33ecb2a341e8ec8e565286e51b5e17 |     
  aarch64    |         mbedtls-3.6.5          | NOK | https://autobuild.buildroot.org/results/a19af7d84b1d4febd4a906a3a01c3da2160fb961 |     
loongarch64  |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/5695d721ff9b378a1d910ce148f65883507ac521 |     
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/be156c35e3f3db1e62ef0bd5158c036a16a7a596 |     
  sparc64    |        nushell-0.108.0         | NOK | https://autobuild.buildroot.org/results/0dcd49f6284bd6e440db57618e5fda09876fa3bb | ORPH
 microblaze  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/2fafbe2aa3798dfda24a685a7639e725622ee776 |     
    or1k     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/d8b1417e0279827b1befeacb473665fad2594e0e |     
 microblaze  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/ff8427d1fe3ebd64b02bc4fcdd90fecc275041e3 |     
powerpc64le  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/00f72d8883de4fb9202b3f4eacd0e7e8394a61a4 |     
   s390x     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/0980ea829b82a1308882ed0037c4528a75af9685 |     
 microblaze  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/85addc9c5b30d09e91166ef2e4e659095b992961 |     
powerpc64le  |         opencv4-4.13.0         | NOK | https://autobuild.buildroot.org/results/bbbf1bb22667700ef275da85be08d8941cb661d2 |     
 microblaze  |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/572a2808604ed2049fe160526f956f927b5d69f6 | ORPH
   xtensa    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/96592722335727e3f791c59d46b407c2ead103e5 | ORPH
microblazeel |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/df4ab0ecfc58c6008fb05dc52c4c54ef01b747da | ORPH
microblazeel |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/0fc56b4481aa255dc85295bd6982c7fc39b60abd | ORPH
   x86_64    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/7e29a64d1de006ffbcdb940368c78bf83c8e7390 |     
microblazeel |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/a6881692f4213eff7a01f1db4047fab257a344d7 |     
  riscv64    |         pixman-0.46.4          | NOK | https://autobuild.buildroot.org/results/c6fb556871a617b30468e53c57548486e9f44642 | ORPH
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/b4b151d546ba6f2a12f2f4ac0773a15641e24662 | ORPH
 microblaze  |       python-numpy-2.4.0       | NOK | https://autobuild.buildroot.org/results/bd83f0dd143cedad08beb04fbb2452a8b1d24356 |     
powerpc64le  |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/195b0943798381a0fccf2b0ee9517453ca4f3792 |     
    or1k     |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/206e18363b9e181e34d52128a6a31603984e2ba9 |     
loongarch64  |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/15bccac4b99569bfb6ce1cf3ba41561d7a457be7 |     
    i686     |     s6-linux-init-1.1.2.1      | NOK | https://autobuild.buildroot.org/results/4a84592a3250b7d45e6eafdb235313b8ac5996bd |     
loongarch64  |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/9e9f5542102ea82cc6d4e7339bbfc79ca28d97c1 |     
   mips64    |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/546e19570098e545c120b8db868f7661b10fcab6 | ORPH
  mips64el   |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/22cbb7f05f35b776c7ae0797ab86eb206b8a406a | ORPH
    m68k     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/53e7e489aba9d5f33281bb67a7c682e1bea229eb | ORPH
loongarch64  |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/ebce347a5bd70f3bbc3385a35b641ce60547d3ed | ORPH
 microblaze  |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/0221d5dc3a2ec7b5223731cc95754bb945fdbeb0 | ORPH
    m68k     |         sqlite-3.51.3          | NOK | https://autobuild.buildroot.org/results/dac1812b3ad61f8c07a1ddc1d7d76d1bc8c11a4c |     
   mipsel    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/9f5cfdbd29cd4c82f482346e436175ae7487f91c | ORPH
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/5a849c73e5d222e9fe999f64e7fec7954b61b19a |     
   sh4eb     |            unknown             | NOK | https://autobuild.buildroot.org/results/545ed2ece780383db846ea512a3aa0f92f0c7eaf |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/d77bd0b0e1ce5fa7feab81a424d374911f59958e |     
microblazeel |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/def596246b43cf9bb662f541812c68d1222c12a3 |     
  riscv32    |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/f1b5c44837820058be2a7c73915b9d0569989977 | ORPH
    hppa     |       xapp_xhost-1.0.10        | NOK | https://autobuild.buildroot.org/results/3f7cdc8e4a289744274afac67fbf155cf5a6af01 | ORPH
 microblaze  |      xtables-addons-3.24       | NOK | https://autobuild.buildroot.org/results/5ecf22ad6bb772d3c53cefe626679566c9db7fae | ORPH
  mips64el   |      xtables-addons-3.24       | NOK | https://autobuild.buildroot.org/results/5933373073422a6c70034aaf4596f9360ca1651b | ORPH


Classification of failures by reason for 2025.11.x
--------------------------------------------------

              containerd-2.0.7 | 1 
              host-rust-1.88.0 | 1 
                libxml2-2.15.1 | 1 
                pipewire-1.2.8 | 1 
                       unknown | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        containerd-2.0.7        | NOK | https://autobuild.buildroot.org/results/46e70cf1aa093b9a3ba2d50c30e5e699e2b12fe6 |     
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/0070bd22d453456e90bebc0d1e026829811d025b |     
    m68k     |         libxml2-2.15.1         | NOK | https://autobuild.buildroot.org/results/3477f20ae7d3c34753afe1078881bdb111b5a5f1 |     
   arceb     |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/3ea217fdf78069e1677f31796d7b5ecb45550099 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/cfa02183e956885e7ad844931da43f9111b55379 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-python-lxml-5.3.0 | 3 
        ltp-testsuite-20250130 | 2 
                       unknown | 2 
                    bat-0.25.0 | 1 
                   dante-1.4.4 | 1 
    host-mender-artifact-4.0.0 | 1 
                  iozone-3.508 | 1 
              libopenssl-3.4.4 | 1 
                 libssh-0.11.4 | 1 
                   linux-tools | 1 
                  nginx-1.26.3 | 1 
                   openrc-0.56 | 1 
package/linux-headers/linux... | 1 
python-remi-2022.7.27-37-g1... | 1 
rtl8189fs-94cc959d56c1425fb... | 1 
                 zabbix-7.2.13 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/44b17b06c11ab09ff9e40de677c02b9d0ca66d62 |     
   x86_64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/ef191995007938dac0e35203584a1ffa85feecbb | ORPH
    arm      |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/861589a55a9b7b4e1bdc555f9758c2aae8dc2e80 |     
   xtensa    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/93bade058dee42b7c5d91cb44d9e154d8e4031a6 |     
  aarch64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/9d5d6508425f52fbabf24ab9de3b94bf96895c76 |     
   arceb     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/c4a24f685157298c233ffb1de199e5c62081be1f |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/48d82d2fc3c79933cb9ec230e7a14282977ae97c |     
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/907eadd06ee7f9a3a723bdd8bb1805926a13f0a1 | ORPH
    i686     |         libssh-0.11.4          | NOK | https://autobuild.buildroot.org/results/21e894a5ddff25ef138cbfdc3c171d5428bbda55 | ORPH
   mipsel    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/c8b7be02b88f5f595ac74eecb22131cfa660099a | ORPH
powerpc64le  |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/cd50fa3de5cd4979583e48a8e4ee028ec87baf6c |     
   mips64    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/47f1f3d3919d7af448803e2e64bb8f124a247bbf |     
   sparc     |          nginx-1.26.3          | NOK | https://autobuild.buildroot.org/results/fc704d7a2d9f20ec39a7153829cedb2b187e98fa | ORPH
   x86_64    |          openrc-0.56           | NOK | https://autobuild.buildroot.org/results/c33cf1a68bb6909ec8391556cea29109b92f1306 |     
    sh4      | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/84f236db048ddc5aeefc527b1d802b4c839ee344 |     
    m68k     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/118166d3dadaa003eabe388fb86d6334b62352ba |     
  powerpc    | rtl8189fs-94cc959d56c1425fb... | NOK | https://autobuild.buildroot.org/results/da83bdbbfb036528c8fc81c9fa45c2e28ce6bc1c |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/f5264663a8aeee11e327b9527921e0c607f1d6d6 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/fd5c8d1e3ee513820c1d94777e2ea9b07c843d1b |     
microblazeel |         zabbix-7.2.13          | NOK | https://autobuild.buildroot.org/results/508b1a7bcfcfa31b938010938ec3ea38ae54c6ce |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
