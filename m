Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A84E77188
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 04:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC0944038D;
	Thu,  2 Jan 2025 04:14:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7FH4PXy35JO4; Thu,  2 Jan 2025 04:14:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC94940382
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC94940382;
	Thu,  2 Jan 2025 04:14:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5536DF24
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 04:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 229FB40382
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 04:14:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d_GsXZbsVYvP for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 04:14:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0A8194034C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A8194034C
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A8194034C
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 04:14:34 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aa66ead88b3so2009424166b.0
 for <buildroot@buildroot.org>; Wed, 01 Jan 2025 20:14:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735791273; x=1736396073;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rA4oxd8qY9aI4855OshFSLfzQUUnmQSEQueXL3yMOKo=;
 b=UohaibSV4/G/u3g4kX5C0HfDTfAfIy94lzf2k7sxJIY3iwMP86HlMJu+bEkrRfInN+
 HjBp2Hgqc6TA5c5GM3XdAk9fn5YEkvKbA0o6Cn1QQpqTgb0SBjsNaZuQr7GW9UnOG1Bb
 dx3avwxMb6G38ghLsJgjFTXO6umDdzcTOoDQ3b1o+KHtFShklWhUEnVryMZlAzHDAmeV
 FVCxrWTV/p5gXiPHTAPtC+S8K1atjy+fo9MPWUPGki1NChKEURSSaKmSQcsmXXJr18dL
 Mbc1JVP0KGgSiSfwbEjkBnaZLGyHWyWR0e8k0238lxPV0wMFhaE2ppgpqMFoCzRJYLvt
 aq1Q==
X-Gm-Message-State: AOJu0YxgrsDIRi/DU+DMIYmsv/f0k0zhSUWTRbpbJ4oDD8Er8jOGh7ij
 864/o4s4lhYK1x8nZsdltOX/mqntmbxyGlIceN++XemldFqKFy6cWn4N8Q==
X-Gm-Gg: ASbGncsnzDlITIzlT5vmzoEE5pwTvu63z62BZA/z7FlGGc04LYim+uT4TFpLMQoHHPh
 p7cCyuP2MR2e3HHD4uU2q8F6+4L2pEsnDYUFimVl0wz5Q5+y/kQoQ1ZKw+JrVLuUZ2LB+F4W8Yv
 y3pVb2fYZ6uPO/ZvpGvWkG4Fd1/Ln8wBaCplmi9+tgRAKSiWkaSjhocQR6+LfA3yiqNcGwKsemk
 EjS5NU7veQKc87YtPkvhT9AaY78XzBM2IGicIMp10ITWqZ/iHrTQU5nOgiE
X-Google-Smtp-Source: AGHT+IFi7AjGBWprrHN7m5HWBKO0XJiHWbOWmf1vsVOrKr57oO72MNRyYkHPE+B+lAQAXmrqIJ697Q==
X-Received: by 2002:a17:907:7f29:b0:aab:8ca7:43e5 with SMTP id
 a640c23a62f3a-aac334f4a2cmr4305543366b.38.1735791272506; 
 Wed, 01 Jan 2025 20:14:32 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0f06dc7esm1742010366b.193.2025.01.01.20.14.31
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jan 2025 20:14:32 -0800 (PST)
Message-ID: <677612a8.170a0220.3975ce.4b4b@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 02 Jan 2025 04:14:31 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735791273; x=1736396073; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=rA4oxd8qY9aI4855OshFSLfzQUUnmQSEQueXL3yMOKo=;
 b=h4ogI72PIcEJep61VEAhF7Xz7Jk0Jek3NMx1o177qRL4s6yPTcrgZO7YaFTuPcySx6
 4rOiBWfGDG2SuJZ6dy0LChUvbaGj4dl54rswYioZC45eZvLi+ocO/585cwrLNwTTxEiK
 ZdnLDP/DFSaAzgTC0gkQODzEglkViUAilo6R9Nz2JWzNSnpjSmNuYTaE62FCwcvUkZni
 RNlqf1CJ5+rjhvZIBV+3qUxLh6+yJ9gKCPKGm7A7XzLIV+qXdz1fc8bzv5/of6Zf0s2e
 tHT24MkbqY+hXDNsPgnePuPSzbjq7sPCOsbxL7trPkhl+A3KrLSbroatieHp69+naOQj
 n71Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=h4ogI72P
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-01-01
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

