Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77535C43458
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 03:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7215408A2;
	Sun,  5 Jul 2026 03:26:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OZUh4XQRGtbC; Sun,  5 Jul 2026 03:26:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C490408A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783222007;
	bh=Wg0QBKjFg3V5idC+oRU+WjBjg0HvjODk+/AaHkyNKro=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M6YXjuEdyZEruspOT6OsJSYhfLaJzXnI+dZM3j+/jsNZ7BL9DTAdGTEmUh+rzHPZ0
	 MRvi9I3Lq1mBE+CSHaceYSTFHI07jVLsSPslv5vHkrB9dU7Jo2KMiPj6mGxfDM0uA4
	 eck9E/TUVqXAZ+eLr34+rT91asLy9g9h0YuX6wKyQIOzEs0iX3/VIZams5pB38gL1i
	 o8lBVrNgL1PYlJIGu3UAjRlyQj9PybdshRqc/AnHSjxAV2EYww92AN4LpfUtnkhPb/
	 uTI9emaVFaFoUb2J+nXjnM46SDU7Rk1tXLYmY6KWzXnMFMNsdbBWaRzJmqp6EHXkkg
	 nKhPK/1N4wMLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C490408A3;
	Sun,  5 Jul 2026 03:26:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EC099316
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 03:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDD5A401A0
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 03:26:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id olBwtbNZ-wbC for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 03:26:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 29E2D40079
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29E2D40079
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29E2D40079
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 03:26:42 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-493b6f1b14bso6517605e9.0
 for <buildroot@buildroot.org>; Sat, 04 Jul 2026 20:26:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783222001; x=1783826801;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=92Q5iVT27+/5D+7gNtPOYXCNMmH7zWUyikStSO4+jyI=;
 b=a4P4P2XdeWQeTs3c63QQqgFrJ0JCLnWFSqfWSftl+9ijNJ1Muly3X/QZRubr+yvBLM
 NDCIE+7MawHgBuW6/y9DYi9ZpaZcYEpBOqFQ/iPYdadbYWnnd0D2UW0zmSpUVd2wmo7T
 Wcht5VW++NmLCD9gJx2CD5faRJdcj/Bfh74qyHWzH6QZADpS3EGkr6/4RALCgtYe4xQS
 VBosLUTOGZWYv6Ii3yf5g2/U4zcMidheCMA1l7xNJBUSGPszwl5EEdXKpM32wUj/tTkf
 Yk/jSaXMQAgniVU59U/2zrOgPJDkZ3/AtxwBkiZm9saxgF7JUSmHVXh6AZkWfsWRi/24
 Ehfg==
X-Gm-Message-State: AOJu0YxKXPuZb9BVeLh+raMR5gYGdQBulFpMg7XXlQF7yj70k7B9/3uh
 14qdvjchPmFl3/ueLP9zAyJq4S935+BSGziwqjCjxmmZQe06nXyFuaILmIdj8AwQ
X-Gm-Gg: AfdE7cnuB5ghMqmjLLJZhFlljG90s4thmuLqXzIiGtpUr6Bv5RYoWIY6G41OxLxH0a/
 dXSk26uiQdKc//pk2BwQc6eiMHLh3a1ICmxxVK0JmdeuEqke0qbvR19TJ100Sz+pJBCH6GtlpvQ
 J0Cd1r0nO8bFgQn0ZldZ9IDvXyDjZnzfuDkiKGpWoHmSyQdgilrSNFCVCy1q5X0zNc3MypeDjEa
 FI4o8YYPnBzB+2oi6YBaUOnqGDFj+RzU/HNmyn1QE4/Fk/SqujRRaEz/sJvNiI/uyjI4WJlDNiC
 MvlbSCmFgzG9AmN14FfyKOghT2/tZfvawgTAM4DDjQ3+xwEaZA10VEu8cy/FBwiM20hKKNGoDMA
 BNvkDTsson5i9p7TUx7nrkDrXI+WWkh0p6tLBSfgaBwvP+HmVaVUCjAr1oZUEQUVvNsSHbNxChf
 4KBiCaOaNviuqBaFQ=
X-Received: by 2002:a05:600c:8b6e:b0:492:40df:d49c with SMTP id
 5b1f17b1804b1-493d11f373amr57383575e9.23.1783222000293; 
 Sat, 04 Jul 2026 20:26:40 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493c637bc21sm452365405e9.7.2026.07.04.20.26.39
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 20:26:39 -0700 (PDT)
Message-ID: <6a49ceef.a485311c.3b317.f7b9@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 05 Jul 2026 03:26:39 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783222001; x=1783826801; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=92Q5iVT27+/5D+7gNtPOYXCNMmH7zWUyikStSO4+jyI=;
 b=KMOmjik2nC/LiJ1IN5tEgUHbMOlDIixlZFlFqHDe0uhBnn9TPpiPPLHJAApb8rHjDp
 +mQ7OsnovIUDhsNcvyzpIAyl26ccGthrAoFAO8wPS/5lzWR200BB4Sq8bKsWYbNUqCRm
 e+x8W4BjSnpHtILwZlvEWVVMy4Jk8w2n1ejKGBMwdvUkYUE1xbDkvZeRj/xY8Ia+etsU
 evn2R1gDOSoPwCPXdVgGHCcJuiWItlkagiVd9UWKa6Z/reXMHs1b0buox2zZ4VhgD3OJ
 wna1Unw+b5MIWS/m0BqCZ+eE8Y2BQv9hb7oeJ/Qo7+kkO8bIaAKm9XWwSVpVt7DxAk8v
 +t8A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=KMOmjik2
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-07-04
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

