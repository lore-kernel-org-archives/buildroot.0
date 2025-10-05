Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6465BCAC5BB
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 03:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E670840B9D;
	Sun,  5 Oct 2025 03:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9UGCoYoO_Uxx; Sun,  5 Oct 2025 03:21:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B4A740BFD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B4A740BFD;
	Sun,  5 Oct 2025 03:21:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 30DF3118
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 03:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16FF340B96
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 03:21:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y7Ygbws1DE7K for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 03:21:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 20DCD4056F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20DCD4056F
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 20DCD4056F
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 03:21:22 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-46e47cca387so38733885e9.3
 for <buildroot@buildroot.org>; Sat, 04 Oct 2025 20:21:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759634481; x=1760239281;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XS3sogTdMYEsEMar5OQa5GOUMQsuGEflWLhmfdHkrgg=;
 b=iO5x4mXBDsEeI0XufJ+7NwiOqTW1FXSKPXQYRH6UqXJvy/Hj9v9mBfaFujzfrVoxdP
 n1pBqKF5wjPqhnzLuvVkhOi4dC+ux+nRc8cmiMT6tMCvf10gjf5hOywcP6Rf6oWKXMbo
 4evzy8Wyc2l2BxB6D9o06KyXavT/h0lvSUQ4L7EviS6yFdOzcl3saXwIXSOrToUUoU4k
 XH/9TQpJ/yYWIBBAVIq2uCDWA3RDwqjYgx5VbI2xTAl/e6NaZRSLUXRhZJsEKEIJZLiy
 fpPiKk8MxdDP0fudVcnjLL2irkazemaNVQeIFws2RbJHHWFx7JfDwOZHR83hxTHolXWv
 9yxw==
X-Gm-Message-State: AOJu0YwlK1iDsdOI8sA5P2a8W8XqUZHt51q25ZLOLn01wBRUvGHHkG/M
 Rsh9ztNHjJd4hoUY6Um0BxvjKo3QWua0AYUP0791pLpIQ+piioVdtE097lMrxw==
X-Gm-Gg: ASbGncuhG29OGuA4IteXdqY3k+BnjHez3xhzvVdNEq4JjsSv0bGZi483NZFjdAw8N6D
 N2de+jCW/kP4WoqFGmq+oNGgu3EQbfh2Z5CYOlAgDdvxzD0KwiiPnWM9ArhjsFyRzMp8GDsSVg+
 O/ihCwrmoORJisd3XyZKal8W31hmCHCAFtQRcFsrxCtzGws69WegLtynxZWUlnNVUqJXVsK8CJ4
 qIKA5C6vwT2Wn+oiFBTABWJ+zTHjMW57ZGIwH2lpetL4xalnbyCrgXeCDb+u3y3nDP+OvReMK8v
 aBO7bvxGX8cUb5gTexNrSCzrNLNdI7z+px/rQS4DEB3DNbKbhkvdaPyKva1f9hyaVxEpyuHNu48
 KjHmnL8mdObykIFX+XVJxzCgICA2vQfcWH+TxLe3Ba0wM2gAgFgyEAg==
X-Google-Smtp-Source: AGHT+IHC+T9X7K227fQd/9movHD8lVfz/2bm62NvWvQHGGJTlKOlnX8bdWRCjCUwVQv0hy5BUR2BpQ==
X-Received: by 2002:a05:600c:8b37:b0:45b:6b57:5308 with SMTP id
 5b1f17b1804b1-46e71104382mr56764805e9.7.1759634480648; 
 Sat, 04 Oct 2025 20:21:20 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e619c3b75sm189334245e9.7.2025.10.04.20.21.20
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Oct 2025 20:21:20 -0700 (PDT)
Message-ID: <68e1e430.7b0a0220.38a0c.1393@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 05 Oct 2025 03:21:20 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759634481; x=1760239281; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=XS3sogTdMYEsEMar5OQa5GOUMQsuGEflWLhmfdHkrgg=;
 b=jKGp8zglxcn6Wt0jUc4dLUiL7036TkAXxuNwfl4IROMXY6a19kPWp2DEnhFmMEbREN
 O0YN6sE04XjSMzD90JBGXAB8A3LYl9AxQycJSLWF+vxcHALq032MdM/aDa5r636G8ZS+
 UMiEXUzgMq9JDMX0hGetpwJAYopCfm+TdS/4ezyvy3lbU2Fu6x3gtvxeNYtaHE6AtIZk
 EBGD9UAhjYztCpcgUe6S+zvqRBY799Tt698PcDCNclOrEqgTR1kP0naWkZQeRrDjq0RG
 0Ww+FMkHED70UjTlCt0kXDpEQFXxnGYO8ybi0ZaO2earXlSy3mADxyw58PtfqVPV9nIz
 BsPA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jKGp8zgl
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-10-04
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

