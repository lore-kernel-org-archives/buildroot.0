Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE749CAC5A7
	for <buildroot@archiver.kernel.org>; Tue, 23 Sep 2025 03:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48D11608D5;
	Tue, 23 Sep 2025 03:19:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 90U3D1dBpcTF; Tue, 23 Sep 2025 03:19:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E08C560A90
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E08C560A90;
	Tue, 23 Sep 2025 03:19:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E95E6E7
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 03:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFD7B4053D
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 03:19:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MH5tueBI8WPV for <buildroot@buildroot.org>;
 Tue, 23 Sep 2025 03:19:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2F7844013D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F7844013D
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F7844013D
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 03:19:23 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-46d25f99d5aso11350795e9.0
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 20:19:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758597561; x=1759202361;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Fjlf5fXePWOmSACeng7V/T68I78uu1ozjVtnI22O4Mc=;
 b=ORTPH8XY9kJYCFuVt5dpF2aC01HDb2zo1vCMsFnvszw95LeEzuQ9kpCFpsoOC27fEZ
 9ElLWRxMVCvDlaFO4++p0CoRzcB+w3twSCMkBCBKcqwcb03O34+8+QduYvg9kphIrI3d
 GXEYoWtFgMXQDPsk1u2O9bqiHEHJpyHrRPncF5/OryF/8iRX3qSUAffAofgsUJhEDvbP
 Ttm1y9P4VEFEDqPBlOiV2lO/DMsKvdJQ4hyqDbQAVdFBti5lLXsjoCRr5x8kSCiisKQ5
 qHi8fw0lzfFYavnk/+yihp1upZvkk/5e4pLLWMDQA3F39I5SUZNIMC3K1YrcY6s/yaW4
 JLVA==
X-Gm-Message-State: AOJu0YxyAZHZuehUfkH4BDN/VeEaumzBmhq8mSAaD8LWTViJx7TUMPNt
 ZQ9mFrWvQcieVnB7E/OFEPQ3NhP2TAZVfSRrf6cPh2QQKLVGTOMLqgYMlYH+QA==
X-Gm-Gg: ASbGnctOy62jZjR3klWGHcn6g3U1dZ3c1PdNDMRr7/aV1PnU5x/hppjFpKSLFX4LLg+
 uyzcd8VngXLHCgrvM35DaMfsKIbiUVMNx3YaicaNDcrTiieTJ1EPh5fASgdCWi9WxZcSiMOJx95
 oDWkWo4vmH37sfSb67BXR/H98yVNySJek1fv+DhfPBTLCjL3K9gEtRecelRNMoj2d54Y2HP8f6M
 sBEMAX9ozjEDCeJmm5TERDSHdc1ziGWGiKt2LtFHuRYNncltrYT+M4pgjJTQA/9DEN0j2BLSj3H
 VRP2uZ2rgmUuoUgk8t19neBVfd8RsjxODOKszl4wIaHAW3xlX3qbjm7RSi1COC2JRH6YWfdneoc
 GsSUg4/Jr5oFfPjrzGsNULoev1Q==