Autobuild statistics for 2026-07-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  |  7  |  0  | 12  |
  2026.02.x  |  0  |  2  |  0  |  2  |
  2026.05.x  |  1  |  6  |  0  |  7  |
    master   | 47  | 295 |  0  | 342 |

Classification of failures by reason for master
-----------------------------------------------

                     apr-1.7.6 | 63
                 host-tar-1.35 | 31
host-gobject-introspection-... | 14
         linux-headers-6.6.143 | 12
               host-dracut-110 | 9 
                   perl-5.42.2 | 9 
         linux-headers-6.18.37 | 8 
          host-binutils-2.45.1 | 7 
               tcf-agent-1.8.0 | 5 
                   ccrypt-1.11 | 4 
             dahdi-linux-3.3.0 | 3 
docker-credential-acr-env-0... | 3 
        edk2-edk2-stable202602 | 3 
            host-binutils-2.44 | 3 
    host-gcc-bare-metal-16.1.0 | 3 
            host-go-src-1.26.3 | 3 
host-vboot-utils-7dfa482d6a... | 3 
                   linux-7.1.2 | 3 
         linux-headers-6.12.94 | 3 
                    olsr-0.9.8 | 3 
            18xx-ti-utils-R8.8 | 2 
am33x-cm3-fb484c5e54f2e31cf... | 2 
                 dmidecode-3.7 | 2 
                    frr-10.5.4 | 2 
                     gzip-1.14 | 2 
host-am335x-pru-package-5f3... | 2 
              host-guile-3.0.9 | 2 
                host-odb-2.4.0 | 2 
              host-pahole-1.28 | 2 
         host-ti-cgt-pru-2.3.3 | 2 
                      icu-78.2 | 2 
            igd2-for-linux-2.2 | 2 
               libepoxy-1.5.10 | 2 
                libmpeg2-0.5.1 | 2 
          linux-5.10.254-cip72 | 2 
            minizip-zlib-1.3.1 | 2 
                openocd-0.12.0 | 2 
       sp-oops-extract-0.0.7-1 | 2 
toolchain-external-bootlin-... | 2 
                       unknown | 2 
             alsa-lib-1.2.16.1 | 1 
                   atop-2.12.1 | 1 
azmq-v1.0.3-54-g819b24035cf... | 1 
                  bitcoin-31.0 | 1 
                    ccid-1.5.2 | 1 
          cloudflared-2025.8.1 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
 docker-credential-gcr-v2.1.30 | 1 
                 duktape-2.7.0 | 1 
                easydbus-0.1.0 | 1 
edid-decode-6f117a8f8c0e76e... | 1 
                enscript-1.6.6 | 1 
                  ffmpeg-6.1.5 | 1 
glibc-2.43-27-g4070d808bea1... | 1 
glibc-2.43-45-gdae425b55420... | 1 
                  gnupg-1.4.23 | 1 
                 gnupg2-2.5.20 | 1 
               gst1-imx-0.13.1 | 1 
          host-automake-1.16.5 | 1 
          host-binutils-2.46.1 | 1 
host-binutils-bare-metal-2.... | 1 
               host-gawk-5.4.0 | 1 
       host-gcc-initial-15.3.0 | 1 
       host-gcc-initial-16.1.0 | 1 
                 host-gdb-14.2 | 1 
                host-kmod-34.2 | 1 
          host-luarocks-3.12.2 | 1 
         host-opkg-utils-0.7.0 | 1 
     host-qt6declarative-6.9.1 | 1 
                   i2pd-2.59.0 | 1 
                     kbd-2.9.0 | 1 
      libabseil-cpp-20260107.1 | 1 
                  libks-2.0.11 | 1 
              libopenssl-3.6.3 | 1 
               lightning-2.2.3 | 1 
               linux-pam-1.7.2 | 1 
        ltp-testsuite-20260529 | 1 
          lua-lunix-20220331-1 | 1 
               madplay-0.15.2b | 1 
                     mtd-2.3.1 | 1 
                   neon-0.37.1 | 1 
              open-iscsi-2.1.9 | 1 
                openssh-10.3p1 | 1 
   openvmtools-11.3.5-18557794 | 1 
             parsec-tool-0.7.0 | 1 
               pcsc-lite-2.1.0 | 1 
                 pixman-0.46.4 | 1 
   python-pydantic-core-2.46.3 | 1 
            resiprocate-1.13.2 | 1 
rtl8821au-bb26b6b06c47b79c1... | 1 
                 rtl_433-25.02 | 1 
           sane-backends-1.4.0 | 1 
                    sslh-2.0.1 | 1 
              strongswan-6.0.5 | 1 
                  stunnel-5.78 | 1 
                 systemd-258.7 | 1 
                    szip-2.1.1 | 1 
               trousers-0.3.15 | 1 
           uboot-tools-2026.04 | 1 
                 uclibc-1.0.58 | 1 
          usb_modeswitch-2.6.2 | 1 
           virglrenderer-1.3.0 | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/5d22a4035572c99a5ca980eb808cbe662212f541 |     
powerpc64le  |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/0e675ded6da7e2e90f033b5dfae707c07d8320f8 |     
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/80981149b547084242b8fea5ef4ab8e42c25faad |     
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/015a0522c099346147c8b989b84b33264e87ea82 | ORPH
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/6302fd25ea21a3c5921f28ccf7ed6945115e9ff2 | ORPH
  riscv64    |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/c984b7cf9090982d46c5c10faf6bb5e00124b9e3 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/ab84b5da565b7ca787d482e41e06faa62857900a |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/95c8ce274dee549f82b2d21bd3cc5cba92b7e512 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/0f07a0e002a84e171bbd25fa8299d54213d3ed64 |     
