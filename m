Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC932C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 19:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B60960EDB;
	Fri, 18 Sep 2026 19:54:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OfTtdvT_K--e; Fri, 18 Sep 2026 19:54:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6E36660EC4
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789761286;
	b=kJ0cFA6ajGsLptEFsX3wf9fIin+iP+TrbQi/NjSs5KxDMi4qQSN0z2viHCPR5AykB5mZ
	 9B2jfy2GoS+N2nZ63S3b16xlQmpbTAFgrjKyBnWZWpR4Fy6DFtxXNvQIozZ/le/qlbc6v
	 GmPJIab995hJEjmFdPjFZTYlYMwqRaysIfgP5HDxT+pXoTGy1K+yuX3uRwKqLGR6CUaYy
	 aiODNKkLyAWvSWFlnLqx9Siq9Thh3TrEvoR8sS/fLzshi/0eNS9z6inazH46Q0xy9Xt7b
	 vDBpRrXNCVCRL2Zot7yi6SJz+cJPieSt5dTc6r/x6pn06GaHGra80jYWNfI8o6cn84Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789761286;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=T5TJosZN3kFg4Ws8AO07z9NRh8tkvyqcpfC8o6iluKM=;
	b=SOQl34qvnu6YQwoEsv5zKsksyIwTHK7cKM1npnrzywZ67mUQTkbZkhd/7AaqzYL6ySZ/
	 kkqaDwbuvzOUpLc48rdMaXGmkmIrqCcF2QH6tknRtSXoijrTxZDrvZ998T0S7/kbuOXPs
	 sUHjCDEXkU9QNWUM13bGdVHcUhWCJXnm2DrtEF79mXB/aPluapISd+UWINkXrr3O7XYlz
	 MXx5fl2paehYo5hXai0dCcXIkjQbdfYU4z0QivzOkJW2Mepn/VFUQ2i9zJ+uQ0BDN8s1A
	 a5nZiiD3CMrCp8DMUy+s5ZxLlSgY0p+8ccqHUj4//amnvnjwxBPMZKUbp3JfEWYMkBg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789761286;
	bh=T5TJosZN3kFg4Ws8AO07z9NRh8tkvyqcpfC8o6iluKM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=helnSilTbFB1G01rwoDjO6Pbpc+uEkm2QYazdmP8Kn8PBRtPjRrBbT8OgOC+6PekS
	 56n4p3k/Y98/cnISUZjxKHJOqGqJw1XgcB333ARryTYYySK7iBdhc3jgmtfs8Gt857
	 WPvBFvnNDU+ir9Qfh6yo2ky3biuCXMSdTEsC4uKOGU2tVNqnuK9/52yndYgFHm+SvM
	 1RF5U1Li4C4jjsFJRW6C/MIUrGgXA78iUAsyB9ogbeUg4SCMksWNODbkJedJLEhSuw
	 WNOhNGxEc1kEHV9eEInDzCNW7xrZQoqyDClyk2GiqZcc1/G+9YvOIjzKY5fLZmi/Y4
	 IAWSljMYO1lKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E36660EC4;
	Fri, 18 Sep 2026 19:54:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D33C25B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E63260DC5
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ezryPmyfhcCf for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 19:54:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8373D60DC6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789761281;
 b=If5L0La6XegAFAWv9Vs3puYlM3NNK9UJuV8YePRCxZuOHw7uRE4Y/X8R5V99p6+s8vYY
 6KRmNq295zCLyw1s0V3vE1WSU7qAIdQ5sn4RzP5YL9ydOqVC6j3IfYC1i8aU/cijW+z9d
 Wyzjwg07O09JoKViz+SR7s1uCFA5hQi7GNZVKvJsLX9BQbBuS0aM0DbLpyA6mtmgJsASW
 PPawEgZmiS7PJSKakLe3ARFE9W7UOr8aerxADqkfMqNkIYcEAyO1aE7syssVwi7AfMB36
 fINY8BcOpx/YRddCGeXhSpuJ/6qqTSP27U2pGhGm+dQkMwnjZ2Y5Qt4Juukj0/mZL2w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789761281;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=sUnvJsq3BTr48I838/FMU/pdE+7NXLg4xRADaOVtOgU=;
 b=jZKVMq9Ly7o6Y+BN3IX9iPVDpDLlt47JpGbVRUL/2DCqC4CW0eCYUM1Mt41AFeD++0gt
 m/1URdfAANGJzcXrHOTpCXxtpYhlnmEE8hVW7GbADKin1L0tS7KiHvqF/gKPtfNZI++Zv
 ohQ3N/E/lIQsf/bT8jj+igwX5I77o8CZS0dNrJZBNEKS2YVw+PmFQLNKlHUv750JqOx21
 x1WnDkaLiTz1LvNuj910VXSUJbJiBdY0TIN2qQ2Ez3sIVl6FcRzbNYwlruyhvdecOJ2DW
 5REcWIB795N/R45TNWonH2+jBcPzHtOiMK/yn/9UH/yi0pkZRWF8M9K2lApaLeqM8Rw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8373D60DC6
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:54:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 18215976A4; Fri, 18 Sep 2026 19:53:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 21:53:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 82b1b68a076e93951a10c003fb2eb0b1b53a7934
X-Git-Newrev: f70de5ac394e22546410c10ccfe2806a49060ebf
X-Patchwork-Hint: ignore
Message-Id: <20260918195334.18215976A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pylibfdt: fix build with
 swig >= 4.5.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f70de5ac394e22546410c10ccfe2806a49060ebf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...eplace-removed-SWIG-Python-2-compatibilit.patch | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/package/python-pylibfdt/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibilit.patch b/package/python-pylibfdt/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibilit.patch
