Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BE1C5AD49
	for <buildroot@archiver.kernel.org>; Sun,  8 Jun 2025 03:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32A7D814C4;
	Sun,  8 Jun 2025 03:15:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y7Wu_E-Fg_r7; Sun,  8 Jun 2025 03:15:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B90DB816DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B90DB816DD;
	Sun,  8 Jun 2025 03:15:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C46381A4
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 03:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5F7D60FA7
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 03:15:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yjuRraiNKG4e for <buildroot@buildroot.org>;
 Sun,  8 Jun 2025 03:15:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D8D3960FA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8D3960FA0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D8D3960FA0
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 03:15:35 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ac3eb3fdd2eso589066466b.0
 for <buildroot@buildroot.org>; Sat, 07 Jun 2025 20:15:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749352534; x=1749957334;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QVXrbgvd3GAZj2WNw8vszCnjto9BlDfq7E2UulDuSNU=;
 b=k7x1mj3h3YPxVzWGRxwreX5bu3at3f1ORSAMrHoqqYKCDGKTP51Ty/3f+RXwjccfP2
 5G81iMuVxY7iLuitJgMxVckV8JMvdKfVEL2U9AH9xOvIzOSb4sdjVcUvKrZ3CfYlcCzE
 PCk0A86osaoA7sRxwrBzshfaRpbLf6KjnNvn6netvfCtf+Ru8+Fa92xLe7wGGz07uLoc
 kqHP7hlVISiq3n1/kAUAP8+1CxlCwAky3OITGAyCuIfwo4BwQ8FNzBXrNyqLFWqOHDlm
 Y50UoPnfsrAMd4aOBOCQatsefZZfZhIEyzAyH4V5Gc21EA4QZsmz/tpgMLuJOiLuExJO
 1zpg==
X-Gm-Message-State: AOJu0Yxrf2qIWvspMdBEq0UV3zLGO3LJCHTRwoctctUUTdnMvGtZxSro
 FrPO09e0ToMxl1KjRlxjK6xqiFy4skZKeZ3cSiGsKQwM8NRN7a7euors28NAEQ==
X-Gm-Gg: ASbGncvI9vtf3TSVOTF1krlUdbnp7NXfqkvxXVTFmw0DdRw7p0EMnKa33xslwUg6CxU
 je3APB5oihJ9M2yVFcSYzPxx8I0zoKg1sjlZL4J//6vgs+KfuP8aGp2AhnRmB9Pr/cbFwDcdpdB
 iw06x0c5YwRbPDxSig1+YFi2fjFxnsE5KF7qZz3Grnrp/PYCk2iiFmAuvSk3228U+xoFnBFGPXo
 RJCNMXxNgsBBE13DmSpvtBKctPM+y7CItEB2oOwyru0aw5KhoHK3Q2Od/06fGtfAGwcVW39opvz
 WBhBnIufa7kTYOa8r+t5lzgqHsQglfmuObQbmshDRHOm1JyWI7JJ/xL1Fa6Zsd8pdw==
X-Google-Smtp-Source: AGHT+IEJu9JRswQMl5jvnGdM2jzyptNcrO97dpuZAJNa7Vtxsnjo0Hd1lLJoysAy5ijSRyxBtKwl1g==
X-Received: by 2002:a17:907:6d0d:b0:ad5:7732:675b with SMTP id
 a640c23a62f3a-ade1ab2088cmr871845666b.40.1749352533043; 
 Sat, 07 Jun 2025 20:15:33 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60778377686sm3082884a12.25.2025.06.07.20.15.32
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jun 2025 20:15:32 -0700 (PDT)
Message-ID: <68450054.050a0220.12b6d.70dc@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 08 Jun 2025 03:15:32 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749352534; x=1749957334; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=QVXrbgvd3GAZj2WNw8vszCnjto9BlDfq7E2UulDuSNU=;
 b=ia3EmxR+CB0eS6cfpuQlonNe1IZaURTHUfukF39J9iAb+4126zWGqNC/tDbyt3vWdH
 oeOlSEHUzkyBBmss1r30bDhTt/3D2Of38re1y5zd+iyVQwBuL5UWPdpQI0ZhsZOs8fuU
 a0SM1O0dpwiILRBdkYcJB2FSNz07JamxKDRvSkN0C8xgAOxLs+qf5YB+VHkKP7/Xp0E3
 s32cB1NodOAgxcI6gk1bqPo0nEIMmaAFGbKB4B7wDW2ajwvgyAIkA+lMpQyUihuKE/Bb
 v+P64h6UwwCAE/V4Ymdga+G9G0LZHw3mkRjEDtBHvPWD/exrdTId+F5i1T2BFC7jtlsT
 Gx9Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ia3EmxR+
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-06-07
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

Autobuild statistics for 2025-06-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  6  |  6  |  0  | 12  |
    master   | 10  | 466 |  2  | 478 |
     next    |  1  |  7  |  0  |  8  |

Classification of failures by reason for master
-----------------------------------------------

          host-binutils-2.43.1 | 89
 host-binutils-bare-metal-2.44 | 72
           host-python3-3.13.3 | 30
            host-coreutils-9.5 | 26
         host-libopenssl-3.5.0 | 25
                       unknown | 21
       host-gcc-initial-13.3.0 | 18
    host-gcc-bare-metal-14.2.0 | 17
           host-libsepol-3.8.1 | 17
                host-m4-1.4.20 | 17
          host-automake-1.16.5 | 15
         host-btrfs-progs-6.10 | 10
            host-ccache-4.11.2 | 10
            host-binutils-2.42 | 8 
       host-gettext-gnu-0.22.4 | 8 
            host-binutils-2.44 | 6 
             host-cmake-3.31.5 | 6 
                 host-tar-1.35 | 6 
              host-audit-3.1.2 | 5 
host-binutils-arc-2023.09-r... | 4 
           host-elfutils-0.192 | 4 
       host-gcc-initial-12.4.0 | 3 
                libcurl-8.14.1 | 3 
                  bcusdk-0.0.5 | 2 
              host-pcre2-10.45 | 2 
              host-rust-1.86.0 | 2 
        host-util-linux-2.40.2 | 2 
              libselinux-3.8.1 | 2 
               alsa-lib-1.2.13 | 1 
                   avrdude-8.0 | 1 
                    bmx7-7.1.1 | 1 
                    brltty-6.6 | 1 
                   cvs-1.12.13 | 1 
                 dc3dd-7.2.641 | 1 
                flashrom-1.5.1 | 1 
                 gerbera-2.4.1 | 1 
         gobject-introspection | 1 
                heirloom-mailx | 1 
        host-fakeroot-1.37.1.1 | 1 
               host-flex-2.6.4 | 1 
       host-gcc-initial-14.2.0 | 1 
                  host-gettext | 1 
                host-gmp-6.3.0 | 1 
                host-gperf-3.1 | 1 
                 host-isl-0.26 | 1 
             host-libffi-3.4.8 | 1 
            host-libp11-0.4.12 | 1 
    host-mender-artifact-4.1.0 | 1 
                host-mtd-2.2.1 | 1 
     host-ncurses-6.5-20250517 | 1 
               host-parted-3.6 | 1 
  host-python-flit-core-3.11.0 | 1 
          host-python-pip-25.0 | 1 
               host-swig-4.1.1 | 1 
                 host-xz-5.8.1 | 1 
              json-glib-1.10.6 | 1 
             libargtable2-2.13 | 1 
libdbi-drivers-0bfae6c43134... | 1 
                libesmtp-1.1.0 | 1 
          linux-5.10.162-cip24 | 1 
                 linux-6.14.10 | 1 
               linux-pam-1.6.1 | 1 
                   linux-tools | 1 
                   tini-0.19.0 | 1 
                    uftp-5.0.3 | 1 