powerpc64le  |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/0312e3539b745fc4484613f9014b1473c0f1f318 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/9f615fe3b82f0981431548d8daa5320c9b8caf84 |     
  riscv64    |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/14ae0302f36599bedf15deeb8f4e93515b3cfc7f |     
   sparc     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/0e7163369e6d85d86e57fe958431d5824ebd439a |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/9eba060c1c1e6b90a6adec1981728cae20bacb1d |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/c4c6a28e212cfa9666d881726faba3ecaf3ad5f2 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/6898d5c70009793209c313dbbc41a5cb98d240d1 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/5794f3b2af38c5a858b5357f6d5419a61e563ad3 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/2bb9f39df97c79ef098283f18a0c9b11ae662605 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/d13a6399d0a7d677d6a7ef4b095ce98e4687c1f3 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/6e90ed309f2cea0c914190cf13ba48785c962aa0 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/44271099fce93c6b1fa91e60970b3800b379a635 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/303756837f8cd8e6319b44a993622fcfa703eac2 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/b49872ae8ebbbf70976fde5f5d88beec98f3cd0d |     
   x86_64    |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/c27d2ad86cc02cceb390815ea21209c166b02925 |     
  aarch64    |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/e66d66cc6b16058e1e0d01a9ad5e3488d337600f |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/5a99f50ed3c256fb73ec930d5c3056e0e2f9feec |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/4627067e89f476bb4406f4479f85fa77320cb9c9 |     
   x86_64    |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/4d5def24cdf4d4462651148bf4e6f62e4d6c0e83 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/f3ebf7330ea87ad9912d55a6c1c9d79406490e09 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/68670d23086fb10dd47510f8f8c5609c2c49d410 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/334b9f1186a9529f472a915f532d4f3d8a78cc4a |     
  aarch64    |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/b31f0e690b783173c397a4bcad12a7f292c90e96 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/edb3b7c3cfc5b58b65af5d327ee7dfc6ff9eb0a4 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/1552954901ba336d02383a74d00a07c83a768929 |     
    i586     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/1516ead260d38fd8415dc39bb77a05f846c776d5 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/1449471be6b6d02ce11f7114f56c03ca77c9c0ee |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/4e409aab8fe14175122e979016faa43b7c48f7ac |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/aa0d2b205a471af8d76e9fb599ef9589a032c365 |     
    or1k     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/7c635615f2d1b887ab592007d4b3cb1f1f91c397 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/fe16f678b2a24e4779cedb155aa3a95ff082a8e6 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/4cd331c632e699a518086ba721617a4d4720b722 |     
powerpc64le  |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/5f1887051b5e39f268427542ba337c04bb15a77c |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/33afbb1d506b5b2d41e4d90e6dc633fd5f77a483 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/7c01670aacfd3c790801efb364aa36f57308eef6 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/f05bfc13e6189e6d51ed93245be882e069908b2b |     
  aarch64    |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/20ca060a564da3b920d0498da473e3a63ca56775 |     
  aarch64    |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/2358673b99eea1fbef78ccb8cf94b4b517e451d3 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/425d861c392bd913df5daabf5e1eadfc9d9f84cc |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/8fdcf4dab3f51fe752a371353ba3b79f70c05f69 |     
    mips     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/f5e7bb65c75b48c7023c9808c58e8839fb585068 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/399c419dbc9bdf5e7fca75e8e1c114b1f682d458 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/f396be8897d1bffea5120b33bc1abee809fb684d |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/67fa29d8f06ad17e099c0d3ee457ad65d683ca4e |     
  aarch64    |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/a3e4b8591814242bbe4330ee5e2decb05364c95f |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/bfe5f6d35b5e03c72b5ff1f912b8089edbe70017 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/ea47c464af79e8a1522af422dcf82b1606a0485a |     
 microblaze  |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/0e1cfd968f8633ec30a3cf1932acc611805f1c5a |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/a1558a171fff5c117dbf36228c9a31c1ce5830fd |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/872a737bcaeea10c39a78bd8c7aba8047d25ce67 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/011be3d58d1becc8289ff1b4bc22b5c46c738712 |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/ea9cf4cd429d8e40436009fc855223514c2257cf |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/a8472ab154ece58743c8eb2a459678646ef8eed5 |     
  riscv64    |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/887350e8e769cf77cd16f6ab6a5289f4c1c39ba7 |     
