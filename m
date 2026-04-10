Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32628F36BA4
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 03:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E328060B62;
	Fri, 10 Apr 2026 03:23:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kpif4VIrddtw; Fri, 10 Apr 2026 03:23:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60B1060B96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775791384;
	bh=CcYqAebpS23CA8WayOObz367kjBj6c7SPPQS3r433ZA=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XhXT5YzyFlG76TivrfGlWGsWNXDNBQm4BYoxbUvbY5RJcDXX2ONC/waXSGFLoMwRs
	 by1MpU1yQuIghxX1ETMUGoR8I8iLYVPxQafPwbMCFzcMI2bR0ZW4GdW14MMPkWWUEY
	 lubz6x1d3E9ud1b64atQ78JCuZeGJsQUa3g3FuHe77Io5MH/lstToR7+bpthzwZRaM
	 CmMHJKLnWKdlPivAl7U9mMfAFd5cPeM8WNuEZIkKtip/avGkB7qe3sdjiiqnrPOhkE
	 caCsLrKT+NBXtbdyOeLSn2/K9ydhj6N7RwcKOiSihAhZXcdgfjLdsXpY/WFPLsUH4K
	 65TwxSr107msQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60B1060B96;
	Fri, 10 Apr 2026 03:23:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AB9401F6
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 03:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D53E40395
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 03:23:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yglee1wQEgUP for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 03:23:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BBBB74028D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBBB74028D
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BBBB74028D
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 03:23:00 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-488a88aeec9so19661005e9.2
 for <buildroot@buildroot.org>; Thu, 09 Apr 2026 20:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775791378; x=1776396178;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yJSCvSGFyTVZdyJD24YVZ68M1lQoCKZv84ra/dN3BLU=;
 b=QM/x2UT9yU7A15Y5sngG4dTyUEdodhsIaU811YrJQxoI3NrNbIKpg8rwAM1znj+lN+
 hxdndx1zu733KSEC45TK0qltCfPTM4j+gFa3N6fAZtNWfl+NxFfh2QTQ2rbZRYcj388R
 e4AqTprqu0EujwluWFLS5dnTzSlqIOawqh8iywaHxfJ6W4U16JQnCtRf0a9mP0PYzIfv
 Ek2qZaGRmL+sLnhjgi+6Fa7dz8bVjRc/aA17fKR1uU64U5C5eTaLQD1969VaXd1BZt7t
 BXy4pbjvE4Xbvv+tl6FQH+nYi8L08N+wM+APJ21Hpa5cR9WVc6y9pga0ZNF1QLFh4ukP
 PsGA==
X-Gm-Message-State: AOJu0YwwsF4x0ofJZpY3856/k7j21kjJHuADqD0wPXIDwaCYgxQMJjxD
 S0AbzWTRnlsAln2yrWvYLU8jC90ne4GCKPcwRJCR5Md10uUXAuEDohRwiUQb6nq9
X-Gm-Gg: AeBDiesU7fmUm7p/gCiBk3pTpfWITNshSxhv3rJK3NCwFINmNUhtCZgXpD8lgG0E+pZ
 I1zTOLWihZtr4vzDXwClk4CLKJmEJXeTU08gR3GW1NwDlkfFmLELi/xzOcjfAeNI3bg0K8LxvZG
 NkrZoyMJQtYFcnvtYxhcWs9SeRTfsxOyI9ypkp1hSXftQdgHPuk6C2LSY2Ygy4rjH4HWiT4zMZf
 aTf0CdHb76y9ro0DuuNtAPClZlWQyaPXKwlmVAEyk+TiB9d5A0xD/M7N0IZtZtynm+pHREdrhWF
 L7QI1JKTtBTgiDljB4aM6/yQcZJgvFsyferOH5/nNoIu/JWRxqI1Ts35ctMcni+qFeBxF2Ef1BD
 v0vjzxy/ygvz0CONudQmGiteyyiIyM/DUDSP+brKXbbXrQCUmhz3RMYYnamhWSRfBTKTUVO5qI6
 lHXPL3D7wb7VBf9GZMzo9+GLJC8TLIPg==
