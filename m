Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCE5E9A04C
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 04:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E37AF60A6E;
	Thu, 19 Feb 2026 04:30:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zGoOKrogoTQy; Thu, 19 Feb 2026 04:30:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFCAD60AF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771475432;
	bh=ExTP5WQ3uEUlqv6KuSWGeaBduvLiVtfQAvOvS7NRmSg=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Sr8hUxjq0UQnO8ZxJFx2jowTUSF8sBxu4ECwmcPVGa+X73GY9zEuCrSHfn1OlC/JS
	 7HK7NqE2vk64MRu05/7URusTCM816eXTx2c/rjbJiG3JS9m603YHgO57/xVOlmG/KQ
	 wQC9Kt/uXEosH3o6MDxmzxaj86kVR9tJ/hWtj6rd5js0fkdVfva3G3GoIFy07oh7nx
	 UVXd2rgl3jSkhMerbU1k6nk2Fv9Fg5nKOwd8pkfZBrQT4LH2/tJgMzez5p2js1lgfF
	 ybtvGbkHJ867pQkepHee7lWKRem0QVYcXrKqjho6MfTVOYFL4pdCvLfK+0IdjdWUrm
	 ZLHGorqGVM2BA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFCAD60AF6;
	Thu, 19 Feb 2026 04:30:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B6711CE
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 04:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 485F560AF6
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 04:30:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dkNthwFXdGnq for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 04:30:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DBA2260821
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBA2260821
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DBA2260821
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 04:30:30 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-436234ef0f0so332161f8f.1
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 20:30:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771475429; x=1772080229;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=atfsbsxRoV6l5z+LQlrvgWKxPbg2XUNK+b8dTSA24yM=;
 b=uwmDk/SelC2fIyz4/UWzCYddVe0MYewypdSIn2N0UhtFw6V/0sWrhv6rYd1J32aQPN
 yUdlp2nP/IakWkJAhPdhh3fTPTGTNHeSuQctNAUCTLOConPaaP+GSXOFXPk/w2G3VjTY
 SbGNJTvgxQRBxEfheZxjcY/6ZGs5Q2KK3/zntzqyKRvCjgmu6HfILN3GrLG7sm+GIttw
 +EKUdM0rpj9Q/zV/XDSlv/JYPxaJfN/9FYiZP2yl2TkcJWsu/vBcTfrZItgbHUb99Mx8
 VxPsvxEQtKiV7FBy6+UpfcWUutUgcvToqhzv7eUfvMa3bLxDMpw2AXt0tjEd7wosUqIP
 g7aA==
X-Gm-Message-State: AOJu0YyS2hLQCwtbhpSkqnj2rEjoUKxadwuBm5Yuz9IiLSn7SX6KwLXo
 l/uXIpNX1eyxuQYTVW6yV3lXq5MfX4XLkZQuCUCGHyCj2BRctYlfhlO2CqRd0PY6
X-Gm-Gg: AZuq6aLZihMSEH3bY7pYKsv3u4kOWkULKr1zguRGa7HEUC+zxXjrF9T3mfHIE4erKaa
 qOqb+DASuU9NYnyXMpfSpiO0KWHIZ6zL4yMEizc6ZQfM7bLR5fCLIpzcIk2H1aJPPGIqJI7bq1N
 vmk0VOPKS3MubYOldVfdtlBpEnilZOs9zL6Jz9AkjV3VMGc3m0UbO2kfz9oAfR3hPhabwf1Hq3N
 xqnK3Ahj8HjnSjwQ+lmP+mCukYPCc/UGGu/SCVnJCNSlkO1k446CnP/QoQtkYYF0ABnTb7nTlhP
 DeHO58rmB4OY0MHCBdkPFfXguH0xDw/GhAJeXp2fgo6t8mnUDFcKgcby+DMYc2tMYWjIDEfshUw
 ZLQwISI+MX3Izd2KgVnzFI1IYxtMGABA/BFl8DQbtMwJtp/Cxn2cREJZjFwsaFmMMigkupi3hvU
 Gz8SlAjaNBzvdd68jkmrdzxAz+f8FxMgTY7q+TwAg0
