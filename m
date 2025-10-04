Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61467CAC5BB
	for <buildroot@archiver.kernel.org>; Sat,  4 Oct 2025 03:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDC9561325;
	Sat,  4 Oct 2025 03:25:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8xq4vBE6Ocg1; Sat,  4 Oct 2025 03:25:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AF4F616B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AF4F616B8;
	Sat,  4 Oct 2025 03:25:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 351F2909
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 03:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26E80616BD
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 03:25:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nIOsndF2mxkf for <buildroot@buildroot.org>;
 Sat,  4 Oct 2025 03:25:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 54FE961325
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54FE961325
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 54FE961325
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 03:25:36 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-46e2c3b6d4cso23085365e9.3
 for <buildroot@buildroot.org>; Fri, 03 Oct 2025 20:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759548334; x=1760153134;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ahVcxoIFz4xi6iu1QKaR0VYQPKP6MAIuoAFfBowtA3g=;
 b=KAmgryDd3x75X+cmwTgQ7hHmgH/6UI1gGqs/rDiyfRB3zT2/0gOt09CTf/LD3N9EdW
 CwYijBjj8nKLHoOKkmGtlubbFKBeNT+6OZwENe9czVslcvfa4+yU+pK6YX8ZCJLFuY1s
 qi+4Q3iTiA5SjYmARDsv5Lox9XLvwWzeLAqoUhTLUxC/VZ8LK0+KxORkiwXmQpGavzVD
 QTnVAiWfkwE7lH2FdZxIK5e9C5yOGGgTxq4AHt5jXsoFPstJQ05eppZhFzr0Yrxb3qUB
 4VbEzU3kEh7djf43qJcTDsMOZAp8bHWdDk9DMf5eu5SP/H8Mzr78vveYmVg/QgCheUB4
 JT7w==
X-Gm-Message-State: AOJu0YyB6o9130SG1c60g2wZol6TRXd4Xn4TM5g/EJSV1IAgeGLXTCQ/
 9y4Jb1F9mcJnkLEDGL7xCrQ8jXERPLv73n3UH5Gcmpx3UUXkQ7ZHt6MXSOG4EA==
X-Gm-Gg: ASbGnctcunW1CuB2wqrOaIvxwuzZtgIwgFG0rfrll400alHPBXp+TZH2IFt9+b2S97+
 BuUl84oMFa7fVFISVMOktX/HaaTxo79D4TK6CxKuwVjgap7lBDoefR67G1g/OVUAwfpZDyB6nH9
 OsoaAW1dT/f9x7SoMnfqaqIdEJ2xP6u1tcJQX26JWCkS/9EUYKclWi63i8atnwV8p+SKsLnWaNa
 LAgBE3EuO38tHGJtHDuYvNE6XXw54XmOGETrNC2IrWLMNrhaggNB7gWlhUQztk9yNOXFQIeU5b4
 8gyiwN4fDwER9HJHAj/MFYiEjiU28G+lfpbx8yE7ilSLDPL9POHvGjp7wEeT8IZrxUI91JPeUVH
 fBm6jxgAxyKpclHr3Cq50mzGOM4GzXu/agKuMfL8iLuo0VWJdnLkf3w==
X-Google-Smtp-Source: AGHT+IGZ61geajuCS5WvaZaSkZUEkWTniXs+bfCzhL59wc39d3hsw9OgaI52GoI7g+3Ol49xbamwtw==
X-Received: by 2002:a05:6000:2891:b0:3ee:15b4:8470 with SMTP id
 ffacd0b85a97d-425671b27e6mr3354677f8f.45.1759548333987; 
 Fri, 03 Oct 2025 20:25:33 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e5b622f37sm93102155e9.1.2025.10.03.20.25.33
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 20:25:33 -0700 (PDT)
Message-ID: <68e093ad.050a0220.198a15.0a75@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 04 Oct 2025 03:25:33 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759548334; x=1760153134; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ahVcxoIFz4xi6iu1QKaR0VYQPKP6MAIuoAFfBowtA3g=;
 b=OqdASwhIOaGmeIDJEDH1DruMC/IOx5GxT50yfNauUY3EV4+91Z2iJp9NEXPjv3W2QL
 H+rBmkQOATlrmce6XYqgTB60G78ViIZWQ3NcUgkDQvXCKY2OTyUgYTNgDKIB2vBs/DVf
 ru7XrCXflyVZsV+9RXA6iWNItYZSyXkSju3idIx160NhgQAxSYgg1AgA04CRXms/T9yR
 XTV6N/u+dfA1JYI1QTLPmgzrC4OM849lLAbFif3/jqCtdCfZPC/pxGGpLd4Mamk2pBD9
 Esxcfurkd/tF7OnKH1zqA151gLQSai66wu4uQEZlH4CqTuXykwSC8PnyD9v5jt5vd6Ko
 VcHg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OqdASwhI
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-10-03
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

