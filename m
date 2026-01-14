Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 300BED31A11
	for <buildroot@archiver.kernel.org>; Wed, 14 Jan 2026 04:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9026842789;
	Wed, 14 Jan 2026 04:19:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xw6Oa_mUpiau; Wed, 14 Jan 2026 04:19:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34A1A427AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768364393;
	bh=P0NWYqI7qic2zElxbprvGRYVIHpde4UKZREFqQp2zlc=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Bq5Wu3mJVG77hi6Jmfr7h9egwxQAKt1goQEAWUG0iFDQJhp26rZyxK6CJSgJFuCQP
	 YCBSCzoK0x/E+2SX+6FyNyJFybd8Uki33SeIFZMiNwlE8Z0gsg1xYylAWFEd8OuQF5
	 eXqYB8IB6La9tHldOo2oamqnUDvwDDQyBh31ffZZEyg02HqTMpb0nAb6jzMxj5MvPR
	 GMdSXlr0us49Rd3nHzdvdGmAKRD6xnKNHDFdSdAIZKZdhm+OFsrQgEO7Ww5mLjMP+K
	 hYp1mbwAR5r2GMTMQCM5boNy6zw2ubZNbkSbN9EQ0VbK47PryRG+dnHvcvodyBoPKg
	 p/6xt22+LLRDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34A1A427AA;
	Wed, 14 Jan 2026 04:19:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BBC5A231
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 04:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0B2361CAE
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 04:19:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f-1LuCTV-qhW for <buildroot@buildroot.org>;
 Wed, 14 Jan 2026 04:19:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EA37761CAD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA37761CAD
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA37761CAD
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 04:19:48 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-47ee3a63300so3082085e9.2
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:19:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768364387; x=1768969187;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qelNLVvp2xaDFKgaD7/J8hk1DvEU8aFOcBuKV67PLxc=;
 b=H1S6cG95IUxGr6HgM5OhxosemfW1aru9RefQT7QkL+Ti9IJ/QPhWeaTQwM+yoGiIeF
 U3kwa4PmPLgj5oiYFKpArGMPNGPfwaZjgIHuyV7bu0x6uIdj9aEXGdVTE07pIJR6GjKH
 8l3zVA6DZctZiTf9xKTi1ZVEd0J1QGSXERhvZfZP+lyyZF9PI+7tJCo/kjzPvDfccHQx
 P1wd5ey7ChkFprY/DUzJjADifI+H1jzqMf+Y06y1b5bq4evjtmjANaghR48BglwQm//s
 DqewPs8M0uK18qPimm0i61i8F1N+GT+Rhwsun3GxGl0KA+tPooWfYyM1Lo1ni0uwklEO
 hSnA==
X-Gm-Message-State: AOJu0YzO8UThIJFzXuReKtJ1lpOgG5oJ4tu0Qb/qJoThqRhHpj4LZK9r
 5rlU3R/AntgOsQ96dlqZZqB5apBZ501ECE3zFOBdRgcsW3vYDAB/8+HIw7pVzQ==
X-Gm-Gg: AY/fxX74A6pad9HZOg+VI1KAxD3c3U2gFMo6bhtWu1lJBZy/CP9EZq0vrXYGGgKQlUp
 KTIPAO10w5j3hN115rTVdVhK+rbq4WkJo+B1rxmXqjNgMacNQcah1a7qHHBTJXvFwQ+kKAzNAKt
 thga+ySFFXYEY8YKm79/7+TEnxgiWFoD64XcPaJ0bCYAmukcFTrbukX7ScIXsvErK4+8NR+WZt8
 W3UwN81YFn5GrBGEkY53SATdGZFRgt/NMcxJiRdPLWxhpJWkDDeNKzXoT9mTZa+0valOh+kavhf
 SgF4A7Evt46FoaKjmbrWukeVUYz3dQvpohlSIJKRcUMBDy5q69TB77/7MtH3JDAGLZ6VqAj+YxJ
 bDsu/G8HAJoyogRsi3smzz9bH1DRkh/rcLw7RZGKjEw/0OPp3u4O7vYuEOnSr2EAur585hSV/h/
 lWKR6ob9DtXlViy04sOw==
