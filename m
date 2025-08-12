Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23522CA0EC4
	for <buildroot@archiver.kernel.org>; Tue, 12 Aug 2025 03:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E5006129E;
	Tue, 12 Aug 2025 03:14:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4a0SoPQoJ9AL; Tue, 12 Aug 2025 03:14:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C10061297
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C10061297;
	Tue, 12 Aug 2025 03:14:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 53E84183
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 03:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4614E41137
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 03:14:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wnfp1l2Pv6VE for <buildroot@buildroot.org>;
 Tue, 12 Aug 2025 03:14:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2529441D5F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2529441D5F
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2529441D5F
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 03:14:22 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-af9618282a5so961870866b.2
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 20:14:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754968460; x=1755573260;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/aGT+Rv57XwBnbCkfduyIXlWQkeSG4m3ymVl9Mv7YmE=;
 b=M3pkKPiIx9VbLmn1088XFD8ZyslJ3J6+7AoANDrleVdiHqa5nLyNGsmfyJUVFlfHfY
 taAKgYjRiyYfX1qPPWf60cZjS9fy+cfVVdZt1jM2stK8PImtK4whTS2Cx4eOfZmnMGTZ
 0atmAHPf6pp/jA22qFf7DpPsZ54QtqAfLHxzSY09NNQA/Z335naojkTtABaVOeARphRR
 UCMF4VDn5T5B3K/Ic2mYCF2HM7uC9snMULFROcOEY4cqmGs3p6XI5cizkqhDcBdWUnm6
 1LDQjUUdczBVZvWk8eBQZVsefJYVhVFodEon0UnqwrVFhgYNtZ3UxJF5Xswij00pG9Rc
 PXzA==
X-Gm-Message-State: AOJu0Yx8Rodpv+9qWOv5TGx0a0MjX2jUQICWMYdHFCFR8zFqZ21jGvO/
 82pE2ON4ZD5CdbpmUajbmASl3ejMlmyTnqZX1rsS+QbYsoZ4G31WJi5lm4Xq6Q==
X-Gm-Gg: ASbGncu0hhqvPuL1G3pghMWk8oBOLo5Nd9m1ato9ppP++9DmH235yq2y8/ZvhpwEFH/
 5RySaM+puDnMfl9jDQ3yoM0Rt/bx9juuwt1iDVRgwsy+O9FzOnjcnWJ34Q+VilDEpZ9W+Fq+nfs
 ZIzLexigr4uQ4eK/4a3r1fhmsU3RmqWQCbeLFEakGzMaeISwzkuvHj3jsg5R8K5doLt9V2NYfU5
 Oq3ps33Un422Ix1xr+MLEjw6jPWQSx+SM/Ps9HxPROEs+tjNVwPBJNJUlmBAUhbLPMVDbehkmw8
 ZZ+BJl2WVG4dXnbNG401gQZUjDPg19TSGs9zD7TbaKU+muYaqLcYD4T0nm8kE2aUA2NcEoyTV72
 SaKwswHLIgsI+4PE/6f7E76ouFQ==
X-Google-Smtp-Source: AGHT+IGqdt83W8Faeo9qGziWG9nS6qWziHXstu2T2GNXMYmft+5p6STZbVKAxJRsE1Mp03e3FyW0aQ==
X-Received: by 2002:a17:907:741:b0:ae4:a17:e6d2 with SMTP id
 a640c23a62f3a-afa1dfef73amr130818266b.24.1754968459526; 
 Mon, 11 Aug 2025 20:14:19 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6177dc4b209sm12237490a12.28.2025.08.11.20.14.19
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 20:14:19 -0700 (PDT)
Message-ID: <689ab18b.050a0220.31c061.61fa@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 12 Aug 2025 03:14:19 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754968460; x=1755573260; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=/aGT+Rv57XwBnbCkfduyIXlWQkeSG4m3ymVl9Mv7YmE=;
 b=JrEFZvSkUHelg/ZBuHmyYeCzKKRglQuzavfpaXFbz6hKp6LumqDPBuVkUGdJs2su3C
 vB+gnEU5UQRsvpZmuXqLzoUQTITYBnyocuZRJcjW81OSzmk4WA1aWHsUmK9GuUevC1aO
 VNwEjhVPWtLSYfuEmv0KeqzGgMNd3EAIGSVbuwiH5De0aP5/f2kXZHhJ/ZeLeisO9mS7
 l5Ewk+p+mYzyzipy832RFS5UVHLN2tSMwoGA2Gqvn7FH2Kb8yiBZiAuLQaCbfdyO7SlU
 CLilt36bBMsWWQU3uIFifrihmgixyovguDSq1XXTbTTX3jvxbrXT9L0O8wm+YS4xLar5
 0Krg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JrEFZvSk
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-08-11
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

