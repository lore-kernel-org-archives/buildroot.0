Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B97E8B399
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 04:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1194606AA;
	Wed,  4 Feb 2026 04:20:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gi-1nNIHWQZt; Wed,  4 Feb 2026 04:20:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B85960A46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770178802;
	bh=8YC+D1nQYVPAIvcvulOJ7HMeu2Dm2Dv1y4VrA/Dxm/U=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lUWauGT6mRrU1yvIYqKc8X+zdJyibop0obv8keJvejJU9bLPaViWdf05rpidXHrfj
	 Wcz26bKewXbHpACY6YNHhAgUF6cl6MXmU3TXOUeYxBVnjzlMAMxgE7uomapfSjb/ww
	 RWk3wJQ2Dk+h1SRTyN6uxentrvISQsF0aAIF6xPD7Qmm6vmfQ5aESObzqOoiPzfdA5
	 ZNIj4s6Oz/GI8/7FLallmab5M9OU1aLfO0S3+JjYKouzPJKECRYPglNRa8khIQnycu
	 4getuSa/1s59EBTv8eGotWx9sbqly0XwQN50gdWKhKCfQEqf5zen8XBcUNhixeotOW
	 +wKNIOUtmDq4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B85960A46;
	Wed,  4 Feb 2026 04:20:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 070A1F4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 04:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4CA740882
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 04:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mgs9JHmT0dMy for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 04:19:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 335C240B20
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 335C240B20
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 335C240B20
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 04:19:58 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4806f9e61f9so32707995e9.1
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 20:19:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770178796; x=1770783596;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pzIKIgYeo+KTnA4fw1gNC7VeqbSeuiNR+gh32bsHk1U=;
 b=jbbbCAOf4Iv9eNnPuUePjX9wHmNkgE9tOkSbsVTDEQqpqToalEowZBCCBzrN0Z+FvQ
 Es9AEB2I8WiNdRQrVEUojwadqbieKqTYvB7pcB4K4gGkQhQib6b6YeXg5QVZH/mZWxtn
 86PqdCszQt1KEbPLQIZM9WtncgdEuPu45EFTOEBdduUI0KcwUfsAIQbFtL3Jn337K2+o
 SGLdzieV4MkDr1sPtlt+wHIxh1xBqCoEBnk849gnAicbxT/HKHTkg/T8vrFrdZ7+W19n
 Alcybs+8TNLEfhWhCaQKMiflC7bHHCVIQrwr+189BrFafxXufNPvwcIzVKyx5FoYbkSW
 QNUA==
X-Gm-Message-State: AOJu0Yz/wNL6M2DwUi45OxSPUSe29qXDRjZcDfXwuDUhV/64QibXt9Mp
 tHquPgpqdMfU+PrbfCdPvqUPxRcSay+yAsz47JEl0tmdHD3hc+KcHtIhE4G3og==
X-Gm-Gg: AZuq6aI9HsaKBqf6TSZaFMF9BBxtXbukrbOj8Um+fSkOmE5G4ZVAX4iM03Qsngk1OZR
 cSdvA0lZzACTcLeYNMKxSiYd/cy3jZl2ky5A7Z1mojxU4Q2LCFR+yfkSxxbJlSjuqJvR8yRPzPH
 ylTO/XKm5q4G6IhGaeKZtNwMYPBmbKhW2EcmsdcRx59K5t8neWr3exJreri+cAKOYpdKh6UJuep
 dH5o+kGisfa3Dg7XRUgBuQRBw9Snpkoda1OzT4EldKo9PS0/FH/txUdllkXW/l/DKgrVP8R5aZ/
 uv4F/10takpMB8R5ZQbkJAwNw/L97mjNgQS8RpLVOf4DaagPMYy0ZfznOEIM3LcgetEt97KNSwo
 rqZZfqKVp3LeODohFL7Y/e1JYqzREbZUT/UtYOIdoEKvy3D1ib7bPz2oRu7yrzj/5UDQG0bCCz3
 8tSuz0Tfe5IlOKVmUFVA==