loongarch64  |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/d913f28bf2ebac10f33728ec857ea9acd816e20c |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/6034598ed663e9e7a3bde2cf64eabf0dda8326fc |     
  riscv64    |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/4d1e1a97b8741724f0aacbbc4ac236b34db49cac |     
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/80cbdf079481610ac2b2cbff85d9a43cdf4730e5 |     
   mips64    |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/d167a2e5e275a8e6816347fbce7a694ebf44ee1e |     
    i686     |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/b9fb9189d4b4209e506b74c733349d73986b9603 |     
    i586     | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/868c896d3b9a483de5cbcb987d85477c070ff963 |     
    i686     |          bitcoin-31.0          | NOK | https://autobuild.buildroot.org/results/297c18936b3eab4bfe4bf7552254643f194c3432 |     
    i686     |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/e7b89337b552d2847f86b85e845e2a4201616196 | ORPH
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/3b6cf81f310dbd3d6f33f1afdcb0a69d887664d1 | ORPH
powerpc64le  |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/2f24bb13a6af2c386c2a227e07d99af3b42e2360 | ORPH
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/3ea4868fe76690f54a8043f45c5ead66189e1957 | ORPH
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/8159ccb39c0f92ce4f839b49700ef7436c4216f8 | ORPH
    i586     |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/ebbf9923ec183522f73240fe8354833faba5c83f |     
  aarch64    | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/0528631b12a6fafd4bfba76f9113df3e03298321 |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/9d72c5edc8bab76511e4d167c5e686703f141424 | ORPH
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b4125389d99372424288945032dc364e2a413eb8 | ORPH
   mips64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/ca28e6f6cd908e870ecfd8887480dfc7f564e778 | ORPH
    i686     |         dmidecode-3.7          | NOK | https://autobuild.buildroot.org/results/7b782c751232bd29366e4dde552d661ce6f984bd |     
    i686     |         dmidecode-3.7          | NOK | https://autobuild.buildroot.org/results/08d28727f2b07f129032e7eca166602b636b3f6c |     
    i586     | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/c5b2f7219d62174b7e2a58f3964fa623307e2636 | ORPH
   x86_64    | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/5b57071110fda1131c6f6e0f03790678569a789f | ORPH
    i686     | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/449b34c1a25af3ae793596958a5f49d7304f49e2 | ORPH
  riscv64    | docker-credential-gcr-v2.1.30  | NOK | https://autobuild.buildroot.org/results/5731ac5a8647edc9866f50802f8d02070c3dba4c | ORPH
    or1k     |         duktape-2.7.0          | NOK | https://autobuild.buildroot.org/results/e6ec0e910ea7ee965075b1a09ee4210a00da47c0 |     
    i686     |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/e030737a747e40ad7d9d0e693e095a7d64836c96 |     
    i686     | edid-decode-6f117a8f8c0e76e... | NOK | https://autobuild.buildroot.org/results/25546e9734b8c1898297af23aa0b1807307b34c0 | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/505b2cef4a1dc549e060db808e8ee548c11ab834 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/71651f49a5f9b19c0b808f4c5060e19eb79f496b |     
    i586     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/9080015c5ffa00cf6454133ea7cbb359a0d1156e |     
