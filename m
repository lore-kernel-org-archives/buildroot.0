Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616A6FCC056
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 18:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B95183CF4;
	Fri,  6 Mar 2026 18:40:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pBypfun539Hk; Fri,  6 Mar 2026 18:40:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F88E83DB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772822437;
	bh=RdQTr9tL66UmV04hBB5kGhLA2yjLF8cZL0a1FiX/m/w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LsnzuxNnS1b/FdELfRRhagULiuDeGXNgw5SWiKAP1YHx0cdDnGG22V7gvXbrnhtdb
	 uSIzwB5TBwakLQQzJQ0xIqsDlqagfCQDaIhsgUFd+Bj2GIGCxbVgRnpRDyQUPsrN5H
	 O/u7KmEhlXdOBb+X8jE/jdBruweHyWvcLtrTVnaZgk+3rtDAqT9iltb+5oubo/3mB4
	 hUtWWq+u/jsR8gM0lhBiuzyAFJjxQPO2Dp7mIjDXRyMdGuuqVWbGZ3QrJWzkgefT9H
	 8INhIIKTOzvE/89jiVIHpjby+d9v5TQM22aCIpPMc7lltpzPA9C9sKfQ3oNx93twG6
	 7OfV16QHndnUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F88E83DB2;
	Fri,  6 Mar 2026 18:40:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 52440339
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37CAB60BF2
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id srlYC-SQmlTF for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 18:40:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 677BF612C8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 677BF612C8
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:40:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E25C83C32; Fri,  6 Mar 2026 18:40:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 19:39:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5cdf5fa4242c0b5e94c36c4f9fccc2a386f84a57
X-Git-Newrev: 876e987099c4e1bbd5710fa75e4187469f8969dc
X-Patchwork-Hint: ignore
Message-Id: <20260306184030.6E25C83C32@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wlroots: fix build with glibc 2.43
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/876e987099c4e1bbd5710fa75e4187469f8969dc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/wlroots/0002-xcursor.patch | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/wlroots/0002-xcursor.patch b/package/wlroots/0002-xcursor.patch
new file mode 100644
index 0000000000..d57980fa39
--- /dev/null
+++ b/package/wlroots/0002-xcursor.patch
@@ -0,0 +1,33 @@
+From 47486545b196987f6f07fffe2929bba8f515b8e9 Mon Sep 17 00:00:00 2001
+From: Dale Turner <rxguyrx@gmail.com>
+Date: Wed, 3 Dec 2025 20:02:29 -0400
+Subject: [PATCH] =?UTF-8?q?Add=20"const"=20to=20eliminate=20"error:=20init?=
+ =?UTF-8?q?ialization=20discards=20=E2=80=98const=E2=80=99=20qualifier=20f?=
+ =?UTF-8?q?rom=20pointer=20target=20type"?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream: https://gitlab.freedesktop.org/wlroots/wlroots/-/commit/47486545b196987f6f07fffe2929bba8f515b8e9
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ xcursor/xcursor.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/xcursor/xcursor.c b/xcursor/xcursor.c
+index b5edb9de8..6627fb6cd 100644
+--- a/xcursor/xcursor.c
++++ b/xcursor/xcursor.c
+@@ -602,7 +602,7 @@ xcursor_build_fullname(const char *dir, const char *subdir, const char *file)
+ static const char *
+ xcursor_next_path(const char *path)
+ {
+-	char *colon = strchr(path, ':');
++	const char *colon = strchr(path, ':');
+ 
+ 	if (!colon)
+ 		return NULL;
+-- 
+GitLab
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
