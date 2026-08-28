Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7868AC61DD9
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E953980F5B;
	Fri, 28 Aug 2026 14:23:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8wi4Q6yUkWuu; Fri, 28 Aug 2026 14:23:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927025;
	bh=ZbTz1Qm7V5IQimz1tljZlzpELMeGwHI7Ttg19rGomPs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=m4gui7Rr7W5nrtkGDMH5EtHbF2rXgJWfrAlztFn/6IeoV/JITTAB6Pym8bbcO4CzM
	 WbEL0JSaBTI6S8ahqnRtlb1cckuXSPWcqRW7VAigbSVOBnl2+lUdk4PLaBiZbHvYYl
	 echWQvymvMpinXxOW6Wq2EGuXUk1w24UI2hIm/bcF9wKtFgZ8iTKtha1Yts7nNY/YZ
	 mJYEqtsG3EHoMyI/JOCnmg13XnzOJer1bTEFJbvg/q5kmlo4kr5RYrdcOV8t6Pkjly
	 CPVLvI/4LEJQIFmFnekFNrGYzH85ysXmv35SyEvLUMcv71yT4EtAsu2+/6VqAI8AZc
	 ptJFFqX3wLEFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5CCD80F51;
	Fri, 28 Aug 2026 14:23:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6913AD2C
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B11660808
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qSWyqC9k0YXY for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:23:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 610926072C
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 52ED8921F9; Fri, 28 Aug 2026 14:22:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:57:20 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: cf345ac7253d088f13aeaa2377cf31af8d3d1b95
X-Git-Newrev: 2a99d1d195d1b2c170459e8d72295fdffecf2927
X-Patchwork-Hint: ignore
Message-Id: <20260828142241.52ED8921F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/wget: fix
 CVE-2026-58470
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
Content-Type: multipart/mixed; boundary="===============3721380877441378383=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3721380877441378383==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2a99d1d195d1b2c170459e8d72295fdffecf2927
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Backport the upstream fix for integer overflows while parsing
Content-Range headers, together with the follow-up fix using
strtoll() for wgint values.

Backport to: 2025.02.x

Signed-off-by: Stefan Müller <stemu86@gmx.ch>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 89485adb296732e9e40e0ca7089381b3ca5486ce)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...-parse_content_range-Fix-integer-overflow.patch | 80 ++++++++++++++++++++++
 ...ntent_range-Use-strtoll-instead-of-strtol.patch | 48 +++++++++++++
 package/wget/wget.mk                               |  4 ++
 3 files changed, 132 insertions(+)

