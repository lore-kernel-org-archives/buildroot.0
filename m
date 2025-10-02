Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D63CAC5BB
	for <buildroot@archiver.kernel.org>; Thu,  2 Oct 2025 03:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53B8F61664;
	Thu,  2 Oct 2025 03:27:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9DdrlrTtpRtM; Thu,  2 Oct 2025 03:27:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98F9E61656
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98F9E61656;
	Thu,  2 Oct 2025 03:27:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CCAD72
 for <buildroot@buildroot.org>; Thu,  2 Oct 2025 03:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 822D341582
 for <buildroot@buildroot.org>; Thu,  2 Oct 2025 03:27:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CTLuvaGmAWSW for <buildroot@buildroot.org>;
 Thu,  2 Oct 2025 03:27:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D99954152C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D99954152C
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D99954152C
 for <buildroot@buildroot.org>; Thu,  2 Oct 2025 03:26:59 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-4060b4b1200so419289f8f.3
 for <buildroot@buildroot.org>; Wed, 01 Oct 2025 20:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759375618; x=1759980418;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y91UD+xLPGoU5SQCX6KDuYH7DwmTdawCXJMFl0Y0/KA=;
 b=Cn8kzd/kaVyCufV6p/g2ela8eF8vDAWM5nn1bIV9WX+BPqAbN6lt8nLdyFuaAEuCiR
 VtJarPf1yc215UC2S2hb474PzS/wp/jp0wcJ7CDAm5/BFCWGaKnUtFOk+a9WoSWrnTZ2
 LUHeP1U32t+rbcHN5Ih9D2X410h4wu7AmY8IpTZF4Hh0IX1Ym+4QCXVyurs3zesUBZSX
 n1baAtIR1EqzTVZFQ+Rr6yV8oxhZXE+U9XsbRLn7yJir2SXnaa/r9vq2shw6VTU15PGF
 +NHPirclgL2+0Z4x9N45Kd/biyY9D5LVc2GQgS3wn8HSfU+nD1uBtgFteoj6wqSeVokC
 G1ww==
X-Gm-Message-State: AOJu0YxQXK/TGBW0o6CowVgojlEML7m1rsGXCUGiZDMfQ2dD0OM9lv5i
 9f2uAJezofBhWjVJv51srrMh0zcEbLXZ245d56d1UPbgplrnm2eEDLEiYoe6sA==
X-Gm-Gg: ASbGnctSrHRd/p3NrtwBUjL7+CB3SYySAXY1WAdw3q6Yte0tKmUl4TfUFdlqh5lcyXk
 je4XGbF9jrJ0KG0t5vRt3MCLJiQUBl3JHzYZyHLrQ5y2VL7rjHd6Sn8aLy2gmu6irz+J5Rb8USa
 OLVcqw0lGwstgxVdcol6wfs2PvQ3oVNcoMVUd2ASQ/jnTm4jDEbGDOTp/UMLafxHBYyw20u+fxS
 Yh6x8oG/0RbkN4MHpgPBSyAkKpgLjH1ZaniZOsPdmR3wJ/srkqdfFay5tz7ycRteC38hJgehvCp
 MFZQXbjbc2RLRd2KgWgCg5BjZwXddvwVhFh9dFKW6OuQQQTThI+z/EwBQnZyHMIN25jBoFJ5ygH
 PvivvjtjctDHfuLXfJhAxlDYQ34kIo0O4GXCP41U3LO+lLsb5UMSGPQ==
X-Google-Smtp-Source: AGHT+IFcNWPoKhdAmfdgfSsJHcw5Zd1iyxZmMTYGO0g4jRUSuqt+WJqohZ4L8CY7PRTRqwaQjk3KNA==
X-Received: by 2002:a05:6000:26c3:b0:3e8:94d3:766b with SMTP id
 ffacd0b85a97d-425577edc17mr3573947f8f.1.1759375617390; 
 Wed, 01 Oct 2025 20:26:57 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8f4ccesm1547582f8f.59.2025.10.01.20.26.57
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 20:26:57 -0700 (PDT)
Message-ID: <68ddf101.df0a0220.8a099.41a2@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 02 Oct 2025 03:26:57 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759375618; x=1759980418; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Y91UD+xLPGoU5SQCX6KDuYH7DwmTdawCXJMFl0Y0/KA=;
 b=YndRuVFsNBDVB1XAFvPfGq8MXFvIAukbx0bvwyaXHxyWkebJqj6Jk1K9xG5IXxd54N
 /WnDHu+RTWt+DoMPgJ35lh40Vq38u+HSrKPppNk5gXJJTcgJ40fiIvbl8cYzorRVptre
 kD2f+HP7LlWkxv9DnDruloYgsEggRRxiurknfY8cfXWo31ySYX2FZtSTyb0HZ/1LGRCM
 5ah7hUAc3Zu+3/Cw8Bu6G6qQ/ReeO8zm7Z8g1ZTeXJ6NsnayuiXUjFIB8+hKTX/Feewe
 5Ckg0wYjex8TQ0He1j2At7dawztY1twqWJU2tE4lySHXr6H6qjQtWsYjWFWDr0IlKvmi
 NsVw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YndRuVFs
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-10-01
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