Autobuild statistics for 2025-10-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  9  |  6  |  0  | 15  |
  2025.05.x  |  1  |  2  |  0  |  3  |
  2025.08.x  |  2  |  4  |  0  |  6  |
    master   |  8  | 107 |  0  | 115 |

Classification of failures by reason for master
-----------------------------------------------

package/linux-headers/linux... | 32
                  libsvg-0.1.4 | 4 
                    linux-6.17 | 4 
               bctoolbox-4.4.8 | 3 
                   cvs-1.12.13 | 3 
libdill-32d0e8b733416208e04... | 3 
     libphidget-2.1.9.20190409 | 3 
    host-llvm-libunwind-20.1.8 | 2 
    host-mender-artifact-4.1.0 | 2 
libdbi-drivers-0bfae6c43134... | 2 
libftdi1-v1.5-62-g5e67403c4... | 2 
          linux-5.10.162-cip24 | 2 
                     nvme-1.12 | 2 
                openntpd-6.8p1 | 2 
      passt-2025_06_11.0293c6f | 2 
        vulkan-headers-1.4.317 | 2 
                 apache-2.4.65 | 1 
               asterisk-22.3.0 | 1 
             batman-adv-2024.4 | 1 
                    brltty-6.6 | 1 
          cloudflared-2025.8.1 | 1 
                     crun-1.22 | 1 
           dmraid-1.0.0.rc16-3 | 1 
        edk2-edk2-stable202505 | 1 
                  ffmpeg-6.1.3 | 1 
firmware-utils-86739f2b3ae9... | 1 
       freeradius-server-3.2.6 | 1 
                    gawk-5.3.1 | 1 
           ghostscript-10.06.0 | 1 
glibc-2.42-3-gbc13db7393773... | 1 
                 host-gdb-14.2 | 1 
              host-guile-3.0.9 | 1 
     host-python-maturin-1.9.4 | 1 
                  libbpf-1.5.0 | 1 
libfutils-c326ce0cc2a735438... | 1 
                 libgee-0.20.6 | 1 
             libgphoto2-2.5.27 | 1 
                  libnss-3.116 | 1 
              libopenssl-3.5.4 | 1 
                libroxml-3.0.2 | 1 
                libselinux-3.9 | 1 
                libsolv-0.7.30 | 1 
                  libteam-1.32 | 1 
                 lockdev-1.0.3 | 1 
                    make-4.4.1 | 1 
                memtest86-7.20 | 1 
                    mpir-3.0.0 | 1 
           oath-toolkit-2.6.12 | 1 
open-plc-utils-1ba7d5a042e4... | 1 
                   perl-5.40.2 | 1 
                ramspeed-2.6.0 | 1 
                       sbc-2.0 | 1 
                    sdl-1.2.15 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
loongarch64  |         apache-2.4.65          | NOK | https://autobuild.buildroot.org/results/8bc9b5f468a0d335f3caeac41869439482390b22 |     
   mipsel    |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/e433d1085cb4bf85376047689077043b1aa8b2d3 |     
