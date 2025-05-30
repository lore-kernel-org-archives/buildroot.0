Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1E3C54F30
	for <buildroot@archiver.kernel.org>; Fri, 30 May 2025 03:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 505CB61B4B;
	Fri, 30 May 2025 03:14:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9efd5lNgquow; Fri, 30 May 2025 03:14:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51C8C61B50
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51C8C61B50;
	Fri, 30 May 2025 03:14:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A07DC236
 for <buildroot@buildroot.org>; Fri, 30 May 2025 03:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F92761B50
 for <buildroot@buildroot.org>; Fri, 30 May 2025 03:14:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XDPLaXVa0CQf for <buildroot@buildroot.org>;
 Fri, 30 May 2025 03:14:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5C8E861B41
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C8E861B41
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C8E861B41
 for <buildroot@buildroot.org>; Fri, 30 May 2025 03:14:36 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a4bdee0bf7so897809f8f.1
 for <buildroot@buildroot.org>; Thu, 29 May 2025 20:14:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748574874; x=1749179674;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/Yw6v9IgAfhiPBDwUgHjrou4r6D0e1S8wzJdi91eC+8=;
 b=l3GWXCn1y1Tp+ztfnAy9YV3G+M2IkhfLuHSBp/R9Qycy36jx+CdxIMNAQhWQtS6MWN
 DHoYppVMa0ntDbj8bcek25LYQfGyab0VC2wNPo3GJQA1nCEcg2DNkDAGoZSJwbrxez08
 8XlluWCSRNF5/fz0On/Umk34+wis6tJD5yWKIn30HHLsf5fdG90vu58EIta/N1K+Ivg+
 ZtHljc/duM4N7zDtTO0GmVKrOyYltKXpnm14LeyraiaEtq+p4Q2UqgpSbczocWwEOIZv
 lCLsLNvkC9WMsaJ5KOrjt7ME1+Vg33D2RzJLlEthngYpK3LYXyn81Cfal6qz3lSajLic
 Itkg==
X-Gm-Message-State: AOJu0Yy23WgIWT4vvampjXGrSAJqCGjl/d1BJ5mMGztYg9dwu2CvGhK7
 Afk15gWKPwfvWgZMneta5d9utxncHC9g2YCAUIZv6uZ+CEcJSZ2oDc15Z8hzYA==
X-Gm-Gg: ASbGnct/RRTl5GeYrBLYcE5N9jzTrljpRkyKbXRogtmyf5pfczE2BD4n90ny1lKn87g
 zqy2Vs9Ll+H6ZblGJ+p++aKiVJL4pXwcUMjKUiapH2jSBoYfJXHDV5/ECqk/YSdJSWiBmc6gJVf
 Q4lDfSczvxJGAza+T9BMiflm/8w6nioIl5JVnd1bAjcGwa+FvFeyaK9HPAZd8g1ETHvfTZjNQax
 X8R+KCKypuQhO/DnecVvMTtYeh7co9qarc36QzZRoAKyNg+R8NoGAkrRlS8ksHaM8Nkdmcn+WaD
 qAnE8/3ikjA8GaZ4nlrV/nWwvLtmtYtjY2OyttjsCoOghkU9STq3jA5WzG3APgv3EM6wEAXTKj6
 +
