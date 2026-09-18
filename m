Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088BCC982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 19:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6581812E8;
	Fri, 18 Sep 2026 19:54:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EhGKTJwPmAmK; Fri, 18 Sep 2026 19:54:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org BC425812FF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789761283;
	b=N/jFviw0yw+LnHBl8/+ni+GregCW1ZG/zd5b+i7JLK9O1UKnApOctYto4XkQMLxLCJJN
	 w1Q8BeZZv4UM4Khg2+zv6AhfqoYOZQtaHMx88+YlR50ngMQk9RiYxzZVwf7sppy0jXqj5
	 eq1AouurN8vuVIcgq0LNDjkx8C5tnE/WjUyxUaW8LKD1NtVPTsr2g3biuO4WXjYp3SybM
	 2WFB22yJqeiU0k80Y28V6o5Sqex8XiLHozhXOkBGbxZExKYCUTgr6nLNgFk/XSbCAaypG
	 wcaiZrwqSQX/RnSvfx9HbNn8YD1mDrUX2tHQndaSD4kJRD1mquc5y2JXBvgezaOu7Tg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789761283;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=iOSGo3EPe8dpDDSlu/8dUfKqsQ8wlZRY42xi49HCerc=;
	b=ibuxvRRc4PBWt7A2rsHEM5w4rnH7TJPK8P6FYqlNUEIRrUlTEJ/eQL5IFOrdemtqR8FS
	 VZ0U8m5Dp1C/s/PcCwHNVwNC21cSSVMTl3jknztO/7+9HaUE2Ejtl0DJtat81hqPohog7
	 4xTahMuofRALI4ebbKVduQDiLyo1LjUae61MNPSGEvRCtFraaooxYR7O5RFqrXYV9uN72
	 XsIuCSsE+iQTTTUBX4iZ+MmYtCRX6wgDudeqst6VkeJ0fMX6yv5CwWQbvRsQADuxaUUhl
	 BMi0KCYuxx/A/IrqlH3j2CL/Wu8A3Pv5PSl/hL2tRp11+hVi/MOjZj55v4VFH3W9KeA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789761283;
	bh=iOSGo3EPe8dpDDSlu/8dUfKqsQ8wlZRY42xi49HCerc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mk1/P3NVTftwnEIH6mAl/TuGFZJCUlw7Yl5yNQWqydest1VUOZi08N7cinalhvERP
	 +GgwgySbDHFVxm0X397LF/+FXLvtU50/P72nqBO42vQoCA43lVW9nxRXDRdE4B8xaI
	 l8v0lPNatLs0wVLDgQUXeIJV3vUp1pfl1tkOlzYZia/ywkt9k+pRDWwjwAdUURVz9j
	 h/42IZzkdqS3b5iiMxpaRwmoXPTJuoZxKGdQXwtrp/4yOa2WmNKDolnGEMgpJ4U7xB
	 0O88HvoVYDB/ao1fXXPDoV/ruGaW49KWIZ4fRpFE2OxGfwVMyGYJXqFV0+3IJgZ/p6
	 xSpA2mqOCuqkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC425812FF;
	Fri, 18 Sep 2026 19:54:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 351CC25B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B91D60EB8
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YJypNVBLvIIO for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 19:54:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 65A5F60DC5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789761281;
 b=tFSoPxSrnfkCSWHDSB4xxyQo5rzhPbltjC7qVTNtgKdCL2crrqGAHRsE+HxE9Huu8B+4
 y34hQmwZyw3T/2IUM6NNDJb9OSs6pokyhJwkSGtFiPi3U1Spy1ybjUonPKNkf6uFRXQZi
 WpRyQS+y4hbIYQdnYgidrnDNjWt/c2tjoC+1FJIHgrpRhp1hKnBAqG+N0S3RNwtG+4FuJ
 Ks6DB7VP+P0rDqRJMVr+ljCk9KWo9dNZrVX+zK5I/UNc5eTuW3P6BIxfWqGXKWYChczJD
 hWCZWCQ22q40IRGEKxqpEA+4C08NwPaT8svCYVyvb4yGzotAsFehe0nGcpNiNpfqTsg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789761281;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=mL3AiBBqMVyejHZsXH893YLZh7JEjJakYp1TIhfHjJ0=;
 b=ryLwm/FCQR3s/wDxwCI7rDOsJ6Zpmz1FL9ohuBkRxdoIaITn3As87wX1a1j00RgrjpK6
 pP9qERMK33zcqoPdrdDwz0yOIPWlQl/GP70LrhysEOl8NDsQFlgrlRJxpXw8PgL7nNfap
 FoDZ6Kq3wIsw4MDeF4VUvVB1yaImYQ2IQWhQqeMJKsW+3emNhl3s+eBNPqyooTpQmhy8D
 TtVvl5AGb1P2R2CxtPG9nby7d7S1CVjqhMM41S4b4Cuxf7NaKKz/8bcPjjX5aSUqbEIjk
 AzC18yMPXs2sZzE9uLiZbU8Phu2huIQXqRZND0ZtfHanE6bLzflTTHzo3K1IVcm5A2w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65A5F60DC5
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:54:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EAA94976A8; Fri, 18 Sep 2026 19:53:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 21:52:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 591e6b9981169bbefde7b5e486b0e83f16a26808
X-Git-Newrev: 9aeb5f6f5c50baf7e02248b58c98efc562554b6b
X-Patchwork-Hint: ignore
Message-Id: <20260918195333.EAA94976A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libselinux: fix build with swig >=
 4.5.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3176629084020437336=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3176629084020437336==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9aeb5f6f5c50baf7e02248b58c98efc562554b6b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Tested-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...Replace-PyString_FromString-with-PyUnicod.patch | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/package/libselinux/0003-libselinux-Replace-PyString_FromString-with-PyUnicod.patch b/package/libselinux/0003-libselinux-Replace-PyString_FromString-with-PyUnicod.patch