X-Received: by 2002:a05:600c:4e11:b0:477:9fcf:3fe3 with SMTP id
 5b1f17b1804b1-47ee306aef4mr18813715e9.0.1768364386576; 
 Tue, 13 Jan 2026 20:19:46 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ee55d4279sm7674065e9.8.2026.01.13.20.19.46
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 20:19:46 -0800 (PST)
Message-ID: <69671962.7b0a0220.148407.8ca1@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 14 Jan 2026 04:19:46 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768364387; x=1768969187; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=qelNLVvp2xaDFKgaD7/J8hk1DvEU8aFOcBuKV67PLxc=;
 b=Sy9/dah8pZP7RiKIcFjNewbgtwMidpZJ8Lo8SUQGpEMZCSTMuRrzOBSC9ez5nH8ftN
 LIC7RcsPFwl1pjpoBngiH6qABkhdZ6RVEm/hkx2D8QmwzXzlCvwn/oAJk3DfuS+wM6Q0
 C5WxjBmwbyccm5/M8YQqPi1LGKUKiV0gxIUPcmfU6Dh6S1g1x+PyL8ZlDCwamwYHdWn7
 wQXX4iIl2H+YK+dV+D9S4djMXFa9MoZhZN9ClHX3VVZ2yg6upItX1FBCadiQHkqHIp6j
 eFW9y0XGXF6lC/HuxZZh1AUX/kbNAzYuQ7T57GgyoaWN2aMXfPIfCRqrwLCgk8htVmfa
 qRBQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Sy9/dah8
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-01-13
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

Autobuild statistics for 2026-01-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 17  | 18  |  0  | 35  |
  2025.11.x  |  7  |  6  |  0  | 13  |
    master   | 65  | 71  |  0  | 136 |

Classification of failures by reason for master
-----------------------------------------------

                   dash-0.5.13 | 3 
glibc-2.42-3-gbc13db7393773... | 3 
  gobject-introspection-1.84.0 | 3 
                 jasper-2.0.33 | 3 
                    mpir-3.0.0 | 3 
                openobex-1.7.2 | 3 
                   perl-5.42.0 | 3 
                   cvs-1.12.13 | 2 
                    fmt-12.1.0 | 2 
                  iozone-3.508 | 2 
              libopenssl-3.6.0 | 2 
        ltp-testsuite-20250930 | 2 
                       unknown | 2 
                 aichat-0.30.0 | 1 
               asterisk-22.5.2 | 1 
           at-spi2-core-2.58.2 | 1 
                  bitcoin-30.0 | 1 
                  brotli-1.2.0 | 1 
                 c-icap-0.5.10 | 1 
cegui-e7a03afc70c6182a091ff... | 1 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.4 | 1 
                 dc3dd-7.2.641 | 1 
  distribution-registry-v3.0.0 | 1 
                    dpdk-25.11 | 1 
              e2fsprogs-1.47.3 | 1 
              fftw-quad-3.3.10 | 1 
gcnano-binaries-7c181cacf89... | 1 
            gdk-pixbuf-2.42.12 | 1 
               graphene-1.10.8 | 1 
    host-mender-artifact-4.2.0 | 1 
            igd2-for-linux-2.2 | 1 
kvmtool-7ad32e5514aca2b6d19... | 1 
                 libbsd-0.12.2 | 1 
              libcamera-v0.6.0 | 1 
     libphidget-2.1.9.20190409 | 1 
                libressl-3.9.2 | 1 
                  linux-6.18.5 | 1 
               linux-pam-1.6.1 | 1 
                 lockdev-1.0.3 | 1 
                memtest86-7.20 | 1 
                       mrp-1.2 | 1 
                netdata-1.37.1 | 1 
                openswan-3.0.0 | 1 
             parsec-tool-0.7.0 | 1 
                  rp-pppoe-4.0 | 1 
              shellinabox-2.20 | 1 
               syslog-ng-4.8.3 | 1 
                systemd-257.10 | 1 