X-Received: by 2002:a05:600c:83c6:b0:47e:e8c2:905f with SMTP id
 5b1f17b1804b1-4839e636fa5mr14456825e9.8.1771475428496; 
 Wed, 18 Feb 2026 20:30:28 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835dfb4bd4sm577369865e9.7.2026.02.18.20.30.28
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Feb 2026 20:30:28 -0800 (PST)
Message-ID: <699691e4.7b0a0220.24fe9.7560@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 19 Feb 2026 04:30:28 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771475429; x=1772080229; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=atfsbsxRoV6l5z+LQlrvgWKxPbg2XUNK+b8dTSA24yM=;
 b=NUTQcxaNU0u8VyIzoAQJzGz00MaQfhXg3r1+DF6EH2aJ6rFpLOj+L1jzwVNDXpfLPB
 FgpdKirOuJ17qrzFLPkB3jaAAbZ+K5qvgl7pY8tUwdztcAwYQQnybWaCdBGC0StmTi9W
 8dpOA2om6c2IKp9e7BcnO0+Xn3Xmu2oexCZhjhaeXBqUVZ0JlR+keePazIBxL/Q8DT+x
 Y/s3Pd5brDrE4ktrPZTjyuOdxeBGOImzhjVdqeNq//Ra+Au67ZJSBmNzDKy49BbfizYN
 bbRfVNujTPziHWoz2Xn/RPQ9t12bQjpFRSf9xqsOne+rgkkD5txCff1HnV4Yvnd6lTCu
 Rqyg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NUTQcxaN
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-02-18
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

Autobuild statistics for 2026-02-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  3  |  0  |  7  |
  2025.11.x  |  1  |  1  |  0  |  2  |
    master   | 31  | 61  |  0  | 92  |
     next    |  2  |  1  |  1  |  4  |

Classification of failures by reason for master
-----------------------------------------------

               openscap-1.3.12 | 4 
                 host-gdb-14.2 | 3 
libdill-32d0e8b733416208e04... | 3 
                  cairo-1.18.4 | 2 
glibc-2.42-51-gcbf39c26b258... | 2 
  gobject-introspection-1.84.0 | 2 
                openswan-3.0.0 | 2 
                 rtl_433-25.02 | 2 
uhttpd-15346de8d3ba42200249... | 2 
                       unknown | 2 
          aardvark-dns-v1.17.0 | 1 
               asterisk-22.8.1 | 1 
                   dante-1.4.4 | 1 
                 e2tools-0.1.2 | 1 
              erlang-26.2.5.15 | 1 
                    ficl-4.1.0 | 1 
firmware-utils-c42a3bc53da8... | 1 
          host-automake-1.16.5 | 1 
host-binutils-bare-metal-2.... | 1 
            host-go-src-1.25.7 | 1 
              host-guile-3.0.9 | 1 
    host-mender-artifact-4.2.0 | 1 
              host-rust-1.88.0 | 1 
                  iozone-3.508 | 1 
               iproute2-6.17.0 | 1 
libeastl-45469730d641868ce0... | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
             libgphoto2-2.5.33 | 1 
                libnss-3.120.1 | 1 
     libphidget-2.1.9.20190409 | 1 
                  linux-6.19.2 | 1 
                   linux-tools | 1 
        ltp-testsuite-20250930 | 1 
           lttng-libust-2.14.0 | 1 
                       mrp-1.2 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
                   perl-5.42.0 | 1 
                python3-3.14.3 | 1 
rtl8189fs-876e627a5b6a80217... | 1 
              shellinabox-2.20 | 1 
                  snort-2.9.20 | 1 
       sp-oops-extract-0.0.7-1 | 1 
                    squid-6.14 | 1 
