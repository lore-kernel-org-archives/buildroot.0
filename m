Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9666DCA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 10:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D7BC408D0;
	Sat, 10 Oct 2026 10:19:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tLRpaKUBW5ul; Sat, 10 Oct 2026 10:19:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9786F40824
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791627557;
	b=A9ESQLuasYzmUJxNbvdMFgENXH4BY+CIj8AwZpA7G7U29HfmvgNKv+RF2vUjGGihbFQo
	 v4gvFr/KoutEFdP8mAdrrZ1sqZP/uCIp25U+5NQ/fndlu6h5LqmCIBWD8+bZRDIjW5B/z
	 6poqNCF1iYXlZ7ZYMXW18ADH4acfEsa1y8Q83FDkGhmSkEo8RHlyMYV0tKAmnqTvaGy8l
	 MCHhWA8amvDB+z08N0St5bXFLrTGO2mUoLcQFOOb9Swo5/WDZyFsipo5HztJwamfgMEBx
	 UQAqZgIcnL6wFGxXewk0Fo16HSan88969Ba8OSjChJCZORsvWenaA6WUVqXqJ9L8VsQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791627557;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=hXUAsY0mxIbqIOD3wjbtCrhYh/5rz16Tm06VL5sXr2k=;
	b=do5FWn04S2okLgnPO5aYcyErDUTBC2rY6i7MaacW6uvOnq06jncpQgNIhShoo4ejgQlR
	 V7d8/ZUdHNLuxLOOZ+4JgcMwOo+h+mzk7xupR3VCuwWy+a8ForNCwLjC59LBtmdoskweV
	 0BLzxE1O/7q6xzvO8ymJ0n8ruTjbvoI/HYwTzRFkxn6GU2Qd1SJ6cbEGUKVkZPkRFZ8A4
	 lTJutsCS8T/4d9m56B2sicAMKShLqJ6fz7BZW906mtvCIMWbg7MFpXdioyGT779LGm8ii
	 ZKWsHg450iHQRdl+6yIs6qyXTKrrH9HLCiFtfNf5in7WCldbOFPXUElikFiDBEKLsig==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791627557;
	bh=hXUAsY0mxIbqIOD3wjbtCrhYh/5rz16Tm06VL5sXr2k=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qT9yDbaPOrs/k7xRhEdqA2Gcqy4Ps3CZslQ5XUv03Kix8QYZGMuyt045OMliNt6am
	 djIDie9U+hM7wtMYXJPXpDDJebUXClIRAxYMHiJGDt4DrDO+lEv6J3I0gM/pgxJYPt
	 0pldlqgv3uNlAJI27K50CBWHWXRSUXjp3VX4f5sNpYXYdIe+p/LxzFnmyLM/WnrE/i
	 mI1J3nEKdJt0OE9DAUgUUOEFKqjjr7Kwo7w+nCEhORx770H3INxNadWKSGrZT3+bwF
	 SGDdantYcT7SogaADlMEfO2rsBAA4SJmbbOXqxSBVH3DJmMexnm60HIY91JDmynXQ3
	 1/DUHzUGBTRew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9786F40824;
	Sat, 10 Oct 2026 10:19:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 820911DE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 10:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B679400D5
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 10:19:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cGsVJHaUft6I for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 10:19:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2F8FB400AE
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791627554;
 b=TuM518Xg0g97tmQtynz96OpjH6R0igblRyUD9Mj4m4NRY94KYqHb+3rN17OX6nSoe9PQ
 nZm8Ts0cf2aYGYH+pTCGL55kiZgOls1/5pWJGXytbdKrNzTipzrpQEJ5x04/CZSxocd8l
 oAXZfOiAry7l3Tt2R8FZTA83q/X3wYNSxmfCyrOl+DYv6axLVfQu2H+SnKPfWnu0c0a4e
 uq9hpsqgXc43Hxg5ceabSQ5Q5WV1Vxv2j2AarAaVGcYc0TZ/halnVriUC/QoElujfyavX
 3kBcAmd3AygQt320YDQ5mhHOTg1JKd4H8lUulAZmT7h0Aro3LiivOy30J0Qy1ZnMeSA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791627554;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=RL5AAQhnHrtpAi74NrCxOX3AACcrDuzO6YgrxhpDTsY=;
 b=etO1Q2X5NV0SbKpuXJYx8HnytYMtZkZ3B0Wri0uyRCBNWJA8CafPmGs5o7l3ueD4ejI1
 8FvoC3OLRs6+xRZFU6fmsYMhHspDhaoPjks2b+0getnk1tF+ZXPxYstelrLDITerf50UD
 N7dcN4cHG1BLLnOfH1SeTbvdrLxghifZEsKFgrOTpE3q7ydNi941b8LAIaGZEr/JZBZwj
 kIZtNlDjOxjl4lSkjALP98hpOqyPgottW3T6rvzmtyT4MFGtNwMGNr29Ao+oSwUKhBimQ
 24sBFKVnftb75wYDHSovSaI16nb40kpZ1e0TUP1v8pbT/gnHiN5P0Kt83x1lyWFBH+g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=r60rBHbl; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=r60rBHbl
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F8FB400AE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 10:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791627551;
 bh=RL5AAQhnHrtpAi74NrCxOX3AACcrDuzO6YgrxhpDTsY=;
 h=From:To:Cc:Subject:Date:From;
 b=r60rBHblz0A2gam98sqzoXb2zFXQ8vndsOLkhXjgiGsSPt5WKk0sPaLS+yIaGInMQ
 q7QcjC4vmEiM5DeO7li0cVoSA4ONieQH5NAuLmqDQ7rnnPuPSlO41j7aMP8tVhCXkP
 LGg0XAdPQ3GvLUQcO+C8kNCMQBlQM/tACW/l83Q3RUCsFeCgwE4WCSvGjV3WjVF7lJ
 /qVhhQOHBIz/uIYYRJr3ZlPPJswcEfZWa0pEmsew+nY3+kSnp+XGyJIATS/0JuvoWc
 vsOZNrG/qBE9xHxkUheu3KtBfSJnHr4z5LSfnkReelZJuz6upOOxr1qdPrFlL2+DNW
 jUjyg3k9sOQ+Q==
