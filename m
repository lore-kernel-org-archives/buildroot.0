Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F70DD262B0
	for <buildroot@archiver.kernel.org>; Wed, 21 Jan 2026 05:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08B7B60E73;
	Wed, 21 Jan 2026 05:59:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r_hvxn8JA9mc; Wed, 21 Jan 2026 05:59:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB6D560E74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768975196;
	bh=ynKY3qvmBQZiVEDav4oWUnqtimTJgZvE8z5Cn4gjsWI=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NBKc7on74VxforfuWzOC/DCcibu+2FImT8nWlWhz8LeYJvdgidOx905WuCS4dVaJb
	 obMsKWnFys/FUQSffxgBIstqj75G5xydzEXYkkaTGkuHi/PWwPIp7wvhCrDvx3pNCB
	 pNIUzPpuM9RUO/YPWFsZ5dfNSRGRI7Gd93FGTDHGytvUbCky9yWrOaUPiJYhGmP33Q
	 d5yPCMd96MEPMjIypb5q4P5BPil6C7wx4bQWkE2lWXIR9HinA5B95+ohcjrH0bavYx
	 4lz2fFmsDeh/LCAWZk2w7JqspVA4yFq6OklRXCQypRgfn+OUwJciHkduGTCdInqRrl
	 EeAUhMv9K49rQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB6D560E74;
	Wed, 21 Jan 2026 05:59:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BC25160
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 05:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7771460E74
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 05:59:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kk6fptJgtoUo for <buildroot@buildroot.org>;
 Wed, 21 Jan 2026 05:59:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0B83760E73
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B83760E73
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B83760E73
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 05:59:52 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-65815ec51d3so657442a12.2
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 21:59:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768975191; x=1769579991;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e3nVYAlcK6nEZzelZLfKOONYs+nfs04KUBzX7hdTbAs=;
 b=slv0ThPYVPdtH831j57SVuqMNxfFMEA2Vejae+z9jc7LX0qPjK6xOJ4cdIaWM4yOr7
 wGUH4X67hhUtOgBkNNzJ5fb6bc8lkMGPDSKqYeqeH/ryz70EKomr8Gl6L+6w6YatGKXS
 xJ9F1poUbb00ynmCPDyUE+/s4cDLICR7nFhtKwkPDOllioELY8/V8qkCtUVaDGvj/fje
 6rJICGu6i6/f/g5mquf9Olx6x1q3xO6bzfv6HiyFFMKajxXhtj4q1GFK7WEMHF6H4m2Q
 TDRcSQEDZINVqTcu8Bm1E/1M02Yej9vx3c2fRWFbdLzNyZEtbQ5Do2Owj9iFv5CLbf4g
 tJqg==
X-Gm-Message-State: AOJu0YyRK1zuEV6RfOCXvhc0RWyKh/mi2KLakdHNgIyJk50mLamfF60W
 UZDYmL6wIqqh7nsy857/WnM/yRtEqdHLiZD7ZNQULwuIKHfFG9iDzwp4nLJjew==
X-Gm-Gg: AZuq6aKk0RTxC4/Cx2dsdfyRDMv1aeLJ6V92OSWKPeTqNJi+DKll7SyP3mV9BHdCIOi
 9iQoBPyoLkXtkN+1wLvni3adw/xzGNyZnFipSSAnC9kiMHyRTJmAVRoA6twVM8HUzmi0b+9AlvN
 AF5a3ck8gbGgehNCZlX+LZ9guzHh2RaWxXxgPlNOoF/WKjS7krLc093cv+BQr35ZkjO3S49uok3
 sEdZlKht5woDDui9t/QHo7cpgCPjiPHTd4HsEU/d3ENIN4f4cdlhmq78+vN2lqh9iuFX71TQyMo
 GDdYpGqWwx5RpJvTOig91BS+QM39Dsq4cQuh4U4AbU5PyEFcGwATkRU4dhn1fn5av7bXc1IS72Y
 Xd/CNnTNXG/LLowOAGNFSbIPQXcA6fiI2Do/7vj8X0oPgkuoxtv9PLOEeaerlPHohopvxbHDZ9N
 SKViJPxqDbnv4k2e1iTQ==