X-Google-Smtp-Source: AGHT+IG1YM91Ze9JU7ZZCVRGwMG/DhVIs1GtYGyfUDokRUOo5qsLH/3VO2NZj2j5M4nGwf9VtTALFg==
X-Received: by 2002:a05:6000:40dc:b0:401:ae97:a1ab with SMTP id
 ffacd0b85a97d-405cc2467c0mr731668f8f.10.1758597560892; 
 Mon, 22 Sep 2025 20:19:20 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee0fbd5d65sm21480289f8f.46.2025.09.22.20.19.20
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 20:19:20 -0700 (PDT)
Message-ID: <68d211b8.050a0220.1f0d07.8922@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 23 Sep 2025 03:19:20 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758597561; x=1759202361; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Fjlf5fXePWOmSACeng7V/T68I78uu1ozjVtnI22O4Mc=;
 b=U4iZJDcqSsaZH2i0b/CF78D4jd/lHpEZCK0fMPc5ZTeZF1kdl1Jn1nSZmzeMr+Teev
 0c2pq+TzR+lZ7VzWwAHz0dX2rB7zjRpN9iuNT76J4gJfAXf8ze/IZcyrysVrjsMSb8vG
 +sfP2zMO0+ECcZwTrtcalko87A8W0svlQfjNmmRvUPUGKIgY+vSpOukBvqXOeXyAu0au
 q+v1aqNAe1E2jPZ+petpOmqZRgJTUH18TS+k+g6zTEs0KrrL1J8rHe8QNCl+swqyIR2C
 y6GPpQHXOTVvqjhdWw9+dgfamduQsgX3QRpsdHuhIxTY/QFrs5kMNOtPRgTfvi5h4TB+
 c0nw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=U4iZJDcq
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-09-22
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

Autobuild statistics for 2025-09-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  7  |  3  |  0  | 10  |
  2025.05.x  |  2  |  2  |  0  |  4  |
  2025.08.x  |  2  |  6  |  0  |  8  |
    master   | 32  | 93  |  0  | 125 |

Classification of failures by reason for master
-----------------------------------------------

                openvpn-2.6.14 | 6 
libdbi-drivers-0bfae6c43134... | 5 
                  linux-6.16.7 | 4 
                    mpir-3.0.0 | 4 
                   perl-5.40.2 | 4 
                       unknown | 4 
                   cvs-1.12.13 | 3 
        vulkan-headers-1.4.317 | 3 
          aardvark-dns-v1.16.0 | 2 
                   foot-1.16.2 | 2 
  gobject-introspection-1.84.0 | 2 
                   gvfs-1.57.2 | 2 
                 host-gdb-15.2 | 2 
              host-rust-1.88.0 | 2 
                libcurl-8.16.0 | 2 
libftdi1-v1.5-62-g5e67403c4... | 2 
                 logsurfer-1.8 | 2 
                     pound-4.8 | 2 
                     ace-7.1.1 | 1 
amazon-ecr-credential-helpe... | 1 
android-tools-4.2.2+git2013... | 1 
           at-spi2-core-2.50.0 | 1 
             batman-adv-2024.4 | 1 
               bctoolbox-4.4.8 | 1 
                    brltty-6.6 | 1 
                  cairo-1.18.4 | 1 
                 dc3dd-7.2.641 | 1 
                  delve-1.22.1 | 1 
                    dust-1.2.3 | 1 
               ebtables-2.0.11 | 1 
        fmlib-lf-6.12.20-2.0.0 | 1 
           ghostscript-10.05.1 | 1 
                 gnuplot-6.0.3 | 1 
                 host-gdb-14.2 | 1 
    host-llvm-libunwind-20.1.8 | 1 
                libdnet-1.18.0 | 1 
           libfreeimage-3.18.0 | 1 
                 libiconv-1.15 | 1 
              libopenssl-3.5.2 | 1 
                  libsvg-0.1.4 | 1 
                libvips-8.10.6 | 1 
               linux-pam-1.6.1 | 1 
                lmbench-3.0-a9 | 1 
                 lockdev-1.0.3 | 1 
               lrzsz-0.12.21rc | 1 
              mariadb-10.11.11 | 1 
                      nbd-3.25 | 1 
                 netsnmp-5.9.4 | 1 
                     nvme-1.12 | 1 
odhcp6c-53f07e90b7f1da69771... | 1 
      passt-2025_06_11.0293c6f | 1 
