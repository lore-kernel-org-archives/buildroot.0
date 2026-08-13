Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD2D6C5CFDB
	for <buildroot@archiver.kernel.org>; Thu, 13 Aug 2026 19:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61D0F813BD;
	Thu, 13 Aug 2026 19:35:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Svja711PqKgw; Thu, 13 Aug 2026 19:35:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FAEA813AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786649743;
	bh=a05WOxBx7d6917qWpnIl7/GZBUSMkRpMlCQMNTrIAcw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rca5WUZK9YWGGMSWSYB1PGjS3qMGHovInK9/Hjjj30Ii/gVYT9qZqWUUNZIhNm4Ho
	 4vXKhe0hPnIWMpx+SF9FmqjHCVBft2Z7HdvGKveTXcMVZvNqAXBqQLGVUVTjzOdCYL
	 bAhjU9VjLVMc+cuw69Oh6X6aZX1sQf6ctuDFnQV+KCjiEZGSEC2QYEcQRYWM9cqh7/
	 LpT0HmPWb9tpjUm9YANxgAmqJrM6poKmmV+CkI+/w5JRubn4Ap1VPa2aI4td2XdjoP
	 9Fs1dTKzv1sXT9i9J0WVRRvHZ6WUqt9fUmFp3v5xbp5M+Cwdq6KPPgp4fWW8qa73DS
	 lXwnv9RnQGEsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FAEA813AD;
	Thu, 13 Aug 2026 19:35:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 68B122B2
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 19:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A76340147
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 19:35:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y_fkldV9Vb-t for <buildroot@buildroot.org>;
 Thu, 13 Aug 2026 19:35:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 863CB40348
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 863CB40348
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 19:35:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D500F8D583; Thu, 13 Aug 2026 19:34:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 21:31:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 297f6f1921960c1735bca34b5a80138e2a8261f4
X-Git-Newrev: 9809b30290582d03244dd716c8e0e8e7be9261c3
X-Patchwork-Hint: ignore
Message-Id: <20260813193450.D500F8D583@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ser2net: backport security patch
 for GHSA-cgh5-39mg-vhfr
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9809b30290582d03244dd716c8e0e8e7be9261c3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

- GHSA-cgh5-39mg-vhfr: Path traversal in authentication via unsanitized
  username allows auth bypass
  https://github.com/cminyard/ser2net/security/advisories/GHSA-cgh5-39mg-vhfr
  No CVE ID yet.

Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
