Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043BED358D6
	for <buildroot@archiver.kernel.org>; Fri, 30 Jan 2026 06:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F3D581230;
	Fri, 30 Jan 2026 06:09:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qBSX6nrLuKle; Fri, 30 Jan 2026 06:09:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E83081215
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769753373;
	bh=v0victEbMmicH+6BhWzhp1zoAr9mIELJV4kIEDWT6ho=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GAbrhvp72jEPq8fdO1cRJX7V6JG0WOnGbh0OSXgvI2Ani+IG3KM6q+pMVIcCgQLY0
	 xlP59UT1CoB8yWV1tZNuvKfSPoc1Sfq1hh2d+ZfNk1PWLROwd9PZ4L/9RB92rZpC+E
	 KDY0vsKlgFTOjOG7XwDR89dQ6Bet0chLIUF3/qJIvfBsDfMeCQRCfbmyJqiB8sLBDB
	 P2Tqfm80ghrGG6qHKfRvbV2X/L3S7rAtxFKa6v6oBr7WjYL7M+9SXF+Zl+GD4GIfHG
	 2Nm6+a0Om4wfcBhwjrC6aJ6zk9ZNhcCRAmG2D/mhKVMB0kpGqLNjfHwtjaE5nL2Gwv
	 nToL8/FIgb7Iw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E83081215;
	Fri, 30 Jan 2026 06:09:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D8CCD195
 for <buildroot@buildroot.org>; Fri, 30 Jan 2026 06:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6D6640643
 for <buildroot@buildroot.org>; Fri, 30 Jan 2026 06:09:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oAtILShSlaRW for <buildroot@buildroot.org>;
 Fri, 30 Jan 2026 06:09:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3935D40109
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3935D40109
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3935D40109
 for <buildroot@buildroot.org>; Fri, 30 Jan 2026 06:09:29 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4806cc07ce7so16140415e9.1
 for <buildroot@buildroot.org>; Thu, 29 Jan 2026 22:09:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769753368; x=1770358168;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lLTV9Z9gp+ctwBIibI1Jvc3TUDX9yyt/tJh0EZqQ3B0=;
 b=AdZoypj16sdv09IV5MO1hCugiRQ8K/azZDsjVE07VzDqZWbkPKyDFwCRIzxWI1at/m
 CUJBCckeoi0kW6fJiFuKFwwO3JwFHqnmpFfMZp7MuKM7Nm+w0/MxlSv/PrvwA2tGJ4Dq
 /HqeWmlG100WhsXVZDHp95R9IuYwLx/LGOTu08Co2pZOkKLkXNZsiCmhqsf9feX4MX9w
 qzkRZ9trBn5RFSGJs+TPTo3J2wnt19xxZC5jHsruNiLzUgpgk9Vp2Gj+LKA4aVa/sk4+
 BkJn1kbH5FIvsMSIPcAhu45xMmYLlsUUrz1Wwndry4kTY6FYDbeNF45aixJJRHIMKlaF
 fsTA==
X-Gm-Message-State: AOJu0YwozuPLMDTo1tvxHxSOEaZ8KfZrlq9VsNbOunrjQcSfgNCPLq5L
 E7AJ38zlyE8zyVSO+z8/ruV69dUGaxKRzx/0RyNXSzXG7YFqG2QPQ0nEvVXA2Q==
X-Gm-Gg: AZuq6aJUZBQhZmSVzno2X+VEr+86Z5S0ASnHbGFo1ecMEzl8BJZoQjFePQL4hzEgsWy
 D+OncTUbAP8G5Ree9oj8dqsknqMoZ9JzgZwS+SaYw7YeVL3cmoTm9z5ChTZSbSTgI+/hsO2OBJ8
 eTbOCesoo0bpuJcBl8ArBFOeCS+Xv1UMUd5olmuEhC7q0smf7VwsCr+iGfhE6S9HNyl78Yu8+kK
 +wa4a1LQ3lYj++9njKxb/uu2SuTzdJcyGhPoVTZfIIyXg/yZkNYl4PuDSmWuwwibk9o53qIGZXn
 mC3m9hnxPsxOI51kNfdz593njpJYNN7uVZLlydcr2qOTcMaGBanNe9C7k1GBsjY/s92+/ArZNx/
 7Nbz6GOOoDsP8eyGuhOhz0eo6Ng3APdJ6ICKh44BQATRIhQ3PocmnJVVWHzESuL2GzQ8S6V11C1
 UvTUzAEmhYWv9Y2sTwXQ==
