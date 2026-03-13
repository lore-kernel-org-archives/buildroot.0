Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093E6107BCFF
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 08:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0BC341065;
	Sat, 14 Mar 2026 08:00:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3nqqOb5I7h3N; Sat, 14 Mar 2026 08:00:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 338554105B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773475240;
	bh=O7sThOfE9DOQYmnzI62jRCirbFLO6Punm7R8fP46pn0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=izk2bash2sB9TmabTceK7HFy8L69QwC2hgAcXKOYXL4xwYHRJ5TtvH0gZxGZ0qNhO
	 oq39BINPoJWKoO0huehPPHsjcV1gI5dg1qxFKIzGHYW4PAGQ2Wf+IVZ4hrfFERM1En
	 kTXKv0i0ney87F5IQYlLYI7sv9TR6RhJxzms71+BCo7K/5pVxH6CyYthRGbL0s9i7p
	 l1rm8WY4c+uaRThnbMNCEQZwgz17Y5dSynOJYErwQ2VJ5E0DlyMElGRmV13dMEnB0e
	 V9l4sO+zJMisBMZsLboj0I08J2pSyJUeQadbWwba8C8DKQyxgKTMIxx/T0Kx7dDz9t
	 KMVMG1cIoucGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 338554105B;
	Sat, 14 Mar 2026 08:00:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1117D201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 08:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB07F61027
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 08:00:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FUX5tk1eh01g for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 08:00:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B1A361019
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B1A361019
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 08:00:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D0A158651C; Sat, 14 Mar 2026 08:00:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 16:03:40 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 95cd6f8bc3d0fca48a95e96ea287d3c684e4f624
X-Git-Newrev: 8cf6fe6b6df424d9f8d1f265faf5f2b3542ad1d3
X-Patchwork-Hint: ignore
Message-Id: <20260314080009.D0A158651C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/libtpms: fix
 build with host gcc >= 15.x, glibc >= 2.43
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8cf6fe6b6df424d9f8d1f265faf5f2b3542ad1d3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Fixes:
https://autobuild.buildroot.net/results/7a6/7a6ea7c513e8f1dcc32d868108bfb2a907d6fe85/

The previous change to src/tpm_library.c dates back to 2024:
https://github.com/stefanberger/libtpms/commits/master/src/tpm_library.c
so a backport to buildroot LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: reword title to mention glibc 2.43]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f773fd6787491af3c98ae30f5683b8d7a431b0e5)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...-compilation-error-in-TPMLIB_GetPlaintext.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/libtpms/0001-Fix-a-compilation-error-in-TPMLIB_GetPlaintext.patch b/package/libtpms/0001-Fix-a-compilation-error-in-TPMLIB_GetPlaintext.patch
new file mode 100644
index 0000000000..02c4df9668
--- /dev/null
+++ b/package/libtpms/0001-Fix-a-compilation-error-in-TPMLIB_GetPlaintext.patch
@@ -0,0 +1,40 @@
+From fc8820cfaa8b5e17328f731df93911f6ab92443b Mon Sep 17 00:00:00 2001
+From: Stefan Berger <stefanb@linux.ibm.com>
+Date: Fri, 2 Jan 2026 11:37:31 -0500
+Subject: [PATCH] Fix a compilation error in TPMLIB_GetPlaintext
+
+Fix a compilation error that newer gcc versions may complain about:
+
+tpm_library.c: In function 'TPMLIB_GetPlaintext':
+tpm_library.c:441:11: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
+  441 |     start = strstr(stream, starttag);
+      |           ^
+At top level:
+cc1: note: unrecognized command-line option '-Wno-self-assign' may have been intended to silence earlier diagnostics
+cc1: all warnings being treated as errors
+
+Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
+
+Upstream: https://github.com/stefanberger/libtpms/commit/fc8820cfaa8b5e17328f731df93911f6ab92443b
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/tpm_library.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/tpm_library.c b/src/tpm_library.c
+index f48f4fd3..7b2ea687 100644
+--- a/src/tpm_library.c
++++ b/src/tpm_library.c
+@@ -435,7 +435,7 @@ static unsigned char *TPMLIB_GetPlaintext(const char *stream,
+                                           const char *endtag,
+                                           size_t *length)
+ {
+-    char *start, *end;
++    const char *start, *end;
+     unsigned char *plaintext = NULL;
+ 
+     start = strstr(stream, starttag);
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
