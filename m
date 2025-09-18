Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB13CAC59A
	for <buildroot@archiver.kernel.org>; Thu, 18 Sep 2025 03:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D2A161076;
	Thu, 18 Sep 2025 03:24:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WRfnu2YQmlIg; Thu, 18 Sep 2025 03:24:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9668A60FC7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9668A60FC7;
	Thu, 18 Sep 2025 03:24:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F446199
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 03:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E10F8400C7
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 03:24:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sXPOjnPXuz2e for <buildroot@buildroot.org>;
 Thu, 18 Sep 2025 03:24:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4E18740024
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E18740024
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4E18740024
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 03:24:38 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-45f2c9799a3so2971955e9.0
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 20:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758165876; x=1758770676;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YrCBqMiCgU7zOfxUQMOOFEArAeCTBQ0QRN5NLTAigyA=;
 b=TmdDtM7Z/vGhXKaiu/FHmHCt4CVqMg9s1iQareRY1mrmnVRqb4Bzbtr03YH55mCV6w
 ui0cKAV5yFX5uhwQbXKdvxkapYbWq9Vab2sN7zyipL0ZQKOTDNqK7usvqkP0tTECH1Pi
 axabAFKpESj1b8Kv/m1u4YZRAHp/TRwBkMEigtUBFRGfvFLxRPd3qxUMx/uWT6INIKeJ
 QPi14wyGuENVec9v6HYPlK5SexDOa841vjgB1/c0qD23Nv0ZmuaQnOVApS1dPiycr7x2
 wh+Q6hMx9W4w0Ay6wDlcmoCY1XSavGJoteRmPSjLiah/pfP88WnfiCWOTRhIRVIntzY+
 RXDg==
X-Gm-Message-State: AOJu0YyqKLqM8WGfc3TENoMiFkpCgDPz8k7pt51QPYRuMO3oE2QKMOF0
 6Coprd6xaeZr773elVfFVA88GnFHtHlxq3B3PMxXhFxieAL/9L8NhL7y30tujA==
X-Gm-Gg: ASbGncugLkdshOfNELZIlanWukZo0FqxPOV7Zzz0D1r+m5/TYcPKXTaTmZdPy0biYBG
 4imjnnJQDi3TELNzADUjsEmtFJL6cTE+PM/qoylcXoiaWXYaV2g4tHUrCSgoq1rzgxQpM1DJLBM
 eUOSSNvdyE9bGjojjO0Mst69R1VAOVg+pETPC2M1WCFlrzSyTNvDFXUrj6Id++FCFUprXlDgSBQ
 DPj9zxSou/BTRVE0Ia4LN8BRyfRkYkvZczQVkQUc4A3CY5a+LHvOe08Fr9u4ndK3ybLOKgk2bk+
 /yyCEu0OOzL1lqpOV+xz3j8ZkVFtVfSMr6f5dzaI5KALykD0GZ2DWlkfmKip9NU+5kzLrpF2iGs
 UKs1bGrrEn0rZwgD2wvzE/p/sAuKA3DN8S9GzigPZnY7C
X-Google-Smtp-Source: AGHT+IFisnl3B0XZchsKKBIZsZlGkmJaXJ/5r22h1s+3sHkTpxUzY0oJ7n2c6/2p84rtzgLAMOtT3w==
X-Received: by 2002:a05:600c:470e:b0:43c:ec4c:25b4 with SMTP id
 5b1f17b1804b1-46202a0e793mr48230885e9.10.1758165875894; 
 Wed, 17 Sep 2025 20:24:35 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee07407d0asm1673676f8f.17.2025.09.17.20.24.35
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 20:24:35 -0700 (PDT)
Message-ID: <68cb7b73.5d0a0220.178fee.4ec9@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 18 Sep 2025 03:24:35 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758165876; x=1758770676; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=YrCBqMiCgU7zOfxUQMOOFEArAeCTBQ0QRN5NLTAigyA=;
 b=Odq4fiBRw0O4d3j7oqHBjFVfN6ab9dETq3r3bJXYGHjXwybhSshSnBKM2Qpnz6Io3Y
 oAq9vEiV5FJjNNnPPeIfHIKpB2LaqSN0HK1tsKRp3QellIX9Dhdrz8d9t+WSnmVL7ynW
 mbSGR1AuPuItDYykxMWuIwFHIzDX0v7IRekE8Yxm2tlKWrEOvcHkGNd8/iBcLT9zOMtA
 HgcwphpYNrm0035bcHQRMecPTnyaeKmHhY4Kkg7ahdHEinHKgfWwlHEu1Jr9dxDZ7Zyr
 0+q04g+TkgVhjOUpx1KMQ1eCRKSBC256dxvE/BdTjLa7ZyN6W6ypP7MszzyaYr6dwNWT
 nJGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Odq4fiBR
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-09-17
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

