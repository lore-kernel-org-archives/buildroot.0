Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C4FF55454
	for <buildroot@archiver.kernel.org>; Wed, 25 Feb 2026 04:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C610608AC;
	Wed, 25 Feb 2026 04:28:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SEWhVkH0JNjZ; Wed, 25 Feb 2026 04:28:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4393360DF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771993721;
	bh=OztKe4MCRYZUYRKX8M/FH9Y+UnJj4t9ySxmgThJBOyM=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rI5kqRd00lYG4JmuMObVa1BDlHE3UG+QPWi0OYpFgTNEDf13If4fPhzUR3mq72u+1
	 aKEiDvNFzFQu9/9sZzlL83/zdUROWhXIGfkj/bGi3jb7ES046JAWvD9GTxTkQtb21u
	 eJY4GLzVsN++SzQMIe3pwtssX8WZLqJ89llYvSrkRo2RUsTpZEKepMVnF3WlPnRv7z
	 T3F2uswMm1dElysWlRcGHTmXRnCVafFSSswrIn5WBC117g8z17SNrsefNRxdOGcoo4
	 f+Ef4achU/WTZcuJMRqtoBaRByUT+f2ojxG3NgjiRJGUGB8XpARwS8TrBgnvKKDsBE
	 j1onbCllpEA1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4393360DF5;
	Wed, 25 Feb 2026 04:28:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 131941B8
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 04:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECC8560DF5
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 04:28:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0uczmoyBJrrx for <buildroot@buildroot.org>;
 Wed, 25 Feb 2026 04:28:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 712D3608AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 712D3608AC
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 712D3608AC
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 04:28:38 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-48374014a77so64736355e9.3
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 20:28:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771993716; x=1772598516;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kig90nUMmOGTduUWL2Vl+V3CXTy+XCu9DlRje9x24vY=;
 b=TpM9duaeaNJVq0/tm3c8rfMuiRq5eSzuAGyHVy9GnSKK1eTHEXOtakfM3NfaWRB4Ct
 iam8SzetOPkHC5YERq7fdmaNhBxNpUUmIBXCUDyxDSXRgGbBIaf5BaST/rOruNzEl3Ak
 /5QLahtvqmafzV6Xl64x1zON45uPuYXM/NyBVmkg1hhg73D1hwTyTcxDm+CdIud65ydG
 k/BYXFV9+Df4jZpLWXzLbn7Eb9JBnFnLCAZE4gxc+J9rwFbjlp0uhyc3Q6iO2v/XHXql
 nQSG79dkVuToDQ1/vs9p3uo2HUurVY86tmN8G4uWJHka5jCWgjGUGT7tCdHV9mbXzPfl
 chNw==
X-Gm-Message-State: AOJu0YyrRWVmCOGFyYYvg5+k4kL+ZyinCUVIKUb6SRuOsjrSIkLmY6FA
 pSkKp824j7Zfk82MoKmS3+zhzCFb7i8LuAwQOrj4JQzSDiGblhwM7G+1QAgjZAUi
X-Gm-Gg: ATEYQzxRlPm8W4AoHBnAIjYl+D+uUGFUIqrjZZvyuLkXM2wG7hIWgsSvyOaDUW6Npga
 3e/Izuf5YQGk1uKX49ImqY8zEBw0Av+Go2KtszaxD5ikSXITe90Qz8mz/IwWydWrh2EiWiZeSEZ
 N4M7zQZVPCFocnnwly2L/oOKsuXJZVZ4dAKgmeVAYepkI69CtKWggraIoKLd9nucvsGG/JjfZgh
 KnXZ1D2tWu7HvICmwJQZaaqQ7rEUNsZOyF8/3B9IzSJa11l+jVJLW3/aG4nNK/xY2rnwUrCKsEM
 Ay5fUfxiqtfqZY6kaOANpyxvc4heOMDOPVk+RwqE9gyhYyuHa+JZqIXaDBCX2xBilZjTP/JsYmh
 2FO4EV+Oqr6XqeyKwQrnS/obcw/JT85DjNTtfXjEJEpK6/fH/9Cb1wfCSnxz2Z7Q5pzkfVpkyyq
 a+sjMZCTNaKFz1TVUL4FPHRFseDiFIzw==
X-Received: by 2002:a05:600c:6305:b0:483:8062:b43 with SMTP id
 5b1f17b1804b1-483a95e1eb4mr232166415e9.19.1771993716100; 
 Tue, 24 Feb 2026 20:28:36 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd75df9fsm43998875e9.13.2026.02.24.20.28.35
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Feb 2026 20:28:35 -0800 (PST)
Message-ID: <699e7a73.050a0220.1d595a.3d37@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 25 Feb 2026 04:28:35 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771993716; x=1772598516; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=kig90nUMmOGTduUWL2Vl+V3CXTy+XCu9DlRje9x24vY=;
 b=Cn5UhQSnyvHLjtToIMMrQ14hfd83htgj4iyIM0xV/1buCCWNrGErk9zgMntvfdkH/X
 WCx9kgTywlNR1yHe6nMd+U2ZI7AdPlNFVG19x9YwQ1aPC/B/Ge2Qr5yycD4m5eof1XWY
 YbB4WLoiVoiqiDDkGheReW7W9HuRf8nk3i1vwGpkifpIIt2XC0Ns0pmZHOC/GwojqdLv
 e6c4Y1QyDwTEG0qbLJyxj7s6tUlZtnBxcfHvBeG/Hv42QeiswUVMo+zAgBiNbOUiUi6i
 SIycS5dkORtKowLcyHyLoANeD7muZZ9TaEbAQTZwnFF2wjHawUpXOY04jP8GdDK7H8+h
 sznA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Cn5UhQSn
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-02-24
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