loongarch64  |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/33c3235fefa66d217c3514165a98eed70c8d511c |     
  powerpc    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/e204036e7ad52d643e89486ab1359ae8b537bd42 | ORPH
  aarch64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/42764869e01a5aa870a3b4453241cc80b07d49d8 | ORPH
    i686     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/2c346198add1dd1a0f3e82a535ed5841d060ed0a | ORPH
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/9faaf59d3a51dc8c717afc8987e4759a16c797bc |     
    i586     |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/86f81f9693c84d21ae04e6a9b9e22d8cd5c77764 |     
   arceb     |           crun-1.22            | NOK | https://autobuild.buildroot.org/results/50e108f7dba6e5badd4f713186a6eedbe26ebd12 |     
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/b90c5508e2cafa50492290410900ed8cb775d568 | ORPH
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/d98e56344a87126a5d266bafe95034592aeb3bc7 | ORPH
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/1bbcf0980459587b7fd21f28f53d42e7062c7a76 | ORPH
   s390x     |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/15c944d6561fff59a663d39ce555a23903a617e5 | ORPH
    i686     |     edk2-edk2-stable202505     | NOK | https://autobuild.buildroot.org/results/50885ba396fa7f320bfb4b42175e58e46cd0ba37 |     
    arc      |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/8240d6d934787ed0c4c4e483b0ad36570cf25c1e |     
    or1k     | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/9c5bbce1759a7f17930d8e7fb47e8c09eee9bed9 |     
microblazeel |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/984094c47674c906a3b4411a4903b075e2be4bc8 |     
loongarch64  |           gawk-5.3.1           | NOK | https://autobuild.buildroot.org/results/780175e2309a8f584cf82cad1b354ba49cbb106d | ORPH
    arm      |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/ae1d1c9d2ad6d20492967348d137398e64ffb687 |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/e5f6610b9c39c1c5ef2058c07e549f129dbd1e5d |     
   mips64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/2d90d2ee1f30dfb45f74266ab33452fe465c6ae6 | ORPH
    i586     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/60cb66933507809ce3f75042114a06a8ee9a56fd |     
   x86_64    |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/53bd6aa14085513460288ff0ed89cf174f07f5a3 |     
   x86_64    |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/9b31aeefd1d383a566c8f423c63226b0ba370774 |     
   mips64    |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/64aec8862f83c42f7fc7252d779902738b9bdcd8 |     
   mips64    |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/dde8708b944e40aa97cd9084bb31581eb278e13e |     
  aarch64    |   host-python-maturin-1.9.4    | NOK | https://autobuild.buildroot.org/results/9075ecb4e673248519fdcf289e0da4ec05946520 |     
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/12a9f63c0ac65418ed93612075118d8fd5b07064 |     
   armeb     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/d64ba3e4a9fe2649033b145b71b6f4a1b8ac2f85 |     
powerpc64le  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/4161dfaf2d7309df52f2fbe78903c0109f74cbec |     
   arceb     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/da275a687ff1b273f41294e5214d046150d0810a |     
microblazeel | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/797dc01de73bf0e296542a85dccd22784d555f09 |     
 microblaze  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/e9c546b3968d7a61cb0dc49d3691e8b233a41e9f |     
   x86_64    | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/48db90b92b971db8fdb76c28959c93f081b9fc84 |     
   arceb     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/cce1daad858ac10810c0be3b0d063fb44bf0f908 |     
    m68k     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/b8eac00b3d262db3d6f1fcf3f16fa1c3c46c5873 |     
 powerpc64   |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/49608c39584c29b2ce4d2db59f62c842d8c62d71 |     
    arm      |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/ad129c2125fbea9527dd4f0125002e9d2a687a31 | ORPH
  mips64el   |          libnss-3.116          | NOK | https://autobuild.buildroot.org/results/98d7d47b48db045b5b92135421dbc93cf24fa9f4 |     
    arc      |        libopenssl-3.5.4        | NOK | https://autobuild.buildroot.org/results/d39fc39c592b1357009c87901ab2d02622007a1a | ORPH
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/4b5ffb1481d9cccbc685fcd6d5b55c8ab48bd8d1 |     
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/982222e6a84ad0e5525bc2b8c04f74da5f255685 |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/3724ba5ed95aa3804cbd57580dd1e06337184722 |     
 microblaze  |         libroxml-3.0.2         | NOK | https://autobuild.buildroot.org/results/d3cd261d55403d72664e91a5665ae1afb9a63d4c |     
  mips64el   |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/5fa553d889f0d4b9a06269cbbb619a732151cb1c |     
    i586     |         libsolv-0.7.30         | NOK | https://autobuild.buildroot.org/results/1e51d4f06965c11a85be4a941083c224786d693f |     
loongarch64  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/3852c1e58b1e8b61226784df307fb269ba1e9e33 |     
 aarch64_be  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/f76514ab939764607f12b666e22f2bf05f3c1a4a |     
