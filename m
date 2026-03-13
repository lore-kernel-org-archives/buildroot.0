Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DDD2107BCF8
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 07:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEE4F40FFA;
	Sat, 14 Mar 2026 07:58:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vEdg7hNqCReK; Sat, 14 Mar 2026 07:58:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D37B40FFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773475124;
	bh=5jzhYnDs1yU1w/CYd2hPGFHVsjjeayU1RRZi/HWbj00=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jPO5cROYOxLZKFAXmgoL/+gloWJYspLpBQN6Z1JAwdibWL0WkDBgljb/ON+UzfwNX
	 Wpky9nmbqbBp8chVoI9Oj/m4epNmXQfYEjE1oq/suehAvMiD58i0Y9wYuKaqUoiqQH
	 HboekQaB5TnaeI3yXEhfitzgJsJBoq3ZYSAn2TY9qQN2nyC+rffDJ4TqbEBRwdAvUP
	 /RiW9CF+dily0tIEjdU32/e54vAX/FRjhX+AmRf/4tzC0uLePRSwd0gkepxHpJdxEM
	 11T7mT04ZuADCIy0lCFq6a2EEUoa8XOABQm29NZdtCRVBN9AhJGKIGInTLzDx4x/T9
	 8lE3WqgiL7Tiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D37B40FFB;
	Sat, 14 Mar 2026 07:58:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C247786
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CAF8406CF
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:58:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q5Y3TkjAgLF8 for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 07:58:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF718400A2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF718400A2
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:58:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D444B86102; Sat, 14 Mar 2026 07:58:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 16:03:37 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ecc9c6e5665b55f73c0c74d55f52dcca0d437789
X-Git-Newrev: 0e98503e3040b957fafcb9693c0edeb8c2a356ce
X-Patchwork-Hint: ignore
Message-Id: <20260314075838.D444B86102@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libtpms: fix
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0e98503e3040b957fafcb9693c0edeb8c2a356ce
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