toolchain-external-bootlin-... | 1 
uhttpd-15346de8d3ba42200249... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         aichat-0.30.0          | NOK | https://autobuild.buildroot.org/results/526bc09baf648ffee04354e955d1457441d27ae4 |     
  aarch64    |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/b0c5512036a0c16a21443a9048c8b32b3d016ac8 |     
    or1k     |      at-spi2-core-2.58.2       | NOK | https://autobuild.buildroot.org/results/ddea25d2cf986bb03d15af12e5a8505e86da1d34 |     
microblazeel |          bitcoin-30.0          | NOK | https://autobuild.buildroot.org/results/84acd0cff07f563aa9179b2c537e6df505fade27 |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/66d852f17ddfbb831fdc0c28b41e9ecdca7e125b |     
powerpc64le  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/d34d3e9f76bedca8c61093f453ccd9b9932ee848 | ORPH
 microblaze  | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/ab7049aab85648730b332d3c7583ad0f2a79bfa1 | ORPH
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/3ee8d65e8ccc98542109565c3964b780a3a4af2a | ORPH
   s390x     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/cc6543fba4a3e63d6fe3224589f3ce34b29c49da | ORPH
    i586     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b8d0253d1cd0a61083a2704672be93770faa002b | ORPH
    m68k     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/305061412cf5fa0e940ec190943d5597b7ee433a | ORPH
microblazeel |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/08f2b52f586ccb0d309790993e10db2af60be1ba |     
    arc      |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/a29a7142981eb5ed498e315c072ce5dd18288685 |     
   sparc     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/ec61fc653a09c96d7da1a90621f7f8f90168c167 |     
  aarch64    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/f605a2f862c3cde980eb46370983e2165cfac386 | ORPH
   s390x     |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/c7502443b828b65029395288e378a2594d5ad706 | ORPH
   x86_64    |           dpdk-25.11           | NOK | https://autobuild.buildroot.org/results/43fabd0de87332c8e494f02e2e8c6a672eee09f9 |     
 aarch64_be  |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/758f80561d47c9504160ca984116cbc446b280fb | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/ef19ce77e48d141aefc6c08bca8e82598d94a6b5 | ORPH
    m68k     |           fmt-12.1.0           | NOK | https://autobuild.buildroot.org/results/d52f78b2c46c8260653d2a71932f557a4e3ea1ac |     
    m68k     |           fmt-12.1.0           | NOK | https://autobuild.buildroot.org/results/fbb8dce6ec2d9cdcf06acf968f9ee39024e81154 |     
  aarch64    | gcnano-binaries-7c181cacf89... | NOK | https://autobuild.buildroot.org/results/8d0514d88673f260bc271bfa3a9dd922962ab315 |     
   mips64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/6a875f1f274a8c4c5e16cf3b8d91169b504cac91 | ORPH
    mips     | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/4cebe23eb67aea5efb4a6709b32856d61a57e69a |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/9f41a570ed4db72415cb06ae9463647b7b987e2c |     
    mips     | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/96e8f4f86d01730f4151f3b2d33595a8cb781c78 |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/a8cff7d9fe1808a525b543e298ef02d3df30f71c | ORPH
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/2f0d2c6695600bac45bd10ccd6541b1a92927a48 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/eb57759aa510fd96019ffe4b7d63aeb10d4eb072 | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/c33bae567b5246d44e7d55048ebba1ccda44a979 | ORPH
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/a7cd877c6128213db5e51e34c4cdf46018c5d90f |     
    arc      |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/a4e8236072602f92fb1d3a0ed22ea2ad15ffa4b0 |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/8804bb5fd2a1f69f25b2019d87a47f717bf45705 |     
 aarch64_be  |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/786fb60d52a5d74f68d291e1f3005f3f9c5c0d48 |     
