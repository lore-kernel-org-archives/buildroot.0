Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85433CA0EEB
	for <buildroot@archiver.kernel.org>; Fri, 22 Aug 2025 03:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F383580EAA;
	Fri, 22 Aug 2025 03:20:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RDbwLmF2EnTB; Fri, 22 Aug 2025 03:20:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5213E81233
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5213E81233;
	Fri, 22 Aug 2025 03:20:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 69A581C8
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 03:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FED84052B
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 03:20:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qwy0uvsa63WC for <buildroot@buildroot.org>;
 Fri, 22 Aug 2025 03:20:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 732F840522
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 732F840522
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 732F840522
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 03:20:34 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-afcb79f659aso272903066b.2
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 20:20:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755832832; x=1756437632;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5LiLYcyd5qQxTn3LIrfnh3Is559JQspoNBG3mb/b0j8=;
 b=WCAm1BLoefgY1fLb/4kiT9oyIRRr5LWB2VEJ1ZVcMcSnSYn/MLg9l54pbFhguY2NOT
 mLiOp/XePwSghBVY4iCqnBcbpt25ACUYF600kbumn3K6+h0dhK6hJmCkjJQ21gAlGuNk
 wZahDeb/DHvca8QWT9Rofr6SEYhIPXf4izQnbkAglJ8DKIFrvIutSRiDPLdBv8zHzIdT
 0Q/JSOTfd8/hbTfctNKCaYymnLnD0Fsu3zy13l4p3FO5b+ssFzKTCSl5y1S3jKzzI3oD
 GbpT1Z8T/jkvApEoThur0PCO+fdN9kaT0ekC0tUmee4ExEpmoWaMm/uUU3LQXz5dUtWW
 MpBw==
X-Gm-Message-State: AOJu0YwT3RXpMhdpJva4d5jUL6HwkpWaAF36dHOwu/BR1aSwon2zp9Rc
 AfQOLH9z5qfQFRHtJEZZVR+VnY65WBh3tfyrVpbvkT666KI1rT3dd2CwqN8uXQ==
X-Gm-Gg: ASbGnctKmcz/wBKl6IRWWWZsmZsPEUB115K3mnJuFZ6kIoTruNMFmUx8wcvmE6L9AiK
 Go8aZxbOfrpz1andrON/6tWqOkiB5PaetqF9suvnPOUUJ82Tvc7JwS0wutaIV3MlZXX9vZe1VYB
 WvLluwx1i9d1VhqV3Xl7A09RMDMLefd+OHUeRvX1BuB1oZpuOKnFtEEXxUcXD3nESVQh8BRLhT+
 CNpAF1EEww4rbflD+Ykkc6voye+oexQEoWyzYnbPUEequy1HXOOIWva0oMySJmBzGi1zjP3o2l5
 ON4XZR5Vs2ctU/fd8dX0pMCZyIUyWhGFhV5uutlf/M/yDQCr32C3/XoGxX+2EB0I76MazR/A8Td
 EYT4ZIyfy58BCPp9HwpbUcE/eNAfAJrCnB/OTZlmc
X-Google-Smtp-Source: AGHT+IFreeGmjCfuu8M858Wmwo5rXwZJAdPdB1yLoj9B3gg3dvfQZP6OIMkJM8REYZuW43UIl4qrew==
X-Received: by 2002:a17:907:7e97:b0:af1:d32f:3e89 with SMTP id
 a640c23a62f3a-afe2958aa0amr134213166b.31.1755832832064; 
 Thu, 21 Aug 2025 20:20:32 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afded539c13sm506819266b.116.2025.08.21.20.20.31
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 20:20:31 -0700 (PDT)
Message-ID: <68a7e1ff.170a0220.81df0.325c@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 22 Aug 2025 03:20:31 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755832832; x=1756437632; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=5LiLYcyd5qQxTn3LIrfnh3Is559JQspoNBG3mb/b0j8=;
 b=K1h0yKY6rW5ziEh5l3EgyqpJdAiCr3fsryL7feIN0WW9DvRGJk3I0OkhbumpxrRhOR
 jGgWN4A57dPvn2AH94in9kXGKUFtZO1TileiUdqmaQfHQbpi0QCltKxmK8msP9bPqKax
 qkJozaXAE64taDJkztQfoVTB5GWvK/N1ly8TLNTiipVewV+nFaKwP7u+MTcqQoJK6L7I
 ZG9nwiaokZq+fbWJhhH9HEhL37vsTpDrV/OHs5ZJ+q4XVj1Z3qaAvo9zTMuLSyggwJO+
 yckYhJI2oPUGUHCdK96gjJCRcadRUH0rHXJI16gmA47+kghIGVUtUKuguY23MV4Jm9Nn
 aBIA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=K1h0yKY6
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-08-21
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