powerpc64le  |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/f2bc5073383aedbab7d939b259fcf4ae7fb91495 | ORPH
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/8431fa2109bdf9208cbb4da4114426f2868dc732 |     
    i686     |           frr-10.5.4           | NOK | https://autobuild.buildroot.org/results/5313ede9819273dd85188d3dc442ebfa9a1e3c26 |     
    i686     |           frr-10.5.4           | NOK | https://autobuild.buildroot.org/results/26d838553c1de1f8cc9ee1c0d397fb4af0f4016f |     
  mips64el   | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/1e2003797f2ddb65d5f7e65226a1097cc4d54803 |     
    hppa     | glibc-2.43-45-gdae425b55420... | NOK | https://autobuild.buildroot.org/results/27b5b2f2cd37bdea5422442d4ab620750c861f5c |     
    i686     |          gnupg-1.4.23          | NOK | https://autobuild.buildroot.org/results/3bbee48433ca2715b1a48ce0fb0e9cf22302e4c4 | ORPH
    i586     |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/9ed48f9398f212d12e667dd12de131ad60a226fc |     
    arm      |        gst1-imx-0.13.1         | NOK | https://autobuild.buildroot.org/results/9b427aa1556d64ccda71693fd1877c18ffdc7a2d |     
    i686     |           gzip-1.14            | NOK | https://autobuild.buildroot.org/results/700a15242e3b1cfd80b1d7536c3460b026ffd3c0 | ORPH
    i686     |           gzip-1.14            | NOK | https://autobuild.buildroot.org/results/41a9dc4a43f37d00a861326015e4496c52e9a2d5 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/84f49a4574ef84bc0353ee76b0eb3ec45fc4781e |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/e69fdf967e4cd14414ec0cea2e1aec3fb99adf03 |     
    i686     |      host-automake-1.16.5      | NOK | https://autobuild.buildroot.org/results/f38aef4b568c5795da012b9e9e4f8f6772c3c0cb | ORPH
  aarch64    |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/40fe9165851d0bbfce77b151b6ee9e5d904c9126 |     
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/db6f9c95eabc269a222cc5772512175ffb0ac5d6 |     
    i586     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/5e1c966c9ac8be6e3f6e0cda83d984b2c4fa0066 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/e9b776df0866a6223c40942554a224d9db6a0b2f |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/dcb365a17169ee777a2597f8cf3e28ff65d3306b |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/995b34ae7b7d0ae18b14661f0012c499a2d3bd71 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/c65c89cc4b77403702173c5790f54ba4df3888dc |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/d0877303ffece8e6d2c8120fe92481cc62313ca7 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/436c88aec8b3494ce3946e881b85ece4fe3d2b4b |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/b1fbad5ea77190f2b01e285afb37a8b5e66aac9d |     
    i686     |      host-binutils-2.46.1      | NOK | https://autobuild.buildroot.org/results/d6affd7b8ab7396769227cbd93cca01a1f794015 |     
    i686     | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/46d63e70a4a9bf3730af31b1902c801ba3cf9ce0 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/5ddcd9daf09522bebe4b92370a1af1430954d7cc |     
  mips64el   |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/979f0bc828efa493ce3d76dad1f715d90cfecab4 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/d856216a0668139647ac98cf8015178681cd04be |     
    i586     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/9c363b0443648b5de2811ffb43821b19b79e6c40 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/a8a6bbcc404d34c8fca3acaae53cc16b37d671d4 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/4f34b3f592e0515286fa331cf80bc3696ac68ee0 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/0b1a0df4528d5bd4b4057ce57ed6f6643759a261 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/4d78e96f1c7a5008394db89d4fe241228a552419 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/d20dedcc11b0f605ca59e4c80786b4a4959f8def |     
    i686     |        host-gawk-5.4.0         | NOK | https://autobuild.buildroot.org/results/1c6d191861c6c8032494508ac34973cab598b39f | ORPH
    i686     |   host-gcc-bare-metal-16.1.0   | NOK | https://autobuild.buildroot.org/results/ffcae32384580052779442b847c1d990d85429d9 |     
    i686     |   host-gcc-bare-metal-16.1.0   | NOK | https://autobuild.buildroot.org/results/8f292c3951758b18a23a727f723b4e7b3b60f9d5 |     
  powerpc    |   host-gcc-bare-metal-16.1.0   | NOK | https://autobuild.buildroot.org/results/e25cb3a78b8ffbc1a29d3769a8150228ab283d40 |     
 powerpc64   |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/6ef9a963cfa827babf48632c20e816e89e94c1f6 |     
  mips64el   |    host-gcc-initial-16.1.0     | NOK | https://autobuild.buildroot.org/results/e0e8ee57b9dab27c2a0af728d7b8e485e2d535b8 |     
  aarch64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/012839d73474b9b7f121dc70f7e90a45ef15ee5b | ORPH
    i686     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/3fe19f278d5b108efe3721c9ba9c823b324b6067 |     
    i686     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/9d842c5b0d4b878af7cf03234a178f51171e2ba1 |     
    i686     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/e56d5e8d6bd55a3bf59e566739bc10256963e5c3 |     
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e0d6efc09721eb36fedc46b38071ca5c053cf5b7 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/244391483f1654a1c7e30f4f0a35ebecbecdd2d8 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6fbee77d771d3ee9a0ae9c5b09f708389c97015a | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2ed0b6d964015a255e886463538469deee2d4d26 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d426dddaef45c091d55026fa453d69945dde2b2c | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/70ee59bd11ff41f1edcbc0c6c0d22952aa8fdec1 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/70621436e9b85b52567210bf4f65d52e3c9adc22 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a4ea839423f04145e3ce3fc3925dbc7e2eaf5797 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/de73aa6d64d2b009a3c5d1d645ad46833259d624 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5e937ef78dfbef70b9e0f49e3dbf967c87a5702a | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/cc21a1a485bbb7c9aaf8a70b8cb12a63f52987de | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/09d5bacad2f2a51bd429c6e1731868aaf8e60cef | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c7cb9d4098096a4a08c05d508c531889d465890b | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a33e79875d66531d9492906cb63ff7fb1e808020 | ORPH
  riscv64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/baeef4fab02da02fc28beb8715f32c182108ee92 |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/049a294b05aed3362b77ee3025b623a93c89d7ea |     
    i686     |         host-kmod-34.2         | NOK | https://autobuild.buildroot.org/results/fdb3c7caf11c0e72df42ba6440de85839382c89e |     
    i686     |      host-luarocks-3.12.2      | NOK | https://autobuild.buildroot.org/results/38ec6110f05fed06f1533233eb06ebf907d1ed0f |     
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/e54aaf27afb17183612f8150d2ae3511f28ee723 | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/4aae4e542067b2c962a03451a2a8028b7744b383 | ORPH
    i686     |     host-opkg-utils-0.7.0      | NOK | https://autobuild.buildroot.org/results/8aef91f30969b8c02848a59a4789b2075be7493f | ORPH
  mips64el   |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/dc8d177aedf8ac74340be122e8fa8dc84eac391a |     
   x86_64    |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/a948524a6ac4bba6860d461a0f07ae7c888b88aa |     
    i686     |   host-qt6declarative-6.9.1    | NOK | https://autobuild.buildroot.org/results/913fc0e81e5061866b952b33699951810622fd46 |     
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/7153f457806e49184c54a5e528031da75512758c | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/3f32986d38eb059f314a780c5c2bb313bbad8279 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/954e0d7adf98b45dc1a80f9f27694522ce9be145 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/30c5bbfcbc9ded59e68b20b7f8985edac9be6c96 | ORPH
  riscv64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/95957c902652fbaed1bb2ebaa76471cc4cd2c2ee | ORPH
  mips64el   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/91a48b2eb49777b6484e63500ce80ec82198bd08 | ORPH
   sparc     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/0c0447f0663310cbca2837fc983f6d9d29e3c250 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/4a345e5644dfaf8371d812124e0de7128cdec9bb | ORPH
  mips64el   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/5d3210696d93f05fde29d5d291eb56443c873216 | ORPH
  mips64el   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/3e7ffb83acf681b8b113425192f9e849ab0d8c37 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/cc4dbb5ec8677cb60ba192c762ecb5c033ba5ae8 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/6d35a4872b9f9925385d82a57e61b004670fbee0 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/0e1a8265c3e229d4dcdcf5f3d5d7a8bf2efe9100 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/6f5146f4d2da24c829303afc6fadfa64745e133e | ORPH
    i586     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/088054e9ae3dfd81d4cd99b081d54aad3e196335 | ORPH
    i586     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/6127dfa9a61f57788e574db241e33258c9f457b7 | ORPH
