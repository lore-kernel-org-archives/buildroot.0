Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2F1CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 262CA4059E;
	Sun, 11 Oct 2026 13:06:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sENiylcPinCP; Sun, 11 Oct 2026 13:06:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 41E2240627
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791723981;
	b=rRHvcZLdjpJNwlV2lQVqXEu0hVyxCh2h4mhDWl8cELVuXYeAUWq2vKbwBEqiRGDmTAlS
	 te1YpPNS79DKFoOBBX6Xkvf4uM8FhaU3D65z11sJ40nmXu9sUbqe/o9VmidKRlrqrIzki
	 96a+OjxoWVlVKvxvUIh3V7hYf/8XTh/n67iaWqsJqjjywM89JFliLpwJo48JeR9Fu05CH
	 UZ3R6z/HU0SQVm39vKczAOsQU2ccEHvBNLXaNRNFC3iS+yAHtgVNkfz9NYycqec+tLOML
	 B9FENG5g+UG0nodw4xf2YWVeOoejFWWqH+3zf1eLleAEuPgTCMs7d+b5MJ3z4vANtMw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791723981;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=yEX3BjaqfXxQPrNNuDEEEqjUQCSv6VO/TyNXSLoNtXY=;
	b=WvXiEyvXXlQ+md71ls2XNMezIjlUGQBBjXrZKyQJ0AV+bTzBFkSnQwA/25RBSiKEGO+m
	 KcTuRRk9oIK1YY0oW9+D0ht6Z/g/UhJmDLccHJMR7ujxCdND37krVpSbeo+a8mvKFymKP
	 sGqM6IRX6xAKwSOBlm82Bh42Df3NfuOEYqOiM06J9hY817FIfmNzgKUpHZq1h2aZGKaCk
	 rqd88YjUPzwsA1XfnIIjWmNqCtsT71YfhaBe0/0YbeEJ+lp4x5K3iCFu3DNWSnQMdo07P
	 x43RBhF+RlH/juwsrFQjfgvBpzbmBRLI3t12w65e3/VKeG8ZMOzhAk0YbnLhwAoUhxA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791723981;
	bh=yEX3BjaqfXxQPrNNuDEEEqjUQCSv6VO/TyNXSLoNtXY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ohHpbnxBV+AFEGAwbuIkUjvEtWcvIV0LCG+7DIBpNVNqzjACA7NnRxrDogb+jKu9I
	 LF/T/hW7blgQWw9nr5ADCl+IN+SlokIw7Dc+mOC84/nPo8eH298muCB9lvhPih+Xvu
	 uRRrDKSt8kxG7z1tFPbEB1zToBNAVKzHV1CaTyFYWD35Qr/b8hEATEdllPKQqhqAmT
	 I06u+06eUQ4sx5vhmd97LKlmu43bWIz/bZilHgkzuIReL4tVY0jvJozXJWDFVoz+GY
	 usw7dDnTOdUV6Y7SXvMZlaUqmB9S+QYEKmXq+XUo+eNROuk9TuGE4Je/HUUfQPE4QY
	 0utdMxuPwwiIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41E2240627;
	Sun, 11 Oct 2026 13:06:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FB8E1A6
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31BED4008B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:06:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YblKqFKq-wyP for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:06:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 31AA74002B
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791723979;
 b=NTRLEflUku52Ur6zpCpbZw1OkoY20NCsQWAXr53/KD552WPtP/pnHZ0yuSnz4ynh9j5E
 wO0fx2XzIg3ZEB/DpB3PtKSHfBlZgzwAMvZQmstUZUNP7qZnumOL7zmNamkKjK/cfpd6S
 nNQeDkLxwcChHSRZyRwB5yKmgmzc+jyiBTQV81yipEckcIAAIlmPVYH4RR4K3KAZTU5WE
 gNZigH5L5cb2Jsx/wZlHtHv/iouuu7kPvlr/52ZEYR5RWn4XvX0XPpR4uf/ggSakPw8Mv
 h/N2looVhcwrKBVi0V3B58YBHxJdmM49CyQl2/Ufh/mqFRLKsUcSUxi7g6tr04ii+3Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791723979;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=oCYK6DtspphvaZUxvLVBn1k3bK1MW5n83cG5bZkQz9E=;
 b=iya9ZI7jmksUWDIg1yzbgNi/QvsgQXZo/IjX2O7xk6+q+GjuDPMhFTM57S6Hy8M+7s0v
 Z4FUXhd3crciUrNtpBNJdk7EexGbmeIP7G3Mf9lkA5xFyAWOLVs3KC5ITUVfgNoOrWdQ/
 MIBwwhqbj72adGu8c58QgMVielR9CtcfuLgPEKr66uKmQZJvsQ3nqfI9QdL0sHl0m5zIn
 9tKDk2rvpIj7P9DPJKZ2+gm2WxkGNrbQLAxfR909CvE4hME2SPtWaoE1WKkDPsNF9IeaL
 6nmOeLrt42wJYONdBRGAq28Yalga9xg5eBoMAi9N7gQVqhIuVVK8WK72IJT0hihJgJg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="HvZR/aoH"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=HvZR/aoH
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 31AA74002B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723663;
 bh=oCYK6DtspphvaZUxvLVBn1k3bK1MW5n83cG5bZkQz9E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=HvZR/aoHoVPY2wt4pIPNk2QVpzY3Bzz2fqVSCsGy8KoN90ONqUyls5MBbqy/+fgOW
 sQ4u8v7eqheQsUwF8TAQxfi92o3vP4W46K3vW8sghqt01Qq0ariQWr8dClJP8kWslF
 k0nXzD2U/AeG+Aq8zsVQvZ2G8yeKVNpku59i38R+rjD7AcQlWE31pQ+mLEQCFmMTJm
 TIpEWlfbCG22WDuoPeBbtQoCJQpMrUS+/6AY+aLCkIpX6ZiqLTuqbAzTq4m3c4h6Io
 l2Wpr0QZQ6SIB7PRYiIA7woUedHfLtqgp8Tqm3TuWk+AXl939AMs2XAOiF/C4QpYBD
 fD9Rpqo2jmp0A==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 IHbrW2s6NG48E1ApllJ232QPqm5RB0ryKwq+Vs79yO5cDGwwo8Dywxs8PsMNY10zoK4AnnUQQRq
 dJgxTHmSQbznCPw1cm7eAXDLx7Gny+RuaXUz/IxFYVtyvcXTfyvHAIL0R0l21dITZftMbJTcvPz
 LOU34JsVaR8EzQjGPg4I4wXl2ZYGceO+UpyHSFEkKgZfPetpmJOnHYIOU9J4O+DY3nDtZCGmmnX
 m8Kb1hsYoV0LTJ4N8yg/B4C8GPUe5wmtm666HH5/jVfc0QIFeZzb9fXefwjwaKLuuHJokX82276
 bjX7rf2gYa+UaUfhepYL5S4eBW06EPHLF4uMAOSNRyIlDBxhf0HORfxx4kLtECUm+1PITvMNAD6
 rFh+J5n8LxLF8fCCPy+aIEZAzMShZsYfoux0vyN1nLYzjdEHvBdd3aSfyddxdS8OWRO9dGiciyC
 tDAMH/Kmtmgs4ltljVRnvFQUcaPAOhLFeQXJFKjMmTxPNkfYdTxBN+mf6ciSkPDKK4CMVsuntNb
 U6FzGQXpeXOsNvM0LM6ejkF8+XAcSBXixlC4ddfQVZjUm4wzkUwFqdvQ+2BGMPrzwuuQRiod4eU
 QeE3CgzxAFJt4Pe1E8aCCZ2xyYZNgVX0g4vJfDZjXJZfUxC84NQto1NWaFSJpcld
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4A3C9A4C586A;
 Sun, 11 Oct 2026 15:01:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAk-000000007Fz-1OaN;
 Sun, 11 Oct 2026 13:01:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Price <daniel.price@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>
Date: Sun, 11 Oct 2026 15:00:28 +0200
Message-ID: <20261011130058.3443432-24-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v9 23/52] package/redis: Fix build with OpenSSL
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
