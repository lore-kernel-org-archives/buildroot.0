Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43BA1C624DA
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 20:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C18BB608A8;
	Wed,  2 Sep 2026 20:33:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YC7YD-ekpG8F; Wed,  2 Sep 2026 20:33:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 797156083C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788381217;
	b=l+OnhdCmBsWBjDmdit2V3V273T2d9RD2eF3clyNRQ5JBmzUjuihezt8F8i6epJJxrNkB
	 ycSckYnJvMjgtkrdNaJGGjQ7UwRQTE0ddpVBNDTUgPEeS4Pv06z2fecjBuJ7oWjDYf82n
	 aWVN9OTZ2GKU9exkh5C4sqYoI5PpfH74lA7sNb1yJ3lGGCdVs5XMdvNHuzWkScwUYUCnF
	 OUOQXUoaM4+SQFBIoaRmw0lUlO7SImYakAO8DtM4+8rgD6HPrrtDAZbEvzkwI40jU48z/
	 +ibITF5PjRCCHof5ogHUWvCmoiEOha1yzJb9Tl3CzSP4ZAk4FQqbsODiDdczPuN3EPg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788381217;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=cR8ngT1Kv/hcz1iT5mwGnxRCUiu8D8TdEmUiwE6bRVo=;
	b=mJbnQ013yu1QoLr8cyn8u6yCMqwlIG2N7pYV6pRtFoVM2tnSLpKLyZcyXACALDDj+Ekn
	 WTGy8MCDHJgSgRArqcVmkDR5NbCx/bqF+53em3ipIlUgI0i+VLKSz+FDkH0vq2iZB01xr
	 VWcvAD7rGz8Fi1i4h5CzlghvAWPdHYhpFczhyiAXpH2O1wxbqJmBLIhyrEOiqAk9RgQ2i
	 Vdl3t9DS5+Q/6JRqRf+iUxcl8BCle3uTqETh5MIAe3DuWKDHg2woGcKfkjKdAlTtLWUSE
	 VbXIKVQAdSX+OhnSvpMutYu5XKzhml4eDqv97rDLobdb8ybMguFWtUuRjSoyIIrbmBQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788381217;
	bh=cR8ngT1Kv/hcz1iT5mwGnxRCUiu8D8TdEmUiwE6bRVo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fx5s6C8FpFDzG+NyozpbYX3yent98eyyVAvew8pO2jsCxqCjJwtJlbPCnM7qNBMe1
	 13PrYTGSnBolVx41C2CE3Nn8atKXyqAd/W2xlsjm1BeInB92e8ZQuLsrcu6KdKrb2l
	 RsMEXjqRtvd/fUPZm4vgvTLnvsJckTpJLbuhkqi5TyJ9xkMVo9h6KY8SIxcOjtS6Io
	 zEt8OhnMf58iPDRfJrQZlErnkBU8x/ExrALaNbBa6BRSlNdscj1o0MQNXiOq52DwfZ
	 d8ha8pCq2/JM4qcszgOjoJlvAQQxCYt4+dSmTSIOoC/74264FKmnnLjmnmkA38jGfH
	 iO3OW/pAnuVeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 797156083C;
	Wed,  2 Sep 2026 20:33:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D7D962FD
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 20:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C973840B0D
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 20:33:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H-P0ked23nxv for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 20:33:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9542440B0B
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788381214;
 b=XOUwJvRe8P1i5V6vpHKywbcSSI3fuSwmKk8RcFW4UCL/AEp/dsOqttI1xX2UWpIXqJLd
 n1mLxtYoizvAEaLRJg85aEsghK3LgSbD5v6d2kcnHxAoRvv61R8wOS+XMpovwfb5chJc7
 bONEXUu1oiNF5WTLcVlK9CkSkOt/CbhlnIcXI8foXRW2ev+XIqWLNyVMAIJc8NLwssXm5
 OvJg0xIljQp4aGewctxWIJfFgQzEJX7sSW1i9RoTNLBtwjglSKJq0Qxi2Jyy3p+qyD/QC
 fWZI90KkFmlEYd3A9TnDFqKRgsIzAi0VVHCZ+8m4mpnLDJyOqIn4RYNLvfQ2kZsfiDQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788381214;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=LmaxjnsEeyP4cRMxFmBduxHIyMvks8oSjJNNMbhY75c=;
 b=flwqwCuXqZOoc2W98VrfmZ1mqolWZuCUgjeV8zDHETJt2fmFEVj4igtv3AGShryJ14ns
 SJRxIcy5wBrNxyXEsgeAXcrUcd0EQFxWJOMELaXRcuJPbvqNXFacHEIZ9W0HkEf1ddx1h
 zNe/puNqMR4tcDG6v76cM2GFVbn8ZlzDrw9HILJbaaErV/UixC9jn/odCeWeVSmAhTXB0
 7NLlSqBmACJ+/9bpDXe8ftlMXFPATRW2OwTXs0upj69qa6kYlJsfKUwzTbNxqjCXJ5HiA
 RfiDqos3lSdeUgGa6mV/T2jLCp/DD6za7igmRj6mU4sbw+FNjlrN1ypGrXjZjbvLHpQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=SvCfoscM; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=SvCfoscM
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9542440B0B
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 20:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788381197;
 bh=LmaxjnsEeyP4cRMxFmBduxHIyMvks8oSjJNNMbhY75c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=SvCfoscMrydEmTmWmLkIhe6r2K6f0WuN6JOjz9YjJNrD+vBiutIGlxRGSORFFH6wc
 tMmA9+kFLZAjJ8xq70IH6mito1zvkGuj7gplC0EB4w1RJnQ04QzPp2tsX9dw7Hi4uH
 Xo29Zt8Ji1En0OtHohcvXWvIK5RK2nLqsQ5hmJAyHApVrfTnXGjSXDVZAJ5dCNmUNQ
 ilCHMdw+vRFOG/1Gj31OWGd8QZy32AdEZbPVN9FqmjBBr6GVkPE3RDhjdPLK6pEqBP
 QaqG49YH00qI4FuWXOZ0D3LbAKGwnnhsXFZbTNGjEo1uS71ILnzTnJAAsZX/FSVFol
 0NIxF+xaS+lrg==
