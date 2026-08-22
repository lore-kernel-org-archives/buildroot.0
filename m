Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63160C5DF97
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 16:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8334E60715;
	Sat, 22 Aug 2026 16:36:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rk3ZduZpGNdL; Sat, 22 Aug 2026 16:36:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787416560;
	bh=RFnT/n4/VRwFBk0G8BYKJucQ4YLXqr/nwbLq0VhiwrU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=e1fqmsuIgucppR0xxc3WNgyp5oNBi9MbEhSqArH7x1/782X7y8H2ZVn9rwv1Yy/FQ
	 DhwLy39sUzpAo/PUj1onQ1ylMpAOuA53w32yqtgCQfKxcptaNcPEhntpcwHzZIIH5V
	 KtY8jD1V+4wWjsG7tJ3rHOoQvVwcefdd8ZSCm2R+JquE2zOX8wD9knAJA1LzqyyC0y
	 EuuQx6DkLI6BRlz/Mw6v/0hcaFv5jAIiL3z1RhSgB6tXLn4YjyPxxnWvm8SJfMEA9c
	 uIZHzN/NYhVSR5WtXqm4SXfMbL2fthvZL/F5pYMZoSg3v10Z2a0NXVdbQi+6jQUykQ
	 Tn1u9Bc/TQT3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 511F360644;
	Sat, 22 Aug 2026 16:36:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 639F829B
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 16:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55E2A80ECC
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 16:35:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZGCuSSNR63Ei for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 16:35:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B066F80ECA
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 16:35:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 94C3E8E5F1; Sat, 22 Aug 2026 16:35:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Aug 2026 17:56:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 89485adb296732e9e40e0ca7089381b3ca5486ce
X-Git-Newrev: e991fa071605a78c17adba2ed26e07c3b8c95583
X-Patchwork-Hint: ignore
Message-Id: <20260822163503.94C3E8E5F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wget: fix CVE-2026-58471
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
Content-Type: multipart/mixed; boundary="===============2925267629639368194=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2925267629639368194==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e991fa071605a78c17adba2ed26e07c3b8c95583
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Backport the upstream fix for a heap buffer overflow in
convert_fname() when growing the iconv output buffer.

Backport to: 2025.02.x

Signed-off-by: Stefan Müller <stemu86@gmx.ch>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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

--===============2925267629639368194==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2925267629639368194==--