X-Received: by 2002:a05:6000:4009:b0:430:f985:a7b2 with SMTP id
 ffacd0b85a97d-4356a060d4fmr23286232f8f.51.1768969147051; 
 Tue, 20 Jan 2026 20:19:07 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435924ae6f1sm6681070f8f.33.2026.01.20.20.19.06
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 20:19:06 -0800 (PST)
Message-ID: <697053ba.df0a0220.ffaf7.9e17@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 21 Jan 2026 04:19:06 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768975191; x=1769579991; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=e3nVYAlcK6nEZzelZLfKOONYs+nfs04KUBzX7hdTbAs=;
 b=IsfgcTsaFtLQYDRPbYS2HcRJBVu1l2dKTFd1goEBVV5zSL5V536D/XNHUV4zgj9avt
 KpLHqybe1Wy53RnlcXiNdSDlKR99M6TkKLnfM47b6dURdWCrhy8uva+naiIRfSTLo5X4
 Laalc3PoLl3e8z9X/tQFLy2vZjL6Mfqfph8iUOXrs8sRNNTs0g1fVCG2Qjhzc+PhY8YC
 SmlBMhRZF5JHD1NXUFgrPin9Y8wYHjV0IJwdHjL1Jxm/qZMPoxOKtkvxw3QZKT9NZDjF
 lXnYwMu+vl9TzKMIQDGxoACZOZIA7fpANCTWNrrseSZlczcJNK+YMS77W07go8Rh2Xdo
 TyPA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IsfgcTsa
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-01-20
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

Autobuild statistics for 2026-01-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  6  |  0  |  8  |
  2025.11.x  |  1  |  5  |  0  |  6  |
    master   | 31  | 53  |  1  | 85  |

Classification of failures by reason for master
-----------------------------------------------

                    mpir-3.0.0 | 4 
  gobject-introspection-1.84.0 | 3 
                   perl-5.42.0 | 3 
                 c-icap-0.5.10 | 2 
              host-rust-1.88.0 | 2 
                libressl-3.9.2 | 2 
        ltp-testsuite-20250930 | 2 
           alsa-utils-1.2.15.2 | 1 
                 apitrace-13.0 | 1 
             berkeleydb-5.3.28 | 1 
                busybox-1.37.0 | 1 
                 cdrkit-1.1.11 | 1 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.4 | 1 
                   dash-0.5.13 | 1 
                 dc3dd-7.2.641 | 1 
              dovecot-2.3.21.1 | 1 
             drbd-utils-9.33.0 | 1 
                        ffmpeg | 1 
           ghostscript-10.06.0 | 1 
               host-runc-1.3.0 | 1 
                   i2pd-2.58.0 | 1 
            igd2-for-linux-2.2 | 1 
                  iozone-3.508 | 1 
                 jasper-2.0.33 | 1 
kvmtool-7ad32e5514aca2b6d19... | 1 
                  libbpf-1.6.2 | 1 
              libcanberra-0.30 | 1 
                libdaemon-0.14 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
          linux-5.10.246-cip66 | 1 
            lua-sdl2-2.0.5-6.0 | 1 
                       mrp-1.2 | 1 
                openssh-10.2p1 | 1 
             parsec-tool-0.7.0 | 1 
                 procs-0.14.10 | 1 
            python-iwlib-1.7.0 | 1 
          sane-airscan-0.99.33 | 1 
           sane-backends-1.1.1 | 1 
                shapelib-1.6.2 | 1 
                tpm2-tss-4.1.3 | 1 
                       unknown | 1 
