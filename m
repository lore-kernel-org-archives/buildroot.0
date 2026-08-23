Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF3A3C5DF81
	for <buildroot@archiver.kernel.org>; Sun, 23 Aug 2026 03:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED9BA80EB7;
	Sun, 23 Aug 2026 03:25:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tSB-tMXaBuAn; Sun, 23 Aug 2026 03:25:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787455546;
	bh=ATrVIOKAHzNAgM6QKRLKvkseHpT0VvRKiziooBFInYw=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=inrdxw+qgSXHmCXW5Yz8G6q8HmNlSSzTCcZmFuuGslFhxRUCy1SqmrMAm03gQRajY
	 qPYhU96QNNA0sa3ZhJ5FUr1Qzsd1WMJ3tFMMI3vlDv8ieoGduge7A4TFz59L9vg4Zx
	 4MMyp4/4HNBkCzhOvX15LS3paixxi35TD1R0BW0nWuuAMttk+QQwQ25r36FS/L2qii
	 iRsdRT+QYaondHTERvx0mCeTRbYbIEO/aYA195a3nVfGvaDsby9jhvRCYl2yEvEbN+
	 0pCRML75HmPp88+pRBnAqTWQo5/VF6AX24uKsv5ri9+073p6mwpe1rnq44cc5tsJpK
	 cU/cE05880eDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F36280E90;
	Sun, 23 Aug 2026 03:25:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 74118118
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 03:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A55340184
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 03:25:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id shqgfJxwiTfB for <buildroot@buildroot.org>;
 Sun, 23 Aug 2026 03:25:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=bPHAKrYi
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CCCF940085
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 03:25:43 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-69c600f76ccso3954581a12.0
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 20:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787455541; x=1788060341; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=XRyZUt6TU+MImp0Ll1+fRRwJOmHe/f0wii7UJgB0hrA=;
 b=bPHAKrYih1j0oakznlVhCa/lle0ERk5fp5TLl82rBBAJYVOzqDlhxVu8A5j4y/42QF
 eqTwhGGLPMhEWEu344c8hChMYAbDC1+0EWXsFmupvI1haqbbEmMKaOMXJcve2b1W7uCE
 Nm6NH0K5gM7d4Dr2rWvUgL9Wgjs9QXupn4ZgEfcchehg5mBVv1XMzrfwMmgFPTjcwY8K
 5+c8ObLTfew0H1xn3uXT3/4B4ADdvH9DO8QYVAl/cNb77vLJFYebcstvSLPU9vP/K/YW
 ixL+NaHwhfTPYsxHfwdxhI2A3G5l2litPfwLfDl+EgpIsXxnxeYRS/QFRzzWJEjU/7hT
 wGjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787455541; x=1788060341;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=XRyZUt6TU+MImp0Ll1+fRRwJOmHe/f0wii7UJgB0hrA=;
 b=VVqnTZhrfVHX7BlzTxdpHiiOOfwq3ZLM59hvB1bmjfSwCP5LV1NKH4weexsCjQBwL1
 SdbIf6fPwgcgZHe8KyxwLEol18YVPCHQxxm/JjcR5SAIDXfLXGab687nk38Q3TBpjItp
 e5BGWsirpNY/gXrleAT8zu9X5A2loxn4tLAP+qNMQOpfnOG/7BktqFMj5Vz/OTEBB2m1
 ZM8EqYzP3ikYatdGF69+OJuDluZ7hdbnva2RPKTKvgd8rYb9Yi0wYj43TTCFyYJyarGw
 U/MkjaMa0V9mCZcdrktC1fHMO5yHKWXqIEEloVRf14biiFleLKvPIJeMe0zShodG/u7C
 zzBw==
X-Gm-Message-State: AFuF++lltrM1NJmmyVGQj91+EymzA5IFltCe1xQFpEiqtavnzurOwhMw
 6vn0c9elPO4aPkm7QsWX9W2yOJ+Ulq2kaVy0WuSrm7tI4nZ33fmLtPelCUBVNVx8
