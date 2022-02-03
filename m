Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF66C433F5
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 23:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2DE760E41;
	Thu,  3 Feb 2022 23:24:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j3hNIqZqRBqU; Thu,  3 Feb 2022 23:24:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7D7760B47;
	Thu,  3 Feb 2022 23:24:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B1DF81BF2F3
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 23:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A028360B47
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 23:24:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U2eaexlNw8oQ for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 23:24:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6EEFE60A84
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 23:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643930651;
 bh=1W8Ty3ikm9mZBcXwIh5yHtzaPJjkOXVrrD+mNRRcUDQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=NgH4jYeWVgwr1EY+j1Smla3wnpE9eEZNvcFzUDwGSQX8u4knjVeyfugTlRtmkX9Pg
 EZgi17NKbrOsgNZfc0oDJjVCotVHGxiaOsE57iggg52VIffgXxtiBP/BzF1ZqkfO2m
 0rOF9VkT6jnk16pB3E5FPe/77vkOXXgAkoJFJvng=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.201]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MMobU-1mwzcd2I0C-00Ilfx; Fri, 04 Feb 2022 00:24:11 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri,  4 Feb 2022 00:24:10 +0100
Message-Id: <20220203232410.26906-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:yIB0CqnmpsyVAWbcmQwyYE+unZR8gVZOL1G7mrrQCDByux0lyhm
 Gm/kxC/QWne/aYcnw3Jbm87Sts2jBriRto/CGZNgWyqzSLskKoPkceJbTnLMZtEluad7sxS
 dJrBF454sslVeRX/5xFBY5ZHmjSgo3fcZEk4IMse9etZqXJu2+20mAPCDtzbQEPEosIc6fd
 yxtxsLhgTDfUz4O9GcpnA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SgexJrDe0C8=:iPiAt7gcOO/XJcKuTOOHjg
 EJmy7PWzDsoql+4wlrD3PHXCiEyKSkhW0UB8UoYSmNZQjWmJKyza/9rNwoDHs/Zzzp+kgUyhB
 Ze00VFFtQwJ/eOZXzqeh5lhBCDShCAW2Qh+BjrUXJVH6EO3GGL5dFvciM7ErLf2g+6UCsSIAS
 Naf09TiiUnocCqraUDVKvRrYR+RTpFAQ/OE+KWyUaKtoG53zndCWr5cVOhyq6lYuG+RZMIccU
 C3yHKI/g7IpMcW6f7kXKIX3rClUNhoCsSfEXYUv0OWi6dgwhI5/vEVlXzTod63qXYXic4zSFc
 yVQ6LweD/6YklyYOTF55/VZhLOUKheHT0Kst6WjSoIEHHgmfqkC2nHVPuvu98QZO3yjq1lV/F
 UdWWR9DxBXzSRHx5MJx5eWMSnJ786Wcx9i3d5HVouq7WBCF5+q9OXHQn6T4BK3CsJ94WTfz8n
 6tC8qQNnDFm25SmY6nHhibM0kXDA2BZOrxVh/n42Vg7GpXZvKNSjUDqTHLlEIz8mCfuX5z9w+
 I12qi6dvNIEAQc2vu3WwAyLvOVXK/ACWe1Evpe13TjhTbNXEqyMWSPtuJB/EbkDt0E1e3TRJn
 u4YAgk+ziwMEEjYIJDgbC6WMqvEI8rgT3IMGmN9u/roP4v+N7poCEjvGRN0bDnKxP0vW+0dUy
 FVUWpXh6D9xzJDR0OAnt28Vc74ZcKv0WzfypSXdErlUJsnUTvokddcInE1eGQ5vbTefjLHhtZ
 Rk6vavsE9fct8wnXUmCBC3gSFkg2iRyRRDjcbcno07L3Vms+/jSpcC8CNs3j4yx7d3v+25Kdb
 +M6HooaXKYD0Nd2yEOgoqmaHZ0xfBfSnBpYMdmYl4ZSvtBqGx0UIjlroVLNGikVD0qgfIryZr
 ma/zfkJH688dYWRfhgl58xNqaRiZm7J4s+Jf3LHi/sDH+3RtMlEQ6auoC8GzqYI8e5zPCzedJ
 suC+u9/9HNPfXyeZ/XePrujWrUaZLjagpjlLigSar1XcGOSFHCwGpcmqClAh7yRRwRL8F+90M
 sY/kjL3BQPSoI4qNc2l1laPK6dyB5u8XnGv6b+xujwPRNhgaZneubikzT4IB8tdhjNUV3N2LA
 laqUXAD8ud/pHU=
Subject: [Buildroot] [PATCH v1] package/mtools: bump version to 4.0.37
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details see [1].

[1] https://lists.gnu.org/archive/html/info-gnu/2022-01/msg00006.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/mtools/mtools.hash | 2 +-
 package/mtools/mtools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mtools/mtools.hash b/package/mtools/mtools.hash
index c37d4df456..5d1bca486f 100644
--- a/package/mtools/mtools.hash
+++ b/package/mtools/mtools.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  78ac74b2d1cae77bb2da29461a13ed862ff6b7c1289d5bf80fdb09e039c2c48f  mtools-4.0.36.tar.lz
+sha256  f4dd1fb4b4d72f344f7efcfb05219de3882c6c6fce678d75e7cfb29ca162c7ca  mtools-4.0.37.tar.lz
 
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/mtools/mtools.mk b/package/mtools/mtools.mk
index 4908c3fa2f..f73fd5d231 100644
--- a/package/mtools/mtools.mk
+++ b/package/mtools/mtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTOOLS_VERSION = 4.0.36
+MTOOLS_VERSION = 4.0.37
 MTOOLS_SOURCE = mtools-$(MTOOLS_VERSION).tar.lz
 MTOOLS_SITE = $(BR2_GNU_MIRROR)/mtools
 MTOOLS_LICENSE = GPL-3.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
