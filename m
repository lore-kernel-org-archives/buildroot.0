Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D93CD6E54
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 13:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64E0C6F56E;
	Sat, 30 May 2026 13:52:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KJ0J13pKRgQu; Sat, 30 May 2026 13:52:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A77DC6F586
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780149160;
	bh=BYbtWK8Ag4N3EviN3s+xgBf9e/mdx4i9hxnTePvWBRA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MSUaukxHXV9tCv8T3M0wVRmJyfdrC9KZqKqCE6sTv+2ujTIjxPnh2j0GetTRsM/f3
	 LsXAYic+7QkrgG51kqasbaMAqSSODzpbICH+jACoZ6Ax6MqYG77keQjBaCSMXMNmZ0
	 LCoDbPLCx+xcMWScTgFtQAXRgZNqe8VjOOJVPJWRLvlAUTNvCokgooRUWCpo6s0sGI
	 kjRlJ+GKYtB91TR6yQYLSfWnoOcntYbABAHjllPgTfEfGmHb/PZczZ4snHVG0spnjz
	 pfo2hWU3oG+Rf6xwVi8jERtfdTUgKDoP5GybdnIVj4NmwK5U2EiV84JcmRyXBCfGuG
	 bSO3KEDpCml8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A77DC6F586;
	Sat, 30 May 2026 13:52:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 17F80218
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13F3B4025D
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:52:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jKkIc8gdW6FX for <buildroot@buildroot.org>;
 Sat, 30 May 2026 13:52:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5340740608
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5340740608
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:52:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4749A8750B; Sat, 30 May 2026 13:52:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 15:48:42 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8a6162a34d28be138d05e2719632344b0bd8b9c3
X-Git-Newrev: 0d7224802004a23229d8144a9e01755fc1974b24
X-Patchwork-Hint: ignore
Message-Id: <20260530135221.4749A8750B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/grantlee: Fix build
 with gcc 16.x
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
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

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