microblazeel |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/1232e7488e7488ee2fd9cdea4f39002f0f4e56f2 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/db2e89ff6b22b986a7a3fdadcbdd1aec41e3d482 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/f323518623cefe38f507b881d264784272122b1c | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/cc10f52071ecde84b93661720761a2a5c2b7ab5e | ORPH
    i586     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/30d240952d136edd58fd92ce91a65514f4c50fa6 | ORPH
    hppa     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/585cc85916e17dee3293f6387d5492379665d728 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/8debeb96e5e12bbd5fb4975ec3d09f4e4af25a3f | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/3188b2d640fceaf7c2bd440d1e6baffa0e122933 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/e05f7e55f9f0b3b82567ed3866e0f8105d575f0c | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/018c5b01ed17a9851f7309d1dc7448a4c89391f2 | ORPH
    arc      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/5480982eb22c754d3a2c24ee29e6d6e1e5578c53 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/eaf18d6ebb779504859e0ee43f006cdbfb5bdcc6 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/58aeabad4dd47b161f45d2c0afea3b76ca2853e3 | ORPH
  aarch64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/7c3c87beac4625b9a6e75f88874731248286bd2a | ORPH
    i586     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/5077927bfb59634fbba91c9a32298d0ff762219e | ORPH
    arm      |     host-ti-cgt-pru-2.3.3      | NOK | https://autobuild.buildroot.org/results/7d2855a230872cfe861957fc95b43a20e6278733 |     
    arm      |     host-ti-cgt-pru-2.3.3      | NOK | https://autobuild.buildroot.org/results/19c054c8b34872d9682b0c4c6017b07ba2867fb7 |     
  mips64el   | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/699f30838e7f6f49b2c5ef2dda2a565f4754610c |     
    i686     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/a8f8361b8837d7ac515e85d18c32af8dab263050 |     
    i686     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/c9bb2a7cb920f3f49503da4ff8031f94229da496 |     
    i686     |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/80f49d10abd39eebcfb44dd76af7c7f81da31d33 |     
  mips64el   |            icu-78.2            | NOK | https://autobuild.buildroot.org/results/a3d6e06ec377fceefb16050f4c5c3474f9c2fd28 | ORPH
    i686     |            icu-78.2            | NOK | https://autobuild.buildroot.org/results/bdd4df76428dabba34871853860df73d8eed1ca8 | ORPH
    i586     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/211a37521383d2ba7821135fb9b991de8aa10fb9 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/813227945fe87069886b25d62b621d9dcd07cfc8 |     
    i586     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/5ac6b405e8e0a74af224e02c18dbd0c8c35ff26d | ORPH
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/942f72518899406f9e5b77bf4052ff4d10800510 |     
    arm      |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/58cd12a74ab342a29ae68a94d723f397b2a1bdb2 |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/e127c089a991a730e255b236087c8e2b6e2a54f7 |     
    i686     |          libks-2.0.11          | NOK | https://autobuild.buildroot.org/results/8c1e084e6d01e09e9dc19a697ebc354fe5de1992 | ORPH
    i686     |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/bc277f2ea0bfadd5ff3523d86c8cb4bb5cfd13f9 | ORPH
    i686     |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/d8e0b1eaab226f02a05c4b4d50c132b1528b83bc | ORPH
  riscv64    |        libopenssl-3.6.3        | NOK | https://autobuild.buildroot.org/results/ee220824bb2e90ae5338726fabe3b3e1ea975e83 | ORPH
    i686     |        lightning-2.2.3         | NOK | https://autobuild.buildroot.org/results/a0437e4e77de2cd72fcdad7808642b967298313c |     
  mips64el   |      linux-5.10.254-cip72      | NOK | https://autobuild.buildroot.org/results/265716f00cbc36796b3023333128759a1cec49a5 | ORPH
  mips64el   |      linux-5.10.254-cip72      | NOK | https://autobuild.buildroot.org/results/1f002f8d598a2f7a900dcfcb6dbcbac13ea9c80c | ORPH
  powerpc    |          linux-7.1.2           | NOK | https://autobuild.buildroot.org/results/faa9e8f88102f4b49856cb181818021d001e151d | ORPH
    i686     |          linux-7.1.2           | NOK | https://autobuild.buildroot.org/results/be2c6df49fdaad827442881531e5679f9fabe02b | ORPH
powerpc64le  |          linux-7.1.2           | NOK | https://autobuild.buildroot.org/results/de820091e330d284a2e09bdf5b03184950642192 | ORPH
    i686     |     linux-headers-6.12.94      | NOK | https://autobuild.buildroot.org/results/e50d61ae730bbaa6fe1dd90a98f297c811979578 | ORPH
   mipsel    |     linux-headers-6.12.94      | NOK | https://autobuild.buildroot.org/results/82f7bad5719971aab8657c4176bf2e92b5f77c80 | ORPH
    i686     |     linux-headers-6.12.94      | NOK | https://autobuild.buildroot.org/results/ad32b24fbeecab451b0bd456008f18f4545dbbef | ORPH
powerpc64le  |     linux-headers-6.18.37      | NOK | https://autobuild.buildroot.org/results/bbe7906a19695ab95359a5c4fe277cc757ec4d32 | ORPH
    i686     |     linux-headers-6.18.37      | NOK | https://autobuild.buildroot.org/results/adf676f29ee0b75989334f870c2be45d4c526e0f | ORPH
    i686     |     linux-headers-6.18.37      | NOK | https://autobuild.buildroot.org/results/0e1d4c56623472221522d0f391b368870e6e3593 | ORPH
  riscv64    |     linux-headers-6.18.37      | NOK | https://autobuild.buildroot.org/results/700afd40b5446a9e6598cb67ce092111bd0fee4c | ORPH
