Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F036C47079
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 13:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B98D1435DF;
	Fri,  5 Jan 2024 13:05:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B98D1435DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BLguvhc1s2WL; Fri,  5 Jan 2024 13:05:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FDE643799;
	Fri,  5 Jan 2024 13:05:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FDE643799
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 619541BF422
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9FA5883EAA
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:02:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FA5883EAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hRE4DIHK52et for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 13:02:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B071283EA3
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 13:02:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B071283EA3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A0BB58455C; Fri,  5 Jan 2024 13:02:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Jan 2024 13:40:23 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: c44d5768dc7db04417dd6c99953362965a011f83
X-Git-Newrev: 117c17bb122e70508af066dc77455fa28ccba7c4
X-Patchwork-Hint: ignore
Message-Id: <20240105130240.A0BB58455C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] python-sip: fix compile
 error
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
Content-Type: multipart/mixed; boundary="===============2168291446639796462=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2168291446639796462==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=117c17bb122e70508af066dc77455fa28ccba7c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
(cherry picked from commit 3ef6884e6d59744d83649170822a4829eed146fc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

--===============2168291446639796462==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2168291446639796462==--
