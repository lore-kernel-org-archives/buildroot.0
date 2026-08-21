Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E1BC5DF81
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 03:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A133A8108B;
	Fri, 21 Aug 2026 03:27:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DteXUGowNcBZ; Fri, 21 Aug 2026 03:26:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787282819;
	bh=XnUXGpQCs9ClHnM2IqMnBOLWa+ftF9NjrH41zP/AbGo=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f/N3rjlKvX4NBti5gg3SXKpa/yIyqBHQeHQ/RrBjSETP4/9DuooXfk25hj5RN+iyx
	 atmdpRVXxNDZXA5xBEPB6pEA9WDvwxoB38EAwI1zmjxRSclM6J1v6Txmw4pyWcMhaL
	 FmwLgKHZyXFOk6cmBk+rn9AhhPvkebt6yjK8VeFIVT+LpLPdyuDIPbqGWka9GsVCpY
	 Losak0y8RICVYClU1nSKXoipU30jKhLB9Wf/dO0L86lftXrrDppm/AjHc8OmTh0R0Q
	 cqURmHP4UcY95ZbK190BnuGvdWLzIg4eL3Ma6KNppHkddjGLtxsvovmrFqJ0ceWV7+
	 Hb0/AneTHxlKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C46A810B3;
	Fri, 21 Aug 2026 03:26:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F92139E
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 03:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85B4A408AB
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 03:26:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1z2tYONX7-JE for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 03:26:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=nKej5uiL
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A2D7E40899
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 03:26:54 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-6a144c8eea2so1177563a12.0
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 20:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787282813; x=1787887613; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=r9be7bscjOCD1PT62ARrwJB6XZ3nwFq+1kmrAvT5bBw=;
 b=nKej5uiLrq3sx62yxs0kn2y9SJflGDonjKIzUTCfXcXzMs+qvhMfABedMvxt5JZJQB
 wfykW3m8O6BbJ+h8sMH+NYrwQa4aFNv5mfIdDhtCGqTZvhKM0AAN1h+eVj3R0767WqZo
 SUoXsBbfJe2kklDbKxVSHhFuPlLqyhm6r2fQNgXkG1h+G0LLrUu4oWBSkAPujeSvbqKP
 VF3lJ/NS9oKJ9dKWhx67c64KCNLkjroCps1heofEtypbBPgKaPLAMmRGOryQ+DdCeeFj
 PNMFYATHjNBnkMiYRehOgWhrT4ftje5tfBucQKuPr0aDafVJlLbKBLUPXHq7cxtXgBEI
 3Bpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787282813; x=1787887613;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=r9be7bscjOCD1PT62ARrwJB6XZ3nwFq+1kmrAvT5bBw=;
 b=BFF2zlJyXlZ5pWV37GBzPk0/smB/BgbLlwu8624pHmFLvuDWliz2obwMIzwh5ttrX0
 e6j1zozru14P6w9Yy9UnozO1TNUJl2iLBh/rO26VxfIy4jLs9BlS1gO1or39ov2G2NOz
 Q4ykdMwBUMc9A+HHCk1N0yZsXOj8O/EqYVlMi3Bs7hSJXFDZIg15GuWuKIE8QdArgAKi
 PeXVmTUGVq0xvtNZA03ZYjPK6AoZGVI7Wqfh2t1zPCglaB5pgWpNX0Hg7VWnIfDNzUyj
 6BbaatGznuv4vqJttT6Mk/k4PPIOrKVM2HEy+5SqDFaD2vKtO6Dg95r+/HBH3jyKMHU0
 sibQ==
X-Gm-Message-State: AFuF++nzYDp2kWhACsVja5zAAXaGdAOGO6Lkcse9P1jxqgXAl9BW36O9
 t3oy9EZXnm1PbMRNnXYzFXxBwHS+A03bG0RhWTTNLtblUSXJKbt4zinxVP/xxSYH
