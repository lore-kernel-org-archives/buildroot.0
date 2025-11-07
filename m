Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36DBCCFA05
	for <buildroot@archiver.kernel.org>; Fri,  7 Nov 2025 04:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C42D60F00;
	Fri,  7 Nov 2025 04:20:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EDOsGyeOnk0l; Fri,  7 Nov 2025 04:20:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7BA560F77
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7BA560F77;
	Fri,  7 Nov 2025 04:19:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 414559E8
 for <buildroot@buildroot.org>; Fri,  7 Nov 2025 04:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24A1E60F77
 for <buildroot@buildroot.org>; Fri,  7 Nov 2025 04:19:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D5wiUyUbZDFK for <buildroot@buildroot.org>;
 Fri,  7 Nov 2025 04:19:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5B3A560F00
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B3A560F00
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B3A560F00
 for <buildroot@buildroot.org>; Fri,  7 Nov 2025 04:19:56 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-477563e28a3so1867365e9.1
 for <buildroot@buildroot.org>; Thu, 06 Nov 2025 20:19:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762489194; x=1763093994;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h0uM8Wjsjh1Yl3dY0H7o0b0YF0rgWjMDnKTNV+CEJ+8=;
 b=PrbhAzfI8MylkqxGxzUUjKsHN7rwDVLoiS4AedkVWaxLwjMXW0iVjhKr7UAJ6QUJOl
 9dtgdwMLPhxvXturYT+8QpC36V3GtLfk4VPyJmQgDxtPq4Jj+7J8R72jU0BJga9BgxCF
 JJPoCYY0JG3CrM1W0mgDQNhoBHkyRF2YWRKbWp7jnJWqntdruGoB7kmD2Whk1mXqUdes
 URHT3PVcxVLAP635ZtRVU1Z6bFeam+0moJ8SnvzKefs52EE86ourpEciYubTRPWtKOdK
 s06SC0tu6fwiAqpHtq/ewqciLseYddmmVRBAoZkSOBuTQP6P9Sqy/F++mg/u2plBbks9
 xdjg==
X-Gm-Message-State: AOJu0Yym23cvnIYc65rjvaR7lEIGhSp7ENA4GrytyI+fet99waXZnlO/
 LOEB9rOI+DgOiV5b38JwU6XLOLBCzJrqCRgBvN+QmEmyNL6MReU0GId3xq9Azw==
X-Gm-Gg: ASbGncuofazIbkyW1m80rSR6GXmK9xw56xDQ3tVjYVkdUKiU/ozK5tpVaqk6hPt0dK1
 d5c45WhXJioQ1gNaf8OBS6+Ku8N/xPHoUGfzeyAxKEKCpouEeW/odkE2OmdlHaEAhR5JAz+lwLV
 5O10pMoegyr1nqDRmPihSCjAvcyAkxtzVNiL2h4gp7UKymhRl0KTPEocAdp8bhF0CZjh4RlI4r+
 X6rMclfsl/Q+4ZHxEfZ+pLfVR69u86GpGMPfyBnJ7nsw79NikA9DqwKjETEq1M7OgvQb+fYit+J
 oY92Y4iVExczwhucj+pbzb1+HxSJDwwCAEjamv4dU8NcRCahxLFsJjp92zvgHyeuJBgrHIUuAfR
 fGi1RcU2p2/uJVpXtgD6K8wYdg6rMpjLbS+x3tUPTZ2H6dJfENlqqU5bs1aX0OxkcM5fRY1jSj/
 Zz2aubAfk=
