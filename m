Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22226D5B866
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 19:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBF4C40A9E;
	Mon, 15 Dec 2025 19:17:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 81m_BK_UgfFf; Mon, 15 Dec 2025 19:17:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57F2B40A8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765826225;
	bh=4XZc0QsU65kJ1fnGgA5tWF7qKI7J1fSQ1Q/UZfDjYbE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=g/fyJNzDooXR5/q+erYza2mwm2olIxRn0emxD0LbRXb7kiFbxXUDb185rvcYCBsIh
	 AgAr33H06nUaw8xVXG19R1xgAF8TJ0YbJKArSQp3XjweMkCIPRGStTbUkufB/Bzwfy
	 6iJaby/5QdojfhC3Ro7GpGQbOrAouRrcAKgxrQoc+LHkpEEVmoMLvH1dV2t9O7ev70
	 6txOuyf21VcJALv7BdATiYIYVWGfV6lWmvf/jct5/Lon3wAKZekLAJCa4uJY0g6Id5
	 U8QrC5yh7d3FuyNDzWtSyhMGRWxuIGSdTT4H3su0nSVNp2HEZ+9sdbIvTvB3hw178n
	 UXjD+IwG+pNdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57F2B40A8E;
	Mon, 15 Dec 2025 19:17:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E9035151
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB1618084D
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:17:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K-eHMxKm8Irz for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 19:17:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D0F2C80B15
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0F2C80B15
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0F2C80B15
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:17:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 943E8A4C433F;
 Mon, 15 Dec 2025 20:14:28 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40828)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVE1R-000000005ED-11o0;
 Mon, 15 Dec 2025 19:14:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:14:02 +0100
Message-ID: <20251215191416.421755-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251215191416.421755-1-bernd@kuhls.net>
References: <20251215191416.421755-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765826068;
 bh=+wOSAve9es3CEAQq0LuzvPWWGghdphEbNM3PaEWliY8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=j67SRv7f1RmwmibrMARFGRlTdK/sd+Ug7NE/O1ukVIvy2JH9CK15hnoV5uQRGyL4t
 uqNLoHOnCdgC75aiiqyDKUEes8n5N25NRx1irhs+5VAV1Q2u9f81mCrb16AWlFXqQr
 F68w3Jmfn5HwB/HZGcb9pmyG65eAEBR7e5XUSzMz8gg7gNJ88K5X49ctLsUqquq2iN
 UOMY3iwfRhf4orGMr9WPtAAjA9BDoEy3ufxjij+cSGByD3p03DltDJ6udTfLb+hbmX
 ipH+Q7dOSDogS/+X6OIROOL0AvqEVLyYijo9EFZ6FhmEzspMHR/R829pt1VuVpy8sS
 1LRSn09GzQjqA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=j67SRv7f
Subject: [Buildroot] [PATCH 13/27] package/python-pyparsing: bump version to
 3.2.5
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Witold Lipieta <witold.lipieta@thaumatec.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Mauro Condarelli <mc5686@mclink.it>,
 Steve Calfee <stevecalfee@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/pyparsing/pyparsing/blob/3.2.5/CHANGES

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pyparsing/python-pyparsing.hash | 4 ++--
 package/python-pyparsing/python-pyparsing.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyparsing/python-pyparsing.hash b/package/python-pyparsing/python-pyparsing.hash
index b6ca80b040..d3323e173c 100644
--- a/package/python-pyparsing/python-pyparsing.hash
+++ b/package/python-pyparsing/python-pyparsing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyparsing/json
-md5  0af29922e2f22dbc2569b88917b44f52  pyparsing-3.2.1.tar.gz
-sha256  61980854fd66de3a90028d679a954d5f2623e83144b5afe5ee86f43d762e5f0a  pyparsing-3.2.1.tar.gz
+md5  49f6a72433130541fd92c56b110061d2  pyparsing-3.2.5.tar.gz
+sha256  2df8d5b7b2802ef88e8d016a2eb9c7aeaa923529cd251ed0fe4608275d4105b6  pyparsing-3.2.5.tar.gz
 # Locally computed sha256 checksums
 sha256  10d5120a16805804ffda8b688c220bfb4e8f39741b57320604d455a309e01972  LICENSE
diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
index cb19f54ca1..5d478a18c2 100644
--- a/package/python-pyparsing/python-pyparsing.mk
+++ b/package/python-pyparsing/python-pyparsing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPARSING_VERSION = 3.2.1
+PYTHON_PYPARSING_VERSION = 3.2.5
 PYTHON_PYPARSING_SOURCE = pyparsing-$(PYTHON_PYPARSING_VERSION).tar.gz
-PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/8b/1a/3544f4f299a47911c2ab3710f534e52fea62a633c96806995da5d25be4b2
+PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/f2/a5/181488fc2b9d093e3972d2a472855aae8a03f000592dbfce716a512b3359
 PYTHON_PYPARSING_LICENSE = MIT
 PYTHON_PYPARSING_LICENSE_FILES = LICENSE
 PYTHON_PYPARSING_SETUP_TYPE = flit
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