Received: from fli4l.lan.fli4l (p54a1b089.dip0.t-ipconnect.de [84.161.176.137])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B0E80A4C247B;
 Wed,  2 Sep 2026 22:33:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47194)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x1re1-000000007IW-0ycU;
 Wed, 02 Sep 2026 20:33:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  2 Sep 2026 22:33:16 +0200
Message-ID: <20260902203317.2400170-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260902203317.2400170-1-bernd@kuhls.net>
References: <20260902203317.2400170-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 2/2] package/libcurl: security bump to version
 8.22.0
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

https://curl.se/ch/8.22.0.html
https://daniel.haxx.se/blog/2026/09/02/curl-8-22-0/

Fixes the following CVEs:
CVE-2026-13608: OpenLDAP SASL authentication bypass
CVE-2026-18924: HTTP/2 server push UAF
CVE-2026-19931: Negotiate ambient user conn reuse
CVE-2026-80229: OpenSSL provider use-after-free
CVE-2026-80230: OpenSSL pinning bypass
CVE-2026-80231: native CA store conn reuse
CVE-2026-80255: secure cookie attribute bypass with tab
CVE-2026-82208: wolfSSL CA-cache hit overrides callback
CVE-2026-82209: domain-scoped PSL domain cookie

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/7af00ea6588d7a3be28fa7c3a4ca6eadc4b1606e

 package/libcurl/libcurl.hash | 6 +++---
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index e2393bf2f4..0a7b9e0169 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,7 +1,7 @@
-# From https://github.com/curl/curl/releases/tag/curl-8_21_0
+# From https://github.com/curl/curl/releases/tag/curl-8_22_0
 # after checking pgp signature:
-# https://curl.se/download/curl-8.21.0.tar.xz.asc
+# https://curl.se/download/curl-8.22.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  aa1b66a70eace83dc624508745646c08ae561de512ab403adffb93ac87fc72e6  curl-8.21.0.tar.xz
+sha256  f7ef3ae8a22e521f289803fe93543eb64c329b58aa73a9e224dfd915a2a5f4f7  curl-8.22.0.tar.xz
 # Locally computed
 sha256  82f2f4427d6545ee5aaac4f0b80428da6cc8ba41c2cf5da3a03680ec327b9681  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 219ce9f712..c3590a8a9e 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 8.21.0
+LIBCURL_VERSION = 8.22.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