X-Gm-Gg: AR+sD11GvEraXznnIuq15auEvwq+goeHMG8fyi7f/O6sReOu6w1iqz9avTjHUINiKlI
 AjrOQVx0jKWlWcUwtIAUjLqAxd86CQIKOfCsCIsdu8TyzKpJGolZaF7bzcV26mLrWU6ozNCjclo
 v3/5DPIJiCTo3WsLVz4MxNzzCq5I4mfPirYA30g8U7yZAqgy3YAJBH0pYCXUdaMosTuJoeukkoR
 vgPWEvYhTtoXkdwKx5L6cLdf0X9TlJbiEM/K3E937j7qVzEUzsKFZSpr00T2DcbpTAMDuUFOOc5
 b6hOrbS3Yktk81Wv/MdM+8HRKI4bz3qwGfBcXEXlaHoVW9Alkcnd1I6/ius34uF0vG0BQHqffD4
 vPcSxU9ofHAZYTeCyLip8VxKbx+s0A0sOMBRLvpV+DhzQ58qi1FrqNKZc6RiW5PMgF3XpEMNjRt
 h8hyKWyRUQuzG+k07i4+66DGOnjEClVahakxKPj3g28aIEBBNpR2/qqOdjAIw2gLc=
X-Received: by 2002:a05:6402:320c:b0:6a3:fdb0:c374 with SMTP id
 4fb4d7f45d1cf-6a42f2054b1mr20298149a12.13.1787455540903; 
 Sat, 22 Aug 2026 20:25:40 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a59e1c3003sm1009978a12.23.2026.08.22.20.25.40
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2026 20:25:40 -0700 (PDT)
Message-ID: <6a8a6834.a58ff27b.14000b.cd53@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 23 Aug 2026 03:25:40 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-08-22
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

Autobuild statistics for 2026-08-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  6  | 17  |  0  | 23  |
  2026.05.x  |  2  |  6  |  0  |  8  |
    master   | 23  | 45  |  0  | 68  |
     next    |  2  | 13  |  0  | 15  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 4 
  gobject-introspection-1.86.0 | 3 
              host-rust-1.97.1 | 2 
                    olsr-0.9.8 | 2 
                  pdmenu-1.3.6 | 2 
            18xx-ti-utils-R8.8 | 1 
              asterisk-22.10.1 | 1 
                    attr-2.6.0 | 1 
                 avro-c-1.12.1 | 1 
azmq-v1.0.3-54-g819b24035cf... | 1 
                  bcusdk-0.0.5 | 1 
                cairomm-1.16.2 | 1 
            cairomm1_14-1.14.5 | 1 
                  clamav-1.5.4 | 1 
                  cmocka-2.0.2 | 1 
               collectd-5.12.0 | 1 
        edk2-edk2-stable202602 | 1 
              erlang-26.2.5.15 | 1 
                   evemu-2.7.0 | 1 
              gcc-final-15.3.0 | 1 
                           gdb | 1 
            gst1-libav-1.24.13 | 1 
       host-gcc-initial-16.2.0 | 1 
               host-orc-0.4.41 | 1 
                 host-tar-1.35 | 1 
               libgpiod2-2.3.1 | 1 
                libxml2-2.15.3 | 1 
     linux-5.10.254-cip72-rt32 | 1 
         linux-headers-6.6.152 | 1 
                 mtools-4.0.49 | 1 
                    ncmpc-0.52 | 1 
                 openmpi-4.1.8 | 1 
   openvmtools-11.3.5-18557794 | 1 
