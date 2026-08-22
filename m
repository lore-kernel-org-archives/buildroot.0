Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2503BC5DF9B
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 16:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5546360726;
	Sat, 22 Aug 2026 16:36:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QH2GQIM_Rj9r; Sat, 22 Aug 2026 16:36:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787416562;
	bh=PjG25kQLDF6ULJs8vcboyh5fR5mv8xgzBfq0wDzmw4c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cGgtI8AM9PdPwU0XLXif4ySk44kURZf3zH0aT8SnLWcOMQdCE4+xu+Im4eOGaPQg5
	 NlPe7d8HnFDVhS9YGnURk+HH+Lf+5cU6Taw71qh4KFkvfZAacdV8wQIo+McEUV1got
	 FXuqSBHNW9U726v3ZUA6rNWEBeQT6JrucHsCdQU6WZCGTBTHjQUVDJKs6t9l9MEqJH
	 jPtaCnobg/JRZDQEdM3z12SkZUTayj3edn1shRQ8qlZ8DC/IpxeL97jwTBRz8qED04
	 RHA6zEA7HfQwjHF303FtHAbd29sFKgYi8TdncM/k4K1zRiXGZ744YI6fHpDedUb1qg
	 1cx3KsFHDscrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 813E760708;
	Sat, 22 Aug 2026 16:36:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D20329B
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 16:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EC9D60644
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 16:35:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W9wpjLIIUphE for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 16:35:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9705D6063F
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 16:35:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 856598E5F2; Sat, 22 Aug 2026 16:35:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Aug 2026 17:56:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 937e33237ef739350bcba6fe0e18382ef7305afd
X-Git-Newrev: 89485adb296732e9e40e0ca7089381b3ca5486ce
X-Patchwork-Hint: ignore
Message-Id: <20260822163503.856598E5F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wget: fix CVE-2026-58470
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
Content-Type: multipart/mixed; boundary="===============1976700643141176009=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1976700643141176009==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/89485adb296732e9e40e0ca7089381b3ca5486ce
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Backport the upstream fix for integer overflows while parsing
Content-Range headers, together with the follow-up fix using
strtoll() for wgint values.

Backport to: 2025.02.x

Signed-off-by: Stefan Müller <stemu86@gmx.ch>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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

--===============1976700643141176009==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1976700643141176009==--
