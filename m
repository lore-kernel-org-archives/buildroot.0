Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD93ECA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 10:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 760D26159C;
	Fri, 29 Aug 2025 10:22:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ShUpe5N2d0pk; Fri, 29 Aug 2025 10:22:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9012161594
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9012161594;
	Fri, 29 Aug 2025 10:22:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D84936C
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF351404DB
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:22:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sr8SGuXJsGDR for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 10:22:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A922403F0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A922403F0
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:22:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED89787D60; Fri, 29 Aug 2025 10:22:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 12:19:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f547af041974ab7f7c52e7640ab22f3a60aa6ab1
X-Git-Newrev: 667871b06d92b58bc86c668fdef1df8a9c60b5a9
X-Patchwork-Hint: ignore
Message-Id: <20250829102233.ED89787D60@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: TestLibCurl: replace
 thttpd by Busybox's httpd server
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=667871b06d92b58bc86c668fdef1df8a9c60b5a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to remove thttpd package from Buildroot, we have to replace it
from TestLibCurl.

Busybox's httpd server doesn't report server identification, update
TestLibCurl accordingly.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294712

Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 support/testing/tests/package/test_libcurl.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/support/testing/tests/package/test_libcurl.py b/support/testing/tests/package/test_libcurl.py
index b326f9308f..076a5388ca 100644
--- a/support/testing/tests/package/test_libcurl.py
+++ b/support/testing/tests/package/test_libcurl.py
@@ -8,7 +8,7 @@ class TestLibCurl(infra.basetest.BRTest):
         """
         BR2_PACKAGE_LIBCURL=y
         BR2_PACKAGE_LIBCURL_CURL=y
-        BR2_PACKAGE_THTTPD=y
+        BR2_PACKAGE_BUSYBOX_HTTPD=y
         BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
         """
@@ -45,11 +45,9 @@ class TestLibCurl(infra.basetest.BRTest):
         self.assertEqual(out[0], msg)
 
         # We download one last time, showing the server response. We
-        # check we can see the OK status and our thttpd server
-        # identification.
+        # check we can see the OK status.
         cmd = f"curl --no-progress-meter --dump-header - -o /dev/null {url}"
         out, ret = self.emulator.run(cmd)
         self.assertEqual(ret, 0)
         out_str = "\n".join(out)
         self.assertIn("HTTP/1.1 200 OK", out_str)
-        self.assertIn("Server: thttpd/", out_str)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
