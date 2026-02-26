Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8335FFD4612
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 04:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0791080EC1;
	Thu, 26 Feb 2026 04:25:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NhnRmDiXd2BO; Thu, 26 Feb 2026 04:25:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3A8E80EDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772079946;
	bh=RRDgqKVKG2COeikmLXkyyEHL2Rb6Ozft1eJCTZWpDYE=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=n6tV/XqvuO0Em9rZGM5lFoilA/0EiT310PIkV9ETgNo0b/QEgzevNFws2JwzMm+6s
	 JU6+TdS0l29iLjXcCrA/Pm8RV9ebSpyaXTaTGkl/YQ3VNe2rJetFWYXOnixdVAFuvO
	 pJiS+6sQSjMpgMyRv6QR4sx4hKzB6emVH5MXAguZMR/NKIDKxHuSnB/afSGpO5o547
	 1MF+Xr/y8HhhVeE//77wt4wOKusOSCnleL+uR7N3y/tYBP8UAYzbMx69L/xiMyKlDU
	 7eWMFFawBVjI4rgfP3sIgSo2xrDfTLUbnuLEE8SJMpRI3zAuIdPy7FODberEBsXReo
	 F1s6WFTRyI/AA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3A8E80EDC;
	Thu, 26 Feb 2026 04:25:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2344B438
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 04:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0429540BD1
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 04:25:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9BKF151THlIx for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 04:25:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 70F1E40B58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70F1E40B58
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 70F1E40B58
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 04:25:43 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4836f4cbe0bso3624145e9.3
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 20:25:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772079941; x=1772684741;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b77zlPlIF2Kc7JUNam5cwCwNPUWsXVLRS1qdap2QN5Y=;
 b=uJxwZzIpxfF5VGU8gvMWgauTDG1mYAUl4OVzEfP4sYsm+T7u/KGrNqzayXEzgAPNXH
 wCHbYimRDiLApKIc+Bmo1jT34wO35dQ14B0yUYs/TWuuUiOHgvcK+wmDprnPS7DsU4dm
 2c/QeBZF+WiNlrHwm0YmoIJDW1wu/SEEIUeWupld1c8/i5p3C129PZfguy4ffcrEmwQ0
 iKtwpsUPdUVi1znmu2Hr/W1aaCqJ0ZhEBkRMUUNpXc6ZHk/3eTj2W7Ht30z5Rv4Yn0Ln
 NTtv6AZpG1bw4izHpHAWnXAn1MtqzK1aC4EeofJbwoGfk6YZdLPoKzM2lmb+bE4IuEIp
 lvkA==
X-Gm-Message-State: AOJu0YzUDH2D0wZEmjFGdnTQW9Puc9wo1M5ScKuAegxxn/diZfFzn1lO
 v7i8emGJm1xZpA3o4zsq12IlXD6yHH7gENr258C/sMX0io+URHvBpW9xZua6yAGH
X-Gm-Gg: ATEYQzy8oHwdWrwcnruqO/UJumt8bWNxnPj/oaPKNeb1PvFYESZC/HlRgLWo4f3nXWu
 6IbFy/wpBXdWQSupP9d1joTNbqGtXNQIr6t5P1MGpZ6NGKuaTriLZPg3IEwMQYW/mDi3nw9ywOV
 z/C2wCCAbObvKzX7TgeZm93WAR/V+CiXjaDB/HeqEYw9db3r9i3ob85M4mCy4Ij+FGZek9Sc7lZ
 PBwCL024QKvJUI+z8sRv0ICG8UbxOLV+y8D2sQCyd7skzEG/mjhdU2ninSSTILpDGPwK73Q8o9m
 6Q/+VpsV5WtGq3VcqpeI9KlFE6+3E+e0dQ94H8ZlMB+XEz+dbWTVW3Obt6vJNeKy7X8D/h1r0z/
 ImEt4rC/lgINbePKbFLIAuRsKDX/sC8rXs/lIfrMn2FCaSI0yGZF6m4zCZ7rSyNgDguODL6ZfQt
 PCTE9r2de6fXXOyecYyJiZl0MNByqYolSPh9GCnLVp
