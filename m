Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B955EE49A3
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 04:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FB6061145;
	Tue, 22 Aug 2023 04:57:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FB6061145
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8dwbcBx13OIo; Tue, 22 Aug 2023 04:57:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62071610F0;
	Tue, 22 Aug 2023 04:57:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62071610F0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D15EB1BF31E
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 04:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7E524015A
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 04:57:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7E524015A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G2eMY01K2DD4 for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 04:57:39 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E44E4400C5
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 04:57:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E44E4400C5
Received: from fli4l.lan.fli4l (p4fd6c625.dip0.t-ipconnect.de [79.214.198.37])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 69D79A4C00F9;
 Tue, 22 Aug 2023 06:57:35 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55716)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qYJSQ-0000lK-2i;
 Tue, 22 Aug 2023 06:57:34 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 22 Aug 2023 06:57:34 +0200
Message-Id: <20230822045734.3160078-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1692680255;
 bh=JSOjp2xHuUCgfYBqOfqMkD7bcDxjf5KQSMMaUzqHJME=;
 h=From:To:Cc:Subject:Date:From;
 b=VcUsJ4TJzU8MeoX9cJmjx61exJe9ix9lcQzKI1+7kkOH3DyfvwlO3kr/wJuzzgfzg
 LLDRzhKX7kwTLzjMpsDDBYNBEEUqGvhAT9BE59iRjHvSBhQ+8o8Y1kBMiDPhJBN7GG
 0l6gjrCCuR1Zjb3X8N3NGgaYG5zaC/sQKZf6zt5bUuOCD+HcEks1XoluBWygFfwMOd
 /vi6excvUM+otqCwkymls0t230yGa3VpHXqD0at07QpbiFYC82x6fi6wWBBDzYIElH
 Ao9ShvUiQdVhyUn8qT53m8LkS8Z8OvMIWAJcyjOgAyxZ9S5C80xTmOz+kDX9gaT7oQ
 duj8GTDNuaEmw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=VcUsJ4TJ
Subject: [Buildroot] [PATCH/next 1/1] package/gnupg2: fix build without ldap
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit 8f1418b5dd80809dc90196d967d8d9665b794c8e bumped the
version of gnupg2 on the next branch causing a build error:

server.c:(.text+0xbf8): undefined reference to `ks_ldap_help_variables'

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...he-call-of-ks_ldap_help_variables-wh.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/gnupg2/0001-dirmngr-Enable-the-call-of-ks_ldap_help_variables-wh.patch

diff --git a/package/gnupg2/0001-dirmngr-Enable-the-call-of-ks_ldap_help_variables-wh.patch b/package/gnupg2/0001-dirmngr-Enable-the-call-of-ks_ldap_help_variables-wh.patch
new file mode 100644
index 0000000000..53dd39cf47
--- /dev/null
+++ b/package/gnupg2/0001-dirmngr-Enable-the-call-of-ks_ldap_help_variables-wh.patch
@@ -0,0 +1,36 @@
+From dc13361524c1477b2106c7385f2059f9ea111b84 Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Wed, 5 Jul 2023 09:29:54 +0900
+Subject: [PATCH] dirmngr: Enable the call of ks_ldap_help_variables when
+ USE_LDAP.
+
+* dirmngr/server.c [USE_LDAP] (cmd_ad_query): Conditionalize.
+
+--
+
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+
+Upstream: https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=commitdiff;h=dc13361524c1477b2106c7385f2059f9ea111b84
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ dirmngr/server.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/dirmngr/server.c b/dirmngr/server.c
+index 51a149cb2..ee61f63d6 100644
+--- a/dirmngr/server.c
++++ b/dirmngr/server.c
+@@ -2776,7 +2776,9 @@ cmd_ad_query (assuan_context_t ctx, char *line)
+ 
+   if (opt_help)
+     {
++#if USE_LDAP
+       ks_ldap_help_variables (ctrl);
++#endif
+       err = 0;
+       goto leave;
+     }
+-- 
+2.11.0
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