Autobuild statistics for 2025-08-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  |  0  |  0  |  3  |
  2025.05.x  |  5  |  3  |  0  |  8  |
    master   | 24  | 109 |  2  | 135 |

Classification of failures by reason for master
-----------------------------------------------

                   bash-5.2.37 | 7 
            netstat-nat-1.4.10 | 5 
                   perl-5.40.2 | 5 
host-binutils-arc-2024.12-r... | 4 
                 host-gdb-14.2 | 3 
                  iozone-3.506 | 3 
libdbi-drivers-0bfae6c43134... | 3 
                liboauth-1.0.3 | 3 
                  prboom-2.5.0 | 3 
               bctoolbox-4.4.8 | 2 
                  cairo-1.18.4 | 2 
                 expect-5.45.4 | 2 
  gobject-introspection-1.84.0 | 2 
host-am335x-pru-package-5f3... | 2 
              host-guile-3.0.9 | 2 
               host-vde2-2.3.3 | 2 
                 libgee-0.20.6 | 2 
                  libsvg-0.1.4 | 2 
          linux-5.10.162-cip24 | 2 
                 linux-headers | 2 
                    mpir-3.0.0 | 2 
                    sdl-1.2.15 | 2 
        vulkan-headers-1.4.317 | 2 
                    wipe-2.3.1 | 2 
                 c-icap-0.5.10 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
                   cvs-1.12.13 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
                espflash-4.0.1 | 1 
              execline-2.9.6.1 | 1 
                flashrom-1.5.1 | 1 
              fluent-bit-4.0.3 | 1 
            gdk-pixbuf-2.42.12 | 1 
                haveged-1.9.19 | 1 
              host-rust-1.88.0 | 1 
      host-uboot-tools-2021.07 | 1 
              hyperfine-1.19.0 | 1 
                jemalloc-5.3.0 | 1 
                       jose-14 | 1 
               libcap-ng-0.8.5 | 1 
libdill-32d0e8b733416208e04... | 1 
                 libiconv-1.15 | 1 
                libkrb5-1.21.3 | 1 
        liblog4c-localtime-1.0 | 1 
              libopenssl-3.5.2 | 1 
              libselinux-3.8.1 | 1 
                libsepol-3.8.1 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
               libvorbis-1.3.7 | 1 
                    linux-6.16 | 1 
                lmbench-3.0-a9 | 1 
                 logsurfer-1.8 | 1 
              mariadb-10.11.11 | 1 
                 netsnmp-5.9.4 | 1 
                     nvme-1.12 | 1 
                openvpn-2.6.14 | 1 
            python-yarl-1.18.3 | 1 
                python3-3.13.5 | 1 
         s6-networking-2.7.0.4 | 1 
     s6-portable-utils-2.3.0.4 | 1 
                setserial-2.17 | 1 
                    sslh-2.0.1 | 1 
                   thttpd-2.29 | 1 
              tinyssh-20240101 | 1 
                   trinity-1.9 | 1 
                       unknown | 1 
                     unzip-6.0 | 1 
        wireless_tools-30.pre9 | 1 
                 xinetd-2.3.15 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/0bffa10545efe1709c13da4fc562c8d824529db2 | ORPH
   mipsel    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/dc890bb7b771c91bbfd060bf2cf9a4419bb59db3 | ORPH
  sparc64    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/c90650ed0a5521561d195d8289fb137aa336e9d8 | ORPH
    i686     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/a325a55f2d2a802c42c3b12b047dd7a0bac698e9 | ORPH
 microblaze  |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/6b96b4529cc35fbf039408cc07dde3afe0127211 | ORPH
   sparc     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/88241aa1d9e1b4e69cc49a13219d621729eb3271 | ORPH
   mips64    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/3f57c25a9a56b6059f3e28bba4c54389d0bd5251 | ORPH
  powerpc    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/52f06e344372dd808b3da1d0314a6f26e8fe620b | ORPH
  aarch64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/0efba661dfd7d1860467585976dc2789247da51a | ORPH
   s390x     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/f4d0c64793b4dd4ff0a2a0c09a21215cd3d3be99 | ORPH
   xtensa    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/2c792d173e072a892ba5f531f227e42b780c4f26 |     
   xtensa    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/eb062d760cafd318b51e18a37c498e43346d3238 |     
    mips     | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/2a195a023c456b6f13c6e0e2b938556b19f0ded4 | ORPH
    arm      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/07b6548a2b9587b19040dfb16fff4f2f67e8f70a | ORPH