X-Gm-Gg: AR+sD12GznyOXpU5UGa+PMCSrvgHP0iX7jOcHJLzSXfvwu4GjFTxsh7knmIVv7qWxvQ
 tk9QiZEPyo+c5e+T9Rp0dx0+dV/xlh3F6d8SMgePpH4/BUOHl7K+nQkgy/OdIJr+7YH+DOQakuo
 h9YGVPVKFi84NKo9NCjgnC/F0/9VHKFSbXSXeVppXPOCryjhiEW4fduEiU7apuDbJxwgdzKo6d5
 Viukp7zm++5jdEtd6oJkslbC0YjGuWciOLyAvOEXSzU/C1k2suxouSfaMJOSYqqTYMncaczFgw9
 6qbkgULj0m7gWgQtka5DdOok32OScVVpGFpPrH6dfn9uBvjNo66zrkXdXjbRCLROP5l8Z4Rb0R7
 9Ng7d3+LLPRaF59mPdXvY7Oyk6TZHL8O+ITBl4EIn+LXJTlmI2lnOn/a1T4EREtYo0t6Nd5Pg5y
 N8BVVsQQw+4QFY5egI3XAQJwsaafue9vRCstTKthkd0kBr4YF8hG04Pz+6t1gPwNw=
X-Received: by 2002:a05:6402:2086:b0:6a1:babc:5b9e with SMTP id
 4fb4d7f45d1cf-6a42f1baf0dmr3359939a12.5.1787282812614; 
 Thu, 20 Aug 2026 20:26:52 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a3feec9e2esm4143413a12.5.2026.08.20.20.26.52
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2026 20:26:52 -0700 (PDT)
Message-ID: <6a87c57c.3716edd0.157fa1.8390@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 21 Aug 2026 03:26:52 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-08-20
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

Autobuild statistics for 2026-08-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  | 26  |  0  | 30  |
  2026.05.x  |  7  | 10  |  0  | 17  |
    master   | 34  | 82  |  0  | 116 |
     next    |  3  |  9  |  0  | 12  |

Classification of failures by reason for master
-----------------------------------------------

               libgpiod2-2.3.1 | 5 
              jpeg-turbo-3.2.0 | 4 
               tcf-agent-1.8.0 | 4 
                    attr-2.6.0 | 3 
                           gdb | 3 
                       unknown | 3 
                enscript-1.6.6 | 2 
                    flex-2.6.4 | 2 
                   gvfs-1.57.2 | 2 
               libepoxy-1.5.10 | 2 
                   linux-7.1.8 | 2 
                  ntp-4.2.8p18 | 2 
   openvmtools-11.3.5-18557794 | 2 
uhttpd-15346de8d3ba42200249... | 2 
                   bash-5.2.37 | 1 
                    ccid-1.5.2 | 1 
                   ccrypt-1.11 | 1 
                drogon-v1.9.13 | 1 
                    emlog-0.70 | 1 
              findutils-4.10.0 | 1 
               freetype-2.14.3 | 1 
  gobject-introspection-1.86.0 | 1 
               harfbuzz-14.3.1 | 1 
                 highway-1.3.0 | 1 
       host-gcc-initial-16.2.0 | 1 
              host-rust-1.97.1 | 1 
                  iozone-3.508 | 1 
                     kbd-2.9.0 | 1 
      libabseil-cpp-20260107.1 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
libfutils-c326ce0cc2a735438... | 1 
                   libidn-1.43 | 1 
                 libjcat-0.2.3 | 1 
          libmicrohttpd-1.0.10 | 1 
              libopenssl-3.6.3 | 1 
libuci-f3fc0b76040685829191... | 1 
                  libva-2.24.1 | 1 
               linux-pam-1.7.2 | 1 
                   linux-tools | 1 
        ltp-testsuite-20260529 | 1 
                    lua-ev-1.5 | 1 
          lua-lunix-20220331-1 | 1 
                 mdevd-0.1.6.5 | 1 
                    olsr-0.9.8 | 1 
               openblas-0.3.34 | 1 
                 opensc-0.27.1 | 1 
                openssh-10.5p1 | 1 
            optee-client-4.9.0 | 1 
                   perl-5.42.3 | 1 
                     php-8.5.9 | 1 
                   rauc-1.15.2 | 1 
                 rtl_433-25.02 | 1 
