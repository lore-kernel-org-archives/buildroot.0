Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA2FDC25B7A
	for <buildroot@archiver.kernel.org>; Fri, 24 May 2024 12:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B503B8339C;
	Fri, 24 May 2024 12:40:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3cf2n6Q_TlQK; Fri, 24 May 2024 12:40:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E62FD833FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E62FD833FB;
	Fri, 24 May 2024 12:40:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A00681CF939
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 12:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3D46400A6
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 12:39:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b6GywOLo1YbZ for <buildroot@lists.busybox.net>;
 Fri, 24 May 2024 12:39:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23E0B40407
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23E0B40407
 for <buildroot@buildroot.org>; Fri, 24 May 2024 12:39:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A8C0875B7; Fri, 24 May 2024 12:39:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 24 May 2024 14:38:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ead103f4640072b95923ea9bb15e115f14f4f0d
X-Git-Newrev: b7b83645b65e84a7947479706f2d82ba7cb6e053
X-Patchwork-Hint: ignore
Message-Id: <20240524123954.1A8C0875B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/atftp: fix build with pcre2 >=
 10.43
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

commit: https://git.buildroot.net/buildroot/commit/?id=b7b83645b65e84a7947479706f2d82ba7cb6e053
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of pcre2 to version
10.43 in commit fa9e575776ee3d3d47a31fee3c09a94753c77cc7 and
https://github.com/PCRE2Project/pcre2/commit/014c82d7bcc2873cdb1f3abc5e5348587f477ba4:

tftpd_pcre.c: In function 'tftpd_pcre_open':
tftpd_pcre.c:109:37: error: passing argument 1 of 'pcre2_substring_list_free_8' from incompatible pointer type [-Wincompatible-pointer-types]
  109 |           pcre2_substring_list_free((const PCRE2_UCHAR **)substrlist);
      |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                     |
      |                                     const PCRE2_UCHAR8 ** {aka const unsigned char **}
In file included from tftpd_pcre.h:24,
                 from tftpd_pcre.c:35:
/home/autobuild/autobuild/instance-10/output-1/host/powerpc64le-buildroot-linux-gnu/sysroot/usr/include/pcre2.h:949:1: note: expected 'PCRE2_UCHAR8 **' {aka 'unsigned char **'} but argument is of type 'const PCRE2_UCHAR8 **' {aka 'const unsigned char **'}
  949 | PCRE2_TYPES_STRUCTURES_AND_FUNCTIONS
      | ^

Fixes: fa9e575776ee3d3d47a31fee3c09a94753c77cc7
 - http://autobuild.buildroot.org/results/46565c834a8162a651944885104027610a65f9c3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...1-tftpd_pcre.c-fix-build-with-pcre2-10.43.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/atftp/0001-tftpd_pcre.c-fix-build-with-pcre2-10.43.patch b/package/atftp/0001-tftpd_pcre.c-fix-build-with-pcre2-10.43.patch
new file mode 100644
index 0000000000..b5d109730d
--- /dev/null
+++ b/package/atftp/0001-tftpd_pcre.c-fix-build-with-pcre2-10.43.patch
@@ -0,0 +1,45 @@
+From e75d656e1e3465dea1fdf605cb8fe7e25286bdd3 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 12 May 2024 18:29:09 +0200
+Subject: [PATCH] tftpd_pcre.c: fix build with pcre2 >= 10.43
+
+Fix the following build failure raised since pcre2 >= 10.43 and
+https://github.com/PCRE2Project/pcre2/commit/014c82d7bcc2873cdb1f3abc5e5348587f477ba4:
+
+tftpd_pcre.c: In function 'tftpd_pcre_open':
+tftpd_pcre.c:109:37: error: passing argument 1 of 'pcre2_substring_list_free_8' from incompatible pointer type [-Wincompatible-pointer-types]
+  109 |           pcre2_substring_list_free((const PCRE2_UCHAR **)substrlist);
+      |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+      |                                     |
+      |                                     const PCRE2_UCHAR8 ** {aka const unsigned char **}
+In file included from tftpd_pcre.h:24,
+                 from tftpd_pcre.c:35:
+/home/autobuild/autobuild/instance-10/output-1/host/powerpc64le-buildroot-linux-gnu/sysroot/usr/include/pcre2.h:949:1: note: expected 'PCRE2_UCHAR8 **' {aka 'unsigned char **'} but argument is of type 'const PCRE2_UCHAR8 **' {aka 'const unsigned char **'}
+  949 | PCRE2_TYPES_STRUCTURES_AND_FUNCTIONS
+      | ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/46565c834a8162a651944885104027610a65f9c3
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/madmartin/atftp/pull/1
+---
+ tftpd_pcre.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tftpd_pcre.c b/tftpd_pcre.c
+index 24b2770..7b3d0e3 100644
+--- a/tftpd_pcre.c
++++ b/tftpd_pcre.c
+@@ -106,7 +106,7 @@ tftpd_pcre_self_t *tftpd_pcre_open(char *filename)
+                logger(LOG_DEBUG,"file: %s line: %d substring: %d value: %s",
+                       filename, linecount, subnum, substrlist[subnum]);
+           }
+-          pcre2_substring_list_free((const PCRE2_UCHAR **)substrlist);
++          pcre2_substring_list_free(substrlist);
+ 
+           if (matches != 3)
+           {
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
