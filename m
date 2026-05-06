Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027FBCD342C
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 16:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1D4E40782;
	Wed,  6 May 2026 16:34:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0oYaC_Gj1hTA; Wed,  6 May 2026 16:34:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37B9B40564
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778085242;
	bh=rbuKjjhDMSOgFG0sS2LC1nVI17IyZT0h4l/Pg1lg5uE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=V6XJChzdfhG0vpYKrM2XBkMjvkyBgGFgck57o0D1VJykQC8psY0pkAzi6WEhTGiJC
	 TTU490wqZ4iIw02r5NIfd5otaF3pvWy4dEo4afUii3lmDCJzc1LBuW1x5Du0fLUV39
	 ChswvE+T29x171xaJZZSXZfTljNDw0UDu/ZkVfEk9NtuNCT56VklhN5AK8l0YBQQN+
	 OFm/A31TMNcYxSoRpTpjosByrOe9AoWBsYAMRyK1kJBz/H5fzbC2u8xiNQKjvS/DES
	 M08Rc1jh+jbOnhMsLSnxENlucXkLU/u4q6yk2E2TNM4feZ/30HYeZcpM/wfzzULlco
	 oM4Z7BwrZDFfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37B9B40564;
	Wed,  6 May 2026 16:34:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BD4911B
 for <buildroot@buildroot.org>; Wed,  6 May 2026 16:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DCF260E91
 for <buildroot@buildroot.org>; Wed,  6 May 2026 16:34:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q4NYM_u8-hsK for <buildroot@buildroot.org>;
 Wed,  6 May 2026 16:33:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 772EE60AF1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 772EE60AF1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 772EE60AF1
 for <buildroot@buildroot.org>; Wed,  6 May 2026 16:33:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc94.dip0.t-ipconnect.de [79.214.204.148])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 82395A4C20BA;
 Wed,  6 May 2026 18:31:55 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51906)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wKf9x-000000002XI-1Jv1;
 Wed, 06 May 2026 16:31:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 18:31:23 +0200
Message-ID: <20260506163136.1330722-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260506163136.1330722-1-bernd@kuhls.net>
References: <20260506163136.1330722-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778085115;
 bh=vD2AgzeXVQXMLq4ELbH/otjXyI+WMwvovsyYAI3bJ60=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=DjkUoeFTTiVUrfrq+qkx745vvBp2S4tdN4SR1JtXo8uU6TvaSvi0QlTN+uYxnNM3T
 PQNy82r4NdaHbBmurIAX/f+voBF4IN2Ae21P0poI2g6xuRK1bC3gqpaOEP2W9wQK+c
 YnJ0g/LM5U5L+fuOzRm6NwzMjZcwp2RjlPWi/3ENKWdHEPIZmTQhUWVJB/7FqqRpl6
 YjHJ6OZD5CFckqj3vnoDywCjonawKC1BFgO7ZOPszig8M2qho/t9HEwdLsA4mLOdwL
 GjCGKoJjXZ5g7xKCrBdp2J+ifBiS9iKWl+pq3VilqZ4eXsdtvuyyZfMj64YMTXv4tK
 Gv0DG/WU0M2Kg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=DjkUoeFT
Subject: [Buildroot] [PATCH v5 10/22] package/cups-filters: needs autoreconf
 to fix build with gcc 16.x
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Tudor Holton <buildroot@tudorholton.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add comment to clarify that autoreconf is still needed even after the
patches are removed to update ax_cxx_compile_stdcxx.m4 for compatibility
with gcc >= 16.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/cups-filters/cups-filters.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index eaad301c6d..2c682b92f3 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -12,6 +12,7 @@ CUPS_FILTERS_CPE_ID_VENDOR = linuxfoundation
 
 # 0003-libcupsfilters-Fixed-building-with-QPDF-11.x.patch
 # 0004-Updated-code-to-be-built-with-QPDF-12.x.patch
+# ax_cxx_compile_stdcxx.m4 needs to be updated for gcc 16.x (C++20)
 CUPS_FILTERS_AUTORECONF = YES
 
 # 0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