Autobuild statistics for 2025-10-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  6  |  9  |  0  | 15  |
  2025.05.x  |  0  |  4  |  0  |  4  |
  2025.08.x  |  1  |  8  |  0  |  9  |
    master   | 10  | 103 |  0  | 113 |

Classification of failures by reason for master
-----------------------------------------------

package/linux-headers/linux... | 25
        vulkan-headers-1.4.317 | 4 
    host-llvm-libunwind-20.1.8 | 3 
                  libsvg-0.1.4 | 3 
               bctoolbox-4.4.8 | 2 
                   cvs-1.12.13 | 2 
                 expect-5.45.4 | 2 
            gdk-pixbuf-2.42.12 | 2 
  gobject-introspection-1.84.0 | 2 
     host-python-maturin-1.9.4 | 2 
                libcurl-8.16.0 | 2 
libdbi-drivers-0bfae6c43134... | 2 
libdill-32d0e8b733416208e04... | 2 
              libopenssl-3.5.4 | 2 
     libphidget-2.1.9.20190409 | 2 
                    mpir-3.0.0 | 2 
                     nvme-1.12 | 2 
                   perl-5.40.2 | 2 
amazon-ecr-credential-helpe... | 1 
                    brltty-6.6 | 1 
                 c-icap-0.5.10 | 1 
                   ccrypt-1.11 | 1 
                 cdrkit-1.1.11 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
                 dc3dd-7.2.641 | 1 
                    dust-1.2.3 | 1 
               ebtables-2.0.11 | 1 
                enscript-1.6.6 | 1 
firmware-utils-86739f2b3ae9... | 1 
                   foot-1.22.3 | 1 
fs/cpio/cpio.mk:131: /home/... | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
            host-go-src-1.25.1 | 1 
 host-softether-4.30-9700-beta | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
             libgphoto2-2.5.27 | 1 
                  libjwt-3.2.0 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                    linux-6.17 | 1 
               linux-pam-1.6.1 | 1 
            makedumpfile-1.7.5 | 1 
            micropython-1.22.2 | 1 
mjpg-streamer-v1.0.0-1-g310... | 1 
open-plc-utils-1ba7d5a042e4... | 1 
                openntpd-6.8p1 | 1 
                openssh-10.0p1 | 1 
                  pdmenu-1.3.6 | 1 
          perl-net-ssleay-1.94 | 1 
          pkcs11-helper-1.30.0 | 1 
                python3-3.13.7 | 1 
        s6-linux-utils-2.6.2.1 | 1 
          sane-airscan-0.99.33 | 1 
                    sdl-1.2.15 | 1 
                 siproxd-0.8.3 | 1 
             strongswan-5.9.14 | 1 
              udpcast-20230924 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/06640ee70a5875de725235b8231695caa0d382c0 | ORPH
  sparc64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/1107a94d8461d130357a6cd061f64da24ab8ca6e | ORPH
    or1k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/a19249fab4c8f5d2c1d603307616ed66c7480b02 | ORPH
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/3449512c85410b8241420a8674e2b549b5ee5122 |     
powerpc64le  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/f08f4d33b74dc13da3a90173426960e1aa81b096 | ORPH
powerpc64le  |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/3e12a8b648dcbf8835f8e4150738ae0edf95e83d | ORPH
   arceb     |         cdrkit-1.1.11          | NOK | https://autobuild.buildroot.org/results/56f09f6c92e69bf738e0c6e5ba7db35d41a49dad |     
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/fdc98319e4e767b76cabcaf33361372a6fe5b7cf | ORPH
powerpc64le  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/37565c1be47cc70952679d980cb34fc2e2d6f298 | ORPH
loongarch64  | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/243350fe28811bf7b2f63201e43f075b3d0ef85a | ORPH
   xtensa    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/5e96205a6441ed945549cbc40618cd3b808d5ed8 | ORPH
  sparc64    |           dust-1.2.3           | NOK | https://autobuild.buildroot.org/results/f395406f4abd7e1fd7954512ee7fb5f2a2add60d | ORPH
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/9a2510e0038cd13db8c3aac0122ea7a0f834fcd2 |     
   mipsel    |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/c6b66c3c5a552245c9a16bff30498b027e9a6b3a | ORPH
    or1k     |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/d907575600072af06929d7aabb49d6ff4e6a65ca | ORPH
   sparc     |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/97f91ba665a5eafd07c7148ae667fec41f015650 | ORPH
    arc      | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/366caddd68614da0044944eb06cb2ab6f7f05359 |     
 aarch64_be  |          foot-1.22.3           | NOK | https://autobuild.buildroot.org/results/21cbb093cb63fc9f64efda14dd9f32a85711152e | ORPH
