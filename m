Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF696D11701
	for <buildroot@archiver.kernel.org>; Tue,  2 Dec 2025 04:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D57440FFD;
	Tue,  2 Dec 2025 04:20:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3iHNclQtj1Zs; Tue,  2 Dec 2025 04:20:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6799E40FC6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6799E40FC6;
	Tue,  2 Dec 2025 04:20:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5998723E
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 04:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E4A3408C4
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 04:20:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S6ZWhP3sbUeJ for <buildroot@buildroot.org>;
 Tue,  2 Dec 2025 04:20:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BA56340065
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA56340065
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA56340065
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 04:20:45 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4779cb0a33fso51687115e9.0
 for <buildroot@buildroot.org>; Mon, 01 Dec 2025 20:20:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764649243; x=1765254043;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IoNOLUZAu6aNMM/m9hzT/ZdHnLwj9t67UjgI8WpSKU4=;
 b=mtXWGw/hrJZ9nsXAM0AkU14EtRTtqmuJtH/JaotZQRidJxxBD5c3ADOzgNC1RY4aZz
 uFmyhi94vRJ37TOpDhLjKrMAMhchYvInrWVYtKH+0gnWSOqLEe2I7jnf8i+OXlTMJu0E
 pN3eN0Pr9MMVXmtPIV9TiyJSYS0JKxGfPDQy2QrPa13o+L7q+GBSBLn9u4DfeOnB/u4/
 r0kFkWwCttMzlIAHLqfGO1V+ktokxfdwVT0Hm7ntvHhS+diUmsdXbn5pOprxYYpugYSt
 9HpZifW+EPxkEv8XKf/zmGH1olOivtc1I75n0Xkv+rKZ31huIW59I5HuwKr6UJ+0IUJC
 CaTg==
X-Gm-Message-State: AOJu0YwGeni8ORZ0BiwTbiiza2WEZI6bbMEs91w3S9aMVuDCoCNVZrZg
 kXCMAVm15w9485Cg987aFmKeJ3D/oAeRH2iOKHqDrlfKYCWj7FaFGZaF1iaIdQ==
X-Gm-Gg: ASbGncuAwXzXH20Hd9RS8JDZK4/gy+Y7j37IV6grtcN6FvDn/NiFnjbH9vs5g3W+f3f
 BOm0Kksvt9X2Mj0TLHxHq43QT/RKjFv/EselA8Kq5+yQsgnAmDTC/cUBFSc/CHqP3FKRClta582
 Si9rHvd/gqHsmAR7BsN/TUQjO9rI80aLwKUojf5QYQlU4elvrlcX6NCVOSqHCF9OrGfTKrnelp8
 VLevp67nJkWmR7/U+3dNTZApUGsyP6J01JpvIvMk0ul/b/UrbnChe5pBIUMgh9R2mRCFn176v9b
 PmnRkC9siY0bMZIxCAj+v1UF56/SbObbSrxRInJ6AI+41Cq0zoXm+X6mGb57b6jC5HYWKlg69oE
 JtVvMiImF85uM674JjbccX0hqrwGGuXyDooZSX3EiBTOKMj8ycOpqJLl0IGUkKLbdUCI8ZzSjDk
 JQpGVYmA3QCSJhBQw+cg==
X-Google-Smtp-Source: AGHT+IE7mRqp5Flp8K7ghOFIC9NuS9MLDTETXnORtQccupVSNICzZLUkWJELtCtKFnoRoPAenclBKw==
X-Received: by 2002:a05:600c:1d0e:b0:471:21:554a with SMTP id
 5b1f17b1804b1-477c01860aemr427737705e9.13.1764649243373; 
 Mon, 01 Dec 2025 20:20:43 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1cab9af3sm29449531f8f.41.2025.12.01.20.20.43
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Dec 2025 20:20:43 -0800 (PST)
Message-ID: <692e691b.050a0220.1477ee.23df@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 02 Dec 2025 04:20:43 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764649243; x=1765254043; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=IoNOLUZAu6aNMM/m9hzT/ZdHnLwj9t67UjgI8WpSKU4=;
 b=RV3ykoGx8qm0S7g4IGzDzoJ2nK+Ns182UM4lZLsT7XjpxIvLPzpmnocbB/VtCoOMCG
 NW/GqSn7bjkrvLe6elZtukZqJLy9uAgJxkLO4IdQkJOF6gpDbbHyQAnsLm8g6c/LqRh1
 hf88IqviaDn7R5Ub/S6Z+O/LgbJDcfDNESd2VzIuKQSKpqmqsjFgu28LePbuExCBOWMr
 d5jdc5SjlI09DiJ5QF3ZdlmeohzzKgDwFTdUngw4sMCm5ro9PZSwssnzI8R+CSZPq+0+
 sLz9ugxYxmh3vph2+QJ+nMHCFA15OcxOVIric2oBPVRHPq1+6+hsPQnpgelv3gFDMUOS
 0TzA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RV3ykoGx
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-12-01
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