microblazeel |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/4ad2132c4e7dcb79fd5a21a248689c9647978252 |     
 aarch64_be  |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/12252307e6e549a4e1e5bbfe9ab6c958c44d6f3b |     
   sparc     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/889601a8cb8281e79b9862fd8ed053d10c041821 |     
   armeb     | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/d34be83a6c272d0eed6d1f7d7cd5cd7f72a52fb1 | ORPH
    mips     |         libbsd-0.12.2          | NOK | https://autobuild.buildroot.org/results/59de3fa75e76693878fd3702bd7d6a927e75a065 | ORPH
  sparc64    |        libcamera-v0.6.0        | NOK | https://autobuild.buildroot.org/results/f750879f5816883a67815aebfc319f849741d036 |     
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/516eba3739f31561ec328f74ca4e7ff556bf86d6 | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/c420262ce40b9864d748f9284633cc3c0fa5f926 | ORPH
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/0201c051a5476318318bdbc3170f5150df3456a3 |     
   armeb     |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/dd9cb288b76fac0714b4b73ea70b5d8d95eac1ce | ORPH
  powerpc    |          linux-6.18.5          | NOK | https://autobuild.buildroot.org/results/c7c7f05a92608479b1501ecf0bf60c10b5ca152e | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/a3041dc502002a8af543fd226a474da8d087ed13 | ORPH
   armeb     |         lockdev-1.0.3          | NOK | https://autobuild.buildroot.org/results/73a80717c61e3957852e12150be5113fb4e94ba2 | ORPH
   armeb     |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/9523dfabbb4699e14ac815fdce4a30ae0b0a8396 |     
microblazeel |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/51965973e2f4ddef4667bec052a96791a62ea993 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/7e89f2e1e65e4549bff56494a01fc1fb4370360e |     
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/d757436023bd88e2791b24d6c2d15ef2a87f6e71 |     
    i686     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/896364a7464095e77677736477a45f31d264def2 |     
   mipsel    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/accde6d0213aacb62bdaa1b2be94856b2051a2c6 |     
  aarch64    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/8761980ad38823a460a8b0fd1468bafba56dfc5e |     
    or1k     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/e1ebbf4a3fa8d7509c5f9b9a4d070c06a73a9995 |     
powerpc64le  |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/727f948d807c002072b4bcaacd33422d3f6ad7f4 | ORPH
powerpc64le  |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/27bb166c1c919475ebcea5f2d04ba8d975459938 | ORPH
   xtensa    |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/ebd5b69b145b30bb91a44fef5c73145e38076e4e | ORPH
    or1k     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/6fe2af3bc4e7f815fa068e25d020e9302d094d98 | ORPH
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/fa2d31e03232dca1bd82e17b8e903d9a8395703f |     
    arc      |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/53ae6ad530ab65ab93beac2f4d9c71827f68fc88 |     
  powerpc    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/d2151a08244adb3b52dba17d42d95fe9948d7401 |     
   mipsel    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/5dfda138ad5453784ac990999d695501994b4090 |     
  mips64el   |          rp-pppoe-4.0          | NOK | https://autobuild.buildroot.org/results/5fff21a4150a5f668d43830591e21b660299ed9d | ORPH
 aarch64_be  |        shellinabox-2.20        | NOK | https://autobuild.buildroot.org/results/09b1fb4f90b133db2d9e697cb0fc44453457dbb7 |     
    i686     |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/c507483d08ba358f441844d9f81eae6d1b42421f |     
   sh4eb     |         systemd-257.10         | NOK | https://autobuild.buildroot.org/results/a0a010f796a190c0ddae903676ef36dc6c9e90c0 |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/10bf208a9da73816c93d7d5d30e9188788e39d71 | ORPH
   s390x     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/fc9927fc0b9bb8c9dff101d7e80dfa9b33948772 | ORPH
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/cd44e2afae266c5cb610e7f0add9448839ffdf73 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/6f9f94e7bfbcae80f9de52a9a040676b91285b92 |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                   cvs-1.12.13 | 1 
                 dc3dd-7.2.641 | 1 
              host-rust-1.88.0 | 1 
                netdata-1.37.1 | 1 
               snort3-3.1.40.0 | 1 