rtmpdump-6f6bb1353fc84f4cc3... | 1 
               tcpreplay-4.5.2 | 1 
               trousers-0.3.15 | 1 
                 uclibc-1.0.59 | 1 
          usb_modeswitch-2.6.2 | 1 
                    xen-4.21.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/1bb6d66ac2943159dd6df0543ede53716c4e49b9 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/aba52181a624297ab45bfa543eb711899d061c2a |     
   x86_64    |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/38c34144a21db9278effebdefb45cd58260d804d |     
   x86_64    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/3a808564ce54a3364d8d9d22d71640cc30ad5902 | ORPH
    i686     |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/1a9e4399cb0aca699b54082dd60ae54914b5db8c | ORPH
powerpc64le  |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/9b80577b21dac37d97cbfc161d5e829bcb291332 | ORPH
    i686     |         drogon-v1.9.13         | NOK | https://autobuild.buildroot.org/results/b8f38b0645932cb5506515d6d313b64d824c8ce0 |     
    i686     |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/e59aa8f87082dd34c8c608ca6ae9f2c57eb441e4 |     
    i686     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/a556cbe4a687e4d89da44f9ce7d74489de08ed88 | ORPH
   mipsel    |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/2d321ef28ad77c656114b3c7b5102396f3fc9608 | ORPH
    i686     |        findutils-4.10.0        | NOK | https://autobuild.buildroot.org/results/7382f18952beea071173bb7cda31a7b9f8c016e9 | ORPH
    i686     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/f11e692febed5568236565af144975a00b19a8c4 | ORPH
    i686     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/54c4cb620ba68954e58b1c8048975dd523964bba | ORPH
    i686     |        freetype-2.14.3         | NOK | https://autobuild.buildroot.org/results/2262691369838c697746d087f946fc93e41be72b |     
    i686     |              gdb               | NOK | https://autobuild.buildroot.org/results/f674e5ade681be1e752d5091166eaa294a589104 |     
powerpc64le  |              gdb               | NOK | https://autobuild.buildroot.org/results/3039c153f9761ef4e726046b4e79d6f6c56c0913 |     
    i686     |              gdb               | NOK | https://autobuild.buildroot.org/results/c0cbb8dedc73a7430b0fc6f2daea4cf1cc1e6961 |     
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/a482b9fc69ae3e500389cf1f424830b815d47466 | ORPH
    hppa     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/1a3b5f78446d76e03759fda44dacf913c9fb4e79 | ORPH
powerpc64le  |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/dceceead51622736e7cf7cc9bfc451771224b884 | ORPH
    or1k     |        harfbuzz-14.3.1         | NOK | https://autobuild.buildroot.org/results/7ca22f460902d8e416295c19ea84eb5d70976e73 |     
  aarch64    |         highway-1.3.0          | NOK | https://autobuild.buildroot.org/results/ef5347c0b756841751a5f116f8d1ea1be96a1eae |     
   s390x     |    host-gcc-initial-16.2.0     | NOK | https://autobuild.buildroot.org/results/b5cdbe5e2c6ffd062fab3e06e8a32a68ca32bf52 |     
   x86_64    |        host-rust-1.97.1        | NOK | https://autobuild.buildroot.org/results/477090b1a27efc434c9d00105b145fd5877a33de |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/c4d6cff51856b0207a4c63df3f654b9c487d1b5b |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/5a5e836ff39fdeaa4f8e5796590ebab837b91730 |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/057ce3152b2c6f53ba06168743640e2cd757b92d |     
  riscv64    |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/42b7ade9f461eaffbbafa79ca62542a69f7be076 |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/e8ed5ea14a0b9e7a458fd50cd50859babe6cab60 |     
    i686     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/7e9e26e3c8fc979d20ed2a18e8a11d43547bff4b | ORPH
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/df0d914e82ca550c92a0beeee0283b10ed028912 |     
   x86_64    |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/ed6e9532325e041c20ac74fe25209c425052f009 |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/17f8dd5775d7b3c92eaeef48a95a8ba9841b431c |     
    i686     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/b8a70355b88c430e5236d8101bf8aada2fa9d7d6 | ORPH
microblazeel | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/b7b40b439449b6aadc4bc7f4bd12d30f6a6f06a3 |     
    i686     |        libgpiod2-2.3.1         | NOK | https://autobuild.buildroot.org/results/6f2f32eb87327f3fbbe5f46885abbbfec9cfa5c4 |     
