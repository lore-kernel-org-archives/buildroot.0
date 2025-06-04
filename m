Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343A9C5AE59
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 03:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D288641C0D;
	Wed,  4 Jun 2025 03:14:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v3lrPuYAFh_N; Wed,  4 Jun 2025 03:14:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69E6E41C15
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69E6E41C15;
	Wed,  4 Jun 2025 03:14:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C237DA
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 03:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 319F541E7C
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 03:14:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j4n6eQ4GWb50 for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 03:14:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8236C40088
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8236C40088
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8236C40088
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 03:14:39 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ad88d77314bso1132575566b.1
 for <buildroot@buildroot.org>; Tue, 03 Jun 2025 20:14:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749006877; x=1749611677;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LPgYS/9aLjBOFFpFQ2JiJ1MCllSWPGMS4kr+QUEoRvE=;
 b=weoewSUcQnXoK9g+iAAUA6mT3sn8cPi8KTXTU0yboB1mHp70AFYzqlOUkI00qD/A19
 jyLILaVPpHSFlB3bzRAMXzthWXNo2MEJ57SMUHUU3g5ARDwdScxq60RkCRECBAFj8vly
 YBqS3hGoZvXlEJVjOcIdiIYU/6rRyAq/jLEqdf/lYOKDF1ERK/ZPGc8t4NX1azRp5NBB
 3d5iJC0ieYeZ2RHW53qanZooOFzBlLlu5FB7L9ErnROMJzscEHA0gqklwgqRRLZRowRc
 /WUROWZT94RtUcO1xipmql5mI70Fw/QdXKdwsCoY7K7y/ibge3y1Alv5B62bFtqSEXaQ
 Zfwg==
X-Gm-Message-State: AOJu0YwYAWKkcb3Yg3LvTwJc8OtNOFOBbrVcbe6XfxVrEAPA2iEn17oB
 K1DEfKMqGEw3GFIXuDq6lTMzhrP+4R3CxqVUW2/Q1HUogPcKNMQ7gA8oq6UeKw==
X-Gm-Gg: ASbGncv8OicjMJdl/LCTucuTrmpHwmXMnrYZ17Z2BeWX1ppYKxM3AKpI/P48nd1OH14
 PBwNNzGH9d5oXizB7f3BQl2IXVCxaM0jsoF1+hSs9X3XqPaspLld4g1YGTMphJXvkQZZPEZAFXT
 GbCaBu6p9PdkTE89KYqXPrgQGjED9Nlmd7dpoPpCda3JbT3YQcI2E+LfyxhG4SyAh0LGq9TpcSc
 LeQRbvy0lO/JHBAFF1aiISJt+tSxAMGvMURjRs/ll2nRiIYiNNbtNs7uSNM7DDbKiZUrBc1xOfu
 EwlLoI5YbuVIfthK8HOQQFr6rm7HuLYtYYdurLXUmd3QGNSGt7COWYE=
X-Google-Smtp-Source: AGHT+IFNfARKruifFeBBv1ilrJ63Zt2k4b8boWfiLBRNCDJp3okvYmxD2YXHWr8z8gItnIR5jSfgdQ==
X-Received: by 2002:a17:907:86ab:b0:ad5:43eb:d927 with SMTP id
 a640c23a62f3a-addf8d1ee50mr80546866b.23.1749006877226; 
 Tue, 03 Jun 2025 20:14:37 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada6ad39f08sm1049347466b.144.2025.06.03.20.14.36
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 20:14:36 -0700 (PDT)
Message-ID: <683fba1c.170a0220.3becae.88d4@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 04 Jun 2025 03:14:36 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749006877; x=1749611677; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=LPgYS/9aLjBOFFpFQ2JiJ1MCllSWPGMS4kr+QUEoRvE=;
 b=jll11SN0P2fvqEoC1G0VPcpU0sU8vGkPYXcy52x/VZ5g5+3EvtqpUAEMRFUP8fARw1
 hLMkzTp+ZpxG2UmkrqoJaDVWvHBe9lEg5f/bxAQoI+XjO0h+3WOfBWK424VAGnYyI6ju
 TtDLavIvUx9eBRM9zopqbIPZCi24aLDtTjYpsihnIUctjOlAD1/MD1+cIMBfhVbgCeIw
 6iPyHWB4fs6QsSjv8kh2Dz5XgkIgvk8CQXOPINrzUEqt0G3tYXHShM091b2ERPpfuTFA
 4Pwnfj5YXHaS+pUGdGX14myNSiFnUL76tjx7uOJTzixHWGNdOrafWyDZk+zgJS9nfnIT
 NK8A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jll11SN0
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-06-03
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

