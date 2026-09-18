Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 725FFC982DD
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 19:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 248DF60EB8;
	Fri, 18 Sep 2026 19:54:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G63_iFx3evSR; Fri, 18 Sep 2026 19:54:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1EA0160DC6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789761285;
	b=MLSJkCLd8b8hE19TJ/y6onXG44OkNoMIPjG2XVBu9ea8EXNitqg0l/UoRMAaWi3BtJKC
	 wt4V5eqEK6JL5VMMvVyIKF5tOX6+ceH0JjZx0IUxuqUDqzDO/fP+gMrYfn7zc4sDJUZT6
	 hWdXJboRqusogbJrb8HJa/LgdlLPDQsVZcNpwa6LoTUYXcP0MH6weX1Iu011K18mzkECP
	 08BWd/L8SQbNF8hnp85OAKnsMsuNj2AKEx/vTaoxtULLktemKwY84fItcp04Jl4109cl3
	 brIKa5RQgQHJPdl7bD4Ho6cSM7RBmn+S57I1x4ZaaOBxDTrne6cR4egn4kziSv5P/DQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789761285;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=D61zm9qr2SyRkQBnR/lkNmDB2pFR80NBKBzDZS9DPjI=;
	b=ZsKrYIqnwhCCpjMl3H74hektXLTLs6yjzxvrnTSt6zYQ7Fe8R8rA2m2U6fggK57+Iu1k
	 90L+RYq+uca+t32fOKJWdTvCcIjEAyyxl/KnuO6KN3KGkwUvwBlUH09EwrvGw6VxrvyUk
	 pMeJu1+R/inen9uGUni03STOA6ojMqT/hy1Mi/Hm8B8lrEBw/hEMw8MvIKcTGU+kTzetY
	 dmA9JYz2m1FQ0zcqOoBqMgeJ63SEBD9RoBZWRZ59BBJ1IZOFA8HSSlxHMINOfRBye+ONY
	 CQ5iPShPmfjAZFmKB/b3iNvp/plKHCYc7r3zOecFUk5ovgRYCWPr+CvMtgdsyDFY9Uw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789761285;
	bh=D61zm9qr2SyRkQBnR/lkNmDB2pFR80NBKBzDZS9DPjI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bMzXKRtdS+dAe/erWyCJtFsUuJ04/hbQlX0U3walLZ3mgTZ16/fkyEL+P3KG3YOtH
	 JZw7wsbfhrFGRozi4/KjVHfxhnqvf/eSGoIDob1MPWk5dA51DYJr41bI+Siap0F32i
	 yuOfxLbyPLxJwwb7XFeNhJsSQwjWzvX9muQxbPbxlliPNrc3+dPYM3OKcMwJrD03+u
	 jjF6hV3wLsgs0PEOZjhLAanLILIsHFBJls76XwCuXLxL2HZrsn/NlzjYbQMV4RIbAa
	 NhVsR9HdSymagp0FAFQ3Goa7cK78YXEyFBEKWTL39clahQrDHYYXOkPN6zZRiujjZM
	 gj0+PogOP0pGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EA0160DC6;
	Fri, 18 Sep 2026 19:54:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4182A42D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3415681338
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZMnfDquN913F for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 19:54:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7BE8081301
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789761281;
 b=U/siScM4rIP3T8V0rw+FWY1KlvGFXu+dNvp5LqjvROzswOwEln2bJ+HtHG00C+dw0I8C
 WLM0do7z3K/6dSH0D1ICK9HVmfEXM8pkkc+Z/AvpaxsNhg7rWKCntzjbeJfhHbqSowAQ8
 gqydhMMSVSvUuajpjMGHf5/nEWmxRL0VFy7Z4N6JOsdLT5VY5nbmso3NJalfZEk5KG9H9
 zoVaUKbUX6MR8DGjq9LMWDBoZ+PVVeH8XVnuhT6mF5lM1QACQemIKJMtYKWrr33QoCKFy
 a2VsSvXRA0Lcp2nwBtdVH4/QlOj+NfIV0s1UhpHtiaC/ENUJEpZ0JZXe39SFaS2RXHQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789761281;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=38IZByewNB9yFML/MnbZ84OG+6ZNkHH8mcoPcG7CDwM=;
 b=Oqi5y5Uys8zbhCiIBX0SfOZQhJlbDvymj/IPl99eLlmez2gKKVxp4J5x4yx5Wk2AXOIu
 TnFuoqhN1a9kPla3RRUyXb8Fr/piRFwuihqNPH4f9NcVHuGNhQL/ZyxlTXHwg10aw4EMM
 I6m36mm8i8gPfi1bAGmlNrh7Ug8J+lSAiY27Gw5Lu2VT2YiodrDev/3CuHzZA3FX8k1R2
 sZ9uhu2epkIAuwJfZniIVqxaj2soW7cfel32N8J+QFc+zSahw1YW4HNJN2mX2UojwgLKW
 /Z8KfuNmjm+VOH54VcLpESrPXyqvaPz0Cnr+rTa14brFOkY0xqv0d4H/31VlJIPHkTA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BE8081301
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:54:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D121976AB; Fri, 18 Sep 2026 19:53:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 21:53:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 46d379207dd2132f00f89f689284e6e18592bd33
X-Git-Newrev: 82b1b68a076e93951a10c003fb2eb0b1b53a7934
X-Patchwork-Hint: ignore
Message-Id: <20260918195334.0D121976AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libftdi1: fix build with swig >=
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/82b1b68a076e93951a10c003fb2eb0b1b53a7934
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../libftdi1/0001-python-update-for-SWIG-4.5.patch | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/package/libftdi1/0001-python-update-for-SWIG-4.5.patch b/package/libftdi1/0001-python-update-for-SWIG-4.5.patch
new file mode 100644
index 0000000000..4521ea8e4a
--- /dev/null
+++ b/package/libftdi1/0001-python-update-for-SWIG-4.5.patch
@@ -0,0 +1,48 @@
+From 6c965463223ea46d0b7ae22586cadc150f719f84 Mon Sep 17 00:00:00 2001
+From: Jitka Plesnikova <jplesnik@redhat.com>
+Date: Tue, 11 Aug 2026 13:55:58 +0200
+Subject: [PATCH] python: update for SWIG 4.5
+
+SWIG 4.5.0 removed Python 2 compatibility macros (PyInt_, PyString_, SWIG_Python_str_*)
+from its runtime header pyhead.swg (see commit [1]). These macros mapped old Python 2
+C API names to their Python 3 equivalents. Packages that reference them in custom SWIG
+typemaps or pre-generated wrapper code now fail to compile.
+
+This patch replaces all occurrences with the corresponding Python 3 C API functions.
+The replacements are safe since the macros were already aliased to these exact functions
+in SWIG's Python 3 code path.
+
+[1] https://github.com/swig/swig/commit/79f7a2b7cb7ddc256eba09c8770133148025171d
+
+Upstream: http://developer.intra2net.com/mailarchive/html/libftdi/2026/msg00012.html
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ python/ftdi1.i | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/python/ftdi1.i b/python/ftdi1.i
+index fac4d16..31e17c6 100644
+--- a/python/ftdi1.i
++++ b/python/ftdi1.i
+@@ -91,7 +91,7 @@ char * str2charp_size(PyObject* pyObj, int * size)
+ "read_data(context) -> (return_code, buf)"
+ %enddef
+ %feature("autodoc", ftdi_read_data_docstring) ftdi_read_data;
+-%typemap(in,numinputs=1) (unsigned char *buf, int size) %{ $2 = PyInt_AsLong($input);$1 = (unsigned char*)malloc($2*sizeof(char)); %}
++%typemap(in,numinputs=1) (unsigned char *buf, int size) %{ $2 = PyLong_AsLong($input);$1 = (unsigned char*)malloc($2*sizeof(char)); %}
+ %typemap(argout,noblock=1) (unsigned char *buf, int size) {
+         if(result<0)
+                 $2=0;
+@@ -136,7 +136,7 @@ char * str2charp_size(PyObject* pyObj, int * size)
+     int ftdi_get_eeprom_value(struct ftdi_context *ftdi, enum ftdi_eeprom_value value_name, int* value);
+ %clear int* value;
+ 
+-%typemap(in,numinputs=1) (unsigned char *buf, int size) %{ $2 = PyInt_AsLong($input);$1 = (unsigned char*)malloc($2*sizeof(char)); %}
++%typemap(in,numinputs=1) (unsigned char *buf, int size) %{ $2 = PyLong_AsLong($input);$1 = (unsigned char*)malloc($2*sizeof(char)); %}
+ %typemap(argout,noblock=1) (unsigned char *buf, int size) {
+         if(result<0)
+                 $2=0;
+-- 
+2.55.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