X-Received: by 2002:a05:600c:6812:b0:471:700:f281 with SMTP id
 5b1f17b1804b1-483c3dee17fmr7437175e9.25.1772079940765; 
 Wed, 25 Feb 2026 20:25:40 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4398a292babsm14639240f8f.37.2026.02.25.20.25.40
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 20:25:40 -0800 (PST)
Message-ID: <699fcb44.050a0220.748b7.e737@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 26 Feb 2026 04:25:40 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772079941; x=1772684741; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=b77zlPlIF2Kc7JUNam5cwCwNPUWsXVLRS1qdap2QN5Y=;
 b=J+V+VmuiXsM61yDV65b0j3mCRlsRY1kEsa2UDxixQqY6vC2EmxR0b8R6PYLxu9Od20
 5eVcKwOvIReeHUBEmfvmwtCff6kJ+hIK4+O0OwGc42JujBnPLVY0a408B9Kd7j6KNars
 UZ3R1jmdYnEDNiQoh9t5EQG0kTADlxZ4Oq+oaH2GxOlRA8LmrU9qIw1+maJvcItS5IPh
 gjhO5D3WI2IuMug5bdpteAtKLBt5m9W3MccVwabkaYbosMVRtNO7nF8DZWtjpIhBAQvJ
 YqVSMaGElIsb8HGVnmEtmr+uYxRuotjCmc7RdUtVCMLosiRDPmObnYWF66pGQv/Z5g/i
 deEw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=J+V+Vmui
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-02-25
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

Autobuild statistics for 2026-02-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  4  |  0  |  5  |
  2025.11.x  |  2  |  3  |  0  |  5  |
    master   | 32  | 46  |  0  | 78  |
     next    |  1  |  0  |  0  |  1  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 6 
ustream-ssl-5a81c108d20e247... | 3 
  gobject-introspection-1.84.0 | 2 
               openscap-1.3.12 | 2 
        s6-linux-utils-2.6.2.1 | 2 
                  cairo-1.18.4 | 1 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.4 | 1 
            erofs-utils-1.8.10 | 1 
                    fcft-3.3.2 | 1 
freerdp-2.11.7-18-g0ee17e2f... | 1 
gcnano-binaries-7c181cacf89... | 1 
            gdk-pixbuf-2.42.12 | 1 
glibc-2.42-51-gcbf39c26b258... | 1 
                  libbpf-1.6.2 | 1 
               libcodec2-1.2.0 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
              libopenssl-3.6.1 | 1 
     libphidget-2.1.9.20190409 | 1 
               libunwind-1.8.1 | 1 
                libxml2-2.15.1 | 1 
                 libzlib-1.3.2 | 1 
               linux-pam-1.6.1 | 1 
                 mdevd-0.1.6.5 | 1 
                memtest86-7.20 | 1 
               nushell-0.108.0 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
               openblas-0.3.30 | 1 
                 openmpi-4.1.8 | 1 
                openocd-0.12.0 | 1 
                    opus-1.6.1 | 1 
                   perl-5.42.0 | 1 
           python-rtoml-0.10.0 | 1 
                   seatd-0.9.1 | 1 
                     shim-16.1 | 1 
                tpm2-tss-4.1.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/4cbb0a4794ab2b2bc89534b366b7f774586813d5 |     
    arm      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0ea12ece0b01c686f23d7af279c54abaad04a0af | ORPH
loongarch64  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/3332126d1373b3cb0462d35f80aabe48f9757e12 | ORPH
    arc      |       erofs-utils-1.8.10       | NOK | https://autobuild.buildroot.org/results/e38a3cc3ea33296b3cbed78260279c2bb3fac1fe |     
    m68k     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/7f059182b54b5644c23f91ba786265e41ba74974 | ORPH
   armeb     | freerdp-2.11.7-18-g0ee17e2f... | NOK | https://autobuild.buildroot.org/results/51bf049908c3319462c5abf9483d4f43471400aa | ORPH
  aarch64    | gcnano-binaries-7c181cacf89... | NOK | https://autobuild.buildroot.org/results/fd72acd2812cddafe5a32b96853d28b85a755da4 |     
   mipsel    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/3dd14b3b59f065c7d614bdc944f9f10428c005c5 | ORPH
   x86_64    | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/f3a3b1c37b168d5f8f912e9d06cc408704859997 |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/211e7a3a3130c5d6212503ee8024b9360110605f | ORPH
   sh4eb     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/42097ba60a077d35981aed1c2b20922d39142e47 | ORPH
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/1ab888f7d8e1cd6c7fde572e2289746e63378f82 |     
  powerpc    |        libcodec2-1.2.0         | NOK | https://autobuild.buildroot.org/results/62ecf79f51e57df432ef1a4ec32f5549d7cbfb5e |     
    or1k     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/2125544f6768f20ec5438f3fbbbb2fb172b3085a |     
    hppa     |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/d40c9002cc1883182446dee1241fe505b639ff47 | ORPH
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/2fe5b0c40d67097f30390bd9687c9ecbe7815e4b |     
    arm      |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/11fbd2a5b01bc8bc39f0c32804186f73ebba0982 | ORPH
    mips     |         libxml2-2.15.1         | NOK | https://autobuild.buildroot.org/results/5687e46d9e677d7b3171f63c69c4b28af37580fd |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/7e68766209ece8878b2e7aab3e65119ea5b8a1b9 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/654d48f9f5014b995f2559b04ac6015ce572efc2 | ORPH
 microblaze  |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/9ebf59686b04fe80419f94bc1d5cfbc587007404 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/d33bb1039bcafaeaa6114adbdb590dc8cec39447 |     
  sparc64    |        nushell-0.108.0         | NOK | https://autobuild.buildroot.org/results/0657c3a33d10b6d572ff92cac7b7241709d5eaf9 | ORPH
