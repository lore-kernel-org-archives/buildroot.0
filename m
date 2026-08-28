Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A45C61DD3
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 719C68116C;
	Fri, 28 Aug 2026 14:26:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y70Qq-uqYwt1; Fri, 28 Aug 2026 14:26:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927170;
	bh=5g21BFrXc4gKfeOCo8RNXl+62GhCf4i6w6n4T2RFah4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oH5ChelT/55VQcjzyEZ/yNLImebNgW/z+zEcryrE/wo4CmaP1LLwO0u882h5cKWoU
	 MbHkUypciuKKGjy3QqCmE6Ppq5WWxv702iYlG6cFO+EA5f1HBEAnN+0/iou1+tbnXm
	 hf0X9L5plxSMG/e13xGGao1/TZFphu9Ng5QybFsVW1nrmzxMQSzoRS0xfDOzOeOcXt
	 qvBou2jwWMQQ0cJ7Dl7D1pdeq1wGsw0GgOHh8khvIBc7LdYbhPtdb/WfZV18HzhjpD
	 JNxPEzq22LtYmp6YVZqOn+eZrkl8/VAy+r153hDElAfX6jy0MadQfgX/dDGbq/JnHu
	 yEbu7kAh+063A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BE2E811B3;
	Fri, 28 Aug 2026 14:26:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 682CED28
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 579526078A
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 30eQJkVahAYu for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7826B6072E
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7693D921F9; Fri, 28 Aug 2026 14:24:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:58:04 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 5710385a72874f68b57c90c3b523b1a594044505
X-Git-Newrev: fd6d1b7f99dbc12a3a11c8a81be238b33596df44
X-Patchwork-Hint: ignore
Message-Id: <20260828142442.7693D921F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/wget: fix
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
Content-Type: multipart/mixed; boundary="===============2115533988700014915=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2115533988700014915==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fd6d1b7f99dbc12a3a11c8a81be238b33596df44
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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
index 8118811efe..015fc0c59e 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -17,6 +17,10 @@ WGET_CPE_ID_VENDOR = gnu
 # 0004-src-metalink.c-Include-ctype.h.patch
 WGET_IGNORE_CVES += CVE-2026-58469
 
+# 0005-src-http.c-parse_content_range-Fix-integer-overflow.patch
+# 0006-src-http.c-parse_content_range-Use-strtoll-instead-of-strtol.patch
+WGET_IGNORE_CVES += CVE-2026-58470
+
 WGET_CONF_OPTS += --disable-pcre
 
 ifeq ($(BR2_PACKAGE_LIBPSL),y)

--===============2115533988700014915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2115533988700014915==--
