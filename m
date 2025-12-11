Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77384D3E78D
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 04:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CC9C849AB;
	Thu, 11 Dec 2025 04:26:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gb8BggD2n4q9; Thu, 11 Dec 2025 04:26:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC7C484B25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765427194;
	bh=zBRx3SncdeWLAJh2nYTg9dk75idUW9dDYJP2pIAXNKU=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=d4XlNZSUz81kW7f9xbzVz5VRTKMCtz1NLturGWmif/LQcMHTyckM2FbicX+5Vw21o
	 +mNYSHlHc6B2e0xCSDul7AnVhsCzuoBBwRAuO6vXeAkwbuwrPOlqvX6uy9zdvolrOf
	 hourPJspCy7ZAwgkVJQCTXQHnJEveieWuQQZ2WGWAR66a7INbutJj8D58gI9MiIa4D
	 Z7Z7KR0x8TiGESExSLEo2vUiwfc8sVc6zGghGEWhhvn0HW8gmghP1AY2/cmADgZSg3
	 CxFb1GxLKbJSM0cQJ8SBjxg2cOc/Gf4jswup27xTWr9tNEwHWpz69CrOt3avCr99Zd
	 jaxPx6CYnLoog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC7C484B25;
	Thu, 11 Dec 2025 04:26:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D80292E9
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 04:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8D1C84937
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 04:26:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NiziGMZmQh5M for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 04:26:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2985B846A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2985B846A9
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2985B846A9
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 04:26:31 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4775ae77516so5219515e9.1
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 20:26:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765427189; x=1766031989;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ta8xXJBlMuO1x2N+qz5DrScGAyfXTMyQ8CCVtbS7Ums=;
 b=PngHU3Ear0zGJDtSyW99IqHHNDOrXkP3zarbHfaEwe7A4SMuZz1o4lPI1S1xLpsSAp
 0cVS2jEJSScYMP/EDu2C7w9Ju5etxZ0cgBpnwTGUybNmPocAUVQLBFA23Rhl6I0zYUfX
 VBDR9MA1XBUUoXEAcLBOJTfN7s2a23UpBrgbHKK9S9s2qiKU9riQpygmqChPa0IxOzuc
 8I9mB0PfAiQLPUn6Gu24P9TbBYwd8lgtUo5KB3M/poPpDn20p0d3LtDdT6t+5z1yDDOq
 wuLSJt/LTb7d1nbZvKhbVFatHu4awEDzaKeENPNw/CdKPXW71T4aD+vsQJkZcmaj2OZd
 jGxw==
X-Gm-Message-State: AOJu0YwYwo7LrgyvQeyjmMwSOWulKYKovaTDoU0+VHp1MqN4ZxuBNAot
 UeBDxFrilLdVTlhB9rApQXCEkXOFOdmCTlKavQdczA3yUKYLMoSAzDyKItv73A==
X-Gm-Gg: AY/fxX4NYHKKIE+TZMfCm+UYGA9ozRMZtiq3CIZdu0sbdp8wxEdOELMdmmjvtiPxzHW
 Wxbk6D0TvsZfRvVFmQrP0oAsS0urfEU6NfQdpR+u0r0EoKwWi0P9o3PDLnuLamh9gi1uY9UzUA+
 qYy0cxnVP0jRXSYU4yuEbf4SNbkcIrehQOh4fYEokogW+bwlntN+djdCQxtZRstWzvdQ0wq5LP2
 lUEQ+0jvWtGX5MM5THUJws7IRg01T6BH8Q5pZiK6l6mgYL2/8IG6HmXHvoBhkS7BvXaMtGi7Mi6
 0tjDGirTUzGWCgI7pgGg8iN+CBDIMh9D3goEjOckhP8ZEVLUp0sjYD8krAEsMoveQIAS352RO7y
 j02UgnDnf1agf+5Wc4nSFouzPtLuRo9VC61sKHu1LlL8jqi5sN39QPm7uosh+K7KOBn2lGb5+E8
 w/X10MrASEWWsmMfjedg==
