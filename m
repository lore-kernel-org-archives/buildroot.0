Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F08CCA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 394B7406B3;
	Tue,  6 Oct 2026 16:37:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HET3icC4EH79; Tue,  6 Oct 2026 16:37:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5CE8440694
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304663;
	b=T7T/g36CIxa5+M5wVa/8miCoD2Vw2wn2iFB7Gz8RXFYzPYsazPX8XqU+TJaK4z3fGx/E
	 59GGb8abCz85VCGx0RlZ1EHRXEbebF1d6aAdWRvW+cyE63NDsMzhRqBUQZ6sa5t8AGwSb
	 q2w9/thXL7bCs/nBmfeJjsr4fd5GX7wpU7BIy9/GXPG+zBZwhTArF+pmnpWj0v7aWlukE
	 Jfhnm1AyXDtPipfta2t+sWtmcbZRWsjRyU+v6LkSxvdgCUba4T7DyfpF9Harl2oWv3my1
	 n5+fTLH/dNuKwJowgWVSO64ghrcnSu818PkXE7OJCy80cL1aG8ygSoI4ulqhhvItoqg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304663;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=MGJFdn/xXmdV01S4eJcHAbnxy60FBcPBOG5lTOKViVA=;
	b=aLRaFkxk5HrTU8I5ZnhDZ7+vMZKzwsgfgWDA2lygu9gln+8aRfBQw4jzMsKnYwYRDgdV
	 nfzjOz/wCX0JXFz2cNsZCheuxkTVgecP1fnJxy52kccIMUSBIqwD/BmpnArWgCd2Nw676
	 5YqzDA6X854Cpyz+aBfmUF5pcJf7Ou8tHjC8wPLfGUVd72GXloNMovodyYzHBL7G34fQC
	 LRiOExJ6VpH8i2EPLScR7SNIaoWNzc6IK1IkzK0MKJ6VW2Y0it5TkT2MXssTi4ylwo9z+
	 cG7VWykiaJhb0193Go+elvefVlYYemtPZarTXh4Jg4qZDnNerbv115Uj8ZlFGMNXILw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304663;
	bh=MGJFdn/xXmdV01S4eJcHAbnxy60FBcPBOG5lTOKViVA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W8IX5swzo9qfYM9gddWu5RR7C4vrCWd5pBnqyCxdyNPjnR/O8uhoZ+q1c+0Eiqb2t
	 BWqQxf5boj0+Itie5TnxDmWNui0ixS4xZjR/mSFmKLFjkGT3EPw9nGRZLZ4OXpcWEA
	 L2D7V4zJE88ANeCmuOo+SAxDlfz2c/GnY+10rKJzT/s7cdq4nrL5QZ4QIokvsos6TN
	 7gpAa5PonWPd1kiQhHkznqPjtM/+kGFsnBVHucTTiPS3kI9FzzCIUbaWaNUZkzLd1Q
	 dz3sgREFOCq8vz8lBq/I29KeeGXaRFk0+Nj9Jcf1guLCmy1DhrUw6atqGTwIJ45Iqz
	 sp0IVdnk1PmcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CE8440694;
	Tue,  6 Oct 2026 16:37:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FB0234E
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81FB460822
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:32:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ZZf6zuzzKsP for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:32:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 86A4E607E5
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304366;
 b=fj+8ij8N1Oxlo82tN5xgZ0mtaQEHCfvBGdcARg363xdtVJfV6DQ/3E2Uv/nlO0VXYKtQ
 HACoxFjYaTvL94joGerMY+4Pz6+Rq+qqoDIrgz4n/Uko8Lt3FesmWZ5oivoRMQK4HSy8v
 y0ZtcV9JArMXHGEORyf+Nu3metI8lkmntTL0V6Kriq9SssISBrcNQ40YH/KCrQsqBu1w0
 dviZApmB3nSz2D8GD68SoW/tvR9vzGY93YYtKdm0CbySuXjPHuID8beyhrxjf/rhqCZ6e
 gwGFpDVMKmC4WSM7DnpO6HrwMaCkhgeTDza38fRNxeOGge9/RatpOwQKHE5vUqaH0cQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304366;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=nHqYmULtfAkLptJDi5XVDSWcnVEq11dE0d7BB83pFzo=;
 b=Ucj4faX38cijT95FeQnOHvnkdi6C5znGOtXyuyphcSIs/uKoO0bCLrv8QYbswPahrppw
 OnRb1l+vdCKvZbpQSPuMRb3FBbNzPtCmWBc5/V+YS3LgTiCGnZO43hspzyulHNfsGwVgU
 ijZ63CXkzYz90yA9DsnbHJ+x+guUDP2WegplIH4BxEPAbQhcCMxTPT0EMInunJaalhYOS
 R3Id08QgI6nvaz3AYdpGgjnerIs3Kv+0YSbzfcMA72xkvy6b3mcyKVL20fD6ZytXNlkJn
 QRfMlFT8MS7HwhtNA5U1riPOAXamjhgCS9PM6wG+rwVd0GDfLWGcTK/oypJHVoS0piA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=K2JbUMWY; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=K2JbUMWY
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 86A4E607E5
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303709;
 bh=nHqYmULtfAkLptJDi5XVDSWcnVEq11dE0d7BB83pFzo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=K2JbUMWYuB8d6RW/uD+6WMQnT3qv9Pi4NKIdK2K+pEkB/3Mj3Ww+i9wX7mxszfTJ3
 Xs8oAlqCmRcbxao1H29QrKLQKpw5xQYFC3288u+fxGyEFwgx1m5QMGq3GT4GedCJM8
 EDKC5PhOv7zoSYn809iXy3tyFbCJxuk6bqhP77k87a8UNErJnBcg/ODKhj9swRma3h
 2ndJoZD7L/gJ2/2LMkGg5kfrf2riEv0F8NNADHKlTaHwbDRChoowuF1GMH5WGUUILR
 bmpmfWHJhVJ7tss6syJJHryVWR8iP/yRpOhK/aJNkiTfiHNWkFv3ofaY8/SCLFjdoq
 CVEw+29xQJriw==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 cuNz9OR7kD9yQNCLXioubg2DTD/zeq6YdYaV67dK2dohNHaPqOXALtAnqwUUF+kfN3pRAlAH84+
 OmnPURHSaqN3//PZ4AlftIT2Dk2FgLJtaiCOEPSnVei8KHew3uYnt7pP1DOXfpQwIUcIY7dt2me
 pyMIuNSEJzbpmGY3ZYHLJuBuVs38zFIRxQhj7PUHov4fO9/FP9y0XDWOr2qOQIujJsU8EtR4RAB
 l27HMjpFFu9JsplyCbruAWmOczrKdZ+DUhh7pI5oza7fWShAahM+BuUJUtzOCd8HLlEOqzknrl8
 4cY0XCoc39EBFYVGJ05VCU3umqwTl3EHzTy7sDW3JUVMshwFi6urcM4v0n+szxcW+9a9zL4oYAc
 i+8Sl//BxT1P5CYbqSZbGJqssAM9WrZuR1t2A2zlP5R+BfgxA6MbnsGwooXiAtuFyVRT3Tsjr8J
 AOMNPRqukSiXAQllBbf1BIFBAWQhb32+H0wyw2mhoFxTvH9ReC+KDiJOZPe4MksL2ORNTeAChej
 M/4qwGNrYXupACsk7cgdDNE2kFWGZI9La3CrveVMJEPua/uDB8I5I5ck6krcJA26oMQpUHu2wYl
 o6TanmA=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BC4F9A4C550C;
 Tue,  6 Oct 2026 18:21:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7uk-000000000ir-0REY;
 Tue, 06 Oct 2026 16:21:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Philippe Reynes <philippe.reynes@softathome.com>