Autobuild statistics for 2025-08-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  8  |  3  |  0  | 11  |
  2025.05.x  |  3  |  7  |  0  | 10  |
    master   | 29  | 115 |  0  | 144 |
     next    |  0  |  4  |  0  |  4  |

Classification of failures by reason for master
-----------------------------------------------

                 host-gdb-14.2 | 6 
libdbi-drivers-0bfae6c43134... | 6 
                 libgee-0.20.6 | 5 
                       unknown | 5 
        liblog4c-localtime-1.0 | 4 
                   thttpd-2.29 | 4 
                   cvs-1.12.13 | 3 
            gdk-pixbuf-2.42.12 | 3 
host-binutils-arc-2024.12-r... | 3 
                       jose-14 | 3 
                liboauth-1.0.3 | 3 
libsvgtiny-ea9d99fc8b231c22... | 3 
                 logsurfer-1.8 | 3 
        vulkan-headers-1.4.317 | 3 
                 c-icap-0.5.10 | 2 
                     criu-3.19 | 2 
               ebtables-2.0.11 | 2 
              libselinux-3.8.1 | 2 
                    linux-6.16 | 2 
        linux-headers-5.10.240 | 2 
      passt-2025_06_11.0293c6f | 2 
                 siproxd-0.8.3 | 2 
                   atop-2.11.0 | 1 
                   avrdude-8.0 | 1 
                    bat-0.25.0 | 1 
             batman-adv-2024.4 | 1 
                     bc-1.07.1 | 1 
               bctoolbox-4.4.8 | 1 
             bmap-writer-1.0.2 | 1 
brcm-patchram-plus-15bd6638... | 1 
           dmraid-1.0.0.rc16-3 | 1 
                enscript-1.6.6 | 1 
firmware-utils-86739f2b3ae9... | 1 
                flashrom-1.5.1 | 1 
               freeipmi-1.6.14 | 1 
glibc-2.41-70-g1502c248d58c... | 1 
  gobject-introspection-1.84.0 | 1 
          host-binutils-2.43.1 | 1 
                 host-gdb-15.2 | 1 
    host-llvm-libunwind-20.1.8 | 1 
               host-vde2-2.3.3 | 1 
              hyperfine-1.19.0 | 1 
            igd2-for-linux-2.2 | 1 
            igh-ethercat-1.6.3 | 1 
libdill-32d0e8b733416208e04... | 1 
              libgcrypt-1.11.1 | 1 
              libgeotiff-1.7.3 | 1 
             libgphoto2-2.5.27 | 1 
                 libgsm-1.0.22 | 1 
           libmicrohttpd-1.0.2 | 1 
              libopenssl-3.5.2 | 1 
     libphidget-2.1.9.20190409 | 1 
                libressl-3.9.2 | 1 
          linux-5.10.162-cip24 | 1 
                    mpir-3.0.0 | 1 
                 netsnmp-5.9.4 | 1 
                 openal-1.22.0 | 1 
                openocd-0.12.0 | 1 
                  parsec-1.4.1 | 1 
procrank_linux-21c30ab4514a... | 1 
             python-webpy-0.62 | 1 
               read-edid-3.0.2 | 1 
          refpolicy-2.20250213 | 1 
                 rtptools-1.22 | 1 
                    sslh-2.0.1 | 1 
                    uftp-5.0.3 | 1 
             util-linux-2.41.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/f205c357dbe13f43160108ab786cbfa599d93141 |     
  powerpc    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/6788f2485209cd84baec2b6e41172e3699cae490 |     
    i686     |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/8aeeaba497980e6eea8d45e0edb57c8e22908f2c |     
    or1k     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/395744df755bbbea0ddf6464719be25775974dbb |     
    or1k     |           bc-1.07.1            | NOK | https://autobuild.buildroot.org/results/c17f37ec1bd4e185b58fd750883dd293cd7eabd4 | ORPH
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/621ffb2e32b454f7cb9994b47195600635516b41 | ORPH
    or1k     |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/0c8d145af742c6a40dfd5ea54049ccebad384fd5 |     
    i686     | brcm-patchram-plus-15bd6638... | NOK | https://autobuild.buildroot.org/results/58b82183c6b69a24da57b5babbb6a4b6d03bb87e |     
    arc      |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/b4ce929ea5e6a2c0472ea2251646677374f1b923 | ORPH