Autobuild statistics for 2025-09-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  6  |  0  |  8  |
  2025.05.x  |  4  |  3  |  0  |  7  |
  2025.08.x  |  1  |  3  |  0  |  4  |
    master   | 37  | 83  |  0  | 120 |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.84.0 | 4 
        vulkan-headers-1.4.317 | 4 
libftdi1-v1.5-62-g5e67403c4... | 3 
              libopenssl-3.5.2 | 3 
                  linux-6.16.7 | 3 
                 logsurfer-1.8 | 3 
             batman-adv-2024.4 | 2 
                  dpdk-24.11.1 | 2 
glibc-2.42-3-gbc13db7393773... | 2 
    host-llvm-libunwind-20.1.8 | 2 
                  libsvg-0.1.4 | 2 
                python3-3.13.7 | 2 
                     ace-7.1.1 | 1 
                 apache-2.4.65 | 1 
               asterisk-22.3.0 | 1 
               bctoolbox-4.4.8 | 1 
                   ccrypt-1.11 | 1 
                   cvs-1.12.13 | 1 
             dahdi-linux-3.3.0 | 1 
               dvbsnoop-1.4.50 | 1 
                elfutils-0.193 | 1 
                   foot-1.16.2 | 1 
       freeradius-server-3.2.6 | 1 
freerdp-2.11.7-18-g0ee17e2f... | 1 
                    gcr-3.40.0 | 1 
           ghostscript-10.05.1 | 1 
          host-gcc-final-8.4.0 | 1 
              host-guile-3.0.9 | 1 
 host-softether-4.30-9700-beta | 1 
                 inadyn-2.12.0 | 1 
                   iotools-1.8 | 1 
                  iozone-3.508 | 1 
               iproute2-6.16.0 | 1 
                libcurl-8.16.0 | 1 
libdbi-drivers-0bfae6c43134... | 1 
                 libdex-0.10.1 | 1 
libdill-32d0e8b733416208e04... | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
                 libgee-0.20.6 | 1 
             libgphoto2-2.5.27 | 1 
                  libjwt-3.2.0 | 1 
                libselinux-3.9 | 1 
                  libsepol-3.9 | 1 
               libucontext-1.2 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                 lockdev-1.0.3 | 1 
              mariadb-10.11.11 | 1 
                 netsnmp-5.9.4 | 1 
          nss-pam-ldapd-0.9.13 | 1 
                     nvme-1.12 | 1 
                openssh-10.0p1 | 1 
                openvpn-2.6.14 | 1 
               procps-ng-4.0.5 | 1 
procrank_linux-21c30ab4514a... | 1 
             python-cffi-2.0.0 | 1 
        s6-linux-utils-2.6.2.1 | 1 
                    sdl-1.2.15 | 1 
                 siproxd-0.8.3 | 1 
                 systemd-257.7 | 1 
           uboot-tools-2021.07 | 1 
                     unzip-6.0 | 1 
             util-linux-2.41.1 | 1 
                 xinetd-2.3.15 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |           ace-7.1.1            | NOK | https://autobuild.buildroot.org/results/5581d76fdcefccf76e2eadf06094f47bc122c495 | ORPH