X-Google-Smtp-Source: AGHT+IFr+x8d21Tr8h+jNiQN6wtst8kYbG1QyFBdxznh7sqxYFfznH6R2fNEM+yKcgGgr3RW0G1yWQ==
X-Received: by 2002:a05:6000:2087:b0:42b:5628:f4a3 with SMTP id
 ffacd0b85a97d-42fa39ce63bmr4348746f8f.1.1765427188838; 
 Wed, 10 Dec 2025 20:26:28 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8b9b26fsm3058451f8f.40.2025.12.10.20.26.28
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Dec 2025 20:26:28 -0800 (PST)
Message-ID: <693a47f4.df0a0220.22ebaf.69a4@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 11 Dec 2025 04:26:28 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765427189; x=1766031989; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Ta8xXJBlMuO1x2N+qz5DrScGAyfXTMyQ8CCVtbS7Ums=;
 b=P93ON0RzxyCWUBHqV3YBKYdIdNeR6nSiXVi1JbJ2nsToDNW1GjsdR9O7xY5O13+Xdq
 4jXiOEQ2MdYzvz6G/UBw5NaZeQ3QdpcwjZbRdcTNvEA/FDwF1L9zA+6gUSOLwQ1ybvjw
 7GTQuufRONuDzr/M5ZNM7fjAqJ7Tt10PCYY2I4RB8u/EmFSjfX+4tQWbwU6fuv7+fJuj
 DFB8AAuGu09Sqk5VLUC4pikUZ2QDqAAfURtCqfMIrtEdqkC8Vt/HSc21ATMguUu65zoA
 Y/UnGD2YuadebZnLIHLBN7u92pq70vplULuAf2UU645u1QUS5oma947oAsJR7N3onp+w
 e79A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=P93ON0Rz
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-12-10
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

Autobuild statistics for 2025-12-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  |  7  |  0  | 12  |
  2025.05.x  |  3  |  3  |  0  |  6  |
  2025.08.x  |  2  |  3  |  0  |  5  |
    master   | 44  | 67  |  0  | 111 |

Classification of failures by reason for master
-----------------------------------------------

                   cvs-1.12.13 | 4 
             berkeleydb-5.3.28 | 3 
                 c-icap-0.5.10 | 2 
                  cairo-1.18.4 | 2 
              e2fsprogs-1.47.3 | 2 
  gobject-introspection-1.84.0 | 2 
                 host-gdb-14.2 | 2 
              libopenssl-3.6.0 | 2 
     libphidget-2.1.9.20190409 | 2 
                    linux-6.18 | 2 
        ltp-testsuite-20250530 | 2 
                    mpir-3.0.0 | 2 
      passt-2025_06_11.0293c6f | 2 
               pulseaudio-17.0 | 2 
                       unknown | 2 
                  boinc-7.20.2 | 1 
               bpftrace-0.23.3 | 1 
                  brotli-1.2.0 | 1 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.4 | 1 
                  delve-1.22.1 | 1 
           dmraid-1.0.0.rc16-3 | 1 
            erofs-utils-1.8.10 | 1 
              fluent-bit-4.0.9 | 1 
glibc-2.42-3-gbc13db7393773... | 1 
               host-runc-1.3.0 | 1 
 host-softether-4.30-9700-beta | 1 
      host-uboot-tools-2025.10 | 1 
               iproute2-6.17.0 | 1 
                  libite-2.6.1 | 1 
                  libva-2.22.0 | 1 
               libvorbis-1.3.7 | 1 
                libxml2-2.15.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
               linux-pam-1.6.1 | 1 
                 lockdev-1.0.3 | 1 
                   lsof-4.99.4 | 1 
                   perl-5.40.2 | 1 
                pipewire-1.2.8 | 1 
                 rpcbind-1.2.8 | 1 
              skalibs-2.14.3.0 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
                 sudo-1.9.17p1 | 1 
                   swipl-9.2.9 | 1 
                 tbtools-0.6.0 | 1 
             util-linux-2.41.1 | 1 
           v4l2loopback-0.13.2 | 1 
            vorbis-tools-1.4.3 | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/cfbc7243fc8a4d720969b8c9b3283d79aec79a1f | ORPH
  riscv64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/120cad31809f9bd098e5eabb2b79b9c1817349bf | ORPH
microblazeel |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/4f9db61a421635b157cc959f2c3f8b43a80e7d6d | ORPH
   mipsel    |          boinc-7.20.2          | NOK | https://autobuild.buildroot.org/results/dfba741497c19f6a3bccf6e50df5d8353b521039 |     
  aarch64    |        bpftrace-0.23.3         | NOK | https://autobuild.buildroot.org/results/2bf26b4848796ab031ab0767b97aba63a35f1184 |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/754493ac282cbc2579a64ca731d7c8684118f2a8 |     
loongarch64  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/c83479fdef91bd792c3f5e413b77427e4d8dac42 | ORPH
    or1k     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/c215e0c26ec7b358228f2c6802e73723ada83e14 | ORPH
   xtensa    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/1b9019f437f9edd0cfb2d5569cdb718478b63cd9 |     
   xtensa    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/2713baff791efe07e69f6d5a83b172681a8f0368 |     