ustream-ssl-5a81c108d20e247... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
loongarch64  |      alsa-utils-1.2.15.2       | NOK | https://autobuild.buildroot.org/results/287df556983f07198b926c071e610613702986cf |     
microblazeel |         apitrace-13.0          | NOK | https://autobuild.buildroot.org/results/51851cdf4fd37d915d8ef44291437ac8a974b809 |     
    arm      |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/348ac03b19eec92b0648cb461ed2198777e84018 | ORPH
loongarch64  |         busybox-1.37.0         | NOK | https://autobuild.buildroot.org/results/1da3a157236804be3e07d5ac0c7057ca1e803ee9 | ORPH
loongarch64  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/05a2ea3d3687fdbe316fb814ca6728d491cb218f | ORPH
powerpc64le  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/ed1af150ec766c7345bc99dbbbaf2c4f4cadd0f7 | ORPH
    arc      |         cdrkit-1.1.11          | NOK | https://autobuild.buildroot.org/results/4f22b356a68706985ae0f1045b138680e3c68f16 |     
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/c360eccedb9c2d8e34d23c23f138aae06ca1fe45 | ORPH
   mipsel    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/549bc1e776c1e08b1ca47d2651c73783f0f84eb6 | ORPH
    i686     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/ef67a93cd261ce47aae6dba45b91b7af880bd1ed |     
 powerpc64   |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/2ffa2f985637f04955d8209de2342d2d7798368c | ORPH
    arc      |        dovecot-2.3.21.1        | NOK | https://autobuild.buildroot.org/results/f42f1b1f808711c0689d187a1e18d9381dbfc8a4 |     
microblazeel |       drbd-utils-9.33.0        | NOK | https://autobuild.buildroot.org/results/741606000c26bc994f243b0b865d26ff25592caa |     
powerpc64le  |             ffmpeg             | TIM | https://autobuild.buildroot.org/results/ad05db503209596f790c739c6a081f71de183f13 |     
   armeb     |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/d69914704df416278b1b7155d7c5abcd19780b5b |     
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/c8c385e5254da9af0fa3f49eb476549a678365cb | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/81b55e22733bbb37964191e20d8bb656998fe225 | ORPH
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/1578ee5327f66264f8befa9ac1d18fd324b62373 | ORPH
   mipsel    |        host-runc-1.3.0         | NOK | https://autobuild.buildroot.org/results/0bee73a4e4324e18ffd614efac9bba9f22b3061d |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/38ddc5d5566ea8035ce6aa9ce9ca39b5eda526dd |     
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/eaf1235136cce1ce367a19792b057a1effe64ed3 |     
  sparc64    |          i2pd-2.58.0           | NOK | https://autobuild.buildroot.org/results/7cc34f25da01d16d3dde220abeff16344211a66d |     
  riscv32    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/7e9bea501867295c7876f1fbf0e6a2ec9c698ce4 |     
    arc      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/60d84315e115a98aa0a14e3b0671b37c95a428ba |     
 powerpc64   |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/550d89ebcfc3a97e85ef476c5b73e3d9bcae396a |     
    arm      | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/fcccc55571caec131382c5757af957d9a3f77ea7 | ORPH
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/b998d9c1f0f5af6cfff6e96d2dee5aa695d05646 |     
microblazeel |        libcanberra-0.30        | NOK | https://autobuild.buildroot.org/results/75e61961e9240b2d9dd844edb4cf8be9c88c1ba8 |     
   mips64    |         libdaemon-0.14         | NOK | https://autobuild.buildroot.org/results/76400d6ce9edace4b9736eda570e550ee704090c | ORPH
  riscv32    | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/b3175c52d68c505dd5d59fb4ff001dd69746e800 | ORPH
   armeb     |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/13144329f7a3d45606fd9e4332d650bf5c52254d | ORPH
   armeb     |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/3e07dffd7d0c4b71646e911d891c6f7410f12677 | ORPH
powerpc64le  |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/0805864d83184417395369317a79f343de3355d4 | ORPH
microblazeel |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/37546732f19d6b61a87468a56112ba18b9980c89 |     
    arm      |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/739d0a2c978e1326c97f52b933c09df89c69c79c |     
