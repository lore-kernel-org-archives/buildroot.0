Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C82BC54ED0
	for <buildroot@archiver.kernel.org>; Fri, 23 May 2025 03:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D669583EF0;
	Fri, 23 May 2025 03:15:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6NIXC4HOU-Xy; Fri, 23 May 2025 03:15:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D29E683ECE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D29E683ECE;
	Fri, 23 May 2025 03:15:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EF89119
 for <buildroot@buildroot.org>; Fri, 23 May 2025 03:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44A7240162
 for <buildroot@buildroot.org>; Fri, 23 May 2025 03:14:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id maNbgU2-8DcK for <buildroot@buildroot.org>;
 Fri, 23 May 2025 03:14:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 137CF40010
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 137CF40010
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 137CF40010
 for <buildroot@buildroot.org>; Fri, 23 May 2025 03:14:57 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a37ed01aa0so2489526f8f.2
 for <buildroot@buildroot.org>; Thu, 22 May 2025 20:14:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747970096; x=1748574896;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZKNPZ/ocMkAxJPoZ5JSFZOlbeoxFDcjjHN8nY0x3k1Q=;
 b=g5NU6PxHmpTUIwd5nCV3sRHIK2o7G8QIQYkBXuD+/piEaHU3UoOZleeq3cTnPynys5
 XRt1fCAiCDKKTohHZW6ApXao5GF0eyTwGKrgJBtOKeeuZ8sm1cu4YLm3J0x61Sfpvb0w
 91c8XTf36ZodYUbRQ8HlccxwwIEkDNqiUpaso18LaT2okR4gtdBxzE+WPMM/ZZXT4x/Y
 oQRMW6zIxKnpjwV+jT3F0ZB5zuCUSX22HifBWIVUjQsvm6lCavUP3La1AwyeK9J06wpQ
 bti41tWy3+NERJo5/7Zg/4iossvaeLtrrKYVsxtI0zNQWiGCpsx+SBq6316iRNfnXsBE
 f0MA==
X-Gm-Message-State: AOJu0YwiyQeKyHye7sLLHLe6q3uh9aKokCHuacAO5ej4gM8VFnvKTivX
 2RTVlttkgIC7hQ07n4SPntZUuvQ9eiZxIVjtQDNRR4Ru0XpZBhiTgFrkNKUg9g==
X-Gm-Gg: ASbGncuNbOYZcaX6UdlFRfVzPhfxaaolenXBbUNfTSHO4UKF0yekdSEJjDEMDFk6jnz
 M/3/k7Bv9BLUQX4OiYVbKNQEgWJihpJSWcvekk1QUUpMYBr6MGo2+cACpO+2TWx5S49EZKRNGxO
 uAg/fWa7Y7byQRipl1SqdnuNJqm8jwFlUcOW9IVtP2OQ7WVzags89Qk9xVcHFw6eSZ5DS63B2PJ
 RfpMYHj73ngbjn/CPzeYuWhsG7qST37yJmBViipqgJT3xshLEnFVY2AFxqRMIsUtpL8lE6RFCYe
 ZdMScCp/aVyr4VVGpKkpGMCPLaCvkrOTAElcYeETpmK/e05XjCQdrDU=