X-Received: by 2002:a05:600c:4f48:b0:47a:935f:61a0 with SMTP id
 5b1f17b1804b1-482db013b90mr19515555e9.0.1769746645706; 
 Thu, 29 Jan 2026 20:17:25 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-482dbd21f5dsm11443685e9.8.2026.01.29.20.17.25
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jan 2026 20:17:25 -0800 (PST)
Message-ID: <697c30d5.050a0220.3d0c11.f851@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 30 Jan 2026 04:17:25 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769753368; x=1770358168; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=lLTV9Z9gp+ctwBIibI1Jvc3TUDX9yyt/tJh0EZqQ3B0=;
 b=N1PPnS/dOr9d41CSN1yJno8GKenb5k3RryWnpgEnNTetqUNbHvpdrFmFuLGYFeq/rf
 RQETzZAskKsDLDjxv6zagLSny3IT6xGtX1MxC1Qrh+4LEvFu26edn/yc2BzzTGEsYkOX
 G2GsmlDiScTnb+pIMfpt3kw0MZnql40JSVSmrtOQPjm+7jdHv5Z/BYvAtKVr1/HsxBRD
 9sv2quITfEZ9MRD4uMJ4gCIs5FKahgsoSG1EYHfxHzjL6meaEH+NSEHyGnrUVLO6vNS9
 IG5hwK2xw3G+dBYl4rI6d7vwn1Li1CBT9K3WHINnstOu+Ko14EWtK2kUrKjSGnrKwxhC
 425Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=N1PPnS/d
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-01-29
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

Autobuild statistics for 2026-01-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  | 10  |  0  | 13  |
  2025.11.x  |  0  |  1  |  0  |  1  |
    master   | 29  | 72  |  0  | 101 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 7 
                   dash-0.5.13 | 5 
              libopenssl-3.6.1 | 5 
                    mpir-3.0.0 | 3 
          cloudflared-2025.8.1 | 2 
  gobject-introspection-1.84.0 | 2 
                 jasper-2.0.33 | 2 
libdill-32d0e8b733416208e04... | 2 
          linux-5.10.246-cip66 | 2 
                    lua-ev-1.5 | 2 
                   s6-2.13.1.0 | 2 
             util-linux-2.41.3 | 2 
amazon-ecr-credential-helpe... | 1 
azmq-v1.0.3-54-g819b24035cf... | 1 
             batman-adv-2025.4 | 1 
             berkeleydb-5.3.28 | 1 
                  brotli-1.2.0 | 1 
cegui-e7a03afc70c6182a091ff... | 1 
                     crun-1.24 | 1 
             dahdi-linux-3.3.0 | 1 
                 dc3dd-7.2.641 | 1 
                   exim-4.99.1 | 1 
                    fcft-3.3.2 | 1 
                  ffmpeg-6.1.4 | 1 
            gettext-gnu-0.22.4 | 1 
       host-nodejs-src-22.15.1 | 1 
                      icu-78.2 | 1 
            igh-ethercat-1.6.8 | 1 
                  iozone-3.508 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
                  libnss-3.120 | 1 
              libopenssl-3.6.0 | 1 
     libphidget-2.1.9.20190409 | 1 
               linux-pam-1.6.1 | 1 
                   linux-tools | 1 
        ltp-testsuite-20250930 | 1 
               nushell-0.108.0 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
                openobex-1.7.2 | 1 
                  pdmenu-1.3.6 | 1 
                   perl-5.42.0 | 1 
 qcom-db410c-firmware-1034.2.1 | 1 
rtl8189es-0a5d04114fac3c9f4... | 1 
                s6-dns-2.4.0.0 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
                 sudo-1.9.17p1 | 1 
                   swipl-9.2.9 | 1 