rtl8821au-bb26b6b06c47b79c1... | 1 
        s6-linux-utils-2.6.2.1 | 1 
        wireless_tools-30.pre9 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/194c67a845e5abf058129228cfe952032d83cca8 |     
  aarch64    |        asterisk-22.10.1        | NOK | https://autobuild.buildroot.org/results/625c1e7460b39e2befde6ea47ae47f83720b0876 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/07fd4d47cd748746c6bcf33762919f984c821385 |     
    i686     |         avro-c-1.12.1          | NOK | https://autobuild.buildroot.org/results/4b3ffb0b936e890f686b78a88e68eb59248370b8 |     
    i686     | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/9e4f3aada047cc4e6a02a3180766e0dd32ff0e76 |     
powerpc64le  |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/aa4261e8bdf58e39550e90846c680aa7fae336d5 |     
    i686     |         cairomm-1.16.2         | NOK | https://autobuild.buildroot.org/results/4e880d2e4d73f5dab2d0c17b65bc25b5ccbe23e3 |     
    i686     |       cairomm1_14-1.14.5       | NOK | https://autobuild.buildroot.org/results/1c85432213dc037c220b57bc123eac2df2938868 |     
    i686     |          clamav-1.5.4          | NOK | https://autobuild.buildroot.org/results/b9359c5c177f3e4bcef991cde3c2dcf412dee5de |     
    i686     |          cmocka-2.0.2          | NOK | https://autobuild.buildroot.org/results/bd1cb49c5da604d7f16a8547a806c10f5bcfcd7a |     
powerpc64le  |        collectd-5.12.0         | NOK | https://autobuild.buildroot.org/results/07436cbd891e1e9caf3abf6b100afea09770a763 | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/e9729e5552b4d8bc713da835f653415a9816e1a1 |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/755a0e7516d3cf7c494b7bfce75f3832f85b6c87 |     
loongarch64  |          evemu-2.7.0           | NOK | https://autobuild.buildroot.org/results/33299cbed93604b540d78b674cd6d3bf19bbd6fa |     
  powerpc    |        gcc-final-15.3.0        | NOK | https://autobuild.buildroot.org/results/46d435c9f5086a8695f4f6cd4026bb0d194de13c |     
  aarch64    |              gdb               | NOK | https://autobuild.buildroot.org/results/4612b5d0bb1ec31b3bb3b0baf56d0eccda5ed1b2 |     
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/3bc977cb06a0effb25d8a81d2994d327fc8dbb14 | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/31325a5f4bd39fc2e2e0149234527fd00122a2c6 | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/91a5698cab640e523c223b77fac8ec2747f98ce8 | ORPH
    i686     |       gst1-libav-1.24.13       | NOK | https://autobuild.buildroot.org/results/e48bfd4f6cc9e650f4564ae6fab16a9d4eb527fa | ORPH
   s390x     |    host-gcc-initial-16.2.0     | NOK | https://autobuild.buildroot.org/results/b0518fa3402a866e2d117fb856e977bb760fcc71 |     
    i686     |        host-orc-0.4.41         | NOK | https://autobuild.buildroot.org/results/3b08ecd99fd0eab2da3777b07b2947237ce23a88 | ORPH
   x86_64    |        host-rust-1.97.1        | NOK | https://autobuild.buildroot.org/results/539a3de20a4dcb0c0fac8cbaea40a2c1e1d48dbf |     
   x86_64    |        host-rust-1.97.1        | NOK | https://autobuild.buildroot.org/results/c10f960f11db7594ba0b5b97bdd59675ec068422 |     
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/80568ebaaad3000adbbd6f60ef91a19f44bd7a25 | ORPH
    i686     |        libgpiod2-2.3.1         | NOK | https://autobuild.buildroot.org/results/2921e55a23a1b9c9e2ec33c3ef6db54770b92cbf |     
    i586     |         libxml2-2.15.3         | NOK | https://autobuild.buildroot.org/results/80ce2a1b8ec356dc13e3c51474fe4cac9cbe3cd6 |     