Autobuild statistics for 2025-01-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  0  |  2  |  0  |  2  |
  2024.11.x  |  0  |  5  |  0  |  5  |
    master   | 21  | 73  |  1  | 95  |

Classification of failures by reason for master
-----------------------------------------------

               host-php-8.3.15 | 8 
                 pixman-0.42.2 | 5 
            host-binutils-2.42 | 4 
                  ntp-4.2.8p18 | 4 
                  ffmpeg-6.1.2 | 3 
    host-python-greenlet-3.1.1 | 3 
     linux-5.10.162-cip24-rt10 | 3 
               postgresql-17.2 | 3 
             util-linux-2.40.2 | 3 
                 c-icap-0.5.10 | 2 
  gobject-introspection-1.76.1 | 2 
host-binutils-bare-metal-2.... | 2 
                  linux-6.12.7 | 2 
                memtest86-6.20 | 2 
           oath-toolkit-2.6.12 | 2 
                   perl-5.40.0 | 2 
             bluez5_utils-5.79 | 1 
                  boost-1.83.0 | 1 
                  curlpp-0.8.1 | 1 
                   cvs-1.12.13 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
                  delve-1.22.1 | 1 
                    dust-0.9.0 | 1 
            gdk-pixbuf-2.42.12 | 1 
            gettext-gnu-0.22.4 | 1 
        gmrender-resurrect-0.1 | 1 
         gobject-introspection | 1 
                libdrm-2.4.124 | 1 
             libgphoto2-2.5.27 | 1 
                  libnss-3.107 | 1 
               linux-pam-1.6.1 | 1 
              liquid-dsp-1.6.0 | 1 
             lirc-tools-0.10.2 | 1 
                 mesa3d-24.0.9 | 1 
                 opensc-0.26.0 | 1 
                 openssh-9.9p1 | 1 
                pipewire-1.2.2 | 1 
                    qemu-9.1.0 | 1 
           v4l2loopback-0.13.2 | 1 
                 watchdog-5.16 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/2f3335815bf3a9d784a33d1e557048edb3a8423b |     
 aarch64_be  |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/06905ce98ccdb9ea34d1e6c62818cb3cca7d7167 |     
    arc      |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/6a7a3306cd5cec3214b8167a125a2b018fe5f736 | ORPH
 powerpc64   |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/63b04f86bb8794b79d206659a883acef96dfebf0 | ORPH
 powerpc64   |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/2314d4e53324b7c2b39d89a8cfa1026bf6849caf |     
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/db44f5e2cec7e3e337897d3f07c5584a050bfa3d | ORPH
   x86_64    | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/87110fac9ef236c2ada76a54c6825e679d6a3e6d | ORPH
    i686     |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/4f9738fa1df807f56505230dce3b2bf7ac59f9d7 |     
  powerpc    |           dust-0.9.0           | NOK | https://autobuild.buildroot.org/results/2ee245a8a62fad87d69e3e063396fa178b389871 | ORPH
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/ae6446f955f5fbc2fbe546366931e0a8ed937924 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/8c2fdb709f9bbb5cd07cac13ce7683a7669d1445 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/442ca3c1ffe62411b53b97aad2bc6d5230f11d38 |     
   mipsel    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/d8262a886dc61c872d9df050fc671f9ff032d5d7 | ORPH
   arceb     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/500a170f1c557b301308b81f61687c7997e952e7 | ORPH
    mips     |     gmrender-resurrect-0.1     | NOK | https://autobuild.buildroot.org/results/0db83be76a4b1745ed409d0b575a1e7a91b8b752 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/384442da9fb6d1c55983b1f2b6f3886997a3f51d |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/d55b65bfc07e6ab1f1f5d5efe2adeb7c154ad229 | ORPH
    mips     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/33e82c08d021d073fd9345b8ae7e714deef4fa34 | ORPH
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/93f8a28d1da1c572f9f6078384e2d77b596d663c |     
    i686     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/4f7bd314116acd808fbeee7f2820de123f72a066 |     
   s390x     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/82d2d7d30c8e00bf6e9918c3d989f65a7330d381 |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/a7641e8fa6bec13585b38682fabb507197adb8f1 |     
   mipsel    | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/4a3dbd5d2eddaaee7cdcd49e88ef025b9460a499 |     
  powerpc    | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/ca50740b21d89d90f2a527e1fa16f438445b480e |     
   sparc     |        host-php-8.3.15         | NOK | https://autobuild.buildroot.org/results/09348d37e2692f49e6a36512e916612d55e704f8 |     
    mips     |        host-php-8.3.15         | NOK | https://autobuild.buildroot.org/results/fd5f2584cb3d76f58183c9b99999645ba237fce2 |     
   armeb     |        host-php-8.3.15         | NOK | https://autobuild.buildroot.org/results/790835f0f48d5bbbd1ee2d13e9c08f285e99dc5e |     
  riscv64    |        host-php-8.3.15         | NOK | https://autobuild.buildroot.org/results/0a8dbce51be701c6f3fd40fdd21b48ba88666a43 |     
 powerpc64   |        host-php-8.3.15         | NOK | https://autobuild.buildroot.org/results/b8d23cb08837f1959e6061379b8f49d9df5ca5cd |     
  sparc64    |        host-php-8.3.15         | NOK | https://autobuild.buildroot.org/results/7adafecfee8c63e561f2becab74c306ab87121a2 |     
   mipsel    |        host-php-8.3.15         | NOK | https://autobuild.buildroot.org/results/9d37921c88cedae7d31ab6c79635fe6f9f133970 |     
  mips64el   |        host-php-8.3.15         | NOK | https://autobuild.buildroot.org/results/7ff47e644ae1d168756c7eaa8112a255feda274d |     
    arm      |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/71656c647f7420d5d2a1ae8b659a1bd4255f0098 |     
   s390x     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/10161e448b81475dcc2680892c7496bd5fdc78b9 |     
   sh4eb     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/4c55c2a7adb432596b40bab92d2f8719bc6f6921 |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/cf770d459dbf35b5469e85d4e40955e1e9ee061b |     
   arceb     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/5050f48e04fc8a4b8101a0c87d6486608d5f42a3 | ORPH
    m68k     |          libnss-3.107          | NOK | https://autobuild.buildroot.org/results/96d33ca7d6cba9d18686b41f573fc7b885e2e318 |     
 powerpc64   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/4bd7e6951395cd0e92575f9468d65394927aaec5 | ORPH
    arm      |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/0423ffd6e224e6ebb6623120d2dccc54bb486311 | ORPH
   nios2     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/01cca241133ec4776117f66f8297d29ca81f5c18 | ORPH
    m68k     |          linux-6.12.7          | NOK | https://autobuild.buildroot.org/results/81ed4bf130ab7c2df92b678c3dc6762646be4dcb | ORPH
    m68k     |          linux-6.12.7          | NOK | https://autobuild.buildroot.org/results/21bc64332944c5dcf1efa04c308f9bfc0de5d27d | ORPH
   mips64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/4f2dfee1745fd13d291d0c09d673248947ebb91f | ORPH
   sh4aeb    |        liquid-dsp-1.6.0        | NOK | https://autobuild.buildroot.org/results/a310f5bfffc70fe0ea0b378bb8f3600ae141c906 |     