ustream-ssl-5a81c108d20e247... | 1 
             util-linux-2.41.3 | 1 
            vorbis-tools-1.4.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |      aardvark-dns-v1.17.0      | NOK | https://autobuild.buildroot.org/results/7597a19ec9ddf5ff6ecb903a31533b9c7516402c | ORPH
microblazeel |        asterisk-22.8.1         | NOK | https://autobuild.buildroot.org/results/2bb663cbee02378709c20b06a067daa3c5794c28 |     
   armeb     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/b4cea4723e42d092203c39cd5ccd77f87d17b2e1 |     
  aarch64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/8f7950f207b161fb4864e2d59dd4fe60cfaa6dbf |     
   mips64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/9a3d08831ff7324267da6eaeb7172eb0ba335c33 | ORPH
    arm      |         e2tools-0.1.2          | NOK | https://autobuild.buildroot.org/results/bd8c183aebd247df917cf1df34de07bf311f7633 | ORPH
    arm      |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/12f60e803a4e2a6a3a862589d35691d14e65e241 |     
  mips64el   |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/7934eb1bc0d4f9db5210af6f780413dadbf7d171 |     
    arc      | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/ae1c1c5869311d407865e84ed6a22b4dce1dedff |     
   x86_64    | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/0fad0fd3f4f15f841675fc080e5d1a7de9da6d80 |     
    hppa     | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/86763158013a0ae85bcbf8388f9a1a565ea632d6 |     
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/3dcb5a484edc2512f1a7bfbe8f8f4f7dcfae5fe7 | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/24a07acb99c6239ae0ff03f4e798132cd209d9a4 | ORPH
    arc      |      host-automake-1.16.5      | NOK | https://autobuild.buildroot.org/results/fb1f73ea17bdb72bfb6a33c7ead1b2fed55ed63d | ORPH
 powerpc64   | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/7c7495488ce4a7dcced24dc54c9eece7a2cae438 |     
    or1k     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/271088074714c3b0043bcdb694477304aa281939 | ORPH
    hppa     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/431eb06d8984dcaf589faa523c467302c3c2442d | ORPH
  mips64el   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/024b3507b2b96640481ee7e740769d9feec5b91b | ORPH
    i586     |       host-go-src-1.25.7       | NOK | https://autobuild.buildroot.org/results/6a973ac9a4f77b16e02afff647e9b0ee6bbf7cae |     
  aarch64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/43bad990382e46f8a38bb887f1850d8a9e48ad71 |     
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/4e6d03a977d34bd779d42d3d89222d4bea3e19c8 |     
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/06295d3cc1a3cace553a4dfa44636da2e3a68b90 |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/3f374be415833a915e22a9dd78223692bfef0193 |     
 microblaze  |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/f1a1c09228efea72b8204fba1dbc57b2be01b27e |     
 powerpc64   | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/1b755df32a8f34c6b2a24f65cc77fd9c25be9779 |     
   x86_64    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/1bb57af5bfae6d5c17f7d18828055decdd770f35 |     
loongarch64  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/1917ca6cc5398bf99def09114255932ee283993b |     
  powerpc    | libeastl-45469730d641868ce0... | NOK | https://autobuild.buildroot.org/results/1392564a25e2577ea4c29477bfeb71f7deabab65 | ORPH
   s390x     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/26dcbc9642409591982e8193cec38f7661ba7c3d | ORPH
    sh4      | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/adfb8e8397670f5615336c32f747992a6790276d |     
    mips     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/1e2886902326e3cb88b5543658f9322b4ed80d85 |     
    mips     |         libnss-3.120.1         | NOK | https://autobuild.buildroot.org/results/3e72925878db7d4f86da60b119adddd6eab12c55 |     
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/ac0d05adaedc21065cde9cb548f44499134fb0f2 |     
loongarch64  |          linux-6.19.2          | NOK | https://autobuild.buildroot.org/results/989b02b62f2e992e3908a594dc4697566797879d | ORPH
   x86_64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/8e801daa95a186dc3fd031fa2629f2c93206b140 | ORPH
    m68k     |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/a321db3c1b32576668ad66d53c27abd0bee4aaa8 |     