Autobuild statistics for 2026-02-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  9  |  0  | 10  |
  2025.11.x  |  1  |  1  |  0  |  2  |
    master   | 44  | 52  |  1  | 97  |
     next    |  2  |  0  |  0  |  2  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 3 
ustream-ssl-5a81c108d20e247... | 3 
             dahdi-linux-3.3.0 | 2 
                   dante-1.4.4 | 2 
              e2fsprogs-1.47.3 | 2 
host-am335x-pru-package-5f3... | 2 
              libopenssl-3.6.1 | 2 
     libphidget-2.1.9.20190409 | 2 
               openscap-1.3.12 | 2 
            optee-client-4.9.0 | 2 
am33x-cm3-fb484c5e54f2e31cf... | 1 
                   bird-2.15.1 | 1 
                 c-icap-0.5.10 | 1 
                  cairo-1.18.4 | 1 
          cloudflared-2025.8.1 | 1 
                    frr-10.5.1 | 1 
            gdk-pixbuf-2.42.12 | 1 
                        gnutls | 1 
              host-rust-1.88.0 | 1 
libdill-32d0e8b733416208e04... | 1 
                libgsasl-2.2.2 | 1 
           libmicrohttpd-1.0.2 | 1 
              libmodbus-3.1.11 | 1 
           libzenoh-pico-1.2.1 | 1 
                 libzlib-1.3.2 | 1 
                  linux-6.19.3 | 1 
                   linux-tools | 1 
            makedumpfile-1.7.8 | 1 
                 mdevd-0.1.6.5 | 1 
                  nginx-1.28.1 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
                   oatpp-1.3.1 | 1 
                openocd-0.12.0 | 1 
      passt-2025_06_11.0293c6f | 1 
                   perl-5.42.0 | 1 
               pulseaudio-17.0 | 1 
          python-protobuf-33.5 | 1 
                   seatd-0.9.1 | 1 
trinity-v1.9-82-g294c465226... | 1 
uhttpd-15346de8d3ba42200249... | 1 
          usb_modeswitch-2.6.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/3ee20b88c664beddc97d4a16b54b8409b1d676df | ORPH