powerpc64le  | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/a9b5ea56488eb865ab97f05ca539f6a2b0f74110 | ORPH
 powerpc64   |         espflash-4.0.1         | NOK | https://autobuild.buildroot.org/results/a801f4981e95a20fbc010b1072a59d161ba238f3 |     
 powerpc64   |        execline-2.9.6.1        | NOK | https://autobuild.buildroot.org/results/5d34c9658cb8af437f0f685be777e6c08ea0d5ed |     
 powerpc64   |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/0deb77b1f2cd5d8ffb58c50c981b3d96b429b0e8 | ORPH
  sparc64    |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/47750da12308812d9b45c5301dc395c64015120b | ORPH
  mips64el   |         flashrom-1.5.1         | NOK | https://autobuild.buildroot.org/results/b000a434b51d134fadc55c79c3ce1add5d130e6f |     
   s390x     |        fluent-bit-4.0.3        | NOK | https://autobuild.buildroot.org/results/74c0c6be8e55b88ef6154903bf2b94ef5653f5af |     
  powerpc    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/8ddba61422898fe95daa90a48136980271b8d6e4 | ORPH
    sh4a     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/3216e8ceef88952f18c7ff218b3f1b1feb96cf38 | ORPH
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/d2953b5dda3a2161c0886e3df672c647ab7f5aa0 | ORPH
   xtensa    |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/fa30f9e4e2418b09b812a535fe9750b61cb12508 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/eebd1ce30051bcba96611e447c8b951002f49866 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/e41bea03be3265596d1d9655023676626dc5d433 |     
   arceb     | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/533325c6bacb197634823fbda14823b5b3654dce |     
    arc      | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/ee08689edb6ac49218787a226926784a20cb0ac5 |     
    arc      | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/1671f4fe6843ed28efcd2e75dc82e4e40752b3b1 |     
   arceb     | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/7378b46c76e5063b836bdafc044275dcf9678217 |     
   mips64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/7b27720fdbc04780c277f75d753bfcfa3874bdcd | ORPH
    i686     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/f540845e1160aa25ddeb05b8f469b613b640d28f | ORPH
   armeb     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/b8fa3ba31d93201b9be1e65ec8d80eeefc9fd1b4 | ORPH
  aarch64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/1f862d8a984201d8ed4aca1c01757dc3969ca3a7 |     
   armeb     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/d3d1ff94e11aefdeb4f354bb2767985a93d5bea3 |     
  aarch64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/775023922748544a15b5e4db826b3fcd1f7bfb1b |     
loongarch64  |    host-uboot-tools-2021.07    | NOK | https://autobuild.buildroot.org/results/caccf3caeba26fad235f3658437464fae7e15d14 | ORPH
    i686     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/edd6672cda675e59cdbd55b1d0712390523a4e84 | ORPH
    i686     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/93518e9f1cd1eb3612a6dac4a3ab03901c8b0738 | ORPH
powerpc64le  |        hyperfine-1.19.0        | NOK | https://autobuild.buildroot.org/results/56bc285f07454803d94350ac976b09b2ba1c2748 | ORPH
   armeb     |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/de3c51c3b586f6d4ae942284760dbc9e08690dd3 |     
   arceb     |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/5e861ab9e5fce2f62208f8f4e3c4050439c20650 |     