Autobuild statistics for 2025-06-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  6  |  0  | 10  |
    master   |  8  | 99  |  0  | 107 |
     next    |  0  | 11  |  0  | 11  |

Classification of failures by reason for master
-----------------------------------------------

                    bmx7-7.1.1 | 15
              libselinux-3.8.1 | 6 
                   avrdude-8.0 | 5 
          host-binutils-2.43.1 | 5 
               bctoolbox-4.4.8 | 4 
host-gobject-introspection-... | 4 
          linux-5.10.162-cip24 | 4 
             dahdi-linux-3.3.0 | 3 
                 libspdm-3.5.0 | 3 
                  linux-6.14.8 | 3 
               asterisk-22.3.0 | 2 
              dropbear-2025.88 | 2 
                 host-gdb-14.2 | 2 
          host-oniguruma-6.9.9 | 2 
                  libjwt-3.2.0 | 2 
                 libmbus-0.8.0 | 2 
                   linux-tools | 2 
                    mpir-3.0.0 | 2 
             berkeleydb-5.3.28 | 1 
             bmap-writer-1.0.2 | 1 
               catatonit-0.2.1 | 1 
               ebtables-2.0.11 | 1 
                elfutils-0.192 | 1 
flashbench-2e30b1968a661474... | 1 
                flashrom-1.5.1 | 1 
            gdk-pixbuf-2.42.12 | 1 
  gobject-introspection-1.82.0 | 1 
                haveged-1.9.19 | 1 
            host-binutils-2.42 | 1 
host-binutils-arc-2023.09-r... | 1 
    host-mender-artifact-4.1.0 | 1 
              host-rust-1.86.0 | 1 
          libcamera-apps-1.5.0 | 1 
libdbi-drivers-0bfae6c43134... | 1 
                liboauth-1.0.3 | 1 
             libopenmpt-0.7.13 | 1 
              libopenssl-3.5.0 | 1 
                libressl-3.9.2 | 1 
               libsigrok-0.5.2 | 1 
        ltp-testsuite-20250130 | 1 
              mariadb-10.11.11 | 1 
               mongrel2-1.13.0 | 1 
               openblas-0.3.29 | 1 
package/gstreamer1/gstreame... | 1 
                 pixman-0.44.2 | 1 
         python-remi-2022.7.27 | 1 
         s6-linux-init-1.1.2.1 | 1 
       shadowsocks-libev-3.3.5 | 1 
       sp-oops-extract-0.0.7-1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/d2f980fd206511ecc88f441a02067e17b3ff2723 |     
microblazeel |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/59df65452598696d53455204ec873d81713ef6ec |     
powerpc64le  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/b83ba2a4bee8d33b8fd539a71fb100e129add9aa |     
   mipsel    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/1ecf17996f895ddf22e3b5a5f704607b9c9fe564 |     
  mips64el   |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/113d9989c6cc9e7b860c5bd20b0703dcad92e178 |     
    i686     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/2fdd3764edbd80477317eea59f5ffe9a8756349e |     
 microblaze  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/52795fd6ab375916f37fec13fa8134463d38642d |     
  sparc64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/db25cabccaa57bc5f861dc0d755c6856911f9d7e | ORPH
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/e345978ba4bdac612c7a33a9627658212bd531a5 | ORPH
powerpc64le  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/48a0f4b5111eb93ed9a7cdc78d367be815d317a1 | ORPH
   x86_64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/8ad87c31e9fa1e35c2bd50e813a644404cef28ab | ORPH
 aarch64_be  |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/fda3a37254b40b18f3fbf730b6940b4f4064d29e | ORPH
    arc      |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/19eb903ad24ff0f068c04513205e613cb5b821c2 |     