loongarch64  |         apache-2.4.65          | NOK | https://autobuild.buildroot.org/results/7334bed0a1106b71a696e2ba3afe6d23a39a76f7 |     
 aarch64_be  |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/7aad1476d42e7c65db44e46a070d91c8587a6e97 |     
  mips64el   |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/2550577886406ab5c06c40a8ab26ff3e2012597c |     
   x86_64    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/8b911b30b2e491cd12a696db9527908f61e73591 |     
    mips     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/3ef57c02cdb19b4445984b5fc3d7c3a97d67bc45 | ORPH
    m68k     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/587110b22cb784c605d250ce1c0ea632a6151ce9 | ORPH
    i586     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/d249d668b888057f4e33cad61d2f78e4601bc11e | ORPH
   mipsel    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/40df4d14d637c4944fd6589e94d67b232e641b09 | ORPH
   x86_64    |          dpdk-24.11.1          | NOK | https://autobuild.buildroot.org/results/711baf2c8ab9a35a3dffa153147de665f5ce5023 |     
  aarch64    |          dpdk-24.11.1          | NOK | https://autobuild.buildroot.org/results/8223346022d7252c509cef1355754336c0bfec6c |     
  powerpc    |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/f9676970e9e2767d421e1eebe827478ee9ae2c27 |     
   xtensa    |         elfutils-0.193         | NOK | https://autobuild.buildroot.org/results/e27cbfa4df39c85b57a1eee484c8b11cdb5fda69 | ORPH
   mipsel    |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/2254b4b9c79347f6b27c04cf2a7acd5ff8de50d0 |     
   x86_64    |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/ac2474442defbd279333f8b1839fa4ef5a8292af |     
    mips     | freerdp-2.11.7-18-g0ee17e2f... | NOK | https://autobuild.buildroot.org/results/569c841bb137c112fcdc423a3effaced49addff4 | ORPH
   s390x     |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/055e5cce9b00a17441f9c4d3ac710b9fbf60ab4d | ORPH
   sh4aeb    |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/0d21f7d9d0a129cf48e9c85d52cbf40829ed7aae |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/19cc7a4cf2843abb0def9827d9731ab27cbda3b3 |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/da243d63d599c06ce26b5adc1da5a5576fc066c6 |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/108ad3bbcc62d4ba64a11e36d01114ff0b2cf415 | ORPH
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/345cba10484c7d6ca7f1d5ba6211176b733e5b1a | ORPH
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/567db9af94b500f3a51a95db7c54a7201092ca42 | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/189328c17367562b3b20eaaca6543ce0e0721de3 | ORPH
  powerpc    |      host-gcc-final-8.4.0      | NOK | https://autobuild.buildroot.org/results/3eb5a62972b9ca8f1b88054993435e99f82d4836 |     
   armeb     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/1afc480003fe22c3b10d47825974dad3ee6032da |     
   x86_64    |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/77e5524667c1dc784b1404621d0b370f20d127a2 |     
   armeb     |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/e76e610b465db2a0770afa30f5c78374784009c5 |     
   mips64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/0567a909da42bb1124e4397270d09d405cccb14e | ORPH
    i686     |         inadyn-2.12.0          | NOK | https://autobuild.buildroot.org/results/9dfe22b6f38cebf966a7013b017793859988dd84 |     
powerpc64le  |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/bb91441581eb7bbb580f4099b0d81f47ebe28f3e |     
    arc      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/c188a1acdf67fbb21b35cfae3adbee5bb2cc4a82 |     
   arceb     |        iproute2-6.16.0         | NOK | https://autobuild.buildroot.org/results/7051951d63ca0ae92503847d7c332ebbae6d318b |     
    sh4      |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/c89e4e34970c059896a6783f94cbc6341d1cf63e |     
loongarch64  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/b77371255869a19ef1dc981a248b5fbfaf5cffe8 |     
   mips64    |         libdex-0.10.1          | NOK | https://autobuild.buildroot.org/results/b70d8a1f9d9877c7f7a47e3ea0dbef7a6fa8ad11 |     
powerpc64le  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/c93b45486df616c350b383cb24523af3ea38fcf5 |     
   s390x     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/70e7f685fe7eaaa2f6b8a20f4826fa06e6dd4818 | ORPH
   xtensa    | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/c5584b58b14aba53ca52d8d8021611e9319ea19e |     
   sparc     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/d43b4bf324fdf4654ffc0946fefd612235613682 |     
   arceb     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/103a9554975eb3e63a0fe45593ed002515ef5c84 |     
 aarch64_be  |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/29361e6b89dfb9eb5fbeea483daad2745ee89982 |     
 microblaze  |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/c2a57632cff6bb5b0837b5a7ae8a39f7fdf464a4 | ORPH
   xtensa    |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/4ee786e86f77a614e532d6ae23f4d557b9bd59c0 |     
    arc      |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/40760cf1a2a3ec9af5d6288dc4a65a8dce47b8bc | ORPH
  riscv64    |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/480fea7308d29f8cd1c62c0148d1c39f9d709f5f | ORPH
  riscv64    |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/24af5923fbb82a8c93d5c96d1dc1c45962bf0678 | ORPH
  aarch64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/cbf54dc661efeaa0f855a6cd35caf59c7b687fac |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/fb042ae4f4eaa6e266ad421f2c7589e01e55f13a |     
microblazeel |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/b2ea348bd0dabc0784acdfda85f94fef589a110d |     
    i686     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/559c3e8c1b92b72927ef59b73c536c07accd628d |     
   sh4aeb    |        libucontext-1.2         | NOK | https://autobuild.buildroot.org/results/307548802152a8fd462d30aa15744ae60fa55b4d |     
  aarch64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/74f9bb06d27e473fd6263abcbad59f7a3c00ea01 | ORPH
  mips64el   |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/55eaa914c7f79f10712af5f0b45fbfebf6d6d25c | ORPH
   mips64    |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/5df5c7d1423eb788e5851f520d6c02e8a73139d3 | ORPH
   mips64    |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/a7eb9c6950ba1efc36f29e5e5ee118212905a7fb | ORPH
  powerpc    |         lockdev-1.0.3          | NOK | https://autobuild.buildroot.org/results/84f2af1e8ca956e016160f47044a5d63ddac6180 | ORPH