X-Received: by 2002:a05:600c:a11c:b0:485:303b:c50a with SMTP id
 5b1f17b1804b1-488d6804721mr10021685e9.13.1775791378162; 
 Thu, 09 Apr 2026 20:22:58 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63de2a69sm3811449f8f.4.2026.04.09.20.22.57
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2026 20:22:57 -0700 (PDT)
Message-ID: <69d86d11.5d0a0220.217c3f.7b9f@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 10 Apr 2026 03:22:57 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775791378; x=1776396178; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=yJSCvSGFyTVZdyJD24YVZ68M1lQoCKZv84ra/dN3BLU=;
 b=F20xTdmiwLDKjGFY/eATHfFt2PTO/rtc3K5v/joe9/HTbv5cjEd18gbTLFnFU7/x/E
 kNDsxGsvbr9FTJwGY1eUrXpTQkGwo0a5YQl7nuEOIBYdHtxwShMwZwJrCcVQ9vrd+oXF
 ETrOeDiFpoUrE5xGGL/cjYtcY87gxesBaNBKAYrfyhsbz/w6FX/uSGYsgT03mfyoZHqW
 KdaRUmV4otZHyrN5sKk+CDLhvRZRSxKPybNI2kRuvEpn0y141zpTw/Lp8DqvLkNpk4lv
 KCUpXkRTZ+yyZzpswWrvTGymw7OcTBKuAyhdSXWP0QjceP8nZkVgzoUf5iXLN+liIq9G
 4DRA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=F20xTdmi
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-04-09
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

Autobuild statistics for 2026-04-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 13  | 19  |  0  | 32  |
  2025.11.x  |  5  |  5  |  0  | 10  |
    master   | 45  | 105 |  3  | 153 |

Classification of failures by reason for master
-----------------------------------------------

                flashrom-1.7.0 | 6 
glibc-2.43-17-gdd9945c0ba40... | 5 
  gobject-introspection-1.84.0 | 5 
                  libnfs-6.0.2 | 5 
                       unknown | 5 
phidgetwebservice-2.1.9.201... | 4 
odhcp6c-f19dd37fb467c9cf10c... | 3 
               openblas-0.3.32 | 3 
             util-linux-2.41.3 | 3 
             dahdi-linux-3.3.0 | 2 
                easydbus-0.1.0 | 2 
    host-mender-artifact-4.2.0 | 2 
     linux-5.10.246-cip66-rt29 | 2 
                 linux-6.19.11 | 2 
                 linux-headers | 2 
               pulseaudio-17.0 | 2 
uhttpd-15346de8d3ba42200249... | 2 
ustream-ssl-5a81c108d20e247... | 2 
                 apache-2.4.66 | 1 
               asterisk-22.8.2 | 1 
                   bullet-3.25 | 1 
                  cairo-1.18.4 | 1 
                   ccrypt-1.11 | 1 
           crucible-2025.05.28 | 1 
                   dante-1.4.4 | 1 
        edk2-edk2-stable202511 | 1 
              execline-2.9.6.1 | 1 
firmware-utils-c42a3bc53da8... | 1 
               freeipmi-1.6.16 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
                    gawk-5.4.0 | 1 
            gdk-pixbuf-2.42.12 | 1 
                 host-gdb-14.2 | 1 
                   host-gnutls | 1 
              host-rust-1.88.0 | 1 
          host-xfsprogs-6.18.0 | 1 
                  iozone-3.508 | 1 
              jpeg-turbo-3.1.4 | 1 
     kvm-unit-tests-2025-06-05 | 1 
                   libcap-2.77 | 1 
               libcodec2-1.2.0 | 1 
libdill-32d0e8b733416208e04... | 1 
                  libenca-1.19 | 1 
                    libev-4.33 | 1 
                libglvnd-1.7.0 | 1 
         libhdhomerun-20210624 | 1 
                  libnss-3.122 | 1 
              libopenssl-3.6.1 | 1 
      libphidget-1.24.20260127 | 1 
          linux-5.10.246-cip66 | 1 
            minizip-zlib-1.3.1 | 1 
                       mrp-1.2 | 1 
                    ne10-1.2.1 | 1 
           oath-toolkit-2.6.14 | 1 
             parsec-tool-0.7.0 | 1 
      passt-2025_06_11.0293c6f | 1 
                   perl-5.42.2 | 1 
               procps-ng-4.0.6 | 1 
           python-html5lib-1.1 | 1 
            python-numpy-2.4.0 | 1 
                   s6-2.13.1.0 | 1 
        s6-linux-utils-2.6.2.1 | 1 
                setserial-2.17 | 1 
       shadowsocks-libev-3.3.5 | 1 
                 systemd-258.4 | 1 