X-Google-Smtp-Source: AGHT+IEh4jSq9k38E88TOM9ne2t8drgx/HbmSGF+Smg60DppsPyx/tWPndtM9B0LHa6oWaIUHItvnw==
X-Received: by 2002:a05:600c:4f41:b0:477:19af:31c2 with SMTP id
 5b1f17b1804b1-4776dc1ddcemr2294745e9.9.1762489193812; 
 Thu, 06 Nov 2025 20:19:53 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42ac677abeasm2659036f8f.33.2025.11.06.20.19.53
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 20:19:53 -0800 (PST)
Message-ID: <690d7369.5d0a0220.147fd.60a7@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 07 Nov 2025 04:19:53 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762489194; x=1763093994; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=h0uM8Wjsjh1Yl3dY0H7o0b0YF0rgWjMDnKTNV+CEJ+8=;
 b=iExKQJz7BegSjOkNZX83cTJdzxu1qN0rM1OjRvj5lpx9u56IFCplMudYjguHKJw2b6
 QfTUwWeF4DsDw1jRYmXglSPDqO72Tq77cO2OiMh4VZdhafNMIUkrH3lyq7WU64KFyMfm
 FKA6UPjU2DEzbGMmkQHbR68kd4/onmBiVW3htSxUM69a92HEjuax3USmFFOP+N4x1q+w
 cKRatCuIrnyOr7f03SS0yndg0IsuxwZ9YXYmPVQcRRBOumL0UfpZIK+BzNG4FWZTDc7i
 uAPJIpaCdLv/CpaLwJPJ3DEjlkyygz2GZuVFSym+FpBRfdxD7vQaGLWEthgVeO55xocz
 YWIA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=iExKQJz7
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-11-06
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

Autobuild statistics for 2025-11-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  6  |  4  |  0  | 10  |
  2025.05.x  |  1  |  5  |  0  |  6  |
  2025.08.x  |  1  |  8  |  0  |  9  |
    master   | 30  | 85  |  1  | 116 |

Classification of failures by reason for master
-----------------------------------------------

                  libnvme-1.16 | 8 
                  linux-6.17.7 | 6 
                   libcap-2.77 | 4 
                openocd-0.12.0 | 4 
                       unknown | 4 
             berkeleydb-5.3.28 | 3 
           host-openocd-0.12.0 | 3 
                   perl-5.40.2 | 3 
             batman-adv-2024.4 | 2 
               bctoolbox-4.4.8 | 2 
              host-guile-3.0.9 | 2 
 host-softether-4.30-9700-beta | 2 
                  janet-1.39.1 | 2 
                   libks-2.0.5 | 2 
              libopenssl-3.6.0 | 2 
     libphidget-2.1.9.20190409 | 2 
             util-linux-2.41.1 | 2 
  binutils-arc-2024.12-release | 1 
                  brotli-1.1.0 | 1 
           dmraid-1.0.0.rc16-3 | 1 
               dvbsnoop-1.4.50 | 1 
                 expect-5.45.4 | 1 
firmware-utils-86739f2b3ae9... | 1 
               freeipmi-1.6.16 | 1 
                      gdb-15.2 | 1 
glibc-2.42-3-gbc13db7393773... | 1 
           googlefontdirectory | 1 
host-am335x-pru-package-5f3... | 1 
                 host-gdb-14.2 | 1 
              irqbalance-1.9.4 | 1 
libdill-32d0e8b733416208e04... | 1 
     libglib2-bootstrap-2.86.1 | 1 
                libgpiod-1.6.5 | 1 
                  libnids-1.26 | 1 
                libpeas-1.32.0 | 1 
                libroxml-3.0.2 | 1 
                libselinux-3.9 | 1 
                  libsvg-0.1.4 | 1 
             libucontext-1.3.3 | 1 
            libxkbcommon-1.9.2 | 1 
               linux-pam-1.6.1 | 1 
                     lxc-5.0.3 | 1 
      passt-2025_06_11.0293c6f | 1 
               php-apcu-5.1.22 | 1 
python-remi-2022.7.27-37-g1... | 1 
                python3-3.13.9 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
               tipidee-0.0.5.1 | 1 
                   trinity-1.9 | 1 
uclibc-ng-test-132c6134d691... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/7d302c42ce33b8987b7c813dbc56bd6588b7ca29 |     
   x86_64    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/1207f7e8e9b185c9031df960c070a305c1f6ded6 |     
  aarch64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/219d1d620ce2de28b6e42fd5dba2dbbb8f00f105 | ORPH
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/f6488ae08f1d113ab3028da7d9359102a4fb4154 | ORPH
   xtensa    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/1842289ad5e7f0ec40cefc6609433df51d977c6f | ORPH
   mips64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/03d420aafbe09bd39ff9e5eb774f9970666529fa | ORPH
   arceb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/087f6edbeaace743eccaf2279bf1a067e9b8d00c | ORPH
   arceb     |  binutils-arc-2024.12-release  | NOK | https://autobuild.buildroot.org/results/3c09a4e7fe876789f2cae88aa57abf3dcf6ac919 |     
   arceb     |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/3983606111fbe9aca9d816c42ffbc7aa2deb701c |     
  powerpc    |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/630f29cb016c5efe361c2c74766c119f5f1a3d4b | ORPH
   sparc     |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/43c3543cf71130ce590d4360032f89e6463ef391 |     
