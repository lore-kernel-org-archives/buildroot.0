Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6075EC77B7C
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 03:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A761E40677;
	Thu, 26 Jun 2025 03:15:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6EoEaGS7sSsB; Thu, 26 Jun 2025 03:15:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54C6F40580
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54C6F40580;
	Thu, 26 Jun 2025 03:15:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CACBD43F
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 03:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC86A40080
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 03:15:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yYkjQv6D41qZ for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 03:15:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 46A8240010
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46A8240010
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 46A8240010
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 03:15:01 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-607cf70b00aso956196a12.2
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 20:15:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750907699; x=1751512499;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zO1ezMrat/HXnVnznJpW3P3pvTW/9N0habCI8xfxtyA=;
 b=C8PuauB6xR5RL1cBE2unGPfX0fsonNeOhsK38qLwDeymCr5vp9BB6K4zDFS0jQg2IR
 8DdQzP0YVniDVLE5bvYhNN7cdtfY/uI4zAopeHhflKK12XyV+cRXH59rxfogJclkcbgi
 02IxwANs47toV9412pQEEdRjrruT7e714VYF/350kEAlEVpnUzjIQbp/L4IzsKvgwvhk
 n9kaftv1WlW6Sfn0ZORBCeGCytnbtdbTiv7LPLzVq47wfJCMWUgh2SfB9ipjjuk98yzh
 /d95sW1eqAml4C4GAxd87fyfhsKtDItUWOU+FIQiDulqlFl/f/itFq1v48nbzQOQW1ss
 eOlw==
X-Gm-Message-State: AOJu0YxeNUTio5FKq3/GLnmhHyZxo0wUW5/wEbrdrZDY0+LdpZ3b9ntu
 uLhHvCWWMzUeaplbVsvQcxI/uPeQmaoIzvFkvKLlDQxK8v1TPtYMN2f/jHZkWg==
X-Gm-Gg: ASbGnct75Y9CJVDn5W/ucvWwp7a0tgHLBerterV4YIT/feaMbNO8kOuAVQJhCsLR2FB
 YKIvfbt7R1RpMh51Z8OxWr5NRPprGNhe6arqIByBTq+jaFZ+qoGXLfyihK6rSQBQQLxJ7gswCjG
 nQ+OEKKiQELHyo3UUN+xDVL9KhU/t7Z0XkRbB/lQlH9f0svadH6GH4agDP1ZSg+Kca41Uc0s1NY
 fEWJBf+QRiXHYZLBMoRWPAEjgu166kX6VxwUF7grySsZ9AUpt5D/I4Xqm4/Nb5IZlg03ruNjWCG
 1eGemnQfzlqzT0xOaiUN4C0sooIMrUwrGe1Z86TAzc9NnGM7T4Arwg0uLHUXWxDYHQ==
X-Google-Smtp-Source: AGHT+IGSEzmcRH6s9ZBoSLdVcTB4GXtatprPBmkYHCOfvwwADAFJGsb5gIKdHvykUZc8fyeR3dL6Pg==
X-Received: by 2002:a17:906:2284:b0:ae0:a245:d940 with SMTP id
 a640c23a62f3a-ae0bea2fdacmr470886866b.51.1750907699012; 
 Wed, 25 Jun 2025 20:14:59 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae0a1f704ecsm462302866b.97.2025.06.25.20.14.58
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 20:14:58 -0700 (PDT)
Message-ID: <685cbb32.170a0220.133f9.e9e6@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 26 Jun 2025 03:14:58 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750907699; x=1751512499; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=zO1ezMrat/HXnVnznJpW3P3pvTW/9N0habCI8xfxtyA=;
 b=HPU+waLQaKScM9/gwHZ/OX2aKpcRm6CROW2ni2YZ10n0muCz2JjLcFrF1SIQmpHdI4
 VQ66PPRiB2vSVku19J2XJZNS7fLgh6WO9XmlJehtwi+UlGWw+ytHIHFpFY/fZw5d42sc
 HkNBvC7sFF8kD7CZGQpE+GaADA5wESWBPpgZiylyqXhypVV1niDbgbH7kuiQSbMInQGq
 5q0XTGjNCZ7NfYb+IqOGVIjNpwj0vSKnESM1o0F6VXzdQf0fVYbs0K1d3kBw79GAbuxJ
 2el8eqYd7U+UOgxxOdYpqf501/NyRCr1yOO3maO0uBqQcT1Atr9LSBNw8JjWfPumEEy+
 CQzQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HPU+waLQ
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-06-25
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

