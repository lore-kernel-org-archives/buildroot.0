Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E198C369D1
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 03:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D114042DB0;
	Fri, 25 Apr 2025 03:10:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NJpWedjLxBKw; Fri, 25 Apr 2025 03:10:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E721042DA6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E721042DA6;
	Fri, 25 Apr 2025 03:10:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 951C6159
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 03:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9212D83C09
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 03:09:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SDG3lCQ-yHkr for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 03:09:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 73D3683BE0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73D3683BE0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 73D3683BE0
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 03:09:58 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso13012175e9.2
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 20:09:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745550596; x=1746155396;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q+TcvIGwVUHx96KtqLjuZLMDsEWo8ge2fnD3iu7xQeA=;
 b=cyUdPTemJtP48Wa2YsvBjRnlHlc2/NRvMxHirpL4Urm0OIhuX0hBqHMek4k5AJirrN
 Nr+4bSnxbqVu4M7x6pGdOAh3yLFBN+O5a1/C3A770V/2U8ZU072xoHcQu7DXFKQnZtxJ
 O4/HWHo9zkifgmhDY4eBsIwJc++B4wmP7NwaSSSQ9SxdAZaAM2PjV9wLus2OKSMmkeBU
 Ns1FWlJi1yioQXCkjM+q9JPDqsoy8y+u7W5MXMrCbypqNt4otd8cgKpSU7Omlrzq7bmT
 3voXOiTIC94cJeWxzl9FCcPQAHdYetY6GeTu5l+YmZSuxgvKBDH0T6GHmvN4QEhp/bn9
 0PBA==
X-Gm-Message-State: AOJu0YyDXx2OxSRdSnPCslFcNg/Pp4BKRZxRbwuBzPhxfbdGimwibBOy
 nh/EtJBsjZ3sybv/Z1H88vtN1tEkZAOB7MYiOqzMCYnqP652dDp43OACjQ==
X-Gm-Gg: ASbGncsEXkIsjlJrx3LqOd6TpJ/10mTWseqDeS2xzBqm/4NsQ67/2pbHMD9emygG6u/
 DsrSd5c6rGPp30HqADH4ypUBbn99uGMEX1I1XiloCWzTkV2dH/o58aYYklJp5WgOaGJdDBW5Rd4
 PicRpCl1QKWrIUQ+nP5u+Tfjil8fzLifUG5LW83fMHNj5ZbFcYreJbWvHz5A8I9PzxM90ZeLmSv
 MnD4fF/TX2vOnlSFn506V30KwqBscIDZ0z9Wbhu3XAMm3RLclNtmnMV1NkC1Y4v6MeyvWJTmzPb
 VOvJbWm43QUvzqQLeq80kRrQ4zZXO6ke2Ih4tMT7zz5dzq934ZOVf8s=
X-Google-Smtp-Source: AGHT+IGardZ/aza9Ii2hnV6mEjVRB2nfba6DcHrC8Td2Ar6Cg71TxhImuhSntBcGX6nlj5dLNixJOA==
X-Received: by 2002:a05:600c:5120:b0:43d:47e:3205 with SMTP id
 5b1f17b1804b1-440a65dd1fbmr2963895e9.11.1745550596229; 
 Thu, 24 Apr 2025 20:09:56 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d2e01bdsm42340295e9.38.2025.04.24.20.09.56
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 20:09:56 -0700 (PDT)
Message-ID: <680afd04.050a0220.186ba.0f73@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 25 Apr 2025 03:09:56 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745550596; x=1746155396; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Q+TcvIGwVUHx96KtqLjuZLMDsEWo8ge2fnD3iu7xQeA=;
 b=jBVva8gm1y9vKe30OgrdaRDion0G8C08RqZVskPMPUiO3+B7dTooMvozDAPgCRYhBr
 kxpFO8Ozj+QNEoMM2CNc0cGOLi8pi3h2YXlKtegyceHl0p512L/6tgPWoitc+FnO6Z9n
 GOx6HKyzLj38e9BKMQTLSbW8BWfxM62pRzLmuYmYP2++/8ZrguoyLrQQCQ275cF447Et
 J6+1JBcqds7VkufZqHoggcu6CJOdbZisGO55HOe1tisxCzgaNX1iQRyedXBmJYHNzCEV
 ciiYqh4FdSVywX0WHjAJ4xKSw0ahtdA3Zty95IoJE2ezJbVaSiilnnidIT9BO+/9tqYf
 QHCg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jBVva8gm
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-04-24
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