powerpc64le  |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/027cb740dbb6f127bbaf034680863fe95cc67e84 | ORPH
    i686     |     linux-headers-6.6.152      | NOK | https://autobuild.buildroot.org/results/f51b9302355a1bb45fb81b6b64bd65dfd2a3ed89 | ORPH
    hppa     |         mtools-4.0.49          | NOK | https://autobuild.buildroot.org/results/37523b979e55d9e8e464f7df330466232a8b0908 | ORPH
    i686     |           ncmpc-0.52           | NOK | https://autobuild.buildroot.org/results/f31f646694ed83822d6a97523fa3a1fcb8b040b4 |     
  mips64el   |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/0bab2a9185df94f5495b72d5a3776640b4c58003 | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/a7b17ba73ad18c2b0dbc9729b6bd4dc632c4460d | ORPH
    i686     |         openmpi-4.1.8          | NOK | https://autobuild.buildroot.org/results/35ed105e61d43744b5c08cb1a579ef8bcd4538b3 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/08aa729708c171a7fe36dbf1a92aa46a154b727a |     
    i586     |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/06cd35a6b3b6376a0c8c3453d085c77f87d54e14 |     
    i686     |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/def74b04cc05a21cfc8dbe756c9abfca1a36003e |     
  aarch64    | rtl8821au-bb26b6b06c47b79c1... | NOK | https://autobuild.buildroot.org/results/d865a2c49cbfe7b8dff3ae6606ca80f767972f4a |     
    i686     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/20834253b1b6681eeecdf3f0d9fbbcf38c387df5 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/5dc31fc5744c502856426d800c1103520bf0ecea |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/2f270c0f73f6743dcaffda3c871036b85a363619 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/83f06ed11619823c21cad8464579dd35bd86dda9 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/66400565c115c9274282d27289d9dee18f9b8185 |     
    i686     |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/8e0e16cb52cabfcdaeec49e0d2ea987e38f2fa24 |     
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/61f226627e0ef7fec5033b913a459493a6a6b3cc |     


Classification of failures by reason for next
---------------------------------------------

                 avro-c-1.12.1 | 1 
             dahdi-linux-3.3.0 | 1 
                drogon-v1.9.13 | 1 
                enscript-1.6.6 | 1 
              erlang-26.2.5.15 | 1 
                   exim-4.99.5 | 1 
                    fcft-3.3.2 | 1 
         host-xorgproto-2025.1 | 1 
                  iozone-3.508 | 1 
                 libv4l-1.32.0 | 1 
                openssh-10.5p1 | 1 
               pcsc-lite-2.1.0 | 1 
                   perl-5.42.3 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         avro-c-1.12.1          | NOK | https://autobuild.buildroot.org/results/5e48cb4bf7684e1866f366ab6a828ca0c646e7c6 |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/88a2c90b306accf6d06122a8aeab0584373dbd6a | ORPH
    i686     |         drogon-v1.9.13         | NOK | https://autobuild.buildroot.org/results/f4d100a9d90c0ef202926c983dc59b910d5a5b6a |     
    i686     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/bcd23e0d0ff56e71ac9ccea94dabee87ebb79ffb | ORPH
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/e379171211d2394e8543aed2e9aaa38e1c4b9c55 |     
  riscv64    |          exim-4.99.5           | NOK | https://autobuild.buildroot.org/results/38af2640677c90a9bcaa266edc44cc9f37c94167 |     
    i686     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/e4ec202670e4246de00e4db45b51930012ab1a0f | ORPH
powerpc64le  |     host-xorgproto-2025.1      | NOK | https://autobuild.buildroot.org/results/bab6215b321a8327dee2314b72fc703c0b8f3969 | ORPH
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/ba00ea6c5048ee293fca7c93d7c600d162e0cf31 |     
    i586     |         libv4l-1.32.0          | NOK | https://autobuild.buildroot.org/results/bb9ec5257e8ef8e4ed16b2b953428ebd83e965cc |     
    i686     |         openssh-10.5p1         | NOK | https://autobuild.buildroot.org/results/d6da6bcda120269da135c73ee45f0cfc87ce8123 | ORPH
    i686     |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/680498f35d83f50e0487d04ae259151aee5f4213 | ORPH
    mips     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/cd25fb25036de86234bb7e34877c5395c7c138dd |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            18xx-ti-utils-R8.8 | 1 
                  linux-7.0.14 | 1 
               llama-cpp-b8117 | 1 