X-KAS-Sym: v3:f51bdf72230551df:eh/H/l5TgYyxHj4VwzM1dmib5Wttf1v9PEgt1VtZ8kLvF
 mxuF9nOzS6JFnnABbYK4G/zLBs0l3/ZiU8xCGGH8tVmW5nYprVFvDmB7/zQZ1DiqAktt8qOj70V
 BpDNBZl4ZdhGjic2qjmmrTNYUwWDolCspkjmeSWIvisooD9jt/Dsq8VWcxe+ahjTs59RSyfkByy
 eQgStpvQKPU2uZ8Nnfd64lLKwqoOzXygzVjCZd2W5VUBa/cm+JBvwQKEJ+GslReOZM/hl/VjlX8
 wVnRA829QeXx3iRV+7TBv7lP83EopFqYl3kvM5+hChpXClCdiZG/vTYmT/vgueZkamjkt/6A==:
 rmapIlIZFAKTVPKO9ivefYX+weFNTpdZLgqfaLbB40cRyWfIStKUP4ssdOT4F27D+kTRN8eDL7O
 y9WIz85UIrxaYoVo8lX1yWjUSk5ixn/f+rwMICQquIPUPMGeJLgRXoLP+NQ6goTmLHlhlmyEgEQ
 28w5C3sNgLSkZsZNCXnlNxLb9Qn3BezD8WbedD9WBv6OEkaJ7ma2bQWHcj5/GqcisB1M5zzARdT
 iXUZwq2nfvGelKTGUvRcrB6GV23CeMi3rnbVH0Dmi1tr/tCk4Qqh6B/eWQC1IpfEetgAp7YZOFO
 QNWNq8twY56s4fZd3DSNvlx0p5UgTExB0IwogQbu6nsQ2QtooVp/p71P5K5uopOP2FkbipgpUDw
 pfL4ZQ+dy8RygCtO5heRvm86nlFRElGHZ2IvSHvHbyIFMr09V5R+HtnKpZ8AZRlp+i2JQS1NZEq
 i4dGl1dIM6i0Etsaq+PJNL1NYkUOxpk9PYWEEPcJ7RKyVRPJzs/6oVUGcTWiakPO0SKuVTKnKvk
 pJts6VOEy5BEEVBR/KcRTha3dU9vIOa/swyjIncb3Zc70CEUcgOw54kF1qopeZd+sLCA0ccf6Dg
 3+6CjV4ae5k7aKZYZ2ACjjWFflT+DoFv6ViyDPOtOIYZBgrJNdWOM7mbcm8Aowg=
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5812AA4C56D2;
 Sat, 10 Oct 2026 12:19:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39530)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFUAZ-000000007Mf-0Ive;
 Sat, 10 Oct 2026 10:19:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Price <daniel.price@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>
Date: Sat, 10 Oct 2026 12:19:08 +0200
Message-ID: <20261010101909.1482609-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v2 1/1] package/redis: Fix build with OpenSSL
 4.0.0
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
Cc: Daniel Price <daniel.price@gmail.com>
Cc: Titouan Christophe <titouan.christophe@mind.be>
---
v2: replaced buildroot-specific hack with upstream commit (Thomas)

 ...ecated-X509_NAME_get_text_by_NID-API.patch | 101 ++++++++++++++++++
 1 file changed, 101 insertions(+)
 create mode 100644 package/redis/0004-tls-replace-deprecated-X509_NAME_get_text_by_NID-API.patch

