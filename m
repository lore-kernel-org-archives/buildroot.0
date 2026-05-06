Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3B5CD342C
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 16:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3ECD140F16;
	Wed,  6 May 2026 16:32:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HmWnn8TvKmBt; Wed,  6 May 2026 16:32:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 480E940EF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778085156;
	bh=bCpYypOOo/E7+gFjGLOwLhjjnWGyTPnMD17tUNxjyI8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ZnBH5zCnAGzImMYK2IQ50xSr7AGOakvQv+P/qC0jPEccSAKjS/JlScOeT+AqY4JsE
	 uXkUdNkKxnpx0I9aocjX28yngkyCnKcejlulWUCQQ0UEkf2aqLaIn06oHms2nt4Gfh
	 4WGi0y89l1WZFTAxNe6l7RjMmdq3I0q9vkoAaNm9gjMXpqObqgDWZ2oPXZRmrpOz1K
	 oLecWW/9zN8soIIIHY639DUuZo9U1ILW7u5PKKfogfwNybxvgSWFKejH2SLckdvpca
	 O1lHxCCE84ovwptbprC4bUqm2ZcAqFORGabkgYr4Dp47DUd7YZVNyX/XmpXVqTgw1/
	 RJCDNADXH75Zg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 480E940EF4;
	Wed,  6 May 2026 16:32:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8558111B
 for <buildroot@buildroot.org>; Wed,  6 May 2026 16:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B49660E90
 for <buildroot@buildroot.org>; Wed,  6 May 2026 16:32:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vwyJJSyb37kO for <buildroot@buildroot.org>;
 Wed,  6 May 2026 16:32:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6117860E8E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6117860E8E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6117860E8E
 for <buildroot@buildroot.org>; Wed,  6 May 2026 16:32:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc94.dip0.t-ipconnect.de [79.214.204.148])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1FD8FA4C206E;
 Wed,  6 May 2026 18:31:54 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51906)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wKf9u-000000002XI-2TjN;
 Wed, 06 May 2026 16:31:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 18:31:19 +0200
Message-ID: <20260506163136.1330722-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260506163136.1330722-1-bernd@kuhls.net>
References: <20260506163136.1330722-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778085114;
 bh=oNABBqhHfyb1pzPHrOPGnRjzDWuNaEPrU1lSEf85h7M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=heN28gleQDyUDcP6XTvc+B6R5A5hFA2y/OvvuOPrbufVvdPYFv7jLn5OD+9dq65z9
 A3tGDzxuwLO2v5sRd5o2zdKRrrsxc/SwcjilrEM2AkclFcWQrKWTpAlx15t/Ene4SW
 IWjnyYko71lSSiNvHkeKCUyRlyECcbBGchGI3wkn0cPrDbPF5/UVpV1e4PpYVCvXMZ
 0Q8H/r+1FygtfjS+HBG6yFZYSXFDSnjIZF24AjLGgt3mJV6CUDISDBe+tMJoYsFZxa
 7a/x2K3JyjQHrhVrPcWbrjz1zMdTqYj6y3VhldyTSuMUomaSWlAMbXXRMa4y6MeTXF
 /THktk/NxAPOA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=heN28gle
Subject: [Buildroot] [PATCH v5 06/22] package/grantlee: Fix build with gcc
 16.x
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-id-in-constructor-of-template-class.patch | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/grantlee/0001-Remove-template-id-in-constructor-of-template-class.patch

diff --git a/package/grantlee/0001-Remove-template-id-in-constructor-of-template-class.patch b/package/grantlee/0001-Remove-template-id-in-constructor-of-template-class.patch
new file mode 100644
index 0000000000..6fd4636df1
--- /dev/null
+++ b/package/grantlee/0001-Remove-template-id-in-constructor-of-template-class.patch
@@ -0,0 +1,30 @@
+From 261bfe75d718abfc537ddcebfe805df01c33ab3a Mon Sep 17 00:00:00 2001
+From: Pino Toscano <toscano.pino@tiscali.it>
+Date: Sat, 25 Apr 2026 10:21:47 +0200
+Subject: [PATCH] Remove template-id in constructor of template class
+
+It was not required, and it is invalid now in C++ 20.
+
+Upstream: https://github.com/steveire/grantlee/pull/93
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ templates/defaulttags/cycle.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/templates/defaulttags/cycle.h b/templates/defaulttags/cycle.h
+index 936c2a2e..a917555f 100644
+--- a/templates/defaulttags/cycle.h
++++ b/templates/defaulttags/cycle.h
+@@ -40,9 +40,9 @@ Cycles endlessly over elements.
+ template <typename T> class RingIterator
+ {
+ public:
+-  RingIterator<T>() {}
++  RingIterator() {}
+ 
+-  RingIterator<T>(const QList<T> &list)
++  RingIterator(const QList<T> &list)
+       : m_begin(list.constBegin()), m_it(list.constBegin()),
+         m_end(list.constEnd())
+   {
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