microblazeel |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/d3852d2c8edccd99e1a761b2258eee9a6fd71c70 | ORPH
    arc      | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/9ff9fc028efea5598fcdcee3f06513922d30e04d |     
   mipsel    |        freeipmi-1.6.16         | NOK | https://autobuild.buildroot.org/results/81208600bd38c9bd1e5aa5f147ce54278e66f8dd |     
    sh4      |            gdb-15.2            | NOK | https://autobuild.buildroot.org/results/60adbeb9f432443e581bb6dde1addb6aff794244 | ORPH
   arceb     | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/34660c3f1f8fa80025c38e29b85a792f6e5a4b18 |     
powerpc64le  |      googlefontdirectory       | TIM | https://autobuild.buildroot.org/results/7f78c89efbe01bb1de6b87b9b43b8d9a3e0d517e |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/8063a67766aaa6ff7f2badce549b2d7fc28539f4 |     
 powerpc64   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/c51b9ea33896ba544897858def65e0cd6f372af2 | ORPH
  aarch64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/d214975b84af60ef12b6d9151cab0fd208fddd63 |     
  powerpc    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/135124c3f07c2e053238cb0ce2e63a6287ff0482 |     
  mips64el   |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/1a8796a9f381fe2ce005219017d6e3e75853bbff | ORPH
  aarch64    |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/6d4847fcdc7c002ec1d8779b560d7e34a0d1ea48 | ORPH
    arc      |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/341db7e2c174a2bca55a2d7380b4c3b95515ea8d | ORPH
    m68k     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/0c7b0477989978e510c9cd04c963ba0c5011d6b2 | ORPH
    arm      | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/8e2f0dbaab2f6c7900adca8db688672e24b222f4 | ORPH
powerpc64le  |        irqbalance-1.9.4        | NOK | https://autobuild.buildroot.org/results/e1f70982e9601576906a25d923252f623fbce5f6 |     
   sparc     |          janet-1.39.1          | NOK | https://autobuild.buildroot.org/results/f87a0d6938fe4ebe5284bfb6196fb9d19182e507 |     
    arc      |          janet-1.39.1          | NOK | https://autobuild.buildroot.org/results/cb2fd7ef82c782ba816ef6d3e2cca96936da1f46 |     
   mips64    |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/a9846a23b87d8ac2f437b0fc5e455941acb45100 |     
    or1k     |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/fdb91927e49b8bf934106539b7c937e9f11d23fe |     
    arc      |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/be190bf7441ec7e6da324e54df88a82faadea933 |     
  powerpc    |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/b53e4490efe88d5f7a134f6e68eb4ffb35ce1540 |     
    arc      | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/5a074ee9ca8ec25daea1dfacf9c258f44f103339 |     
    m68k     |   libglib2-bootstrap-2.86.1    | NOK | https://autobuild.buildroot.org/results/48c70212a236f3e82a1bce7192507a5f94fc571c |     
loongarch64  |         libgpiod-1.6.5         | NOK | https://autobuild.buildroot.org/results/eefc07b14468e2354feeda1e83e67a38bc352ae4 | ORPH
  powerpc    |          libks-2.0.5           | NOK | https://autobuild.buildroot.org/results/e8327ccbf05c9a919b3eecbef686eabe7b1a8bb7 | ORPH
  aarch64    |          libks-2.0.5           | NOK | https://autobuild.buildroot.org/results/ed707257100cea1209243e1ec6c6bb7f163aba5c | ORPH
powerpc64le  |          libnids-1.26          | NOK | https://autobuild.buildroot.org/results/3b9ae6ec9d48280b949a4ecfb9357cc6f32de851 |     
   s390x     |          libnvme-1.16          | NOK | https://autobuild.buildroot.org/results/4487b0c0150bc3aa12935c077ca627585919227e |     
 microblaze  |          libnvme-1.16          | NOK | https://autobuild.buildroot.org/results/f86d1c8aaf7b7da1072563f8c90e8f00a049ca2e |     