ustream-ssl-5a81c108d20e247... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/29997764f8d9e7a62a64facc14cb9f06fa25a628 | ORPH
  aarch64    | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/9aa41fc77e609a1930b6a761203954d821e1ced1 |     
   sparc     |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/8c22702721c08dadda19a8f94b86f5d7d505ae53 |     
   xtensa    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/261192cf45d8c7209c839b6605d26926bb7f9ddc | ORPH
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/a225c0add9ee28c95cef3f48f480a8d51d11ea19 |     
    mips     | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/44b1f259147f6b15ed783f63ef7564572623ed92 | ORPH
    i586     |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/e62ce26d50c099e90d6e8abf61b86a9baeee29b1 |     
    i686     |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/c2ef549328f4cc54c1653ece1f75b896033a9ced |     
   mips64    |           crun-1.24            | NOK | https://autobuild.buildroot.org/results/8e77bfa204b513ec1601310d01e4ea9365baab16 |     
  aarch64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/5cc03f9c9e18e07eae02413d92df0713c2ae40ff | ORPH
   armeb     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/e022db374e69783fd84df0c0936aa8615a8a371f |     
    or1k     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/de14771d5864fddd11a4b6fd4b3ac20cba3011c3 |     
   mips64    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/3bcdae654fae07bd3becaab11d5193a314715f2a |     
  aarch64    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/f26eff54c9ec3da524121e8f1a7082f8a135e0d4 |     
   sparc     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/28b99833ed2d902f297017b39692aba95933bf7b |     
 aarch64_be  |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/b21f2f3b5f5e552c16cd8ad5ab74552356b0a9d3 | ORPH
   armeb     |          exim-4.99.1           | NOK | https://autobuild.buildroot.org/results/9bed7f6b11700dbffdaba7bcc63f4942b8a3e644 |     
    m68k     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/0341e74073b96a591567b8a9a29e523713ba7480 | ORPH
   sh4aeb    |          ffmpeg-6.1.4          | NOK | https://autobuild.buildroot.org/results/39f4ba8dc59be769e2a851513187e60c05eccaa1 |     
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/6ea988e5e9e3f1c82df5257fd2afa7522e54f0de | ORPH
    sh4      |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/84ba2760cc719c9292bde79f55e4310e1478cf60 | ORPH
   sh4aeb    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/acd594f7ebffe8f22c7941429039a7067a5ab41a | ORPH
 microblaze  |    host-nodejs-src-22.15.1     | NOK | https://autobuild.buildroot.org/results/8e7125090d6c7860e686a1fa8d591ef5bc1456fc |     
loongarch64  |            icu-78.2            | NOK | https://autobuild.buildroot.org/results/262f06e67ff6e56264dd388e3417cfad39c5e34f | ORPH
loongarch64  |       igh-ethercat-1.6.8       | NOK | https://autobuild.buildroot.org/results/1a546ee2217e7843b852a5b79b477ef23df6a064 |     
    i586     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/2e5bbcdc338d2a19105d7d8799821ad7e80bd9b7 |     
   mips64    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/035428e0d566a1cc0794873fc1cca79afe372a3f |     
 aarch64_be  |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/c3ef0e2dd458bef2e91b693002f332ed6498bfab |     
loongarch64  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/faf73d87f3492cf1a916c8dbd60bc6da760aa912 |     
powerpc64le  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/b9a6c1e85f5c00126d68cb8394047e8cb23394b6 |     
 aarch64_be  | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/4c81fdf0c1ebd79da48f054bfeaf163111c47a0c |     
  mips64el   |          libnss-3.120          | NOK | https://autobuild.buildroot.org/results/ce1c9c2caf8656e61630789b87f6741a16c21363 |     
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/4220096c491fae0287de43512570ae433a8012b0 | ORPH
 powerpc64   |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/bd0f7934c6a9b57471c4f7a3d81cb2cda0c007ca | ORPH
 powerpc64   |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/5fc3d67e90863576ff43d443059a819f81bb742c | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/4a7c4ff7281d0aa225fc79a52220242b08001272 | ORPH
 powerpc64   |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/1081dc64dccccef765b6e53260251363f29c88b4 | ORPH
 powerpc64   |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/682630c70bc3ab479e6079cb77d8db66bb614e41 | ORPH
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/d575fa3f07462ed0e62791c47f1ca3b5f993f39c |     
  mips64el   |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/d6c048d7756f3971b6e43095a56f698d5ed888b0 | ORPH
  mips64el   |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/a5316d67754747bb4476607ccaa2999093e5401b | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/a890d69a939ea39d7bbd80a43eb12890b11056fc | ORPH