microblazeel |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/70d7ddccc80b5350a0ecad81f7fa8c8027bdb239 | ORPH
   armeb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/e9d3b78ca076ee48904b49f8dd6c449d54dd213e | ORPH
    m68k     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/e6ce98438d46ad4b94f2981f1cd72864a4816cda | ORPH
   mips64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/33400395d2cb0d5ac0995400135a44bcdd0c5d21 | ORPH
    i686     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/2e98153fb2c2af39d34057d3e2b4bbaabfd99ae7 | ORPH
 microblaze  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/0e5d11d4a98169e835c167cd2e9144ad07097949 | ORPH
 microblaze  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/52c382a6aa88f11760ec1e7e7ee339b02a65e2f5 | ORPH
 powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/388d9a0e35887ccb8c368d4607090f2bf9132ad2 | ORPH
    mips     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/3d68cd20a2e2114eae6e88e8bba488596d137623 | ORPH
  sparc64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/9fd644ef420d136045a6ba90dfe83689c957939a | ORPH
  mips64el   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/ee7d8f298c55a8c2a1f7aeb64af4c295059b696e | ORPH
 powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/d8489b060aa8da48f08fde9ccb7393869ca92f51 | ORPH
   armeb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/d3e196c84a4c7b1d9ec76d07c47559465d866de7 | ORPH
 microblaze  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/7a2ef2f19c75da122f3ccb399c67b2f9127a6674 | ORPH
   mips64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/dbd18c75f6db0d017221f98c39f9446fa518f1c4 | ORPH
  riscv64    |        catatonit-0.2.1         | NOK | https://autobuild.buildroot.org/results/dd58c5e81545e67b15df3183be72c8bcf018f7be |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/5e00511b9b9dcfde1119c5f488a1df94b2745a51 | ORPH
  powerpc    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b4346dff8bf3fe31a39af1103ca29c91bc956620 | ORPH
  powerpc    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/d2bc06613abf8db0b0ba3f61de8132d99e0264a5 | ORPH
    i686     |        dropbear-2025.88        | NOK | https://autobuild.buildroot.org/results/bb9dbadc8095bf5ca11f33b6290726f7daf59f47 |     
  riscv64    |        dropbear-2025.88        | NOK | https://autobuild.buildroot.org/results/72a576523e9028d54e53042d63d86f1a7e164dcf |     
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/46ff7e813bcd5f2deb7ac12649ed1bd78c3f6991 |     
 aarch64_be  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/7577521e323fbb37968c8a6d42b6a58088e504f2 | ORPH
   mipsel    | flashbench-2e30b1968a661474... | NOK | https://autobuild.buildroot.org/results/788ffc0018c05f7363e7c99a3b396d6461501075 | ORPH
   arceb     |         flashrom-1.5.1         | NOK | https://autobuild.buildroot.org/results/a7afefa417fa78dd2a9729a0d1b86848d7614bfc |     
   s390x     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/eb7fe8d5eedf3e4c865f9ba809862d4fcec18b00 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/9e5522a747b10eae838b0ca9befd896b524b2439 | ORPH
   xtensa    |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/177a6392c5e619c70460cf3f6cec681d8baeac56 |     
   x86_64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/d8033671992bfcf8e8ff8a079ee0b717b36c2e72 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/899067d0760ef419d90f8f22ffd98b466b1613cb |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2c5edc573e16de3ceadeded680e837f89f4e0a1a |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/61b8eca12d562cbc366c3740e14113cf92edee19 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/70b1993d2441213a895bd385c8a74c743b2805f2 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c5a5c9fab0b78c08a8e3a7d0739e84bfe60fc067 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/3d77138b050b645d7fe53033ba5abd3586ddb8e7 |     
   s390x     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/c878e5420a26daa21c1e3af72d5eb58077812108 | ORPH
 aarch64_be  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/5c9dc9d6320c3dec75e42b9c03c6f22404077fe3 | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6ddd67d831cf23f7097d6d990c4baa44b791058b | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bc498886ba630715920403c330fb1b12cfcb72e1 | ORPH
   armeb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f4f95a5dd749ce9768d9a951ef1eae536d630163 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/19ef82d5b1f96c51a8205cc5558c50f18f55abd1 | ORPH
    arm      |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/3bd2d053ce7db33972f20424d5ac17ee434b6970 |     
   s390x     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/abff299be884df65c1e4f9fa66f17e63036467bd |     
 powerpc64   |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/156afd0e9e00655e09f39af077414c55f32ea159 |     
   x86_64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/dc8dfe5eaf00d96a846ffb389ceebeeb2cb81cff |     
  sparc64    |      libcamera-apps-1.5.0      | NOK | https://autobuild.buildroot.org/results/381fdd69ef7020df8d5c99096ea9063ab53ce492 |     
 aarch64_be  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/5e65bf13a57836334ab24b37847a64846b6b8dbb |     
   x86_64    |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/36c0352e4ac0992f79719fd13bf25f5a98434e6f |     
 aarch64_be  |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/5b88799d4bee5e4735fd7d4f70295ba3e90c1532 |     
  sparc64    |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/5bd5d44bf9682baf20133f2fff75008b5b6aa36d | ORPH
   armeb     |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/9a2a0f9c4e6e77626eeed3317eefb409c1b559ba | ORPH
    arc      |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/2abbdd7a49c08cfd56a478243551eee82bff1822 | ORPH