ustream-ssl-68d09243b6fd447... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        alsa-lib-1.2.13         | NOK | https://autobuild.buildroot.org/results/1a03ca0be9fc2a92d43c4b9e88d3771b8362c4e4 |     
    arm      |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/82c72501866beebd2876b7681c6b442310946f66 |     
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/e280134e0b691627c18b77d1fc5d0e9a6fac9e50 |     
   sparc     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/073f3a24ba8866214a4ac6e85561c73862220dcc |     
 aarch64_be  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/f5a2ceb40c9748702887a5a713e16f2be79bdaff | ORPH
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/2ac0ae370138c8cee8a85744c714c68703aff060 |     
   x86_64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/d9a1b2bd499082cd4b983b3cd265eb1850129624 | ORPH
 microblaze  |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/acfc610ecd67119386e491416fb9bf8731e84bdf | ORPH
  mips64el   |         flashrom-1.5.1         | NOK | https://autobuild.buildroot.org/results/503938b581753e4a43c3de9754df79aa966f1553 |     
   mipsel    |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/84907b8467dad675a8d2ce4e47620f389b3ecf64 |     
   s390x     |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/32c25f8aaa7c640c721607918b3ba456c14e646a |     
   armeb     |         heirloom-mailx         | TIM | https://autobuild.buildroot.org/results/822683956b9864f99a12a4a9bb2c3aa95fd4320a |     
 aarch64_be  |        host-audit-3.1.2        | NOK | https://autobuild.buildroot.org/results/307e890f31eeff45f057663175484039d43feb4b |     
  riscv64    |        host-audit-3.1.2        | NOK | https://autobuild.buildroot.org/results/52fc5c3ecf3361495ac1073dccc4f039b7967aa7 |     
 microblaze  |        host-audit-3.1.2        | NOK | https://autobuild.buildroot.org/results/4001e1a4e043c232f40abf100ce9eebe0ece60b1 |     
   sh4aeb    |        host-audit-3.1.2        | NOK | https://autobuild.buildroot.org/results/8cc635a93c9d4eb4cffa096f120cfca61321fe7c |     
   mipsel    |        host-audit-3.1.2        | NOK | https://autobuild.buildroot.org/results/9532ae0ab5edb17d5c76a7b4c1141b0a3e4e139e |     
   mips64    |      host-automake-1.16.5      | NOK | https://autobuild.buildroot.org/results/0670861bd8a3debf3d0e8b46c884d695f041f5f0 | ORPH
   s390x     |      host-automake-1.16.5      | NOK | https://autobuild.buildroot.org/results/e0c63c3ee05979325061d590652f23983c50665a | ORPH
  mips64el   |      host-automake-1.16.5      | NOK | https://autobuild.buildroot.org/results/38ffb66ceb70bb0fc0a3a4d19910017b61f31a62 | ORPH
   mips64    |      host-automake-1.16.5      | NOK | https://autobuild.buildroot.org/results/a06c8d8f93ca5256cad6f0cc44b5466e668ca044 | ORPH
 microblaze  |      host-automake-1.16.5      | NOK | https://autobuild.buildroot.org/results/79fa58f48a84f149f28c352033c2ec9ce1c682c1 | ORPH
 microblaze  |      host-automake-1.16.5      | NOK | https://autobuild.buildroot.org/results/57a6dce5e20b0aeb6b2a1e46f1733cc7d4c521da | ORPH
   x86_64    |      host-automake-1.16.5      | NOK | https://autobuild.buildroot.org/results/2730669dd4f6e334615b51124d6af6fcddd69a31 | ORPH
    mips     |      host-automake-1.16.5      | NOK | https://autobuild.buildroot.org/results/798ad67931469120bfe70033ce0a78b2cbb4dfca | ORPH
microblazeel |      host-automake-1.16.5      | NOK | https://autobuild.buildroot.org/results/dd1d84ed0444350e387d1e6b062ec9af4bbaf6be | ORPH
    or1k     |      host-automake-1.16.5      | NOK | https://autobuild.buildroot.org/results/75030ae398d9984144b113bf19ed262dd942f7af | ORPH
   x86_64    |      host-automake-1.16.5      | NOK | https://autobuild.buildroot.org/results/2be08ea1f6fe6f060aa053d3b2f40b5fb98f04d8 | ORPH
 aarch64_be  |      host-automake-1.16.5      | NOK | https://autobuild.buildroot.org/results/2969b07418255b0b7aa47bb587bd8eacdc13f066 | ORPH
   armeb     |      host-automake-1.16.5      | NOK | https://autobuild.buildroot.org/results/cc16b5b9bbdb40479a15f7aeb10973fddc33c09f | ORPH
   sparc     |      host-automake-1.16.5      | NOK | https://autobuild.buildroot.org/results/f04e42cf56bfb4cd50068398fee97ddb8a48610a | ORPH
  riscv64    |      host-automake-1.16.5      | NOK | https://autobuild.buildroot.org/results/2d4a50d606d881a9f6e13a4ede317d6bd1f51fc6 | ORPH
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/933379089b71c216196f6bc9c118cb6dde23a456 |     
powerpc64le  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/5b536a312b8ebc2a9b5a26dc769c664579b0d35e |     
 powerpc64   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/624dd5c4b2db44d29b3196dcc1b70133dbd807a9 |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/c80cf4f296a20ac9ff5b952b61dc308409795a3e |     
   s390x     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/c5e0aada610a13c66a51e72275ed77a3864558f4 |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/f60a57d18951b2f831c6a34f2efd64d495e3045c |     
 powerpc64   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/cb1a48c76581fa9dcff47f52f21b135951079b20 |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/36228a30148dab73008e6d37d94d204981988545 |     
powerpc64le  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b79410a409fe382a10fec0916f2b7d3cd77e6c5c |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f6a8665a014e8e3a42ac250b13c12896201a0498 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0c5435ca5ad6a933d0fcac9bb2e8c84e78e33219 |     
 aarch64_be  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d10fe2da44c51fb15a0c608c17031b021ee0be7d |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a1d5518931386064000afe2cba5ea3c9b0d09ef8 |     
   xtensa    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/adf75f272b9f081c862ac4526ba1ece0f9616794 |     
microblazeel |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/502ecfd546b3e70c9784bc8011efda994fd786f5 |     
powerpc64le  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ed8fa4e4a2f5d62cd0b9ceae60412d48f7cd56c9 |     
    or1k     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6b61489717efe4a83a2ccabcc6171ce3072a8ce5 |     
powerpc64le  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/490b1200d291cbc2d9e8e27bc1b4503b41dc19e8 |     
  riscv64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2f023c0e550bede87038464f4c542bfff2ba5168 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/bd80ed47ef17ff5668690b6f4b05808dd507c92b |     
  powerpc    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/efc9e9a676658d889c46b166d67d0f5448b2895b |     
  riscv32    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/15351d37488bd8406e530b6d31372bd5a1eb77cb |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5d57b99b040ca325386587bf63f435ff0ffda42e |     
  powerpc    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e8312d4234cc09685c50da2d493353092d12b9a3 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/501ce8c13946952640c544428fa6cdfa2659bad0 |     
    arm      |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5819ef84a9a34ca217f3c64333a174ca2c622918 |     
  sparc64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/bf0417b2d27d5ab8543349bddbd3b21b8655e6df |     
 powerpc64   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/91cf0170145d2522a05e04bfaa8a431d44f87cf8 |     
 powerpc64   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4abd12e8f408485c7287ccef3ab42fa11f0235d3 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a7cbff680bdc9bb132c873c9f417817a99aff13e |     
   armeb     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/fc508c1f1cc534dac36b7c18de9f304263f125bc |     
    or1k     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e335d392de245dc7d34582f2b867742e3e7e58b6 |     