microblazeel |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/3b9832d4deb11b39ceb374abcf3f128707317697 |     
 aarch64_be  |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/fabc2105fc6782da8ba46797d4687c14a5ca7a9a |     
 aarch64_be  |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/4ee9248e7ce65a2476f4c6e6b2b4b00a6473e3fc |     
   sparc     |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/1eff038bea76254f04039634221bf1d29c02889c | ORPH
  mips64el   |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/5ece02d91ca25aefd483a581f91d178c82ebf55e | ORPH
loongarch64  |      nss-pam-ldapd-0.9.13      | NOK | https://autobuild.buildroot.org/results/c30b29723a2f3db6fed5ad0bf0e06c126a857953 |     
   arceb     |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/9a3aa547c542f5790137312b1f9a3814a1ac6a05 | ORPH
   mips64    |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/1df86c4e7ad5be6ca118b7a1574ac147c0a20792 | ORPH
    sh4a     |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/6255735c1245a18bd14681cb74008a5adf44bf75 |     
   x86_64    |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/17e3eea920a4d2a6a19c31238d18ac4058f76f83 | ORPH
   sparc     | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/08d984cc914924082120e1a3f16ab5a1ce80628b | ORPH
   s390x     |       python-cffi-2.0.0        | NOK | https://autobuild.buildroot.org/results/45b57a919182ae3f9ea0db9b0fa430a72e1e3cdf |     
    sh4a     |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/a62bd324ffbfebb312ccad8f3257cee4273b1bee |     
    sh4a     |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/eda0c87dc71694a96ef194500cdfb3ce368a1183 |     
   xtensa    |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/2075a61d96fcea2e1e47e1c4a339de1df9b41643 |     
    sh4      |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/9577b48fedb636cb777fcec43899271aea9cda00 | ORPH
powerpc64le  |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/4169570b4c13961eed02350ff60490af82ca90d7 |     
powerpc64le  |         systemd-257.7          | NOK | https://autobuild.buildroot.org/results/1cf3da1a2de2b47151beb45cb4ea2b5177dfc2ae |     
loongarch64  |      uboot-tools-2021.07       | NOK | https://autobuild.buildroot.org/results/86bca55ee2f5081203db169024e9cbd1ee0dcff3 | ORPH
   mips64    |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/7e66ac5d14774568a77b2411e22aefb9f36cf7ae |     
    m68k     |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/c67499db141f1784524aae0d7a45119bc576a116 | ORPH
  powerpc    |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/2adb0a8ada60c209412d198490bd564514626236 | ORPH
    arm      |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/b657e8b90d8b626fdae853680367db043120d0e0 | ORPH
   sh4eb     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/225ba01cf79e71a99b7e1231f0a502f0d47c24e9 | ORPH
  aarch64    |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/a1ec56caf8d9b27a37cf3d00d0ba6be2423f5415 | ORPH
 microblaze  |         xinetd-2.3.15          | NOK | https://autobuild.buildroot.org/results/96fdc0bb2f93db4950bb36b3158395888e7177aa |     


Classification of failures by reason for 2025.08.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
firmware-utils-86739f2b3ae9... | 1 
             igt-gpu-tools-2.1 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/9a5df7864fc206d33a3d25723ad699b616ce4562 | ORPH
    arc      | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/94bd234c5771ec8e9d7b5efac3579afce26bdff1 |     
   s390x     |       igt-gpu-tools-2.1        | NOK | https://autobuild.buildroot.org/results/341830abdd89384de0351fcca886d24ad3a2415b |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
  gobject-introspection-1.82.0 | 1 
                    mpir-3.0.0 | 1 
       python-flask-cors-6.0.1 | 1 
                       unknown | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/a365b33b175b51bb6a8542cf62657689afd23003 | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/29d6db3658c649e6942e20728eaf3bc2c44a0075 | ORPH
   mips64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/112cf8327595226ee1edc97673614d1ae39bc54a |     
    mips     |    python-flask-cors-6.0.1     | NOK | https://autobuild.buildroot.org/results/4f27656e199ef96de74ba6ca99365e20615b3523 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/905d7cf1b2a6411ee1e82de3da7e3faefcf3771e |     
  sparc64    |           zeek-4.1.1           | NOK | https://autobuild.buildroot.org/results/9e24538e3879d8deda1f65b8bae045e0c4a6c90d |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

               asterisk-22.3.0 | 1 
                   fwupd-2.0.4 | 1 
             python-webpy-0.62 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/6a6855c9834f3be07bed354f4d9cb9a8f8e3b109 |     
  aarch64    |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/b143ef10b54ac77747a0837b7f3d419dd29a434d |     
 aarch64_be  |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/e21ad5eef799c10d0a34433127ecf2be8eb94b59 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