microblazeel |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/8a14574766564d3cc359f5e17c1360a67d1f556f |     
  riscv32    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/c04d4753cca312a4377913a07f1eb8167917b390 |     
 microblaze  |          libteam-1.32          | NOK | https://autobuild.buildroot.org/results/6b41db622d0709c4b5466b22b10e459b25533468 |     
   s390x     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/35fd56a4f501567396714a708f686107d60576f5 | ORPH
    mips     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/63cab048bb5cb40f90cb40dbbe88dbeb80ae3f55 | ORPH
   s390x     |           linux-6.17           | NOK | https://autobuild.buildroot.org/results/99cb07de44cab16cc32d6942f90ae0d7ce553c3e | ORPH
    i586     |           linux-6.17           | NOK | https://autobuild.buildroot.org/results/6e518991cbf0ca6f40baf7a62f20ad1a95fbfec3 | ORPH
    arc      |           linux-6.17           | NOK | https://autobuild.buildroot.org/results/27177a0d0c8debfb69cd0cd8149fccbf7b8c0a5c | ORPH
powerpc64le  |           linux-6.17           | NOK | https://autobuild.buildroot.org/results/43a3e8b2a368a8507e2d4a0b5aa127760653ea1c | ORPH
   sh4aeb    |         lockdev-1.0.3          | NOK | https://autobuild.buildroot.org/results/a2983e60c52099462bdbe0ba10a3b0424c3f6e06 | ORPH
    arm      |           make-4.4.1           | NOK | https://autobuild.buildroot.org/results/78b0053b79053d7da8619c77b7039e7a9c3f2eca | ORPH
   x86_64    |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/305db624ce8839d3608a192d69af40a237ecef83 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/1717e85bc2860a9d42812a2f96491afecc5a155d |     
   sparc     |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/5dbecc95ac5ad31b3669f3d4af5b147483e4ad92 | ORPH
   arceb     |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/9931322adadb708acaa96601b1a63c926144d8f6 | ORPH
loongarch64  |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/a29194d875ff7565afe70a721b55664fbd15922c |     
   arceb     | open-plc-utils-1ba7d5a042e4... | NOK | https://autobuild.buildroot.org/results/2ea79ac464d1506c5135b0c327d883e253d493a2 | ORPH
   mips64    |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/954dac98de1d7438ee0b08312fdf4688de786d71 | ORPH
   arceb     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/16f7adbc38056cd7420b93292baa725250ed8967 | ORPH
  sparc64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/9c2ef10d53b71879dd79413f078938eeaaccc775 |     
    or1k     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/eddecab6d858e17cc593ca53571ff3e13aa7b1b2 |     
  powerpc    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/197e618f4e8e6a30f822351120b694ccdf3287f5 |     
loongarch64  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/1b96b32cd8e9a318fb29c8c601caed1ea270af0a |     
   arceb     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/928cc8c430f0fde56e60f3abf0ade80a60df8a92 |     
loongarch64  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/9da03cfab8f1e5fbbed80d23bdaf58cd4cd6ff63 |     
   sparc     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/b18d2f4b6ac66ef630f11d4b6743b2a58620be89 |     
 microblaze  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/fb5491f6e15f8fb064abead0f6e951f15ad35131 |     
    sh4      | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/b406fec192a01960f1501cdb64fd2207cee5b6d3 |     
microblazeel | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/5547c1755efcf75be2248338eecebc6e622d4630 |     
   x86_64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/a11e03c384d05f5b6214403b81069c4a6f11a914 |     
 powerpc64   | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/7af70c338bacbeeed3e0959b0e766c9694b37a64 |     
powerpc64le  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/89012547e22dbfd8fe2cb69e24fffd794f7a8c42 |     
   mipsel    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/fb45de210c67adb24c7e5802469881a80fe79c10 |     
  powerpc    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/985268be4f895ed9468d654b8c9a47ab20ec66dd |     
    arc      | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/e95d8281a8c1fac45d398ceb3ed07a55c92dcc67 |     
  powerpc    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/e2dd2a878fc0e5f99b232b4a978160c08d11696e |     
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/da47659847eac7d33e1ecd8d0c689215c498279e |     
  sparc64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/37805536c1ce6f4c6545bf06e31804a53a19a426 |     
  aarch64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/faf5c85e18cfc99ea308c0073f777785e1a73a95 |     
   x86_64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/921a15ed5eba57387191b94044bbdad4d3ab5932 |     
  riscv32    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/fbf40bda2e31ed9b9eb94dbc398123695366b776 |     
