Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 299E6CCA464
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 20:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0B7E811EC;
	Thu, 15 Oct 2026 20:03:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lIUJ-hcpjz9N; Thu, 15 Oct 2026 20:03:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E2362811E7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792094594;
	b=ebdPp2WxjxGOxt3NLFQC8LqtLQSQU6gaf4jcSjLwbOvdyWVNmHKlHRoQPWeYxoY7t1d5
	 Yydul0l6Qa2NckuIHmeErRnZRj4ppc2jOocrLsSIAjodKMo7fPqY7Q22mA2LipQLnd6/w
	 C6J2d2aclBP+yNoPBHkBGQFKceCEr+t177FvzBKO8qTw+PALjI1mFM46F+OIz8UUhEwV1
	 +j4EFhzZ2C2mn7mdoSWwCMuwaZeS8vmg/dNAgAhDaeL1AJkBgn9Kh/ByYONrKSDwAB3qY
	 D/vXUu2gV+YPMRRWf9EukToHw2l9gFsvnlYbBpwRR15CH3727B58Xsz0tdL4nqS84zw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792094594;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=onJ3RQDBszVV5GWQ6tbu67llm39kn1x2Nxe6cuZpt0E=;
	b=n+9J5zp5aiXNHIdESL+T4fLT5otv+leD12PSY4Odva6EDZIpeIve9LXobR28bFDk/pNu
	 zjQPNH5c2GL3vrrEEx4e84DAG//ax1/PhzzHAhF6ZCexvnvHgYmaW5DUcDj2vlW7CCeyx
	 m6FRF2ojytDTK5zb5kQdcsjlzn9sU6yMyB2Ed15E630i7SGDbb9dZqTr1+ACcZKQ7xLdK
	 Pc1HOTU1jTcc3cz1S4UqpiKGRlaZpqT8o7xqTugkhVHPmF0g9reo6VI69SLymzN0QXJ0q
	 WRYmZ19yf8nTRQFCPkCW49wYsdOcFVzL5myYvbfoMay3GLvtWDhqQcXd1sDiZDF98uw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792094594;
	bh=onJ3RQDBszVV5GWQ6tbu67llm39kn1x2Nxe6cuZpt0E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Apf4xuaIWFqgp9zpFv34FD7ZBemZMALbmHNveQofWXmixAypQdmpd5j1ZqQjNSdby
	 mFThfomyt2gcod7gfsi42KvBSOaVad+rf4K5VjcspJ1FSmAicj3JF+QSbh+IN56Br4
	 6WC7MwU1iL2IhGkurbvjOxBKVoPpHYoMjB2tJyLmyCuLcbS8Kkx0ACUBoh79UORpsA
	 suM6jQKGIiQsEiMmjyS3qcHvuMGMTdB/94mM/ghhw9+hrJKuhcCSyoEZBzDAlG3YXn
	 fViQONvges5FeUQ3x/B0a9Zs2uQSY/iq93gWbILntR1NfZ5hoGBHRWuWiO55BKSjko
	 Rn5hW1SSjkndw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2362811E7;
	Thu, 15 Oct 2026 20:03:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id ADC25920
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 922F48120E
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:03:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i5QasfJk84ia for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 20:03:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 36C1181202
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792094591;
 b=GO0/hJCEE0CqC15XSvw9Mfea5svFnPKxdvOkAgkjtVHVK1ICLICfOXqEKrwjdYyCWDW+
 rGMg3HAl8oHbplfAdO4je/njVCU2GnX41Nrd13ccqmq7IBFaX3lNh7Pudh7FdYzZ3Fisw
 +4f1FRNL4jcpbZzUjXu6G9w10vC9al9LtauNUzFSc4VVwy1YooV0BkBuvz5tE1gipyr5a
 xK5kMMsKy9Oq2QKxRzz7/oMMxidG5dZE9dU6eUH8RuXotlxpOEk5a1K3Y1U4jKiGqcJRj
 zZDNjGYvB3S5vCCiu480rlGK3NJYnGZZuPltHDLHVEw1iOQoHYWS3XuyOuBZHzy8Agw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792094591;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=F9kNG25QZcNeUN7o7u1dMw/luQv1I94nYPGZSgtwnIQ=;
 b=eTcoRIRtgygVdoo6NWrHijNI3eloNYph3LE/s5IG0N4X9/Muwtr4XvOXvb5lxtXvElaw
 zHVTAoTuosPaMLFaID5w3igUSr8yINj8PPGJPbq9FnDFinV5BHoHmFdZmRBB2KqQ5lZpG
 GhEf/lZdIX2/ZQVaWLVFXAeX9OHnEQ9WdJ+ufHqap2HGwM7qmoxPJRF/mjjEgZLHIHWcW
 dgFYFhLmdrRgMrmhmZ5OV3loKjjH7pDoHYwj8aKrwQwx+F4WNA9RZ8cNwVMo7HiE18Lrd
 KEMp0DppwM70ya/D/8Ads3AJkfOj/fJBFwAi7ExyfsldbMxkWVEXZ3KNsc548QKAO7A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36C1181202
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:03:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D43295CF4; Thu, 15 Oct 2026 20:01:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 22:01:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 112fd25dc6240ea69168080fda016970454c1988
X-Git-Newrev: 58aedd45baf9406ed36e9e90b554d3a689440b7d
X-Patchwork-Hint: ignore
Message-Id: <20261015200150.6D43295CF4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libglib2: backport upstream
 security fix for CVE-2026-58016
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/58aedd45baf9406ed36e9e90b554d3a689440b7d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes the following vulnerability:

CVE-2026-58016: A flaw was found in GLib.  A state confusion issue exists in
g_dbus_node_info_new_for_xml() in the gio/gdbusintrospection.c file when
processing malformed D-Bus introspection XML, specifically with a `node`
element nested within other elements like `method`, `signal`, `property` or
`arg`.  This issue can cause an unsigned integer overflow and lead to an
out-of-bounds read, resulting in a denial of service.

https://gitlab.gnome.org/GNOME/glib/-/merge_requests/5156

Backport the upstream patch (included in 2.89.0), but drop the test addition
for easier backport:

https://gitlab.gnome.org/GNOME/glib/-/commit/c9da977c178fbfc0e4caf99f9fdf5dc433d6fcc2

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 ...pection-Fix-XML-parser-state-handling-for.patch | 42 ++++++++++++++++++++++
 package/libglib2/libglib2.mk                       |  3 ++
 2 files changed, 45 insertions(+)

diff --git a/package/libglib2/0001-gdbusintrospection-Fix-XML-parser-state-handling-for.patch b/package/libglib2/0001-gdbusintrospection-Fix-XML-parser-state-handling-for.patch
new file mode 100644
index 0000000000..4582382f80
--- /dev/null
+++ b/package/libglib2/0001-gdbusintrospection-Fix-XML-parser-state-handling-for.patch
@@ -0,0 +1,42 @@
+From c9da977c178fbfc0e4caf99f9fdf5dc433d6fcc2 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Thu, 16 Apr 2026 15:27:37 +0100
+Subject: [PATCH] gdbusintrospection: Fix XML parser state handling for <node>
+ element nesting
+
+The check for whether a `<node>` element in D-Bus introspection XML was
+nested correctly was broken. `<node>` elements can only be at the top
+level, or nested immediately within another `<node>` element.
+
+Fix the check and add some unit tests for it.
+
+Spotted by linhlhq as #YWH-PGM9867-204. The fix is mine, and the unit test
+uses example XML strings adapted from their report.
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+
+Fixes: #3932
+CVE: CVE-2026-58016
+Upstream: https://gitlab.gnome.org/GNOME/glib/-/commit/c9da977c178fbfc0e4caf99f9fdf5dc433d6fcc2
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+[Peter: drop tests]
+---
+ gio/gdbusintrospection.c        |  2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gio/gdbusintrospection.c b/gio/gdbusintrospection.c
+index 1138ba9d7..4df8e87db 100644
+--- a/gio/gdbusintrospection.c
++++ b/gio/gdbusintrospection.c
+@@ -1266,7 +1266,7 @@ parser_start_element (GMarkupParseContext  *context,
+   /* ---------------------------------------------------------------------------------------------------- */
+   if (strcmp (element_name, "node") == 0)
+     {
+-      if (!(g_slist_length (stack) >= 1 || strcmp (stack->next->data, "node") != 0))
++      if (stack->next != NULL && strcmp (stack->next->data, "node") != 0)
+         {
+           g_set_error_literal (error,
+                                G_MARKUP_ERROR,
+-- 
+2.47.3
+
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 45aa894b81..3770e8671a 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -17,6 +17,9 @@ LIBGLIB2_INSTALL_STAGING = YES
 LIBGLIB2_CFLAGS = $(TARGET_CFLAGS)
 LIBGLIB2_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
+# 0001-gdbusintrospection-Fix-XML-parser-state-handling-for.patch
+LIBGLIB2_IGNORE_CVES += CVE-2026-58016
+
 # glib/valgrind.h contains inline asm not compatible with thumb1
 ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 LIBGLIB2_CFLAGS += -marm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