Autobuild statistics for 2025-10-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 12  |  6  |  0  | 18  |
  2025.05.x  |  2  |  0  |  0  |  2  |
  2025.08.x  |  1  |  5  |  0  |  6  |
    master   | 30  | 87  |  0  | 117 |

Classification of failures by reason for master
-----------------------------------------------

        vulkan-headers-1.4.317 | 6 
package/linux-headers/linux... | 5 
  gobject-introspection-1.84.0 | 4 
                       unknown | 4 
                   cvs-1.12.13 | 3 
                 libgee-0.20.6 | 3 
     linux-5.10.162-cip24-rt10 | 3 
                    mpir-3.0.0 | 3 
               bctoolbox-4.4.8 | 2 
             dahdi-linux-3.3.0 | 2 
firmware-utils-86739f2b3ae9... | 2 
glibc-2.42-3-gbc13db7393773... | 2 
                libcurl-8.16.0 | 2 
libdbi-drivers-0bfae6c43134... | 2 
                libselinux-3.9 | 2 
                  linux-6.16.7 | 2 
                apr-util-1.6.3 | 1 
               arp-scan-1.10.0 | 1 
                 c-icap-0.5.10 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                    dust-1.2.3 | 1 
               dvbsnoop-1.4.50 | 1 
                 gerbera-2.4.1 | 1 
                     grep-3.12 | 1 
host-am335x-pru-package-5f3... | 1 
                 host-gdb-14.2 | 1 
               host-make-4.4.1 | 1 
 host-softether-4.30-9700-beta | 1 
                 inadyn-2.12.0 | 1 
                 libbson-1.9.5 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
                libglvnd-1.4.0 | 1 
                 libiconv-1.15 | 1 
                  libite-2.6.1 | 1 
                 libjcat-0.2.3 | 1 
           libmaxminddb-1.10.0 | 1 
              libmhash-0.9.9.9 | 1 
           libmicrohttpd-1.0.2 | 1 
                  libnids-1.26 | 1 
     libphidget-2.1.9.20190409 | 1 
                  libsvg-0.1.4 | 1 
          linux-5.10.162-cip24 | 1 
            micropython-1.22.2 | 1 
                 netsnmp-5.9.4 | 1 
            paho-mqtt-c-1.3.14 | 1 
      passt-2025_06_11.0293c6f | 1 
                   perl-5.40.2 | 1 
               pulseaudio-17.0 | 1 
         python-orjson-3.10.15 | 1 
                 rtptools-1.22 | 1 
                s6-dns-2.4.0.0 | 1 
          sane-airscan-0.99.33 | 1 
                    sdl-1.2.15 | 1 
                 siproxd-0.8.3 | 1 
               syslog-ng-4.8.3 | 1 
                   trinity-1.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |         apr-util-1.6.3         | NOK | https://autobuild.buildroot.org/results/350800f896d92efd17154dbdeff32fd157a46204 |     
    arc      |        arp-scan-1.10.0         | NOK | https://autobuild.buildroot.org/results/ef737322ac62d852dc4107e458fe3ef7a358ec89 |     
powerpc64le  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/954d8c5638c991de0c6de3309d4d97e1db1e53c8 | ORPH
   mips64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/6e20764422db3ac6e4814371dd73dcccf6337a50 | ORPH
   mips64    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/5202248c917daac4f2a1b7908ffc82f24834b37c | ORPH
    mips     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/4d74f45a460b3401aea61e8763adfa7f052ec785 | ORPH
  mips64el   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/86facd0e15fe0338fc7ef6b596043627060450d6 | ORPH
 microblaze  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/7a889f2474995278a2f397c0b79f14fde0ffc2ea | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a381ada57657b8e783108eb1716bc9835434af01 | ORPH
   mips64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/2336f0657ce86ab64ce4fb11c18e3d6966a0315c | ORPH
 microblaze  |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/f4b394eb8f8ae251b820d7a015dbd8bfb4aeef03 | ORPH
   s390x     |           dust-1.2.3           | NOK | https://autobuild.buildroot.org/results/06cee1af0fce4536ac5c323970ec9b6793518f49 | ORPH
    sh4a     |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/b1c07744137803abfaab2a4e06fb264790bb5e93 |     
 aarch64_be  | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/b0ac8702b43cdb6b4c97cd50dee19008607aa51c |     
   arceb     | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/cfd3d7a6ff1f7bf7751db5a15165007eaaef2713 |     
