Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A1CD5AE5F
	for <buildroot@archiver.kernel.org>; Thu,  7 Nov 2024 04:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8548A40760;
	Thu,  7 Nov 2024 04:14:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y7HafOkTm-UO; Thu,  7 Nov 2024 04:14:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5EB54078D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5EB54078D;
	Thu,  7 Nov 2024 04:14:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D529220EF
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 04:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C200C401AF
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 04:14:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M4JjjeSiDTQx for <buildroot@buildroot.org>;
 Thu,  7 Nov 2024 04:14:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 70B8240120
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70B8240120
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 70B8240120
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 04:14:31 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5ceca7df7f0so524145a12.1
 for <buildroot@buildroot.org>; Wed, 06 Nov 2024 20:14:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730952869; x=1731557669;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x2ZIMuPSiBG6d9FDI9lPDcSlMmk5vtrxTYSSz9Txjfg=;
 b=LWps3pKq/oKWS1Wpq8g/LQfzUWchqexlZhv1btLd+OJQUmDFX9VO9q+mK/5KAzUu2u
 FT+38/t6ilY0Z1V8B9KTN/H/EsvsC0+HCKGl/gQlfqjHzSqi4HMIRIttqWqUwZSNx8WX
 FosvcsWoTzHBuIziG8bq7cvusakzM/LN7ut53jfb1pr4+FZ0XtAL4k/j7pcX9s60FcWu
 /S6UPVAypR43FF9mTYAwaeiRhgLIXtpc/DSLtpgZkS5BbhfNRtymzB67kXBeb5IbIyL+
 eZWst9qaXwCZ+c8aajt8x4aVFyJXYjarLSOnbFhIUUrQY8JCo90iAegMjVY9VJr+NNXo
 ptQQ==
X-Gm-Message-State: AOJu0YxbtKOqz/4Y/kHB4ySbFoeHVT+vNNp83uWhBAz/4zZa1aX7FyYE
 cPnCDREKg5Qxgp4Ojolxhm5b4yzBc1JuCvovUSFSBmwzYcweVx0K7qENJg==
X-Google-Smtp-Source: AGHT+IHmGnXeDW/CxnnjxxkgH7uTuazlHddKsCMgtoRD8pV8oWtWITOr1f4b50D8hOIXbDEjC3Vduw==
X-Received: by 2002:a17:907:9618:b0:a9e:447b:6f6d with SMTP id
 a640c23a62f3a-a9e654fd472mr2063707166b.35.1730952869119; 
 Wed, 06 Nov 2024 20:14:29 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a4bfa1sm32332566b.74.2024.11.06.20.14.28
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2024 20:14:28 -0800 (PST)
Message-ID: <672c3ea4.170a0220.27fef2.0e68@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 07 Nov 2024 04:14:28 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730952869; x=1731557669; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=x2ZIMuPSiBG6d9FDI9lPDcSlMmk5vtrxTYSSz9Txjfg=;
 b=ISw8zWOctSdAd3ZjVXAIZEspYLZ65hZyfBX1KND646Y2cGOVHiTask7kRqnxUe1oBp
 aV+4V8LCAhnqVT7/CdKnDJem5TC+h//7VL+IDv9UuZ7iJVfbv7kHOyBotfDMBAt3j7sb
 HnkPoSTSchCBT3EQNhQdC0g3p2Rj/ts6EuV66fxPJDy2d0xz6NexQYhisB6iYpC6EoGp
 8TrObXDbJ8i/AHfSz1DSF8xmoUqe2bWEMYUhxa3fW7yHBlthq195nRRaYaI26Yh0pCav
 cShxx1epFOqQW4cwWuqwyOgbhfDzx+ImrXp4sfYTTsqBZ/TuyjNrzUZ0SyiOVb9YoRGg
 MPgQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ISw8zWOc
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-11-06
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

Autobuild statistics for 2024-11-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  2  |  5  |  0  |  7  |
  2024.08.x  |  2  |  6  |  0  |  8  |
    master   | 13  | 58  |  0  | 71  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 4 
android-tools-4.2.2+git2013... | 3 
                  ntp-4.2.8p18 | 3 
             util-linux-2.40.2 | 3 
             dahdi-linux-3.3.0 | 2 
                  ffmpeg-6.1.2 | 2 
  gobject-introspection-1.76.1 | 2 
    host-python-greenlet-3.1.1 | 2 
                  libsepol-3.7 | 2 
           libzenoh-pico-1.0.0 | 2 
          linux-5.10.162-cip24 | 2 
                  linux-6.11.5 | 2 
                   bird-2.15.1 | 1 
                  boost-1.83.0 | 1 
                 cdrkit-1.1.11 | 1 
                     crun-1.15 | 1 
                elfutils-0.189 | 1 
              fftw-quad-3.3.10 | 1 
              fluent-bit-3.1.3 | 1 
                   foot-1.16.2 | 1 
