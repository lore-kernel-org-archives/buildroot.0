Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B5BC2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 08:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33A4683AD6;
	Sat, 17 May 2025 08:51:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kzd1dGOUQrtX; Sat, 17 May 2025 08:51:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AEC583A89
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AEC583A89;
	Sat, 17 May 2025 08:51:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 35B051DE
 for <buildroot@buildroot.org>; Sat, 17 May 2025 08:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26CCE83122
 for <buildroot@buildroot.org>; Sat, 17 May 2025 08:51:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Su1g-HP6cefd for <buildroot@buildroot.org>;
 Sat, 17 May 2025 08:51:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1D9FC822D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D9FC822D9
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D9FC822D9
 for <buildroot@buildroot.org>; Sat, 17 May 2025 08:50:59 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso20409455e9.2
 for <buildroot@buildroot.org>; Sat, 17 May 2025 01:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747471858; x=1748076658;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DmsTmZaeQp8/lK+GRKC/JTq9QNqbUCJVds4Er27P56M=;
 b=MDQuyRLv9+FHxL6lsmvdlv1PV5us1k3xkBJ79ck3pi7IRlFaQ7oMQe0W7sUYlsiwsR
 X3hem2phQRPpobbsdOf3WOhzBFNHHxMzGPEryd4GKLq6afdlneZXDohAZiQ84jnyzqKD
 ck+WDnWXu+LEg8T4zjgQz1Nrcc7N/6nQZQKtX4NsREgFkz460O/MVy0Ey9jYPI1WvDwi
 DMqtasUFc300fDFOIpiQlIWGDvJ857gstLUrul8oNIDfSIJndKlt8Ctn7uw/uYFV6wOg
 iUr+Cf0fvCpC4mvgFN9oRsB2Vpxi3xLti1osIHbz0Z5BEW2DQKa06X9yGPJ1t1tct1vk
 z3yw==
X-Gm-Message-State: AOJu0Yx8PmKWMvs9TW7Ix3avDakpuw1LRp3rLt3s/gAZFrjURLJhRa3z
 Az+PGJpYegts5vrUtkU2qnWD98s66gK/LU3yFuJXNVMWRlMlZyHM93V7guhIYw==
X-Gm-Gg: ASbGncudhgZIixzWa5YIvZ+1K+ypdiQhgWOsoVJmpGUmrnzaF6tjCTsDRRZpohIRTrI
 1UunD/+lHXqW2vnQi1itVQszHCOb4JOGn5gKbe9x/9awZXnwYjUgnMjpzZwkJwdinlx3MA/6AtL
 QnlEnIsIB8QeETebnsgL64OnxxMaFLflkfhNWxr6/VvCQZAMXsUHHOjVrTE33Eu32TMV2yPSMTJ
 NuIZ+4H8DTXy1QEQ7lVtRk72DCexFtgJEa93iorBWRVfE5ca7CJv9reqCbqFA77ZGSuVf83bEPQ
 EDvWxXIS9qKIjTGqV21EAbWLs8RiqQ32Snh9T1trDwcT8HryuQ5j5Bk=
X-Google-Smtp-Source: AGHT+IFATxQW/C5llLYw9AsV7lWTkxqGe+jXsWzma5LOcr7XqMpnmFebCO9wE05L9e+nnFg7upNdbw==
X-Received: by 2002:a05:6000:2404:b0:3a1:f937:6e70 with SMTP id
 ffacd0b85a97d-3a35c825b76mr5541859f8f.30.1747471857730; 
 Sat, 17 May 2025 01:50:57 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca5bd8asm5646488f8f.33.2025.05.17.01.50.57
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 May 2025 01:50:57 -0700 (PDT)
Message-ID: <68284df1.050a0220.359780.ea4d@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 17 May 2025 08:50:57 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747471858; x=1748076658; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=DmsTmZaeQp8/lK+GRKC/JTq9QNqbUCJVds4Er27P56M=;
 b=exvwA4Lepz7KZvMMH30DaaEldkoEQuPII0Q/zw6qOxPm6zMAGjcrwnwrE0GcwDSfXu
 cK6ouQtlD0KjDktb2+1FKkLU9MwyyVNfncFE55muFEqDUlkKPAahope+6aW/9CaXPzr/
 OXum5wheDrdzDJzPeuFLNmS0bGKa7rT5AQ8Wv7XJl3wUN+SnXMIfIU8ISPcqlXNxsDfi
 TxRyOrlUGcX0+EbVcLcXHUnxKPDC0Z2/WvpkzAPmJAZuqirpnicB6TPTYJsraKNgGHyj
 LxWcpzDb1Yjj3VHRbe5DPPrJkQQ87dUikudH/8nx6yUULncPE1WpVD3b+x1twpD3jWja
 BEmw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=exvwA4Le
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-05-16
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