powerpc64le  |          libnvme-1.16          | NOK | https://autobuild.buildroot.org/results/619ae894d1b518d7d1127780f5779742a17c8d4b |     
   arceb     |          libnvme-1.16          | NOK | https://autobuild.buildroot.org/results/8f04179bb3118d4035f412a71b125bbce79ed77d |     
powerpc64le  |          libnvme-1.16          | NOK | https://autobuild.buildroot.org/results/8abd6546c2cec3091e142223012cace61d37b71f |     
   x86_64    |          libnvme-1.16          | NOK | https://autobuild.buildroot.org/results/8c46e3107e47c1ea2ae8a755755d553d6d56b40e |     
    or1k     |          libnvme-1.16          | NOK | https://autobuild.buildroot.org/results/b34505822038587d10c084086c411e9ec04e8280 |     
 powerpc64   |          libnvme-1.16          | NOK | https://autobuild.buildroot.org/results/f1a9cac840efe4cc08baf8177c727d3b1b4a805d |     
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/9a6ec8552731040e28d55bbdf2e158bab74bedba | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/6dc3f750206a37f04c5df3021465166a55fbe1c1 | ORPH
loongarch64  |         libpeas-1.32.0         | NOK | https://autobuild.buildroot.org/results/29cc0190b933e07dcee481c31e1bd19423d069b0 | ORPH
 powerpc64   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/6c4b34754179f4a758251b77a1a3c41b204d7901 |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/fe598c346d4bb9333ea3e1a77b1096281eec8df0 |     
powerpc64le  |         libroxml-3.0.2         | NOK | https://autobuild.buildroot.org/results/05ba42b4faffe4192eaedcfe7d3a68e64e12649e |     
   x86_64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/84c669b51e4f8256cca114696be9eb4173d68719 |     
   sh4aeb    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/c1be5a66138a381542ac8d8a66db09669bb451b9 |     
    sh4a     |       libucontext-1.3.3        | NOK | https://autobuild.buildroot.org/results/69b861e24947d606ecd9936101eaeaadd7243d61 |     
  riscv64    |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/756da34a1265dce12779bdf39f8376d5f53b9405 |     
   armeb     |          linux-6.17.7          | NOK | https://autobuild.buildroot.org/results/94bc8753e5212711cc483d84d245023f4acce643 | ORPH
powerpc64le  |          linux-6.17.7          | NOK | https://autobuild.buildroot.org/results/081a088cf8993fb11a5e13c1a36ca3fc8f26ad92 | ORPH
loongarch64  |          linux-6.17.7          | NOK | https://autobuild.buildroot.org/results/7a391df9556b7633563df7190ec141d735e4e0c5 | ORPH
loongarch64  |          linux-6.17.7          | NOK | https://autobuild.buildroot.org/results/3a5d4734f8dfd8f77ea80193d7e040ae3bd7a329 | ORPH
   sh4aeb    |          linux-6.17.7          | NOK | https://autobuild.buildroot.org/results/c0913dc31e5795c2e2f929b508ee1e0cd14c26c8 | ORPH
powerpc64le  |          linux-6.17.7          | NOK | https://autobuild.buildroot.org/results/87f41fe29a7500537f760275aa1ea190ab36c14f | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/931b920dbc64a344f80e0dad7b88ecf0f3c6dea3 | ORPH
loongarch64  |           lxc-5.0.3            | NOK | https://autobuild.buildroot.org/results/c072b392cade8e96776f5004c834a185681f0bac |     
   xtensa    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/20d60feb0c0970a1a31664043085c75cd61c9e51 | ORPH
 aarch64_be  |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/fd44244ee128e08d08af4fb5a18a0f2d40508f9b | ORPH
loongarch64  |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/c0525c8c5e08038733d66d64aa582f00e957f370 | ORPH
 powerpc64   |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/9b38b953374b244d44863d31aa6be4ba5b4a1316 | ORPH
    or1k     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/0c882696a011c6f10a0e107fe52233980e56547f | ORPH
   arceb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/e3ffb0f9f0572a951b7a09d8449c3e37754985b5 |     
 aarch64_be  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/9bd2c23642e2e45f5ac581389d962f537f0490c3 |     
   s390x     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/15638931e52b53a96ae6c22d80478a13f27c1679 |     