loongarch64  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/736b725437584408ed17f4001df99561420301de |     
   mips64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/307d004a2f77ca191be753fcd8866ebcb2d26280 |     
   s390x     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/60f97dcd17f90da222099b58a7cf77564ffe89e3 |     
powerpc64le  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/854e68e9d4f49a7cec79b03bf60eeffec1ab02cd |     
  powerpc    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/4890ae9196efed1499a8c42c933813d063160d76 |     
   armeb     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/3643167edffa91b52b737a5c968d7445a7424616 |     
 microblaze  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/14e1cb778d53a9138c9370310c16ddf3b6ccac94 |     
powerpc64le  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/177702a61c4606e2cb393c890123bf0b74f37533 |     
    mips     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/c7f32835dcd00d46695b6f6577931c15e331a45c |     
    m68k     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/f5574be9fc4f35d93f4fd0968e1383f37a91c2e6 |     
  aarch64    |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/f835f38f63ed7a948435459b96e626f8e945675c | ORPH
   sh4eb     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/ae9049698d44ac08d5c0a53a728ea41c18d4421c | ORPH
 microblaze  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/f6d431076894d7621e6fd282130fdb67d8003438 |     
microblazeel |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/135ff5c26218791e52d78cbb464799289faad725 | ORPH
   armeb     |            sbc-2.0             | NOK | https://autobuild.buildroot.org/results/2d16eb4bb0c7f095d0d52af8553c498f6f9a295c |     
    mips     |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/950655bbbf9372f3d27e926acf5b60a1a8211172 | ORPH
    arm      |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/f7924a8d210b4462a730b7dbb795b8b706b13bf1 | ORPH
 powerpc64   |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/4b918f21e69bfe620f7c04467bb73ee5c21485f7 | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

              dovecot-2.3.21.1 | 1 
      ipmitool-IPMITOOL_1_8_19 | 1 
              libselinux-3.8.1 | 1 
        vulkan-headers-1.4.317 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        dovecot-2.3.21.1        | NOK | https://autobuild.buildroot.org/results/25b23697c411fd6f22deacbda756e8c0114911c3 |     
    or1k     |    ipmitool-IPMITOOL_1_8_19    | NOK | https://autobuild.buildroot.org/results/4693275fe3078e12ce1aa3a51e29928b408ed6af |     
  aarch64    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/4cc6a034eb9816af4971dbc5f61914b7bc9ccb05 |     
  aarch64    |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/bb0ae8a3ed07c281b2376782067c713f9a1ec764 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

cpuinfo-8a1772a0c5c447df2d1... | 1 
                 dc3dd-7.2.641 | 1 
                    dust-1.1.2 | 1 
                     fd-10.2.0 | 1 
  gobject-introspection-1.82.0 | 1 
          linux-5.10.162-cip24 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/200fcb80e21b80d3daf68927a2f98f2b8957e284 |     
    i686     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/ab7bb889e5f7be6cb48caca3540af0c4a529df88 | ORPH
   armeb     |           dust-1.1.2           | NOK | https://autobuild.buildroot.org/results/f108e241a6298babcdb8abdd0f6cbce2abc3883c | ORPH
   x86_64    |           fd-10.2.0            | NOK | https://autobuild.buildroot.org/results/8423777926d302214b550952cc798b1376cd7e9a |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/7f810f4c71579d7b9e4aaea16bfc1a3f7fa4ebe8 | ORPH
    m68k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/6e0be217a98ec43e87f485c30651782a7b148e2a | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
          host-binutils-2.43.1 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/4e8851b32fce680687f8bcd344a199c7a7462a2d | ORPH
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/7242a3da58d2e835cde8a6a69d1c8b731ea05506 |     


Gitlab CI results for 2025-10-04
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                     beagleboneai | https://gitlab.com/buildroot.org/buildroot/-/jobs/11570241744 |      
                    pine64_star64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11584263093 |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/11584270532 |      
                      roseapplepi | https://gitlab.com/buildroot.org/buildroot/-/jobs/11584272434 |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/11584275269 |      
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11598460280 |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11598462114 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
