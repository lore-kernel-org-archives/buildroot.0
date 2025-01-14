Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A6FC02183
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 04:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11C528211C;
	Tue, 14 Jan 2025 04:14:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lAD5EiyJmbCm; Tue, 14 Jan 2025 04:14:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1891820CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1891820CE;
	Tue, 14 Jan 2025 04:14:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DDB00B89
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 04:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BEC1D405AB
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 04:14:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aZNXmXX5K8eN for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 04:14:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BD0CF40498
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD0CF40498
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD0CF40498
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 04:14:22 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aa67ac42819so723681466b.0
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:14:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736828061; x=1737432861;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w64jGAKHnU4u2yXOIrR+Fi70ySWq/WkFUYAP1TPFDJY=;
 b=pMX/aiFvK8ISEfY2b+AY12awVu6101YZ2J++/6nWoWqStgI18348TY7GXDK4FDW6xD
 dTKZZONjbZa8xLJAX3kf9Qprg1xuWZ1H8fCgzHQZUUz7j5uWtgKjRogsLHNWuUKXOAes
 69XNpg2W7LiK9DI0Nb8LvGxsPO+GemkcjCrNeUUutc0a3M17R6bhf+K9mfh+XCJiPrKR
 2O/4eSM122l6YzPvZ++gAj/f0DMmx+/vj7mjliZfKbEE92aLrUDJri8wYtulBU+r4WoE
 dMYSbk0OkQQAdz4ln5+SDK95RaF6RAdWxccoXpJGWyHXV1O5A/yvHQg0sig62YfB4gIe
 K2/Q==
X-Gm-Message-State: AOJu0YwE3m9sA9ROt0ZSzj7/4AaTf2vGch6lWZHDYCe7O4NypeY9dIzP
 W6t0akMB9W3UifKSUbaYuU8F5M8gxpYLtMWr6AngNBgE3de01qVP+jsVPQ==
X-Gm-Gg: ASbGncszkBuiV90mvOh4yQJMFxKmJrfjBezqwTXGOH3ougrLr6OTAy2VrY+N64McwnL
 v8AjB58oRMUTXUSJyPeTYDtAYU5goA1ioG5G1i52RabO46b3jwqGJNnmTndJbOVhg/Na2N60j24
 Id/2eZPRMTVSeFGAZ00fHA3iSfQbdXW/fM2ksprx4BTYrkTZyaaOqXRNSQEmNYE+HVfv4xOlhsj
 gt0CxHWd1/34pccxoZVWSyQ6ySmPlrIWqnvJKHAK4jNngcnfN+JWjH9gZLD
X-Google-Smtp-Source: AGHT+IEZ2cMlWOnAa7z5OcA8w74BUm9/KsRNamxioKK4I6FVONXpLnPVMuVdsVW3GLjjucymv5k0wQ==
X-Received: by 2002:a17:907:d88:b0:aa6:8a1b:8b78 with SMTP id
 a640c23a62f3a-ab2ab6708edmr2112394166b.6.1736828060405; 
 Mon, 13 Jan 2025 20:14:20 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c95b0e26sm577442866b.151.2025.01.13.20.14.19
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 20:14:20 -0800 (PST)
Message-ID: <6785e49c.170a0220.1b7d20.83de@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 14 Jan 2025 04:14:19 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736828061; x=1737432861; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=w64jGAKHnU4u2yXOIrR+Fi70ySWq/WkFUYAP1TPFDJY=;
 b=CDiFtJNmdbgrqjwXkXBlJF5BjAjEzdYJnoPYqvV+9Q48x70FdU+NCxrmYR6Hs/gVjV
 F6OpoJqRT/BHn+V3XqkcLPqlJD8UrW7UaPtU4MWScLtXxwWXM1+rD+ljSwYy4I+alus5
 3N9MOexD2crdH0m7OB0IDy1SN8OkJhwO554rKZeXG6Aj+4BZKms+FfvP1O4T5A6EGcpJ
 Ul9/JwOCHyw+O+WSPRLrD0mxW071zmvSg7dBqytMnJQfs+nMcRxkkZQ53ldJ/RGOvQvk
 flwDFVfnE6TgZkegTZrwHPLD7t/f/nDcE/+yEZoyZRggNBIXFr0DtK2Khx0MQtKXlVlS
 O4+w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CDiFtJNm
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-01-13
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