ulog-0389d243352255f6182326... | 1 
        util-linux-libs-2.41.3 | 1 
vexpress-firmware-901f81977... | 1 
        wireless_tools-30.pre9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
loongarch64  |         apache-2.4.66          | NOK | https://autobuild.buildroot.org/results/074ead48976c0f24aebf273d3410a7d2decaaa1f |     
loongarch64  |        asterisk-22.8.2         | NOK | https://autobuild.buildroot.org/results/d93fd69e51dd3d74a3746ff0a753dbe6b27de632 |     
   armeb     |          bullet-3.25           | NOK | https://autobuild.buildroot.org/results/524102dba5f52e6b225b119be3389bd419c57510 |     
   x86_64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/8af0619eea0eacea3c1c6dc5ffb2a67e4376d36f |     
  mips64el   |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/6d80a4799912f49c2f1be771d4abd82441c9260d | ORPH
powerpc64le  |      crucible-2025.05.28       | NOK | https://autobuild.buildroot.org/results/8272e82f9ed8e8e91af59d1f5fde09dd86f3461c |     
   mips64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/5b6aefb6db494d9cbc2e4411b0c48f4d59c329d8 | ORPH
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/81f247a43dd4155783a23fb959d731863a003c5f | ORPH
   s390x     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/e1ab255a83f66bb19a94f5a6bab58cd6056ba057 | ORPH
   x86_64    |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/69d40c0477119b5a1bbc96fc8ee4d15f6d2382be |     
    m68k     |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/0e338839e6cdfb442a95c2d944dd727378130a1d |     
    i686     |     edk2-edk2-stable202511     | NOK | https://autobuild.buildroot.org/results/01c8a892a7b4b5818d5f917eb200146d85a11440 |     
loongarch64  |        execline-2.9.6.1        | NOK | https://autobuild.buildroot.org/results/ccf93bf76b8deeb4cb2b22b183a620b1bf12aa64 |     
    or1k     | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/944ace7014046eef7e31c8aec7e1884d91d28ade |     
   armeb     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/c473376a23ba0287f88b69b5e401b1788f45e0e8 |     
   armeb     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/590ba6848ab15db22794ee290863f1432c3f40b5 |     
 powerpc64   |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/9561dca824540b3c60b7cac552691c30396ff21d |     
    mips     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/1bd7453ee5742358fb0cd69fdfa806fa3cce7fd5 |     
 aarch64_be  |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/6d91edde56108c0126a969e342cf75747946e0d7 |     
 aarch64_be  |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/99e3ca61e26e58a8a39d518d3c6c93051d54fba4 |     
   mipsel    |        freeipmi-1.6.16         | NOK | https://autobuild.buildroot.org/results/ab356a154c794660b4e7948337f32423e0d328ee |     
  sparc64    | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/6337d61b8a2adc46ff9c771cee0f11638e6bf4a3 |     
   sparc     |           gawk-5.4.0           | NOK | https://autobuild.buildroot.org/results/b5b2f2dc5bd0b3b163fcf2bcde0e0bc2bf614ff6 | ORPH
loongarch64  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/5956b4b65d3d2c69e9d3949a631f3bb7a4fd8f2d | ORPH
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/b6bee17b0a2e005b31b6f0e8e4380e7d1b7c3bf7 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/5b29a6a300a20979ed33deb7d730e09f8284603c |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/9bf8e60a06ab2e99b47682dae6abdc7a2c759422 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/97473377b75620a961538f09824bb8dbc6bbd685 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/7bbe15c0de23dc58ed63a57e6e102048909f0472 |     
   sh4eb     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/4ad171eb23b265f4dbe352df6df5ee05fde44b9f | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/96f1702bea47650da2c1d5e1a085c550880af4c6 | ORPH
  powerpc    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/4cd5d426a22debe07622de88a5619f1da1085550 | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/b4c85f8f66c9b160229ab0a4630e86a43bf8e9e3 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/d8357ea32bb05d5c2bbd7d1ba464a8a432fb5d22 | ORPH
   xtensa    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/83243706b85f5010b174ef306092a717abb38186 | ORPH