powerpc64le  |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/76caa78952c686437b39946a7927053d0fc71684 | ORPH
    i586     |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/cd2d217cb96f41f7416a375a56d26b88ac79bb20 |     
   x86_64    |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/ab2e7161897ca15a07f3d593f133033d32c0384f |     
    sh4      |         mesa3d-24.0.9          | NOK | https://autobuild.buildroot.org/results/c8f1ce749d2f1e91d20c421872b44735462c0a89 |     
  aarch64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/ae4bd1422705671973c9fbcdc97eb5723c83bf00 |     
   xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/5cc3fcf63940a3312dc1265ea21bdfda63af3c2f |     
    arm      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/f1f2961b523b38415ed4ea2f7ce783551159a3a1 |     
   xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/38865e7985d5b1c12a503e4dec4c8bd566b8b2e5 |     
 microblaze  |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/183702fe26f6244b91d0fe228a9ff8e0b10c00fe |     
   armeb     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/70dddd788972edab061c634d3ac0a8ae6c97e075 |     
  mips64el   |         opensc-0.26.0          | NOK | https://autobuild.buildroot.org/results/624649d9e85a22f371fce046f19021e4c1e249da | ORPH
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/d9611199a87365b103c975b8355f933118765fa0 | ORPH
 aarch64_be  |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/f4f2a66c508ce9e01f5852d13e9ad00231133e22 |     
 aarch64_be  |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/e07fe8ba343b606ab4aa67e042c60ce1fb570c15 |     
    arm      |         pipewire-1.2.2         | NOK | https://autobuild.buildroot.org/results/72ff7637faf0741567abe643d2e125d35f57dbe7 |     
    mips     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/a3bcda67c81fbdfb8d8067e42bca780ba06b1313 | ORPH
  sparc64    |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/cf6037a095359d41fb2c31e46d46816394dc5711 | ORPH