powerpc64le  |        libgpiod2-2.3.1         | NOK | https://autobuild.buildroot.org/results/62afd494390cf21cebebc4b48f2d8283fedaeda7 |     
    i686     |        libgpiod2-2.3.1         | NOK | https://autobuild.buildroot.org/results/4f49face2628e776554d7a99ac90907c06fa1464 |     
    i686     |        libgpiod2-2.3.1         | NOK | https://autobuild.buildroot.org/results/c4217258906702d47876a3476a595c13074e68aa |     
   mipsel    |        libgpiod2-2.3.1         | NOK | https://autobuild.buildroot.org/results/f80478fcb9c567b4c3a8a76ece24d1a3c15c8a6b |     
    i686     |          libidn-1.43           | NOK | https://autobuild.buildroot.org/results/ef3755d152e426192183a243bd9e10caf7dd5f63 |     
    i686     |         libjcat-0.2.3          | NOK | https://autobuild.buildroot.org/results/eb78f55fc5531b164782d4784a92c946bc93bf4f |     
   x86_64    |      libmicrohttpd-1.0.10      | NOK | https://autobuild.buildroot.org/results/7a2f9ff97caf2c32203a4c932c310a985c4b2115 |     
  riscv64    |        libopenssl-3.6.3        | NOK | https://autobuild.buildroot.org/results/e28f7cfb3e9763f173eb20d88b3af83935255ddc | ORPH
    i686     | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/bf063bed17cf88346c06b38971fa911960e52e4b |     
  riscv64    |          libva-2.24.1          | NOK | https://autobuild.buildroot.org/results/7866636486e3a0e92cb8678d5ba40d779826058f |     
    i686     |          linux-7.1.8           | NOK | https://autobuild.buildroot.org/results/526c1e88874f686e20b4098a1384cac4c095320e | ORPH
    i686     |          linux-7.1.8           | NOK | https://autobuild.buildroot.org/results/afec9a66d806072e20127ef40c1a694d3a810e69 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/3682e82f06db7378feedd520510677aa8a0d5a3a | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/61ec7120ce7f06970a72a92ff0e2a928887fa314 | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/0c7f3c4bcf356bf146c411e8acd97b1d4f85d820 |     
powerpc64le  |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/059dc710fd54093d9bfe1172c5e1836eb77ad7e5 |     
    i686     |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/54f8db3a7eda772a8a0d3460441b15fd3b558416 |     
 powerpc64   |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/87801f12ecd3ffedc5b3e76b77b108b0fb1470ed |     
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/02d1e2da6a234eb4a4c169885181f50f4e979cd8 |     
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/307aadb7e6c77818df6e78a09ece8876fdca517a |     
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/728f893a316720d59203eb4fcad8cca306d7a73c | ORPH
  riscv64    |        openblas-0.3.34         | NOK | https://autobuild.buildroot.org/results/c864447bf5dfa29f1a1cf65a0825b6c3c7265376 |     
    i686     |         opensc-0.27.1          | NOK | https://autobuild.buildroot.org/results/59b754381d83f4ca0c1bfb28b17dd53a61430645 | ORPH
    arm      |         openssh-10.5p1         | NOK | https://autobuild.buildroot.org/results/feb552b3aabced57daf38b788a09e3ef545a0aea | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/f42a94616d3aca5e2f2eac4aae33831c421bfc89 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/d1a273166a3eb378ec91fa3ee5eedd9a8ee7bb19 |     
  mips64el   |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/66ff90842be967cad268128c48121fe25e00b4d0 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/f2d81405f5c5658e346d3287cd1540c76987bb7a |     
 microblaze  |           php-8.5.9            | NOK | https://autobuild.buildroot.org/results/a3fed4e615919c310b3aa7508643b9143145de83 |     
    i686     |          rauc-1.15.2           | NOK | https://autobuild.buildroot.org/results/fcd4f56670ecd88084b255269d9c16da823379a2 |     
  aarch64    |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/264c537a19845ac121ba033236d5857df68a7c42 |     
    m68k     | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/08d6673fea0acab5292ea0d1aaa5b03a0ca97353 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/a924ccdfbd4b0f2aaa70e90e78e1748b0fe88890 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/54e772706bf128e2a6326ab291812419720eed66 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/581176ff91747971997613ee0f3bc61664b3d164 |     
  aarch64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/de941c4d4a080084d9a62812f70a7a31924526a6 |     
    i686     |        tcpreplay-4.5.2         | NOK | https://autobuild.buildroot.org/results/52761c16ea821f3f277856b9a272409003e24214 | ORPH
    i686     |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/58f261db3f1901b7a0aaef4627694a6a15ef763d |     
    or1k     |         uclibc-1.0.59          | NOK | https://autobuild.buildroot.org/results/2651b69121acc709e261deaf4c2692bf61580a8b |     
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/6cf628ff8cbb6bafb12bcda02dae997999011351 | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/47610c44bd9d5f3834eaf7547001ca674bbb4760 | ORPH
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/4f2f45cfd615fc60db70dd6c4e3feab6043705ce |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/e5c7f2a72d2a5a8924d89e6cced9b37673830aec |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/2178c202994c4fa739cc9ffc74a6521a0625b0ce |     
    i686     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/6a17cb2f5db8d3d925073076c70f3ee84c60fb4f | ORPH
  aarch64    |           xen-4.21.1           | NOK | https://autobuild.buildroot.org/results/1cdce3b29c23af44cf4fd615545266f839874abc |     


