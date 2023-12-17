Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E24C3DA6E
	for <buildroot@archiver.kernel.org>; Sun, 17 Dec 2023 22:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65919817A8;
	Sun, 17 Dec 2023 22:01:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65919817A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id svGIKEcTQ2mr; Sun, 17 Dec 2023 22:01:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 805AE819ED;
	Sun, 17 Dec 2023 22:01:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 805AE819ED
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 27ECF1BF86B
 for <buildroot@lists.busybox.net>; Sun, 17 Dec 2023 22:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3E2B608A6
 for <buildroot@lists.busybox.net>; Sun, 17 Dec 2023 22:01:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3E2B608A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tpJvNz_Mogae for <buildroot@lists.busybox.net>;
 Sun, 17 Dec 2023 22:01:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D27460A5C
 for <buildroot@buildroot.org>; Sun, 17 Dec 2023 22:01:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D27460A5C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD4A787B47; Sun, 17 Dec 2023 22:01:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 17 Dec 2023 22:59:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: afa5c2da338a555ba0c11e5e352c987449288c0a
X-Git-Newrev: 3ef6884e6d59744d83649170822a4829eed146fc
X-Patchwork-Hint: ignore
Message-Id: <20231217220104.CD4A787B47@busybox.osuosl.org>
Subject: [Buildroot] [git commit] python-sip: fix compile error
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8944283231185479458=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8944283231185479458==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3ef6884e6d59744d83649170822a4829eed146fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the update of Python to version 3.11 in commit
738500c296c8b1206f20e94ca3e7c5932a6a0486 ("package/python3: bump to
version 3.11.0"), python-sip fails to compile with:

siplib.c: In function ‘sip_api_get_frame’:
siplib.c:13750:22: error: invalid use of undefined type ‘struct _frame’
13750 |         frame = frame->f_back;

This is due to a change in the Python C API, which is fixed by a new
patch. The patch can't be upstreamed, as SIP 4.x is no longer
maintained upstream.

Fixes:

  http://autobuild.buildroot.net/results/7b01739e7514e48c06182bc1804b32497ce2e414/

Signed-off-by: Ralf Dragon <hypnotoad@lindra.de>
[Thomas: improved commit log, reformatted patch using Git]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-siplib-fix-build-with-python-3.11.patch   | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/package/python-sip/0002-siplib-fix-build-with-python-3.11.patch b/package/python-sip/0002-siplib-fix-build-with-python-3.11.patch
new file mode 100644
index 0000000000..17c3e05314
--- /dev/null
+++ b/package/python-sip/0002-siplib-fix-build-with-python-3.11.patch
@@ -0,0 +1,66 @@
+From e8bbb7844c141b339ef0598decf2a808faa50f5e Mon Sep 17 00:00:00 2001
+From: Ralf Dragon <hypnotoad@lindra.de>
+Date: Sun, 17 Dec 2023 22:55:17 +0100
+Subject: [PATCH] siplib: fix build with python >= 3.11
+
+With python 3.11, the PyFrameObject structure members have been
+removed from the public C API:
+
+https://docs.python.org/3.11/whatsnew/3.11.html#whatsnew311-c-api-porting
+https://docs.python.org/3.11/whatsnew/3.11.html#pyframeobject-3-11-hiding
+
+This patch migrates to the opaque PyFrameObject.
+
+Upstream: Not Applicable, SIP 4.x is no longer maintained
+Signed-off-by: Ralf Dragon <hypnotoad@lindra.de>
+---
+ siplib/sip.h    | 2 +-
+ siplib/siplib.c | 8 ++++----
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/siplib/sip.h b/siplib/sip.h
+index 251b122..b9d8ea2 100644
+--- a/siplib/sip.h
++++ b/siplib/sip.h
+@@ -1799,7 +1799,7 @@ typedef struct _sipAPIDef {
+     int (*api_get_time)(PyObject *, sipTimeDef *);
+     PyObject *(*api_from_time)(const sipTimeDef *);
+     int (*api_is_user_type)(const sipWrapperType *);
+-    struct _frame *(*api_get_frame)(int);
++    PyFrameObject *(*api_get_frame)(int);
+     int (*api_check_plugin_for_type)(const sipTypeDef *, const char *);
+     PyObject *(*api_unicode_new)(SIP_SSIZE_T, unsigned, int *, void **);
+     void (*api_unicode_write)(int, void *, int, unsigned);
+diff --git a/siplib/siplib.c b/siplib/siplib.c
+index db52b68..a297855 100644
+--- a/siplib/siplib.c
++++ b/siplib/siplib.c
+@@ -448,7 +448,7 @@ static PyObject *sip_api_from_datetime(const sipDateDef *date,
+ static int sip_api_get_time(PyObject *obj, sipTimeDef *time);
+ static PyObject *sip_api_from_time(const sipTimeDef *time);
+ static int sip_api_is_user_type(const sipWrapperType *wt);
+-static struct _frame *sip_api_get_frame(int);
++static PyFrameObject *sip_api_get_frame(int);
+ static int sip_api_check_plugin_for_type(const sipTypeDef *td,
+         const char *name);
+ static PyObject *sip_api_unicode_new(SIP_SSIZE_T len, unsigned maxchar,
+@@ -13741,13 +13741,13 @@ static int sip_api_is_user_type(const sipWrapperType *wt)
+ /*
+  * Return a frame from the execution stack.
+  */
+-static struct _frame *sip_api_get_frame(int depth)
++static PyFrameObject *sip_api_get_frame(int depth)
+ {
+-    struct _frame *frame = PyEval_GetFrame();
++    PyFrameObject *frame = PyEval_GetFrame();
+ 
+     while (frame != NULL && depth > 0)
+     {
+-        frame = frame->f_back;
++        frame = PyFrame_GetBack(frame);
+         --depth;
+     }
+ 
+-- 
+2.43.0
+

--===============8944283231185479458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8944283231185479458==--