Autobuild statistics for 2025-05-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  7  |  0  | 11  |
    master   | 17  | 174 |  0  | 191 |

Classification of failures by reason for master
-----------------------------------------------

                 host-lzo-2.10 | 29
            host-cdrkit-1.1.11 | 20
                    flex-2.6.4 | 13
          host-binutils-2.43.1 | 11
                       unknown | 10
host-go-bootstrap-stage1-1.... | 5 
          host-mariadb-10.11.6 | 5 
                    bmx7-7.1.1 | 4 
  gobject-introspection-1.82.0 | 4 
            host-binutils-2.42 | 4 
amazon-ecr-credential-helpe... | 3 
                  bcg729-1.1.1 | 3 
                elfutils-0.192 | 3 
host-binutils-arc-2023.09-r... | 3 
               host-vde2-2.3.3 | 3 
                      lzo-2.10 | 3 
fs/erofs/erofs.mk:69: /home... | 2 
        host-berkeleydb-5.3.28 | 2 
          host-oniguruma-6.9.9 | 2 
              asterisk-20.11.1 | 1 
               asterisk-22.3.0 | 1 
             cni-plugins-1.3.0 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
             dahdi-linux-3.3.0 | 1 
               freetype-2.13.3 | 1 
                    fwup-1.9.1 | 1 
            gettext-gnu-0.22.4 | 1 
           ghostscript-10.05.1 | 1 
glibc-2.41-5-gcb7f206537240... | 1 
               graphene-1.10.8 | 1 
               host-attr-2.5.2 | 1 
            host-binutils-2.44 | 1 
            host-coreutils-9.5 | 1 
       host-gcc-initial-13.3.0 | 1 
                host-gzip-1.13 | 1 
            host-libp11-0.4.12 | 1 
              host-llvm-15.0.3 | 1 
              host-rust-1.82.0 | 1 
              host-slirp-4.8.0 | 1 
 host-softether-4.30-9700-beta | 1 
                  jack2-1.9.22 | 1 
              libarchive-3.7.9 | 1 
                libdrm-2.4.124 | 1 
              libebur128-1.2.6 | 1 
                  libftdi1-1.5 | 1 
        liblog4c-localtime-1.0 | 1 
                 libmbus-0.8.0 | 1 
              libopenssl-3.5.0 | 1 
                libressl-3.9.2 | 1 
                  libsepol-3.7 | 1 
                 libusb-1.0.28 | 1 
                  linux-6.14.6 | 1 
                 nettle-3.10.1 | 1 
           oath-toolkit-2.6.12 | 1 
                 openal-1.22.0 | 1 
package/rust-bin/rust-bin.m... | 1 
package/rust/rust.mk:86: ho... | 1 
      passt-2025_02_17.a1e48a0 | 1 
                  prboom-2.5.0 | 1 
               pulseaudio-17.0 | 1 
rtl8723ds-52e593e8c889b68ba... | 1 
       shadowsocks-libev-3.3.5 | 1 
                    snooze-0.5 | 1 
                     unzip-6.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/3281c05ff5b98ab6381093076e4a8cfb5f9ff8b0 | ORPH
   x86_64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/4acb877d9f3a64f46080018654513303e2b6d96f | ORPH
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/500814bd122be6bcef7e620bf641b8212ba8d134 | ORPH
    m68k     |        asterisk-20.11.1        | NOK | https://autobuild.buildroot.org/results/f8bf37025b7ba84752adf8480144a132bf510a6f |     
    arc      |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/98f432b53161951aacd39405e373721419db4996 |     
   armeb     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/67cc93a69366a002307e4046f44dc88f1b7938a3 |     
    arc      |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/313dec0cb1a751c56e28860d30d6dc4559cb6a99 |     
   sh4aeb    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/5aa78ba4a7c94c995bada7738f36952921f8de4b |     
  aarch64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/969c73fb39eb14ad785e83ae4d39126f85081876 | ORPH
  powerpc    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/ed204c2adf7782c9dd533bae311733d2b3e4978d | ORPH
   s390x     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/0cc3b98e8d587ef9b27d53ad2228875bea4f24a3 | ORPH
    mips     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/82a6bc966ad850e7a1616a5aba902b06b1dcde5d | ORPH