microblazeel |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/409d0b4c26c6e789fab7b29ee2a8e83261c40086 |     
  riscv64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ddb030bf1043be68423dbb031a0d4c7ec34e68c2 |     
 powerpc64   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/463b647dcb7df272437ce9ad5dded715b6e353de |     
  powerpc    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d90615660cd1c4a4190cde4e19fffb1cd1d28f1d |     
   xtensa    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/950964880de4736d28603554459a5b79be375a06 |     
powerpc64le  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/aacc336641127a2922e5e8f73598d45ee1de45e1 |     
  sparc64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/800c5b79fba376f6561fd246680cf4996e2b7305 |     
    arm      |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/45413deafbcca4edb80069cb4e5f8c6bfe1ef7af |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/bc1229927ed972004f6d9500982709a5aa92636e |     
    arc      |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/7d240fd14ee9f3f77d4c34e54efa6b49f6acf925 |     
  riscv64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/8dd8083f79174bbaff2a7c9fddc3f1bce234f9af |     
  sparc64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/875c76c1413b755821459770a463ea39eaedd2a3 |     
powerpc64le  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2dae2b4842b7007c45d3301d50a424785f8bcf72 |     
   armeb     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f18d05e749ec68e4c1feef8a62c0b51c54386a4e |     
powerpc64le  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/627a624cfa14ef336f42904fd3e16d3a347eff5b |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/083248b06ff3e5083e281c273b83abaef29addb8 |     
   s390x     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2782463579ac2afa38baab1f992354c59f41a70b |     
  riscv64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d055a142e372dce6c386a2e7914eaea9e63e25fe |     
  powerpc    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/7b12440616bd82376d86049f64a799ece1f95465 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5c3c5d3cfb41b24cc651d9b3857c2f9c0818c976 |     
    i686     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/65c733441260afb32f809829d55a4d851149d8d2 |     
 powerpc64   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9ea29fb1a45a5b2040c1c90befeedca5e2b5db6d |     
  sparc64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/35c9b35e88bad16d774a0bb0ffa9a0ca5733e132 |     
   sh4aeb    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/43fe7fbafc8271da2173737bb178be984d74e661 |     
   xtensa    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a57b18935435f343864ecd692ae670d94c5c2530 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/85b0b581c0b0a44c491ff39de7e1d6e7b4113a89 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a733bef502222d22f35114260d27ec264aa4768b |     
   sparc     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5dcc787d99808ef41ec737c2ba687634a25d13d0 |     
powerpc64le  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0976dc3a80789bbe94c535565189f1526f7f7837 |     
   s390x     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a463a08b19ee77916df7c9a84188a5c6adfd32b6 |     
  sparc64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/63bcea139399e311d2febb9a68df6267c99cac4f |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/580fc3e522b8cbc41db223bd926d02e108b25ea1 |     
   xtensa    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a032dde42cbe09aea8187793714f39be24ea346e |     
 powerpc64   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3b27de4ecc1dc5eeb525d84fc62b80d94e657982 |     
    arc      |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/20ec3055b96adfd350798744cbb43990dbdb1018 |     
 powerpc64   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/7e38baf54c25ec980a8cef6e33fb544ba94a0c0e |     
   sparc     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1d1c59cc01c8b433e0e1ffccec6eeb084438d011 |     
   s390x     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6e3f99b76b0a489bce2e1be46fc71e7fcf1087e9 |     
microblazeel |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/746dffa11c0839e9d0bb38a8a0013b37aca1a900 |     
powerpc64le  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3651141611d455fea4344736847d41ce7750baf7 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/162f011f286b66aa6746846b1ecd648407b754df |     
  powerpc    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c7f95d75187a549fcd4625b596fbcf9b62b7fec5 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f7ad6c690ca87f73af4de13d9380aaac99d1b02f |     
   xtensa    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f9c8cd7bb03d47375ad92c77edff9a095dc89739 |     
 powerpc64   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/99e18994f1438d3a46fa80273acacd961ddf9ff4 |     
   s390x     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a7375ed0a7ce37c66160c98d4a4504f9b8433af2 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f64cd82e1095b0c5bd3b7e3502102f5f39715518 |     
  powerpc    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/31c19768b451f08014f6c061f0142695bde00f96 |     
 powerpc64   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/27f20f183da5b0013fe4c9c90862eeef9d9c3532 |     
   sparc     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/197630a96593d5bb69491cbd29007d2a010574e6 |     
  riscv64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/36795d4c00a390b343229b57cfafbcfd0f798129 |     
   armeb     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/cccfbc52d94702b7f754385988a292aee64bb03f |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e95eac2c0bd3140717de7a436e2f59bc2a69034b |     
   sparc     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f1926e3045f248b9e4f8e642c3efcfff1db67a6d |     
   xtensa    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a2097b3adb58a79165f4a4ec3e32b9e6688e146d |     
 powerpc64   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c25ee7509db7a945dbf21ed128e208607d0b80a2 |     
powerpc64le  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4359db7be75457d823d8a40c459e574ea96926da |     
   arceb     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c8a07e319ca3ad406961fff52104d9bb088cf5ae |     
    i686     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/800af95326037248eb61eb609a8ce1d227683549 |     
   sparc     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/73d2b94e976b7b33505e80b7cd6bf92eeda97b15 |     
    sh4a     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9db118d1d28f317851fb575949d65c741beef0a1 |     
    i686     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5dfd8f3ab1d29d66b240c16a26945f2823008337 |     
   sh4aeb    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/762ed4d97e78874ced0b11c0567cfc7c5576054a |     
   armeb     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/194fb6eebfe7c5432f42f061d99f88505394bbbd |     
powerpc64le  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b3ecf97e1a9203b75b0e98b02cf8ce90685f892b |     
  powerpc    |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/4c625448940703f9361ac4f1e53900256cdcc0c3 |     
    mips     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/1f352bfed1defeed1384f7ccabacbb64802d9788 |     
    sh4      |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/c712c8dcb33ecc9fa2965e985546dc2b14a87f11 |     
   x86_64    |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/d2ff2172a27500cafb7790171cb7a59d0ca59320 |     
   xtensa    |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/ceec3aa8912ac06fa735f1571c0582e8b83a9a6a |     
   mips64    |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/68d6f2e33ee59314c0b9ebf12f30046a568fa1e7 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/361b9c31eadb689b4a5d749982a73bf6d3c23808 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/1ec2de91ebcbe8a6f35aa6cd169ac8fb927e5eb8 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/cf107d406b05d33f7ea471208cfd83516c170662 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/0ef0ed8b2b46dfaf30accd4e644e9c18f0fc9462 |     
  powerpc    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/e55b5fae7ee95d38977409def0acfbec9852753a |     
   mips64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/27c0bf973eeaa76f88ddec18d0fa3cc101ca9aae |     
   arceb     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/9719c8da6873ae9ef34127d4a1277418277669f6 |     
   armeb     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/c73f1a36153867c49e4aef3101448c3474fc00bc |     
   arceb     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/8992c2cd091b08b895a2bc7e4b182918f1996d5d |     
    arc      | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/4f6c2312b5da9a0e8e3c29b30d3fc33f04239bb8 |     