loongarch64  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/9eba23c94b0082dbf1c32f4901569ac6beec9a89 |     
 microblaze  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/8087bea5ff474cd11d572cb992a91a52627a0651 | ORPH
   xtensa    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/e98bd3cfee4175b88e130631762863ce2843143f |     
    i686     |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/31155e0bc85e3cd57d64f7f77958cb7f04539f64 |     
    arc      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/da1f621dcf3b7c683323dd753c15d875cc6cd9af | ORPH
    hppa     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/56f00c4f35b077d30ada431419bf818a701e5d8a | ORPH
    or1k     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/6b52480468971eb745942da99b81f0304bb35410 | ORPH
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/3b3c9b29dc7315698da507b7271145dea3335ed7 | ORPH
   armeb     |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/0679e9d8b956230c403fc2a53e82a0e0a9940db4 | ORPH
   mips64    |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/9dc6b86e60a1bc4be48268e5cdf297c28d0186fb | ORPH
   xtensa    |           frr-10.5.1           | NOK | https://autobuild.buildroot.org/results/1384514fa00ac9ebe7e40487930b9214399ada5d |     
  mips64el   |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/67ea434b39a389771e8edd215c0f96bf112039a4 | ORPH
   sh4aeb    |             gnutls             | TIM | https://autobuild.buildroot.org/results/d9c4e0f55bc0934f7d191224fc46d35100bc9017 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/5ffa180b30d13939198fdd8ea1e723e61e8cefc3 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/42d54b4056da8db8b815ea423a8708443a09f81d |     
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/d8d35a4c10747543b5968e3d4d208f6e23815516 |     
 aarch64_be  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/5f360a604fcc83a68573dd3e2a8780cff1da97f2 |     
 powerpc64   |         libgsasl-2.2.2         | NOK | https://autobuild.buildroot.org/results/8a1ede381b3a731b4bcf27a0eada3d6df50100f2 | ORPH
 aarch64_be  |      libmicrohttpd-1.0.2       | NOK | https://autobuild.buildroot.org/results/017d8108d4504bacd0b2e0331ded7249a7ab1dd8 |     
    i686     |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/8216da1166f49d54c7654b857fd496acde1d225c |     
    hppa     |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/5a7ea1105ed09af7bb773978f5780a6d262a18d7 | ORPH
    arc      |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/13cd253bfb6c6b396727ffda67140e0af79122f5 | ORPH
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/5a732326bd1e660f04cddb68508384fa0e783067 |     
 powerpc64   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/28b984f6cc1373ba8c1ec82ebc6351e84a89f19f |     
   sh4eb     |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/daef911ca621b1611fad7866b30772529c258001 |     
    or1k     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/07833794b590a0585f0899baeffe533891bf41cc | ORPH
    sh4      |          linux-6.19.3          | NOK | https://autobuild.buildroot.org/results/35fba30e290ee2b1c4383a78d488f0d914121ff1 | ORPH
   armeb     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/89d2c9f24440c2e899a17eca45cae53f85095789 | ORPH
   x86_64    |       makedumpfile-1.7.8       | NOK | https://autobuild.buildroot.org/results/60660ae010b8904430cf91050630741ad106a0c9 |     
 powerpc64   |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/0705406e9c50e414b00e4886fb9f870009463ba2 |     
   sparc     |          nginx-1.28.1          | NOK | https://autobuild.buildroot.org/results/409880bc7dbf6335fcd2b44526df02343caea8b9 | ORPH
   mipsel    |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/592d88ce947ce50c5cc5ad7bca009af77ae422bd |     
   sparc     |          oatpp-1.3.1           | NOK | https://autobuild.buildroot.org/results/bc5c7ee5015c94342226ce0b3d082ee645f3d95a |     
  riscv64    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/bbe63f1d08bf2439a632155ebb3d37185f4a42ac | ORPH
  aarch64    |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/9768e68a23dfff51e67d41bfe2337241af4b929f |     
   s390x     |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/7b8b012fc716339b0d998c8615f3bbe4892650e4 |     
   sparc     |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/4c12dc60558548ea78db8ce2cdf2c3ecaee8c3f6 |     
 microblaze  |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/eb406afbd902e0f63313b3a0bb92ec56d7ed718c |     
    arc      |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/832c141e16c54f1114e1daa74888361a0e84acb2 | ORPH
   s390x     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/a0e365c022f35ca7c440acb14fad71d4be369ff0 |     
   x86_64    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/15d3763606c758f816de6e6382ffd72bf0df838b | ORPH
    m68k     |      python-protobuf-33.5      | NOK | https://autobuild.buildroot.org/results/2cfbc2bf8c73796cc6cd28c917120348c5a442a7 |     
  riscv64    |          seatd-0.9.1           | NOK | https://autobuild.buildroot.org/results/7f1f967ca6a4596176e7c2e4014d67549d01ad5c | ORPH
   x86_64    | trinity-v1.9-82-g294c465226... | NOK | https://autobuild.buildroot.org/results/64d1953ddee795e39810a224bf2e0f8c3ed29621 | ORPH
microblazeel | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/f7e9f93eeadcf7a8813a7c5ea6cb9ecc06607dd0 | ORPH
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/c739d83f6f8c26f42f2bd5e33b77c2aa881ff9a4 |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/c91c787a4ff889c60c19105b7625eb5fc6bff172 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/995c773b8fef9c8521f402709bc90d3e26ebf0de |     
 microblaze  |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/57993025b44f1fb1e06fa8f1b1c775a09143b3b5 | ORPH
    sh4      | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/89825071311cb77602c8ecbd9d1323ee451c0304 | ORPH
    or1k     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/6d52be15ce7286b4a65a07433c782514cfa04639 | ORPH
   mips64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/dc6dddee0e39c82fb3db4a060e963ae9b0065fbf | ORPH


Classification of failures by reason for 2025.11.x
--------------------------------------------------

uclibc-ng-test-132c6134d691... | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/292835bce1a065c404b3e5fe96ed578f0e3cde26 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

              libmodbus-3.1.11 | 2 
                       unknown | 2 
     libphidget-2.1.9.20190409 | 1 
                  libva-2.22.0 | 1 
                 openssh-9.9p2 | 1 
                   perl-5.40.3 | 1 
                     pound-4.8 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/515e55ec7ce3d99dfffbc5b616140f0f91c97d84 |     
microblazeel |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/9672d2944f994652a74355cec26782a1de1f265d |     
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/9877b2918e5b0a2405868b873e8d39a80bf4d94f |     
   mipsel    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/dc6269aa2b87102e43668a9ec6f21d9e9b392a7f |     
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/caed1fe8d06f3e9e1152f0ef6bed433a1eb2a7e6 | ORPH
   mipsel    |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/4f912d01182656b50e1087b16b46fe82a38c9cf4 |     
   s390x     |           pound-4.8            | NOK | https://autobuild.buildroot.org/results/bac4b2041a1fc608f1296b60c32fe6f4f16b5119 | ORPH
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/451e32344f3716c45ccd3b1d8c558d32c66000f5 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/c8708f9b60bf6599ba197311a440c7db5faab259 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