Classification of failures by reason for next
---------------------------------------------

              e2fsprogs-1.47.4 | 1 
                espflash-4.0.1 | 1 
                    flex-2.6.4 | 1 
                     grep-3.12 | 1 
                   gvfs-1.57.2 | 1 
              jpeg-turbo-3.2.0 | 1 
               libgpiod2-2.3.1 | 1 
                   patch-2.7.6 | 1 
               valgrind-3.26.0 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/06f7c44a178cc6ad90c335f4d291de647e686d6f | ORPH
    i586     |         espflash-4.0.1         | NOK | https://autobuild.buildroot.org/results/067a2f74c88a443770935ea1f51726a1242daf0b |     
    i686     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/4019c3208710ce852ce9c0c4252f2c985d13fbf5 | ORPH
    i686     |           grep-3.12            | NOK | https://autobuild.buildroot.org/results/2b80d9f1e77247b602f5f6b368fa5ec079130540 |     
    i686     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/e38c5c8c771f996c843e2b3036f03ba0e719b448 | ORPH
  mips64el   |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/3521105e49db6e82c368296d6b7d38846fb2823b |     
    i686     |        libgpiod2-2.3.1         | NOK | https://autobuild.buildroot.org/results/6932ddaaa3022ebeea6c1492a261a4a277c18d7c |     
    i686     |          patch-2.7.6           | NOK | https://autobuild.buildroot.org/results/4a374c2b4e31329d5bf7216fd4fa420a6767c776 | ORPH
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/b97080ddd58db5c409807f2d6f23654a3bcc84f9 | ORPH


Classification of failures by reason for 2026.05.x
--------------------------------------------------

                cryptopp-8.9.0 | 1 
               host-dracut-110 | 1 
                iproute2-7.0.0 | 1 
            minizip-zlib-1.3.1 | 1 
         mxs-bootlets-10.12.01 | 1 
                 openmpi-4.1.8 | 1 
                 rtptools-1.22 | 1 
                 systemd-258.7 | 1 