X-Received: by 2002:a05:600c:4684:b0:46f:d682:3c3d with SMTP id
 5b1f17b1804b1-4830e932492mr20239105e9.13.1770178795650; 
 Tue, 03 Feb 2026 20:19:55 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4831088ce39sm21024745e9.9.2026.02.03.20.19.55
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 20:19:55 -0800 (PST)
Message-ID: <6982c8eb.050a0220.2cab31.b68c@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 04 Feb 2026 04:19:55 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770178796; x=1770783596; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=pzIKIgYeo+KTnA4fw1gNC7VeqbSeuiNR+gh32bsHk1U=;
 b=CUPLWHFwikDpyV4FPrnCp7MTSPnhka1Oeq1GDC6DKZ9oRe0703NES4tJDx+344xbsI
 ah8pd9Zb184Vt+cVlgWRp+VWtfu8tbU8MNHf1tO08s9h9DznW/0REm49O0h4df2qtQtK
 UVSbxifNhOstWsoTVcUNGcpDRSZQ4UCpan+BbsQqSgMCsZAVPOFiddcVA8h7z4FpBEAD
 CU1kRQTsK5fj6pMDyCX0Pbhs1gT4pVtGTIM9JSFUqPeGCPqIYXd+n2hQyKE/zwBbQjv4
 EB+MT47DSSsuRs2dJTFEYg7AB3ZkuYkrNdC4AQ5WOqIDq8rad0wWPSBB0CANoJ0nuD/u
 YK8g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CUPLWHFw
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-02-03
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

Autobuild statistics for 2026-02-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 10  | 24  |  0  | 34  |
  2025.11.x  |  4  |  7  |  0  | 11  |
    master   | 24  | 62  |  0  | 86  |

Classification of failures by reason for master
-----------------------------------------------

              libopenssl-3.6.1 | 7 
                 dash-0.5.13.1 | 4 
  gobject-introspection-1.84.0 | 4 
                  cairo-1.18.4 | 2 
cegui-e7a03afc70c6182a091ff... | 2 
             dahdi-linux-3.3.0 | 2 
              host-rust-1.88.0 | 2 
libfutils-c326ce0cc2a735438... | 2 
                openobex-1.7.2 | 2 
             util-linux-2.41.3 | 2 
               asterisk-22.5.2 | 1 
           at-spi2-core-2.58.2 | 1 
                   atop-2.12.1 | 1 
                 c-icap-0.5.10 | 1 
          cloudflared-2025.8.1 | 1 
                    ficl-4.1.0 | 1 
                   flann-1.9.2 | 1 
                   fwupd-2.0.4 | 1 
glibc-2.42-51-gcbf39c26b258... | 1 
                 jasper-2.0.33 | 1 
                     kbd-2.9.0 | 1 
libdill-32d0e8b733416208e04... | 1 
                libdrm-2.4.131 | 1 
             libgphoto2-2.5.33 | 1 
     libphidget-2.1.9.20190409 | 1 
            libxkbcommon-1.9.2 | 1 
          linux-5.10.246-cip66 | 1 
     linux-5.10.246-cip66-rt29 | 1 
               linux-pam-1.6.1 | 1 
                   linux-tools | 1 
           lttng-libust-2.14.0 | 1 
                    lua-ev-1.5 | 1 
                 mesa3d-25.3.4 | 1 
                openswan-3.0.0 | 1 
                   perl-5.42.0 | 1 
         s6-linux-init-1.1.2.1 | 1 
               tcf-agent-1.8.0 | 1 
toolchain-external-bootlin-... | 1 
uclibc-ng-test-132c6134d691... | 1 
                       unknown | 1 
