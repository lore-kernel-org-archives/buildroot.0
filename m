Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A9ACD8CA8
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDC0185D8F;
	Tue,  9 Jun 2026 13:05:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gO8chHZNoU97; Tue,  9 Jun 2026 13:05:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA97985D3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010314;
	bh=CN7+QiYg+PRDbbTrbexMY5lIcBliZyBBjX3gHipj6Ys=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=re/KtGNDc7dHtnrH7FYOa8s7L7ZlZuLnMO1Y5lCkuFpWdN4dZ972K9KGqSkwBa56n
	 PviqMOMTkONN5HJlPIUsfwExlN8YJ0Z5ilGGkvwIxZt7ijicJ6UTzsRbWPB17RjdBI
	 IWYm0FeEnHbjrJDAVptICNd7EnNtXy7d+A3NPj0Ur3Z6DUYucez1hSdMF+37Djvsc1
	 EJ8IeknUoEDmw1LWJn6PrUzgB2SH2b9N8SSKlMWKFAb1L4z3oxnGMd8n2sEFBglPPP
	 ElFyGstbMrOFKaXKuhiK8oVYR+ZuWaHMkZMJHC0vdET8RQzn8V1q2tfpI2WqOU7ReV
	 pOYEtS2aCFOFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA97985D3E;
	Tue,  9 Jun 2026 13:05:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id ED37D190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 432194637A
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vUJykwI3iexx for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2608245076
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2608245076
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 61FE187E68; Tue,  9 Jun 2026 13:01:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 15:48:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8a6162a34d28be138d05e2719632344b0bd8b9c3
X-Git-Newrev: 0d7224802004a23229d8144a9e01755fc1974b24
X-Patchwork-Hint: ignore
Message-Id: <20260609130122.61FE187E68@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/grantlee: Fix build with gcc 16.x
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0d7224802004a23229d8144a9e01755fc1974b24
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...plate-id-in-constructor-of-template-class.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