Autobuild statistics for 2025-01-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  5  |  9  |  0  | 14  |
  2024.11.x  |  2  |  2  |  0  |  4  |
    master   | 10  | 60  |  0  | 70  |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.76.1 | 3 
    host-python-greenlet-3.1.1 | 3 
                   foot-1.16.2 | 2 
               iproute2-6.12.0 | 2 
             libargtable2-2.13 | 2 
          linux-5.10.162-cip24 | 2 
               pulseaudio-17.0 | 2 
wilc-driver-linux4microchip... | 2 
                acpitool-0.5.1 | 1 
             bluez5_utils-5.79 | 1 
                 c-ares-1.34.2 | 1 
                elfutils-0.189 | 1 
                  ffmpeg-6.1.2 | 1 
               freeipmi-1.6.14 | 1 
fs/ext2/ext2.mk:66: /home/a... | 1 
            gdk-pixbuf-2.42.12 | 1 
               graphene-1.10.8 | 1 
                   grpc-1.51.1 | 1 
            gstreamer1-1.22.12 | 1 
            host-binutils-2.42 | 1 
       host-gcc-initial-12.4.0 | 1 
              host-rust-1.82.0 | 1 
 host-softether-4.30-9700-beta | 1 
httping-0e26c53d5fe504eb720... | 1 
                latencytop-0.5 | 1 
      libabseil-cpp-20240722.0 | 1 
                libdrm-2.4.124 | 1 
              libopenssl-3.4.0 | 1 
                  libsepol-3.7 | 1 
                 libv4l-1.28.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   linux-tools | 1 
               mariadb-10.11.6 | 1 
       matchbox-keyboard-0.1.1 | 1 
                memtest86-6.20 | 1 
          modem-manager-1.22.0 | 1 
                  nginx-1.26.2 | 1 
           oath-toolkit-2.6.12 | 1 
               openblas-0.3.28 | 1 
                 openssh-9.9p1 | 1 
                   p7zip-17.05 | 1 
               postgresql-17.2 | 1 
    python-betterproto-2.0.0b7 | 1 
                  ramsmp-3.5.0 | 1 
                ramspeed-2.6.0 | 1 
                  snmppp-3.5.1 | 1 
                   swipl-9.2.8 | 1 
           uboot-tools-2021.07 | 1 
                       unknown | 1 
             util-linux-2.40.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/ea231fc4382b9fa4ef232bddfd64f9cdd4fa6806 | ORPH
  riscv64    |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/53244f6a9f0fba16c6f4e0875d171c7096c09d9e |     
   xtensa    |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/5cb5e2dbdae6a8517d446f1749d770bdc3f6de39 | ORPH
 aarch64_be  |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/ea6d8918849e129ce51a505e2884c67ed6c053b3 | ORPH
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/d70462bc370a77490cf7ac39160899aa94784b9a |     
 microblaze  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/d2b0e241df28c3ec077593aab8c7ab45c7f4b2e7 |     
    or1k     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/c9dea2f20bd7730b1fab4da1beee9dfe7ebd7376 |     
    sh4      |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/32c0ec01c97489fe1415b0d0ca160b6cd6324ae5 |     
  sparc64    | fs/ext2/ext2.mk:66: /home/a... | NOK | https://autobuild.buildroot.org/results/3e0a50dc6c55048087581c7a47d071627f0c088f |     
microblazeel |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/bd1abac50df7f5a589dcfdc41ef7564142a19e87 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/836739104c5a8a3b51c9a0e8d075560c92fd30ce | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/51470109f9f3cd8762579b0482227ec3c7e60efb | ORPH
   sh4eb     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/030b41ad597a73e1445368079237850c604e07e6 | ORPH
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/208b3808c936b3556049c142a077e929a75c6b7e |     
    i686     |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/ffd49fb688df521e8d4418380d9a9334ebc2e575 |     
    arm      |       gstreamer1-1.22.12       | NOK | https://autobuild.buildroot.org/results/938b556a729f8c81f4d85b870a2147e9af8fae68 | ORPH
