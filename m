Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12279C369C2
	for <buildroot@archiver.kernel.org>; Wed, 23 Apr 2025 03:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C2348194A;
	Wed, 23 Apr 2025 03:19:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KhB5_IGEUvZC; Wed, 23 Apr 2025 03:19:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42F0981F0E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42F0981F0E;
	Wed, 23 Apr 2025 03:19:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 890451BC
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 03:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D9C2402C7
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 03:19:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qOkoXx0CXtH5 for <buildroot@buildroot.org>;
 Wed, 23 Apr 2025 03:19:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2C2B640FB7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C2B640FB7
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C2B640FB7
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 03:19:33 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so59136855e9.3
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 20:19:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745378371; x=1745983171;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aShrYjNJVBHAlgIg1SfDUnf0vH3ehKT8OK/n22GW/eE=;
 b=TKGpeBAZW9K55diHy6XBGoF2U1nYMzuXXbScPDu6BGTlswFRaqNi3Da5/BL0H1t51u
 QdJgBwimX/xaU0d9zIBuqJsNYv50VmxF3BDG4Lgw/+SczvAF/aNByAo/BMC2cPLu30CX
 m98jxkBfIiIvX8V6i/9OMOqTP/mvCwCWLOerA7MJw+pmwReRXYhC67ba8o8HRV04t8HW
 CHVtRH7XoTACB5eN8cG1+ZSMo4Kf7Odn0Rz7VbpUGdhs3D9jMnauTl9Fh4ZBTpnFIzVX
 Jai7zaZKg88+SBiLVZW3PGC0buXl5XtTUUD+aks1u/51JD12eHcE70uUsSI5bg8P7wDU
 wAmA==
X-Gm-Message-State: AOJu0YxJJMWM/0u48OR3XYJzkhvl7D5X4EIgdSL1cAzJoJCdUgcgSNCm
 EC3JMzGg2hu3BimN4lAnnbyOS0efbPOT2VEe32UIe0Yn+dJd3FSyrgcQ0w==
X-Gm-Gg: ASbGnctOnby0+jHOMwFVBS0nONOfXDpTHAA01OpyFkQyP16JYR0s+K96S/X5htDMdIu
 hcMwgNTL76n2UxMr10llsId49p0fT63It1/arUsa6t2di3/cTCv4lPfg0xxbeg1qCOem+YJKYtp
 7F5n/ApM5ttEYoYu9lotRNUMYN0wtoK+KAzvwWfR27VFsZtTrdgcsrniYdAX07op1A4LhXWIQyz
 GTsKUUCMbJivMlMfAc+84YxWtJaK8+7uQSIv28Utg0IMOn6lUKxgD/4TgmUYw1K2eV3A0BYTuCM
 lABB4eeK0uqzwYAYho3ajtqx/u0R/ISXDs0JtpPjZ7IQgVXP0i/SnXA=
X-Google-Smtp-Source: AGHT+IHaiz4udmpY20yM32YCKVvdaiAxIiKnj4QsW63qFQ/+ae69Am69aHqvgtOBuMAapYdzrUdv4A==
X-Received: by 2002:a05:600c:11:b0:43c:f575:e305 with SMTP id
 5b1f17b1804b1-4406d846ba6mr95323225e9.8.1745378371004; 
 Tue, 22 Apr 2025 20:19:31 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44092dbf7b0sm9063815e9.36.2025.04.22.20.19.30
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 20:19:30 -0700 (PDT)
Message-ID: <68085c42.050a0220.21f258.22bb@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 23 Apr 2025 03:19:30 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745378371; x=1745983171; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=aShrYjNJVBHAlgIg1SfDUnf0vH3ehKT8OK/n22GW/eE=;
 b=kVd+XlV4jwbxwCABvtJS6glJlL1dOsh6rqL7Na4fCVRNcPcA8Gac4V2lQTy0fZhK8x
 NeXQ2mRpMrOIW3NwDhvnSNz9xNCL/iJLaLAiTBQzsitfil4LmRB4Pf6O88SJnugyaq2T
 /r4DNhgqNKVhv7ZLMtWfUEYKUNwhQeNCNme9Z3YcgUDwWDdffnH7/hLbtdoOF7VMya+K
 H8kvk1+08bkAvO5E0aazOK78J09FjiKkPbMTI1/knlFqtTorOAXhBDoa3H3b8oZVh9oM
 kzIkgn117XasCA7Zt0ePb1wGJwB/nzwKMY7JLv97ZMWFYwPVmoF6ufTbeeyF9EE3FsZn
 OWNQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kVd+XlV4
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-04-22
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

Autobuild statistics for 2025-04-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  0  |  3  |  0  |  3  |
  2024.11.x  |  3  |  1  |  0  |  4  |
  2025.02.x  |  4  |  3  |  0  |  7  |
    master   |  6  | 20  |  0  | 26  |