loongarch64  | fs/cpio/cpio.mk:131: /home/... | NOK | https://autobuild.buildroot.org/results/d68ecc660ca864d04d3314e7aaa7767d442638a3 |     
 microblaze  | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/828b5d16b2ef07aa21ceb76da054212830ea9f66 |     
   sparc     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/f7421e18818a89b2fbdaafbe5708ae936731de0c | ORPH
   s390x     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/3ce14d6539070ccc0ebdd1866c84ca7d11fabb43 | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/af03ed697c4d14ee0b9881be6ef9333d061885b0 | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/65930e159b8bc6d2c37ffc810e7c04c5fa238997 | ORPH
    i686     |       host-go-src-1.25.1       | NOK | https://autobuild.buildroot.org/results/74529493f054a1afed53aa035614525911052bb4 |     
   armeb     |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/33065aa4d9f99b1be6d0d77485531813a7c1aace |     
   x86_64    |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/be692cfac64d21cb5949a5933a3b75d79418616e |     
   armeb     |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/3a34192165aa054a8d797871bf8fe56e3d05e885 |     
powerpc64le  |   host-python-maturin-1.9.4    | NOK | https://autobuild.buildroot.org/results/4803b9886f3033b6f13876cec6505cf0c69abba0 |     
 powerpc64   |   host-python-maturin-1.9.4    | NOK | https://autobuild.buildroot.org/results/0af90c3d42ae9f11cfd36ee775a6a84ca0401296 |     
    i486     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/6bc58d27a922e566501bdafe4611c2c02b862bd6 | ORPH
microblazeel |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/904059f3b53e7861a65e50623b4ff9159a349394 |     
 powerpc64   |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/c6dd8d3dd16199e97b3354c9b6a48caa495d74d7 |     
   mipsel    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/4aca0848e1a4bd9f616e2e187f96e8da9fd1eb91 |     
  powerpc    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/04130e61be710e6414432ef70af57361a6c9a5f5 |     
    m68k     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/29a3ecbf71a4b0b333a77b00a9a859bef93494c9 |     
    i686     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/9d5c7583c86dce9197d320ab4100e1e42cc3c9f8 |     
  aarch64    | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/71f7208e7bc53728c9babe9426d9a3e730c095cf |     
    sh4a     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/ea0226e76ca37f636d191359bc918409b60f1064 | ORPH
microblazeel |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/6e14f69b5ce77fdd597822e829de37c09448d5f3 |     
    arc      |        libopenssl-3.5.4        | NOK | https://autobuild.buildroot.org/results/5bd8c44105f884057ac6d4518bd5341e1da9f678 | ORPH
  riscv64    |        libopenssl-3.5.4        | NOK | https://autobuild.buildroot.org/results/06cfcdf2ae69d4fd9d1a4a5076f22040ae6697c7 | ORPH
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/b62f9dfabc764df9a75cdb8b09971445c1dab4b5 |     
 powerpc64   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/368671b9d5679c38f3882603ab7d17e3fd028bf5 |     
   mips64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/f860336ef6205be311ba55858a7bb40d3880db9f |     
  mips64el   |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/2a26684812a5c9fd9009581cbd26992b259f49ae |     
   armeb     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/ff6f8f9b0f2fa2b75dd4632f3185ad7abac18c90 |     