microblazeel |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/001038503c3ad8b4e74946d3ae404a69f6ae3a69 |     
    arm      |    host-gcc-initial-12.4.0     | NOK | https://autobuild.buildroot.org/results/6b6b132a27d36b9aada9dc5838d2c14ce6feb140 |     
  sparc64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/89f8ec0f039c0ab0b8512cef588163df4c350677 |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/0b6c0ec7b7fe8304fab2fa25c32e29bb96c118c2 |     
  sparc64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/87968a25f2a05aeccd14b4ea727ebad5b64798ef |     
    i686     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/0cc7b9abbd17d834dcc5da5087f10bbd8c540799 |     
  sparc64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/a6a767e010ac61b25d9b6a1394d050da6c00e650 | ORPH
 powerpc64   | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/a447c7ecaa9ce8460e0b52e97912edc3ef049c46 |     
   armeb     |        iproute2-6.12.0         | NOK | https://autobuild.buildroot.org/results/e751f3d6e140de307eae152c37de90b6daa49562 |     
  mips64el   |        iproute2-6.12.0         | NOK | https://autobuild.buildroot.org/results/7f73dba302dc217a7d31d21cbb60c50400fefe37 |     
 aarch64_be  |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/4c5b55c6c6f32b46091d881d7024e3e215b13a4a | ORPH
  mips64el   |    libabseil-cpp-20240722.0    | NOK | https://autobuild.buildroot.org/results/35544a39f1f4c1915bea547367a47f24c48f64ef |     
  sparc64    |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/673a084f2acda95c331f29016c18364e6904a429 | ORPH
   sparc     |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/f307f3bf58b436f8c1cabe9fbf7e68444592610f | ORPH
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/701f01f20e1751eab05f2defca8f0462d1f10102 |     
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/bd33412fb48e3e059a9b85695d60687ce1ef00a4 | ORPH
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/da6bd6d0eea3821191f7b30b8759897155c8283c |     
    or1k     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/ef0b185cfc58dff2ace28e71dc0605a4d35afff0 |     
    m68k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/9361c35efeebffab462908372583333157fc1dd7 | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/a31e7f75f9383c30a785946806445cf06ffc49f3 | ORPH
    mips     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/73ba8318e6b988f74fa929692bc9809cfd5457dd | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/cf82ad802c3f456e25395892e1a9311695d27af2 | ORPH
    or1k     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/8f3f7755221c6ebfd573aff1da70e194db794d6a | ORPH
   x86_64    |    matchbox-keyboard-0.1.1     | NOK | https://autobuild.buildroot.org/results/72b2132f18c3a8438b4c3c9e65d0eb96b1ebf6e9 | ORPH
   x86_64    |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/f5173d92e90b6d7ef627754f1066d344753a2ae2 |     
   sh4aeb    |      modem-manager-1.22.0      | NOK | https://autobuild.buildroot.org/results/1896410840d814323d83a438b770b248245ef79f |     
   sparc     |          nginx-1.26.2          | NOK | https://autobuild.buildroot.org/results/8fc4e2ab9b8b114be1c28749c4dbbf17891f63f2 | ORPH
 microblaze  |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/7645953ed1f52ea57d71e288ee2b0b7d404be4fd |     
    i686     |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/51dee7f7cf2cb5a520080cc4dda8e2791646cbcd |     
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/75642bf2db3e1520f4a7f427f66807200a45623b | ORPH
  aarch64    |          p7zip-17.05           | NOK | https://autobuild.buildroot.org/results/d1b8f48aa6669d188676c7f0a8dbcec2aae3fda8 |     
  powerpc    |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/b7cac5deb0d64992367fe41a892d727fa8835be4 |     
  powerpc    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/2d951874d973f8c490f869c1a55f65da3386f7cc | ORPH
    m68k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/d6134605e7265d436a23110e03c6b2630b15f9d7 | ORPH