powerpc64le  |     linux-headers-6.18.37      | NOK | https://autobuild.buildroot.org/results/1826ee8b07e89db263175134678f23c6685bf13c | ORPH
    i686     |     linux-headers-6.18.37      | NOK | https://autobuild.buildroot.org/results/e6cc97cb1a6ee718f1dd83ad4f299197c56af73c | ORPH
    i686     |     linux-headers-6.18.37      | NOK | https://autobuild.buildroot.org/results/f7a8ab14e2d9730616fe78ca720e5e477fe1bbfc | ORPH
powerpc64le  |     linux-headers-6.18.37      | NOK | https://autobuild.buildroot.org/results/0195df6e96fcaa6f57b86b99e6cfb95aabb86373 | ORPH
    i686     |     linux-headers-6.6.143      | NOK | https://autobuild.buildroot.org/results/aec823a42eee2d4ce5d2a4e4889c9b44394d924a | ORPH
    i686     |     linux-headers-6.6.143      | NOK | https://autobuild.buildroot.org/results/488e5fbd7edd362fc75f29cf6a16078ee756c298 | ORPH
    i686     |     linux-headers-6.6.143      | NOK | https://autobuild.buildroot.org/results/8632ab02c9d582411fe3eff6f297613c144ed666 | ORPH
    i686     |     linux-headers-6.6.143      | NOK | https://autobuild.buildroot.org/results/1fae0c65d0a8e39da892f17541d71cb65e56ff10 | ORPH
    i686     |     linux-headers-6.6.143      | NOK | https://autobuild.buildroot.org/results/fb5c698cf25ada05501e81110a87cac1de9ed506 | ORPH
    i686     |     linux-headers-6.6.143      | NOK | https://autobuild.buildroot.org/results/e70b0dc81d9fea4198ee53cbcd03619fe3aa3033 | ORPH
  riscv64    |     linux-headers-6.6.143      | NOK | https://autobuild.buildroot.org/results/adddd16887d6b82fe5cafef4dd06806e4cdd19f7 | ORPH
    i686     |     linux-headers-6.6.143      | NOK | https://autobuild.buildroot.org/results/c00cb27bae91ae65b530b50fc51161ea4df21991 | ORPH
    i686     |     linux-headers-6.6.143      | NOK | https://autobuild.buildroot.org/results/e7e2d92ebfc6e4d9e2a8ded6ec977b4534e871a5 | ORPH
    i686     |     linux-headers-6.6.143      | NOK | https://autobuild.buildroot.org/results/adf47a0366277ee271d38f112de2ea1d47f67380 | ORPH
    i586     |     linux-headers-6.6.143      | NOK | https://autobuild.buildroot.org/results/8321b2ee511c3b25434bd73d0b3a235e7294d3c8 | ORPH
    i686     |     linux-headers-6.6.143      | NOK | https://autobuild.buildroot.org/results/1ced4fdc9a13191f9977e352b21ae5ce750314b4 | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/b1100c371c576f31f996e1d862ce60a9b9c0ff75 | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/84155e31d4ceda30fde7ad17f542933c27defdfd |     
   x86_64    |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/6400d9ea5b0ca7cf78922e78bd0a4eb261bec9e6 |     
 microblaze  |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/8ddfec9316c43f44de9bcf998775ad6c245f24d7 | ORPH
    i686     |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/2c8992d92485abd291d83ba7afd719f43f7de070 |     
    i686     |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/762b6a9166c836cf314e145ca0332ecf1ca39c2b |     
  mips64el   |           mtd-2.3.1            | NOK | https://autobuild.buildroot.org/results/c0e2d469c369603e99385a1cfb3b4b8b2f3016b6 |     
    i686     |          neon-0.37.1           | NOK | https://autobuild.buildroot.org/results/259c8b2bc1b2c1f8ea058e7032b960a50700e97b | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/0dda70a600b53dc7254d23fddd7ea16f80f6871b | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/2796a4b4b5ed014e4d2e2c2897b42b1b4f6fcc97 | ORPH
  aarch64    |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/8abb41f1e8a5052a77982cd42fb781c8a23c34f0 | ORPH
    i686     |        open-iscsi-2.1.9        | NOK | https://autobuild.buildroot.org/results/4b9d2432e00ba2115d920f6c4ad4ed90861a4028 |     
    arc      |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/51ca626bf4740529ec5aec363d122f3a9f56a80d | ORPH
    i686     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/b8ffb6be024bbcd87a84a8e6dafe85888960e7f7 | ORPH
    i586     |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/195acbe9e5088f214344798962599cff90a3f94c | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/39ff90e1e82eb28aa4cff802f7bdf7441fb6671d |     
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/827aa1bc399d65cf6c158c530fc84bc4eff34cf5 |     
    arc      |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/cbae7ad669996a95b5977e687fbb160fdc03b803 | ORPH
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/0f1a78576926472d70ae631df888059ca3881daa |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/48630c2e287eb85a54b7b3abc191b4f38f2a7ad0 |     
    mips     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/22ff168e4558ab3e09a2ae95fb2b6cfc20eaa245 |     
  mips64el   |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/c540096bd4f4204c66f201c268b7988e5562bbe4 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/9d6d04fd4984fa01c518c87816e0e79851b6c470 |     