ustream-ssl-5a81c108d20e247... | 1 
wilink-bt-firmware-43fca73c... | 1 
        wireless_tools-30.pre9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/55ee1f972e04a70880498cc282e8ae7fb96a0310 |     
  riscv32    |      at-spi2-core-2.58.2       | NOK | https://autobuild.buildroot.org/results/3ef42d4c6169edc9114d07a4d40e567d30f7138b |     
   mips64    |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/5d1ef63d864b4f0fe0dcd85ab49fe05b5b4ed96b |     
powerpc64le  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/a079b690163c3af8f9236e6d2ff2a549838c8ca5 | ORPH
    arc      |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/cbc28e5e70fe0928f8ebaf0da69f7baecea91459 |     
   xtensa    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/5c7f07d42039c719f06626da1c6e2fc2c0d01a19 |     
   x86_64    | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/fc012f5635432d4b572e0cedf805c935772cfb10 | ORPH
   mipsel    | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/248fabed54239e3f4cfe68c3b964a2b6a52c9dd5 | ORPH
powerpc64le  |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/a0f227a4d54797f8bde278d39a8bcf19c45ac608 |     
microblazeel |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/89f30d832dc2e557e0f686192f45a6607dc687a6 | ORPH
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/992bab208e7a86811c75a202b738831f94bc3707 | ORPH
   xtensa    |         dash-0.5.13.1          | NOK | https://autobuild.buildroot.org/results/8834bbb9115e3f7d36d7e4a3c0082e4b8b9b6b33 |     
   x86_64    |         dash-0.5.13.1          | NOK | https://autobuild.buildroot.org/results/4c2713c960c6fe51ed4b4396684a1621323ecdcd |     
    arc      |         dash-0.5.13.1          | NOK | https://autobuild.buildroot.org/results/3282031e6b7e09555ed8a088eb0785dbf1988038 |     
    m68k     |         dash-0.5.13.1          | NOK | https://autobuild.buildroot.org/results/2f4dd3758878216e2fcaace328c8464a62ba1a75 |     
   s390x     |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/b6fb20b104ed60c03967d67db14430ad921189b0 |     
    or1k     |          flann-1.9.2           | NOK | https://autobuild.buildroot.org/results/9ed00303d42a2c66118875b86a63ba3a13e2d150 |     
microblazeel |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/c0f6e22d63ff3a190979dfc3aa8cf10981794fef |     
    hppa     | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/70fcea6d8b19a6776fad14c23f3d87b435280b33 |     
  powerpc    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/fe5ef84e19fb1ea589a97b80ec21ecd7f5da8510 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/f112b0654d3a9615b98df89bcdab6cdeef2b2e46 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/4bc173fdc65b3f757bed1f781e96665422797018 | ORPH
   sh4aeb    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/81e05cf0881049c128992bfa8f7b4b0fce1ec6f9 | ORPH
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/b3ac45587104fcfd7e27120da88fe112e6f55ea9 |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/edc0b7234aa00f7c5cb8c019ebe24ab06506d8ac |     
    i686     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/0b12e9428342e551e47e359598eecf18d81249b3 |     
   xtensa    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/f106755f1240236b04db4cb2c0e111618c98f7b1 | ORPH
 aarch64_be  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/32078afd72472d86011ede2774ad961b83e2956e |     
   sparc     |         libdrm-2.4.131         | NOK | https://autobuild.buildroot.org/results/fe4015f82c0d5f0e16c31e8d1c4c0085ebcbf479 |     