powerpc64le  |      lttng-libust-2.14.0       | NOK | https://autobuild.buildroot.org/results/cfd378076d8c754707cd8f58dd41a90a38302676 |     
powerpc64le  |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/b8144be51f178f934b964a051b432e85373c81ab |     
  sparc64    |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/3b4d95bb2f3e192af3a1a65273c0ea26e1de28c6 |     
 aarch64_be  |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/3a5630cd243e290355fd368675688b751b51bd59 |     
    or1k     |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/f25d080551f5a9104e592e05533ebe284a28535b |     
  aarch64    |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/f077cb0f791c7eca7ad18fba6c18a86685e63282 |     
   mipsel    |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/6c29b51a5a038538513b2aa3e36643544625b26e |     
    arc      |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/8e8cd511c8104e1142d25945513dfcea166c1174 | ORPH
 powerpc64   |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/462346a3a99322495ff2d3316329214e4d03ef68 | ORPH
  mips64el   |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/c6f8bc4454a4cea0e551f2de795ec53b3d575e93 |     
    arc      |         python3-3.14.3         | NOK | https://autobuild.buildroot.org/results/acbcbc4c124c69273b48c0a7d2eedc364c037da4 |     
 powerpc64   | rtl8189fs-876e627a5b6a80217... | NOK | https://autobuild.buildroot.org/results/f6017f94deebd624bb2b10a58afab030d7c0951a |     
    arc      |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/a02d19ccabfe83959ffe8c0b181f3342d4d700c8 |     
 microblaze  |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/e47ccda6fa9d7ade3c67b338eb1461c31789024f |     
  aarch64    |        shellinabox-2.20        | NOK | https://autobuild.buildroot.org/results/7ac03bdbc00a3aa6a7544979d6c2e97335d0622a |     
 powerpc64   |          snort-2.9.20          | NOK | https://autobuild.buildroot.org/results/34f24b4ed5278016b8ba334550d2fc9034d5aa6f |     
  sparc64    |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/df1d59374cde137871fea00963f0b00242e3bbb1 |     
   x86_64    |           squid-6.14           | NOK | https://autobuild.buildroot.org/results/f148bf46457b9225a3a72e81b5984e0a3bdfbad4 | ORPH
   mips64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/34050ff056e75dfe351c96356ef3f0db545af767 | ORPH
   s390x     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/38980762253e9c3d79abacfd56dd01406cbacb78 | ORPH
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/ce1537285eefaabb86e82127c0302623c5211296 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/8345b382d81e6b9030b38972bb00dad39a1532ad |     
    mips     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/1ede0056cb744aae7f7a7359341c27efda0a9261 | ORPH
  riscv64    |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/183dde1ef7d5db4224c86bbb406304e914e239dc |     
  powerpc    |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/97bf846bbf3e787b0bf83f498012f4b47340b6bf | ORPH


Classification of failures by reason for next
---------------------------------------------

                   host-gnutls | 1 
            igd2-for-linux-2.2 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |          host-gnutls           | TIM | https://autobuild.buildroot.org/results/1e4ebee027471f0550e8208b67faa7baf50d861a |     
    mips     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/7be07945b3add22ae6277570bf4514e971256dca |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                       unknown | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/563cc7a661d39dae0650b49d99aa0a9b2f5b35fb |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                lesstif-0.95.2 | 1 
                 libgee-0.20.6 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |         lesstif-0.95.2         | NOK | https://autobuild.buildroot.org/results/2cb3c533f57e85b6bf6b99d8717cfb51452f0ab9 |     
  sparc64    |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/63e7479fcca8ea1387543b056823bdee723a5c36 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/c97b01fd40d6f759e74255be562e963830b1b2e6 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
