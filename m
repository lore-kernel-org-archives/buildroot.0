Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1187C61DD9
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7D9D80F4D;
	Fri, 28 Aug 2026 14:24:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k4up6Wvv1jRD; Fri, 28 Aug 2026 14:24:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927052;
	bh=As7iEAAZOJ80kv7bJk+MZdJHsnwyEQHRLj/Xu9+2fk4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LBqt4DgK5leWNh9Hq4HSzO9vEG0n9WlTc1NSxT2kYMRXdHVICJS76CdjYBYdjhTz7
	 smFARlc4srO2pGciHcIpWEy9rOyTo6qUl73ejekVCmJCI6incxEbNoPtjWm9k0fcEM
	 2KEjnx369Zl6YlpRDLGZml74egYS6yvxKEVDGHYINttS2hsBQourbEy2vKRVOh3EIy
	 oro2ZL0xe0kefGB3M6rcAbgzTnsE4XDggxkpd8kELorIt5c4n2/nHY8X+P7ViLoNJE
	 aWHFhxLbIdFjaZWes3afqvXcJFsP3v987xZbgaBz6OJKx4hEKs9OUhm6MVyhPzhZhX
	 3+CA3OwiPVEcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C2CB8108C;
	Fri, 28 Aug 2026 14:24:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 97A5B127
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E670407B3
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aEqqyzMUddru for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:23:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49A1D407FF
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 482F5921FA; Fri, 28 Aug 2026 14:22:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:57:20 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 3de60d0aa3f4a574505da0d772e25d47fe8ff6d0
X-Git-Newrev: cf345ac7253d088f13aeaa2377cf31af8d3d1b95
X-Patchwork-Hint: ignore
Message-Id: <20260828142241.482F5921FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/wget: fix
 CVE-2026-58469
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
Content-Type: multipart/mixed; boundary="===============5061104174235828563=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5061104174235828563==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cf345ac7253d088f13aeaa2377cf31af8d3d1b95
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Backport the upstream fix for a buffer underflow in
clean_metalink_string(), together with the two required follow-up
fixes for the inverted whitespace check and missing ctype.h include.

Backport to: 2025.02.x

Signed-off-by: Stefan Müller <stemu86@gmx.ch>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 937e33237ef739350bcba6fe0e18382ef7305afd)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...lean_metalink_string-Fix-buffer-underflow.patch | 54 ++++++++++++++++++++++
 ..._string-Fix-inverted-trailing-space-check.patch | 40 ++++++++++++++++
 .../wget/0004-src-metalink.c-Include-ctype.h.patch | 28 +++++++++++
 package/wget/wget.mk                               |  5 ++
 4 files changed, 127 insertions(+)