microblazeel |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/1f1a9a4937f019dd4b8e8397862dc3faa8eedaa4 | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/5314a95155df385573a03a797de83b0e04fe4fba | ORPH
loongarch64  |           linux-6.17           | NOK | https://autobuild.buildroot.org/results/ec75db112a65550046e95492a742d1c0dfab7047 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/c4afb7294149cd1c7c23c067c5569176fbab5775 | ORPH
 powerpc64   |       makedumpfile-1.7.5       | NOK | https://autobuild.buildroot.org/results/7ee3773ef157aa79457e7d1bd099908de030e9a7 |     
    or1k     |       micropython-1.22.2       | NOK | https://autobuild.buildroot.org/results/97fcd9b541ecd0bdfba9ccacd79cceb06e149b4b |     
    m68k     | mjpg-streamer-v1.0.0-1-g310... | NOK | https://autobuild.buildroot.org/results/ba31bd5299490e8a41a05a33bc4445d538649e26 |     
powerpc64le  |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/504ebe4f7b400596b0f297902ee3f9843eb9c915 |     
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/1622ee009cf98c3c33b761fd89d73158a359dbe5 |     
   arceb     |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/f893ba4e7fb3295a756785adbdb450d5dd1643c7 | ORPH
   xtensa    |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/f7cf46c435c706aa719d5677c41cd98b96bb5cab | ORPH
microblazeel | open-plc-utils-1ba7d5a042e4... | NOK | https://autobuild.buildroot.org/results/6e31c9cabd9f1bad37152bce2fd7a22bd674653e | ORPH
 aarch64_be  |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/4b8892647a2cfe74f9a8c750d0ae16f637d9ff38 | ORPH
   armeb     |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/5935aa6cd23a286323c8eaf7963a5f650285a96d | ORPH
 microblaze  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/a3cc7a9cd06ac4f7c5376fc81621bc1ae942842b |     
 microblaze  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/36498f7ebe2341f8971536ed114d7ab9791d221e |     
  aarch64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/b9c51245ba0cc701adeaee4c4f3029ff76d29d21 |     
   s390x     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/2b21197ff4f3646666055c171a9d299913d9d733 |     
   armeb     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/2aea4284d60d3fa064fb12f572200ed12734f12d |     
   mipsel    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/58c011f8dd9a8964cb78a82aeb89e47f90215a1b |     
  riscv64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/ea8a27b941568a564a6c1ac4bcda51e90000d594 |     
   armeb     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/bcb2148856e3c94e79c4ce314416aa5a8cf863d3 |     
 powerpc64   | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/b308d03d24437a33f466957e2cb11869a5ab3b98 |     
   s390x     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/ab2fe90d9c6870084ad378d48bf937a284c85b0b |     
 microblaze  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/1a7262b268fa4273b56fcb0298e98ce519b7f0a6 |     
  powerpc    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/158aefe161b0dbe69fa07abc751109c0854a1283 |     
    sh4a     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/e139d72743744d9a86ce616b2d1a028d4b8a158e |     
   mips64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/0105ee60a8be20c6f236c9c00da1f0deeeb35063 |     
loongarch64  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/b099b80349d971d16a7ed7de95b3483758bf5217 |     
  sparc64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/1a4dc12d427d0c21edec68ebb5f5aba3133fdd8e |     
   mips64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/6528b563c49572a07f7e7b81067666c488f43119 |     
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/5e2fea8e78b069171ec94d287eed172a5de64b38 |     
   armeb     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/96876a63e3d2d14563cc0b7749c116aee474089d |     
loongarch64  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/05b7a5546ed3aaa6533f65f9603545d76a500605 |     
  powerpc    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/24c386fa36364310780160098f39fb76b410a9cd |     
   s390x     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/5c55f3d1a5a53bd488f955acdf5b5fab602a82bf |     
   armeb     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/ad45a0201a4c004de719eea7a20a813d302f6f02 |     
 aarch64_be  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/ad8462630641ec3513093b50ea5886c1e39f010b |     
   mips64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/3bd65826bdea3866f4b9412c0e0d26d58639b6c2 |     
powerpc64le  |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/b4d7d35864bf9ff5fa88a0c58e985c5a482959f5 |     
    arm      |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/9d77c3b7160c28674eccfe1fcc81769569d563b0 |     
