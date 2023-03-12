Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0C5C6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 14:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF5D5404DF;
	Sun, 12 Mar 2023 14:50:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF5D5404DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id omVJkZZAHKAm; Sun, 12 Mar 2023 14:49:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C856040484;
	Sun, 12 Mar 2023 14:49:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C856040484
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1DB5D1BF33B
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 14:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB2C481765
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 14:49:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB2C481765
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bAS-BCXEtzG9 for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 14:49:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE3F181678
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 14:49:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE3F181678
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD0A186F23; Sun, 12 Mar 2023 14:49:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 15:49:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b9a062b354953f3fbfee702bb5b5007598299925
X-Git-Newrev: 6219046db6a434d549706e039f221c46464cee21
X-Patchwork-Hint: ignore
Message-Id: <20230312144943.DD0A186F23@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uqmi: update patch for fix compile
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
Content-Type: multipart/mixed; boundary="===============3541934009468152578=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3541934009468152578==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6219046db6a434d549706e039f221c46464cee21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
  

--===============3541934009468152578==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3541934009468152578==--