Classification of failures by reason for master
-----------------------------------------------

                   cvs-1.12.13 | 2 
        gmrender-resurrect-0.1 | 2 
               libfuse3-3.17.1 | 2 
                    bat-0.24.0 | 1 
                 highway-1.2.0 | 1 
              host-rust-1.82.0 | 1 
      libabseil-cpp-20250127.0 | 1 
                 libcoap-4.3.5 | 1 
                  libjwt-3.2.0 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
                   linux-tools | 1 
                  musepack-475 | 1 
                   ncftp-3.2.9 | 1 
      passt-2025_02_17.a1e48a0 | 1 
         python-remi-2022.7.27 | 1 
sunxi-cedarx-b8f52d913f7372... | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/18094d89f1a5276f6f0d3e83ecab8b8de3dfe09c |     
 aarch64_be  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/ba72bfd46062f0e69236906b4cd9c6f855c51e4f | ORPH
    arc      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/4a64dc0b4c1513eff28cd9a19653695d65589120 | ORPH
 aarch64_be  |     gmrender-resurrect-0.1     | NOK | https://autobuild.buildroot.org/results/88eca16fbd0b6f81e6ac0c30f57cca3f1bb887e8 |     
    mips     |     gmrender-resurrect-0.1     | NOK | https://autobuild.buildroot.org/results/3cf354799bd091ec114b570a21e299d1e27c36f7 |     
 aarch64_be  |         highway-1.2.0          | NOK | https://autobuild.buildroot.org/results/a8d0bde2614eabb9341df348072627553e61c65b |     
powerpc64le  |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/861e5244fc301fb6ee9db263e18443e6cd69db02 |     
   sparc     |    libabseil-cpp-20250127.0    | NOK | https://autobuild.buildroot.org/results/9d566bbfeaaa56e6805b86632bd29576197b53e1 |     
  riscv64    |         libcoap-4.3.5          | NOK | https://autobuild.buildroot.org/results/9c0b675a64fb2576bc34457043f118cffe5fe555 |     
  powerpc    |        libfuse3-3.17.1         | NOK | https://autobuild.buildroot.org/results/f4aa61ad0d8a69fc59cb01f7d3c0a98a74083160 |     
   mipsel    |        libfuse3-3.17.1         | NOK | https://autobuild.buildroot.org/results/f3cfaa8ed63483858ffa32b719ea4be68ba6c4f3 |     
  powerpc    |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/b9bd5d777517bb3710e7f03743e4d14530a6fa4d |     
  aarch64    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/13beaf5fd01d96fc7999ab8b7a9632be3a77db0c | ORPH
 microblaze  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/b94124b41d2717b1aee8a9e3629af55062583f8b | ORPH
    i686     |          musepack-475          | NOK | https://autobuild.buildroot.org/results/89d2062032a5aaf8b3c33e35039f402beba1f9b6 | ORPH
powerpc64le  |          ncftp-3.2.9           | NOK | https://autobuild.buildroot.org/results/103b86c5473077cd95a245a762059a23f78c1a44 |     
    or1k     |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/7e7625cef006a357bfc4266fb39b5803068cc61f | ORPH
   armeb     |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/0857f70d28a2272e846f045ecd0234dc174a2252 |     
    arm      | sunxi-cedarx-b8f52d913f7372... | NOK | https://autobuild.buildroot.org/results/8bb531985a2845e76fa8702ff1b971973a994efe | ORPH
   xtensa    |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/4f5b7729a82b6aacea54a7c8a5350fafd2c7ada0 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  linux-6.6.84 | 1 
                xenomai-3.0.10 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |          linux-6.6.84          | NOK | https://autobuild.buildroot.org/results/4e59ad08286f190dd027f840c58971c8ee35df79 | ORPH
   armeb     |         xenomai-3.0.10         | NOK | https://autobuild.buildroot.org/results/8ea755f69cf83f745e681b346c3a67250d627578 |     
microblazeel |           zeek-4.1.1           | NOK | https://autobuild.buildroot.org/results/2ca7003ce8d68b5d831c49934021407a8c65fb60 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                 libgee-0.20.6 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/42ed5b0b754e4d6e4e8300c1ebf09b2f994f7cf2 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

             libargtable2-2.13 | 1 
          linux-5.10.162-cip24 | 1 
           mediastreamer-4.4.8 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/a555dd795bdd3fca3144d58187ca1ca02d61f39f | ORPH
   sh4eb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/4f34f67feda2cd8fd131c85cb5a6db39f7aab94e | ORPH
powerpc64le  |      mediastreamer-4.4.8       | NOK | https://autobuild.buildroot.org/results/7003cd096999bf0a073c5054707dd145bf6d65a5 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