powerpc64le  |       cni-plugins-1.3.0        | NOK | https://autobuild.buildroot.org/results/2aafaf0b443d3397bfe6cc86f93fe1a92e23adc8 |     
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/8e2d238d96ea226d6501a1e3636c8e686087f690 |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/452b0e9c7e5cde24f13edca7268e6131fa357420 | ORPH
   x86_64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/3f45ee91174753edb9ac86b65ce67cbea15b1030 | ORPH
    or1k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/338557f6ecfe91a65fb5292ea3bc61e348d7263b | ORPH
  mips64el   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/77c5398f79bd44f33f6b6e07c86e113dfd2e8f2a | ORPH
powerpc64le  |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/2c19dd759792fa8add40971ccf15cba51f330ade | ORPH
microblazeel |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/d000d8ef7438a5f4a9044dca93d1901909bbf641 | ORPH
   xtensa    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/c83f2afbcc0073f7b309631ec744eea40fad9b03 | ORPH
  aarch64    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/e7c3f00a0637d399108bd2f76ccab0c436b39987 | ORPH
 microblaze  |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/94ac94e775e9cfd13fdcad86cfb7f3caf352c105 | ORPH
  aarch64    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/af016cbb343342719b45095d5237286906a0cbbe | ORPH
   sparc     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/c5305b7aed6b00078befa4bd7f37e3c10a644241 | ORPH
   s390x     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/48c2ab518f2fc927a8847b62fb2846c70ea7c912 | ORPH
    arm      |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/0eebf11e3d860e2d224089f52e6da81eacad4b9b | ORPH
   armeb     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/7e3e618c43ddb8f67699b46761bb938d53e9fa51 | ORPH
    m68k     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/d785b1398b530f447ca64ddd048655d78af9595e | ORPH
   x86_64    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/564dce26b5a4c35a9c881185dd0f3c0a14477db0 | ORPH
    m68k     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/c772e259bde224fcaa00ee10b9f20f8f27a541fe | ORPH
   s390x     |        freetype-2.13.3         | NOK | https://autobuild.buildroot.org/results/44ff5b753dc67d72f165f466972a3d1133252984 |     
  powerpc    | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/b294379435a2abb5fa0da1c913730f14a3e3c7e7 |     
    or1k     | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/0f856def945b9a863f45f7a58553b62f6875720b |     