microblazeel | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/75a673955fe6660e4293bff58da43eba1e1ebb8f |     
    mips     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/ed7d1affe85db0ee7b6adca0526305c4ef17ab41 |     
   mips64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/5e47861c9bb70ea55a05c5d2154cb8f117f8b529 |     
   s390x     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/cccf6750e49c28cfa3bb8fa664b367bef001d4b9 |     
   s390x     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/6519501764380908cafc90e5c7a5d38940097e8c |     
  powerpc    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/f925554befad7b55b13d8fd787459117a149cc3c |     
   arceb     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/7ef9692615f929cb65fbcec4992092b1f08bd03a |     
  mips64el   | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/bbc1a5f3ac8ac33f53207637b24d49b535f6b2ae |     
   x86_64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/2580880d980c4e91b477e2ac0bdc16870f8130f4 |     
    mips     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/1e84e4b9ebe50ea14661d2a02e98d53b7a18cdc6 |     
  sparc64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/39e0a6c09bf28dadbc26f458314b237fb18afa4a |     
  sparc64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/c885fede3b0b47d9cfb39073cf308c6b57588348 |     
  mips64el   | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/3639221b30233ed3eda0680daa7601de0ed2e011 |     
   armeb     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/84db6206177def16b6f641bb47447c08e6b3b78b |     
   x86_64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/1dca6ec5502f845170f07dfca9ad0ef90786fa61 |     
   s390x     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/d630d9efd0f50d355e18c4a306e171b17020452f |     
    or1k     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/c470d701c21b194efa2dd87fc82d2250a105dd7a |     
   mipsel    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/e35de9951c8e97edfab82e45d1d17ad37cc653e1 |     
   arceb     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/a476a91de88407b0b72cd3a794534953cc63ccb0 |     
  sparc64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/4df3fed62d8def99df087d1894bc5595715ece0c |     
    arm      | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/a10f42a113a7b65de96f4274db789bc88eb0f7db |     
  riscv32    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/2f3c1884ab979e2685350f1f70fc2aa6740f5e5f |     
   s390x     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/0136d76dc18cd8f622d39e5b3ca4592bdc252723 |     
 microblaze  | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/e0c0503f9432b76d1b5bf9ef76e6d08afc62a1c1 |     
   sparc     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/0223b428d36906398b98904803ab92419e9695ab |     
   x86_64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/6110a10c8852be3cca24bc9902718198a615c6b0 |     
microblazeel | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/71ad9347e0ae969a2bae349c1c5bd129d6b97a7d |     
    mips     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/b54c0448fbe510519e0ab13b78caa206a8399e97 |     
    sh4a     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/e212f86db3512827516cdf9f706147a37d4cf14b |     
   arceb     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/1c4d3cb406708eababc2ce8c737491c9a1f4474f |     
   mips64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/83bb01bf435c503d0800171e0f4e9dd8f7c8c746 |     
   x86_64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/bccab5197c384e1967be9dc164142c3b37f732d3 |     
   sparc     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/f62f475b0a2174191a8fe61b2f1321c749de40d6 |     
   arceb     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/30f374e826afd383a63bf55afb79241f7f3bf6a2 |     
    or1k     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/f96f21bfce7d0140e30a0f3888155c71edc77a26 |     
   x86_64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/ef1872fa9fa53e50b5b1e56ebc771982d2d3bf41 |     
    or1k     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/c18371f147f9b675c4ddd1c218738b22a8bdbb12 |     
   armeb     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/fc123f75a31bb883b5df8686957115c73921e972 |     
  sparc64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/79b3790e26f24681240e6a95914f30de1a0dfea1 |     
 aarch64_be  | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/30b66f058e5c87f04994b2a19b6649ea2b57d790 |     
    arc      | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/764c0ecc87ede85972e50b087ef7f9ec4100246a |     
   xtensa    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/87e39410081c3b77c4add1471fdf8eb680d4a3c1 |     
   x86_64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/42cc29b739985bbd6fdaf2d1ce4ef5ce08265df4 |     
    or1k     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/016f70ce706a928b4db79b24a619902e4d01a52d |     
 powerpc64   | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/b9911c302415ecc743cf83a7724e99c1e1d5fab6 |     
    i686     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/26508ef493e5163dac8527331a586f629a6e3e03 |     
  riscv64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/f4da83da725ddc0a11e82f7c05322e7652e8aa60 |     
  powerpc    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/9536599076842d52a476107ce4ffa9ff4419fa8d |     
   s390x     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/ea4496197a59fc9798962d0874be2e29c21e54aa |     
    m68k     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/6296724403a4a45e2b20625408f9307d279772aa |     
   armeb     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/42d2b7307f4b63ba8a7733adf6fd611b2097b413 |     
  riscv64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/3acac5ed5b8f935b712af9c0ebfc6a46e90d64ee |     
    arm      | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/1a798a4eb761af3f911a45ec9513ac6377038333 |     
   sh4aeb    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/c2cd8037c8a9a903e88f714195ed79f436765e54 |     
  riscv64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/4107719d3bc6802efea9e4f93212ca17826a26d8 |     
  riscv64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/e368602be98fac5dceb106bcc29b2edbcef95128 |     
  aarch64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/16552ebc990c1200f6e5274f8a87bbbb4a5b2fc7 |     
  mips64el   | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/ddad53b4c6d92943aa68beb65247f185e9ea0b71 |     
   s390x     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/4cb642efe03cac5042090573e39e869af1412a9c |     
 powerpc64   | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/ed86d76d7120d8f4ed1c971b5d7f7c23551a5bc3 |     
   armeb     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/8c840ff4ebb4e60b456090a6000105dae7af83fa |     
powerpc64le  | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/74ca095c19be3dac56a2833ab59fcfe8afd1fcf3 |     
    arc      | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/90f8cd91aa5b83f9c03c472e121f9d62c661df92 |     
 powerpc64   | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/92e343810118263c333dac55fe8b46eba23f5e6c |     
 powerpc64   | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/c8831e98d4c244f8566aebb651b0de742134adab |     
   mipsel    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/441f304da7737aea8b207e523283b29fbd6d386c |     
    mips     |     host-btrfs-progs-6.10      | NOK | https://autobuild.buildroot.org/results/e050afe21ceaca2005ca555a52c1de889aa5d10c | ORPH
  mips64el   |     host-btrfs-progs-6.10      | NOK | https://autobuild.buildroot.org/results/ccd39c6e361aa81a0bcc89cc61898654072a0f5e | ORPH
   arceb     |     host-btrfs-progs-6.10      | NOK | https://autobuild.buildroot.org/results/fe1cf454a8225ba3bf599008f3ec1a66c36d7944 | ORPH
 microblaze  |     host-btrfs-progs-6.10      | NOK | https://autobuild.buildroot.org/results/1c40c49e8934a0238374e6453f5d27db0f1d4c97 | ORPH
    arm      |     host-btrfs-progs-6.10      | NOK | https://autobuild.buildroot.org/results/cb8b1c249d0483a116605686297721deb937dd78 | ORPH
   arceb     |     host-btrfs-progs-6.10      | NOK | https://autobuild.buildroot.org/results/da3e1d23eee5091f9d3192e4bf277c7c6f991e45 | ORPH
   sh4eb     |     host-btrfs-progs-6.10      | NOK | https://autobuild.buildroot.org/results/5ea566b39c6fd581e5f71a4dcad8eec0fdeb9cae | ORPH
    mips     |     host-btrfs-progs-6.10      | NOK | https://autobuild.buildroot.org/results/0fb8bcab575668035c12b5aaac5eaf72a70ad328 | ORPH
    sh4a     |     host-btrfs-progs-6.10      | NOK | https://autobuild.buildroot.org/results/53d0e052fa4ccd06275a8c6261a34ced713e378a | ORPH