package/vim/vim.mk:88: host... | 1 
python-remi-2022.7.27-37-g1... | 1 
                rocksdb-6.20.3 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/732664dc010068d908ecd3180a95923ee033f33a |     
    i686     |          linux-7.0.14          | NOK | https://autobuild.buildroot.org/results/fbe0c37e4f11a7e93ed5ed42f9b1a09ae8ec77ef | ORPH
    i686     |        llama-cpp-b8117         | NOK | https://autobuild.buildroot.org/results/4d1e1167a0e91f804e7c99a8a0312bfb91f83adb |     
powerpc64le  | package/vim/vim.mk:88: host... | NOK | https://autobuild.buildroot.org/results/ed09cefd19144e2b20eaceb04f4f489413180f05 |     
powerpc64le  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/908033f2ed4f93d80408875ee1a164795c118dde |     
    i686     |         rocksdb-6.20.3         | NOK | https://autobuild.buildroot.org/results/4eee6d9ca523a7fd2ef0d8b71643bfadd9ea4733 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                   dante-1.4.4 | 2 
             fontconfig-2.16.0 | 2 
package/linux-headers/linux... | 2 
          cryptodev-linux-1.13 | 1 
    host-gcc-bare-metal-14.3.0 | 1 
      libabseil-cpp-20250127.0 | 1 
               libdeflate-1.22 | 1 
              libgcrypt-1.11.1 | 1 
        ltp-testsuite-20250130 | 1 
                     mdadm-4.3 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
               procps-ng-4.0.5 | 1 
rtmpdump-6f6bb1353fc84f4cc3... | 1 
              skalibs-2.14.2.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/bf25939651ddf8f6cb56bce0053f053c77fdd531 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/0c76e81cfd9edcb0e0c2f0861fe8826da85fc8a2 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/37a06581c8f0941907c78e76ad231c679f00878e | ORPH
    i686     |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/96b57c09a501877208f6bad1770901bf4dbd8b5d | ORPH
    i686     |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/bd093c28e6c3474e77eb514cd432524448f2ce44 | ORPH
   s390x     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/1d157862410c31b721d97ac3baeab44b1c041f57 |     
  mips64el   |    libabseil-cpp-20250127.0    | NOK | https://autobuild.buildroot.org/results/5065bda3b91bdbee53559dd97af8ab5a63a1e112 |     
  aarch64    |        libdeflate-1.22         | NOK | https://autobuild.buildroot.org/results/9c416952647075644a71f5c45ecc3c17a69d4a4c |     
  riscv64    |        libgcrypt-1.11.1        | NOK | https://autobuild.buildroot.org/results/ef115da4142f5c1506274334d9501f9e3a933c79 | ORPH
    i586     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/c252ef8c7dfd241c5dfd5143348d39770ac7d3f7 |     
   s390x     |           mdadm-4.3            | NOK | https://autobuild.buildroot.org/results/3dc93c566481eb3a2f89de3f8c3d7b1d9f71b89d | ORPH
  mips64el   |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/ce980b06e49763f3b4d0a578d0f926ead9be223e |     
    mips     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/f8422a01ad4f78796e557957e8b0c4700d46690a |     
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/0496b3c2fa66cd4f667048e6dcb18e3984402a37 |     
    i686     |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/904db38524e51d7301816ebe1a27b437fe0c1fdd | ORPH
    i686     | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/1eb6e444238fcb7af04c503e6014afdc91d36ade |     
  riscv64    |        skalibs-2.14.2.0        | NOK | https://autobuild.buildroot.org/results/1f01d4ad84e12500c16f783223c0a02887779d17 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