loongarch64  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/daf8ca5f928f207633230d69b59b9d02f5543d48 |     
 powerpc64   |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/e061f49656749a81339386d45b8a2fee01529b47 |     
  powerpc    |      pkcs11-helper-1.30.0      | NOK | https://autobuild.buildroot.org/results/30a30f58b24c8c0644699966178072b22d8c0eaf | ORPH
  sparc64    |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/930ff41f650b0f65115b97400ccea9c500ca43be |     
   x86_64    |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/55e5a79c5921febf725aedbbde52c3f7c7c5825c |     
   x86_64    |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/8bc330922ecf4af54aaba3fdeffb0cc7d3d96c59 |     
powerpc64le  |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/c2607914715db6fbd092e519e1a84c4b6825f6a3 | ORPH
 powerpc64   |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/3897aa711e2eac17bf7760974a51e3a63a49dd5f |     
 microblaze  |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/7234aa375a36d72a86360bc239d0480b42a4cd42 |     
loongarch64  |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/07f441a2e5ca00cbe7f257c260d4370add01d34a | ORPH
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/6e3d369b47dea36513460f39ac8e91c7b86afc84 |     
 aarch64_be  |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/d60d29c2a36b9977b9b30c46594a15ef7481eb0a | ORPH
    arc      |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/b51b357385cc4ba4ef21a6fb8a3857822adce216 | ORPH
    or1k     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/bf188d3284d648168d392da410b06bc090eae866 | ORPH
   xtensa    |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/b385690e1a050df0f44b62e95a8c16b385a16bbb | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

libdbi-drivers-0bfae6c43134... | 2 
                   cvs-1.12.13 | 1 
             dahdi-linux-3.3.0 | 1 
  gobject-introspection-1.84.0 | 1 
                libcurl-8.16.0 | 1 
                  linux-6.16.9 | 1 
                openvpn-2.6.14 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4aeb    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/72864e1cfa222c82a9581fde887d12fb8495fea3 | ORPH
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/1b3aaf688a5c3b467f850ad16a020bd423b4e9e4 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/3b493110facc78a756800cda0cf6b39463ef5d61 | ORPH
    m68k     |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/1b9536b3e27bc5da0cf2b73c2c15788b73a172cc |     
   mips64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/27a6f36aad875714703ab09e8318564a673ac282 |     
 powerpc64   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/0382b6c2f1521c51e9546fa1cf390372f33e3d4c |     
   armeb     |          linux-6.16.9          | NOK | https://autobuild.buildroot.org/results/b9a50157785b5d41ca4b6b66222dbd491f49d42e | ORPH
    arc      |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/591251b757ab26ee5b8735795605fc22c72a5cef |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
                haveged-1.9.19 | 1 
host-binutils-arc-2023.09-r... | 1 
                 host-gdb-14.2 | 1 
                libcurl-8.16.0 | 1 
               libgtk3-3.24.43 | 1 
     libphidget-2.1.9.20190409 | 1 
               procps-ng-4.0.5 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/7d0a11ee5e303067c247a7d5c7572358d6a1ec2b | ORPH
 aarch64_be  |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/5903cde7a265276d735e92a7fe60c20f18cb87e9 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/507df03ed422c8ac14c696ff19a77f60f001d573 |     
  sparc64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/0a89aa051d713d26db6e8480cb18b3fefe4a5262 | ORPH
powerpc64le  |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/7643c7de23c46f06cf2a4e3e1bbf1454f730f3c8 |     
    arm      |        libgtk3-3.24.43         | NOK | https://autobuild.buildroot.org/results/ab4ca226cbfa8a56bfeeb1862e0fc3978b5d7c5c |     
 powerpc64   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/5c6f463a4659c13cc74f6b60045b1dd3688034b1 |     
    i686     |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/00106b1a6faba2aa7eb434d70023b9134984413d | ORPH
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/ae6ff71532f12faeb28ec055a93d34fe95926931 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                blktrace-1.3.0 | 1 
  gobject-introspection-1.82.0 | 1 
                 host-gdb-15.2 | 1 
                petitboot-1.15 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         blktrace-1.3.0         | NOK | https://autobuild.buildroot.org/results/2063d14b12cda9f74b74b8e564f99ba567379623 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/a50b7a22385227a23b7e7cc2fc71d1c000bbe89e | ORPH
    sh4a     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/e6f808a0e7828813fdd8c7c45cde2986cad3c39e | ORPH
    sh4      |         petitboot-1.15         | NOK | https://autobuild.buildroot.org/results/9ce4a2246e706dc313b76ade6991d49f95fd08d9 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