python-remi-2022.7.27-37-g1... | 1 
                    quota-4.09 | 1 
        s6-linux-utils-2.6.2.1 | 1 
                 siproxd-0.8.3 | 1 
                     unzip-6.0 | 1 
             util-linux-2.41.1 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |      aardvark-dns-v1.16.0      | NOK | https://autobuild.buildroot.org/results/34e07216a00d9ddbb772859ea6f6ce3d85a9968b | ORPH
   s390x     |      aardvark-dns-v1.16.0      | NOK | https://autobuild.buildroot.org/results/07f6afb3973b6456397294dc165ac02fe58b8c45 | ORPH
 aarch64_be  |           ace-7.1.1            | NOK | https://autobuild.buildroot.org/results/747f0533104fae3dff4f171416b650c8643859e9 | ORPH
    arm      | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/3a846d4c953a6489a0fda92c1e677c0aed69392a | ORPH
   arceb     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/54c7a02a827be60cf8bdb8b61fd70154ad808852 |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/fd0e9149798096902aa39906cdb5d1bd609ef796 |     
  aarch64    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/36d9cc595d87025ed0039d5d38a9f295f597135f |     
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/ac7616ede2357788469d00a5c0af2a70d9ee101f | ORPH
microblazeel |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/affbfdee2c30d2a1779ed1c4338e0e5e03c4330f |     
   arceb     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/791f5af56690b3d6ce4770e094f02326759eeb57 |     
  mips64el   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/869a90fb35967974ccd3357051c9b9da0b0de51c | ORPH
loongarch64  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/d20c4e131f214199829c282500d16b556038b288 | ORPH
   x86_64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/fc100ab065f496ef6951bd4e2b592409f36290a5 | ORPH
    i686     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/5f1ac1a64dccf95e6651422edfe8dae40eb4f72c | ORPH
    i686     |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/f4136d0b6b7205e8d19c5ab32ffbba8013a02f7a |     
    i686     |           dust-1.2.3           | NOK | https://autobuild.buildroot.org/results/02898df50dc3b288237da12d9a8660aaaf8b5ad5 | ORPH
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/f3353e6c8cb8f8a8b8e76e09d053b0cfd8147fa5 |     
  aarch64    |     fmlib-lf-6.12.20-2.0.0     | NOK | https://autobuild.buildroot.org/results/91340463efe1cd559eb2ade0e59d7f20e5d567fa | ORPH
   s390x     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/36b550d3f10ca8f2c97621842722e40c40925eb5 |     
microblazeel |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/1524264aa261216a086cb671ef0252bb3f70ef84 |     
powerpc64le  |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/7bdaec682e840cab66c98482ba81533ff172f6a6 |     
loongarch64  |         gnuplot-6.0.3          | NOK | https://autobuild.buildroot.org/results/9e4a5f2196664411cb87c51b19a1123bd5ced852 |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/91f7c036ed0846a6af3347b40f2cc12c567a51f9 | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/4ac2af2da139cd94214950b99dda6db52ca7dd8a | ORPH
  mips64el   |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/9f63f4b2963428aa408e19edd24c3e809b00c35a | ORPH
    mips     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/620fe7b0765f5e21f5770795b23158d5ba01bd11 | ORPH
   s390x     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/d53e6eb7964789f72fd5cf4d7790b805b52d4cbf | ORPH
   mipsel    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/243b454e8e21057b78ccda3a86c67b3f4f01f60f | ORPH
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/7011f3616ec8ea6345c275a7aa70fd99eeddf940 | ORPH
   armeb     |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/ec0c39f3a2dd7fac982dbfda75b8a9b363ee3866 |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/36ea3f781049192ac8e5038d84cc7790c1a47765 |     
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/30dcd9d4454293c42dca87c8906bdb480678b205 |     
   x86_64    |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/cff1d57c27eb27a0407c1700af5c6e01e5790f53 |     
loongarch64  |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/56d23009b2edf4c866eed794673b278f578d3253 |     
   x86_64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/39570a6022f7b3b237d3cccb28d0ef5657a01721 |     
   x86_64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/ad0246c33a3be976bcecced3093707e6e7d914ad |     
    arc      | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/61b90cfbdc270cf49f08b8091300b21a0c491cb3 |     