uclibc-ng-test-132c6134d691... | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/a7816ec7f19cace19200ab6a4e22d1e7b84f65f7 | ORPH
  riscv64    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/2dca00684e79aa07baae59b1789451a4959e79be | ORPH
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/b8bd6f8720aca33868b865273b90dcc926018936 |     
microblazeel |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/a88c8543a5a7b00c44c4cd61643a051313eb77e8 |     
  aarch64    |        snort3-3.1.40.0         | NOK | https://autobuild.buildroot.org/results/f780a8ea0b5103925a440d2c600a5d6453db1dfc |     
  powerpc    | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/528879fbc329a1bab44dbc282ea63b5ef00a44dd |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           host-libselinux-3.7 | 4 
                libselinux-3.7 | 2 
              xmlstarlet-1.6.1 | 2 
               asterisk-22.5.2 | 1 
                    brltty-6.6 | 1 
                 cdrkit-1.1.11 | 1 
              gcc-final-13.4.0 | 1 
            host-libtool-2.4.6 | 1 
                 linux-6.12.65 | 1 
        ltp-testsuite-20250130 | 1 
                    mpir-3.0.0 | 1 
                 openssh-9.9p2 | 1 
          sphinxbase-5prealpha | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/97828e8f09b1713a9908cd5a585233dee13c092d |     
 microblaze  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/5638bcf4ce8d858ebfcec75d8df2fd1d41cee6fb |     
    arc      |         cdrkit-1.1.11          | NOK | https://autobuild.buildroot.org/results/4fb0b174d90e5c2671aa519251de0972726e1db3 |     
  powerpc    |        gcc-final-13.4.0        | NOK | https://autobuild.buildroot.org/results/4e181a0229a2a915d64cad296ca46e7b72160fad |     
   arceb     |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/90be6d17f84f0ce57e612347157e3a89b0b2cca8 |     
   x86_64    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/0fa8e0b0f6d9833562eaa43858eca1805f55be0b |     
   sparc     |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/2d5a7b10923989cee94787a6b1a2c540dc01fed3 |     
microblazeel |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/a8440d968dd60e481a744a8187233f30e274f75b |     
   x86_64    |       host-libtool-2.4.6       | NOK | https://autobuild.buildroot.org/results/08a2ffac68fb4d6019766d19ef47d9dcaf164704 | ORPH
  sparc64    |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/28165ffdc6f39e9a509b0da040a6255d90440ea9 |     
    m68k     |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/28e56b1024ac764a307816acdb43716b0831bb71 |     
    m68k     |         linux-6.12.65          | NOK | https://autobuild.buildroot.org/results/78eac56f60d49caf5c692a7075de271639996cb4 | ORPH
   mipsel    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/a768ac5e3d8ad06d1f30fea20025edc516c18a22 |     
   x86_64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/24224001e58a2e468503ca3ea5bd73ff173400ef |     
   mips64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/e37f16057df85009e341b6f7c5ba8abbb32cba6b | ORPH
    sh4a     |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/c8e56c3c1b8e2ace1a3d0603f85629df00bd4d06 |     
    arc      |        xmlstarlet-1.6.1        | NOK | https://autobuild.buildroot.org/results/e9d1f5bbd8f6aa5e3f2382c876d31dd3b3e1f293 | ORPH
   x86_64    |        xmlstarlet-1.6.1        | NOK | https://autobuild.buildroot.org/results/f09f97fece9e2c7b362aae7870b88bc8bdfe449d | ORPH


Gitlab CI results for 2026-01-13
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/12689588384 |      
      TestPythonPy3Qrcode | https://gitlab.com/buildroot.org/buildroot/-/jobs/12689587698 | ORPH 
         TestPythonPybind | https://gitlab.com/buildroot.org/buildroot/-/jobs/12689586699 |      
                 TestPppd | https://gitlab.com/buildroot.org/buildroot/-/jobs/12689579921 |      
  TestPodmanSlirpNftables | https://gitlab.com/buildroot.org/buildroot/-/jobs/12675186936 | ORPH 
       TestPodmanIptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/12675186932 | ORPH 
     TestFirewalldSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/12675186497 | ORPH 
           TestDosFsTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/12675186459 |      
    TestDockerComposeRunc | https://gitlab.com/buildroot.org/buildroot/-/jobs/12675186452 |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