microblazeel |     host-btrfs-progs-6.10      | NOK | https://autobuild.buildroot.org/results/49cfd7e80e74581b4e57be5b07e4972f1e866b63 | ORPH
    mips     |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/0ffc23585a8ad152cf97a1bb2c047ad288a7ddf2 | ORPH
    m68k     |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/9f5008cce24f8e4aa99f0a6cd95141cb4e5ef8ac | ORPH
   sparc     |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/38a90ee1ecdf6c73199d177dac08dc7ace73e127 | ORPH
    i586     |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/4155d53ada471b8a157fb330ac43b924e00e11a1 | ORPH
   sparc     |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/095cdd9590e56517a50e9d56a87d7c057bafe604 | ORPH
  sparc64    |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/111a44f3a6fe93855d7f7aab81ceb2b7eca821fa | ORPH
 powerpc64   |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/5379d7e3d4ce0790ab5b3a6c1d98eb86deb45eab | ORPH
   sh4aeb    |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/a0fefe8cdfae98e7dbb0e6705f4756755aa03af4 | ORPH
 powerpc64   |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/8b5a0a569bd0553b77014319f7dc0588085c6951 | ORPH
   x86_64    |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/62c30f53fcf41b11e3ce9669f5ff68a45c7c8950 | ORPH
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9668bd6fccab673e04535282d290d7d2f3b846eb |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/83c7395c5a4ee2a11779edb651a17439e93f5f80 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6a38e9f08cd5346daa88d355674cde5157a8b1c6 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c0e2696d028d95c431a7c48bfc79ca564cf31a0f |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/764c15f1613e5d5e87754565fb0eae19d267e084 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4385b5f482e4f875f82cfa0d3b51b3443b5c7ee5 |     
  powerpc    |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/82a751e5885c500d103366cc77619e49f0279a01 | ORPH
   xtensa    |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/93080774f92185f191449907f4a5b17b5c132b8b | ORPH
microblazeel |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/1b2bc9d27788dcd34e4adae5f14a923bb5812d2e | ORPH
   s390x     |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/7d6141c0d72bc91f7bc5486759291a6aaa736ee1 | ORPH
powerpc64le  |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/309c35bda798c2d03fc11e9a48a46b812a4570b1 | ORPH
    m68k     |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/e69375f27143ccdc8f4072a0f823a48082317d57 | ORPH
   mipsel    |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/85ccca4695921ffaeaea4e63a4352f9882ad3738 | ORPH
  sparc64    |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/c3a1710a95c75a2497f7c25a9fcd7d251394973c | ORPH
   sparc     |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/98698fee17c6a09810d1f3aaae038cafb7b936b1 | ORPH
microblazeel |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/53f1d4d178d769a8d4f961a388123cad01ce5a30 | ORPH
   armeb     |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/4dbbd59b0d3f7020ecb3903802e368e4891c3999 | ORPH
microblazeel |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/c4d29b552b57467f9b3ec2038d0cbde4d2d0b06f | ORPH
   s390x     |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/c5d8ac85f1e2d6294d55a6a67feab8030bf46dba | ORPH
 microblaze  |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/7e3110580c5b221cd2fbeefe2c7eaff04c32ad22 | ORPH
  sparc64    |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/9fdebcf5a2d7b51e1495e055015b48695e334d42 | ORPH
 aarch64_be  |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/d507a6d322683ea9dcd68d2b8eb55b2f5cb2d58e | ORPH
   s390x     |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/5558a99d836e015fb46e357daae00bfe50a23167 | ORPH
    arc      |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/459060edf020dc8e0711f025041c08a50b0c9851 | ORPH
    arc      |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/faff35707a801114dbe40647296b83de49d1ac02 | ORPH
 aarch64_be  |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/60ed5b1072bb5806f48e5c46f8b3019bb0a13ef7 | ORPH
   x86_64    |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/e0a973b9b246c76462caa604e97b915710977e79 | ORPH
   armeb     |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/b301b69078d9a943b663833497b245d5262c5f44 | ORPH
   x86_64    |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/7aa07af37be7c3896c5f224812f44c19997ffae9 | ORPH
    or1k     |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/5d4cc38e1a37b0ef0daaa0b3405f7a48bd1fa9fe | ORPH
  mips64el   |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/57a576355663cfdeecedcca8730436fbedb0f7af | ORPH
   s390x     |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/27a0af2a7e48c34b263828683e88ee2aa5407690 | ORPH
microblazeel |      host-elfutils-0.192       | NOK | https://autobuild.buildroot.org/results/5a46aac29f338f4801e469ceea8d772f3c12df1a | ORPH
   mips64    |      host-elfutils-0.192       | NOK | https://autobuild.buildroot.org/results/fe7c52ebc6c6364888ec4aab46fdcae927d351bd | ORPH
 powerpc64   |      host-elfutils-0.192       | NOK | https://autobuild.buildroot.org/results/726e3c5c9b92ca7983bf9654c1ece11ac6f30c21 | ORPH
   mipsel    |      host-elfutils-0.192       | NOK | https://autobuild.buildroot.org/results/5e17e3b69caa3a07156e519bf6dc6a857ee844cc | ORPH
    m68k     |     host-fakeroot-1.37.1.1     | NOK | https://autobuild.buildroot.org/results/27e40fc1c43ba9d29e2712ea1fd924bfaa0b5772 | ORPH
powerpc64le  |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/4013251dfd59612945ca88d4ebcb45a3db3e5bbb | ORPH
 microblaze  |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/da1931918305fd2878c71d70db30a79307ccfb64 |     
 aarch64_be  |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/27e5b4e447dd23976d3f9d67e35c838d093ad901 |     
 aarch64_be  |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/6b5a02a44815d7623295a8d1d28ec0b5ce78ecf7 |     
   mips64    |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/98f949c632810ef9e1eb8565e0d2e5dc49d554b2 |     
 powerpc64   |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/d528eb2afd356ee2f38ae77adaa9206804d1be27 |     
    arm      |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/4b5b0fd128715bddd9453601d3f1a17a9f7cf4e9 |     
  sparc64    |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/f3b40e2fbf8890ce874b718424bf727dbe8dcd0a |     
    mips     |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/1418a0f86d354f6438b1a978727e74e93ca9dc77 |     
   s390x     |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/e5dd6d019d74bb9eecf847d8e1346093038ff4a7 |     
   sparc     |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/32d2b7a87bd1fe059db340ed07b36014796a66c5 |     
   armeb     |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/d87e73e3f89cba825c8f44a388e40d88200fa27f |     
    mips     |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/1f650a022ca32cae3a2f1ee9f661c21398a511d8 |     