microblazeel |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/23f70c465ec18cd437f8583ff7b0afba3e8a95fb |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/346ed66d379ae85663e567a0ad5724e84799f9a6 |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/1b2e1ebed27b4944d5611b27f5a43498b064dd90 |     
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/bdf81dea942ff79a59ee105b6d5454d170f284c1 | ORPH
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/a920fe9cd654e25fb5877a416bb16cb47a3da124 | ORPH
  powerpc    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/295baf045dc0306a7090c6b72a8f05b607555c27 | ORPH
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/d69ae0eb05f2bcc8177eb197a91a3ec6f184e05f | ORPH
loongarch64  |           grep-3.12            | NOK | https://autobuild.buildroot.org/results/4067f483774713bafe812b57bd3bd40f1f2757b1 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/ac4fb0571ec1029966f08d880101a35591ec2db6 |     
   armeb     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/80b5282b0fdcd90d40e802423bee9e8db755291b | ORPH
loongarch64  |        host-make-4.4.1         | NOK | https://autobuild.buildroot.org/results/2654a0a0cfcc3d5be3aec93f2f4399cdae8a6d22 | ORPH
  aarch64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/38b82b77672661ff271470ed33c81e4618dad421 | ORPH
   mipsel    |         inadyn-2.12.0          | NOK | https://autobuild.buildroot.org/results/4d52a180f54436231c5b9894ba9edba72ab56492 |     
microblazeel |         libbson-1.9.5          | NOK | https://autobuild.buildroot.org/results/8ced6f19c6f816fe36e751025d5e46108cff27bd |     
  aarch64    |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/6367a8c2273536f412388279a040c80b35d7eb06 |     
   sparc     |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/a06909c0416f5108f6975b18a19299fd0569047a |     
   mipsel    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/cbe9c680e5d4237b84b8b2da38204b1ba369213a |     
    mips     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/b84a4e2982b6ed2275b4cc16e07b3a3859b39d66 |     
   s390x     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/3871aab39b93b03839214da779c7358aa91806f3 | ORPH
    arm      |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/e7c6beb60f9e57006246f2106d60fcddb3a1d532 |     
   sh4eb     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/4c4453afd985d4d1435c6478f65e5daba8c5b6a7 |     
   x86_64    |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/a57860b471541ab4a4a5e6a0efb8e1feb45fdaf1 |     
   armeb     |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/9fd86a740fdea858d70dcb88309246507a2b0d60 | ORPH
    or1k     |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/de48bfacfe2e302df4850d1d393cf4001e4d458c | ORPH
    m68k     |          libite-2.6.1          | NOK | https://autobuild.buildroot.org/results/c317e0577068113922b6cf3855eebdc238657ba5 |     
   armeb     |         libjcat-0.2.3          | NOK | https://autobuild.buildroot.org/results/f6fd6a2a5b62b7346ff46146aa2e36890ed14aed |     
   sparc     |      libmaxminddb-1.10.0       | NOK | https://autobuild.buildroot.org/results/d99140fceaafde3e4e34da70962636c3e54652af |     
   mips64    |        libmhash-0.9.9.9        | NOK | https://autobuild.buildroot.org/results/58a3e28543fc3f89a3fe16f27991bb4ce6471a8d | ORPH
   x86_64    |      libmicrohttpd-1.0.2       | NOK | https://autobuild.buildroot.org/results/4a5e92deb1df6c05095dd6dfa4a610c7d3cc5dae |     
  powerpc    |          libnids-1.26          | NOK | https://autobuild.buildroot.org/results/14cfa56c6ec89e2505b0af4161b70da97869e95e |     
  mips64el   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/603047c3f1d9652db8b71ec021f651ad1ad7fc54 |     
   mips64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/3867401fce8ae3e0f58de8e5341730432f79c795 |     
  aarch64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/6b59670dad70313b67b72bcb2a8cea0c018df8f9 |     
  riscv64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/6aa17613fc407e283c33e1c725f4d378e32cd17b |     
   mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/a7925401b2af999c5e33b4d496027458e5802e87 | ORPH
    or1k     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/30fe2e6743f62646aa57e43d9bb50b5216ab25f9 | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/10bb95e3c5158a68788135318198885ae40d6724 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/5114aa56a3daf25e539b72a8d354fd10fe96762a | ORPH
   x86_64    |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/44509238188e27309840bb3003d28b10a8f31545 | ORPH
 powerpc64   |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/717660c73a075a543a3712c7538674039c1bda0d | ORPH
   s390x     |       micropython-1.22.2       | NOK | https://autobuild.buildroot.org/results/976ebe7adf88dd272744f37363096202230e9afa |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/27266bd80ee4ef11ed92d23049557bf7903341b3 |     
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/905f205cf80564b00bdb35c7e1212e1c0774edda |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/142e234365f7c05b3f0e9371a1e0675960267d3a |     
   sh4eb     |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/6492ea0ae61919ae4fb8ea0d428008e9b6581067 | ORPH