uclibc-ng-test-132c6134d691... | 1 
uhttpd-15346de8d3ba42200249... | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/162eb2dcaf68140de417aa1b8de866ffbd71ab35 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/6687a3d678ca6c5eb48d9bba5e0eb6c8843cc635 |     
    i686     |         iproute2-7.0.0         | NOK | https://autobuild.buildroot.org/results/3393c4548d8aa4e63197c9c830b96dd82f62d84e |     
    i686     |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/1b8f4ac9484f6f8a3574debea3e9673705345bb1 |     
    arm      |     mxs-bootlets-10.12.01      | NOK | https://autobuild.buildroot.org/results/6d46f8caf0def5c546b13c6fee1155214b5053ef | ORPH
    i686     |         openmpi-4.1.8          | NOK | https://autobuild.buildroot.org/results/5a3ae0781887d81b9ad29e52d3f3613f55ee7474 |     
    i686     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/b1678d19ecedb71343042cd9bc555367fa63def7 | ORPH
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/edeca403bef3038740ed6202250ed2b058f6a676 |     
    i686     | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/bb5b0ffd6d18bfd0ab62e5db424cca4e94ae6547 |     
  mips64el   | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/99d707aa55f8eaf9e77314f7c4ddaf6a081537c7 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

    host-gcc-bare-metal-14.3.0 | 3 
                 avro-c-1.12.0 | 1 
                    basu-0.2.1 | 1 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.4 | 1 
                  ffmpeg-6.1.5 | 1 
               freetype-2.13.3 | 1 
  gobject-introspection-1.82.0 | 1 
                host-acl-2.3.2 | 1 
       host-nodejs-src-22.22.0 | 1 
        host-python-lxml-5.3.0 | 1 
              host-rust-1.82.0 | 1 
 host-softether-4.30-9700-beta | 1 
               libepoxy-1.5.10 | 1 
                 libgee-0.20.6 | 1 
                  liburing-2.6 | 1 
            lttng-tools-2.13.8 | 1 
   openvmtools-11.3.5-18557794 | 1 
package/linux-headers/linux... | 1 
                   perl-5.40.5 | 1 
                 rtptools-1.22 | 1 
              udpcast-20230924 | 1 
                       unknown | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         avro-c-1.12.0          | NOK | https://autobuild.buildroot.org/results/362d14cee79394d34a8b31ad10a333f08e53e761 |     
    i586     |           basu-0.2.1           | NOK | https://autobuild.buildroot.org/results/681e82026ad803e010c51ee138047e1629e2af35 |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/ae926dfaed6979746bc7b61ae388eafb4ed84f08 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/f6887d28aff2a706f78e5b920b19473f525e8473 | ORPH
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/ed2b898f9e414d565e9886af28b0b163be946930 |     
   mips64    |        freetype-2.13.3         | NOK | https://autobuild.buildroot.org/results/ef30b3b61988891e9b864f6c071c76ff6e650e86 |     
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/29ee54020f356abb0d221a212f39bd9dcd16abf4 | ORPH
  mips64el   |         host-acl-2.3.2         | NOK | https://autobuild.buildroot.org/results/eae4303426b64dc66a168b9966b881272ac38ba3 |     
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/6e0f71d6776319e552e51e5ffa11145ba904b4b3 |     
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/fbb5aacbad98f6499d7e620eb87441f9147025f3 |     
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/cd8ca9698b9ee03b79abc1df9d7ab757722a1598 |     
    i686     |    host-nodejs-src-22.22.0     | NOK | https://autobuild.buildroot.org/results/34ecaa50bd00c399358657cf94c269c13af7d418 |     
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/164686ae376af551acb46141804b502c474d0fa7 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/807e68413038ddd8bb155020d6df9cae6b2f3ef0 |     
microblazeel | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/4ca8dd22528b5e11b2be6aa9f157c53908915153 |     
  riscv64    |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/979e59cf99c66a914792c0f7090eae672e297961 |     
    i686     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/801c65d77bd763a02819242d1213f2f6ee8856e8 |     
   x86_64    |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/8df2afaf064f99bb13f7f3317626708ffe3df84f |     
    i686     |       lttng-tools-2.13.8       | NOK | https://autobuild.buildroot.org/results/6a26b8749775a405f24ad870e490ea1b93ca0164 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/3d7483df2036770b84d26e856f21fd6f41846a3a |     
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/3aea109aecbb894e66d37c659d49108ba99c5567 |     
    i586     |          perl-5.40.5           | NOK | https://autobuild.buildroot.org/results/1de5bc53031b7dcb5b461cf1687eaaa1b6f67ccf |     
    i686     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/8064429cd8a7dceb8edb09a5078c72bd077762e5 | ORPH
  sparc64    |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/73f9d1b0c6137b565bf3f131f28374f9c525070c | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/f1f7af430a20595e927272b9a5d03871cab8bf12 |     
    arm      |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/c54dbf5b31ba0e94c89dafc334fcbbf9a62439bf |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
