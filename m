Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2B4FCC05E
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 18:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62166613C1;
	Fri,  6 Mar 2026 18:40:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HjiQRaWwtVy6; Fri,  6 Mar 2026 18:40:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78C2D613C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772822438;
	bh=EFG0fE8LA2tZQHn3OlNH0InAPjQs+MRX227Ptzdays0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IbRhds+aEX38hnCZXPvHzIJELjmBtgQDD8EYbGYT9pMx2b269newEVCwyLRSCxr61
	 Oo2ijtZtV1D9sG9S0hb/UcrQ+BDfZtuBgsFohJ++bPga6oBljpKt/ggAGoR7ljfuZT
	 z3RZBAqOBjS05kix9XjMH6enbLqTM9FDxYKrU1DIEt7jIkmI1qWCgMyDujurXoK3PH
	 lm5M786agOEZmQGxtMgTgRj3VNslOZ6CFK+XU7XnR/diGhQ9ePptnZRAOx5CWjSTwM
	 96DhnMYlVUnNolnpxC0Y4TasvJBMzYhMAV47Mfn1e7h4SwNf9+OgvRi4RveZW564+F
	 mK80BOzFxKIaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78C2D613C4;
	Fri,  6 Mar 2026 18:40:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DF9239B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 404D741DDB
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KvcQETCTJ4C3 for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 18:40:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8393B41E06
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8393B41E06
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:40:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8CF3C867A4; Fri,  6 Mar 2026 18:40:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 19:39:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 94916981ceb194af5c03b2f877d4b345601996f8
X-Git-Newrev: 5d1cc4f05e4ca6f3ecabfed97d2b67f2ef28b258
X-Patchwork-Hint: ignore
Message-Id: <20260306184030.8CF3C867A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/links: Fix build with glibc 2.43
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5d1cc4f05e4ca6f3ecabfed97d2b67f2ef28b258
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/links/0001-glibc-2.43.patch | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/links/0001-glibc-2.43.patch b/package/links/0001-glibc-2.43.patch
new file mode 100644
index 0000000000..73bd330c7a
--- /dev/null
+++ b/package/links/0001-glibc-2.43.patch
@@ -0,0 +1,27 @@
+Fix build with glibc 2.43
+
+https://bugs.gentoo.org/969617
+https://gitlab.exherbo.org/exherbo/arbor/-/raw/45d1f0e764ad1fcb8d776534d0925fe074d04d61/packages/net-www/links/files/links-2.30-glibc-2.43.patch
+
+Source: https://www.linuxfromscratch.org/blfs/view/svn/basicnet/links.html
+Reason: Fix build with glibc 2.43
+
+Downloaded from
+https://gitweb.gentoo.org/repo/gentoo.git/tree/www-client/links/files/links-2.30-glibc-2.43-const.patch?id=ad9dd078c5473b947f237136746cd1c3933ae494
+
+Upstream: Sent via email to project maintainers
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+--- a/ftp.c
++++ b/ftp.c
+@@ -768,7 +768,7 @@
+ } while (0)
+ 		A(ftp_head);
+ 		ud = stracpy(get_url_data(c->url));
+-		if (strchr(cast_const_char ud, POST_CHAR)) *strchr(cast_const_char ud, POST_CHAR) = 0;
++		if (strchr(cast_char ud, POST_CHAR)) *strchr(cast_char ud, POST_CHAR) = 0;
+ 		s0 = init_str();
+ 		s0l = 0;
+ 		add_conv_str(&s0, &s0l, ud, (int)strlen(cast_const_char ud), -1);
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