microblazeel | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/b4938f1b7f40cf12ae7631d4abe619fc5663ec04 |     
  sparc64    | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/11317297616bb5a52d9ea4b269eceb5f6962d408 |     
   mips64    |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/527662210a54a8ee7cb8c9277b240fffc0819ce8 |     
    arc      |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/02e241b6ebbfd38f3f26930754ed5062fe352aee | ORPH
 powerpc64   |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/59b8dc542e98ba61b5c68a8272765c11ee535ca3 | ORPH
 powerpc64   |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/5bd269974d6f8a2e06158631f1d169ac9e167701 | ORPH
 powerpc64   |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/dfc997a3d88acb2bc1ca910590226e98ab67b5b5 | ORPH
 powerpc64   |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/cb057748d92861489a986f986012b6eeb05acb4a | ORPH
 powerpc64   |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/e87a85571d9c473271d39819b5034e11125b4d5f | ORPH
 powerpc64   |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/f6325094e82023533d3c5561ce3caa08dabf49bf | ORPH
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/1e9154a0e20e6f3fe1fc74ceeafac6b676098699 |     
  riscv64    |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/23650f3b21692de7eb3e26323befe57864fc5d24 |     
   mipsel    |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/2b8d8d5290b5da3e626829598872279bb9770707 | ORPH
   sparc     |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/34a2f4aeced76da04248abf50df630569f5f5595 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/16682d7a86e613d8c02e43693aba77a45e782886 | ORPH
    mips     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/5dde8da4ab4f874afdfe88dd96e5fa68511c8bdb | ORPH
  aarch64    |      lttng-libust-2.14.0       | NOK | https://autobuild.buildroot.org/results/b90406484d166f5a16e288a20b41f862fa600ed8 |     
    sh4a     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/8496fad85b0af926a7cc6809ae465b714b7feb7d |     
 aarch64_be  |         mesa3d-25.3.4          | NOK | https://autobuild.buildroot.org/results/efd07d97df4e0c1ceb07fc26e17898afef5435b9 |     
microblazeel |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/64a4df4aff66564bafea261de806b17ef15cf270 | ORPH
loongarch64  |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/523458bcaaa12f495af2e784fd04bf3cd172ba1f | ORPH
    arm      |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/f2fac55bb881276c813a712aa7ccdb48253b50a6 | ORPH
  mips64el   |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/ecb6ffa761d30618c7c9b1088965c134df6d2b69 |     
  powerpc    |     s6-linux-init-1.1.2.1      | NOK | https://autobuild.buildroot.org/results/039e90775c95db02032e8c6b8d631fc9a1391a27 |     
microblazeel |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/274ca892dc652b4f3904a0a2c5dab1e76ece563c |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/684663d7aef868f9d547d2d10e63516d951c1f20 | ORPH
    hppa     | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/25e5891a5a242ccad47cd4f8fd30da557ce3b563 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/2f10a55d59aeb25905ca536b1a777fb251817819 |     
    m68k     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/824e56aefba00b441e600473244dee3a9568a966 | ORPH
    m68k     |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/58709b4106f214b7a137e2616484327178747a50 |     
  riscv64    |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/1195d106dc0ac100175e368fec5756f2e0be33bc |     
  sparc64    | wilink-bt-firmware-43fca73c... | NOK | https://autobuild.buildroot.org/results/33aa13664cebb9b68c499ca265bffe3a015b5b41 | ORPH
   mipsel    |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/d42d17153686655f6082f3b1130356a12fa5326a |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

               bpftrace-0.23.3 | 1 
                    ficl-4.1.0 | 1 
            gdk-pixbuf-2.42.12 | 1 
 host-softether-4.30-9700-beta | 1 
                  iozone-3.508 | 1 
               linux-pam-1.6.1 | 1 
                   swipl-9.2.9 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        bpftrace-0.23.3         | NOK | https://autobuild.buildroot.org/results/53ddd0a5a61f070b41b4ef16f0069dde09006915 |     
   arceb     |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/eddf0db7ebddec7692a65a127e4a8f5ebb0f0ba8 |     
powerpc64le  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/8944bc9e0a644f5a2a5f7d3e03ad7140ffde0c46 | ORPH
   s390x     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/1ed6e6a3a35bcd3e111261b41017e84da5f28422 |     
    arc      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/3c1ae547545537b87061c5dee8091a752d892a5b |     
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/f33112f724dac9fc89b3cdd2e8fc86d9cde5186d | ORPH
    mips     |          swipl-9.2.9           | NOK | https://autobuild.buildroot.org/results/e3a1a6462dd339e50c49a5795f3445aacb74005e |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                libselinux-3.7 | 10
           host-libselinux-3.7 | 5 
                 gnuplot-6.0.3 | 1 
        ltp-testsuite-20250130 | 1 