powerpc64le  |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/30dab0875e9e6f480cfccee786882b3dca71a35c | ORPH
   sparc     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/4537b7be464f20f6fccad6078211f6ad880a79fc | ORPH
 powerpc64   |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/8a8ed956ebf853550fbf8001c329138e3b493a55 | ORPH
    sh4a     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/1498ca9ecd5b429e64785accc57800da8e460519 |     
   armeb     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/63122b494626f178f77af573d091934175f35e8d |     
   s390x     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/679f98a498857350352d5cb322afe3cc8b6917f1 |     
   x86_64    |           qemu-9.1.0           | NOK | https://autobuild.buildroot.org/results/3a647125f2a4e5111ff831885731a0860c4daa94 |     
   x86_64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/ad26e6e40f1e157705b94db003881e53693cfc2b | ORPH
  aarch64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/bdd1b2850e9a8ebb58d57fcff51fab0c6290b092 | ORPH
  mips64el   |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/07c79083b460ef809b85752ade4bc5406a0af77c | ORPH
powerpc64le  |      v4l2loopback-0.13.2       | NOK | https://autobuild.buildroot.org/results/2a337d29e7870564027bcd42bd0addd228eb6a24 |     
    i686     |         watchdog-5.16          | NOK | https://autobuild.buildroot.org/results/b2ea5c3fc442dcbbc2053017347ecf57306066f2 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  linux-6.6.66 | 1 
           python-rtoml-0.10.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          linux-6.6.66          | NOK | https://autobuild.buildroot.org/results/05b71c30c0670d7ccdb2403cd388a90f9c2e46f4 | ORPH
  aarch64    |      python-rtoml-0.10.0       | NOK | https://autobuild.buildroot.org/results/b90255a811019d48eb260f7789eea71ae8805bb0 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                  bcusdk-0.0.5 | 1 
                  ramsmp-3.5.0 | 1 
                   trinity-1.9 | 1 
               unixodbc-2.3.12 | 1 
                       unknown | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/1e3e66356595397367a8cbab2b12461372ea1efb |     
  aarch64    |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/3e822ee8be94382747c511c9a207b140e3853b96 |     
  aarch64    |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/32a19ec33d62ea1d81c1b09fd10dd45ef211a918 | ORPH
 aarch64_be  |        unixodbc-2.3.12         | NOK | https://autobuild.buildroot.org/results/549595c1e9f9d0a507d2f744c0c5ecc5fc6403a4 |     
   sh4aeb    |            unknown             | NOK | https://autobuild.buildroot.org/results/7916795f361d1ce9a60d14fcdeea5777ae8a4937 |     


Gitlab CI results for 2025-01-01
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/8738649678  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8738651120  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8738651122  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8738650207  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/8738650364  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/8738649707  | ORPH 
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/8738650514  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