microblazeel |          host-gnutls           | TIM | https://autobuild.buildroot.org/results/83742b41422f823fcf63a602a7d9f1fcf4e98d89 |     
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/2f279bc0c9e8ff924982d509ac38478f2101b76b |     
   s390x     |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/e4297f170540483e72d2620d438233670df676a3 |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/3db3a3f0dd4487213e6be86eb13c829a9562d60e |     
microblazeel |      host-xfsprogs-6.18.0      | NOK | https://autobuild.buildroot.org/results/a2058b20deefda6d4dd4ae16a914402317fe3c97 | ORPH
 microblaze  |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/f3d6418e673252afb11505171d16ea3980798b5b |     
 aarch64_be  |        jpeg-turbo-3.1.4        | NOK | https://autobuild.buildroot.org/results/9ee43bce261e975688614fd7fb2ecd69c5df5b09 |     
  riscv64    |   kvm-unit-tests-2025-06-05    | NOK | https://autobuild.buildroot.org/results/56ae64d2200961687114a4d789e6bd9a2df821ea |     
    arc      |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/9c1157878447879f8e02eb6b58818166ced65254 |     
  powerpc    |        libcodec2-1.2.0         | NOK | https://autobuild.buildroot.org/results/efd673fa2b6adf9ce96c3cf46aa8f9e22138dd05 |     
    or1k     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/fb31ff468f66ea420e86250f739a751a96c188d7 |     
