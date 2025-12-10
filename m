Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD087D2CE17
	for <buildroot@archiver.kernel.org>; Wed, 10 Dec 2025 04:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84A2D84866;
	Wed, 10 Dec 2025 04:27:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DDeHtdtOCiTR; Wed, 10 Dec 2025 04:27:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AA8184839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765340837;
	bh=wEBVtzW28W2oNFAeelbeg2eqE5Cwb2wV7tm4BqRKttA=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fE95E6XJmqpqw8QOoSQwa4L5JjUVvWQdFNLgeGTkO9ZYp/hVUR/UZD5kA8VzDg2oi
	 jDmr1PqLoywv4ZW9jEgNyQZ9DTJtA/1+OblS2LFdJPtdRbWeQ/AO0V/h2L0VWc2eZG
	 W/v9/Prt9emI6KCQwMWNpcM00PIWTkE/hlvV9t+ds7SuA/S2UH8JvQXeWZ+JmDrqrz
	 2zxH1Fhfe0DaUIMKMEeAwfxna21s2w+A8+8Xi+qs5U7iIkE3AgphErq1Qfe3EAnXn0
	 ZtdALrYNiWjT/++nWM2sRvVl2K3qUUDTwl+SDZIGkNNRLvdkRfD8LX7g8gOHtuRgEd
	 +7uNxDfIbp68A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AA8184839;
	Wed, 10 Dec 2025 04:27:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 73D6FE7
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 04:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7139740399
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 04:27:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gxHFT725QBmX for <buildroot@buildroot.org>;
 Wed, 10 Dec 2025 04:27:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1E98F4024F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E98F4024F
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E98F4024F
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 04:27:13 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4779ce2a624so81568035e9.2
 for <buildroot@buildroot.org>; Tue, 09 Dec 2025 20:27:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765340832; x=1765945632;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lwwEURTFqkV81ZqGC/fK1euHQT56H8Psrz/YFAKFqNk=;
 b=BXl3W7UrGTEL7CCV0svI7wy7igsCRGxX6YxKl03Rthnd3EzVnY5R1rGu/zExFLjddL
 vqFDEXHCtjhVDNWgb+/iMMxoQySS4nGPuBtExA8eRj7G8QXEQK2vj44+L9W+ANirtLQ2
 wK6e3l3k/FhrbIGy3EybwXvEfqbWC8Kjsh+3pph0/wQ1lfVii20APadOYNZJ7fJNFF1c
 UManJ0I249juG3aFuHao5JUwoaIPdPXH5zk4cQQv+vM2Ufk0BKfQTa5kYdJjSMAProt0
 9nFAy79w6inxC+b5LBRSkLXk1uhqN7DOMsMuv3/KMCrRUfFPIK9tpHE4rWxTIYf2oYUa
 JG3g==
X-Gm-Message-State: AOJu0YzjFflHw4GeDgacx4bSzz9QPdrZ7iJqbsIZ7Ln4nhSjpqaBJIzT
 ds2G2gYx1rZ2WHlUPyFTRggo/C7BnNNN89H37YQ9MRsLkQGbfduQ42Chq76K0g==
X-Gm-Gg: ASbGncvEdQRio+yw5W0otLil0zXDGAvxSvjMhwgedZBra1rrpnPbrFuwe0IKxFe8Azr
 89dfQJqvJDDOL3fJ4b8HgbLF4UAObGyF4WtLnviy4QGEeWEEsx+izP+gQxVKz2PrZBP0s98GwIC
 VTV1HqrMglJ6o5Q+CTfZni9ZZNwW8r6pVaWbkCHFaotPyiRkLrU2ubIhtCr4cwUDYPm+mYMFpgT
 DiQgej7rEE8XbsacHEVbDA9msDUVQ/4+LsSU5sTdaEOjjhme0Rad91yyFE70DsJL8faouCtOXpj
 vEnnp4L9KYkoSzNiTRJIX9lIl+d+vXGDyEjyoGZ4lLq4XQ8d7FgKUA41hKnnuJYfq1aQ917zABT
 HCo0lnqcxYObxS4nSdKwPsPEo7QL1R9uepXEhAmuETxufLtPHcPMCJBOWjeHQkisKBksZ8Cujob
 7FShfm1NX94EcbIOluLQ==