microblazeel |           fwup-1.9.1           | NOK | https://autobuild.buildroot.org/results/751b9ef7818b90fb4ea8efe9b3d5215df3f1b631 |     
   arceb     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/823ac3b8668e1af7a2a3bba29614d086bfb5aead | ORPH
   s390x     |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/f002ac328b9c00dcd089bca4a771bd631333879b |     
    sh4a     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/7cc0ae07470d636bb581bcd6a2ddf3c36c17c925 |     
   sh4aeb    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/c20cb6320d7294f7fdcf32aaf3c0c99f956f7f18 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/b0441095d437f7fd9cec71a7810e3cabac82db5a | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/6103a9512583ebfad6d08f538740317624c6e195 | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/36d8c7b0f7eefc5224cbf641a33965c8ffc1be9b | ORPH
   sparc     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/ecb4cc3a802a4517747e16065900ef96a1c161ee |     
    i686     |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/2cdccf5bba8db147b22dc5aa1b5b488541f21ac0 |     
 microblaze  |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/523240553b511c259919ce3831576a846b7d2b85 | ORPH
   armeb     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/9cd05dc2b85f8f8f3231bc07af768322e76f924d | ORPH
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/a1663e99e3ca74e3875f792c305183f54dc96a7b |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/1cb48d0766a0896885240eb5a5f0ac3b31655431 |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/52a320c5a74ae2ae4c7be0c41844ff76d28180f9 |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/fcf0b1f9b20c62eeb24317325f8265519190c71e |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/33c89b781990aff9b3a55630b384a08919c993bc |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/aefac059e3f211af9cca2e4fc78adaf5350e22f0 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4e26ec66da2914e5365bc46a76050af6041a0b9e |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/73d94a500e5ef226aa0891686b00efa2123e7654 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3f111e8c26ced6053d87fdf4e6aa3c85f704cf9e |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d1dee81059a8541a877e12d787f496a2f1cd7a53 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/76977c96d9791d690b2beb164d01fe858d50a8ce |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/126e476d45b0e2e88b3c47dd118fc22a91121b89 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/434bbda61cf747b2564b1934a1a73f9cb13e61e6 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5b26e9918d6ccf1902d2629959e043c28072e94a |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9c0b69c72171a46575a0095f6ad43cab262943b5 |     
   sparc     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/6dc31f93ba2752d638ae97a5644e453d1253d5ce |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/81587284895008a08054318ae07d0e2a0ff3c90d |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/8edf56df12fcccc9479553033a239b532c892e8e |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/082554648992922dd10d35a08314b08c512b18de |     
  riscv32    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/7c55d4dd2b1ed1aa7e4fcd19102370a9e57b1aba |     
    arm      |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/19848213fbf0f52a32d2181922c4189d0aa7cc6c |     
   armeb     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/8ec696b05a0410ea26fea26928ab412b7995cb16 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/516196bab988a9470a8147580a41d35918e2523f |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/70da1aa301bba74f209460518185e075df3f7b88 |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/9919913a622cbcdd0f99fd0f54294c9ba261cbd7 |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/14f637479a185558dbd5bb4459078c1ead39086a |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/249b411ddd985d40689a9f17dd200c6ce793f433 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/05d5e2c2bd93a7bcd00734bdb444c0a759c5f2d7 |     
    arc      |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/4d37f5ed60bfa36f2a96294ee144d772f6fa8386 |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/97cd21b2a61eabad5bd9b289ca3980aafd018df4 |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/87b8fb22fadade67f601d7d44e92a4e0e0d5e3d6 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/2913dbc2e187681bba751efb16dcdf002e535dd9 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/8c499c210cce57799c83960586c596026f9d34c2 |     
   arceb     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/6c64ed6fa3ff75955672c4f0b01c7592eb980251 |     
    i686     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/fee1e376e099b04d6b6f9bfb10142ac5a4feb0a2 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/bbb4009c34f88b059b62e0a8afe68e1d8177ff8e |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/db314cd077e39fd51c54f99522de716afd703c78 |     
    arm      |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/17ee5be8dc7238a75307dddc767ce09dce3be085 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/c444e5118690a67558c40524e9c8d7b7fd02759f |     
microblazeel |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/dcc7d8f9b79e769bf526bec1e6fe5b3153392e7b | ORPH
    arm      |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/f37b03dc47da8f54c583b33cac960daeed72c29f |     
    i586     | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/e0bace5c6f2a70b760de43821f515fc5aca74235 |     
   x86_64    | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/ee8c6596ad4c4be29a7a2674afae94022fe32fe9 |     
   s390x     | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/839aa176714add89b63eb03db38b11aec20c7c66 |     
   s390x     | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/b8479e0c5d1a1156bb39641df4083f6820e08a61 |     
   mips64    | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/2c19ece2268394f7331e93ffc0d7c824f5d56cd7 |     
    or1k     |         host-gzip-1.13         | NOK | https://autobuild.buildroot.org/results/36a15949ef78010f804b2a4d8f3351ed6869b41d | ORPH
 microblaze  |       host-libp11-0.4.12       | NOK | https://autobuild.buildroot.org/results/c02a2193493aeea08778ba35265db0c22fd5fa0a | ORPH
  aarch64    |        host-llvm-15.0.3        | NOK | https://autobuild.buildroot.org/results/b6bf3e8cc5d80f7a933891a14eba4c15b76a4cdb |     
 microblaze  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/073a135553db24840ee3493901962ea474503b10 | ORPH
  powerpc    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/e7f80f067fad56fd9ce972b9a55ab89ff137db92 | ORPH
    or1k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/ba22936551e3a6a997d7267dce7e2f008fc22f6f | ORPH
   mips64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/a1804bd36296f3304c2d09e3a59328c4f8468744 | ORPH
  sparc64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/bbde0450dbad0ba8e1e27bef1faab1ab4f1578a2 | ORPH
  powerpc    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/49102f047dfe6039214826153a832fd4207bcbfe | ORPH
    m68k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/459aad3dc9cd5868624433d79468e26306547ac6 | ORPH
