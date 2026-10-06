Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FC6CA5FFE
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EE4C40709;
	Tue,  6 Oct 2026 16:37:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1mNzwlKc_gCd; Tue,  6 Oct 2026 16:37:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6F4B9406EE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304667;
	b=Hz6AytbSx5bR3u68BDTMxSJA660xDpe87qT/epyLdJN+LXdCZF+bpNabKdUkHs2B/wpX
	 ebhosKEl/aZWKbrhKSPv6T2mS6Zr/RbJTvKK4AuMdqKsGJcEOeq6Aj1OwWTbUoW81kESz
	 VRnwa24Asu16NMx6EuEbU9oipZwkUaoCAY/wBvZzUJ0vwFlKtol4Jmg1DMSpJSBHIXNn5
	 uPlPK2nSIX9zY8mKBHCB9KwvGROZy3A8WrJQEZBcyJF8NgYgeA/8G4/QXuUdJDqxlGhla
	 pTvBIoPouYzDPEyaWkph/xInWE5+UlDuGJ6WgTwgQ17En8Zj9T753CoRiFgOqmF6JOA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304667;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WlGHSYqaqW6NA1iJ5vhYQ9U0DyQfsQwxaHvambouax0=;
	b=A/4/v17c0cNInzCb/lAFDkuUXfKLkxUrNjwJGe6/G/hzaY57W7tVfGPADIN3EWytEhPN
	 Z7Q8+qbODfYr5f5/itl5Y1U4F5T72LYOtIEUFjo7n4EqHhxzOXvETRwzbGyPgGQjiYbzD
	 QZYYiTs3XTzCwGHEyBPybxz0FzvK/V3Ds20OYrPmm+g28fJPrBnY/bxr29i7YeuIamjTU
	 /7gVMjkKEmPh9ix+RT0ihj97dL+33yh023S7yygHomw7odD6g/ZXVT4gk8w/6bUK2FaLl
	 V443u64Hgt68M0D6MLoUopRqdV3eto7fNrnZJn5+6OADqhHhZceOiwkJw/tnjb6wo6Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=JgJztRpF;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304667;
	bh=WlGHSYqaqW6NA1iJ5vhYQ9U0DyQfsQwxaHvambouax0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W8FHE+7ZGfZ74AVxfQ0sEHwr2neGTR5VwPaM/l1lqeFhGX+Mlosl/h09uG/AxpNKy
	 EMIVQWqNDozE3wR6tzZEhMRXZarlkEQuYYfrhQ8beIn1fGl7TxuEBAddsXjT6EP1oe
	 /AUb4R0aQiwB/Is8gmrLwYLvNIR2fx3yJjPkkYyr797FE7RRVj8jwOvxX4KfCv0YC1
	 Jag52Iz+nhinoDY+Gwt6JJXzAxgkgK8yd1WwaFXOsnL5SiHuBmpc3ornzDf9Zjmeja
	 GWdsOq7cq16wo11T1IIDMvRrUNtpKzcmo5L2uRRZCCsz0lG4YSoZ3CxFjJ/89Mf3Ve
	 6SFnjyvL2f2Ag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F4B9406EE;
	Tue,  6 Oct 2026 16:37:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A093734E
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E06340741
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:33:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ixiOU5BWrIFX for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:33:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B15A7401DA
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304403;
 b=DRS2Ids6G5n1RHxZkFrqDW1Go7DZDWYO6nlpw//pU+PvY7jfR+8DaVIszcmdPoEZ4oEl
 KuzWYDdR10K5B+GUSjlFaY+XSQvp2qu+jrJ05AbLn5OnwQxHinsot2BHgNNsYfNMNgEr9
 6hMlw1DW8QGrSLE2UxQPl8vjdKMjUwMfgEZDOtqL6Z7xgnbOKTswKsximX+7D4h/Rxh5t
 6dUzo6jR7Rvba0lTyLztoKDenf6rq//G9mjNG2ATlZVXeML9JHVbuMnEvpKsRBpsXOzrR
 E6CMVWl4rrYWxAxXBIg04rY89TZNBgMu8sX3Q9zxkjrnwjoLXI6luG6Fn7jrfBNspmw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304403;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=ZCz9Mm2R+/TZ6AuG54GXRS+f/UieJLdE+h+hRTFL5jc=;
 b=nCWiCuA2GHXTB4oFRP7MrRiB/JgvjECjG/0DztKcIRL0Ft1vTo4pN8xhSRe1WQfSK1AN
 u5VMOJVlHG+TcGTWvYaSp5It3wRmbWVHg33f54OOb0OgLQkSblytDkMSLuo9tH4+76cYZ
 rjlNlrWftt9UCRdr+O32qg1lwlvtstzlK8z3fRBtYGeccMZm7Pz8jBf+DfnWV6f8vnbz6
 Z49fnsFtoZ2vl5zT3Cky9jbngbRtBU/Mb48NlPgX/SpS6wvXikFaQUkpNubCoManJ/fRp
 3hk9yihmKgDVq1+axSXBX6Y7zf4fJaC3mvuViOdFJk0uCOyJ69UoU4/K28NzqRMcRKg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=JgJztRpF; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=JgJztRpF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B15A7401DA
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303710;
 bh=ZCz9Mm2R+/TZ6AuG54GXRS+f/UieJLdE+h+hRTFL5jc=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=JgJztRpFUEXf8EQLcU/WKRLxB2pOUyVFmXPSNkgVl2KlDFG7SJGrPE/4ri/+3O0oJ
 gTHPjjTYijG5xqCln+Gw+QZ8rRGfjCCWd9c7zTcdslV4m8GyLqe3MBhEShOxFBHWOe
 IJmYr5izwtnq8RllzgiRsJQsyTvtIKhCyXeuikitBxQ6jhsiID0E0eJPA/1ZXGmBxs
 IXoJx4Z41n8KlMuMoxd3+5UHaUnEoTcP/9azcf8mcBl6Al/DMxF0pmJZoy/69O+KaN
 n2QVqRhJB24zT+p4/FYDEiADSvi70el9nlblxkNQO/zhULa4awlaN6PlWVTZYaBWnb
 3vy1ZEgsZQNZg==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 1wOrdhq679WWLVg7EuKRgKSvjtIztvDipGrKjBcEFXqBo5WsGlr/nSZx91MNFnhz3coEKH3OnWx
 EZYARZLghJY6hYy98dCB6ndNvu3Gs65cfbbTc2U+KEyCZQrxzf1tmwdK5ZDAoftQJEX1pZg8dwP
 wWW36+YSo2pxmN/n2X9awsfFA8pFGSrtaGSw5DsYoTZkMPLr7G7uWXgnjLa8cUpUZvLaNWDo7fL
 x/fVnGrMMUwk1PPlTMmNLdCXo2Daic6HI11qXGP25WTQLKJcO93pVEyvCwwXNQnBIl8Ln3aJMND
 vf4ROPb8DC8QgQ9r8iTlVCRLeZvXanBB/HEyG3yM88vTv7pDeFYl4AXZSPTtfHcV8/ZOu7M4Der
 aX20g9x/Mg3NPds3A9mtN094ls0jYz+nqX0yJdXKrs0uISf0PW2tfQR8R5lE92MzbqLdX59Ntho
 Us8yWxlD+30MfE7lf8NsGThtUHrhMcspWEq5b1CSSjQWlOHl65RdYyRsajG/ctAYzQHi8Q8FUNE
 e55sevf+Z4MVEjMJlLEeD8jiPz7jO7TZol2Qo8kJg41Y8T18lCcNo3/kQ3BCDIlNkHpYTPs6pIa
 IHfqxCi1Oqo1zOwBE6bGb3lAJgDoPNvUxeHASTGaoC+m9apCAg==
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3104DA4C5514
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 18:21:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7uk-000000000ir-1VLJ
 for buildroot@buildroot.org; Tue, 06 Oct 2026 16:21:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:20:16 +0200