X-Google-Smtp-Source: AGHT+IFe3BPiK8hMupHaaRfMjcfjiA8uA/KuOnJHLnSs+CyxbeX+kZ5bVCVSes6C423VLo1fJmQN4A==
X-Received: by 2002:a5d:4ec8:0:b0:3a3:62fa:fb85 with SMTP id
 ffacd0b85a97d-3a362fafcb2mr20075152f8f.28.1747970095847; 
 Thu, 22 May 2025 20:14:55 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442ebd46aa4sm220459815e9.1.2025.05.22.20.14.55
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 20:14:55 -0700 (PDT)
Message-ID: <682fe82f.050a0220.214850.0787@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 23 May 2025 03:14:55 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747970096; x=1748574896; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ZKNPZ/ocMkAxJPoZ5JSFZOlbeoxFDcjjHN8nY0x3k1Q=;
 b=XLbX/j9NBdhZd8ln6lY4Xj/xCwFEtipNBcJshTliwow5yaNl44SbXJueJa55FG0Lmf
 T4xLHnFv1m7PCnheargfajOonl/TDE0lam/3SDp56kJ9uNvHSByphvH9X1NQk+EKi6fz
 58j8XGSRCbkImeUFKq6REYSoyrsDAdsIAzzUScId9NmV6uVnHEqCt1teihjGVTA07fNU
 VhJxOSwdC/wk+XJhDJIToNe9PpSFpTSjElOEsMpKr7pwKQzc+6AwTmfX+rJctMbLvJI/
 uWug28glv/bhYjQx0EjNA5qkhsJ0fDOYjGwkP5LcC9n2p/vcSv8VdhucS3Ts+FUQE+Af
 l8ZA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XLbX/j9N
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-05-22
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

Autobuild statistics for 2025-05-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  8  |  0  | 10  |
    master   | 18  | 29  |  0  | 47  |
     next    |  2  | 10  |  0  | 12  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 5 
              host-uuu-1.5.201 | 2 
                   perl-5.40.2 | 2 
                   avrdude-8.0 | 1 
               bctoolbox-4.4.8 | 1 
                    bmx7-7.1.1 | 1 
                   cvs-1.12.13 | 1 
                elfutils-0.192 | 1 
  ffmpeg-n6.1.2-27-ge16ff06adb | 1 
            gdk-pixbuf-2.42.12 | 1 
           ghostscript-10.05.1 | 1 
          host-binutils-2.43.1 | 1 
              host-rust-1.86.0 | 1 
              libopenssl-3.5.0 | 1 
              libselinux-3.8.1 | 1 
           libzenoh-pico-1.2.1 | 1 
                 netsnmp-5.9.4 | 1 
pthreadpool-560c60d342a7607... | 1 
               pulseaudio-17.0 | 1 
        python-selenium-4.27.1 | 1 
          sane-airscan-0.99.33 | 1 
                 siproxd-0.8.3 | 1 
                   trinity-1.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/96b993dd4d7db44d8a35c1ab8a830375fd331daa |     
   sparc     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/30679e014d4bf0ab45cb9cf44ac81ec4a3bbaf8f | ORPH
powerpc64le  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/2ec8d4ff23daef27ba28844740f71b896734fd54 | ORPH
    sh4      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/0c33f61d4f8de50f1964d3df1b0666fa14ac5260 | ORPH
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/6dcad7b4c7a88f45b3223bd668bff9e2b5312463 | ORPH
   arceb     |  ffmpeg-n6.1.2-27-ge16ff06adb  | NOK | https://autobuild.buildroot.org/results/56d25326a2e065ba6cf0633244da89e3ea6c3df7 |     
 microblaze  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/22cbb508ce1f9adda1f41d2f6d7c60928d801653 | ORPH
   s390x     |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/215ec694eadeca8fe1fb8d89fa4e49955c952ed7 |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/741dc7898bcce5c92c6e042c1bf68b5ea4861fe8 |     
   x86_64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/c918231feaca465e6f2fb727a02ab581a8bf233e |     
  powerpc    |        host-uuu-1.5.201        | NOK | https://autobuild.buildroot.org/results/6dc2b0585e8e1900e5a977cd0b9e26b2ee1e90d4 |     
   x86_64    |        host-uuu-1.5.201        | NOK | https://autobuild.buildroot.org/results/3500f573427545e51bfc4fc708f769966d95bf1e |     
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/b89bf566f719f806afd1c68509d1d25d8e8de5c3 | ORPH
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/442d36a48966c7bf7e27095236c0f7e2cdf44780 |     
   x86_64    |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/91683593d51a3448540de11edf016de403d354ce |     
    arm      |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/6703f5a0e2af3e9a3dbb7ac0b6a1bdf7cb69b81b | ORPH
 microblaze  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/3195d75548d38dc540f3fe472e8131d94582ef9c |     
    or1k     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/fd1ce12de9c22ad6880ab783dc808bc5194b35a7 |     
    arm      | pthreadpool-560c60d342a7607... | NOK | https://autobuild.buildroot.org/results/63444dd73af55f8cd07aa057bc6616c4f85c9a87 |     
 microblaze  |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/4c857e2f4825fbaaedf9ffb1d06ed9b6c1983b09 | ORPH
  sparc64    |     python-selenium-4.27.1     | NOK | https://autobuild.buildroot.org/results/24b4443f916573d80ae560e1d59dbf55bd718851 |     
