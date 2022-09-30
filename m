Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B339BC433FE
	for <buildroot@archiver.kernel.org>; Fri, 30 Sep 2022 15:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62657812F5;
	Fri, 30 Sep 2022 15:43:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62657812F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cv82MLVv91eS; Fri, 30 Sep 2022 15:43:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B39D812B6;
	Fri, 30 Sep 2022 15:43:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B39D812B6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3CD5F1BF3DE
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 15:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25BB040C31
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 15:43:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25BB040C31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fHh4ETzekC3B for <buildroot@lists.busybox.net>;
 Fri, 30 Sep 2022 15:43:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 575AD40B9D
 for <buildroot@buildroot.org>; Fri, 30 Sep 2022 15:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 575AD40B9D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 46025866CD; Fri, 30 Sep 2022 15:43:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 30 Sep 2022 17:40:41 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: cbb08530143e9e36645fa8f215c8b63acb0c1e90
X-Git-Newrev: 40a94c9dc21e260744a0bfc92a39270c276dbb18
X-Patchwork-Hint: ignore
Message-Id: <20220930154305.46025866CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/tinyproxy: fix
 CVE-2022-40468
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

commit: https://git.buildroot.net/buildroot/commit/?id=40a94c9dc21e260744a0bfc92a39270c276dbb18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Tinyproxy commit 84f203f and earlier does not process HTTP request lines
in the process_request() function and is using uninitialized buffers.
This vulnerability allows attackers to access sensitive information at
system runtime.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit eedd93f010ef7d385290805a6d040e7cfdf88d6b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...wing-up-in-error-page-in-invalid-requests.patch | 32 ++++++++++++++++++++++
 package/tinyproxy/tinyproxy.mk                     |  3 ++
 2 files changed, 35 insertions(+)

diff --git a/package/tinyproxy/0001-prevent-junk-from-showing-up-in-error-page-in-invalid-requests.patch b/package/tinyproxy/0001-prevent-junk-from-showing-up-in-error-page-in-invalid-requests.patch
new file mode 100644
index 0000000000..da9c21a41a
--- /dev/null
+++ b/package/tinyproxy/0001-prevent-junk-from-showing-up-in-error-page-in-invalid-requests.patch
@@ -0,0 +1,32 @@
+From 3764b8551463b900b5b4e3ec0cd9bb9182191cb7 Mon Sep 17 00:00:00 2001
+From: rofl0r <rofl0r@users.noreply.github.com>
+Date: Thu, 8 Sep 2022 15:18:04 +0000
+Subject: [PATCH] prevent junk from showing up in error page in invalid
+ requests
+
+fixes #457
+
+[Retrieved from:
+https://github.com/tinyproxy/tinyproxy/commit/3764b8551463b900b5b4e3ec0cd9bb9182191cb7]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/reqs.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/reqs.c b/src/reqs.c
+index bce69819..45db118d 100644
+--- a/src/reqs.c
++++ b/src/reqs.c
+@@ -343,8 +343,12 @@ static struct request_s *process_request (struct conn_s *connptr,
+                 goto fail;
+         }
+ 
++        /* zero-terminate the strings so they don't contain junk in error page */
++        request->method[0] = url[0] = request->protocol[0] = 0;
++
+         ret = sscanf (connptr->request_line, "%[^ ] %[^ ] %[^ ]",
+                       request->method, url, request->protocol);
++
+         if (ret == 2 && !strcasecmp (request->method, "GET")) {
+                 request->protocol[0] = 0;
+ 
diff --git a/package/tinyproxy/tinyproxy.mk b/package/tinyproxy/tinyproxy.mk
index 6b5a3f9625..e91a886888 100644
--- a/package/tinyproxy/tinyproxy.mk
+++ b/package/tinyproxy/tinyproxy.mk
@@ -11,4 +11,7 @@ TINYPROXY_LICENSE = GPL-2.0+
 TINYPROXY_LICENSE_FILES = COPYING
 TINYPROXY_CPE_ID_VENDOR = tinyproxy_project
 
+# 0001-prevent-junk-from-showing-up-in-error-page-in-invalid-requests.patch
+TINYPROXY_IGNORE_CVES += CVE-2022-40468
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