powerpc64le  |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/384b2682d45f65aecb74393c648d4ab100ecb2c2 |     
    m68k     |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/57c68aad9abcce7621fbff52081da041485e8830 |     
    i686     |            jose-14             | NOK | https://autobuild.buildroot.org/results/3952280d46e361d670f30807a69159a98e7f276d |     
  riscv64    |        libcap-ng-0.8.5         | NOK | https://autobuild.buildroot.org/results/a21c6f0cfbf562c5050fc0eaf1793fd17fff490e |     
powerpc64le  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/3833c29a5275dcd651388f7e03aa84b69d45589f |     
   s390x     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/13e359335eac9d3dbc630a588f6581eb8620be8f |     
    mips     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/4f95aceb85932a11a4f20659ddc8ff922dda2f56 |     
  sparc64    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/aa794c71800e2495dd6999ec61a16f186193dab4 |     
loongarch64  |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/8decc5a077de0c3fca37cc67f1a23535b97f7072 |     
  sparc64    |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/6d087bbe929adc4baf7def0a473467b00552c686 |     
    or1k     |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/6b4c0dd30742acd27d2598f9602f18147ca18357 | ORPH
   s390x     |         libkrb5-1.21.3         | NOK | https://autobuild.buildroot.org/results/0b09eed2850ddb875f16684eaaf3dcca4be3505c |     
loongarch64  |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/e176ef9379c03444888c4feaf20b21a1ad588d6b |     
    mips     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/338d9e6b399cdb6a4f9e819d1616613206bd6a1c | ORPH
    mips     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/c893a68306bfe6bc7344e1560cfb3bf3f39eb522 | ORPH
   x86_64    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/d7c4c45bb3d0375d36466e6ad867e6cd7d58d89d | ORPH
  riscv64    |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/0814d464f71dc22a580dd463e35cc85af0444650 | ORPH
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/f6d065e0a6cf708cc38dacadbd700019fc10545c |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/3e1797d68c2fcad3b748d6f3b2ab31e64c3882c6 |     
loongarch64  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/1f04f4cdf262b1b798df6382204fa09039db089c |     
    sh4a     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/d212c9a0989449cb5aa2106df17ca9f5ceca8f9d |     
  powerpc    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/e74c69894ef9fbb7ae21c53c328e20d7b2a1d8cd | ORPH
  powerpc    |        libvorbis-1.3.7         | NOK | https://autobuild.buildroot.org/results/cee2f0632f7bab193f1b5da4387317bcc4a3465f |     
    mips     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/0abbc2961b99d99fad934353b17a9b6eb82e9e23 | ORPH
    mips     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/2069bf2d7aa2cc532bd53bd1451f46d2743ebae9 | ORPH
  mips64el   |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/899bddc9a9c62d6b6d492eb9174e5bfbaa486f72 | ORPH
  mips64el   |         linux-headers          | TIM | https://autobuild.buildroot.org/results/7bc96dd4559eb1609aaf84c059a0c119c8ba1d0e |     
  mips64el   |         linux-headers          | TIM | https://autobuild.buildroot.org/results/17dcd06a5ff30d4129b9505523c69fdbdefca8c6 |     
   x86_64    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/c27a36535ee3ad25d16f494af4202008a34792d0 | ORPH
microblazeel |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/676f6a83807c8684e3e6098bb69de470a47850d9 |     
  aarch64    |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/f74fcd7ac4cc904c95deb3dc400fc916d595f5f3 | ORPH
    i686     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/6bd49888b2cc865c307f10d6326089921dcc186a |     
  mips64el   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/daddd795bf902721bb51c47f3adf7aa523cab3ad |     
loongarch64  |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/5cda42ba4374cc9bc2b79734c057f49b37d4a0e0 | ORPH
    sh4      |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/5fa8894b250e69005dd6e45799de8c0c6ab13298 | ORPH
  aarch64    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/17f534006b74249059f9c41a303489343e3562bc | ORPH
   s390x     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/d82ee7fc9a4ccef1dbd36a64b5a88d7e70655298 | ORPH
 aarch64_be  |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/0f9d5f7f0af581882f9a7e134c7dddde9f5a1fa0 | ORPH
   mips64    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/9852ff88532838ae434b932017cefd96c1e020c8 | ORPH
powerpc64le  |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/3a8b9af5e127533b97f3beee4c6ba13729726943 | ORPH
 aarch64_be  |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/5bcdc2c7ff67a182330cdf14459357b9b3d21a9f |     
    sh4a     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/81d32d82b8aab1ffb0cc6a00415df8dfc03c8988 |     