X-Google-Smtp-Source: AGHT+IE+/+j7bWhVDsHva33d8Z/4dSkqhU/eXqbS0p8s9VSPORT0LpLkH5fF7+00g8LXBBvthfiZRA==
X-Received: by 2002:a05:600c:45cc:b0:477:5c58:3d42 with SMTP id
 5b1f17b1804b1-47a83750f7emr10366845e9.10.1765340831627; 
 Tue, 09 Dec 2025 20:27:11 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a82d34dd5sm22839855e9.7.2025.12.09.20.27.11
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Dec 2025 20:27:11 -0800 (PST)
Message-ID: <6938f69f.050a0220.24fcd3.6d2a@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 10 Dec 2025 04:27:11 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765340832; x=1765945632; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=lwwEURTFqkV81ZqGC/fK1euHQT56H8Psrz/YFAKFqNk=;
 b=VrO/0aivKcf+s8JfJwglZAfS2K9kVgxf3i+6D4/fr1dc6EYw+x9JKopTGSD6CiY1Te
 Jx5N3QBcYOE1tr6DWQm7rwJy6WlxXN8yMU9wTUyPVaVECSeeNMqq3UYklma/B5K0vfjl
 OmUopByc3sVPaZJdo0cLK/KUuPs+m9A4QmMrkUNPexmUEoJoqBdm0F1STD2I5vWq6iI8
 RXMPV07tSaUbRGrPHtkBwwM1dnA39+qD9X+I25y5XuATH3yl5zMJvBzUA0sJmWmJ1qJ+
 B48ab9YOo7Xpe3y3WFdBMMLh4B3jH9d+6LlacBIuLIGAlG6KPvaDWVpGaJQDNTApDh9e
 JGHQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VrO/0aiv
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-12-09
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

Autobuild statistics for 2025-12-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  7  | 14  |  0  | 21  |
  2025.05.x  |  1  |  1  |  0  |  2  |
  2025.08.x  |  1  |  6  |  0  |  7  |
    master   | 36  | 68  |  0  | 104 |

Classification of failures by reason for master
-----------------------------------------------

        ltp-testsuite-20250530 | 4 
                    linux-6.18 | 3 
                    mpir-3.0.0 | 3 
                  brotli-1.2.0 | 2 
                   cvs-1.12.13 | 2 
                   dante-1.4.4 | 2 
  gobject-introspection-1.84.0 | 2 
 host-softether-4.30-9700-beta | 2 
              libopenssl-3.6.0 | 2 
     libphidget-2.1.9.20190409 | 2 
                netdata-1.37.1 | 2 
               pulseaudio-17.0 | 2 
                tpm2-tss-4.1.3 | 2 
             util-linux-2.41.1 | 2 
           at-spi2-core-2.58.1 | 1 
                    brltty-6.8 | 1 
                 c-icap-0.5.10 | 1 
              containerd-2.0.2 | 1 
             drbd-utils-9.21.4 | 1 
                      fio-3.41 | 1 
            gdk-pixbuf-2.42.12 | 1 
           ghostscript-10.06.0 | 1 
host-am335x-pru-package-5f3... | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-15.2 | 1 
              host-guile-3.0.9 | 1 
              host-rust-1.88.0 | 1 
                  hwloc-2.12.2 | 1 
                     kbd-2.9.0 | 1 
                 libbsd-0.12.2 | 1 
                libcurl-8.17.0 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
              libmhash-0.9.9.9 | 1 
               libunwind-1.8.1 | 1 
                 lockdev-1.0.3 | 1 
                   lsof-4.99.4 | 1 
                  nginx-1.26.3 | 1 
                openswan-3.0.0 | 1 
             parsec-tool-0.7.0 | 1 
      passt-2025_06_11.0293c6f | 1 
                   perl-5.40.2 | 1 
           python-bcrypt-4.2.1 | 1 
               python3-3.13.11 | 1 