loongarch64  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/e8b13d190512507fd174cce3bda3e9e3500b0298 | ORPH
   x86_64    |           criu-3.19            | NOK | https://autobuild.buildroot.org/results/8b6c16d5a183de9173d5facb1f35682b4e401b0a |     
  aarch64    |           criu-3.19            | NOK | https://autobuild.buildroot.org/results/5a8d007fc3193a1502c48e8ff1e054817783e920 |     
 microblaze  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/48ba7d452aab31dc31919ce17dc10db59b1f0378 | ORPH
    mips     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/6569a90ce5fd1afaea07c09d6689ef908eac4880 | ORPH
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/2b34a622232e2b2226ae17129b924dace986b497 | ORPH
    arm      |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/7c7b59739815f5864a14aff8aba2d6dace077d82 | ORPH
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/37085d4979a9c4edacfb8fd3950a740028cfa11a |     
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/f4b03b42b3a7a7d7bed4a06f8764baa1e0573bf9 |     
   sparc     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/edeb8d27a4d3dd92fb48292e65d703d95ec27cf3 | ORPH
  aarch64    | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/43b022e546cf6dcf01feb6edcf9eb874ff00ab51 |     
 aarch64_be  |         flashrom-1.5.1         | NOK | https://autobuild.buildroot.org/results/94232910a0b87606d702fe69b66e5f2ddd812677 |     
microblazeel |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/c9ac98c0515ba5132bdcb84d59477c2b86a7badf |     
microblazeel |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/745e009010a510c962e95992d1d5f55661ccb710 | ORPH
 aarch64_be  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/ba84ee9d831383ee80873addfd5bc573d9f0ba0d | ORPH
   mips64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/826aa72c6b3613c299fd946febace128ef84f45d | ORPH
   arceb     | glibc-2.41-70-g1502c248d58c... | NOK | https://autobuild.buildroot.org/results/da95edf2a6f25348290e8606c3551da4eb4f61b1 |     
    sh4      |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/285e81812a50e0fe36db6a4220b802484fb63f0b | ORPH
  aarch64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d45c9629b9a695ef004941773e1c10c8bcc62784 |     
    arc      | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/d2bb80958320cb1315f19048c588b1d5e22375ea |     
   arceb     | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/eee142ec6b6ad14ef07ac8f0ce863cc22527a5d1 |     
   arceb     | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/084842d999a93d0542333a06816f4e5c03438327 |     
   s390x     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/194fecac1efb99cb76dcad27b69e3e7d4a8e59dc | ORPH
    m68k     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/22fd3143d5b19ec12930825eeeff1c3e55c0ec51 | ORPH
 powerpc64   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/22a9513719fa5efe51d7b9e5ed267c69997ecbea | ORPH
  powerpc    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/b700109be275a9562e2f9f9bef880d8f7d2bdcc4 | ORPH
  mips64el   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/da52049415978d02757e393bce27df1d8fb6d8b0 | ORPH
   mips64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/b966b44e242cc4d18d7f44f7546cda6810b57cee | ORPH
  riscv64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/a9167f3c4616fb2c499fd7ade01df6435c812351 | ORPH
  aarch64    |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/5ed45e5d00d2c7bcd7383ba638bfc8f673b7bd34 |     
    or1k     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/ebeeffdfaa44454816c99c1638c3d9d8a8d49c91 | ORPH
  aarch64    |        hyperfine-1.19.0        | NOK | https://autobuild.buildroot.org/results/8b812763b880e66850c2f85b71520a693c2fbbf5 | ORPH
   armeb     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/19570ff8fc4e7e98de8dfedce76f37be6acf925d |     
  mips64el   |       igh-ethercat-1.6.3       | NOK | https://autobuild.buildroot.org/results/9a2f83d6634509b2d73ef4e554688567dd48ec7a |     
   sparc     |            jose-14             | NOK | https://autobuild.buildroot.org/results/f2be6ae6948b49d9b6ed6d3b69ef2df4e93e69d1 |     
   sparc     |            jose-14             | NOK | https://autobuild.buildroot.org/results/f53a97a8cb331acf9ac3f692a566e810cdd2c031 |     
    or1k     |            jose-14             | NOK | https://autobuild.buildroot.org/results/e735fbb9281438a5911bfc71f42a8b93b813ad44 |     
   xtensa    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/044ef0a4e6dcb32b2178614bafec4a98cad9d9ba |     
  mips64el   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/563ae8481776453a85e3307724c8c115448b8356 |     
   sparc     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/30752f2cbb2a8635bd05172b452546f01510b3e6 |     
    arm      | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/9e39c207cf466c173c58bf9ff2351d405ec291d8 |     
   armeb     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/fef05a721bcd7778e199856eb95357c6d697a647 |     
   sparc     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/8a945b800b044ae1d284edcc482e0af8761532e4 |     
  sparc64    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/43b3c3f0ddf4ce15691c2af1e48a86757dc18d14 |     
  riscv64    |        libgcrypt-1.11.1        | NOK | https://autobuild.buildroot.org/results/6db12cafa7a8d337ecab8f6d6d20d9bbf11c01f6 | ORPH
