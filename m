Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30863C6FD1D
	for <buildroot@archiver.kernel.org>; Fri, 17 Mar 2023 08:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB29A41857;
	Fri, 17 Mar 2023 08:39:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB29A41857
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nccwJjjYigka; Fri, 17 Mar 2023 08:39:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57967416DE;
	Fri, 17 Mar 2023 08:39:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57967416DE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B04101BF276
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 08:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 863B260F5D
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 08:38:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 863B260F5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G4VQnD5KITNq for <buildroot@lists.busybox.net>;
 Fri, 17 Mar 2023 08:38:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE6226135B
 for <buildroot@buildroot.org>; Fri, 17 Mar 2023 08:38:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE6226135B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 97B64874F6; Fri, 17 Mar 2023 08:38:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 17 Mar 2023 09:35:23 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 91059234f4f9b3fee7b39423f5705d1ac0c70762
X-Git-Newrev: 0399011fa8f9dfe96a82dd55abe71cc823116132
X-Patchwork-Hint: ignore
Message-Id: <20230317083810.97B64874F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/uqmi: update
 patch for fix compile error (gcc false error reporting)
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
Content-Type: multipart/mixed; boundary="===============8412918108840462291=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8412918108840462291==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=0399011fa8f9dfe96a82dd55abe71cc823116132
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Update the patch to to avoid gcc false error reporting (apply pragma ignored
only for gcc >= 12.x (as the warning '-Wdangling-pointer' was introduced
with gcc-12.x).

Fixes:

  - http://autobuild.buildroot.net/results/df380f921b74527b77290a658de0c57680083afa

  .../build/uqmi-0a19b5b77140465c29e2afa7d611fe93abc9672f/dev.c:213:32: error: unknown option after '#pragma GCC diagnostic' kind [-Werror=pragmas]
    213 | #pragma GCC diagnostic ignored "-Wdangling-pointer"
        |                                ^~~~~~~~~~~~~~~~~~~~

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6219046db6a434d549706e039f221c46464cee21)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...cc-12.x-false-error-reporting-storing-th.patch} | 23 ++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/package/uqmi/0001-uqmi-avoid-gcc-false-error-reporting-storing-the-add.patch b/package/uqmi/0001-uqmi-avoid-gcc-12.x-false-error-reporting-storing-th.patch
similarity index 71%
rename from package/uqmi/0001-uqmi-avoid-gcc-false-error-reporting-storing-the-add.patch
rename to package/uqmi/0001-uqmi-avoid-gcc-12.x-false-error-reporting-storing-th.patch
index c940925767..e2199228b9 100644
--- a/package/uqmi/0001-uqmi-avoid-gcc-false-error-reporting-storing-the-add.patch
+++ b/package/uqmi/0001-uqmi-avoid-gcc-12.x-false-error-reporting-storing-th.patch
@@ -1,10 +1,10 @@
-From 4c2eb926efb4de24af5a3b1e8c18195198827491 Mon Sep 17 00:00:00 2001
+From 63ab887be90c7fe37d537ea75e60eb95d6d87d3f Mon Sep 17 00:00:00 2001
 From: Peter Seiderer <ps.report@gmx.net>
 Date: Sun, 5 Mar 2023 22:08:13 +0100
-Subject: [PATCH] uqmi: avoid gcc false error reporting (storing the address of
- local variable 'complete' in '*req.complete')
+Subject: [PATCH] uqmi: avoid gcc-12.x false error reporting (storing the
+ address of local variable 'complete' in '*req.complete')
 
-Avoid gcc false error reporting (req->complete is later reset to NULL
+Avoid gcc-12.x false error reporting (req->complete is later reset to NULL
 in case of use of local complete):
 
   dev.c:217:23: error: storing the address of local variable 'complete' in '*req.complete' [-Werror=dangling-pointer=]
@@ -12,27 +12,30 @@ in case of use of local complete):
         |         ~~~~~~~~~~~~~~^~~~~~~~~~~
 
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
-
-[Upstream: http://lists.openwrt.org/pipermail/openwrt-devel/2023-March/040633.html]
+[Upstream: http://lists.openwrt.org/pipermail/openwrt-devel/2023-March/040667.html]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+Changes v1 -> v2:
+  - apply pragma ignored only for gcc >= 12.x (as the warning
+    '-Wdangling-pointer' was introduced with gcc-12.x)
 ---
  dev.c | 12 ++++++++++++
  1 file changed, 12 insertions(+)
 
 diff --git a/dev.c b/dev.c
-index bd10207..b8ac273 100644
+index bd10207..dbd42d4 100644
 --- a/dev.c
 +++ b/dev.c
 @@ -203,6 +203,15 @@ void qmi_request_cancel(struct qmi_dev *qmi, struct qmi_request *req)
  	__qmi_request_complete(qmi, req, NULL);
  }
  
-+/* avoid gcc false error reporting:
++/* avoid gcc-12.x false error reporting:
 + *   dev.c:217:23: error: storing the address of local variable ‘complete’ in ‘*req.complete’ [-Werror=dangling-pointer=]
 + *     217 |         req->complete = &complete;
 + *         |         ~~~~~~~~~~~~~~^~~~~~~~~~~
 + */
-+#if __GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 6)
++#if __GNUC__ >= 12
 +#pragma GCC diagnostic push
 +#pragma GCC diagnostic ignored "-Wdangling-pointer"
 +#endif
@@ -43,7 +46,7 @@ index bd10207..b8ac273 100644
  
  	return req->ret;
  }
-+#if __GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 6)
++#if __GNUC__ >= 12
 +#pragma GCC diagnostic pop
 +#endif
  

--===============8412918108840462291==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8412918108840462291==--