powerpc64le  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/e6ac9fc4ed6aff6806973fd6d62915926a32bcb5 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/7f34472149ad7658b95d0794aaa01dd0fbe87890 |     
powerpc64le  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/ae108db54abd148d2f900339fdb3e39776b4148a |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/2e8c33d2678fc749fb378221d46f8da03c5173a9 |     
  riscv64    |         pixman-0.46.4          | NOK | https://autobuild.buildroot.org/results/d20a7a37f2528ce853b9be4b924f00b09cc573e4 | ORPH
    i586     |  python-pydantic-core-2.46.3   | NOK | https://autobuild.buildroot.org/results/331090e4d014ea70eddf27b412a39f814a631b0b |     
    i686     |       resiprocate-1.13.2       | NOK | https://autobuild.buildroot.org/results/2c5e41cb04d6fed994a94334a3ca3cd32d7753f2 | ORPH
    i686     | rtl8821au-bb26b6b06c47b79c1... | NOK | https://autobuild.buildroot.org/results/a3e6917110e10569d79e2055bb655546805d5078 |     
    i686     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/9fea6cb129b8ffb4387032b00229566d292432ff |     
powerpc64le  |      sane-backends-1.4.0       | NOK | https://autobuild.buildroot.org/results/870c1b3328cfdb0509c6553b4efe4e238beab6b2 |     
    i686     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/fdd87839172c6fb87590a5bd179a15c5b89a1b20 |     
    i686     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/71686f2b4b88510f3b0da384ec2aa6db611fc64f |     
    i686     |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/09280de34d9de3cda183ee05bee7a7f600670fa0 | ORPH
   mips64    |        strongswan-6.0.5        | NOK | https://autobuild.buildroot.org/results/eadbdb96eaa4daed98d9ff8d996b08d31b2bdc7f |     
    i686     |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/b3d0588fbc02ede6d5f82fb5d2fefcf610a69299 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/d11e532b5c26bdecf910e7c1f4b846a172f43420 |     
    arm      |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/23793b93c1da7ff2a00b4c16c7c97cce3cf56a2c |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/45bcb646f7ebe10344d39311546aa780f8ecc0ec |     
    arm      |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/5a87325fdad5c6590f7d71e59ca187525d7dc060 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/f30d62a62699ddab698ec28f1b594001cacfc4e0 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/e15d9ecbf784305a3d266624f138f5312ab116e2 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/c13b63488286d84a325f116989ce3f5148dc0e6c |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/18b2558921173abc19a419e56d254c42f4230d49 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/39f8f94679b910ba50ba3b695c070cbc6d9e2ab3 | ORPH
    i686     |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/4c6b3fdf539e798aca540ba92e6f4c648579a8df |     
    i686     |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/9802f963529f340f31760253ba7ebe4acdb75557 | ORPH
  riscv64    |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/6f5f4bfd952570aecde6c385c20e3a9289559a47 |     
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/08c2ec13ff36f125a1bf331e967d0c2517d6b544 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/980783bceb77bd10f9fba504f9c0fa49b9a676dc |     
    i686     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/90d80b7e54db99e028f6b5759575742a7859e7c1 | ORPH
    i686     |      virglrenderer-1.3.0       | NOK | https://autobuild.buildroot.org/results/54a3ad9b651012229fc0d72c8dab0d952f9fd8eb |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/065ce7945ba5940fdb990366e3521e71daa20e4a |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

                easydbus-0.1.0 | 1 
    host-mender-artifact-4.2.0 | 1 
     linux-5.10.254-cip72-rt32 | 1 
        ltp-testsuite-20260130 | 1 
                       unknown | 1 
                 wolfssl-5.9.1 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/acd4db3b9601d48bafba2f5eb64a7856467ec1cd |     
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/19dd41ce14b92be51504cd50b863fc938911b78b |     
   x86_64    |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/d4d306eeb49a35516921e0c1c0e396e85e7faed0 | ORPH
    m68k     |     ltp-testsuite-20260130     | NOK | https://autobuild.buildroot.org/results/abbd649579027d7e454b79d7982a09be9f40ad91 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/0ad710d908bff952253f6151c507e4a508d080f2 |     
  mips64el   |         wolfssl-5.9.1          | NOK | https://autobuild.buildroot.org/results/20cb0fbbb3dd276238f0346efe767b385f834fa1 |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

              host-rust-1.88.0 | 1 
                       unknown | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/523360628e7aec47057fe9966796163f14448cf4 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/38a6a43b3cfc7e34c0a6a51d8c95e739d6e32908 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                   dante-1.4.4 | 1 
glibc-2.41-143-gfc7a48bc9e9... | 1 
    host-mender-artifact-4.0.0 | 1 
        host-python-lxml-5.3.0 | 1 
        ltp-testsuite-20250130 | 1 
          python-tinyrpc-1.1.7 | 1 
toolchain-external-bootlin-... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/92b2a7c40772c739b898c58fe2bd6331fdf6194a | ORPH
  aarch64    | glibc-2.41-143-gfc7a48bc9e9... | NOK | https://autobuild.buildroot.org/results/84f6a1330254bad28a6ce194bfce31e590bff65b |     
  mips64el   |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/4590a0144730fa443a0d7ccbeb68f075a5aab476 |     
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/23f522b03013fc0ab32df2b3b78df9a2d3b9caa0 |     
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/1a9ab196b8b80b93dd140f7779120e4c6640121e |     
    i686     |      python-tinyrpc-1.1.7      | NOK | https://autobuild.buildroot.org/results/a2533448887e7269b72614c9ace9d96628a2f5f8 |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/14b4617c23993d29e6604046676fad08a3c218ea | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
