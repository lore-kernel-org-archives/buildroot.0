Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78EC2EE4993
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 18:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32C6361203;
	Tue, 22 Aug 2023 18:07:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32C6361203
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XBj3-lVXIExN; Tue, 22 Aug 2023 18:07:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99D3261229;
	Tue, 22 Aug 2023 18:07:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99D3261229
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D76F51BF2BD
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 18:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE55D61203
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 18:07:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE55D61203
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bk6SWFdKZSqG for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 18:07:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4A2061205
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 18:07:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4A2061205
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D1FD086102; Tue, 22 Aug 2023 18:07:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Aug 2023 20:07:26 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 67ff42ac4a98e4c0cbcb60c8e6cf7652f3c84027
X-Git-Newrev: 06702c81d3ce70dbba1d6a733a95bf13a3cff0c3
X-Patchwork-Hint: ignore
Message-Id: <20230822180740.D1FD086102@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gnupg2: fix build
 without ldap
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=06702c81d3ce70dbba1d6a733a95bf13a3cff0c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Buildroot commit 8f1418b5dd80809dc90196d967d8d9665b794c8e bumped the
version of gnupg2 on the next branch causing a build error:

server.c:(.text+0xbf8): undefined reference to `ks_ldap_help_variables'

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ble-the-call-of-ks_ldap_help_variables-wh.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