microblazeel |       libopenmpt-0.7.13        | NOK | https://autobuild.buildroot.org/results/9858decf1435a0235d90797fec632cd80a316a94 |     
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/9482a4ca38c010ddce52ab84ad1b3a7c62e4728d | ORPH
   armeb     |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/e4ec8d1178f1249615e5853b74ce5f0a4c4a5723 | ORPH
   mipsel    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/bc35ee88d36b3ac5d98ea6ce0a47dabf11e0c9ee |     
    sh4      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/b792a887c894af57845a1e1ba779fd0b4aa92bc7 |     
 microblaze  |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/6211fe73d4dff39cc1535ce492708cf816382ea3 |     
   mipsel    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/99ed27daaa038d7ccb096db764266b1fc83dac37 |     
    i686     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/3a312aa10ef42cb7a112a9ec5b7a84ad09167207 |     
  riscv32    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/a2ed4c9e4e2d3d12b9a8a84b4ede3bda8211139f |     
microblazeel |        libsigrok-0.5.2         | NOK | https://autobuild.buildroot.org/results/2935c6a3641becff0aba0eba4e1501db6314b1db | ORPH
    i586     |         libspdm-3.5.0          | NOK | https://autobuild.buildroot.org/results/545c353fb616e8b0f36698cf9faf2695fc41d6bf |     
    i586     |         libspdm-3.5.0          | NOK | https://autobuild.buildroot.org/results/2127f08850a3b46feb6aeea9df67959ae3e2551b |     
    i686     |         libspdm-3.5.0          | NOK | https://autobuild.buildroot.org/results/81b24a760f819a33ada32d1382eaeda21c5036fd |     
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/3956fc524932828101c0d5077b5de37b7904bec0 | ORPH
   x86_64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/6312567b6f08c5874d1b8006e1ce8bd63f6e87e2 | ORPH
powerpc64le  |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/95883d5d12437af2107d3c64e837a8063d124d48 | ORPH
   sh4aeb    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/1bc886185c8769744912284b4d4906cc929ad07f | ORPH
    m68k     |          linux-6.14.8          | NOK | https://autobuild.buildroot.org/results/ed0619de7601b41104e4ff6dddb458a62534cf01 | ORPH
   x86_64    |          linux-6.14.8          | NOK | https://autobuild.buildroot.org/results/c45a7591bbe5f57270224a33d8e74b96d8abd11a | ORPH
    sh4      |          linux-6.14.8          | NOK | https://autobuild.buildroot.org/results/9164270a904b30cb74ace2834edc24559ec3b100 | ORPH
 microblaze  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/82a68450e1b687dc3c3770c36386ed1b19e586ff | ORPH