loongarch64  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/4f753bc3ae833e7c01025a27a7bed5a8f3c517e8 | ORPH
    arm      |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/d0d649114f3c53db9aac22e4a6f79f648f97ea2c |     
  powerpc    |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/1508c4ce0fd3ab437f44222c987f986f1fc2b69f |     
    arm      |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/7b71a804a000cebe8061f1c7de164bf94b37c9b1 |     
    arm      |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/836deab19e6319407ec5387706635c73513b044f |     
    mips     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/a6fbf201bdd0f14a35ece6bd7d389a2391eb91e8 |     
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/8d73c41b4ba4a8d9a21631ecfb1ae7717d6f8f13 |     
  sparc64    |        nushell-0.108.0         | NOK | https://autobuild.buildroot.org/results/db194393d63f11964618dc99e121ab68d6450a94 | ORPH
    mips     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/4a1f639c9db05ba0092685e39dbc074c02e7e83c |     
    mips     |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/f7051ba7cb2a563dc3d952cdeb1fcd70c1de32a4 | ORPH
   s390x     |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/eebeb00877740d05558620598e76ef775f2776eb |     
    arc      |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/56fc4195757ce2ea95eab34af1ac16767f4310ea |     
powerpc64le  | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/0efc1dfeb789e8bfb13281454546ba878244640a |     
   xtensa    | rtl8189es-0a5d04114fac3c9f4... | NOK | https://autobuild.buildroot.org/results/8f41b0f1e08ea5d8edfafdfbcd64188343df3f64 |     
  mips64el   |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/fc5e1259dab2ec1bfb22dbbf1a4bfcf5c8b4c266 |     
    mips     |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/97a1895ab897a0446a66e13fc204c6b63da46f68 |     
loongarch64  |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/2bbf31c21c4383baad31af1672c0afc467a8ddce |     
    arm      |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/7981b64f90a4b84e96cc32434ce4258e5d155442 |     
   xtensa    |         sudo-1.9.17p1          | NOK | https://autobuild.buildroot.org/results/d77b6043780b98769def970649fdcb76a6a98df1 | ORPH
   s390x     |          swipl-9.2.9           | NOK | https://autobuild.buildroot.org/results/0da6d1ebf9fb4ed91eb1caaf4e3fe04c8ee6b3d6 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/51064e7faea32ca3e808af79f5b938e1717a351a |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/31bc94b3ee57800ffcb3f39ea3dc3ce8a742ce41 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/b9426f364a1f71d81d66eeaa6d4210b2804775a7 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/e487c32ac45b60e68f51e93efd8c79f935a34eb1 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/f9f46c6f3f610c23495b05f51bbf986ce310acf7 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/93928c6300cf18d1e589b6f857995448a22fc216 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/176b9eeb8547c07d31feadeea0a38c5dd596a7a1 |     
  sparc64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/541103b51d874ca08e41f233657f29ab0171778d | ORPH
  riscv64    |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/c1df8bb7b715b2885b62c78eafd08a2409beb123 |     
  riscv32    |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/00dc429c6853a102f857b84d83ac06336e6e7a0f |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                  dpdk-24.11.3 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          dpdk-24.11.3          | NOK | https://autobuild.buildroot.org/results/4650b14afca5af2066cad207151c2a6b0bb9f743 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           host-libselinux-3.7 | 2 
                 host-tar-1.35 | 2 
                    mpir-3.0.0 | 2 
                 nethogs-0.8.8 | 1 
python-remi-2022.7.27-37-g1... | 1 
                       unknown | 1 
                  vim-9.1.1684 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/9a13d342ce45dcbe3130cbfc108ac24df97bec1f |     
  aarch64    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/867bc3624dbb6e9d483c02b995f882e331b1fd44 |     
  riscv64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/7c985ddafb125d9aea363ec780b52fea02197f8f | ORPH
  aarch64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/8e67122ddcb054cc800f490f6aa9bd0a748df6e0 | ORPH
    sh4a     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/902678116e15c2cd0ca558f64d37c4d4ea5987ce |     
    arc      |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/7e961af4261a6c883d0b5c37e2ebf20c632f842f |     
    arm      |         nethogs-0.8.8          | NOK | https://autobuild.buildroot.org/results/2b6e3d723b4101cef61e36e13039288923ebffe2 |     
 microblaze  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/f27996368671533c209fe59e0517f6e7263b017e |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/6c6e3032a651d2a7c1ef6bf9fc9ed3f5966a1cdc |     
   s390x     |          vim-9.1.1684          | NOK | https://autobuild.buildroot.org/results/ba2bb94e71e6ec531e575255e80f9eee4f372b93 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
