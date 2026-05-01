Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6970BFF885A
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 06:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E40D854C9;
	Fri,  1 May 2026 06:24:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xnWojvVLyxaB; Fri,  1 May 2026 06:24:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A96CA854B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777616661;
	bh=bCpYypOOo/E7+gFjGLOwLhjjnWGyTPnMD17tUNxjyI8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=LpIY8H4lvQSOw1H1PM9bc/iQ113OkQqPOLNH4SF5hu54SnGU6ajlfC1rpHSRUv6GX
	 ayXLDToITMu6sHgzTQuZw6aV7XXZswcuW3SUUzMzlSdSUin2vD+2XfP2ERWQ03UVrf
	 6q7//CjmSJmSagZQFlEJS3nqXyBAN1qRvubNCx9R7tBY0Brrg0rDymjKAqnyVQ66sN
	 TxxFZbb6F8OAIu7f2x6E9azJt2Dvx10VLqV9qC2tQkMdLem1dFAcRv4dl9+4iGeus3
	 SmE9QIwMLmMn8P79CSIpjY82T3wc5JCey0wKt3D4/IviA6TmpgcyjHQ6EzgrskjUdY
	 a/szgu/N0jM0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A96CA854B6;
	Fri,  1 May 2026 06:24:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 75424293
 for <buildroot@buildroot.org>; Fri,  1 May 2026 06:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65C284006A
 for <buildroot@buildroot.org>; Fri,  1 May 2026 06:24:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FrnqqY8SSmyE for <buildroot@buildroot.org>;
 Fri,  1 May 2026 06:24:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4DB6C40064
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DB6C40064
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4DB6C40064
 for <buildroot@buildroot.org>; Fri,  1 May 2026 06:24:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DEFFAA4C2946;
 Fri,  1 May 2026 08:23:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38120)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIhHR-000000007tD-0Je8;
 Fri, 01 May 2026 06:23:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 08:22:59 +0200
Message-ID: <20260501062316.1942112-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501062316.1942112-1-bernd@kuhls.net>
References: <20260501062316.1942112-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777616606;
 bh=oNABBqhHfyb1pzPHrOPGnRjzDWuNaEPrU1lSEf85h7M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=TmH3Mze+2TCx81+vmhpPvHkNWC9r5rIuPP7cOjVo6zx3XtqW32LlJVSkuU1Hl+i4l
 n0QABBgvc4QYZ1/7XlVMcTQKM64SYVwETlzfMv6GKyklwyvg8iUw4+qA5aoul66IHW
 2JzeQhBwIUs+loSfwlyeaWXyhmqzfiojL8fBl70NjMkhXWXe1CYpP5aCnyKxoL2POR
 YxqUXTeba3VcAhbfjQl82/GkDdP36w1BUt0fnB6kIYO2MqXG84aKuGbfrGFyNlziHg
 WXIa/UizUL0aKPVIw5bM9zvdDCi8/HpN5NIHAZfGAXZXTTqdVQIuDqjFbcaKW2PDLP
 7gwhY7HBxkVEw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=TmH3Mze+
Subject: [Buildroot] [PATCH v3 06/21] package/grantlee: Fix build with gcc
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