new file mode 100644
index 0000000000..fa2b587ddc
--- /dev/null
+++ b/package/python-pylibfdt/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibilit.patch
@@ -0,0 +1,59 @@
+From 5008d1d6a356b8d0a78060da2e1021507d529cff Mon Sep 17 00:00:00 2001
+From: Jitka Plesnikova <jplesnik@redhat.com>
+Date: Wed, 29 Jul 2026 07:55:56 +0200
+Subject: [PATCH] pylibfdt: Replace removed SWIG Python 2 compatibility macros
+
+SWIG 4.5.0 removed Python 2 compatibility macros (PyInt_*, PyString_*)
+from its runtime header pyhead.swg (see commit 79f7a2b7cb7d). Replace
+them with their Python 3 C API equivalents:
+
+- PyString_FromString -> PyUnicode_FromString
+- PyString_AsString -> PyBytes_AsString
+- PyInt_AsLong -> PyLong_AsLong
+
+The replacements are safe since the macros were already aliased to
+these exact functions in SWIG's Python 3 code path.
+
+Signed-off-by: Jitka Plesnikova <jplesnik@redhat.com>
+Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
+Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
+
+Upstream: https://github.com/dgibson/dtc/commit/5008d1d6a356b8d0a78060da2e1021507d529cff
+
+python-pylibfdt imports tagged dtc versions and currently waits for a
+new dtc release: https://github.com/devicetree-org/pylibfdt/pull/10
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ libfdt/libfdt.i | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/libfdt/libfdt.i b/libfdt/libfdt.i
+index 1f9c0471..b1cb9873 100644
+--- a/libfdt/libfdt.i
++++ b/libfdt/libfdt.i
+@@ -1136,7 +1136,7 @@ typedef uint32_t fdt32_t;
+ 	PyObject *buff;
+ 
+ 	if ($1) {
+-		resultobj = PyString_FromString(
++		resultobj = PyUnicode_FromString(
+ 			fdt_string(fdt1, fdt32_to_cpu($1->nameoff)));
+ 		buff = PyByteArray_FromStringAndSize(
+ 			(const char *)($1 + 1), fdt32_to_cpu($1->len));
+@@ -1169,13 +1169,13 @@ typedef uint32_t fdt32_t;
+         }
+         $1 = PyBytes_AsString($input);
+     %#else
+-        $1 = PyString_AsString($input);   /* char *str */
++        $1 = PyBytes_AsString($input);   /* char *str */
+     %#endif
+ }
+ 
+ /* typemaps used for fdt_next_node() */
+ %typemap(in, numinputs=1) int *depth (int depth) {
+-   depth = (int) PyInt_AsLong($input);
++   depth = (int) PyLong_AsLong($input);
+    $1 = &depth;
+ }
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