new file mode 100644
index 0000000000..a503a9cff4
--- /dev/null
+++ b/package/libselinux/0003-libselinux-Replace-PyString_FromString-with-PyUnicod.patch
@@ -0,0 +1,60 @@
+From fb518ff492cd6a286f35b415cbd7fd0f6e3faedb Mon Sep 17 00:00:00 2001
+From: Petr Lautrbach <lautrbach@redhat.com>
+Date: Thu, 6 Aug 2026 16:30:44 +0200
+Subject: [PATCH] libselinux: Replace PyString_FromString with
+ PyUnicode_FromString for SWIG 4.5.0 compatibility
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+SWIG 4.5.0 removed Python 2 C API compatibility macros (PyInt_*,
+PyString_*, SWIG_Python_str_*) from its runtime header pyhead.swg.
+These macros previously mapped deprecated Python 2 C API names to their
+Python 3 equivalents.
+
+Fixes: https://github.com/SELinuxProject/selinux/issues/538
+Authored-by: Jitka Plesníková <jplesnik@redhat.com>
+Signed-off-by: Petr Lautrbach <lautrbach@redhat.com>
+Acked-by: Stephen Smalley <stephen.smalley.work@gmail.com>
+
+Upstream: https://github.com/SELinuxProject/selinux/commit/fb518ff492cd6a286f35b415cbd7fd0f6e3faedb
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/selinuxswig_python.i | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/selinuxswig_python.i b/src/selinuxswig_python.i
+index c8c08a40..74d923e4 100644
+--- a/src/selinuxswig_python.i
++++ b/src/selinuxswig_python.i
+@@ -69,7 +69,7 @@ def install(src, dest):
+ 	PyObject* list = PyList_New(*$2);
+ 	int i;
+ 	for (i = 0; i < *$2; i++) {
+-		PyList_SetItem(list, i, PyString_FromString((*$1)[i]));
++		PyList_SetItem(list, i, PyUnicode_FromString((*$1)[i]));
+ 	}
+ 	$result = SWIG_AppendOutput($result, list);
+ }
+@@ -123,7 +123,7 @@ def install(src, dest):
+ 			len++;
+ 		plist = PyList_New(len);
+ 		for (i = 0; i < len; i++) {
+-			PyList_SetItem(plist, i, PyString_FromString((*$1)[i]));
++			PyList_SetItem(plist, i, PyUnicode_FromString((*$1)[i]));
+ 		}
+ 	} else {
+ 		plist = PyList_New(0);
+@@ -140,7 +140,7 @@ def install(src, dest):
+ 	if (*$1) {
+ 		plist = PyList_New(result);
+ 		for (i = 0; i < result; i++) {
+-			PyList_SetItem(plist, i, PyString_FromString((*$1)[i]));
++			PyList_SetItem(plist, i, PyUnicode_FromString((*$1)[i]));
+ 		}
+ 	} else {
+ 		plist = PyList_New(0);
+-- 
+2.47.3
+

--===============3176629084020437336==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3176629084020437336==--
