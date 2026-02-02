Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D4D9E7DEE3
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 14:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DC3740A48;
	Mon,  2 Feb 2026 14:20:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LbYOF9T19PQG; Mon,  2 Feb 2026 14:20:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64E1040B4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770042032;
	bh=31mbbFrFmJ5C3oTHC9S/oGYN/OnIhzAPM+9mDBU4ROk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=U2fSmWVrnCtslZqTxjunzYlGGegW+8+u+1yFhYLQQLGjfZD5N3sbGdjT/ZmukOB5u
	 Io8FSwklTj+D8vWL5G7Ly0QnWR/K1ntX9z7PRULdn/FnoCe21plttFJiyO5+hvAETx
	 Fs/jJF2oEHbHAgV7QLBdw1Ayz/bAtwgFdNgoaCZM51kjYNI8f+hC0lNYSdhTXV+g15
	 9F6aX3OomPK86r0UKVvIvXI6AvqpDrBo8OeFZ8vHwDQ0mTNua4tMkDXN0ycjxbsR+0
	 9SZYiIbjUFZTzwo1LjKAXHGQAwsLreVe7IzkjYo2Ljm3bs3uPbrfo3KRHnXFChXOXO
	 AQrEhNrcPhWbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64E1040B4E;
	Mon,  2 Feb 2026 14:20:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1247523E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02B16606FA
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:20:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bYTfnwHqjQxE for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 14:20:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37206606BD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37206606BD
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:20:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2137886352; Mon,  2 Feb 2026 14:20:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 15:18:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 42d6c6ab687be17f62219884e74d808ef190deb7
X-Git-Newrev: eed531873019f695437f1252c16a8e5b5393835f
X-Patchwork-Hint: ignore
Message-Id: <20260202142030.2137886352@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netsniff-ng: fix compilation with
 >= gcc-15
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1242707754984843489=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1242707754984843489==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=eed531873019f695437f1252c16a8e5b5393835f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build error was not yet recorded by autobuilders.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...1-mausezahn-fixed-compilation-with-gcc-15.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/netsniff-ng/0001-mausezahn-fixed-compilation-with-gcc-15.patch b/package/netsniff-ng/0001-mausezahn-fixed-compilation-with-gcc-15.patch
new file mode 100644
index 0000000000..5eaaa91f10
--- /dev/null
+++ b/package/netsniff-ng/0001-mausezahn-fixed-compilation-with-gcc-15.patch
@@ -0,0 +1,39 @@
+From 1af7ae33e3e8178ab5c649c3a52838d4375c4228 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jaroslav=20=C5=A0karvada?= <jskarvad@redhat.com>
+Date: Tue, 10 Jun 2025 14:47:54 +0200
+Subject: [PATCH] mausezahn: fixed compilation with gcc-15
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+gcc-15 by default uses C23 standard which is more strict on forward
+declarations.
+
+Original report: https://bugzilla.redhat.com/show_bug.cgi?id=2340924
+
+Signed-off-by: Jaroslav Škarvada <jskarvad@redhat.com>
+
+Upstream: https://github.com/netsniff-ng/netsniff-ng/commit/1af7ae33e3e8178ab5c649c3a52838d4375c4228
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ staging/mops.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/staging/mops.h b/staging/mops.h
+index cf19f098..ae3769a7 100644
+--- a/staging/mops.h
++++ b/staging/mops.h
+@@ -940,9 +940,9 @@ int mops_direct(char* dev, int mops_type, char* argstring);
+ 
+ 
+ struct automops * automops_init(void);
+-struct automops * automops_alloc_protocol();
+-struct automops * automops_delete_protocol();
+-struct automops * automops_search_protocol();
++struct automops * automops_alloc_protocol(struct automops *cur);
++struct automops * automops_delete_protocol(struct automops *cur);
++struct automops * automops_search_protocol(struct automops *list, char *name);
+ int               automops_dump_all (struct automops* list);
+ void              automops_set_defaults(struct automops * cur);
+ struct fields *   automops_add_field (struct automops *amp);

--===============1242707754984843489==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1242707754984843489==--