diff --git a/package/redis/0004-tls-replace-deprecated-X509_NAME_get_text_by_NID-API.patch b/package/redis/0004-tls-replace-deprecated-X509_NAME_get_text_by_NID-API.patch
new file mode 100644
index 0000000000..1b9238279d
--- /dev/null
+++ b/package/redis/0004-tls-replace-deprecated-X509_NAME_get_text_by_NID-API.patch
@@ -0,0 +1,101 @@
+From 8bc1c4e147761e7c9d6ff1bb92248b9d4dda43ab Mon Sep 17 00:00:00 2001
+From: Arpit Jaswal <iamarpitjaswal@gmail.com>
+Date: Wed, 30 Sep 2026 07:56:36 -0400
+Subject: [PATCH] tls: replace deprecated X509_NAME_get_text_by_NID API
+ (#15227)
+
+Fixes #15221
+
+OpenSSL 4.0 deprecates `X509_NAME_get_text_by_NID()`. With our
+`-Werror=deprecated-declarations`, a `BUILD_TLS=yes` build against
+OpenSSL 4
+headers fails:
+
+tls.c:713: error: 'X509_NAME_get_text_by_NID' is deprecated: Since
+OpenSSL 4.0
+
+Homebrew's `openssl` formula points at `openssl@4` since 2026-09-28, so
+this is
+now the default macOS build.
+
+## Fix
+
+Extract the certificate subject field with
+`X509_NAME_get_index_by_NID()`,
+`X509_NAME_get_entry()`, `X509_NAME_ENTRY_get_data()` and
+`ASN1_STRING_to_UTF8()` instead.
+
+* The value is still built with `sdstrynewlen()` from the returned
+length, so
+the embedded-NUL CN fix (d22066d09) is preserved and empty fields are
+still
+  rejected.
+* BMPString/UniversalString names are now decoded to UTF-8 instead of
+copied
+as raw bytes, and the fixed 256-byte buffer that silently truncated
+longer
+  names is gone.
+* The intermediate OpenSSL objects (subject, entry, value) are not held
+in
+typed locals: OpenSSL 1.0.2/1.1.1 take non-const `X509_NAME` parameters,
+while OpenSSL 4.0 returns const pointers from `X509_get_subject_name()`,
+  `X509_NAME_get_entry()` and `X509_NAME_ENTRY_get_data()`. No single
+declaration is warning-free on both ends, so the calls are chained;
+within
+  any one version each return type matches the next parameter type.
+
+Upstream: https://github.com/redis/redis/commit/8bc1c4e147761e7c9d6ff1bb92248b9d4dda43ab
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/tls.c | 32 ++++++++++++++++++++++++--------
+ 1 file changed, 24 insertions(+), 8 deletions(-)
+
+diff --git a/src/tls.c b/src/tls.c
+index 4e7d91510..18b780be7 100644
+--- a/src/tls.c
++++ b/src/tls.c
+@@ -704,16 +704,32 @@ static sds getCertFieldByName(X509 *cert, const char *field) {
+ 
+     if (nid == -1) return NULL;
+ 
+-    X509_NAME *subject = X509_get_subject_name(cert);
+-    if (!subject) return NULL;
+-
+-    /* The name may contain embedded NULs, so use the returned length, not
++    /* The subject (e.g. "CN=alice, O=redis"), its entries and their values
++     * are all owned by the cert, don't free them. They are deliberately not
++     * held in typed locals: the const-ness of these accessors differs between
++     * OpenSSL 1.0.2, 3.x and 4.0, and chaining the calls keeps every version
++     * warning-free. */
++    if (!X509_get_subject_name(cert)) return NULL;
++
++    /* Find the first entry of type nid (e.g. CN), searching from the start
++     * (-1). Returns its index, or -1 if not found. */
++    int index = X509_NAME_get_index_by_NID(X509_get_subject_name(cert), nid, -1);
++    if (index < 0) return NULL;
++
++    /* Decode the entry's ASN.1 string (UTF8String, BMPString, ...) into UTF-8.
++     * The name may contain embedded NULs, so use the returned length, not
+      * strlen, to build the proper binary-safe string. */
+-    char buf[256];
+-    int len = X509_NAME_get_text_by_NID(subject, nid, buf, sizeof(buf));
+-    if (len <= 0) return NULL;
++    unsigned char *utf8 = NULL;
++    int len = ASN1_STRING_to_UTF8(&utf8,
++        X509_NAME_ENTRY_get_data(X509_NAME_get_entry(X509_get_subject_name(cert), index)));
++    if (len <= 0) {
++        OPENSSL_free(utf8);
++        return NULL;
++    }
+ 
+-    return sdstrynewlen(buf, len);
++    sds result = sdstrynewlen(utf8, len);
++    OPENSSL_free(utf8);
++    return result;
+ }
+ 
+ sds tlsGetPeerUsername(connection *conn_) {
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