Autobuild statistics for 2025-04-24
===================================

      branch |  OK | NOK | TIM | TOT |
    master   | 12  | 26  |  0  | 38  |

Classification of failures by reason for master
-----------------------------------------------

          sane-airscan-0.99.33 | 3 
  gobject-introspection-1.82.0 | 2 
                    snooze-0.5 | 2 
                    azmq-1.0.3 | 1 
                   crun-1.18.2 | 1 
             erofs-utils-1.8.5 | 1 
                  ffmpeg-6.1.2 | 1 
                  libbpf-1.5.0 | 1 
                libdrm-2.4.124 | 1 
                libroxml-3.0.2 | 1 
                 libv4l-1.28.1 | 1 
                  linux-6.13.8 | 1 
                memtest86-7.20 | 1 
           oath-toolkit-2.6.12 | 1 
                opencv3-3.4.19 | 1 
      passt-2025_02_17.a1e48a0 | 1 
                   perl-5.40.2 | 1 
         python-remi-2022.7.27 | 1 
squeezelite-71c012ad9ba102f... | 1 
                   swipl-9.2.8 | 1 
                   trinity-1.9 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/4d0c189ae36491d207fe15d3a1fa6fd88fda4cf0 |     
   mips64    |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/46e73bb18155c83b6cf14f49bfc4b85078b08c8e |     
    arm      |       erofs-utils-1.8.5        | NOK | https://autobuild.buildroot.org/results/19c2afbb7af05e09bca0f7c290bde1de3f3c5a2c |     
 microblaze  |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/c5a2405181d8b21e776ba2158258799742eae7d4 |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/60172e4873a9082ba8b0a55d5de6fa6f406694f3 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/23910666fe3802a48392aabd11b9a1db614823e8 | ORPH
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/3dcf88e92a80b762f4dd6779b42df8f0921eceeb |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/df31d41f967b04dcbf064a62449dbfb4cf11ce06 |     
    mips     |         libroxml-3.0.2         | NOK | https://autobuild.buildroot.org/results/dfb0bec9a81524f5e61aef1365b61f3f06506f04 |     
    m68k     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/4b1cc96595b41f301c04b0875cab5e3de2bcc253 |     
  mips64el   |          linux-6.13.8          | NOK | https://autobuild.buildroot.org/results/52c35e33e38836d48fea1df29afe2cbebd592e9b | ORPH
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/98710fa100896b2bff6ef74150cfcd9144a27113 |     
  powerpc    |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/65334b18485b348db924cae2ef1cb6078b3e329f |     
 microblaze  |         opencv3-3.4.19         | NOK | https://autobuild.buildroot.org/results/571a3c7a5f31163943831a7e38cbb62c9308c7b2 | ORPH
    i686     |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/66d98f4b7e3e2f0c4efe4fecb5d7a57a8cd6252c | ORPH
    arc      |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/e23970106236e9529c18da1ca2b94b716d755d0f |     
   armeb     |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/36aa00e005b31ba033df42c31a740c0859e4701d |     
   armeb     |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/4bf9b898c359fe4efc7c76a6b14bdfcc6869b6ab |     
   s390x     |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/b77ada9b7934e86e47a7eb3a90cdf720921f4a8d |     
 powerpc64   |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/1939db80ce55a51f3de2e9d188c69cdbbe8ff13a |     
   arceb     |           snooze-0.5           | NOK | https://autobuild.buildroot.org/results/edc7f1239b1009619aa837c5ff5b8bbfb75e041d |     
   arceb     |           snooze-0.5           | NOK | https://autobuild.buildroot.org/results/7ebd3862b3aaf6f89fec672baff99816bd29e6b1 |     
    i686     | squeezelite-71c012ad9ba102f... | NOK | https://autobuild.buildroot.org/results/1cad46682d28759c17deb1822d5acab1fa2c1e1a |     
 aarch64_be  |          swipl-9.2.8           | NOK | https://autobuild.buildroot.org/results/d341a7e366b0c33d955d5a68d199c29d6f445cf8 |     
    i686     |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/5c31c86a19d309e3b89b84d3e27c75ca11af0bd4 | ORPH
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/db5f47572f3c99a6bf3186fe48fc83f17ae7b3b0 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
