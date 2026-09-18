Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A4DC982E0
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 19:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83B5060DC5;
	Fri, 18 Sep 2026 19:54:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l5xRGAUJqX06; Fri, 18 Sep 2026 19:54:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B7CD560EE2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789761289;
	b=k6khbR5ktPYUozOsesFqtjkekLwyFWgAHSweHSdSqavQkZ5deXykZM8kEmp6yXHShN5n
	 gCw8cCTRsT2qnZXihL8PFifhAY+HdKQQfOD0dc+wc+PVnPHohPbhIdIQ3g2nmf8zbrtCn
	 ZIjeXh31xBhabvhAz77XIBKOGe8oHOkjqjSERQdwkx0TNIV0B34kqzhgahZDXLmEY2DYK
	 rofK+7/jhlCETvW3sPukUrvQ3fWFcy+5OyWyA4UsZ1hUGlrX+8dtwOxaqWxhHAoJUGeyn
	 YMXT72DrMd0BanfvfZ2EL+COzJ4T6tUfaX7MXN5z4C2Qtvp8mVI1nKdf5q+KSfyx6dQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789761289;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=sRjVJRolwB3UHEjCdroPVX6cl/4x4MS++dNP7eG6ZK0=;
	b=o/6AOm+Pcn6kLF/9Tv9R/FWzQADYnZiRMjcMmeoXVcJQiaCtTWo1yTjAMCvnN7vyPpk+
	 /zO03R8eY1RE2DI2dUhw7zdFVYeJ+N5Yp1uzmbt9Z19yjHrCZwf63eZ5EbV0CgcoWYmze
	 N1JRuTsjHgLIB8rP6ASaUuracp+97n8Po+zKwN4r6rK+xrOd/jVt8E67VFpUoe2XRhWD+
	 GIGpuQtf+yWWSEauyVl7cB9mnWxsvhCWU5WZLJs0ho0MuFKOCTFYtVfRGFjJpjphuruFp
	 JxIE8g2IXBJe/c7NsErI7BTx48EEzlusrNM5nQp/WL5NIg4jrzmARcrmdjBesGaklfQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789761289;
	bh=sRjVJRolwB3UHEjCdroPVX6cl/4x4MS++dNP7eG6ZK0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dV1MpV1zGMrXU771OtIGfd8XcWoHnKSr0UjjeMLEJ+4Lqwox7UC5s9+udtH0ZABo6
	 IXf8hwbz2UE99B5Tlf7lQ0Uv4YtVAVnut0MFaxYTP0vcMl9wxwzBxYmUK3zRdmxN65
	 uKE3F/5v5Ijbwag7wU79DyYIR1A6aS8UmVfgq34f3R07Nmx3rxE60eN9jckFipNKSJ
	 WA/jDqBDCmcrT0A3XQ7fAS5S8Id6izmVdJPCTzRX0PLwaCbzzGWUzlLolDXVGcE6tr
	 gLkkbW9MWc8avW/uXLiSjUOuKfwyzJcjtHOIaZCMfTWp/B+ToforAsamxNIgWC0HSl
	 W+K807ps88jlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7CD560EE2;
	Fri, 18 Sep 2026 19:54:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A59B42D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4015A60EB8
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0rf7C544ewxS for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 19:54:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8F82160DFE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789761281;
 b=p0R7Gz/essu4q6mkIDWhHOltVJfM7/69/QSBsWPUh299JLKgmaaYDHr+IhlwfN1IC7XG
 EHWoRz868ZuaNoQRp8Ly/gxbfuJGD5cFRgsh6lkUkx/LqdFQToZkmb2SqrnCMonKoU+pg
 R8uqOz1hol10sho+RHn1TZHyMyBQ+IZEnkxtmq6VrutsHHEtN9YHvgFwACzxqvzdgino5
 idsbqWjVmZ8aO1SC5HsX3md/ieD0ZkbBlz+qxXJv841cyc6uEdTueF7pahmpyzKyyCg66
 oNJ/uhVhNH4+cFEy3HQhtkh2rupXJd/CqAdq6eGDvRyhupTfARNJeEXJoRJwKIWlJOQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789761281;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=m/NDxgFzEkVNZFB8eV9LEz83qE+7QJNt/Bm307jPscY=;
 b=k7v6N+ooAcxjzV3WUAXtGQ7SYguNzYno6T/jE7rOkpDuwp04ykmpZtS5bsFWBA3J03aU
 2Kcu6rVIjcvr3Ql5sKYBElW4bf6nyXt7eMxCdKomYrTvlFXgUusXcY90qYu6mQY/BkiJH
 A99MIGqrB+jyndG05HwUaxyqHBlZE2HjSc9dBG7WMusz3vCXnJJuwVzZrc5+AXkguS4Sf
 SMkqoC4dNhYm0BndeFzqSCL7+heMVji13cfNaLTZ04R2kNa1b2ijW0KuBq6jJs8EMNQdA
 eUP2YalwpiPDamQ/zys/JUinm/2gbFmJiAGFPvhINWduo1kFCxZWhd1qbby9plL50MQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F82160DFE
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:54:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 24F58976A8; Fri, 18 Sep 2026 19:53:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 21:53:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f70de5ac394e22546410c10ccfe2806a49060ebf
X-Git-Newrev: 0d3fb5c061cb12b020b758806d95bc3f6e5c085d
X-Patchwork-Hint: ignore
Message-Id: <20260918195334.24F58976A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/trace-cmd: fix build with swig >=
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0d3fb5c061cb12b020b758806d95bc3f6e5c085d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...oved-Python-2-C-API-macros-for-SWIG-4.5.0.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/trace-cmd/0001-Replace-removed-Python-2-C-API-macros-for-SWIG-4.5.0.patch b/package/trace-cmd/0001-Replace-removed-Python-2-C-API-macros-for-SWIG-4.5.0.patch
new file mode 100644
index 0000000000..5f792c9194
--- /dev/null
+++ b/package/trace-cmd/0001-Replace-removed-Python-2-C-API-macros-for-SWIG-4.5.0.patch
@@ -0,0 +1,32 @@
+From 797a541398bbbd55a29ac22ca3fc7271d6627aa5 Mon Sep 17 00:00:00 2001
+From: Jitka Plesnikova <jplesnik@redhat.com>
+Date: Sat, 5 Sep 2026 09:34:04 +0200
+Subject: [PATCH] Replace removed Python 2 C API macros for SWIG 4.5.0
+ compatibility
+
+Downloaded from Fedora:
+https://src.fedoraproject.org/rpms/trace-cmd/c/eff667a072e69238efc469775585b1b30c056187
+
+Upstream: https://bugzilla.kernel.org/show_bug.cgi?id=221966
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ python/ctracecmd.i | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/python/ctracecmd.i b/python/ctracecmd.i
+index 38564601..2525309e 100644
+--- a/python/ctracecmd.i
++++ b/python/ctracecmd.i
+@@ -218,7 +218,7 @@ static int python_callback(struct trace_seq *s,
+ 	result = PyObject_Call(context, arglist, NULL);
+ 	Py_XDECREF(arglist);
+ 	if (result && result != Py_None) {
+-		if (!PyInt_Check(result)) {
++		if (!PyLong_Check(result)) {
+ 			PyErr_SetString(PyExc_TypeError,
+ 					"callback must return int");
+ 			PyErr_Print();
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