microblazeel | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/2ce487a28790caaa370bb00c0b966eef4c1d4241 |     
    arc      | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/3b14a9f1fd2626cb4a459a4ef15b780df26f8122 |     
   mips64    |         libdnet-1.18.0         | NOK | https://autobuild.buildroot.org/results/b99cac6dda2ef3e5d792053bdb4bf7fe45e69b0c | ORPH
loongarch64  |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/9f52cefac966580d714338970c01f19925ac921f |     
   x86_64    | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/8b9c5faae778c98eb97bf520a7791f0fc50a98fa |     
    arc      | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/8b96e446743e83e4fc4ad0fc5f82fdf914be51bd |     
 aarch64_be  |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/c584c66b7e846d1177c59063265aec62c814a8e0 | ORPH
   arceb     |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/76eb54ce4a2dc9761d73060092f8076c08b3da0c | ORPH
  mips64el   |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/377df9b0c7134a26ff5660cc3fabaa54c74ff6a9 |     
    i686     |         libvips-8.10.6         | NOK | https://autobuild.buildroot.org/results/b8c83ded843779d9ef97672a90fd8ccd58b243ca |     
   mips64    |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/df42b5f4c91702ba5a262569f364ce1c53ba80ba | ORPH
powerpc64le  |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/b217675cccef465f28d7b20db016b1d5c732f232 | ORPH
powerpc64le  |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/cba4a2542b64e0d98050d982fef2f3d68647ba76 | ORPH
  riscv64    |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/223beb59fa2d5c58f99def7ee18b92c124de90b7 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/b76c6eaaf04cddc73e3b78b6ff5dc84be1fd8e91 | ORPH
    m68k     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/9714e77adccd11432bc546a818ce90e8763f9784 | ORPH
   s390x     |         lockdev-1.0.3          | NOK | https://autobuild.buildroot.org/results/3211c479327de60368f9cc932036771897391456 | ORPH
    or1k     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/2af9e64da9fa7846fdbe57b13f167596cf37de5b |     
  mips64el   |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/2d2a9ff6fb91e375bf8fd492694ad6bad7c940c1 |     
  aarch64    |        lrzsz-0.12.21rc         | NOK | https://autobuild.buildroot.org/results/e48bc38a676122ca6dc4d43e05d9de975c3b86f2 | ORPH
   sparc     |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/0a95da8cb89792c92dc692d91514bb51a5097eb1 | ORPH
   mips64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/6f71b6c3cd39e710e64d6cd0c46210803275ae93 |     
    arm      |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/c0e1b54827fd255930a5469b42e0668d97e2567a |     
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/419aad33ec3f7eb52de03a9fe1a6abdcf34771b2 |     
   mipsel    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/ae74821fb0798a0653d05b3f1017da2308423664 |     
powerpc64le  |            nbd-3.25            | NOK | https://autobuild.buildroot.org/results/17600cdbb991485efbe89b50c957263b11edb88b | ORPH
   s390x     |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/b2004c8ad3cada325df51a1c6e8c3e7f58a59c44 | ORPH
    arm      |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/1c3d0085be5329a8b7caac0cfcbd1fd8a32ba077 | ORPH
   sparc     | odhcp6c-53f07e90b7f1da69771... | NOK | https://autobuild.buildroot.org/results/115e52b57c323502c5bf51bef09644866311e259 |     
  mips64el   |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/52b36eb1089eb05e1eeacdb526f3637a317c1bdd |     
   x86_64    |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/208f7ec4ff77d0be348cc5241f455cd8bb642cb7 |     
 powerpc64   |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/7635fae386988849a80d007425fb45927ec6a822 |     
microblazeel |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/1537242f450b9eb3bd0dce27e7eb795072841599 |     
   mips64    |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/fabe656ce625d2e68089310e299c6fb4310ffda9 |     
    arc      |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/0da1b22bd9052a5190d1fce07d06009c37a8f23f |     
   arceb     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/d36679279b11dec5a16e373b2cde2bace82b4c49 | ORPH
    m68k     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/1d3b375a39005ff83ac5de896638929f26cdbee3 |     
    m68k     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/91e63d10a9565b045746cbd109fa1bcd70024cf8 |     
