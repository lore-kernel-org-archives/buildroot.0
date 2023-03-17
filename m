Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B82C74A5B
	for <buildroot@archiver.kernel.org>; Fri, 17 Mar 2023 08:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7F0A41528;
	Fri, 17 Mar 2023 08:37:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7F0A41528
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wHcP7YLlJroJ; Fri, 17 Mar 2023 08:37:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E392415D3;
	Fri, 17 Mar 2023 08:37:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E392415D3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 33FAD1BF276
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 08:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1956D82139
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 08:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1956D82139
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cnc980k7-6-t for <buildroot@lists.busybox.net>;
 Fri, 17 Mar 2023 08:36:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 307F78213A
 for <buildroot@buildroot.org>; Fri, 17 Mar 2023 08:36:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 307F78213A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C8BD874D1; Fri, 17 Mar 2023 08:36:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 17 Mar 2023 09:34:52 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 7be1347a59583ab2c24ad7dc8e0a5e10070a898e
X-Git-Newrev: 377d8d632838a19140d1cc370b09a7d119b337e7
X-Patchwork-Hint: ignore
Message-Id: <20230317083633.1C8BD874D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/uqmi: fix compile
 error (gcc false error reporting)
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
Content-Type: multipart/mixed; boundary="===============0552612315413270499=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0552612315413270499==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=377d8d632838a19140d1cc370b09a7d119b337e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Add upstream suggested patch ([1]) to avoid gcc false error reporting.

Fixes:

  - http://autobuild.buildroot.net/results/ce9e2074bb8486d1ee25232b985d47475faefd63

  dev.c:217:23: error: storing the address of local variable 'complete' in '*req.complete' [-Werror=dangling-pointer=]
    217 |         req->complete = &complete;
        |         ~~~~~~~~~~~~~~^~~~~~~~~~~

[1] http://lists.openwrt.org/pipermail/openwrt-devel/2023-March/040633.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b3cf07d8db2ae0283bbac7e4a06f363c7bc39e58)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...gcc-false-error-reporting-storing-the-add.patch | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/package/uqmi/0001-uqmi-avoid-gcc-false-error-reporting-storing-the-add.patch b/package/uqmi/0001-uqmi-avoid-gcc-false-error-reporting-storing-the-add.patch
new file mode 100644
index 0000000000..c940925767
--- /dev/null
+++ b/package/uqmi/0001-uqmi-avoid-gcc-false-error-reporting-storing-the-add.patch
@@ -0,0 +1,54 @@
+From 4c2eb926efb4de24af5a3b1e8c18195198827491 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sun, 5 Mar 2023 22:08:13 +0100
+Subject: [PATCH] uqmi: avoid gcc false error reporting (storing the address of
+ local variable 'complete' in '*req.complete')
+
+Avoid gcc false error reporting (req->complete is later reset to NULL
+in case of use of local complete):
+
+  dev.c:217:23: error: storing the address of local variable 'complete' in '*req.complete' [-Werror=dangling-pointer=]
+    217 |         req->complete = &complete;
+        |         ~~~~~~~~~~~~~~^~~~~~~~~~~
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+
+[Upstream: http://lists.openwrt.org/pipermail/openwrt-devel/2023-March/040633.html]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ dev.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/dev.c b/dev.c
+index bd10207..b8ac273 100644
+--- a/dev.c
++++ b/dev.c
+@@ -203,6 +203,15 @@ void qmi_request_cancel(struct qmi_dev *qmi, struct qmi_request *req)
+ 	__qmi_request_complete(qmi, req, NULL);
+ }
+ 
++/* avoid gcc false error reporting:
++ *   dev.c:217:23: error: storing the address of local variable ‘complete’ in ‘*req.complete’ [-Werror=dangling-pointer=]
++ *     217 |         req->complete = &complete;
++ *         |         ~~~~~~~~~~~~~~^~~~~~~~~~~
++ */
++#if __GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 6)
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wdangling-pointer"
++#endif
+ int qmi_request_wait(struct qmi_dev *qmi, struct qmi_request *req)
+ {
+ 	bool complete = false;
+@@ -231,6 +240,9 @@ int qmi_request_wait(struct qmi_dev *qmi, struct qmi_request *req)
+ 
+ 	return req->ret;
+ }
++#if __GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 6)
++#pragma GCC diagnostic pop
++#endif
+ 
+ struct qmi_connect_request {
+ 	struct qmi_request req;
+-- 
+2.39.2
+

--===============0552612315413270499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0552612315413270499==--