microblazeel |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/97c70a50b9983a68ef53ecc73ff21781cfa900c5 |     
    or1k     |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/b9ebabcc40199ded24e31f2c8bc7d7d88dd6762c |     
    mips     |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/a10f0e8dc1e646ff4b7447b353b6a016d23c7c75 | ORPH
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/933c9d9feeb4732b95d4e6f218f6003248c5e54e |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/42e016af37902844a168723881fbed6ee72d1cb8 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/23ce09e68feddd44c87a127944d4316f91221ccd |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/d54a7f91d683a160060f96551927962682fb229b |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/00fc65bb14851d58037b25bbe530ec92ab4ae1d4 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                       unknown | 2 
 host-softether-4.30-9700-beta | 1 
                openvpn-2.6.14 | 1 
package/gstreamer1/gstreame... | 1 
                   perl-5.40.2 | 1 
              skalibs-2.14.2.0 | 1 
          sphinxbase-5prealpha | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/d30dc5bf3c756f6b17c7a7316d9ac9c9f977cd00 | ORPH
   s390x     |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/1ba7ee52c1da41b6b5f9d3158eed44260b36e470 |     
microblazeel | package/gstreamer1/gstreame... | NOK | https://autobuild.buildroot.org/results/0a64fcc73ccfe586b0f60c4061999792db67a7ed |     
   arceb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/e1c2ed9b3660970d7352f57ef5a0db43855b11ec |     
    or1k     |        skalibs-2.14.2.0        | NOK | https://autobuild.buildroot.org/results/d9b8d5c33b1bc9387f5bbbf3a036cdbb1db1b79f |     
    sh4a     |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/f260a912082f1e9d65e415ff309aa28d2321c9cb |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/a6db623eaeba57c6a70f2a1204276c22a2786718 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/9bb5006fd8da41bee1b667c67bb5a15495ac27b2 |     


Classification of failures by reason for next
---------------------------------------------

             libargtable2-2.13 | 2 
                     daq-2.0.7 | 1 
                elfutils-0.192 | 1 
                libesmtp-1.1.0 | 1 
              libselinux-3.8.1 | 1 
                libssh2-1.11.0 | 1 
                  linux-6.14.6 | 1 
       shadowsocks-libev-3.3.5 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/e835e0c4aa02d775c592eaa66d063f7cb280b4b6 |     
   x86_64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/7ed1d1b59ae18684e68218cb668cc4f45180a753 | ORPH
 aarch64_be  |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/df0e864ff1d72f727bbd434eed72e371766f8886 | ORPH
   sh4eb     |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/58e7bdf16434c0a1f3d1fa9c1391858b6ce0f76e | ORPH
  powerpc    |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/b8caeb5cf73402cad2fac6017b7902297b5aa7c0 | ORPH
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/25f6cecf3af39f06936cd3619b89d4f36e70db83 |     
  aarch64    |         libssh2-1.11.0         | NOK | https://autobuild.buildroot.org/results/54cbbd817a600e0e2c3571fd9db58b95fa215b6f | ORPH
   mips64    |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/74e93634b3ec51d61cd01829a064999035446f59 | ORPH
    i686     |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/0a077ee5aca37d3d3aac8da265278c0a83e6cae4 | ORPH
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/0ca124d4d4247a7fa9ae6c481f53e88f52081b33 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