powerpc64le  |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/83af3bb759e156f5ff2179de31ce693dd58840b5 |     
    arm      |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/d6504283b48d4831a5249f1220f9b179b1c2128b |     
   sparc     |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/5377242c5c32832137da07ca2aec9176a77e5846 |     
  powerpc    |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/35635b0ce0ff4e9c73164d6e4ccfbe39063771bd |     
    m68k     |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/fc05a860fdd7d85fa8e448990b489b4ccfe7eec0 |     
   sparc     |    host-gcc-initial-12.4.0     | NOK | https://autobuild.buildroot.org/results/3a9ceca74c397c3e8019c289f356eba994783430 |     
 microblaze  |    host-gcc-initial-12.4.0     | NOK | https://autobuild.buildroot.org/results/d55395e9dacd14f456ec9c526d796f5aac06da9e |     
 aarch64_be  |    host-gcc-initial-12.4.0     | NOK | https://autobuild.buildroot.org/results/0e9eb2db9515c36333529bf7ead2631f5c4106e4 |     
   sh4eb     |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/71017ba2d9754a120096ce90a27db9a44c4d64bd |     
    m68k     |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/ea26a65905efb27c6db8dadcc80b76402ec6b193 |     
    i686     |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/d2f2b9a482b8354af01358dd6eeb6f41e169ce5e |     
   mips64    |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/d4291571f1cd8024b9d9a9262a44138e06ea8875 |     
    arm      |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/d52acca36396c318c1e860b90b997e9f4d8a7e8f |     
    arm      |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/969524fdc602041d4981ba49bc927290fd135ca4 |     
 powerpc64   |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/2693a6fb41dfacfa6dd259fa32f19659107921f3 |     
  aarch64    |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/d34eca11583978a35bca2b58e3f16608fdc2ff0d |     
  mips64el   |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/de5aac1103814d2d9e9c07b4e0a4f0daaf54028c |     
   mips64    |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/dbac69953b292a892a697ec0836aeb2c200e2be5 |     
    arm      |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/94baf40d8caf11d69f6398e9f903639205cbcd05 |     
 aarch64_be  |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/6247e90e4e314985cf41c205a9b7869d24ecd53f |     
 powerpc64   |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/3048913ef27c7f9f52d9bf0fea8ead0cdee31c63 |     
    or1k     |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/67d6f994d76c05a886b8ad08c3a415471c9a78bf |     
   x86_64    |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/aadac932a9b9d7431c6047a480709f279a78a870 |     
  mips64el   |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/2f83bc4b1279b2e7f1421c849b64f0814a532dc0 |     
   armeb     |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/89da9c5e4a61e5e866ee8e8b5159bc1dd5abfb7f |     
powerpc64le  |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/f8027a6c1b6ef2a7d348e8484ae16b24d3793c02 |     
   s390x     |    host-gcc-initial-14.2.0     | NOK | https://autobuild.buildroot.org/results/ed0c77e85aaaf0ac538d4e1654a89c997d24cc21 |     
   x86_64    |          host-gettext          | NOK | https://autobuild.buildroot.org/results/96c4219bd9ce6f952d30e868819f8f76f0752656 |     
powerpc64le  |    host-gettext-gnu-0.22.4     | NOK | https://autobuild.buildroot.org/results/36fcac9e82b653d06abf0ea3a121ee6114b124d8 | ORPH
    m68k     |    host-gettext-gnu-0.22.4     | NOK | https://autobuild.buildroot.org/results/5efd8b5df8513caaa86360b50558ac718c0038ff | ORPH
    arm      |    host-gettext-gnu-0.22.4     | NOK | https://autobuild.buildroot.org/results/a17b6e30cad3521818067f872f22cbd7a5c6f20d | ORPH
    or1k     |    host-gettext-gnu-0.22.4     | NOK | https://autobuild.buildroot.org/results/274c99390ae1d9febd14b1ad0bd519d91213131d | ORPH
    sh4      |    host-gettext-gnu-0.22.4     | NOK | https://autobuild.buildroot.org/results/28ad3d1e97dc109108c4468e1d3881daf0759e7a | ORPH
 microblaze  |    host-gettext-gnu-0.22.4     | NOK | https://autobuild.buildroot.org/results/87ac7d337cebe125c5605b349bb328ed59775529 | ORPH
  powerpc    |    host-gettext-gnu-0.22.4     | NOK | https://autobuild.buildroot.org/results/2a9517664e8a6f33f448b97281ee3233a3a75d50 | ORPH
   mips64    |    host-gettext-gnu-0.22.4     | NOK | https://autobuild.buildroot.org/results/3d479e19659ca54031a7de97fc3ef1cf413b53ca | ORPH
 powerpc64   |         host-gmp-6.3.0         | NOK | https://autobuild.buildroot.org/results/ccf92ed850f351775d013ca9b56ff34dff616f7e | ORPH
    arm      |         host-gperf-3.1         | NOK | https://autobuild.buildroot.org/results/17a1aee91c4693b76fbcce8793461b0bbe86c854 | ORPH
 aarch64_be  |         host-isl-0.26          | NOK | https://autobuild.buildroot.org/results/85e38376cda5656b46d862d17752e74f6a9e8c32 | ORPH
   armeb     |       host-libffi-3.4.8        | NOK | https://autobuild.buildroot.org/results/b9cb8018521d0392000e49bf14c1eda03be5cea8 |     
   s390x     |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/64bf5125620a5c749a7d6eef71be4262473c6a92 | ORPH
 microblaze  |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/21175c42539d4be680204915b8426bf5fe24c10c | ORPH
   armeb     |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/c577869e5092defc001c09b6de538e9fc2273603 | ORPH
    i686     |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/ffe63946d159781ead56501696c8f3b224f6cf6a | ORPH
powerpc64le  |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/be29fad9842018845ff86b1870c9f315143dc1bc | ORPH
 aarch64_be  |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/504676405e238b7d4bf07a7ced0db862cb9db523 | ORPH
    i686     |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/32c78b24d130bed8c9393495b4938d407d61637f | ORPH
  aarch64    |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/3f24bd4fad5d562c7840e2bd68ff68861aec738d | ORPH
   mipsel    |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/1df05440fe5f291afe75f5699f9827a0a661724f | ORPH
   sparc     |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/f7b283feae0b36bcd0478dc8b3e1d190c631e7ff | ORPH
   xtensa    |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/a8943d29d84e2983f73d2b205b2f68e3eeadd8f5 | ORPH
    m68k     |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/a01ce410eb54e9292986e204f744c9c2cebee444 | ORPH
 microblaze  |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/d2eca8ae8c70675b647d43ed629d7d5bb97204b9 | ORPH
    i686     |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/ba8ef9406fb757a4475fe0bee7646175b003b6ae | ORPH
   mips64    |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/ce420803c2c5d966c9e03e25c07bdd0ad379ffac | ORPH
    mips     |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/29f7ec847390c79917ca2fa811839ebe9f66b6d4 | ORPH
 aarch64_be  |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/df9bc641ccd04f1446489cf747518e34e61fc5a6 | ORPH
    or1k     |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/b082c4bf4d646c1b93dd0167baee0ba9ab5999aa | ORPH
   x86_64    |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/6439cca193d288b492305946595d264a28b08ae9 | ORPH
   mipsel    |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/1b773f0ea9a8b5d18a11579d96126de16984a375 | ORPH
   armeb     |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/60a0dde50ef36877c9830d9572c56dc54296695e | ORPH
   xtensa    |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/6af3efcf0fe0edfcd428e89238acbda2ab411359 | ORPH
powerpc64le  |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/d89cd60f297d1cc01edf2fed5c8c665017113a65 | ORPH
   arceb     |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/9710bd5f0a314415089d21466225c6532d08eb08 | ORPH
   x86_64    |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/2895570f622d185924bbced908d585ffd0a15ca8 | ORPH
   arceb     |       host-libp11-0.4.12       | NOK | https://autobuild.buildroot.org/results/36f82a9440435205ce43c4d499aa7ffa8b8eec45 | ORPH
    sh4      |      host-libsepol-3.8.1       | NOK | https://autobuild.buildroot.org/results/de37a1478aa8b38207e911b162a5ebf1889c2281 |     
   mipsel    |      host-libsepol-3.8.1       | NOK | https://autobuild.buildroot.org/results/4a493840d88261a7f5d9c8d6e209974c492fcd79 |     
  mips64el   |      host-libsepol-3.8.1       | NOK | https://autobuild.buildroot.org/results/2c6596b0b1d9789e1703f767c90d025b4c31496c |     
  sparc64    |      host-libsepol-3.8.1       | NOK | https://autobuild.buildroot.org/results/24ab3d7ba29d35d68b766504a23ee930519f6080 |     
   sparc     |      host-libsepol-3.8.1       | NOK | https://autobuild.buildroot.org/results/8a0ce2e2614c8b6b163ac6c42ceef879f992da35 |     
   x86_64    |      host-libsepol-3.8.1       | NOK | https://autobuild.buildroot.org/results/0853e40fecc4eb8c9152e8784a62fdba921c728c |     
   armeb     |      host-libsepol-3.8.1       | NOK | https://autobuild.buildroot.org/results/80bc30ecd8f38fc9c93c0d355d4c8e4f2c14f494 |     