microblazeel |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/a91c1b5521dcd7f2e6b6f8404ce90dfd329c8526 |     
microblazeel |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/3b39109b87fa8d7539f0ab67f7b5128705fc5c28 |     
 aarch64_be  |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/62125745915ba03c2664129707449d1bfa69d7c1 |     
 microblaze  |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/46998116b00f87ee64de9526ea8d4d71cdff4a85 |     
    m68k     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/32af41f3ae658b5b39540dd74280df4831724201 |     
microblazeel |        libgeotiff-1.7.3        | NOK | https://autobuild.buildroot.org/results/7929f88cf6d4d9ab97fc41d49eda48d833ee7b13 |     
    i686     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/919883c5ddae2dc0237a7be4b37d529cdd1fe9c6 | ORPH
 microblaze  |         libgsm-1.0.22          | NOK | https://autobuild.buildroot.org/results/95f0ff842e4fddcf9d2ffaeb7ddbb9abeb821319 | ORPH
    i686     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/084ee88b77e7ec67b4e262a104b724b9f116c713 |     
 aarch64_be  |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/6b0542711daaf982bbbbe9c7711d9e5414239bd4 |     
    arm      |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/d42e838751b042ebd8068cfee72db32da2a3d3a6 |     
loongarch64  |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/4b31f4db00ce7171798ff93c131b1496e79012b2 |     
   xtensa    |      libmicrohttpd-1.0.2       | NOK | https://autobuild.buildroot.org/results/c3d7bedc093bc40071a887b0a76b300b464641ed |     
  sparc64    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/31a10c7bd8d5f5a37c71def1e5560e261acc3f6a | ORPH
  powerpc    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/c548b214c2b23545335943f59d1b3c3b28d2c9ac | ORPH
 powerpc64   |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/7a76e53918ca751d78d2141d8f86aed27d7d7f88 | ORPH
    arc      |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/6347fca5f5db444265ee7bfc69be0aa2b33b1e40 | ORPH
loongarch64  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/a9df356a65195815a974ceaf05047d3556581020 |     
   armeb     |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/50adc67e066b0df9450ff91569d9031008f6e643 | ORPH
  mips64el   |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/93b587c9721120cdd6b5d9d7e8ccc3b80b84f5a5 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/4d2881b680b2bff6bf2dac7da4b88f42f8f8ef16 |     
loongarch64  | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/6c2ee70c2642aa02334498f14646570df8b0c820 | ORPH
   s390x     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/de4f7879e7c4b33136577f638bf7759191e4bee0 | ORPH
   x86_64    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/7c926422ed89fb69a90b1eaf56a7a8de126f284b | ORPH
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/d28f4605ee05e620155751e40cfcd1295637476c | ORPH
    m68k     |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/0bb8f0c3af4f57ed9684af78cffca06ff6579d3e | ORPH
   x86_64    |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/49066e1616bae50c770e05d14d82591f6f63b155 | ORPH