microblazeel |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/aa104ad6b6067657b54871acdc8f732edd14b4f4 | ORPH
   mips64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/08f1574204b6e4be5c6aeedcb51ff6507483a5e6 | ORPH
  powerpc    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/e2a50b5d0a346df9a2629904f1819c558686032d | ORPH
  riscv64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/3888a0e20d6903fdaf6e45beb6017662afbf3a31 | ORPH
  aarch64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/a49f521f600c011e29f40ba4a6e0e83803cd3515 | ORPH
  sparc64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/c324236108c535bcdf39614c28813120ff2c5707 | ORPH
  sparc64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/8d740df766ed77c761c3d70b1f009537971d61e3 | ORPH
   mipsel    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/d54dd5760ac40765cf48a0b4547e25b1ca2670fd | ORPH
  riscv64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/e951b38bcd3d3edcb9a5b77066c8df7be412dc2e | ORPH
microblazeel |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/aaea7672a6efbfd54505fecd476c1f8b82ee8faa | ORPH
   sparc     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/30142d7bbd41b384d8814ffe5126d28e9b23e934 | ORPH
   arceb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/983630dfe090caf5a4c87663c476105b414a8127 | ORPH
  mips64el   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/7039efc77532776a495967adc396b26b401d4b2b | ORPH
  sparc64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/8529a5200780067c38e94d72a4fed016d44eee61 | ORPH
   mipsel    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/625bb18ce8b37aeaaf0682bce83b170b24c2f772 | ORPH
  mips64el   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/d909aa5d9c1b84b360275695129125f493248055 | ORPH
  riscv32    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/e0245bb67b9e26a87a147aea60c0f178dc744bfc | ORPH
   mipsel    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/0aac38ffc42f6989a120a823c0aac9ae837a926e | ORPH
 aarch64_be  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/e079d78be04555cc32c1552fe3301aba4af2bc85 | ORPH
microblazeel |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/7910b4db312092a1218bbad26192956dc23a9ad6 | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/7acb27e62a96baa0c59d98ee2d6117ba0a5981bb | ORPH
  aarch64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/bd6ced3050d9d39c1e072a9e437421b8717cbfe3 | ORPH
 microblaze  |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/2221238cc71de17e0af44bc2f3935b81e762ef11 | ORPH
microblazeel |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/0b8e63810de55cfa9fd3068f2e69ee66d746cb96 | ORPH
   mipsel    |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/d429ce2b5d54053e593c06effc0029297d84dd40 | ORPH
    or1k     |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/de019e7f249e101ee876c8fd9a58250029b261f1 | ORPH
powerpc64le  |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/2a46a01cebd7f9749914c4a313ecfe597f8d70bf | ORPH
  sparc64    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/75d6a5d9143d5361571faca72da6a36401d2e84c |     
  sparc64    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/734b1227a418504a844a63484b3b1317926c687b |     
   armeb     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/4eb27ec3f80bc601fdc4c06737ae8816f3cff3c9 |     
powerpc64le  |        host-slirp-4.8.0        | NOK | https://autobuild.buildroot.org/results/94f4805e3c1badf7c2af91bf6cbd31331501fa1a | ORPH
    sh4a     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/894b1c3c44a4902d6e6526f7035f819b718d473a | ORPH
   x86_64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/5db79f6af5e3ef568d01afa9d45b14578efac8ba | ORPH
powerpc64le  |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/542f1f27ee1e8015783cc92323aca99f4e5bc834 | ORPH
   sh4aeb    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/54a67483e21222df70b6622b6585c8d9455a0548 | ORPH
    or1k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/542bc556d84788117e907983c8203751090c5ebf |     
 aarch64_be  |        libarchive-3.7.9        | NOK | https://autobuild.buildroot.org/results/782157b0184f6ee30adc22170b8deaf416088b79 |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/e50ed25eaad072e91c0a675c4cd97b8756ab5bef |     
   sparc     |        libebur128-1.2.6        | NOK | https://autobuild.buildroot.org/results/186544883aaada7050d4b8e62d2979097cfdc876 |     