Autobuild statistics for 2025-12-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  8  | 13  |  0  | 21  |
  2025.05.x  |  2  |  2  |  0  |  4  |
  2025.08.x  |  0  |  3  |  0  |  3  |
    master   | 39  | 52  |  0  | 91  |

Classification of failures by reason for master
-----------------------------------------------

                     kbd-2.9.0 | 3 
                       unknown | 3 
             dahdi-linux-3.3.0 | 2 
                 dc3dd-7.2.641 | 2 
  gobject-introspection-1.84.0 | 2 
              host-guile-3.0.9 | 2 
     linux-5.10.162-cip24-rt10 | 2 
             strongswan-5.9.14 | 2 
             berkeleydb-5.3.28 | 1 
                  brotli-1.2.0 | 1 
                   dante-1.4.4 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
              e2fsprogs-1.47.3 | 1 
          esp-hosted-1.0.4.0.0 | 1 
                      fio-3.41 | 1 
           ghostscript-10.06.0 | 1 
               graphene-1.10.8 | 1 
                   guile-3.0.9 | 1 
                   gvfs-1.57.2 | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-15.2 | 1 
                 inadyn-2.12.0 | 1 
                   libcap-2.77 | 1 
                  libdex-1.0.0 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
     libphidget-2.1.9.20190409 | 1 
                libselinux-3.9 | 1 
           libsoundtouch-2.4.0 | 1 
                  libsvg-0.1.4 | 1 
               linux-pam-1.6.1 | 1 
        ltp-testsuite-20250530 | 1 
                netdata-1.37.1 | 1 
           oath-toolkit-2.6.12 | 1 
                openswan-3.0.0 | 1 
      passt-2025_06_11.0293c6f | 1 
                pipewire-1.2.8 | 1 
               pulseaudio-17.0 | 1 
                python3-3.13.9 | 1 
                speechd-0.11.5 | 1 
          usb_modeswitch-2.6.2 | 1 
             util-linux-2.41.1 | 1 
                wtfutil-0.41.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/0b4e72aff722d676c3e907b88cfeb6eb814b1316 | ORPH
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/9fc4a87d84916f4f9d99a10286220ecd8e3553bc |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e6833e316d28b4d9784180a42da4b70752766783 | ORPH
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/9314bb038462ce7b15170a88b5d68146e14118a5 | ORPH
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/25a962bf9d902597147d35d85e6ddb1e0ab389a3 | ORPH
    i686     | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/1f83758887b6b1dd73c09e253e403eb7b2b307f2 | ORPH
 microblaze  |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/95fe45733eb1d952c3e8a4cf068790232a34fe49 | ORPH
   armeb     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/ab1811bc53bfb21a4303b46e5a9baca1b9f1c7cf | ORPH
 aarch64_be  |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/dc4e044500ee71159419974741c5d4833007c776 | ORPH
   mipsel    |      esp-hosted-1.0.4.0.0      | NOK | https://autobuild.buildroot.org/results/5e03300d5f02b512d703e3bda91b8fe26a75eeda |     
  powerpc    |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/6a4ff14ba6f01d527d6b98e4dbfdb3051a8f5966 |     
   armeb     |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/9121dc48faeacb2fbd4fcabb8eb472a8915c2268 |     
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/335aa5c59c8b8adf53ff7c52fd869350f472c22d | ORPH
    sh4      |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/fa356e34498989290a5225fff45ba9e6c391c804 | ORPH
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/a219665269ffd52b86a98dc37e5e5f1eb5e43252 |     
   mipsel    |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/7c2c3192739916879500a07f5057d2ce2a0b0f51 |     
    i686     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/da4b01fdb31e610dc5a61d1e9e25c767160aac5b | ORPH
    mips     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/c70b07e5cfc66df9d699c86f4a5a1e91814e80a6 | ORPH
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/a8cd6f84d80d25c0e885478a01d3fe331071a9e2 | ORPH
  aarch64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/5d3a6e4fde1bd5d9840c20d19fb8e9ecfd69565a |     
powerpc64le  |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/7f333fca186fecf31cf5424b658baf54320c5c61 |     
loongarch64  |         inadyn-2.12.0          | NOK | https://autobuild.buildroot.org/results/643c2ace91bf5ada75fd607338574d78cdbc0ae4 |     
   armeb     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/db6ec3b04ae16d73ff42cc4f011fc23a95e380fa | ORPH
loongarch64  |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/dd1d9634d3248192fb2aa170166bc20cc766b293 | ORPH
 powerpc64   |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/5e70410ecafe4c9ab5a3a92c1e8a669b98e379d1 | ORPH
  mips64el   |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/5b35d98cf8b9b32df91d48722e4512f766c86e9a |     
  mips64el   |          libdex-1.0.0          | NOK | https://autobuild.buildroot.org/results/55275f8f577ff20cdedce34bf8a0462556808b13 |     
  aarch64    | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/1cbde7395cde13ae6c90dcc8f2e85a66bbd9f669 |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/835cc9e2b93dabc9e90b79f4a9e374b04095247b |     
  aarch64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/a1d18ffe90abb25828aa3ad9767b090158bd23c5 |     