powerpc64le  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/3e4a16e90646812dc9689b32b415e1eea2dc1c6a |     
    i686     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/377a0b2d925ada67512693280f42f44ee00d85e6 |     
   mipsel    |           pound-4.8            | NOK | https://autobuild.buildroot.org/results/8c37acf65c3e3b4fed783bf37b9bd017560afa29 | ORPH
powerpc64le  |           pound-4.8            | NOK | https://autobuild.buildroot.org/results/c79aa3ef687ecf1955380424896c75d4558b1251 | ORPH
  mips64el   | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/03dc63f1c01984eab2f615016ee6ad688e1b8c7b |     
    or1k     |           quota-4.09           | NOK | https://autobuild.buildroot.org/results/0821c9e6eab74016f650acca6ea2c8bde325bc73 |     
   arceb     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/580d35d40c32747760123fee056c8fe9df179482 |     
   arceb     |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/cf41693154453e536861df3487ec8a655c4ddf89 |     
   sh4eb     |            unknown             | NOK | https://autobuild.buildroot.org/results/da8131395ca0ddf3d800a595d962bc2282d0d8b9 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/d3d0825fbea415e57f64b417ef682a7c21497510 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/c5b3478ae5a80717e245911526695996d7bc2d43 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/dddff3db0eb7799abd384dd1978b71cf946344b8 |     
 powerpc64   |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/6b2e6a3c29f16e6a53ba859c1a88378571e1d8d5 |     
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/5382e28fbb4c0775e744c5a03257564b6b46c31d | ORPH
   sh4eb     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/e597ead0965b4346914e1e658c033df72b887296 | ORPH
   s390x     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/6c58ceaa2235889f058bf33634b1092cf7e62f70 | ORPH
    or1k     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/670d0c9d7330ab51e81b2f51f3fbc82060e5ba1c | ORPH
   xtensa    |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/534690b2ab78f308f9cbfe259e7a7500e063382a |     


Classification of failures by reason for 2025.08.x
--------------------------------------------------

                   cvs-1.12.13 | 1 
fs/axfs/axfs.mk:32: /home/b... | 1 
                    mpir-3.0.0 | 1 
                     unzip-6.0 | 1 
             util-linux-2.41.1 | 1 
        vulkan-headers-1.4.317 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/ac12e55049784308e7d226595bc1d203e48e4342 | ORPH
 microblaze  | fs/axfs/axfs.mk:32: /home/b... | NOK | https://autobuild.buildroot.org/results/a4be2238f9921845b8ce4ef4c6de08702c8890ed |     
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/b32326bf37d74974df2c9fb123d86c29617e21c2 |     
  sparc64    |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/c4550848ceeb0b17c8c9737b7e8ee90a1065e89d |     
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/d74ab0ec14591caa3c481a82244fe8fa3bc10258 | ORPH
   mipsel    |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/f9e034596c21ae00f44fd6372d7b28ebd596afa8 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                libcurl-8.16.0 | 1 
                 linux-6.12.47 | 1 
               pulseaudio-17.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/7a12f40957a4d9ba428cae2f9062734eb661122a |     
   mips64    |         linux-6.12.47          | NOK | https://autobuild.buildroot.org/results/055118cc1371922907455b200c97ec554f301b8c | ORPH
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/1f1f971af6444f4c0fc7aba5713efbf2071a9829 | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

           at-spi2-core-2.50.0 | 1 
                  linuxptp-4.4 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/82f4c63f723e933be081817345915fcaa39bd775 |     
  riscv32    |          linuxptp-4.4          | NOK | https://autobuild.buildroot.org/results/b6ca1936b87ba1e8d1fbe5264e5ca6a60939d142 |     


Gitlab CI results for 2025-09-22
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/11432703154 |      
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/11432702996 |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