Date: Tue,  6 Oct 2026 18:20:13 +0200
Message-ID: <20261006162106.3439373-33-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v8 32/84] package/ibm-sw-tpm2: Fix build with
 OpenSSL 4.{0, 1}
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
Cc: Philippe Reynes <philippe.reynes@softathome.com>
---
 .../0002-tpm-Update-to-OpenSSL-4.1.patch      | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/ibm-sw-tpm2/0002-tpm-Update-to-OpenSSL-4.1.patch

diff --git a/package/ibm-sw-tpm2/0002-tpm-Update-to-OpenSSL-4.1.patch b/package/ibm-sw-tpm2/0002-tpm-Update-to-OpenSSL-4.1.patch
new file mode 100644
index 0000000000..3b4e3d815e
--- /dev/null
+++ b/package/ibm-sw-tpm2/0002-tpm-Update-to-OpenSSL-4.1.patch
@@ -0,0 +1,28 @@
+From 66921ee5ba05ffb92700b00f17cf1e8b75522aee Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 13 Sep 2026 11:11:24 +0200
+Subject: [PATCH] tpm: Update to OpenSSL 4.1
+
+Upstream: https://github.com/kgoldman/ibmswtpm2/pull/24
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/BnToOsslMath.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/BnToOsslMath.h b/src/BnToOsslMath.h
+index 731957e..345d29f 100644
+--- a/src/BnToOsslMath.h
++++ b/src/BnToOsslMath.h
+@@ -77,7 +77,7 @@
+ #include <openssl/ec.h>
+ #include <openssl/bn.h>
+ 
+-#if OPENSSL_VERSION_NUMBER >= 0x30600ff0L
++#if OPENSSL_VERSION_NUMBER >= 0x40100ff0L
+ // Check the bignum_st definition against the one below and either update the
+ // version check or provide the new definition for this version.
+ #  error Untested OpenSSL version
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