rtl8188eu-967dbaa7dc0641042... | 1 
                   seatd-0.9.1 | 1 
                  snmppp-3.6.3 | 1 
                   swipl-9.2.9 | 1 
                       unknown | 1 
          usb_modeswitch-2.6.2 | 1 
            vorbis-tools-1.4.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      at-spi2-core-2.58.1       | NOK | https://autobuild.buildroot.org/results/647ef17764058db27a6fc5b75b1908bcac81960a |     
powerpc64le  |           brltty-6.8           | NOK | https://autobuild.buildroot.org/results/384f8f12d3910136365fc86ebcb0ffb1ec818d7b |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/8bc3339c637bb3f6a2550f9588609a7e9aeff10c |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/d9335f5474dd3f710dc2ca7cff3b1ed10de6e1bd |     
    arm      |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/48c9ea3e6b4284a18656057f75c9b4d92d5e1dc6 | ORPH
    arm      |        containerd-2.0.2        | NOK | https://autobuild.buildroot.org/results/875f424670abbbdf65e3be2d8479a5c9cbcea466 |     
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/c2d2324492d270d82098be4af4f095543479e48e | ORPH
    mips     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/827ebf64d3944bcec227048d886805e441a4333e | ORPH
microblazeel |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/585769ac9fcadf74625869f63bcd01ca5299858e | ORPH
 aarch64_be  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/a6f5ba79e207fd4d96e2eb2819c37effd6e3de75 | ORPH
    m68k     |       drbd-utils-9.21.4        | NOK | https://autobuild.buildroot.org/results/d0102cab14ba69f7f000ae7a88c38af9cdd4dd18 |     
    i686     |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/8aad1b580d95ed2dcf9751d4f9336d04987ea162 |     
powerpc64le  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/525a0e2aba09e4c814246eb1982cec12dfa3fbea | ORPH
    arc      |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/c280de1a9560ee841f5e36371f2a157b2cd08719 |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/84b8dc315a32b522f9d1e671f50827198f3575a2 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/d4864539f060a4ff92ce0a5b9261b75b9c5e8c2d | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/1c407960147c710f1326ec444ec0e4fb548416fa |     
   mipsel    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/4996dc71a515771cdf3907e2f6d87525d7ca65c0 | ORPH
 powerpc64   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/f4a406be007b030cc7203709ec655880959bac62 | ORPH
   mipsel    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/e5838ecbb05784e83fba91bc8ddd58b216373158 |     
  aarch64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/a080bb5c7d02e6400133fe97861b0b61a320f107 |     
    sh4a     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/b7cc12244153e9e3f388a44be3c0ff21fbdaca15 | ORPH
   sh4aeb    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/c7793527395e2d2f0b1902428c7c239b2fffe1f2 | ORPH
   sh4eb     |          hwloc-2.12.2          | NOK | https://autobuild.buildroot.org/results/2175e2db56747d06635bd2eac7c7910154b76d09 |     
 powerpc64   |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/2b9e9a49b8ecf0da50cc9cba3dd26e50c49d023a | ORPH
    arc      |         libbsd-0.12.2          | NOK | https://autobuild.buildroot.org/results/da9157bc53e4e5ec9b9db8dc80049fc331308e22 | ORPH
   arceb     |         libcurl-8.17.0         | NOK | https://autobuild.buildroot.org/results/22e54919dee26467822667b074bca2730ac1b1b7 |     
  powerpc    | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/b5a9cb9aec3abfa4a8eb58be2cb95ddec24a0e1a |     
loongarch64  |        libmhash-0.9.9.9        | NOK | https://autobuild.buildroot.org/results/e9de1aa11bfcd391265d398dd30aa6b778ac366b | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/4650315b3fc7511dab98b393ea5f293395210e3e | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/31fc3ff328cceb845e8689a9443328518fe68522 | ORPH
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/c0a04cc755de343474038124f691dbd5a86f26f6 |     
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/d66a9f3287dd44351bdb9243012a353c89af0830 |     
   mipsel    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/a59e566f0f813908a15513f50735d040dce44230 | ORPH
    m68k     |           linux-6.18           | NOK | https://autobuild.buildroot.org/results/e17da99c9ce4cf67fa1af85d7bc64bf32d428d2d | ORPH