loongarch64  |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/a04a177607311441b3898b8b9ccbe2995518ecac |     
  mips64el   |        openblas-0.3.30         | NOK | https://autobuild.buildroot.org/results/69caab71f3755d204123682a22061a64f3cfb21f |     
    mips     |         openmpi-4.1.8          | NOK | https://autobuild.buildroot.org/results/07e21ef72208969bb4b3635d151955fed5b43876 |     
    i686     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/404e6031647c49570d855f525bacfc332b2b686b | ORPH
    mips     |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/25dd1adc3eb87708472e56b6cdad24bb9f7afdd3 |     
  sparc64    |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/c46a7548a21c9babe484814e3190434c6f262dbc |     
   armeb     |           opus-1.6.1           | NOK | https://autobuild.buildroot.org/results/47fa8df04b0b860a9bb329b832feb804020e5a1c |     
    arc      |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/1beac32a1324fc545bd27b7b7cb4053201b71c03 |     
    arm      |      python-rtoml-0.10.0       | NOK | https://autobuild.buildroot.org/results/202c82ef4c53409dbc183f0e80d38b39b3bfd65d |     
  aarch64    |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/ba002645506547108000c81aa10290cf5cbf1e30 |     
 aarch64_be  |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/bc68cc8a58c16730076d608a24b0489e605e7a7f |     
  riscv64    |          seatd-0.9.1           | NOK | https://autobuild.buildroot.org/results/6786e9a5a598d87381e8e559e4b19c1f9359bf67 | ORPH
  aarch64    |           shim-16.1            | NOK | https://autobuild.buildroot.org/results/828bb0c065d3b404dea1c90c0b58096f8bc117f8 |     
 powerpc64   |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/b9c7f01256300c73a977430c4f2307cc4aafe9fa | ORPH
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/c78d7b2c82e60cfa50702acee21ec10c6a38d7f4 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/cc54fb2cdfd865604910e440ba8fe9b791eb7895 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/07eca6e78c08d9098c919395e6e1beb27b5498f3 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/a039f776f3db140e70dbb2d0e49fcf8bf3cf3912 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/cd5c0da586afb1ec2982889fddeded1cd935da23 |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/56636f544580a6f4cbbe0397cac358a674f167aa |     
    arc      | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/e5b559b6bb2bb0c43dcdc7fcd3fbf2d7812a22dd | ORPH
    or1k     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/7a166be6b78a4c4a3a805971e49a74dd16df5912 | ORPH
 aarch64_be  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/17a7435a063011873d120de3d9a3b3c68644cfcf | ORPH


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                 glibmm-2.76.0 | 1 
libcamera-apps-v1.7.0-10-ge... | 1 
                openswan-3.0.0 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/86ec3efb9e6377438c61a8505992802b8c0c7551 |     
    mips     | libcamera-apps-v1.7.0-10-ge... | NOK | https://autobuild.buildroot.org/results/98ed8161cafb7db9bf92085dfb0e1634de4014f1 |     
    arc      |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/8cfdc0e5692c7e0c1da70db93a2dae9a91f8257e | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

              libopenssl-3.4.4 | 2 
  gobject-introspection-1.82.0 | 1 
          linux-5.10.246-cip66 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/26002ad5e569e9e27d08e56eec482250a386062a | ORPH
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/1110f3d4a0bcb9c86571b6a0f4929603f1ff6171 | ORPH
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/a03e8f667f033b0070bdf42d4067485be5d7a071 | ORPH
    mips     |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/41b546dc4b02472831c7dfafc324f238611e37d4 | ORPH


Gitlab CI results for 2026-02-25
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13232152135 | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/13215598227 |      
     TestFirewalldSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/13215597909 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