microblazeel |   python-betterproto-2.0.0b7   | NOK | https://autobuild.buildroot.org/results/0de5b31bc649b97684deaa826e386ada50022d6a |     
   s390x     |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/c3739c667e76b1df8a7145ed68eba017d3a6f1ae |     
    arm      |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/5f58f4c54e96507fa5a5cf07a492411922572297 | ORPH
 microblaze  |          snmppp-3.5.1          | NOK | https://autobuild.buildroot.org/results/5920c84506e453398258aefd188da7664dcc6d3e |     
 powerpc64   |          swipl-9.2.8           | NOK | https://autobuild.buildroot.org/results/cd4e819eb1a00293f5eecdefda4082f707b35b73 |     
    arc      |      uboot-tools-2021.07       | NOK | https://autobuild.buildroot.org/results/c1b6ef332a0517164785a91712761f3bec6f26e4 | ORPH
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/cdd8a0bf699653331dc8e33212bfec9ef2123370 |     
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/1944e0482dca668453d3bc2fd5448ae6873b320d | ORPH
   mipsel    | wilc-driver-linux4microchip... | NOK | https://autobuild.buildroot.org/results/a92276c3ae177ec7a121bd911b2e58ebc9b5bbf3 |     
  sparc64    | wilc-driver-linux4microchip... | NOK | https://autobuild.buildroot.org/results/e69d802a04c5c95d33231a8179e46fb9e5d01ad9 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

cegui-00b4e1fe174da53b7ed72... | 1 
glibc-2.38-81-gc8cb4d2b86ec... | 1 
               host-go-1.22.10 | 1 
host-heimdal-f4faaeaba371ff... | 1 
          host-sdbus-cpp-1.4.0 | 1 
                latencytop-0.5 | 1 
                    ncmpc-0.49 | 1 
         s6-networking-2.5.1.1 | 1 
ulog-0389d243352255f6182326... | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/f54d199606c990f2c915d5e978de1c84ceaaf9ef | ORPH
  powerpc    | glibc-2.38-81-gc8cb4d2b86ec... | NOK | https://autobuild.buildroot.org/results/22d0557ba03e662b9e683bf12b46560c788dda72 |     
  mips64el   |        host-go-1.22.10         | NOK | https://autobuild.buildroot.org/results/2554d9d0f25212331f5b4ff790ad26e18f64ce92 |     
microblazeel | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/583bb2689e9d8d918157ae8ad0b032b0b991b00b | ORPH
microblazeel |      host-sdbus-cpp-1.4.0      | NOK | https://autobuild.buildroot.org/results/e336f940e8de0f754aea914d09fa969dc378b634 |     
   x86_64    |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/f6a1fcfb88bab7d80cfb3f48e3ccff28dc755811 | ORPH
  sparc64    |           ncmpc-0.49           | NOK | https://autobuild.buildroot.org/results/494b8eca9af4fb988b2b5dcd46c3937ffe5d1cd2 |     
   mips64    |     s6-networking-2.5.1.1      | NOK | https://autobuild.buildroot.org/results/2eae826e804617c9d0924729a2243f4ba21677c4 |     
   x86_64    | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/dbc020fec90bc70d08d36adc79b9ee98f0e5a021 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                   foot-1.16.2 | 1 
                   nanocom-1.0 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/b6400d1cb255ea0cb80d46e0efe6f07b7faf9dd5 |     
  sparc64    |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/b89c04d5f6e42086effe812e5abbd55c3b6f360e |     


Gitlab CI results for 2025-01-13
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/8830670052  | ORPH 
                 TestExt2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8830670170  | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8830671565  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8830671640  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8830671643  | ORPH 
        TestGetDevelopers | https://gitlab.com/buildroot.org/buildroot/-/jobs/8830671800  | ORPH 
              TestMariaDB | https://gitlab.com/buildroot.org/buildroot/-/jobs/8830670689  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8830670835  | ORPH 
     TestPythonPy3Fastapi | https://gitlab.com/buildroot.org/buildroot/-/jobs/8830670893  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/8830670995  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/8830670100  | ORPH 
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/8830671098  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