powerpc64le  |          libenca-1.19          | NOK | https://autobuild.buildroot.org/results/502fb1066e5b2a204eaa914eb0c78488c28614cc | ORPH
   mips64    |           libev-4.33           | NOK | https://autobuild.buildroot.org/results/2210b0cfc22723cc5280e6324321c626ef8299e2 | ORPH
  powerpc    |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/6bb3238dbc7a8f5fcf0de28c6c8b790ab528cd39 | ORPH
 powerpc64   |     libhdhomerun-20210624      | NOK | https://autobuild.buildroot.org/results/1e83c791c20caea8a16eb3c57d96d13b82a275fa |     
  sparc64    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/da5535f43449164f7c6cb1ef5c05a6f339cb7f50 | ORPH
   armeb     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/2c43a4ba70db08de1843c9c1c944d31c18174b26 | ORPH
    or1k     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/304e50d3a96ff1e638910956c51a68ed5117e527 | ORPH
  powerpc    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/86129f0359e5ab77784c8c261eb969bdd7c2f4da | ORPH
  riscv64    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/3588137a80fbb88a8a2e7a1e7d8cfa2d79c927be | ORPH
 aarch64_be  |          libnss-3.122          | NOK | https://autobuild.buildroot.org/results/7f252da71ebb937fafa3ef0933c12e65ea741129 |     
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/f362d3008af188d6dc8c462dc50a070a5dadbc49 | ORPH
  sparc64    |    libphidget-1.24.20260127    | NOK | https://autobuild.buildroot.org/results/91f698148fd83bd5b278b75a37d058ee8ac07f58 |     
 aarch64_be  |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/eba2f5e8a04873bffb31187d8ed4f663486b0095 | ORPH
 powerpc64   |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/931acc604605612ade597c9f265f43610dda5692 | ORPH
    hppa     |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/a56f2e00a057dc65ad4b79c66eea570b97aa9491 | ORPH
   x86_64    |         linux-6.19.11          | NOK | https://autobuild.buildroot.org/results/d7e5f77ef869a9ab2a16316d68254956d28e54d0 | ORPH
   x86_64    |         linux-6.19.11          | NOK | https://autobuild.buildroot.org/results/2a39394b6100ab26794fa6988e27348599fc128f | ORPH
    sh4      |         linux-headers          | TIM | https://autobuild.buildroot.org/results/2858f57b7faa6a9ed802e04b4b6c18de964c2027 |     
  riscv64    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/c81c7642687be1140098ea89ccdc5f073a7a60fa |     
  powerpc    |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/d89122354e53603a28cf06dbe5458129ed402c91 |     
  sparc64    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/8ea1d287949e7bb425a2db7053534cc18e34da68 |     
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/c8a05eaada16f0ef54bdef01cd8af037dd865eed |     
 aarch64_be  |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/7a3194801f09ca4d17f76485ac28046905b87571 |     
  powerpc    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/d43e925c204f7f47c8920853ae84eb4750554e4f |     
 aarch64_be  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/e9a3ed42396746531152c313ac8861ca8d8e41d4 |     
   mipsel    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/efb43d2dc069f5ba9c56816d670a8a2a3682d9ae |     
  mips64el   |        openblas-0.3.32         | NOK | https://autobuild.buildroot.org/results/3f52fac88074e018612475120c1ab4f0a161f8cb |     
  mips64el   |        openblas-0.3.32         | NOK | https://autobuild.buildroot.org/results/25ef34b5949e5319f35160065f956bd25bccc205 |     
  mips64el   |        openblas-0.3.32         | NOK | https://autobuild.buildroot.org/results/1f08ffa1f960553f7a8ba9bd974b0bc736241138 |     
  powerpc    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/353f722804914ccb14c109cb466b02a31ca3c799 |     
   sparc     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/9b79ae91a2f0d3ad0865cd87acc5f4d46b5e5239 | ORPH
    m68k     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/ff606998f0e240e250e78968330f4914910984d7 |     
  aarch64    | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/2b4792f4657af288249cc3c4d488a93b2cb253bf |     
    or1k     | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/69353974fb1550aafe8bd864da893db515d4b686 |     
 microblaze  | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/2bd2cea4315f4b3b2b579359d2c8312e30d6220c |     
   s390x     | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/94aa8c6af4530b08cb563ba4be1f019933471050 |     
    i686     |        procps-ng-4.0.6         | NOK | https://autobuild.buildroot.org/results/456740991d9e52570b114f9c6d3958dce8936627 | ORPH
   sh4eb     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/cb4a235e4c05105e7813c0cb367561ac59674530 | ORPH
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/b9ba3255da46a0aee232b36066873eeb7beb44f9 | ORPH
  aarch64    |      python-html5lib-1.1       | NOK | https://autobuild.buildroot.org/results/9275ad3db343307e84e24546cf458d555b350efc |     
   x86_64    |       python-numpy-2.4.0       | NOK | https://autobuild.buildroot.org/results/ec66cb375fe8f4284089956355ade2d71ed9dee5 |     
   mips64    |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/b9c97f6666dbfb6b87a1e1ee9d6c2cfe981b86c8 |     
   s390x     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/6f5b8be435631ffee96025b5470697bcf9752c8d |     
    m68k     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/314670e0f44fd2b8d41b2a42a136e5a5fbe0c1bf | ORPH
    mips     |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/fcf9ba91198d240a6b274d5e61f9b28197ae551d | ORPH
    m68k     |         systemd-258.4          | NOK | https://autobuild.buildroot.org/results/fa010b5dfaccbb0cb5a4f86d0464c7b73b0b0e1e |     
loongarch64  | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/e5bd44483c5ba1f03ef7353dac1d25f1b24667a1 | ORPH
   s390x     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/52cbf7e6dce23159f1e9f324210d4adc8ce6b126 | ORPH
  powerpc    | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/255c00de41d857f6bf9f4c3e92b0e1c579c0dd90 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/0213172b036816b01f7db90b9362568dacd1de22 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/af823daaefe586ebec866e4a737d3b6c43ac7f81 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/ef9c372ace4e7fee9e41f5949fee4ab00ea228a4 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/aae6a2bd6dcc5d58e251c334f9e953dfe49eec66 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/68f1b9f9cbf3377409f51ea1a6dc50ba3232e60d |     
 microblaze  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/fe82200864e0eabcd5f6138a384c1e63ada481f8 | ORPH
 powerpc64   | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/d50e40b7668b0051d42096d51a0eaa0176f5c5ae | ORPH
  aarch64    |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/77fd2e6c8c16acbe0a0b3b7ac4a1932dc5e283b5 |     
   mipsel    |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/1436f31cd35691f12a89fe6d38b315e04a607915 |     
    mips     |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/527c67fc329a21e6b03d2c1bde5a5c4bd9afc8e0 |     
   x86_64    |     util-linux-libs-2.41.3     | NOK | https://autobuild.buildroot.org/results/cbb2314dcf2538479b7293dcca8917db1798eb54 |     
  aarch64    | vexpress-firmware-901f81977... | NOK | https://autobuild.buildroot.org/results/d7b75054c200adba954fee6e32dc043745759367 | ORPH
   armeb     |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/c1deee65c6beb317246590b10ac5aab6a614cbb7 |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                  brotli-1.2.0 | 1 
           dmraid-1.0.0.rc16-3 | 1 
        ltp-testsuite-20250530 | 1 
                    olsr-0.9.8 | 1 
      passt-2025_06_11.0293c6f | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/a8b71fed6d711640cd42a79d2ba5e72ddacaca67 |     