X-Google-Smtp-Source: AGHT+IHKjJgC3YgQVWGFK9vkdzeyFmaBkV0oucJIV8chJdVNuxNvjwzx9oGMOtSxxEZs2yI3++hzFA==
X-Received: by 2002:a05:6000:18a5:b0:3a4:f70d:dec3 with SMTP id
 ffacd0b85a97d-3a4f89bec05mr355322f8f.16.1748574873620; 
 Thu, 29 May 2025 20:14:33 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d7fb00ccsm5122485e9.17.2025.05.29.20.14.33
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 May 2025 20:14:33 -0700 (PDT)
Message-ID: <68392299.050a0220.25bf3e.11d3@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 30 May 2025 03:14:33 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748574874; x=1749179674; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=/Yw6v9IgAfhiPBDwUgHjrou4r6D0e1S8wzJdi91eC+8=;
 b=GBt+XdIe80RPPxcgFzJ6kzht+yR6zWgebKjXcICupXQuAr0sz+pMFrPFd1tlOjglpL
 P1aIreBRd81E39LUqJtjjYYVGip7bO1W9k50/zEOpob25z0XBN2aLxBCNm1jq4hIRX+V
 aPc+2W0ofjG2/lyllmvxlWg8GrJv0FzWGnIb/etTXwCrVQ5SFWgbhlY0b7JQPg/Ksp9V
 W7wJkWn15Av1exgK9mE22/Yv0RJl75gf3n/WjskaMb33Z6YdfDBvQS8zDqgiZ8LgEcUT
 eUDaFvRzctuV3LoVKMGCB1zTxh8rfekjnl2hjZeM6xY72ldE1mTQ+ZqT1HdPZBSYWcPW
 j6pg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GBt+XdIe
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-05-29
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

Autobuild statistics for 2025-05-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  9  |  0  | 10  |
    master   | 13  | 23  |  0  | 36  |
     next    |  2  | 13  |  0  | 15  |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.82.0 | 2 
          host-binutils-2.43.1 | 2 
               asterisk-22.3.0 | 1 
                   avrdude-8.0 | 1 
               bctoolbox-4.4.8 | 1 
                  bcusdk-0.0.5 | 1 
                    bmx7-7.1.1 | 1 
                   dash-0.5.12 | 1 
                 dc3dd-7.2.641 | 1 
                   foot-1.16.2 | 1 
           ghostscript-10.05.1 | 1 
 host-softether-4.30-9700-beta | 1 
              libselinux-3.8.1 | 1 
               libunwind-1.8.1 | 1 
                  linux-6.14.8 | 1 
             lirc-tools-0.10.2 | 1 
                   perl-5.40.2 | 1 
       shadowsocks-libev-3.3.5 | 1 
               syslog-ng-4.8.1 | 1 
        util-linux-libs-2.40.2 | 1 
              wireshark-4.2.11 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/58c8c3f7096a435fb125ac7afc2d146b499b4b74 |     
   mips64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/b479e182ecd96f4ce1040f990a2e6f68288f85fb |     
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/031370e63638e1e57975123e410ca725dec35355 | ORPH
 aarch64_be  |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/a06b68326c4eae0c7cd1d0afee4b21dc8a67e2e2 |     
   armeb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/8ccc9088ce0f153dcc2a319c26f3d767f6c85f20 | ORPH
  sparc64    |          dash-0.5.12           | NOK | https://autobuild.buildroot.org/results/e7d72e969fa2702c7b58fd6c3d208ac494ab58ca | ORPH
  riscv64    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/ca2c1d19bbb92d623d78c70bbae2d62356355638 | ORPH
   mips64    |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/5169b77ebda4db71656afd46df0cdab87a3e6b62 |     
 powerpc64   |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/3dbdf1db54d5d64e0b96030f00bedac7c992dd39 |     
   sh4aeb    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/05e2f8746bb55dacbee2b7afcebe2e0c2e03d89a | ORPH
  powerpc    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/3934464b2221b2973323201af87cbee4bbbdce5e | ORPH
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/14af4f52f44c28b239787d6d919e4f73ae66169a |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0ae15061abd3690487f9fc4b5081419e18579c6b |     
 aarch64_be  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/13977a8a6e361af36c5534d0d595e9714d68579f | ORPH
  riscv32    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/b76bf77461f1aa135b054f32d575d5b7209cc89b |     
  aarch64    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/f101ecc9b5dfd2d314719cbba543eadf8b21becc | ORPH
   mips64    |          linux-6.14.8          | NOK | https://autobuild.buildroot.org/results/29d24a0127045115ec60559c43d07ba52398b80c | ORPH
    m68k     |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/6642eb990c50c77e62501254524772b08b151d03 | ORPH
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/d8bf253c67b6831cce0748b9f2d280e29fa9873f |     
  sparc64    |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/321dc68a645dcb32dacd88deae2a52a4e7bcce47 | ORPH
   s390x     |        syslog-ng-4.8.1         | NOK | https://autobuild.buildroot.org/results/c7c58df8ac0675b9f481978427ad60488349c0dc |     
    arm      |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/1501db3dfb4a8c45ebd42d1fe280c10d7972179f | ORPH
 aarch64_be  |        wireshark-4.2.11        | NOK | https://autobuild.buildroot.org/results/da78438a7f275f621e9bdac9658805160371c993 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                   cvs-1.12.13 | 1 
              fftw-quad-3.3.10 | 1 
            freeswitch-1.10.12 | 1 
                 fwupd-efi-1.7 | 1 
                 highway-1.2.0 | 1 
          host-binutils-2.43.1 | 1 
              host-uuu-1.5.201 | 1 
            netstat-nat-1.4.10 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/dc077c238687de9e1bf7e35b10646dbf40a29101 | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/85b53e620da8010dbe3c2cef2ab61c3d0e2d8cb4 | ORPH
   x86_64    |       freeswitch-1.10.12       | NOK | https://autobuild.buildroot.org/results/30e249782d0b950a1026619c06317f38756387be |     
    i686     |         fwupd-efi-1.7          | NOK | https://autobuild.buildroot.org/results/7f8c7a098fb4b953df11884406584b9c829c7ce0 |     
  riscv64    |         highway-1.2.0          | NOK | https://autobuild.buildroot.org/results/66f7d39e3a4fe2ec9b8495e790bd3e3a86ce3b11 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f9f2af441c265fd5b2e68004581901e8395b7b2e |     
 powerpc64   |        host-uuu-1.5.201        | NOK | https://autobuild.buildroot.org/results/c772709dabe62cf32bda0873d538ce6c867ec0ad |     
    mips     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/9a3614a2f42fc9cb01c471f2fefe649fac89201f | ORPH
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/4d8fbf3a577f33d192ef091ea75b2565c02521d4 |     