Message-ID: <20261006162106.3439373-36-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v8 35/84] package/libesmtp: Fix build with
 OpenSSL 4.0.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-with-OpenSSL-4.0-opaque-ASN1_STRING.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/libesmtp/0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch

diff --git a/package/libesmtp/0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch b/package/libesmtp/0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch
new file mode 100644
index 0000000000..f38435b68a
--- /dev/null
+++ b/package/libesmtp/0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch
@@ -0,0 +1,36 @@
+From 0705423e2596a21e2d4e1f3fd492792956a4bad3 Mon Sep 17 00:00:00 2001
+From: Ravi Kant Sharma <ravi.kant.sharma@canonical.com>
+Date: Tue, 28 Jul 2026 20:35:48 +0200
+Subject: [PATCH] Fix build with OpenSSL 4.0 opaque ASN1_STRING
+
+OpenSSL 4.0 made ASN1_STRING opaque, so direct access to ->data and
+->length fields no longer compiles. Use ASN1_STRING_get0_data() and
+ASN1_STRING_length() accessors which are available since OpenSSL 1.1.0.
+
+Fixes #33
+
+Upstream: https://github.com/libesmtp/libESMTP/pull/34
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ smtp-tls.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/smtp-tls.c b/smtp-tls.c
+index 9f3e50e..981284e 100644
+--- a/smtp-tls.c
++++ b/smtp-tls.c
+@@ -599,8 +599,8 @@ check_acceptable_security (smtp_session_t session, SSL *ssl)
+ 
+ 	      if (name->type == GEN_DNS)
+ 		{
+-		  const char *ia5str = (const char *) name->d.ia5->data;
+-		  size_t ia5len = name->d.ia5->length;
++		  const char *ia5str = (const char *) ASN1_STRING_get0_data(name->d.ia5);
++		  size_t ia5len = ASN1_STRING_length(name->d.ia5);
+ 
+ 		  hasaltname = 1;
+ 		  if (strlen (ia5str) == ia5len && match_domain (host, ia5str))
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
