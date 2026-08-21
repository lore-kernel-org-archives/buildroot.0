Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A051C5DF94
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 609D181230;
	Fri, 21 Aug 2026 15:07:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AptM1B6oqKpK; Fri, 21 Aug 2026 15:07:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787324854;
	bh=Uwulh2rW+t3ZTvet1O6zcTWqt45iDCxxns9No+CeFUI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Sz19E3AdwU5SErG94KXGB7sgquUIBwD2eb676eDCZ34EKGm0t1kikiqC0pCfsM284
	 miJaIK48UGMV9fDP+X2XZQP63Kftm9D5a9AwuSW+cipU97Hc7Z2Znltn475OXXlaE0
	 EujcUS27fwB8YVo+TxqESOb8Sji3REJ6KIQ53mjKk9h6wZjDHVC9TOn3+oCthDAtlm
	 /pswZwoGzQcaPXxaPGn6j1nUX9HVaekrdlcIB/VM3U3oUxHYQqrxlK/PKohfrugOhn
	 YUiqFmAWF20GioB+oU5vxVmY48pU68uhtlHbbnfOI35Q97QioN8o7NYANanCT3t4kZ
	 KL3To1iK0W8Bg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6899A811F8;
	Fri, 21 Aug 2026 15:07:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 198CF201A
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F404D40437
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5DsI6kWSvm3N for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:07:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3EA940327
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 282458E150; Fri, 21 Aug 2026 15:06:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Aug 2026 17:04:18 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9f7a742b169fc7abe9feb1ec43be644106848cb8
X-Git-Newrev: a7b1d667f492924ed7ab4026fd6c93c58d6d0598
X-Patchwork-Hint: ignore
Message-Id: <20260821150614.282458E150@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/ser2net: backport
 security patch for GHSA-cgh5-39mg-vhfr
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a7b1d667f492924ed7ab4026fd6c93c58d6d0598
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

- GHSA-cgh5-39mg-vhfr: Path traversal in authentication via unsanitized
  username allows auth bypass
  https://github.com/cminyard/ser2net/security/advisories/GHSA-cgh5-39mg-vhfr
  No CVE ID yet.

Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9809b30290582d03244dd716c8e0e8e7be9261c3)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 .../0001-Fix-authorization-path-handling.patch     | 89 ++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/package/ser2net/0001-Fix-authorization-path-handling.patch b/package/ser2net/0001-Fix-authorization-path-handling.patch
new file mode 100644
index 0000000000..a90130844f
--- /dev/null
+++ b/package/ser2net/0001-Fix-authorization-path-handling.patch
@@ -0,0 +1,89 @@
+From fa6c2a8840cbc8d7622e46ce12ba15ecc0fb51b7 Mon Sep 17 00:00:00 2001
+From: Corey Minyard <corey@minyard.net>
+Date: Thu, 23 Jul 2026 10:51:25 -0500
+Subject: [PATCH] Fix authorization path handling
+
+The username is received from the remote end and thus untrusted.  Make
+sure it doesn't have any characters that can cause it to escape the
+directory it is supposed to be in when constructing a path.
+
+Reported-by: TristanInSec
+Signed-off-by: Corey Minyard <corey@minyard.net>
+
+Upstream: https://github.com/cminyard/ser2net/commit/fa6c2a8840cbc8d7622e46ce12ba15ecc0fb51b7
+
+Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
+---
+ auth.c | 42 ++++++++++++++++++++++++++++++++++++++----
+ 1 file changed, 38 insertions(+), 4 deletions(-)
+
+diff --git a/auth.c b/auth.c
+index 95c80b4..53c3186 100644
+--- a/auth.c
++++ b/auth.c
+@@ -185,6 +185,40 @@ handle_auth_begin(struct gensio *net, const char *authdir, const char *pamauth,
+     return GE_NOTSUP;
+ }
+ 
++/*
++ * Construct a secure authorization path.
++ *
++ * filename must be at least MAX_PATH.
++ *
++ * "username" is untrusted, the rest of the data is trusted.
++ */
++static bool
++construct_auth_path(char *filename, const char *authdir, const char *username,
++		    const char *format, ...)
++{
++    size_t baselen;
++    va_list ap;
++
++    /*
++     * '/', '.', and '\' are all parts of things that can modify the base
++     * path.  Don't allow them in usernames.
++     */
++    if (strchr(username, '.') || strchr(username, '/')
++		|| strchr(username, '\\'))
++	return false;
++
++    /* Get a good base path ending in / */
++    baselen = snprintf(filename, PATH_MAX, "%s/%s/",
++		       authdir, username);
++
++    /* Now append the rest of the path. */
++    va_start(ap, format);
++    vsnprintf(filename + baselen, PATH_MAX - baselen, format, ap);
++    va_end(ap);
++
++    return true;
++}
++
+ static int
+ handle_precert(struct gensio *net, const char *authdir)
+ {
+@@ -228,8 +262,8 @@ handle_precert(struct gensio *net, const char *authdir)
+ 	}
+     }
+ 
+-    snprintf(filename, sizeof(filename), "%s/%s/allowed_certs/",
+-	     authdir, s);
++    if (!construct_auth_path(filename, authdir, s, "allowed_certs/"))
++	return GE_AUTHREJECT;
+     err = gensio_control(net, 0, false, GENSIO_CONTROL_CERT_AUTH,
+ 			 filename, &len);
+     if (err && err != GE_CERTNOTFOUND) {
+@@ -258,8 +292,8 @@ handle_password(struct gensio *net, const char *authdir, const char *password)
+ 	return GE_AUTHREJECT;
+     }
+ 
+-    snprintf(filename, sizeof(filename), "%s/%s/password",
+-	     authdir, username);
++    if (!construct_auth_path(filename, authdir, username, "password"))
++	return GE_AUTHREJECT;
+     pwfile = fopen(filename, "r");
+     if (!pwfile) {
+ 	syslog(LOG_ERR, "Can't open password file %s: %s", filename,
+-- 
+2.55.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
