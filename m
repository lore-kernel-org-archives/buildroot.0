Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2453FCD13D3
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 19:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE33D41C77;
	Thu, 30 Apr 2026 19:08:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id auxHIsjqx3om; Thu, 30 Apr 2026 19:08:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A2F741C78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777576124;
	bh=G2IQkKLQbBp+JaezwA8DCrh0FbHk2dKrx5Y/KAxkYD4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=e0WghXm1z1hX0TrLgYAyPMnotbU7Kcakp6CpKJRQi9uD5yvzsRhCCGD6JL5C3u2q5
	 XoLdpMs7EWmwhhJLfbbE8n5BE0U9K3U4JBGuFMa/jtPBTe/kK769KygFPR+OZUfYYQ
	 NSesrehtSZSUYgAMMJHe0Lrc+QB/SesbsYVlAGALkYIrHXzIOkdcY2L3LGGIp6tDdo
	 HSWL06PsVC6Qsre28xZY/X/RRLyhfDwZe3SAj6coGkW0xCNfIJ25rJac7vXuY6e76Z
	 ApD7dxpLMcDtaTxE4NhxPrzO7aAF/7MlFi5nGjNFlfhLMeh7kc3YZgldnlX23hiuAT
	 Jo/+dIaQrXiHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A2F741C78;
	Thu, 30 Apr 2026 19:08:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9EC9F192
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 19:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F4F26F4EF
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 19:08:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PJ1vrgQI1WRb for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 19:08:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7BA766F4F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BA766F4F7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7BA766F4F7
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 19:08:41 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3994AA4C2D5D;
 Thu, 30 Apr 2026 21:07:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60442)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIWim-000000000Pg-080f;
 Thu, 30 Apr 2026 19:06:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 21:06:38 +0200
Message-ID: <20260430190647.3212159-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260430190647.3212159-1-bernd@kuhls.net>
References: <20260430190647.3212159-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777576021;
 bh=zUTAvfe87Z6501cBu58zEg50IpGp6WpU7Af0ilIEuq8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=qkijH6SbG+18XASHZWSCq2G7GoStdnV42n7+ShahB3iZqojp0N58liuQX+vjaQXI6
 uaxGeissqdXuIjDlf7aP3iGUHPMXQ8Uei1pZlVf2H2lkPubLSjoLS3Pg0NRUc3WpFP
 GM3R09OQierQjEQAwAkvrmzmB/xbQIJv/axpeDtGOSbshXXD/jHJ7XGaKtnFCs0nLr
 koHKL4iehZ3ZM00HjTNTldGlMMUsE0ppfAu8gam0eRlNfDUmXT/5jwuGj3Ci3lJAKY
 5xWbw/ol2kBTKntvr823b13mztM6F/TgH+xeOC7qSpuxqye85wW8ILFlOVT+uZV/RZ
 yc3e1egJ6nwOQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=qkijH6Sb
Subject: [Buildroot] [PATCH v2 05/14] package/cups-filters: Fix build with
 gcc 16.x
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
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/cups-filters/cups-filters.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index dcfb2e9500..74df5968b9 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -10,6 +10,9 @@ CUPS_FILTERS_LICENSE = GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+, LGPL-2, LGPL-2.1+,
 CUPS_FILTERS_LICENSE_FILES = COPYING
 CUPS_FILTERS_CPE_ID_VENDOR = linuxfoundation
 
+# ax_cxx_compile_stdcxx.m4 needs to be updated for gcc 16.x (C++20)
+CUPS_FILTERS_AUTORECONF = YES
+
 # 0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch
 CUPS_FILTERS_IGNORE_CVES += CVE-2023-24805
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
