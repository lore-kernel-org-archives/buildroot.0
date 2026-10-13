Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA432CC6B03
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 08:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C1A9808A8;
	Tue, 13 Oct 2026 08:19:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1l4rhrq6NsEj; Tue, 13 Oct 2026 08:19:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 65B19808C1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791879548;
	b=VVq4SQKLFDTIuDB4Qg6pzokrhCZkleq+7xgKf8IBCfTQCSZzaNYyI/EgUTtHwO/7tvL9
	 aQcgDAmdEcsOukQZJMdV5eZWUwUmQlyvQAGq9+4gB6tS5dk20lQOwLCIPFGZ+G5qY12Se
	 NOsaLNJeskL0pPMmuZ247TZZ92CAyqPvd40nP4K21YL3iLCNihDfdnimKQ6B8z9eZkeKp
	 N8Qp2zWO8SBe9G+0k0SYzgvsuopTQRyTZkx/l6PSx+9KN5dMmooMSeK0kGLTLvR6NpwRV
	 tbZ2SSoRZ4iCQF8DP8zuuNwPOC+6wqgiBjb621L02Aklgod9DfP1G+TJMg9R328UeLg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791879548;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ib7+DIiDjC5A7NyO/xnV4UzBFH7R2u0OS551hlsctaw=;
	b=rTCw42vqFwaavGGXeIkEVTsZpEjrLxo6EXlZ6Hh8xeivno7fVCrOAZ2VjTSD19//bSNc
	 VwFiC0Q9HlHWeGa8ZMN8juA0FWx7NXwMwh4HOYVbrBHT4Xv4zl5itd/cu3mvDa+TTvTE8
	 kJ4BTbsW4vgzj+UFmhUut+es4QA/FN7ZnUviem7tCu97aAijVDvORWLsDmEaB8AYBSFqZ
	 OrOQXrc5cW3kY3kdBmA2P2aUwRfo3v6Ru1aebxyXscZYRs3su6ilvO8wT+1jlEMZireEs
	 ZFams99Ki4n1sOLNmJ9u7ZnHIcKo4crGBmVsTME0uRWpMaXJ8UkJyHcW9Jq2mNJCHWA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791879548;
	bh=Ib7+DIiDjC5A7NyO/xnV4UzBFH7R2u0OS551hlsctaw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jE6cSey7bZfl+rGKYYnUppFoh/ge5AffzmQ1nEvKGgIPiUxDoyp45LBRp7kDxVE2k
	 8zplTIUqv7F0qBgDM1PsDc1uLQgZlpxaoYISIAm9sqxmjp6xyEcMYph7hrD9qaQHP1
	 tFFlhxj/1w5amAY4o2D5XP6qnquE3e3X6OjBgWsDX4ddxCLVxrzaBj+sao3VowInT/
	 uZUWnm8LYif5+qdbrpjqa6pbFEUvFHouKVscL0qChzhPDYTNduvwBbGjaSRWOI2cOP
	 y1KIU/XmZV+sMXCIn7xzSClSe9n4BNS/RrQE6BYg7iMFPwGg8J2W2owDwuM0yf3QVE
	 5uRZ24AQ+U36w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65B19808C1;
	Tue, 13 Oct 2026 08:19:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F4B9788
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D19D808A8
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:19:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BU6XGXsRxxyb for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 08:19:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6E0CC808C1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791879545;
 b=F7tw6ZOt9e5F5e5nmN+WUiJlvjPycLFQX9ne9UIsRVB3JcYRqjObFZS5R7549eWwUfZ4
 lv602DK3aKEKWgOs61gYR8Ngo3s6pN2jRstQ3WYzXmrm8q+GN46gThSQfG3G3F9I4WNIi
 MdUxmQGHwCcNXz4FfDoMBxsZ+sufov+NqnezvyWiv3MZrAZsGllVaUikfZsfqFz0kQjci
 KD2L/Zh48v6MP3Xc11LgNZH+/kgKTel4/P23/RYSR67KwwNcTv4mF+kZAoO984UgUKUGV
 F2T5atM4G5i3IhClk+znOT1B1agcsiKnOYgFT1FoVJY0+YpmopIeo1sKbInLkiwBlFw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791879545;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=qWzQ+CUEC6jbdPKV6uewHn5PCnaTt0YPhrC3DDbQMXE=;
 b=KS9jGfeMsCAe4qJzYbD9snRDkkGXYkonyO4whv5kPxHSqZM0ZaizJPnTPZD3eN8HxhMd
 5PgpfL86uch9oV/UANc4dftJs3oGsGVzxxI6bI8Gmda+RRA9/kV+4btwhZ3sY2Ce6xE0I
 JiCn+qSS9WH7WKkWicY+CaI+Y8kLDUp9yirXJtec2nnwp92y0mGDkEDC4q1BBRG4/evQw
 HWX7H7YPp+ZM5+UYh+mMYIh0AGjA3Jsedk20IARr0rYaXikA79F36rwqBpfpn37ebwplg
 lv2i7600/EQBSGeeSKNFpHk46InBuBDL4CS3qKGjVbRcW0Rl4NttfwDrG32HKJPF61g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E0CC808C1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:19:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D4A26953AC; Tue, 13 Oct 2026 08:17:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:14:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 471feacb2d9c13190d635721208b9d31e995d04e
X-Git-Newrev: b68c9948881ad9fa3414bdf021ed1ad97d4a0128
X-Patchwork-Hint: ignore
Message-Id: <20261013081745.D4A26953AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/redis: Fix build with OpenSSL 4.0.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b68c9948881ad9fa3414bdf021ed1ad97d4a0128
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Daniel Price <daniel.price@gmail.com>
Cc: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-deprecated-X509_NAME_get_text_by_NID-API.patch | 101 +++++++++++++++++++++
 1 file changed, 101 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