Autobuild statistics for 2025-06-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  8  |  0  | 10  |
  2025.05.x  |  2  | 12  |  0  | 14  |
    master   |  4  | 34  |  0  | 38  |

Classification of failures by reason for master
-----------------------------------------------

               bctoolbox-4.4.8 | 5 
              host-rust-1.86.0 | 2 
                     bc-1.07.1 | 1 
             berkeleydb-5.3.28 | 1 
                    bmx7-7.1.1 | 1 
          cloudflared-2025.1.0 | 1 
              containerd-2.0.2 | 1 
             dahdi-linux-3.3.0 | 1 
                     daq-2.0.7 | 1 
            ecryptfs-utils-111 | 1 
                elfutils-0.192 | 1 
          host-binutils-2.43.1 | 1 
                   host-go-src | 1 
              host-guile-3.0.9 | 1 
                  iozone-3.506 | 1 
             libargtable2-2.13 | 1 
                libdrm-2.4.125 | 1 
                libesmtp-1.1.0 | 1 
libftdi1-v1.5-48-g22b4667a8... | 1 
                 libjcat-0.2.1 | 1 
        liblog4c-localtime-1.0 | 1 
              libopenssl-3.5.0 | 1 
                 logsurfer-1.8 | 1 
         lttng-modules-2.13.10 | 1 
                 netsnmp-5.9.4 | 1 
            netstat-nat-1.4.10 | 1 
                  ntp-4.2.8p18 | 1 
           oath-toolkit-2.6.12 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4eb     |           bc-1.07.1            | NOK | https://autobuild.buildroot.org/results/d16b0c68d60bb60ecc19739c086f0429fd5234f9 | ORPH
   x86_64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/9c2e85c09aebf2b96797424861f5ea8c149691ec | ORPH
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/84801fe86543e7d7239f0a92ceeb09b790b72b7b | ORPH
powerpc64le  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/9cdf8760d97c588f2891574d94d9332497b96a45 | ORPH
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/21bd06350975d7f23ff65a791a69f37627105b25 | ORPH
  aarch64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/ec1aaeb33b93b0326eb5208a0a6abee04aec8f68 | ORPH
   armeb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/5dae1161d0b116a8d2c87a8f51f185cfd9a6f52e | ORPH
    i686     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/4f1a71baf3ab23d277260ab5ae0863a38dc39a69 | ORPH
   s390x     |      cloudflared-2025.1.0      | NOK | https://autobuild.buildroot.org/results/86eeedbc1a9f6fc24c5d7095f88b3164604bc833 |     
   x86_64    |        containerd-2.0.2        | NOK | https://autobuild.buildroot.org/results/b8586cc599333afe51aa2bf4b4f706cb4751917d |     
   mips64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/5322471dd085bfb55ed211b64908c58024ca9e60 | ORPH
    m68k     |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/4faa17af01b091349d3fbb20ad0536875bdf453c |     
powerpc64le  |       ecryptfs-utils-111       | NOK | https://autobuild.buildroot.org/results/0d4d5029b63bc626e6a0128cdf0764ac82327614 |     
    m68k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/ea55b11e0ad2f9500564160fe38beac40150b9a5 | ORPH
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/21c21df7e0dbe9c8bf0596bdfaa4251d343f848e |     
    i686     |          host-go-src           | NOK | https://autobuild.buildroot.org/results/3eb4cad2ddba887c6985e144c7aa5c0c5fdda29a |     
  sparc64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/121aef4a0695515d83bc982e6924213474205a10 |     
   x86_64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/72e260ac77a76db87a9c528e8692bbfdf3ea1376 |     
   x86_64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/70101eaff2bfeb8c79e939d8c42b01d53e759070 |     
  aarch64    |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/da6ddf60f0e0ca05f60ab59b8285a1d3c16c5678 |     
   xtensa    |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/e0ff788dee716a421eaa8c5ee64b25909aa5da01 | ORPH
   sparc     |         libdrm-2.4.125         | NOK | https://autobuild.buildroot.org/results/558de26b299333b8b7df92fd8e47dca36242d1f0 |     
    arm      |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/5f317b13b78f6a3cfcb21101600714492b38385a | ORPH
   sparc     | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/d532e897c4ad9b9829762873b24454910e08a9b7 |     