loongarch64  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/5a33c68e11a0aad2159257aee53b68dc7f7314dd |     
   armeb     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/3d43d6a4ea34ee8b998250c509a26e69c09b0a52 |     
loongarch64  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/4f60265fc4be5d042d546c4910bedb6a938563fd |     
 microblaze  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/17d21f679b3b358276adfb3acf8bd1d916554635 |     
   armeb     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/a462b0dfe4fe105035064c146cbed5b793f3345d |     
   mips64    |       paho-mqtt-c-1.3.14       | NOK | https://autobuild.buildroot.org/results/1636fd42167d049c0247a9d94bfe38c9ee2398a3 |     
    mips     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/3f75c94a4df65d2094f3ae97afba3f9358337e37 | ORPH
  powerpc    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/843cd5acb6730d2b994b62e4a4cb21b8fcbb77ad |     
    or1k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/67278da0355e029795d79c2ce8dc45de0a1d1295 | ORPH
 powerpc64   |     python-orjson-3.10.15      | NOK | https://autobuild.buildroot.org/results/7e49d86853d546d6e10ffd3246380980f627186f |     
   s390x     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/98d269c9d205a572fae8465927e2cee7c8b97ff4 | ORPH
   armeb     |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/3c75d6905b282a9e9f79597e67afce748beb8cd3 |     
  aarch64    |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/6e4f159bd8b68a2565c7db68edfac001ea4a1058 |     
  mips64el   |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/39b01c412b3d92b83bd525c68754f111a425efd3 | ORPH
   s390x     |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/4f6b2d6f0f046d720f375345cb1a94dfa06cafb3 |     
  powerpc    |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/59d16c5316ec21c40763b0bb7ed9248ca1c571cd |     
  aarch64    |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/bcd91b4b7b98b2b4b5c9096558f1761f1ba0bfe0 | ORPH
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/d0393d2339455e71c97b0bb46956a27341e64f37 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/58688a2c2c024a119fd21b181fca9b5be463ba94 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/89e816ccf81625878a92daf426a3fd5db828336a |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/fd08f431bcb425d768925fc700b985c9f7b5251c |     
    mips     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/76203d408a8e215767ce99d7e4c6fbcf86214fb6 | ORPH
   armeb     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/94f390de67ec9ac319df959f9e19a5d28999a7bf | ORPH
   x86_64    |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/252f8b8986889b0a5235a210a13f2c4eeee1bc15 | ORPH
   s390x     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/1bd2bbac439be5b368e65d00ae2bef9622f766a5 | ORPH
powerpc64le  |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/43b630c4365a906b2e2efd932f7ce59f5fc98865 | ORPH
microblazeel |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/010a8d73cef77cbd1a4d2492f258cc6f129c7521 | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

  gobject-introspection-1.84.0 | 1 
             gtkiostream-1.8.0 | 1 
            igd2-for-linux-2.2 | 1 
                  linux-6.16.8 | 1 
                    quota-4.09 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/e0e78069ab674f432dcbeb4fbeea61476d068323 | ORPH
    sh4      |       gtkiostream-1.8.0        | NOK | https://autobuild.buildroot.org/results/88c445ec5e5e7a80edaae3a2aa03dacd4cf2c0e5 |     
microblazeel |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/3c5abe4e373d02c530b30cad9b2a97b14992c017 |     
    m68k     |          linux-6.16.8          | NOK | https://autobuild.buildroot.org/results/5bef4b02412ba9d605b49e2de308710bd3be1cc9 | ORPH
microblazeel |           quota-4.09           | NOK | https://autobuild.buildroot.org/results/dd6574585c5cfe8f7def7b10729ec8e78ce1f886 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
                 gerbera-2.4.1 | 1 
                 linux-6.12.48 | 1 
                   perl-5.40.2 | 1 
          perl-net-ssleay-1.94 | 1 
       sp-oops-extract-0.0.7-1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/b29b8472ac85736400b6753fd36eab5f81b7c4bd | ORPH
microblazeel |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/7b30f8cfb5343263814c570a3b2a30f4cde722dd |     
   sh4eb     |         linux-6.12.48          | NOK | https://autobuild.buildroot.org/results/c4f79dae297b881c69577f2ce89a2dc6fdab9109 | ORPH
   arceb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/5934fcc6f1ce502451f0e41eef3f74703855eec9 |     
    arm      |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/8a5c10b7cafb364414c284e8b1a4618c6a0330cb |     
   sparc     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/de30e151cecc57f07ee692e55b7c94c6a57d70ec |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