powerpc64le  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/1b4409aabf7c45953dbb074106469dd5f967fb7b | ORPH
powerpc64le  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/1850279b957852630ade59226da1295b21ed5b47 | ORPH
    i686     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/3e218c20f5d98d3d94a1d1bf5865cf480bc7cb96 | ORPH
powerpc64le  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/7a508c12ce19d5e29d0914735d1c66902655ea99 | ORPH
    m68k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/060c18c2a4fee49323003772cb5cb5eb4e72fa5e | ORPH
  aarch64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/7b362a0ae044840be31e10bd7c6efd9c46fbb542 | ORPH
    i686     |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/6ec17272063ec6ffcdb3a8b6b29f3c66de34eb0e |     
microblazeel |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/54628624ad3237eef1a10f0bc80bcf3a580dc125 | ORPH
   sparc     |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/842ea39341000c3d5c618f682f5442626f383f09 | ORPH
 aarch64_be  |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/f00d4578837de4b027a1774c2f588ed3f754977e | ORPH
  riscv64    |       erofs-utils-1.8.10       | NOK | https://autobuild.buildroot.org/results/37353bc6b2e5cc57aa69968856b1838004ef9709 |     
 aarch64_be  |        fluent-bit-4.0.9        | NOK | https://autobuild.buildroot.org/results/a753f29d751e67b118e48ac5137a462d8c3d5c96 |     
   mipsel    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/7abb46999044fbda1b703334dc1ec85b5e271b22 |     
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/b364e0a50da1ec26ea8b09af413a57bb990fb7c2 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/1e38fa898bc4fc6a9433a7e1f67580b5bd8b21d9 | ORPH
    or1k     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/681e4adbd9f46bcaf1a4ae724d1cc80ff43e8a4b | ORPH
  powerpc    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/1caf852a7f2459416b8dfc1d34616ffd4acf77f5 | ORPH
microblazeel |        host-runc-1.3.0         | NOK | https://autobuild.buildroot.org/results/32a81d4378cb2ae77dbdb2365bf7ff7979020d03 |     
 powerpc64   | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/f5331a2fdd70a0172559179645ca4623776b9c58 | ORPH
loongarch64  |    host-uboot-tools-2025.10    | NOK | https://autobuild.buildroot.org/results/4ea26495f658a508110c2065d043b816837e7413 | ORPH
    arc      |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/3beb2ad940b3b065c0cb5030de905bb89a6bcb73 |     
  riscv64    |          libite-2.6.1          | NOK | https://autobuild.buildroot.org/results/6c6fd2ae410a82c44da54ee13a09a38a7ab220c1 |     
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/b8f11d57977dd04bb3a1e6ada74272d3a842efcc | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/c9057ac0cb0e2d90ef822a617c062d4c6066def4 | ORPH
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/1499c3cca985a728c83b7a4b6f8fc288cc958e8d |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/67ca70a822382769622292cb8047e6578b735600 |     
  aarch64    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/90fdb17955134e8e56d92b1a7cad425e061754fc |     
  powerpc    |        libvorbis-1.3.7         | NOK | https://autobuild.buildroot.org/results/d6989d5c594acd852b3df1431bef41f5286761d6 |     
   x86_64    |         libxml2-2.15.1         | NOK | https://autobuild.buildroot.org/results/8014764c8ea4a8f41824f274bda4ce85cbc8aa90 |     