loongarch64  |      libsoundtouch-2.4.0       | NOK | https://autobuild.buildroot.org/results/12c7b0a42054bb99ff77da962b027affbcccd695 |     
    arc      |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/77cdea4586c1ab47151851d079687690704fe885 |     
  aarch64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/f27723f017a1694c9fda612080a1b91c28921d46 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/12c3c5a395bda64508976b9761418bdf0d9c8797 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/10531ae862459237f3a99fd4fabf8edf3aa333e4 | ORPH
    sh4a     |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/a16de5307b5c8c4407e9ed0b02c7d9c7a596efca |     
   mipsel    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/bab8e921c3c0368ff7afc7a3a1fbe1ecdc082699 |     
 powerpc64   |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/c8eef8538c7ffaec462f59bdb7b9e7a7b19d8453 |     
loongarch64  |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/2719cbf05c7a83b018c202ff3d1b0f14292aff0b | ORPH
   sh4aeb    |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/6b6de8a40330b578f00f0f61bbeec8180370bd03 | ORPH
    arc      |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/7f11f54dfeb03ef10e005cded4f7bf5c05eb336e |     
microblazeel |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/821b40e101022ce99133ffd036e29b3a74d57337 | ORPH
  sparc64    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/4c059d2b1b347d188beafa5be7b2a5441c724a03 |     
 microblaze  |         speechd-0.11.5         | NOK | https://autobuild.buildroot.org/results/271e44f5ce9be0a2e16dfa2d9ee65701422a49c5 |     
  powerpc    |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/bd8f26e0fcf8cbb4d6851136c313dfbb7a985de9 |     
microblazeel |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/c9d8638228c2dd6d34ef81d6956172a675e6f501 |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/7a92f15058dcedab3c7038e9c4cf791fdf31542a |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/f46e73f92711f8a5064ed08e1647692ed249ac26 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/7f2c86e97a1bb61218ded96bdc602ada9e1491d9 |     
    arc      |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/fc39675fdde63351d51295742fa5d19970da4586 | ORPH
    m68k     |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/2babb835bab301b49476dc71e3fc0d572f2197f1 | ORPH
    i686     |         wtfutil-0.41.0         | NOK | https://autobuild.buildroot.org/results/5f0e9ea481dea586a36d025c01100d823ca7b2ce | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

            igd2-for-linux-2.2 | 1 
          linux-5.10.162-cip24 | 1 
                    mpir-3.0.0 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/0ddd94cbddf75856a7490304e5f962279f93bacb |     
microblazeel |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/3b0fc67c9af4bf65298ccaa9ce7ceddc5d92106e | ORPH
   x86_64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/14bda4c5737647b77b97f5c365aed5fdba2db557 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                       unknown | 2 
cegui-00b4e1fe174da53b7ed72... | 1 
            gettext-gnu-0.22.4 | 1 
  gobject-introspection-1.82.0 | 1 
                haveged-1.9.19 | 1 
host-binutils-arc-2023.09-r... | 1 
              host-rust-1.82.0 | 1 
                 libgee-0.20.6 | 1 
                  libva-2.22.0 | 1 
               syslog-ng-4.8.3 | 1 
               trace-cmd-3.3.2 | 1 
                    wipe-2.3.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/5a57d0526b081db83d33344c93724b107c18867a | ORPH
   mipsel    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/86f6a6eb9be7a30db37a68c61f5cdbf142890b44 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/062998479748304d59af726f1f04d2581d705e54 | ORPH
 aarch64_be  |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/f5fa7c6324801696e1279b9f885d348630712c9c |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/4378e2fa722d60aae49c13efb72f86dddad8d919 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/b8d69966843db335d4f81c179e3f267d0d358f8a |     
   sparc     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/b5b143a465d47445a85dccd2db3cc51782468915 |     
 aarch64_be  |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/c010589ed59602f3c97579e90e5c041d81e2c397 |     
    m68k     |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/682b1bc1ac688e8bf828b626a402af84d6f5ff09 |     
   sparc     |        trace-cmd-3.3.2         | NOK | https://autobuild.buildroot.org/results/aa2f3410a3d1eac8f29305ed664b132e566064da |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/55b6e9cb08661e137499d7f51cfb03328a366508 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/3319292523d4fd15c1ecc1cbc459876697d65a93 |     
 microblaze  |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/527839ccbadfdc79871fc07d140dc4a06ab7e866 | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

            host-binutils-2.42 | 1 
               syslog-ng-4.8.3 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/bbd5ff25e42281c3a039686e992dce3ff6505a45 |     
    m68k     |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/d20a9495627e60b780228e21934b546181979745 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