diff --git a/package/wget/0005-src-http.c-parse_content_range-Fix-integer-overflow.patch b/package/wget/0005-src-http.c-parse_content_range-Fix-integer-overflow.patch
new file mode 100644
index 0000000000..c36aac458c
--- /dev/null
+++ b/package/wget/0005-src-http.c-parse_content_range-Fix-integer-overflow.patch
@@ -0,0 +1,80 @@
+From 43d3ba9336bc94937e6fae2365c6ffd30c34ffcf Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
+Date: Mon, 29 Jun 2026 18:57:54 +0200
+Subject: [PATCH] * src/http.c (parse_content_range): Fix integer overflow
+
+Reported-by: TristanInSec@gmail.com
+CVE: CVE-2026-58470
+Upstream: https://gitlab.com/gnuwget/wget/-/commit/43d3ba9336bc94937e6fae2365c6ffd30c34ffcf
+Signed-off-by: Stefan Müller <stemu86@gmx.ch>
+
+---
+ src/http.c | 35 ++++++++++++++++++++++++-----------
+ 1 file changed, 24 insertions(+), 11 deletions(-)
+
+diff --git a/src/http.c b/src/http.c
+index 61d83df1..f447c7f7 100644
+--- a/src/http.c
++++ b/src/http.c
+@@ -914,6 +914,7 @@ parse_content_range (const char *hdr, wgint *first_byte_ptr,
+                      wgint *last_byte_ptr, wgint *entity_length_ptr)
+ {
+   wgint num;
++  char *end;
+ 
+   /* Ancient versions of Netscape proxy server, presumably predating
+      rfc2068, sent out `Content-Range' without the "bytes"
+@@ -932,27 +933,39 @@ parse_content_range (const char *hdr, wgint *first_byte_ptr,
+     }
+   if (!c_isdigit (*hdr))
+     return false;
+-  for (num = 0; c_isdigit (*hdr); hdr++)
+-    num = 10 * num + (*hdr - '0');
+-  if (*hdr != '-' || !c_isdigit (*(hdr + 1)))
++
++  errno = 0;
++  num = strtol(hdr, &end, 10);
++  if (errno == ERANGE)
++    return false;
++  hdr = end;
++
++  if (*hdr++ != '-' || !c_isdigit (*hdr))
+     return false;
+   *first_byte_ptr = num;
+-  ++hdr;
+-  for (num = 0; c_isdigit (*hdr); hdr++)
+-    num = 10 * num + (*hdr - '0');
+-  if (*hdr != '/')
++
++  errno = 0;
++  num = strtol(hdr, &end, 10);
++  if (errno == ERANGE)
++    return false;
++  hdr = end;
++
++  if (*hdr++ != '/')
+     return false;
+   *last_byte_ptr = num;
+-  if (!(c_isdigit (*(hdr + 1)) || *(hdr + 1) == '*'))
++  if (!(c_isdigit (*hdr) || *hdr == '*'))
+     return false;
+   if (*last_byte_ptr < *first_byte_ptr)
+     return false;
+-  ++hdr;
+   if (*hdr == '*')
+     num = -1;
+   else
+-    for (num = 0; c_isdigit (*hdr); hdr++)
+-      num = 10 * num + (*hdr - '0');
++    {
++      errno = 0;
++      num = strtol(hdr, NULL, 10);
++      if (errno == ERANGE)
++        return false;
++    }
+   *entity_length_ptr = num;
+   if ((*entity_length_ptr <= *last_byte_ptr) && *entity_length_ptr != -1)
+     return false;
+-- 
+GitLab
+
diff --git a/package/wget/0006-src-http.c-parse_content_range-Use-strtoll-instead-of-strtol.patch b/package/wget/0006-src-http.c-parse_content_range-Use-strtoll-instead-of-strtol.patch
new file mode 100644
index 0000000000..9c484dda32
--- /dev/null
+++ b/package/wget/0006-src-http.c-parse_content_range-Use-strtoll-instead-of-strtol.patch
@@ -0,0 +1,48 @@
+From 01ff771caac1958662ca8665eed2021ec386a7af Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
+Date: Wed, 12 Aug 2026 19:45:21 +0200
+Subject: [PATCH] * src/http.c (parse_content_range): Use strtoll instead of
+ strtol.
+
+CVE: CVE-2026-58470
+Upstream: https://gitlab.com/gnuwget/wget/-/commit/01ff771caac1958662ca8665eed2021ec386a7af
+Signed-off-by: Stefan Müller <stemu86@gmx.ch>
+
+---
+ src/http.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/http.c b/src/http.c
+index e5e75ee6..8170a43c 100644
+--- a/src/http.c
++++ b/src/http.c
+@@ -949,7 +949,7 @@ parse_content_range (const char *hdr, wgint *first_byte_ptr,
+     return false;
+ 
+   errno = 0;
+-  num = strtol(hdr, &end, 10);
++  num = strtoll(hdr, &end, 10);
+   if (errno == ERANGE)
+     return false;
+   hdr = end;
+@@ -959,7 +959,7 @@ parse_content_range (const char *hdr, wgint *first_byte_ptr,
+   *first_byte_ptr = num;
+ 
+   errno = 0;
+-  num = strtol(hdr, &end, 10);
++  num = strtoll(hdr, &end, 10);
+   if (errno == ERANGE)
+     return false;
+   hdr = end;
+@@ -976,7 +976,7 @@ parse_content_range (const char *hdr, wgint *first_byte_ptr,
+   else
+     {
+       errno = 0;
+-      num = strtol(hdr, NULL, 10);
++      num = strtoll(hdr, NULL, 10);
+       if (errno == ERANGE)
+         return false;
+     }
+-- 
+GitLab
+
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 51b71a23ca..4880a6cafd 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -17,6 +17,10 @@ WGET_CPE_ID_VENDOR = gnu
 # 0004-src-metalink.c-Include-ctype.h.patch
 WGET_IGNORE_CVES += CVE-2026-58469
 
+# 0005-src-http.c-parse_content_range-Fix-integer-overflow.patch
+# 0006-src-http.c-parse_content_range-Use-strtoll-instead-of-strtol.patch
+WGET_IGNORE_CVES += CVE-2026-58470
+
 ifeq ($(BR2_PACKAGE_LIBPSL),y)
 WGET_CONF_OPTS += --with-libpsl
 WGET_DEPENDENCIES += libpsl

--===============3721380877441378383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3721380877441378383==--