microblazeel |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/c1783192565639ce9fcc98483a29b5327a6f472c |     
  mips64el   |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/70a789f1c5a464440ff6355b9b44220f0c80fa7b |     
    or1k     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/045ec2915c4779b86bd662183a9c09e27e613d57 |     
  mips64el   |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/c4a007ffd7ed48ab415e1e87951e5dd166e5706c |     
    i686     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/300dd40213d5e46807c52c2343b60a9a8388302e | ORPH
   x86_64    |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/70b78b6147cbf8f298a312a99afab6216ce8ec84 | ORPH
   x86_64    |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/10f928480f1e237b4594d5df6dfaf8dc333a620d | ORPH
 powerpc64   |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/7ecabecf98a537520231198a247faea8755efd94 |     
   sh4aeb    |         python3-3.13.5         | NOK | https://autobuild.buildroot.org/results/62705d0c4d265a1e283263452767267a49eb1448 |     
loongarch64  |     s6-networking-2.7.0.4      | NOK | https://autobuild.buildroot.org/results/56f55461aa587c24abbc81cbe227003978bc70fb |     
   s390x     |   s6-portable-utils-2.3.0.4    | NOK | https://autobuild.buildroot.org/results/ae767be1a658073ca1e918102c46be5a5779de87 |     
 aarch64_be  |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/142e20a56f6110472b9d191a551060e90b2d0631 | ORPH
    i686     |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/d1e9e4584acc36a4cae7c4946d50e9adf9912c7b | ORPH
powerpc64le  |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/ce7d7f31c652eeed2d5039df966130b1ae1d6963 | ORPH
    m68k     |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/323cd3fba7ff61ce1a5f9a911368b108899a6dae | ORPH
   sh4eb     |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/756e6d7340c90dc6fc76b40b86343aeb14dd83e2 | ORPH
powerpc64le  |        tinyssh-20240101        | NOK | https://autobuild.buildroot.org/results/1b7d2329f5bc0949257d64412ca56f9466928c56 |     
   armeb     |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/6c2baf95bac83af432d931bcea4d0ffc63e5df44 | ORPH
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/2281c4bc54d0e72a32f3c58768f48f1c9e27527f |     
microblazeel |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/ed1d8c67ebb4325e46eaf2cb8d60a4609ee62954 |     
    mips     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/19893d4498a9d969896892c8474c7c65739baecc | ORPH
 microblaze  |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/a671d4ad7d238b845ab8049540b18b27d92e8d42 | ORPH
   sparc     |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/02fb8c5225fabeecc586caf6c4f4bd6b6778b188 | ORPH
 powerpc64   |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/cd9bdb2c5d9eef63aa3cf25df98d135ea744507a | ORPH
 aarch64_be  |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/d50379d7b68a5bb4337ca58d8a78818a5bd3174b |     
   sparc     |         xinetd-2.3.15          | NOK | https://autobuild.buildroot.org/results/d478136feca66fc719e1d9e6cbe30170d91e1ac3 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

              host-rust-1.86.0 | 1 
                    sdl-1.2.15 | 1 
toolchain-external-bootlin-... | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/a44cbd2c795b6d23374e5c1281044e95a377a82d |     
   mips64    |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/623c17fc376cfcf540685ab440d9da927d3f9792 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/cc59636760848eefd3b90c8c57e34500f5de192e | ORPH


Gitlab CI results for 2025-08-11
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10975874782 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10975874541 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10975828975 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10975828871 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10975828770 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10975804971 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859494 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859491 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859489 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859482 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859479 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859474 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859471 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859469 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859467 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859465 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859463 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859461 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859458 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859456 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859450 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859448 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859445 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859444 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859353 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859348 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859344 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859340 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859338 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859326 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859292 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859266 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859232 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859178 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859171 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859149 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859147 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859129 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859116 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859114 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859111 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859093 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859090 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859082 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859068 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859056 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859039 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972858979 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972858955 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972858944 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972858943 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972858935 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972858931 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972858929 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972858919 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972858917 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972858904 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972858903 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972858897 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972858878 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972858868 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972858864 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972858748 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972858746 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972858712 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972858692 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972858686 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10972858680 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