powerpc64le  |      host-libsepol-3.8.1       | NOK | https://autobuild.buildroot.org/results/76f0be23602d10a8d3c56937c6decb0ffe3660d6 |     
 aarch64_be  |      host-libsepol-3.8.1       | NOK | https://autobuild.buildroot.org/results/c5e9fbb9ed87db3dcdac6e6a2ec8ea7a56ed4cb5 |     
   sparc     |      host-libsepol-3.8.1       | NOK | https://autobuild.buildroot.org/results/695a92a8b7af09538a0ca27dee3565b4434d3065 |     
    or1k     |      host-libsepol-3.8.1       | NOK | https://autobuild.buildroot.org/results/c1a3765c95b2ed80dd65816bfd806696a54ac21f |     
    arc      |      host-libsepol-3.8.1       | NOK | https://autobuild.buildroot.org/results/ec14b439338d8f081ff16a52f01cd614bd507759 |     
    mips     |      host-libsepol-3.8.1       | NOK | https://autobuild.buildroot.org/results/03ae5cd8028f41635ca35c3cb6c353ffed36029e |     
   xtensa    |      host-libsepol-3.8.1       | NOK | https://autobuild.buildroot.org/results/728d387a6d8b69a833350e4532e44af9f3f83aa1 |     
 microblaze  |      host-libsepol-3.8.1       | NOK | https://autobuild.buildroot.org/results/18de3050d3e93635e82094d4687cfd29e797a192 |     
  mips64el   |      host-libsepol-3.8.1       | NOK | https://autobuild.buildroot.org/results/fc7eca99f98d180f7d412bcad554fa6ae10b6812 |     
    arc      |      host-libsepol-3.8.1       | NOK | https://autobuild.buildroot.org/results/be301bbf287d395f3084321e5cbc426258485c24 |     
   x86_64    |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/4ac5f9e03a4327685922f08aec76df52e8af7436 | ORPH
   arceb     |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/9083483fd395d9095880b549d20f89849825ba93 | ORPH
   mipsel    |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/9cbdb8d2713db08aef458d9e9b4cb8266996d0a9 | ORPH
  mips64el   |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/14e6cb82b36ce8607509d23a13ca56e2244102a8 | ORPH
  aarch64    |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/1f9cd6713e04ccbc11d351b6f73d5a7f1062ae34 | ORPH
    mips     |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/652377f9f7b2c69a0b3b8cda9e2e9b5592e523f2 | ORPH
   arceb     |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/4907ab2376b0d97df6be80f0ef5e60b85c295b88 | ORPH
   s390x     |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/f358589c296b0f6b99ee39b79732872b3523f47d | ORPH
 aarch64_be  |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/ebf325070d3a6fb75d8e3366f71f5601c0a0532a | ORPH
  mips64el   |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/acd6c4d46021310838a8ad81fda17dfbf0c54284 | ORPH
    mips     |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/202a847378eb5e0d09454d2ce17ae4550740ad3f | ORPH
microblazeel |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/7aa3be1c3580914452b8dd07187d714a1811e30d | ORPH
 powerpc64   |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/46f8c12227f9877d7ea1ac5e089d0fc7169b7b42 | ORPH
  sparc64    |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/6232c14ce81df94dccf06fb1fdc19bdc3ee6f3e8 | ORPH
   sh4eb     |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/91de1777804296939e5778cda46e2a8f0fd19988 | ORPH
   xtensa    |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/beb8a81fb0c2fb7e96adcaa582f09321b4e67871 | ORPH
   s390x     |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/52eb43a4d60bdf331b652f47f671c9ccd538dc2d | ORPH
   mips64    |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/17d6d6ded30a02a8b401ecd989f136b342864fcf |     
    or1k     |         host-mtd-2.2.1         | NOK | https://autobuild.buildroot.org/results/4eb9f23548cf6c28cbef260276aff68c20c0da92 |     
  sparc64    |   host-ncurses-6.5-20250517    | NOK | https://autobuild.buildroot.org/results/2bd9f6cbeed81e352f3e7cbf28709a1fbae8cfe6 | ORPH
   s390x     |        host-parted-3.6         | NOK | https://autobuild.buildroot.org/results/f69652b479887f9ff8be8ccc6f7e34048500f90f |     
microblazeel |        host-pcre2-10.45        | NOK | https://autobuild.buildroot.org/results/6a1bb214bf38ddbaffeb50be65faed688bbdb30f | ORPH
    i686     |        host-pcre2-10.45        | NOK | https://autobuild.buildroot.org/results/02fc2c254b7535ad1fe048a3a63d27d228045b50 | ORPH
    i686     |  host-python-flit-core-3.11.0  | NOK | https://autobuild.buildroot.org/results/60f70727851b59439967c972d757bcb634c5460c |     
  powerpc    |      host-python-pip-25.0      | NOK | https://autobuild.buildroot.org/results/bca3b4e90b46bd07aae449b11c02902c908a0743 |     
   mipsel    |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/c3adfcb150b13c82a4cbdd0c586c21250276e999 |     
   s390x     |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/4a8f51c0e757eb6981ef86c4e4fa8208a97b9c47 |     
  powerpc    |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/406d103651293a5dc77a649e3df258361fa58395 |     
  riscv64    |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/9349f7cecf4c0620467efb7437d849c61c6bd948 |     
 aarch64_be  |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/47b68066273056b357c39789d9bc385385da61b4 |     
  riscv64    |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/a17c62abacbba64b0357020d2e712811b7780e27 |     
   armeb     |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/8eda2d479c8a7ceb4f2ba14e189d0eee8892e9be |     
   arceb     |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/961913c703f78e1958f10b72a7a2ea3bfbb21874 |     
   mipsel    |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/6dc355b2adc0b18e20c79ba02cce43faf49bbb55 |     
microblazeel |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/7d84d5d3cc59f5a629e0ecefb8c4fb87332a88f8 |     
   armeb     |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/9a69c78a6f5019ec751428d20e48357461f88cd8 |     
 microblaze  |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/6818c41826df6a1c5027eaf8a2c4569867cca799 |     
    arc      |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/69533f8fac89bdc100dc822e99b8bdd7bcb369db |     
    sh4a     |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/36277a3fe8f4fcda2cf7bd8e08995697921d091f |     
  powerpc    |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/4c521592a342ca4a813bbb67be35e95ffa4a9d9c |     
   arceb     |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/6131688ded222b0566c411eef0d91804cfb5cddb |     
   sh4aeb    |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/e9b7a16e1aa8225fc4a20f76082a6d12a487319a |     
  powerpc    |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/0e6f9d9335b1a65690da4e08a59d52d39ad22194 |     
    i686     |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/40722b3544b5903eac95869f907a3400621ee36b |     
  powerpc    |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/bcd398dafed7a296a38f042ff9cadd1d5eb59fea |     
    arm      |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/68a277b9e37c716cb087521e91b606f8dd4d0584 |     
   sparc     |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/62cb79b09be6e927b530712d1cdf57fcae977112 |     
   mips64    |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/c71d60186566412f3451872bf08d9345c28d853f |     
    arm      |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/3774b0db14e9089218c9aba7e2e33e869d15ed58 |     
    or1k     |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/c1d1eb3020d23d5e55c9825cebabefb2d1e0eb59 |     