microblazeel |         libjcat-0.2.1          | NOK | https://autobuild.buildroot.org/results/cfdec2ebbc15e826fe9e33e70856104c3e23757f |     
   mips64    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/df12b5383e5bb3fe97e1c912c26f29d9b00986ff |     
    arc      |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/1acdf556d4eec879fb672ba5c21f7b446e765ddc | ORPH
    or1k     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/7eb6836fbaee6d9247d5a76a9bfad174b5113d32 |     
   s390x     |     lttng-modules-2.13.10      | NOK | https://autobuild.buildroot.org/results/bb079feed5e3856322e4de42c25bde916b9ec971 |     
   s390x     |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/7379d8f66800646286dd9906e4b9d23f23170643 | ORPH
    sh4a     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/049321bdad1881a76ae8aca22dc1bf189a887227 | ORPH
   xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/d749c6d27ec7995f851be77587d2381d09dead38 |     
    or1k     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/0e3a040fe93e391627efd00c07587866367dfdce |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/25735905ee7968b5e4c45b73a5f4ecc5174c85c6 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

          host-binutils-2.43.1 | 2 
                  bcusdk-0.0.5 | 1 
  gobject-introspection-1.82.0 | 1 
               host-vde2-2.3.3 | 1 
libwebsock-3c1615eeadb0b582... | 1 
                 linux-6.12.33 | 1 
                   s6-2.13.0.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/84191892e427f9c905453c1c80c05cb8727d33bd |     
    mips     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/298d16f47521126afb0d925016d5d40f02a28ccf | ORPH
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/52d5657e58eeb2b758f3105ef0e94a04c991560c |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/873ec25cf01d5f2b9ae7044e0b1d8d8791b781e6 |     
  aarch64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/14318e64109a7c613dd6241f3717ae0443fd1ba1 | ORPH
   mipsel    | libwebsock-3c1615eeadb0b582... | NOK | https://autobuild.buildroot.org/results/327910449c27964ca5ebd541c16e34aac1b23340 |     
   xtensa    |         linux-6.12.33          | NOK | https://autobuild.buildroot.org/results/f1612889c5829106b70c029c7aab228347510538 | ORPH
 powerpc64   |          s6-2.13.0.0           | NOK | https://autobuild.buildroot.org/results/ebbed7eca39054b78f4e9934c9710757bd6aea39 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                    bmx7-7.1.1 | 2 
              libselinux-3.8.1 | 2 
          host-oniguruma-6.9.9 | 1 
                libmpeg2-0.5.1 | 1 
              libopenssl-3.5.0 | 1 
      passt-2025_02_17.a1e48a0 | 1 
                   perl-5.40.2 | 1 
       sp-oops-extract-0.0.7-1 | 1 
               syslog-ng-4.8.1 | 1 
                       unknown | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/89d1e7a70e1a8e94be7b594e904b0f8fc87b179d | ORPH
    or1k     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/0eb22848fc0efc1c2c7bdc76b055ee4dae80959d | ORPH
   sparc     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/5c0829fa6604cc93f89c7624e92d066a59c0f340 |     
    m68k     |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/090f51e29b095278e848a6af78114499a792a925 | ORPH
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/03d42473e5d694fb59ec746fd13982b840ba1841 | ORPH
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/04eb808f9373ba8aa745ea0f8fcf2b09d4dbf791 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/babc5d0528c2e7b7ca9ead9865de44b44c90bd47 |     
 microblaze  |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/e3ef072cbf567594842e1a9a1d8652e8a19212cd | ORPH
    m68k     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/bd1b682e73831e574515865044b1d520b3a986b7 |     
    or1k     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/6b277e5aba345545525057c2141be72e9a1a5f2f |     
   x86_64    |        syslog-ng-4.8.1         | NOK | https://autobuild.buildroot.org/results/d9c569e2392ae92a12c13a8ec3765d5147182607 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/d2a8320b38357a17ca980ed807e4672876fdb1eb |     


Gitlab CI results for 2025-06-25
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462720742 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462720374 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462422109 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462278711 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462278637 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462278610 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462278584 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462278493 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462278436 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462278431 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462278415 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462278409 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462278406 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462278387 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462278351 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462278342 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462278330 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462278316 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462278296 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462278268 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462278254 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462278234 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462278208 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462278197 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462278084 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462278078 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462278066 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462278053 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462278043 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462278033 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462277902 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462277890 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462277855 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462277822 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462277790 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10462277650 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