loongarch64  |           linux-6.18           | NOK | https://autobuild.buildroot.org/results/1b1f5a6a64e8a71da53a0ba4acf1b7eaceedbafa | ORPH
    i686     |           linux-6.18           | NOK | https://autobuild.buildroot.org/results/74c4013fda41c064d77347002a333ec58990a02f | ORPH
    i586     |         lockdev-1.0.3          | NOK | https://autobuild.buildroot.org/results/69fe3f82158ea94d1837611747057afe0ce371a7 | ORPH
    m68k     |          lsof-4.99.4           | NOK | https://autobuild.buildroot.org/results/8a67d98fd267a10835ef755a32ecf3180977d5dd | ORPH
    i686     |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/78bbe5c0278e84789ec45c03377d3f09b4246b58 |     
   mips64    |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/6e311ffc7418ebf1a4789c45eef8bc4227a18c4a |     
   arceb     |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/7d71e1be8bbc2c93ca6be59a986b9c2ec0440289 |     
 aarch64_be  |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/b6c3412dfd7b0ae11427e4f09ff4c8f746641cb5 |     
    arm      |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/5935791bc6ff1881002f1c5e4adebec9de03ce73 |     
   mips64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/3794e824dc2d2b6901f72026fd1c294882ccbf4d |     
  mips64el   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/173b31bdcbf8d209623836557d30f343e4575f3c |     
    sh4      |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/028d642597d3c3a824b5eb63e488a5d08085f060 |     
powerpc64le  |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/f9a5f51f7787bc684b771a98baa261a7b22309bc |     
   sparc     |          nginx-1.26.3          | NOK | https://autobuild.buildroot.org/results/492103300f23cfa532030dfb9cea574fe422dfb1 | ORPH
   sparc     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/46b59a5174d80b68a45bd5982af9656843d9dae2 | ORPH
 powerpc64   |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/c87b00af8a1b4afc7db6614c1fddb2ad10df64ae |     
    arc      |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/13cb1ec74dd8ff94b386c39232493382f2d6a4d8 | ORPH
   armeb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/8b0616b013b60ccaf12b048213bbdc5caf81bf35 |     
    m68k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/b87a77fc44b10f5487bc7d47f025d0f67f654203 | ORPH
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/23e3e1df3cfe2603d9af839388c5d75b7c15f824 | ORPH
   armeb     |      python-bcrypt-4.2.1       | NOK | https://autobuild.buildroot.org/results/6cf061720c76fc2448950e8adcddf7b7a8680a21 |     
   sh4aeb    |        python3-3.13.11         | NOK | https://autobuild.buildroot.org/results/3fd91ce3ff8727d2f9c12f6721df922c60282d70 |     
   armeb     | rtl8188eu-967dbaa7dc0641042... | NOK | https://autobuild.buildroot.org/results/12d0a01d3d3ea17bc99ee9aca5b50d20be83a5f4 |     
  riscv32    |          seatd-0.9.1           | NOK | https://autobuild.buildroot.org/results/695379b6d19f7ebd81dac7a82371e88759c1296f | ORPH
    arc      |          snmppp-3.6.3          | NOK | https://autobuild.buildroot.org/results/9fbb80cab5ee9431b05f126d76b107efb542ea95 |     
    or1k     |          swipl-9.2.9           | NOK | https://autobuild.buildroot.org/results/96cd8efb2bec5edfe690894c52942ee752c77858 |     
   mips64    |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/c31fec16f195f5e112606276a7b943a39fb60a01 | ORPH
   mipsel    |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/5782620e072e87e08338f18fd72b6b6b4c00ca06 | ORPH
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/f1e26d539aae0fa9cc5d218b2978ec2dd78768ac |     
   sparc     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/5231765f4adcd772b2e619f0ec8a812ffbded41d | ORPH
   s390x     |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/51dd0c0c6e0ac4f7453dc1d769973019ad8b420b | ORPH
    arm      |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/52df4b96f686825eca5ee0a827ccba72619f87df | ORPH
   sparc     |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/94cdd7977e77cd622d63c0d704d4a1f1d2e3ec12 | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