powerpc64le  |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/f638f3f518c4dd4fb10988ad84dc2f91bbd5a6ae |     
  aarch64    |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/95170c11f8e30d95d23f5041ba84ebc5760493ce |     
loongarch64  |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/c596d74a4e6cae881e189778a10810f918c1b75f | ORPH
    arc      |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/16402ed44ed6c21493d9af6b92914500ea4cd007 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-python-lxml-5.3.0 | 2 
        ltp-testsuite-20250130 | 2 
squeezelite-71c012ad9ba102f... | 2 
firmware-utils-86739f2b3ae9... | 1 
    host-mender-artifact-4.0.0 | 1 
              host-rust-1.82.0 | 1 
                  libbpf-1.5.0 | 1 
     linux-5.10.246-cip66-rt29 | 1 
               linux-pam-1.6.1 | 1 
           oath-toolkit-2.6.12 | 1 
procrank_linux-21c30ab4514a... | 1 
       riemann-c-client-1.10.5 | 1 
                 rtptools-1.22 | 1 
        s6-linux-utils-2.6.2.0 | 1 
                       unknown | 1 
              wireshark-4.2.14 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/468bedabaab313fa404c809fdb90c2b02979f57d |     
  aarch64    |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/2c6e3aaac944934dbeecebd2d37ebfa531c4ea7a |     
    or1k     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/e33532260879eec77b35b040e171da81159ffc7d |     
   sparc     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/67d08aedb4e4efa9ec95f10306949bd25cfd208f |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/dcf7600ad4df0f110c16ae0f145363791b90c38a |     
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/9446ae575270ff4c7ae68198bba1c161efe15098 |     
   mips64    |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/5a6a8d4af659ecaa93bafaed71c766df39bdb2a2 | ORPH
    arc      |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/63b27ed5157003de4542a37986d83945a2f0db2f | ORPH
  sparc64    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/f3b39238412c35da153a2d9295c53a7c50ff7992 |     
    sh4a     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/7f01f0c6787ae4feedc748e0259854da3af0fcff |     
 aarch64_be  |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/d0d456ed63fed0632f2def85df654d36b17ab04b |     
  riscv64    | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/07250d7269effdeb8ba03568d25f46b8d3aa9483 |     
microblazeel |    riemann-c-client-1.10.5     | NOK | https://autobuild.buildroot.org/results/cfd942c8cede14aa6df64b23dae5e078bd7493b5 | ORPH
    mips     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/b199dc37c4705813f20c289f9cf987e40ae4841b | ORPH
    arm      |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/15078cce32355045edcd2323d5affb9d66eb462f |     
 microblaze  | squeezelite-71c012ad9ba102f... | NOK | https://autobuild.buildroot.org/results/eb2b82a8030961ec71d7123fca5c604ee6b32278 |     
  aarch64    | squeezelite-71c012ad9ba102f... | NOK | https://autobuild.buildroot.org/results/56f520e6532ff7de65ec4cb1939c9fd971a6ede4 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/e28257a344eaff17393e3ca0339f04df8c159963 |     
    m68k     |        wireshark-4.2.14        | NOK | https://autobuild.buildroot.org/results/93803bee11a75eae2a693c8a92c24421bb029535 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
