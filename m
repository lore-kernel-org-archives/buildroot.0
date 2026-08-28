Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C29C61DCB
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1709811EF;
	Fri, 28 Aug 2026 14:26:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WsCqVj0Qycmd; Fri, 28 Aug 2026 14:26:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927178;
	bh=/0I7ZLmcDQgs+rSBgEx/GeM3QWj/hhbSse118HuHxVU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JBSVQeIlW/KkJNg6T8L64j3wuO4n6IIys2Wns0zGJYdzmt9NFyKsEa1Qa/LKKmdfs
	 L+iQxRHoI9HrIUsdbhOyNX4dkUFYGwOcSLJt4RP+PaEWhcDW6slYN90imIGjUzt8i7
	 QYDm8aq4llq2uciDhlV3uxihaI032CI5481ZABDfgn6Pi/FawFJS/LU1qLYXtEjJ8H
	 Nd/S+lQM7UaVbvIcn45g4Lbz+oP8TaEw6HDeToCzqipLSjd8xom6GTEORmdlNBkSfs
	 2Dp+90MOmtp2ICdqbVbiUGJXKkdnFAyRDUxQOqTVNmbIMSE1WANag7oYLibDUco93X
	 0le1Zc6OTcaEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BEBF811C8;
	Fri, 28 Aug 2026 14:26:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 87287D2E
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 749A980F48
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XdrSj9AqzWDM for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8118480F56
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F45F921FA; Fri, 28 Aug 2026 14:24:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:58:04 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: fd6d1b7f99dbc12a3a11c8a81be238b33596df44
X-Git-Newrev: 140b534bc26ae017a3d329fb70d7063a518b8e4c
X-Patchwork-Hint: ignore
Message-Id: <20260828142442.7F45F921FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/wget: fix
 CVE-2026-58471
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
Content-Type: multipart/mixed; boundary="===============4126237399476069652=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4126237399476069652==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/140b534bc26ae017a3d329fb70d7063a518b8e4c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Backport the upstream fix for a heap buffer overflow in
convert_fname() when growing the iconv output buffer.

Backport to: 2025.02.x

Signed-off-by: Stefan Müller <stemu86@gmx.ch>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e991fa071605a78c17adba2ed26e07c3b8c95583)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...c-url.c-convert_fname-Fix-buffer-overflow.patch | 72 ++++++++++++++++++++++
 package/wget/wget.mk                               |  3 +
 2 files changed, 75 insertions(+)

diff --git a/package/wget/0007-src-url.c-convert_fname-Fix-buffer-overflow.patch b/package/wget/0007-src-url.c-convert_fname-Fix-buffer-overflow.patch
new file mode 100644
index 0000000000..5963d98990
--- /dev/null
+++ b/package/wget/0007-src-url.c-convert_fname-Fix-buffer-overflow.patch
@@ -0,0 +1,72 @@
+From c2640fe5171c59f87c58dc9fcb195b2d18b010ee Mon Sep 17 00:00:00 2001
+From: Arkadi Vainbrand <arkadva8@gmail.com>
+Date: Tue, 13 Jan 2026 12:22:04 +0200
+Subject: [PATCH] Fix buffer size handling in filename conversion
+
+* src/url.c (convert_fname): Fix buffer overflow.
+
+Copyright-paperwork-exempt: Yes
+Signed-off-by: Arkadi Vainbrand <arkadva8@gmail.com>
+CVE: CVE-2026-58471
+Upstream: https://gitlab.com/gnuwget/wget/-/commit/c2640fe5171c59f87c58dc9fcb195b2d18b010ee
+Signed-off-by: Stefan Müller <stemu86@gmx.ch>
+
+---
+ src/url.c | 20 +++++++++++++-------
+ 1 file changed, 13 insertions(+), 7 deletions(-)
+
+diff --git a/src/url.c b/src/url.c
+index 7540e90f..f334456c 100644
+--- a/src/url.c
++++ b/src/url.c
+@@ -1614,7 +1614,7 @@ convert_fname (char *fname)
+   const char *from_encoding = opt.encoding_remote;
+   const char *to_encoding = opt.locale;
+   iconv_t cd;
+-  size_t len, done, inlen, outlen;
++  size_t len, inlen, outlen;
+   char *s;
+   const char *orig_fname;
+ 
+@@ -1636,7 +1636,6 @@ convert_fname (char *fname)
+   inlen = strlen (fname);
+   len = outlen = inlen * 2;
+   converted_fname = s = xmalloc (outlen + 1);
+-  done = 0;
+ 
+   for (;;)
+     {
+@@ -1644,7 +1643,7 @@ convert_fname (char *fname)
+       if (iconv (cd, (ICONV_CONST char **) &fname, &inlen, &s, &outlen) == 0
+           && iconv (cd, NULL, NULL, &s, &outlen) == 0)
+         {
+-          *(converted_fname + len - outlen - done) = '\0';
++          *s = '\0';
+           iconv_close (cd);
+           DEBUGP (("Converted file name '%s' (%s) -> '%s' (%s)\n",
+                    orig_fname, from_encoding, converted_fname, to_encoding));
+@@ -1667,10 +1666,17 @@ convert_fname (char *fname)
+         }
+       else if (errno == E2BIG) /* Output buffer full */
+         {
+-          done = len;
+-          len = outlen = done + inlen * 2;
+-          converted_fname = xrealloc (converted_fname, outlen + 1);
+-          s = converted_fname + done;
++          size_t used = s - converted_fname;
++          size_t newlen = used + inlen * 2 + 1;
++
++          /* Ensure we actually grow the buffer */
++          if (newlen <= len)
++            newlen = len * 2;
++
++          converted_fname = xrealloc (converted_fname, newlen + 1);
++          len = newlen;
++          s = converted_fname + used;
++          outlen = len - used;
+         }
+       else /* Weird, we got an unspecified error */
+         {
+-- 
+GitLab
+
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 015fc0c59e..de758635b3 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -21,6 +21,9 @@ WGET_IGNORE_CVES += CVE-2026-58469
 # 0006-src-http.c-parse_content_range-Use-strtoll-instead-of-strtol.patch
 WGET_IGNORE_CVES += CVE-2026-58470
 
+# 0007-src-url.c-convert_fname-Fix-buffer-overflow.patch
+WGET_IGNORE_CVES += CVE-2026-58471
+
 WGET_CONF_OPTS += --disable-pcre
 
 ifeq ($(BR2_PACKAGE_LIBPSL),y)

--===============4126237399476069652==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4126237399476069652==--
