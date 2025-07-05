Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9673DC8303D
	for <buildroot@archiver.kernel.org>; Sat,  5 Jul 2025 10:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E3D681D73;
	Sat,  5 Jul 2025 10:07:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mH81h0rX_IWD; Sat,  5 Jul 2025 10:07:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BF9A81D18
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BF9A81D18;
	Sat,  5 Jul 2025 10:07:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3080A15F
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 10:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22CBB40061
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 10:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Upg334_iUM2k for <buildroot@buildroot.org>;
 Sat,  5 Jul 2025 10:07:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B35740051
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B35740051
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 10:07:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 46BB585EF6; Sat,  5 Jul 2025 10:07:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Jul 2025 12:03:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: baa81362ef38ca3c7d1f012029c1b95b9abb5649
X-Git-Newrev: c41a06bbd92c23881f2d324db3cb4aaab09906dc
X-Patchwork-Hint: ignore
Message-Id: <20250705100718.46BB585EF6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/check-package: handle missing files
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

commit: https://git.buildroot.net/buildroot/commit/?id=c41a06bbd92c23881f2d324db3cb4aaab09906dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When running check-package before completing commits for a change, if
any files are setup for removal, check-package will throw
FileNotFoundError exceptions instead of generating a warning state. For
example:

 $ utils/docker-run make check-package
 Traceback (most recent call last):
   ...
 FileNotFoundError: [Errno 2] No such file or directory: 'package/.../0001-some-removed-patch.patch'
 make: *** [Makefile:1264: check-package] Error 1

This commit will now catch FileNotFoundError and populate a warning
message:

 $ utils/docker-run make check-package
 package/.../0001-some-removed-patch.patch: missing; unstaged file removal?
 package/.../0002-another-removed-patch.patch: missing; unstaged file removal?
 427843 lines processed
 3 warnings generated
 make: *** [Makefile:1264: check-package] Error 1

Signed-off-by: James Knight <git@jdknight.me>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 utils/check-package | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/utils/check-package b/utils/check-package
index a5ecc2eed8..8781d21d8f 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -257,18 +257,23 @@ def check_file_using_lib(fname):
         nwarnings += warn
 
     lastline = ""
-    with open(fname, "r", errors="surrogateescape") as f:
-        for lineno, text in enumerate(f):
-            nlines += 1
-            for name, cf in objects:
-                if cf.disable.search(lastline):
-                    continue
-                line_sts = cf.check_line(lineno + 1, text)
-                warn, fail = print_warnings(line_sts, name in xfail)
-                if fail > 0:
-                    failed.add(name)
-                nwarnings += warn
-            lastline = text
+    try:
+        with open(fname, "r", errors="surrogateescape") as f:
+            for lineno, text in enumerate(f):
+                nlines += 1
+                for name, cf in objects:
+                    if cf.disable.search(lastline):
+                        continue
+                    line_sts = cf.check_line(lineno + 1, text)
+                    warn, fail = print_warnings(line_sts, name in xfail)
+                    if fail > 0:
+                        failed.add(name)
+                    nwarnings += warn
+                lastline = text
+    except FileNotFoundError:
+        print(f"{fname}: missing; unstaged file removal?")
+        nwarnings += 1
+        return nwarnings, nlines
 
     for name, cf in objects:
         warn, fail = print_warnings(cf.after(), name in xfail)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