fs/axfs/axfs.mk:32: /home/a... | 1 
glibc-2.40-18-g564178076272... | 1 
          host-binutils-2.43.1 | 1 
                host-go-1.23.2 | 1 
host-heimdal-f4faaeaba371ff... | 1 
           host-librsvg-2.50.9 | 1 
         host-libxcrypt-4.4.36 | 1 
 ibm-sw-tpm2-rev183-2024-03-27 | 1 
                 iperf3-3.17.1 | 1 
               libglib2-2.76.1 | 1 
        liblog4c-localtime-1.0 | 1 
           libzenoh-pico-1.0.1 | 1 
                  linux-6.11.6 | 1 
            linux-fusion-9.0.3 | 1 
               mariadb-10.11.6 | 1 
                memtest86-6.20 | 1 
              mosquitto-2.0.20 | 1 
           oath-toolkit-2.6.12 | 1 
               procps-ng-4.0.4 | 1 
                  ramsmp-3.5.0 | 1 
                   swipl-9.2.8 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/9cbc3b69935ed4f469ed7ff55fb6668975ee0f8a |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/542097b1472daebaa694d7e4ed78c2e000074f97 |     
   s390x     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/840d7b190a742793b81918d58496b7422145aade |     
    i586     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/6b163068cd4da6deeadc467342b2c1f00fe3e6c1 |     
  aarch64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/01b8d51e640f24dad25317f54e9f1268b270be06 |     
microblazeel |         cdrkit-1.1.11          | NOK | https://autobuild.buildroot.org/results/6ad41bd8b6e55ecf7d6c39d6676fbd56652a87b9 |     
   s390x     |           crun-1.15            | NOK | https://autobuild.buildroot.org/results/d133f08b4988382622df7552fcc4be8819de38f3 |     
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/c1f327b2897361e732138427491fbc72a9a30a13 |     
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/5bdb94b743f7afdb3e8e9a8fdcec6c4b48f59c5b |     
   s390x     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/48747655346235c49093cb8260c9c66a19f581d4 | ORPH
    i586     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/af409de1ec28630b8d6d6706cae3bc64b90b5e32 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/558acb0e82baa4b0b480526d2e9a3814d817538b |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/72d9ac27ec057edadaefbe41b0e2fa6648bad7a5 | ORPH
   mips64    |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/485b25c7764119fde02457cf7dc8fd7eeae97cfb |     
microblazeel |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/4c80fa38b03780be3e3227cded38c5213088a74e |     
   mipsel    | fs/axfs/axfs.mk:32: /home/a... | NOK | https://autobuild.buildroot.org/results/a0e068d5b775f61199126f621a54507828133e47 |     
    arc      | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/6db62de28b4bd6e3c5f8514ba71cff034374734e |     
   sh4aeb    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/7777e9805d0584c4f1266bd9011aed538a3a0701 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/1350036331b4b73fd54b3a3c3121a332699dab04 | ORPH
   arceb     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d1b14a8dfe4d1622c8c7d81654a6b0bee6492d94 |     
  sparc64    |         host-go-1.23.2         | NOK | https://autobuild.buildroot.org/results/c5a110e137d4add5db1559dd4c86b2f2d712181a |     
 microblaze  | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/2f2fae23be4aa0fd2f20cde4be549d4f581623eb | ORPH
   x86_64    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/003435b65799d083419ce5cbe9226f46efdb26e6 |     
  riscv32    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/07a0df8fbc0e26b53a02006bfb470bfde05f52ec |     
  sparc64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/8ff64b576468c593d04b9ec2e47c7b852d66d2c6 |     
  mips64el   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/2ee411206db818f03b8f0e526bb9ed10b02354ed |     
 aarch64_be  | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/34b6608dca5ba053bd093f4c39253e354756ed57 |     
    arc      |         iperf3-3.17.1          | NOK | https://autobuild.buildroot.org/results/683f1661aa201b00b095bc95c0d70ff03f7a8a1b | ORPH
   arceb     |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/e283c35b5d7debde7956d0e578b56720905411bb |     
    mips     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/8032bc1c6c5e699103d1b526452c67bb422b0a11 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/7445c33b18a16c4b7b75757d2904609dc3db57fa |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/a9215589d0a454b2878a80b46d28b5c7cab1bbd1 |     
 microblaze  |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/41db83d80e32a0bb7a9b01c53869d12a0b033767 |     
  mips64el   |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/2f63185f3434b977a76d0fbfcaba37e7bc86aaff |     
   nios2     |      libzenoh-pico-1.0.1       | NOK | https://autobuild.buildroot.org/results/f109e8b4aba0286dcaac5cb6d4579e6d91c492f8 |     
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/fd72b354286ea8f07ca15c9327d961a23f0878cb | ORPH
   x86_64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/7d6607ba2a7f001ff120fdfd7b8a6b636f2d5c4c | ORPH
   mipsel    |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/75c2b90f12056ddbea1a8b9851cebe35a2544f84 | ORPH
   mips64    |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/7557f0eb4f51f9078d5a57538a3e638923d7f999 | ORPH
    m68k     |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/ce7a93918a5d7d3f3c85c514abecdc6ed7dfc979 | ORPH
   armeb     |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/550eacb7e0b6cbbb5684316d4a8f08098578f6a6 | ORPH