loongarch64  |     linux-headers-5.10.240     | NOK | https://autobuild.buildroot.org/results/70b1a36e992cfdfc5b72e51581e647f485baee0b | ORPH
loongarch64  |     linux-headers-5.10.240     | NOK | https://autobuild.buildroot.org/results/1621e9de1170acc5229f99568b35155b6c668b05 | ORPH
powerpc64le  |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/4496fd81a48771f27b656f2dd3eab23f28e03e23 |     
powerpc64le  |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/b721f8a8498d4ba4742f0badb7c2eb7e7e2ba7b9 |     
   x86_64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/f6a9fb62b94a7cd4803877727bf3010b66d65be8 |     
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/7ab3064b1d6a5a4d123429802fe0c350811807a6 |     
    arm      |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/385a2e9e906b9daa486c5ab9513232c1e578a917 | ORPH
  mips64el   |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/346276a79d16af8e11909fcaf3a39a17990d22e9 | ORPH
 aarch64_be  |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/d5f2c994ea23c191ddbe2b26e9f6a8a16853771a | ORPH
 powerpc64   |          parsec-1.4.1          | NOK | https://autobuild.buildroot.org/results/a171cfe2683a74608f5da549e8d84805b28dcc66 |     
   sh4aeb    |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/75ac34acf7e253108d6f0165a48491e07b2dfa1b | ORPH
   xtensa    |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/94ee633d12c487c5e7f8fe3b36a8cc28a23f614b | ORPH
  aarch64    | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/9e2108315a2733e63bde2471a8a41435c748c26a | ORPH
  aarch64    |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/f2883060fb5467fc441a23ea4ffab09b3350ba79 |     
   xtensa    |        read-edid-3.0.2         | NOK | https://autobuild.buildroot.org/results/1ea6ad801ed27a2036c9a2da474fb434c84aa539 | ORPH
  aarch64    |      refpolicy-2.20250213      | NOK | https://autobuild.buildroot.org/results/79a06b7f747e37a4c5be3d559643e2b9e6210809 |     
  riscv64    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/ff0710ce1053a16d6f6b0cdd56f77075ca8ff070 | ORPH
 aarch64_be  |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/9b66900065f5fb11efe1320893fc67121ef62b76 |     
    m68k     |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/9fdfaeffef6902ce93096e31ad1422ec6ebb2405 |     
    mips     |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/086e0660d9006b0f35a8b7eb3e9a470568fa4121 | ORPH
  aarch64    |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/0e023af231513cf0eb717300820a40af03cb0e08 | ORPH
  aarch64    |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/817b809378338480946d24b036efadeeecfa4dd5 | ORPH
   s390x     |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/fa00f27d84b6b4894e0b4d03972d1655045ddf88 | ORPH
 aarch64_be  |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/e6787c8ba9711e17376ac383af1be26e8b7a7405 | ORPH
  aarch64    |           uftp-5.0.3           | NOK | https://autobuild.buildroot.org/results/33c22a41a8c485636f36792434e48d84f160842a | ORPH
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/5b6364da6cae7390e71eb155eeaf83e6d18588bd |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/0d6a253e928e53a5b9dd30ed3ed2da94f5a5145e |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/be86e31adc9fd8b80134dcb55854115eb2034096 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/5ff6904f2aac3cd4707c4bb5cbf249e7a9f1bde6 |     
  riscv32    |            unknown             | NOK | https://autobuild.buildroot.org/results/41bcd760a23c213e67c95af8dd52e268f94cd7bb |     
  riscv32    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/e1973263a1c88a800e1b01ca6805e3205b82e6a4 | ORPH
    or1k     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/694a5a7c978d48833395387a80b9912431fb8486 | ORPH
   mips64    |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/07e558501f10a627cf2591c83395f5f38b71f9d8 | ORPH
    m68k     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/69c2a731705938ae7af7015a865d227e29f15841 | ORPH


Classification of failures by reason for next
---------------------------------------------

              containerd-2.0.2 | 1 
                  libsvg-0.1.4 | 1 
                    linux-6.16 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        containerd-2.0.2        | NOK | https://autobuild.buildroot.org/results/e8a6fcc8daca3fe4f499a50d7dc7ed2c96c56d58 |     
   sparc     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/486d909a19d3c16ed083b97f0e267a4bfc8c4b12 |     
  powerpc    |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/5fd737dbf9dbd2242a2cb9933c317fd3244ee39a | ORPH
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/a28b6b1431b2ef2b42b7b1dc9f29ab949444d277 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               bctoolbox-4.4.8 | 2 
        s6-linux-utils-2.6.2.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/e0d9a8aeb98b5f1274feb1b486d01c5c38148bff | ORPH
  sparc64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/80083807b22547567a480fd14ef270b754af8ea2 | ORPH
   mips64    |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/987043b2b23b98ee809b68d4dd56f1b83665acce |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                 host-gdb-15.2 | 2 
libftdi1-v1.5-48-g22b4667a8... | 1 
          linux-5.10.162-cip24 | 1 
python-remi-2022.7.27-37-g1... | 1 
            python-yarl-1.18.3 | 1 
                       unknown | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4eb     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/837bfaea6df657d2ed9de0c0df05fc2b0abb954f | ORPH
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/f62bf94b43f439a0e391e1397cb3392423f5e261 | ORPH
  mips64el   | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/c64e3fa36ca5d3202ec98f10f9e97da4d6fcc019 |     
   arceb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/166869b92a3942cfff3809860485646b7aca3dcd | ORPH
microblazeel | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/cdd397abfd4275955925050c815ee89e469717db |     
 aarch64_be  |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/30649ac9aa395b9498338d89486c30894e59db6a |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/9370c493300d331590a02d16361ea71ee4cbad66 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
