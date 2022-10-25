Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BF5C38A2D
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 21:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5379E40268;
	Tue, 25 Oct 2022 21:00:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5379E40268
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1e4-_gIFpCJK; Tue, 25 Oct 2022 21:00:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E29A40264;
	Tue, 25 Oct 2022 21:00:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E29A40264
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EA7821BF33A
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 21:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4A3060AEB
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 21:00:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4A3060AEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qb2h-FFRg_dE for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 21:00:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0E5560B6C
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 21:00:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0E5560B6C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CEB28870A8; Tue, 25 Oct 2022 21:00:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 25 Oct 2022 23:00:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 17065693f23996097d46e350b40c46795b7ffeac
X-Git-Newrev: e3f25de3e81341de041879fb3dd458d8484c9d61
X-Patchwork-Hint: ignore
Message-Id: <20221025210022.CEB28870A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zbar: fix python 3.11 compatibility
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
Content-Type: multipart/mixed; boundary="===============5785700959168008799=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5785700959168008799==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e3f25de3e81341de041879fb3dd458d8484c9d61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch from upstream pull request to fix build with python 3.11.

Fixes:
python/enum.c: In function ‘enumitem_new’:
python/enum.c:55:25: error: lvalue required as left operand of assignment
   55 |     Py_SIZE(&self->val) = Py_SIZE(longval);
      |                         ^
python/enum.c: In function ‘zbarEnumItem_New’:
python/enum.c:146:25: error: lvalue required as left operand of assignment
  146 |     Py_SIZE(&self->val) = Py_SIZE(longval);
      |                         ^

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...001-python-enum-fix-build-for-Python-3.11.patch | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/package/zbar/0001-python-enum-fix-build-for-Python-3.11.patch b/package/zbar/0001-python-enum-fix-build-for-Python-3.11.patch
new file mode 100644
index 0000000000..f525b62184
--- /dev/null
+++ b/package/zbar/0001-python-enum-fix-build-for-Python-3.11.patch
@@ -0,0 +1,62 @@
+From fbaec4b4e6fe735efe6916fe5b92805a0d96bf8a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?=C4=90o=C3=A0n=20Tr=E1=BA=A7n=20C=C3=B4ng=20Danh?=
+ <congdanhqx@gmail.com>
+Date: Wed, 21 Sep 2022 10:32:11 +0700
+Subject: [PATCH] python: enum: fix build for Python 3.11
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Python 3.9 introduced Py_SET_SIZE function to set size instead of
+relying on Py_SIZE() as a macro [3.9].
+
+Python 3.10 started to encourage to use Py_SET_SIZE instead of
+assigning into return value of Py_SIZE [3.10].
+
+Python 3.11 flips the switch, turn Py_SIZE into a function [3.11],
+thus Py_SIZE(obj) will be a rvalue. We need to use Py_SET_SIZE
+to set size now.
+
+[3.9]: https://docs.python.org/3.9/c-api/structures.html#c.Py_SET_SIZE
+[3.10]: https://docs.python.org/3.10/c-api/structures.html#c.Py_SIZE
+[3.11]: https://docs.python.org/3.11/c-api/structures.html#c.Py_SIZE
+
+Signed-off-by: Đoàn Trần Công Danh <congdanhqx@gmail.com>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://github.com/mchehab/zbar/pull/231]
+---
+ python/enum.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/python/enum.c b/python/enum.c
+index dfe1b1e..946344f 100644
+--- a/python/enum.c
++++ b/python/enum.c
+@@ -52,7 +52,11 @@ enumitem_new (PyTypeObject *type,
+ 
+     /* we assume the "fast path" for a single-digit ints (see longobject.c) */
+     /* this also holds if we get a small_int preallocated long */
++#if PY_VERSION_HEX >= 0x03090000
++    Py_SET_SIZE(&self->val, Py_SIZE(longval));
++#else
+     Py_SIZE(&self->val) = Py_SIZE(longval);
++#endif
+     self->val.ob_digit[0] = longval->ob_digit[0];
+     Py_DECREF(longval);
+ #else
+@@ -143,7 +147,11 @@ zbarEnumItem_New (PyObject *byname,
+ 
+     /* we assume the "fast path" for a single-digit ints (see longobject.c) */
+     /* this also holds if we get a small_int preallocated long */
++#if PY_VERSION_HEX >= 0x03090000
++    Py_SET_SIZE(&self->val, Py_SIZE(longval));
++#else
+     Py_SIZE(&self->val) = Py_SIZE(longval);
++#endif
+     self->val.ob_digit[0] = longval->ob_digit[0];
+     Py_DECREF(longval);
+ 
+-- 
+2.34.1
+

--===============5785700959168008799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5785700959168008799==--