cpuinfo-8a1772a0c5c447df2d1... | 1 
                   cvs-1.12.13 | 1 
                   libcap-2.76 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
procrank_linux-21c30ab4514a... | 1 
python-remi-2022.7.27-37-g1... | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/c8b7e31e94b728ba5f9d9ea33d185969d595c690 |     
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/2fde403927bbf1a85f93787c514a9a65da64082d | ORPH
   arceb     |          libcap-2.76           | NOK | https://autobuild.buildroot.org/results/72ad68507a872e7ca065de091462f8df3373bb61 |     
   sparc     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/1333ed2b0a08bd8c74e69c43439224e62e80b3f7 |     
   mips64    | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/68e37e92a13c558c993228df7e9fffd7549426cb |     
 microblaze  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/2d6383affc3c8a0518e45d13558ec71471e8e5eb |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                   cvs-1.12.13 | 1 
                     fd-10.2.0 | 1 
                 host-gdb-15.2 | 1 
    host-mender-artifact-4.0.0 | 1 
               libunwind-1.8.1 | 1 
                 linux-6.12.58 | 1 
                nushell-0.96.1 | 1 
       riemann-c-client-1.10.5 | 1 
        s6-linux-utils-2.6.2.0 | 1 
              skalibs-2.14.2.0 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
               syslog-ng-4.8.3 | 1 
                       unknown | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/02501e2bb7a1dea927e7d5fa7b6d59838f2655e8 | ORPH
   s390x     |           fd-10.2.0            | NOK | https://autobuild.buildroot.org/results/3cdea1b0f36083ca7bbce6b745e5afde4782ed60 |     
 powerpc64   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/7eb3da7963754d1ff2a073ec0a2ef899ea519c35 | ORPH
  riscv64    |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/56b6aade3ab44b13cffeb45b68ba5fb847a55075 |     
  mips64el   |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/a179eb2fd955323b93c061f2592115f24fde9022 | ORPH
   x86_64    |         linux-6.12.58          | NOK | https://autobuild.buildroot.org/results/3bd52d211b33c9bf7a9f54b2ac9acaebeb7d6f7d | ORPH
  sparc64    |         nushell-0.96.1         | NOK | https://autobuild.buildroot.org/results/c8e94e48cbe1ed3ed1a2298676c1023a1716f8bf | ORPH
powerpc64le  |    riemann-c-client-1.10.5     | NOK | https://autobuild.buildroot.org/results/abd33289d47464e45219d8c088e4580bf2374420 | ORPH
 microblaze  |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/aa4404c3a9462f8cb0f20a694c1beeedd27be667 |     
 aarch64_be  |        skalibs-2.14.2.0        | NOK | https://autobuild.buildroot.org/results/b8ed4d989f4cfc3ab808f95a7b71211273aa6a65 |     
    mips     |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/531d7976cbcceb5cae7da7fc43300e86b49f7116 |     
   mipsel    |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/ef04a4c851bbd84c11c321a83689a3dc4d82dac4 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/51c0d8e07d9247ad373d792fe11d0fe4e5887757 |     
    i686     |           zeek-4.1.1           | NOK | https://autobuild.buildroot.org/results/b3700ad5913356e821668e5f0eefcd76a48c9694 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

host-binutils-arc-2023.09-r... | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/cacdf0b98a89c511797cbbaf9a492d96003d7054 |     


Gitlab CI results for 2025-12-09
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...Py3SdbusNetworkmanager | https://gitlab.com/buildroot.org/buildroot/-/jobs/12363929787 |      
...Py3SdbusNetworkmanager | https://gitlab.com/buildroot.org/buildroot/-/jobs/12363929666 |      
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/12363929175 |      
...onPy3NetworkmanagerGoi | https://gitlab.com/buildroot.org/buildroot/-/jobs/12363926990 |      
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/12363920856 | ORPH 
        TestMesa3DRusticl | https://gitlab.com/buildroot.org/buildroot/-/jobs/12350186226 |      
        TestMenderSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/12350186225 | ORPH 
     TestFirewalldSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/12350186030 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