microblazeel |       lua-sdl2-2.0.5-6.0       | NOK | https://autobuild.buildroot.org/results/74e5e5b4f3a7b7f941ee90fd84b97bba6d6a2c34 |     
    arm      |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/fcfb416702f219a83fea99cbc6829f5f43c2037f |     
   x86_64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/afc613b6591120dcfeef14c458e33db78f72c312 |     
   armeb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/65d29f3ef7f6941f38a970d82af6c04348a4605d |     
  mips64el   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/05818187ec624f1c7986063f5dd51d986dd1c526 |     
 powerpc64   |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/1ec743640317a45add8c790e54579dc1a08f537d |     
 microblaze  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/61fc388f7fd36874e1213ae4b2e6874ea62e26c3 | ORPH
   s390x     |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/3d680f6699068af7bb7234063e14ee76d0ff9e9a |     
   x86_64    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/0df730749884dc5c89c199387e4a1e6443ab1c87 |     
   x86_64    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/e2ef516e2e39af8dcace44f06ce6959376f3002a |     
  powerpc    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/1bb1d63f9587248eefcb4daa18d185dba5c9881c |     
   armeb     |         procs-0.14.10          | NOK | https://autobuild.buildroot.org/results/6efccb805792ab86d739c6e81234f7890896ad0f |     
powerpc64le  |       python-iwlib-1.7.0       | NOK | https://autobuild.buildroot.org/results/657a46e76bc57bec802235c7629ab1fbb3af8b7b |     
microblazeel |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/878a22df6917f57d07b8e97cc002088c9865144c |     
 microblaze  |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/9c5fd696dbf7177926c4d2ee8048b389b3c35416 |     
   mipsel    |         shapelib-1.6.2         | NOK | https://autobuild.buildroot.org/results/ed00b43f56f7fcc7b733059790c04bd15ef30325 |     
   armeb     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/6ca0f0982fb064b9fc749829e5fe0a54c24485d9 | ORPH
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/5614034dabd29a7776aef3c41be62f7dac4a6f3b |     
  aarch64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/13c32e8e729bd975e4e4fd07e608d8164ac6f66a | ORPH


Classification of failures by reason for 2025.11.x
--------------------------------------------------

     libphidget-2.1.9.20190409 | 2 
             berkeleydb-5.3.28 | 1 
                 c-icap-0.5.10 | 1 
                 rtptools-1.22 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/856f6d53063c9756a76b675e0d053da1360197f9 | ORPH
   s390x     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/4b6deedcbcd3013ac4babb1a24303078d55cd13d | ORPH
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/541dfc50fe305193178c8ebfafb6073e1de90b53 |     
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/a0a3b19c102aaa17f1e9ece018251f7a5f49eb57 |     
loongarch64  |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/b67b01e31ae2e87c5dcfd50510ea7777d8364667 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           host-libselinux-3.7 | 3 
                       unknown | 2 
                libselinux-3.7 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/9f2a81c0431daa45db3d4ed3339e6bcccf767d54 |     
    arc      |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/84069187855b257e04dc1db6f4fe5702492abc9a |     
    arm      |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/f708996720a007f5b8ddaf6470c001b3cd08b48e |     
   x86_64    |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/77b19644db5ad4d6febd89c92a943def636ae052 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/69e274b098a516a1af55c9554690e3747a844a16 |     
    sh4      |            unknown             | NOK | https://autobuild.buildroot.org/results/8188f03f1efa078681aaf1b1c4acf2162e1c2163 |     


Gitlab CI results for 2026-01-20
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...300c3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/12773505492 | ORPH 
     TestHostPythonXmodem | https://gitlab.com/buildroot.org/buildroot/-/jobs/12773485422 |      
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/12773484199 |      
         TestPythonPybind | https://gitlab.com/buildroot.org/buildroot/-/jobs/12773483017 |      
...otlinX8664v4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/12759408762 | ORPH 
     TestFirewalldSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/12759407767 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
