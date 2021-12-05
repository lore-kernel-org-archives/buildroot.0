Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9FDC433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 16:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3565840437;
	Sun,  5 Dec 2021 16:00:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WIXpgObRqh8E; Sun,  5 Dec 2021 16:00:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8045240431;
	Sun,  5 Dec 2021 16:00:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 073A21BF275
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 15:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0456D8274E
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 15:59:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VNTyc69SLUC1 for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 15:59:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52E4F80C97
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 15:59:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5E65A801F0; Sun,  5 Dec 2021 15:54:59 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 5 Dec 2021 16:55:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d35a0936ee2b2cf3a800180bd9676907e1609146
X-Git-Newrev: 9616ade22234ad3c8316b7450749a5b371a5c566
X-Patchwork-Hint: ignore
Message-Id: <20211205155459.5E65A801F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mkpasswd: define _DEFAULT_SOURCE
 to suppress compiler warning
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9616ade22234ad3c8316b7450749a5b371a5c566
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We define _DEFAULT_SOURCE in mkpasswd.c to suppress a compiler warning.

In file included from /usr/include/x86_64-linux-gnu/bits/libc-header-start.h:33,
                 from /usr/include/stdio.h:27,
                 from [...]/buildroot/output/arm64/build/host-mkpasswd/mkpasswd.c:24:
/usr/include/features.h:187:3:
  187 | # warning "_BSD_SOURCE and _SVID_SOURCE are deprecated, use _DEFAULT_SOURCE"
      |   ^~~~~~~

As per GLIBC 2.20 release notes[1]:

    The _BSD_SOURCE and _SVID_SOURCE feature test macros are no longer
    supported; they now act the same as _DEFAULT_SOURCE (but generate a
    warning). Except for cases where _BSD_SOURCE enabled BSD interfaces
    that conflicted with POSIX (support for which was removed in 2.19),
    the interfaces those macros enabled remain available when compiling
    with _GNU_SOURCE defined, with _DEFAULT_SOURCE defined, or without
    any feature test macros defined.

[1] https://lwn.net/Articles/611162/

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mkpasswd/mkpasswd.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/mkpasswd/mkpasswd.c b/package/mkpasswd/mkpasswd.c
index fd16230468..ae8594061c 100644
--- a/package/mkpasswd/mkpasswd.c
+++ b/package/mkpasswd/mkpasswd.c
@@ -18,6 +18,11 @@
 
 /* for crypt, snprintf and strcasecmp */
 #define _XOPEN_SOURCE
+/*
+ * _BSD_SOURCE is deprecated as of GLIBC 2.20; _DEFAULT_SOURCE should be used
+ * instead. (https://lwn.net/Articles/611162/)
+ */
+#define _DEFAULT_SOURCE
 #define _BSD_SOURCE
 
 /* System library */
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
