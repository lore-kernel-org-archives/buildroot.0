Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83930C624DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 12:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45F6840AA6;
	Sat,  5 Sep 2026 12:22:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id poUsz_u-gmBo; Sat,  5 Sep 2026 12:22:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5A97440C90
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788610920;
	b=fYZ39TFsH5pSDTaMqnlwc7FyEbx8caqz+6qkKbTWoC5YoUgTJFjxcfvOPlAexwcOSaOJ
	 PfGgiVWPfFeiGxlgHTfWCt5P8kf6J9w6/CcWsEwUYM8P7Fb7ldX8xRQfENmuaHgZeDI/6
	 kGNngR5N+Q1gh6w3xQWJjTXIYv7gF4XB3ML6c1VeBILy2ZavJ2ZWRomuXfD9I9w2VoQcH
	 VPbGfPTNNG9LhVbnVtDBMUnWN0Qucpvbd+beLmWzwih2BWitOCmCbRC9YdX7JdjMEZQfL
	 Drk26sHsjSxorS3HE2Pg4ziWm8IrP2POO8KI6fsXCzfC0Krrf2cB9FSW2RL4FRCrxIw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788610920;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jJRFVv5b8Mcf74bP7KxU/nCq1URKvhIFJ/zTn6LSbPk=;
	b=Geh0sd0hlKyJIB2/ubmu+BLjGVpmxZEWcqUfhPFhZFtGZYgXNhC6Z4/6VHBc5t1D4k47
	 DPHyImVSYPVB6Do+TyMzZORGNoWhnC814ukWNr3Zpg4sfxQUbH6MEMXRfA62oeD7gVphE
	 WxOuJRrQu9zYeFhiJZ8Zp9Ky4iaRP9GfgLZ0GC4E6CGZqoj3fAF1ts66rZLj91NsGN3ZT
	 hWG9QC/Kuyr4CuX4kiq/GnXLg6srs2Bdka45ss/rktKaWR94JlWolhyWvtXqgGw2SOizI
	 fldJH4ln+15OOEVKre+5bbOL1Cncfy8OKAirAIOH1oYsCSvCYnUUxjbJ9IcV+H0NnBA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788610920;
	bh=jJRFVv5b8Mcf74bP7KxU/nCq1URKvhIFJ/zTn6LSbPk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=T7A5sZ7jpyDESp4wE2YgHTj3f5KkrY+0aJBd2ib4dEti8Ey46+/NhfGSOnYZygRFL
	 WJGdfil0N4NYwBX8LsWVoXbI07+2PbUoiZjWU/z4lVl+/M8SOryAb+i075dTYMyXWO
	 AO1SHnYM/UdwnE76BIbYBskcliH6clkYLVcVCSHrs4Xgyw9CedQS9d0YO/bC7kAMsT
	 O4C5tROWI+uH26V+PHLAazgiUf2bRMyk9hRyF9V3n+mM5oqwzw8FAUlZl0gtB/Xdon
	 TuL2mPXbiElHJk27hosKYhG1PooP2dIW2O/UT0+IHEX+QpJylELnn77ARGOWJ27de5
	 8wRTHSF4x2Ykg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A97440C90;
	Sat,  5 Sep 2026 12:22:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2853449D
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 12:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19F076060E
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 12:21:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Glgb8LGbDnwA for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 12:21:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1C4B86060C
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788610918;
 b=hdqVXBvsZRkHgOs+hj4HBKn/j8sPpJZwtS6cDDKkrRMOROX5jAvEib4mW4SF64BSNyus
 X/V4nnzdoalWM7or/wt2nVPJNZBY5eKScb8ZW0DWPLu5MbbhnuJNYIAaqJ1PszkNrzFvb
 97cFdCBKHiqnEpnAuK35Mcx5R85l3OneCsxCBMDkqG3GGaFkFQTF7Lel2JL4NFWYLo/nq
 MfP2lpoHO5t29tL/XrWaFAUlTLlIPFNrKLuSD5wCxlRIm952Au7fNc+Gq8enWQM3pg2WQ
 XpnLwNjj213aF9FfS7kc48CoS+IL+o9RFYiDaghXh6WIFUjIDVkEjik7p0GRBRawqNQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788610918;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=oGvqty9l57J7RaOC3TRJm2jEd1OqKoUWGFRkvN9moVk=;
 b=dKwLOpna+tNuEt24j8cc/t+m/DG4EdoY1ha3rs6pxW/jbyqd0n8X+g/cUjGsyc+5uuqy
 AvKXGv7Q79WzHHxulv/Zy7rNXAdgbKtvqYcZssodAD3nKi+FQud/y2Y/MmwwiSXDxzASi
 883Z5JIh0zAf6WPQ9AZR34JG3rbbyWh7UIFKdEPJ02efb/QysLTSonXheNekHO3KM4v09
 +tsO+bPqEhQSxZCc3Cno1H9ULqBtTpnPX6MakKmR1hOciPLRRjT9FoBCUzyedwEmthXV/
 NMVES2/a+Y8kU5zDU9WVI1/+E0qsBYt9O1/uqf8KLR/SwB5eQzFX1qrr5rU1+HCFqcA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=oeL+2fis; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=oeL+2fis
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C4B86060C
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 12:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788610862;
 bh=oGvqty9l57J7RaOC3TRJm2jEd1OqKoUWGFRkvN9moVk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=oeL+2fisYLyrKmRkAsfrEzDEsY4BhIDBW2lbq++9QEgXP9JAo1T3xq/PB5znRBf1/
 GtsbG/R8XWt+dpqeWSHlT3adXkRi+vKTP2dKZ+eqBAFsRcaRmBLeiPkXXHN1JvFBJ8
 GQUmQhUUqV0ojEliLnuMVNTx23PK++ynsQUGmd7Ac4ItgFEl2zg8J4MKifxz4XvCYt
 Hq0Yt2BNBXRnI8+vmSsWWQFFFvAuVK/2KSrNPO1xOYke7K48IZOQvFXP3A32DPBPmh
 vUJnfdwyecA7JoRhDoHaLaEoQhN1jFsfJWh+IjdY+2wZLiwtz8yyU1zDIgW/46zZfW
 67BR2l72ZRHHQ==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 83E73A4C335E;
 Sat,  5 Sep 2026 14:21:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60364)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2pNx-000000006UX-0MDx;
 Sat, 05 Sep 2026 12:20:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Sep 2026 14:20:36 +0200
Message-ID: <20260905122040.2054789-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260905122040.2054789-1-bernd@kuhls.net>
References: <20260905122040.2054789-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 4/7] package/libftdi1: fix build with swig >=
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Daniel Sangue <daniel.sangue@sangue.ch>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre Floury <pierre.floury@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-python-update-for-SWIG-4.5.patch     | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/libftdi1/0001-python-update-for-SWIG-4.5.patch

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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