powerpc64le  |          libftdi1-1.5          | NOK | https://autobuild.buildroot.org/results/e9ef0866c92e1a4d4920404b09cb5ce954205acb |     
powerpc64le  |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/94d56535cae148cf140b24932d3f1e40d81428e0 |     
    m68k     |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/747fcc79c65864584e9401946e1d5e4aa4d271ef | ORPH
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/6d6907e224d447c2047584bbdf9568408618de37 | ORPH
   armeb     |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/9c7cdbd45f25d99313e5ab5b2ac0d560184da364 | ORPH
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/b8cdeaf5c3da78b7b300750e97b4b3ad27b06034 |     
   armeb     |         libusb-1.0.28          | NOK | https://autobuild.buildroot.org/results/61cebc4272f65546e0a8c2a524cb59bc8b364d0b |     
  powerpc    |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/027a17ed98227bd32c60ea5db7c162500fcd5a48 | ORPH
   s390x     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/acd7bf11fbbd5378deb03de5e72565eb0f80607d | ORPH
    i686     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/42692de84d31ffac05ec60be4934390e3ed8ae10 | ORPH
  mips64el   |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/f62fb601e0a8081d5e6419b9f934bcb18515fc37 | ORPH
  aarch64    |         nettle-3.10.1          | NOK | https://autobuild.buildroot.org/results/727d818c113687dbd7794312f8932e60b24099d0 | ORPH
   s390x     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/2ea9af3ad127c579dcee4f0ef874b286f7907a7e |     
 microblaze  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/2c186cc6113ae007389fc3ad2ea0abdde3624424 | ORPH
  mips64el   | package/rust-bin/rust-bin.m... | NOK | https://autobuild.buildroot.org/results/382489b3f5c931451bead7e232af07b70c3e29bb |     
   s390x     | package/rust/rust.mk:86: ho... | NOK | https://autobuild.buildroot.org/results/75b26e19b5cb4e1043103d80546fb7dcb6a96636 |     
    arc      |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/58b14c6205d113e092b557526b1cd0ac2fd32576 | ORPH
   sparc     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/f3f48eb0f54e454cf4e3dc1288e74520a1365aee | ORPH
microblazeel |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/a18d990ba4799741a40cb82b9dedb4e07a788833 | ORPH
 powerpc64   | rtl8723ds-52e593e8c889b68ba... | NOK | https://autobuild.buildroot.org/results/f6421f9669934686e1ff881b9618198afc9e1259 |     
   mipsel    |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/f485b0c7a2300fb0b122563959c7498b97e36d50 | ORPH
  riscv64    |           snooze-0.5           | NOK | https://autobuild.buildroot.org/results/57114a3ff471728a49ff107c931573dc18cfb219 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/2f4d70789ca9ec97a1a9f300a4f1a101ecb6b4a2 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/97bc39b012dc4a35ddb584f57646a63a4b83c8e1 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/80cb617d1f52aa8a3ff4a358c24e659a0c64be45 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/b2a745378ce6e4a64f9061e34be362586287f035 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/6105b98c295266b7cdb4099d64c7fb33b8e01680 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/65860599fb111263c8e9dec84354830764e60b61 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/db24005e442dc42d94753798dfbb824bd5ed4c32 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/9a094a23b57a436a68d9bf7c8459ca95bea86235 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/edd0e2022a63491934a9c70e4a972a3b755bafbe |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/00326da70c01411af6d2b8993ee649a9cc90ea0f |     
    arc      |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/812a9b39e359b7c155895fb5bf42f4ac74716e18 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                host-m4-1.4.19 | 5 
             fluent-bit-3.2.10 | 1 
host-binutils-arc-2023.09-r... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |       fluent-bit-3.2.10        | NOK | https://autobuild.buildroot.org/results/151351b2366a8a3e8a45f61e2cc81be04ef85693 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/aa73817ab2b3745b0ad66b6c627397029ae5be1b |     
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0e719af796ebb73441a5d256631209ea0f8e7a89 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5d4d9d27f0d90ace54aad48c69110bab031de48c | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e8b484e27576702a6a0981673e8c981272db699b | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/53586f6de70474afb12be77351c480d0120b0a26 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/53372a05cae38b5e2e66a40834d6183ef1f3f974 | ORPH


Gitlab CI results for 2025-05-16
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                   andes_ae350_45 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821149 |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821154 |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821187 |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821190 |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821191 |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821193 |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821212 |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821253 | ORPH 
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821270 |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821276 |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821279 |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821280 |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821283 |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821285 |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821287 |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821289 |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821290 |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821319 | ORPH 
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821322 | ORPH 
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821324 | ORPH 
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821401 |      
                          mx51evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821427 |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821450 |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821487 |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821499 |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821530 |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821536 |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821670 |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821694 |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821703 |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821708 |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821722 |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821727 |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821728 |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821729 |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821732 |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821734 |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821738 |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821739 |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821740 |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10038821753 |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10051773913 |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10051773942 | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10051773969 |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