make: *** Waiting for unfin... | 1 
                netdata-1.37.1 | 1 
               qt5opcua-5.15.2 | 1 
       sp-oops-extract-0.0.7-1 | 1 
               syslog-ng-4.8.3 | 1 
                    vlc-3.0.23 | 1 
              xmlstarlet-1.6.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |         gnuplot-6.0.3          | NOK | https://autobuild.buildroot.org/results/d8d862d19954d71cf81371499de784b9504a781a |     
   armeb     |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/c98be12820cde6a83bae7ebd003d45c97f1eae16 |     
   xtensa    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/dcab1cde8adca796066b25ae4231f2c1e64951f6 |     
  aarch64    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/b82d44586cf13573eae18a97cc68e2d0f523d038 |     
    or1k     |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/5cbf87e9f2c79d36fae830779606696759683f94 |     
   x86_64    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/33061c9cbfdc0957664a4eccd226cf9c117d92f8 |     
 aarch64_be  |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/79ec27120ced9efb5b4236d8e0a2d4fb57c82205 |     
   x86_64    |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/051385001497e210334bbe293668209a6f008012 |     
  mips64el   |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/89e58619ef64d62212c3c40422005302b521ea98 |     
   mips64    |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/83a26e2137ff9dd1b4e899be8e4ab67fc1bafcf8 |     
 powerpc64   |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/ea8cf49e74d0fac84f22034c6ab231fa66e602fc |     
    arm      |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/36de98d65e9c41d31e59a23602a2bd6920673805 |     
  sparc64    |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/7ce53c24a11b3c52633cd2dbf90c15dab40c0000 |     
   s390x     |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/c270250e4dff474859d259501f218f4c2b8022d8 |     
  riscv32    |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/a316ac1ec59922c3aebda064336e847440c954e8 |     
    i686     |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/4b9450061ace96b05f8fd1cddad72b8355f5e5fd |     
    m68k     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/76208e1857d7a823ce5556259eed78cde2b1232e |     
   mips64    | make: *** Waiting for unfin... | NOK | https://autobuild.buildroot.org/results/edf048892a79704c9d9cd29a65b42dbf996d651e |     
    or1k     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/58e6ee1e1eba0e15447931ef267e3b621bc5d844 |     
microblazeel |        qt5opcua-5.15.2         | NOK | https://autobuild.buildroot.org/results/30852221a9d89d4720c4d6aa003f0eac4b8289aa |     
microblazeel |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/026fc09dd46adc745fc5b192f10476a0efa1dc1f |     
  mips64el   |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/3e33ad4450af71cc7169f2d5be6167d1e362e889 |     
 microblaze  |           vlc-3.0.23           | NOK | https://autobuild.buildroot.org/results/45d389c4e0c8aa4a3b7ce0b8779fb4807f1ff5a2 |     
   arceb     |        xmlstarlet-1.6.1        | NOK | https://autobuild.buildroot.org/results/8a9081eefc7d527b957cde9b11fc8801cfb194b0 | ORPH


Gitlab CI results for 2026-02-03
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestPythonPybind | https://gitlab.com/buildroot.org/buildroot/-/jobs/12960768433 |      
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/12960760645 |      
         TestPhpLuaLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/12944797270 |      
            TestPhpLuaLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/12944797268 |      
          TestNodeJSBasic | https://gitlab.com/buildroot.org/buildroot/-/jobs/12944797230 |      
              TestFlutter | https://gitlab.com/buildroot.org/buildroot/-/jobs/12944797062 |      
     TestFirewalldSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/12944797059 | ORPH 
              TestAvocado | https://gitlab.com/buildroot.org/buildroot/-/jobs/12944797019 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