microblazeel |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/16b84d09cafb78d493fd66a4e31e5513f9ec7ce7 | ORPH
   x86_64    |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/f53ba7aea35d2e7949d5d50ea73910ebbdd4586e |     
    or1k     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/9b57d99f941d7ee2140ed50d624927eb2fc574de |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/abff834169993221d7e23f9b230f6915e6f5e6ad |     
   arceb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/253e336481d52b2d431af04f1c3f6bc4eb255b2e |     
   x86_64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/0560973cabc1f7959389425c4e0289dfef2444d3 |     
    mips     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/6ed418bcee3648888d41c62c57c4144dcb25294b |     
   x86_64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/cd344bf66f766a6cddcbe42c39e105949de8daa1 | ORPH
    mips     |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/66bd299e2ba7f9ac74a8c96d9a374c4025e27f89 |     
  powerpc    |          swipl-9.2.8           | NOK | https://autobuild.buildroot.org/results/d4f5a0d2ad33880d73e6e6f3ce13f5c74fd2bc61 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/332d159b4462736cc840dff95950165d9aea04de |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/90f23904fb9c315699f36ab9877ded5b28ffb27f |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/960899c5fd916fcbcdf10b6fa3e1816c24bcd549 |     
   nios2     |            unknown             | NOK | https://autobuild.buildroot.org/results/75503b36597f9d3c281bc144e63a91a024436a0e |     
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/b6df748f66a8730e126d0967bbc7c34eaaf6a33a | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/cdf567069c0bde9591639c4c9d0d0c44c0f64e92 | ORPH
   x86_64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/8eca25c7c332e2eafda20b64f496ae99baf6caec | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  bind-9.18.28 | 1 
  gobject-introspection-1.76.1 | 1 
                nushell-0.85.0 | 1 
               procps-ng-4.0.4 | 1 
   python-pydantic-core-2.14.6 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/0c1b3f8b2f31898b575fb72b64f9ee0705c5862d | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/ca6480e8226536e69b978df9970c05a293fd5b16 | ORPH
  aarch64    |         nushell-0.85.0         | NOK | https://autobuild.buildroot.org/results/9f3ef855f07f5358aa900c3ea6357b3cc3b78779 | ORPH
  riscv32    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/daf493cbac8cfd73346976776350947082c518ff | ORPH
powerpc64le  |  python-pydantic-core-2.14.6   | NOK | https://autobuild.buildroot.org/results/d3bb78d0f1e5a5634cfbbe854a823537d4726e19 |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

                    bsdiff-4.3 | 1 
glibc-2.39-74-g198632a05f6c... | 1 
              host-rust-1.79.0 | 1 
            host-thrift-0.14.1 | 1 
             libargtable2-2.13 | 1 
                   trinity-1.9 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/74e986daed0eb9e393769fef94824133a0b5bfff |     
   arceb     | glibc-2.39-74-g198632a05f6c... | NOK | https://autobuild.buildroot.org/results/b865a38b696f2024dfa5fdf2703f7c0f12052942 |     
   x86_64    |        host-rust-1.79.0        | NOK | https://autobuild.buildroot.org/results/fbac74a325d6ac8f89c0f0cdd0900c39d6e119dc |     
   sh4aeb    |       host-thrift-0.14.1       | NOK | https://autobuild.buildroot.org/results/87440e64b68a81e6eb730e8ee0521303d470f415 | ORPH
   mipsel    |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/1f1a0a56793597f4e66ab85452888be5d769da2a | ORPH
    arm      |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/1cae6174d18b226b3aa3b46745091bc2c9b71386 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