powerpc64le  |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/0898ca2e9b8bc3c4af9662882c276e9b4fa026d9 | ORPH
   s390x     |           linux-6.18           | NOK | https://autobuild.buildroot.org/results/f5010c88701d21d2eaed21398b96edb95e937a65 | ORPH
 powerpc64   |           linux-6.18           | NOK | https://autobuild.buildroot.org/results/d5ca8e9842d70958de77e5d47daf66044d7cf1b2 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/190ed58b6dd51839a86a9ac0956dbe30839dae06 | ORPH
   armeb     |         lockdev-1.0.3          | NOK | https://autobuild.buildroot.org/results/5507a18498dd63029dfba2c90656dc8cce582ddb | ORPH
    arc      |          lsof-4.99.4           | NOK | https://autobuild.buildroot.org/results/8e65680069634d11a416ff42e0b1bfdb021507b5 | ORPH
 powerpc64   |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/cd4bb27f28944bff6383d35d6de2df13adfc99ef |     
    arm      |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/080fa4af1b267f283a2da4e8b08f1fd00a53bc5b |     
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/a2dd5a17efe272971a61102dcf719b7764e60cb2 |     
    i686     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/c138e59d5c457093522d828aefdb060508b45f01 |     
  mips64el   |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/f4bafa3258bd57857f51576ac37ecbab25c3089d | ORPH
   sparc     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/4b6b5d9acac1ca6d6fab8f768d347fab0792905d | ORPH
 aarch64_be  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/3df028f0ac9fc1b734166fee46d85865f8251810 |     
   sparc     |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/88044d193df89c237f23fd02f05c361395b8e15a |     
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/60e86d364b76728bc60e7824574fe8f18c2417df | ORPH
microblazeel |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/71e5f159f3bdf91e3fc2b3819fee2fb1d181c446 | ORPH
   s390x     |         rpcbind-1.2.8          | NOK | https://autobuild.buildroot.org/results/aebc4a1f44813e937e19c8e97cfec06a841ce889 |     
    or1k     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/f0ef6c62ee421329e885edbf5b61805a6fe54159 |     
   mipsel    |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/426b04e53fce00ab5a47ee4cf27b01ba1c4812ad |     
    arc      |         sudo-1.9.17p1          | NOK | https://autobuild.buildroot.org/results/f9bfd156fa1fb897e02374f3e28651a4a53fb4c3 | ORPH
   s390x     |          swipl-9.2.9           | NOK | https://autobuild.buildroot.org/results/4132b4d7d69780967dd2291aafe8801efdde4cd2 |     
  aarch64    |         tbtools-0.6.0          | NOK | https://autobuild.buildroot.org/results/c7b011da382b6099c4f0445e4058c8026326e602 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/f532dde2ad4c2bc3ddbbc75da843fc78b06e7aab |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/9a9365544256bd717b4dbc31197d02648ff06364 |     
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/48d3a3c54380ecaa2be7f9cb520cc0f354f9e26e | ORPH
    or1k     |      v4l2loopback-0.13.2       | NOK | https://autobuild.buildroot.org/results/96c5c7cadc0e8546b2f02599c507c1d199521178 |     
    or1k     |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/1749ce399dd328dfc61eadaef8f6f385f875595b | ORPH
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/1d2da62f9d7c28ee2f0b1e5525258c87a19bea54 |     


Classification of failures by reason for 2025.08.x
--------------------------------------------------

 docker-credential-gcr-v2.1.30 | 1 
                  dpdk-24.11.1 | 1 
        wireless_tools-30.pre9 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     | docker-credential-gcr-v2.1.30  | NOK | https://autobuild.buildroot.org/results/77a62e74b7ba18b1b7f6285da810c9116b8ccc00 | ORPH
  aarch64    |          dpdk-24.11.1          | NOK | https://autobuild.buildroot.org/results/a4f9cfdc26b8b70e9f47ee5708548ec1fb742a51 |     
   x86_64    |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/6cdecf41cbdcc383c7cd3c83c30b13d9a1505306 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

    host-mender-artifact-4.0.0 | 1 
              host-rust-1.82.0 | 1 
        ltp-testsuite-20250130 | 1 
                 openmpi-4.1.5 | 1 
                   perl-5.40.2 | 1 
python-remi-2022.7.27-37-g1... | 1 
                setserial-2.17 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/dfb5302acea4c70dee61fd3f57caac530a16e294 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/27b8ee6781a5e70a6ccd83b02a0100a00390130a |     
 aarch64_be  |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/d8c54f5a962d168d55de1b4fc7489156c6fc3672 |     
  powerpc    |         openmpi-4.1.5          | NOK | https://autobuild.buildroot.org/results/300f3281203273ea6c26d856b701175cc64eef14 |     
  riscv32    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/f1d0752bb0945bf6d6873d2e60290f8518c368a2 |     
   arceb     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/cbe4d94fe82690845ca71556e5c3f6dea6ca3966 |     
    m68k     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/0552c3fb29b85b6f2297e250dfa18e94ec9869ce | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                   eza-0.20.19 | 1 
              libselinux-3.8.1 | 1 
                libvips-8.10.6 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |          eza-0.20.19           | NOK | https://autobuild.buildroot.org/results/491988c94d366f0d6e7b187e5a4e95549e5e2cae |     
   x86_64    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/673a65d69c41618e683869fadabfe021ac523f73 |     
   sh4aeb    |         libvips-8.10.6         | NOK | https://autobuild.buildroot.org/results/ffd03647b759711a6b5749a9e15a569c969fe663 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