Classification of failures by reason for next
---------------------------------------------

              libselinux-3.8.1 | 4 
             bmap-writer-1.0.2 | 1 
                    bmx7-7.1.1 | 1 
       freeradius-server-3.2.6 | 1 
             libargtable2-2.13 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
                  ntp-4.2.8p18 | 1 
rtl8723ds-52e593e8c889b68ba... | 1 
               syslog-ng-4.8.1 | 1 
             util-linux-2.40.2 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/85828fb73b87d832fc86369883ffb7fdaa02a296 |     
   xtensa    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/3d916b78b9f3133a8e619e1e196c37f680d1a60b | ORPH
   mipsel    |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/32e181a4d51c18877189e0c8d716fa4929cc5365 |     
   mips64    |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/623738db015b0e10f3d9f09aeeee71af4ee4a6a6 | ORPH
    i586     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/3422f624575e71dee736806d58b8badc1fcdee4a |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/cd81cc5a574fed193334cabfcb4f189c790fecd6 |     
    i686     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/1fe309e3462256b260f1e59af05f40d19384edc6 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/e987661df57da33480f032d5a4e235c326e06545 |     
   xtensa    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/94d995464cda9a3fe009b80693c1e5606108f013 | ORPH
  powerpc    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/63840752279821fc5019991c4ee20fd1f12ea9b5 |     
   xtensa    | rtl8723ds-52e593e8c889b68ba... | NOK | https://autobuild.buildroot.org/results/0ab6439a668cc0a788e6ee2f44beeb1b7374bc5e |     
 microblaze  |        syslog-ng-4.8.1         | NOK | https://autobuild.buildroot.org/results/419c021c5fc1748eb107132aaa11ac0a942ddc63 |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/b1a34b7dc000ffb6680c31f6fe0391cb06550d95 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