powerpc64le  |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/a192fc1c29dc960d34ad3be3d98543945efe9a41 |     
    mips     |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/b89ee3abcc26d45d623d5cd91fd796ccc57b4ddb |     
   mips64    |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/0b13a5421cb383482ce751431f575668939822c3 |     
    arc      |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/a43dd880af1d4c51ecaf8b8ba6596365100bc8f9 |     
powerpc64le  |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/7a9dd575b7dfb21a2fa02fc7cffbda91023a8b9b |     
   s390x     |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/eb0637418eb562a128cbd0b7ef24edf029381db8 |     
  sparc64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/1038110675a92d583c6ca1ca7e2540ba78ebd50c |     
    or1k     |        host-swig-4.1.1         | NOK | https://autobuild.buildroot.org/results/0d2eaa7a27c66755dd86ee0a0ebfbb1b0dfd2740 |     
   sparc     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/0d3ccc87712d67ca4d7ad658ba1ec7c0e5e89715 | ORPH
   xtensa    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/711e31ac245d72d15893602817c42682ca7de536 | ORPH
  mips64el   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/28b28acc1b4740314495f7147a244c314b9b9ece | ORPH
 powerpc64   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/b1ed74ab8571cfa4bfff92ff3a5b1e867620efc2 | ORPH
   mips64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/46606c5a0530891a9ce50b3f9c8aed91f5fc6e87 | ORPH
   s390x     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/b3d61f7b484387fb5e0c7dea31176cf21ac402e0 | ORPH
   xtensa    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/da635491d0f450035f5ac2fbb00bb11414fdbd12 | ORPH
 powerpc64   |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/c630fc2977edec6f0168c00eaea20cf33f37b6b7 | ORPH
   s390x     |         host-xz-5.8.1          | NOK | https://autobuild.buildroot.org/results/f409e45d0a6bcc6eedeb669456a0858e8f4b1a6d | ORPH
    or1k     |        json-glib-1.10.6        | NOK | https://autobuild.buildroot.org/results/f397d6fc5bec6e718ca3b103d85ab7cf415bb665 | ORPH
  sparc64    |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/c795538c8b00c1bd93131efe5a87b0eb337bd9ba | ORPH
   armeb     |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/0a23e83250f2ffe7f564480c7381a76a122b7948 |     
 powerpc64   |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/94b7afc05e54dd0f13a098555400d6b89f08e3ba |     
powerpc64le  |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/158d28d2f134d4de9f5decf03af74e141a128ff8 |     
  powerpc    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/4e9d8892691167823573e8de093292e3265f2131 |     
   mips64    |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/daa0dc5aca5e0352e7782f1c42298cb3fdaff3a9 | ORPH
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/3853123f68f955efc6b5de44bf90bd04a80c801b |     
   armeb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/edb174ea506b292f2b3928ff8e93c151faa7e191 |     
   s390x     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/1ae07fd1905b674fa786c35bdfaf72b1ab1f0180 | ORPH
    mips     |         linux-6.14.10          | NOK | https://autobuild.buildroot.org/results/a6b9f10cc6c045e28793258374d5a73959726563 | ORPH
  powerpc    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/87c4ee4159438fc0f0ca9453ccb0f698e6399c1c | ORPH
 microblaze  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/9390eb28aa85b2dfa1a2ffd070d806a5e8188925 | ORPH
 aarch64_be  |          tini-0.19.0           | NOK | https://autobuild.buildroot.org/results/def1781bb02cbbfbfeac40ef856ca2a7e5250514 |     
   x86_64    |           uftp-5.0.3           | NOK | https://autobuild.buildroot.org/results/4c2ab2f9ce5a1c98b1e3077008440d697d9d0393 | ORPH
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/7abeb1515b8911872393b705dba7bdec013ca422 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/01ff77d2cc3d78ea20866be00aea686f744305cb |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/c6e569cc4b4f9d13a45fa06f5fe2fa78c2cd0a6a |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/c923e7630a86921abb475bf4bcb94092c476f38d |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/e25feb1ca96e20199f5dd59e0c8780d6a28303fb |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/631e06acedfd599a9f30c6afb568f7b2e527d0a9 |     
  riscv32    |            unknown             | NOK | https://autobuild.buildroot.org/results/8bfe50c88fc5f79f77f9c0a2f5262efb6a5fa1ff |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/a6ca818821d9a8dc8784c28cbe647d084fd87ce6 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/e600bb49413fda241af6da094102c40708d90503 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/aca1d6d1e0b8f65892700f228c8ebbf687d2942c |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/8a574b850d0b535148981ed3842da7d27b5bd69f |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/9297d8f54ec65974a6b532418efa545223091c45 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/de5a3f2b16a6f5a1196c6885af36ae3abec18d10 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/f4bb5e0e73e6cb1013677e0cf23b4e1d6213549b |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/096c722a2e9ead5a573be651510a646fede6470c |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/250f0c6a0e194e6dad692bbc5a30e68fb0938b8f |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/525f095783b1934040f768d8c2aa8a4a4057e385 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/a454b2cf0866a08773d4badc84a6b269a5698821 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/a0e35e1d9e609be64c4e844e762a75a7c158a3ec |     
    sh4a     |            unknown             | NOK | https://autobuild.buildroot.org/results/25647af66edc7ead81e1a3f0cc430519b885d699 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/09b56065c4284d43bf7e2635e2602c2bc6d5fef4 |     
  aarch64    | ustream-ssl-68d09243b6fd447... | NOK | https://autobuild.buildroot.org/results/6415b8b4e3bd491a20f99d971a45ed289bfac2e7 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

             fluent-bit-3.2.10 | 1 
               host-yasm-1.3.0 | 1 
                  libnfc-1.8.0 | 1 
libuci-f3fc0b76040685829191... | 1 
                opencv3-3.4.19 | 1 
               pulseaudio-17.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |       fluent-bit-3.2.10        | NOK | https://autobuild.buildroot.org/results/92b40f2fdbe48fdab3ed45318f738a1562179c5f |     
    sh4      |        host-yasm-1.3.0         | NOK | https://autobuild.buildroot.org/results/d1d9a6e73c2ec278941dd90c6b07cce01b372feb | ORPH
    or1k     |          libnfc-1.8.0          | NOK | https://autobuild.buildroot.org/results/6da9eb35f3ed2df951246e42b4678d06bf6f2a09 |     
    arc      | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/78fa8f2bdc17ce236dcced8db8ed048a20bcef7d |     
    i686     |         opencv3-3.4.19         | NOK | https://autobuild.buildroot.org/results/8d1e8df399a821bc7b99692c724a7864e86140bf | ORPH
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/2d6031eabf36e8554975d1a821cff4715a777080 | ORPH


Classification of failures by reason for next
---------------------------------------------

               bctoolbox-4.4.8 | 1 
                    bmx7-7.1.1 | 1 
  gobject-introspection-1.84.0 | 1 
          host-binutils-2.43.1 | 1 
   host-bootgen-xilinx_v2025.1 | 1 
                  ledmon-1.0.0 | 1 
        liblog4c-localtime-1.0 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/cf1f148e659788db3f535ec2dbd3b09ac6083488 | ORPH
   arceb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/e4f1ccf4fe4565f85d51e9fd0603a2f99bdc8f35 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/a2749b70c8be177b9b75049be924aa894c54c077 | ORPH
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/68da1b4dbae1ed9d8ef1f3151f97530030f6429a |     
   x86_64    |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/3532ecb06d8f79dabef63431860f7e121c75c9e8 |     
    mips     |          ledmon-1.0.0          | NOK | https://autobuild.buildroot.org/results/cf6a9c2aef763fff2ebaaba9f032d52aa7dbe0e7 |     
    m68k     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/dad6c5ec4422131adc131d25d0113a6259c5088b |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