loongarch64  |        php-apcu-5.1.22         | NOK | https://autobuild.buildroot.org/results/89229870707ce01e80b9668c4e92646d9b23908d |     
   x86_64    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/6a2e6d0dd00e0941eab3c9b2c59765ef358b8f9a |     
  sparc64    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/6b25e3d7f95d7ee2ae826724bb5a14535b7b7738 |     
   mipsel    |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/67bb23df726b11f6f7b5857ca69203d0ce980839 |     
loongarch64  |        tipidee-0.0.5.1         | NOK | https://autobuild.buildroot.org/results/c17ac4d12ad683e51cf7d2369d75db332b3e61ed |     
  aarch64    |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/6fd8d065246991a46ecffcc99514f5e9a659d8e0 | ORPH
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/4af368e27ba94f0d3e64936aac4bf1d0b9c93768 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/29439b0e4dc18b6b86c223e52ba42bf48bce207b |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/e98d697923eb963a80b37ef21238bf7a88097f40 |     
   sh4eb     |            unknown             | NOK | https://autobuild.buildroot.org/results/2483731ff9e2db109ecf9ddbb63035fa3fca8b84 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/047e0b8f4fcb944750c30caf22703d3f82700c7d |     
    m68k     |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/07560bdeef89f18ab45d2ed82f8bde5cc9f105a0 | ORPH
  mips64el   |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/6b97fb87f45d2473096a5f8a5d19d53b38329126 | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

                  assimp-6.0.2 | 1 
                    bat-0.25.0 | 1 
                enscript-1.6.6 | 1 
  gobject-introspection-1.84.0 | 1 
                  libva-2.22.0 | 1 
                    mpir-3.0.0 | 1 
                   perl-5.40.2 | 1 
                      time-1.9 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          assimp-6.0.2          | NOK | https://autobuild.buildroot.org/results/591a536d71e5ae59d64c51a939ead399961a1630 | ORPH
   armeb     |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/041af4463c43c54cb882d91be84921a3c4fccea2 |     
microblazeel |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/f4afdcf50352971a557ef3142b98064649b3f23a | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/644784e637dd22e10dbcf2c7a463623cca67e692 | ORPH
  mips64el   |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/ba0177b793c80ec0bb5b4b60e28b2fb3f0b0f24d |     
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/46b3b1a44735ffc69c060588fec45c81774b9d0a |     
microblazeel |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/071c276494325949b8db6dedc48028ff42f9ee5f |     
microblazeel |            time-1.9            | NOK | https://autobuild.buildroot.org/results/2d440a31fc49366d77289f1d21080e1861c6ee21 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               freetype-2.13.3 | 1 
                      nbd-3.25 | 1 
                     nvme-1.12 | 1 
package/python-flask-cors/p... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |        freetype-2.13.3         | NOK | https://autobuild.buildroot.org/results/7ee724694bc4f3746aa294d6b3f014d028a82c5f |     
    or1k     |            nbd-3.25            | NOK | https://autobuild.buildroot.org/results/ba04cd3ea77a4d6bace73d0301ad277c04f27526 | ORPH
   armeb     |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/aaa6622b3a8e43c05bd105c67b7f0c5dfc8bed49 | ORPH
microblazeel | package/python-flask-cors/p... | NOK | https://autobuild.buildroot.org/results/58cc0715b47ae1617886017d8296a13bf1f7352f |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

     s6-portable-utils-2.3.0.4 | 2 
                  delve-1.22.1 | 1 
                    gdal-3.8.2 | 1 
  gobject-introspection-1.82.0 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/c4055dc9fae8c190675ad812edf969447f2348ac |     
 microblaze  |           gdal-3.8.2           | NOK | https://autobuild.buildroot.org/results/fa0e25c2ac15519caa877a3fa45da6f434f872bc |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/e474580d4dcbc9b71a64a233ef1574a8d45860ae | ORPH
 aarch64_be  |   s6-portable-utils-2.3.0.4    | NOK | https://autobuild.buildroot.org/results/7e56c473a4c9fc6bffc18a0b30d4813c943b5567 |     
  mips64el   |   s6-portable-utils-2.3.0.4    | NOK | https://autobuild.buildroot.org/results/2f42f42ebe7d084bc6774fb39c80da40a2eacb99 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