microblazeel |          linux-tools           | NOK | https://autobuild.buildroot.org/results/8cc0f59768ef9078db79838196efaa8b50587beb | ORPH
   x86_64    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/ffed21a9b5dcf0ffdd0d263b6d34375f7524e888 |     
   x86_64    |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/9618fc7230fb9431667e86f9d4323fad5faf1f9d | ORPH
  aarch64    |        mongrel2-1.13.0         | NOK | https://autobuild.buildroot.org/results/66bc23a97debd6979093c4de08dc92738431d5c0 |     
   s390x     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/90334ff9cc2e23888183853267f493a48ac31387 |     
   s390x     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/e6ba65d49390b865e24fd6c287884139eb739cfd |     
   mips64    |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/63fb67cf7d2c90f025ede994b62301d595d64823 |     
   sh4aeb    | package/gstreamer1/gstreame... | NOK | https://autobuild.buildroot.org/results/a19cceb91a3340ad43d387f1697257c1e128ca42 |     
  riscv64    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/57e64ca56860d9cfebd1ef6ad9602a81d4b7d8ee | ORPH
 aarch64_be  |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/82a9dbe1866cec353813cda7512c6745f922c981 |     
    sh4a     |     s6-linux-init-1.1.2.1      | NOK | https://autobuild.buildroot.org/results/ab07bd9006f1ecd84737d03add99447aa27cba43 |     
  aarch64    |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/691b43d80e38a2cd4c3a8f184bfa8172a52ec338 | ORPH
   sparc     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/ffc9b30b8cf7cc4a93be5d6cf11bb54c1166da27 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

             bmap-writer-1.0.2 | 1 
                    flex-2.6.4 | 1 
           ghostscript-10.05.1 | 1 
              netopeer2-2.1.49 | 1 
         python-remi-2022.7.27 | 1 
             stress-ng-0.18.05 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/5cda3a3ed49f370d300b9a61745f07e46d3ee6c4 |     
    mips     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/7b33272c1281a8a8e58260c8c9c71880db5bd4d7 | ORPH
powerpc64le  |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/c0948ba08244e4e70b1bfcbc61c173581a218383 |     
  sparc64    |        netopeer2-2.1.49        | NOK | https://autobuild.buildroot.org/results/50ce663ff7dcec6518c873482129cb1047cea4f8 |     
 aarch64_be  |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/9499452055c19109291bb85efee240a5bf0cb2f9 |     
   sh4eb     |       stress-ng-0.18.05        | NOK | https://autobuild.buildroot.org/results/c7124fa9190c85204354da1e411cb41a62797012 |     


Classification of failures by reason for next
---------------------------------------------

        gmrender-resurrect-0.1 | 1 
          host-binutils-2.43.1 | 1 
              host-rust-1.86.0 | 1 
             libargtable2-2.13 | 1 
              libselinux-3.8.1 | 1 
libuci-f3fc0b76040685829191... | 1 
          linux-5.10.162-cip24 | 1 
                    mosh-1.4.0 | 1 
           oath-toolkit-2.6.12 | 1 
               pulseaudio-17.0 | 1 
                   wget-1.25.0 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |     gmrender-resurrect-0.1     | NOK | https://autobuild.buildroot.org/results/b1037aaddc428f2f9b68ff973ea8fb43082b65b2 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a7f1bc379dbc5fe3e712838000fb6780d191dfcb |     
   armeb     |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/36f4d757cc084404f7a019172641718dc55174c9 |     
  sparc64    |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/c8dcb35a23df0c885c7a0f00feac651db32cee7d | ORPH
    arm      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/613efc5e689558e9264a3e0a68117ef5e533896a |     
   arceb     | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/05ab088b5a38f5f7f369c0c2a6076b4fe913d0fc |     
    sh4a     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/c15e80c7be64c8f861086d8cace4444f6ff66ca8 | ORPH
 aarch64_be  |           mosh-1.4.0           | NOK | https://autobuild.buildroot.org/results/cce210f9b4cb417112faba740f9d5446038e8a5f |     
 powerpc64   |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/5367578e829dbc1fe15103f4accf70f58c049c13 |     
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/7c9cb9fed475d15fa2dd5dd6483cbb31d617b542 | ORPH
   s390x     |          wget-1.25.0           | NOK | https://autobuild.buildroot.org/results/4d17a9600f1d15b7f67b9c6ae56fd9948d4debc6 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