diff --git a/package/wget/0002-src-metalink.c-clean_metalink_string-Fix-buffer-underflow.patch b/package/wget/0002-src-metalink.c-clean_metalink_string-Fix-buffer-underflow.patch
new file mode 100644
index 0000000000..652f99786d
--- /dev/null
+++ b/package/wget/0002-src-metalink.c-clean_metalink_string-Fix-buffer-underflow.patch
@@ -0,0 +1,54 @@
+From 37a40fcb450153f69537c7cbc2a7a4fb0b6f7826 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
+Date: Mon, 29 Jun 2026 18:32:02 +0200
+Subject: [PATCH] * src/metalink.c (clean_metalink_string): Fix buffer
+ underflow
+
+Reported-by: TristanInSec@gmail.com
+CVE: CVE-2026-58469
+Upstream: https://gitlab.com/gnuwget/wget/-/commit/37a40fcb450153f69537c7cbc2a7a4fb0b6f7826
+Signed-off-by: Stefan Müller <stemu86@gmx.ch>
+
+---
+ src/metalink.c | 9 +++------
+ 1 file changed, 3 insertions(+), 6 deletions(-)
+
+diff --git a/src/metalink.c b/src/metalink.c
+index 9e355fd0..3acdc3a2 100644
+--- a/src/metalink.c
++++ b/src/metalink.c
+@@ -1041,7 +1041,6 @@ void
+ clean_metalink_string (char **str)
+ {
+   int c;
+-  size_t len;
+   char *new, *beg, *end;
+ 
+   if (!str || !*str)
+@@ -1049,7 +1048,7 @@ clean_metalink_string (char **str)
+ 
+   beg = *str;
+ 
+-  while ((c = *beg) && (c == '\n' || c == '\r' || c == '\t' || c == ' '))
++  while (isspace(*beg))
+     beg++;
+ 
+   end = beg;
+@@ -1062,12 +1061,10 @@ clean_metalink_string (char **str)
+   /* If we are at the end of the string, search the first legit
+      character going backward.  */
+   if (*end == '\0')
+-    while ((c = *(end - 1)) && (c == '\n' || c == '\r' || c == '\t' || c == ' '))
++    while (end > beg && !isspace(*(end - 1)))
+       end--;
+ 
+-  len = end - beg;
+-
+-  new = xmemdup0 (beg, len);
++  new = xmemdup0 (beg, end - beg);
+   xfree (*str);
+   *str = new;
+ }
+-- 
+GitLab
+
diff --git a/package/wget/0003-src-metalink.c-clean_metalink_string-Fix-inverted-trailing-space-check.patch b/package/wget/0003-src-metalink.c-clean_metalink_string-Fix-inverted-trailing-space-check.patch
new file mode 100644
index 0000000000..e6b6b7180a
--- /dev/null
+++ b/package/wget/0003-src-metalink.c-clean_metalink_string-Fix-inverted-trailing-space-check.patch
@@ -0,0 +1,40 @@
+From 7b1cdecc49bc77bde220fc575c8a00386c3f3bcf Mon Sep 17 00:00:00 2001
+From: ChenYanpan <chenyanpan@xfusion.com>
+Date: Wed, 8 Jul 2026 12:09:55 +0800
+Subject: [PATCH] * src/metalink.c (clean_metalink_string): Fix inverted
+ trailing-space check
+
+37a40fcb added an `end > beg' bound guard to prevent a buffer
+underflow, but accidentally flipped the condition from `isspace' to
+`!isspace'. The loop therefore walked back over non-space characters
+instead of trailing whitespace, collapsing any string without a
+trailing newline to "". Every Metalink/HTTP resource URL was wiped,
+so wget could not follow any mirror and
+testenv/Test-metalink-http.py failed ("Expected file test.meta not
+found"). Restore the `isspace' condition.
+
+Copyright-paperwork-exempt: Yes
+CVE: CVE-2026-58469
+Upstream: https://gitlab.com/gnuwget/wget/-/commit/7b1cdecc49bc77bde220fc575c8a00386c3f3bcf
+Signed-off-by: Stefan Müller <stemu86@gmx.ch>
+
+---
+ src/metalink.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/metalink.c b/src/metalink.c
+index 3acdc3a2..3794909f 100644
+--- a/src/metalink.c
++++ b/src/metalink.c
+@@ -1061,7 +1061,7 @@ clean_metalink_string (char **str)
+   /* If we are at the end of the string, search the first legit
+      character going backward.  */
+   if (*end == '\0')
+-    while (end > beg && !isspace(*(end - 1)))
++    while (end > beg && isspace(*(end - 1)))
+       end--;
+ 
+   new = xmemdup0 (beg, end - beg);
+-- 
+GitLab
+
diff --git a/package/wget/0004-src-metalink.c-Include-ctype.h.patch b/package/wget/0004-src-metalink.c-Include-ctype.h.patch
new file mode 100644
index 0000000000..0782bf2563
--- /dev/null
+++ b/package/wget/0004-src-metalink.c-Include-ctype.h.patch
@@ -0,0 +1,28 @@
+From 82d945ff5dc9942b78b2bf736aac298c24fe00a1 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
+Date: Thu, 9 Jul 2026 14:50:40 +0200
+Subject: [PATCH] * src/metalink.c: Include ctype.h
+
+CVE: CVE-2026-58469
+Upstream: https://gitlab.com/gnuwget/wget/-/commit/82d945ff5dc9942b78b2bf736aac298c24fe00a1
+Signed-off-by: Stefan Müller <stemu86@gmx.ch>
+
+---
+ src/metalink.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/metalink.c b/src/metalink.c
+index 3794909f..954546d2 100644
+--- a/src/metalink.c
++++ b/src/metalink.c
+@@ -46,6 +46,7 @@ as that of the covered work.  */
+ #include "c-strcase.h"
+ #include <errno.h>
+ #include <unistd.h> /* For unlink.  */
++#include <ctype.h>
+ #include <metalink/metalink_parser.h>
+ #ifdef HAVE_GPGME
+ #include <gpgme.h>
+-- 
+GitLab
+
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index e3143647d7..51b71a23ca 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -12,6 +12,11 @@ WGET_LICENSE = GPL-3.0+
 WGET_LICENSE_FILES = COPYING
 WGET_CPE_ID_VENDOR = gnu
 
+# 0002-src-metalink.c-clean_metalink_string-Fix-buffer-underflow.patch
+# 0003-src-metalink.c-clean_metalink_string-Fix-inverted-trailing-space-check.patch
+# 0004-src-metalink.c-Include-ctype.h.patch
+WGET_IGNORE_CVES += CVE-2026-58469
+
 ifeq ($(BR2_PACKAGE_LIBPSL),y)
 WGET_CONF_OPTS += --with-libpsl
 WGET_DEPENDENCIES += libpsl

--===============5061104174235828563==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5061104174235828563==--
