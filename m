Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A580ECA5FA7
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F48A81131;
	Tue, 29 Sep 2026 18:45:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S2B--O-ARRe4; Tue, 29 Sep 2026 18:45:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6984B81128
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707519;
	b=bEcqHJheLOiux6gWE7BK9dINT+l1Quxita/j6O4aohdNeOerxq3wDwXgcveiSmBij0w9
	 wR4cU9H9mLGKBC7BfRknXHuYPjuUhhTI4Joij9/hi+n9kMeUzQVtdgWKk2HGIUdiLYR+n
	 AYOoquhAWgopcKatg7lssFW/RGdET/7dPT+Br94r3V1VQILCUUP0ZCI9DFJJ85wo5IKPU
	 6Ls93OFjuzyxiSk8y5IjyuTOsxEs4Ei5WCwVLuHAlOMUQ5mv2yDbwl9Py/TzOKZZ2n4pU
	 topTxEVmDRtPiMxPckyyO8YGd5tYrnwEed6AzVKsO93tcMbTjkW1ukiWqRY8uH1n9Ww==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707519;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=H8P85J2FOnuEAUjhO6ResMDATOR9OFP9x/ckxRw8Zv8=;
	b=T0xTp2RTh0zY7iUXOEh0bOwED1JCK7E4DS7ngvvxlT687LMIgAXc94qNtircgzje1j65
	 KPEmY0NcWg2C2SvKMrwOK1BCk6ann0yLeRzuedCvpzFOWShqXfuZITlTurIvbcqYpCkKu
	 EWJd+mOmfu7xmA+WZ1rxZUhO8Womb3kx0ZiginW4476Br5UvEeR+jTI2wwYOaiRwtnXd4
	 qv99FC+Tuj9u1dH9qfbU8hVFhrMYwyu5aXL1vsw4yzmMpqcsZpfMGt4Y/MkiCEGFwf9uy
	 iGT2zZU9aq8CIciOq2fXAukai4qp03mixJDYqLCLd5nnTS3CAMxMXx0z9ZDK/DhgJIg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=Oveo+3QR;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707519;
	bh=H8P85J2FOnuEAUjhO6ResMDATOR9OFP9x/ckxRw8Zv8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gkdABqaEf0Tqn0ZohqozE8vJ2wexJwSRv54700kyPbdzBQjkA7sEfkrwInFCKUPID
	 oxwwMh5ZXNcU4/3/ogwrorbtyXxtkHLktbnFFi6KaMjO4MDuhpU2LM2tHysk5ZKkWm
	 z4mCl/Y0HI8BinsMqXaTpI/y7Avg8hwwEjw8HLLQk6/eSJsJIKXTl3kTm/06MaeCkG
	 tyJQ5VVFOvdhOJPx2WwaGhMg/fDkZIlsZzC/s+jUF3ZprHFLzMRlspTvKhZReUL3ZA
	 B64LhlppvN4WV450BEEcjs/R+iTYVIEOhiAuFOllPZqFBs4DskYM8NUG/Dngueldhp
	 9sYFeG83AkIMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6984B81128;
	Tue, 29 Sep 2026 18:45:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D5C514C
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E756C81128
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:45:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7uwPRYH6c2BG for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:45:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DE5BD80ED4
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707517;
 b=c5K560xHANa1AwLQkP0IYBcWXP6UW9fZ65yXtcVpwFHK8keN5BL59z8repIlceYufW0f
 yvtVHSlo9o+5kUSeu4VQ2eoCopf4pRgogerRg71xgwfPELXDiX+NwuocUUFEnhIHqO3mz
 5IToeFulsizbbEPUobw4EkXkENSXF2UWxDDzv+/GHibCjK+o1mtNtIGUluyJUJqMQiZMG
 kZJh+yxiex8hmxnDOba41ftZQfgdi+/j7LP5/x7HBCIbM4I+qWXjoXLhAeKm0LWYQDvfK
 pVsv+BBuT5DOAoA6uOplQyIEvSRJHN4TC3s462jkoMAyZy7q/FO48/EeJUH5pgI/XqQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707517;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=hN+rkTfMvgGwGDUF+5ypUCKmRadn4RPSM3EwGTgPJCY=;
 b=C0XzOzC9oioS8FncBIMg0ARlfTuR/MXRrY/pLDkzsMGx4p2sYFZ7zbaaYGvyZqd/Y/SM
 1hKjrfAU55MvORnHeTMVAfzFdgOig9+YLrG+hpKiYMfdtmaAU2WFLc3TxomSVpO+SCFZw
 pJtS8YgMhufWsjA2AfDlAgl+sBjW2iKfzve/C1ujVpFUGyCpoJSUvTeue89iu1Jt4u/qZ
 zGC7zHqKcSuXAGGIC/8rP61B/79xVRnNIH+jRwW0UUSYeUEZuOKuY+NB7KSTdUOs43Cag
 ZQqikLOm9MI7tVHIN8s+bTcdqg4DP5YKPHTgafwqilP0KaXncgO8lkWRqJeaNYY3Wcw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Oveo+3QR; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Oveo+3QR
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE5BD80ED4
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707029;
 bh=hN+rkTfMvgGwGDUF+5ypUCKmRadn4RPSM3EwGTgPJCY=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=Oveo+3QRhU68I/q7y0VvaXhtt+WeW6+pPsR94V3SAXak0p5Jrts4y1U++nMrWrVUd
 XAFfLcj1JdrYyHbpVqeM9/Ip1Pdzrf0ZPYTrrG7oIwNHN+arJrIGzIC1a+d438U6eD
 kfwQOxfsw1TxOzdS/TZ2MKp5XnBvD/zAQ96lRb3Pzzg3gugRSiv9vdfSO6p6nwDTdR
 q0qfruT4XDHyKi5G0S2EBUrCQT7QCGL3CdcYL+ppkMARaXwtuqOitznpjXzK74u+qh
 ++xsvI2tR+gylbip6AVMRhdW3qmuOqAeVZIAPVIBvDV/GlYMaahKZzxybEhZbyFzeW
 1xtqafe2ZG0CA==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 57VJA/dUTjWFkhjoIssPs0QkzLg0kr4DmXoturdWVYrLf6KU0P3c6u1cxSuIxUYsDoEhPL+FONP
 4dJkDzOsglKKPCvP5WxeFTwGJ2NKV9GuOtMu0ThZLZ7380Ad1rdSns69GJr/lLQOfOFUSPxiXWC
 PDkT1m5c+aK4CWexAdxN6OAt4bt8Mk0CiRVeBNvC8URzDdGhxA0UDeYKqvE3Ofpxd467Z/LN2+4
 ogcGBZPtp7xYL1q8lTjlo0PnBF7nwQQQhepnWxkXR5bIUFJ3a93c1fm+OmZrMI7RHk462vZH7Ew
 DjaoQ/NN2OZMKwANWR6bCBfSlrI44AuE3lrtyv0SiBpq6VXl8nGKJNQHG6qPKLeZW5pB/M9s3ko
 erY10TZnjXVDTIuoJ0eBHOyX7GQZUYLC3QHspzFYoTG6tOMOyAucRo+EN6/ZGbeTVgXpGPJAYoC
 9eVX+XiXm1j5Td0HgZZOWXLaqUSJVmyp2rUZ5Cz6Axsg/NUwNYhM/oXP9DvTfGw2mvxqiILdHZk
 jB41Z/HKmElWG4HGz6i9ZPs3jHfTk9DAw0RjC3We2fbCRbQC6XNd1rDCIew1bHFlziJ/ZhLCkNp
 FKwYsQE=
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 60D6CA4C51E1
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 20:37:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgi-000000006Jn-1Wnf
 for buildroot@buildroot.org; Tue, 29 Sep 2026 18:36:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 20:35:34 +0200
Message-ID: <20260929183607.1849293-36-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v7 35/66] package/clamav: Fix build with OpenSSL
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
---
 ...-crypto-Remove-cl_ASN1_GetTimeT-1731.patch | 136 ++++++++++++++++++
 1 file changed, 136 insertions(+)
 create mode 100644 package/clamav/0001-libclamav-crypto-Remove-cl_ASN1_GetTimeT-1731.patch

diff --git a/package/clamav/0001-libclamav-crypto-Remove-cl_ASN1_GetTimeT-1731.patch b/package/clamav/0001-libclamav-crypto-Remove-cl_ASN1_GetTimeT-1731.patch
new file mode 100644
index 0000000000..60e29a1fdb
--- /dev/null
+++ b/package/clamav/0001-libclamav-crypto-Remove-cl_ASN1_GetTimeT-1731.patch
@@ -0,0 +1,136 @@
+From 0097a6f99d9f6b78381e12b677a38fb62242c41a Mon Sep 17 00:00:00 2001
+From: sebastianas <sebastianas@users.noreply.github.com>
+Date: Sat, 1 Aug 2026 00:13:13 +0200
+Subject: [PATCH] libclamav/crypto: Remove cl_ASN1_GetTimeT() (#1731)
+
+The last user has been removed in commit fa15aa98c7d5e ("bb11594 - allow
+for compilation against openssl 1.1.0"). This function is only exported
+under CLAMAV_PRIVATE to be used within clamav, not by external users.
+
+Removing the function will not cause an ABI break since it was not part
+of the officially exported ABI. As a side effect it will compile against
+OpenSSL 4.0 where the ASN1_TIME type has been made opaque.
+
+Remove cl_ASN1_GetTimeT().
+
+Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
+
+Upstream: https://github.com/Cisco-Talos/clamav/commit/0097a6f99d9f6b78381e12b677a38fb62242c41a
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ libclamav/clamav.h      |  8 -----
+ libclamav/crypto.c      | 65 -----------------------------------------
+ libclamav/libclamav.map |  1 -
+ 3 files changed, 74 deletions(-)
+
+diff --git a/libclamav/clamav.h b/libclamav/clamav.h
+index 8a3767f78..fa75677ad 100644
+--- a/libclamav/clamav.h
++++ b/libclamav/clamav.h
+@@ -2413,14 +2413,6 @@ extern int cl_validate_certificate_chain(char **authorities, char *crlpath, char
+  */
+ extern X509 *cl_load_cert(const char *certpath);
+ 
+-/**
+- * @brief Parse an ASN1_TIME object.
+- *
+- * @param timeobj   The ASN1_TIME object.
+- * @return          A pointer to a (struct tm). Adjusted for time zone and daylight savings time.
+- */
+-extern struct tm *cl_ASN1_GetTimeT(ASN1_TIME *timeobj);
+-
+ /**
+  * @brief Load a CRL file into an X509_CRL object.
+  *
+diff --git a/libclamav/crypto.c b/libclamav/crypto.c
+index 8b398e402..968264811 100644
+--- a/libclamav/crypto.c
++++ b/libclamav/crypto.c
+@@ -1746,71 +1746,6 @@ X509 *cl_load_cert(const char *certpath)
+     return cert;
+ }
+ 
+-struct tm *cl_ASN1_GetTimeT(ASN1_TIME *timeobj)
+-{
+-    struct tm *t;
+-    char *str;
+-    const char *fmt = NULL;
+-    time_t localt;
+-#ifdef _WIN32
+-    struct tm localtm, *ltm;
+-#else
+-    struct tm localtm;
+-#endif
+-
+-    if (!(timeobj) || !(timeobj->data))
+-        return NULL;
+-
+-    str = (char *)(timeobj->data);
+-    if (strlen(str) < 12)
+-        return NULL;
+-
+-    t = (struct tm *)calloc(1, sizeof(struct tm));
+-    if (!(t))
+-        return NULL;
+-
+-    if (timeobj->type == V_ASN1_UTCTIME) {
+-        /* two digit year */
+-        fmt = "%y%m%d%H%M%S";
+-        if (str[3] == '0') {
+-            str[2] = '0';
+-            str[3] = '9';
+-        } else {
+-            str[3]--;
+-        }
+-    } else if (timeobj->type == V_ASN1_GENERALIZEDTIME) {
+-        /* four digit year */
+-        fmt = "%Y%m%d%H%M%S";
+-        if (str[5] == '0') {
+-            str[4] = '0';
+-            str[5] = '9';
+-        } else {
+-            str[5]--;
+-        }
+-    }
+-
+-    if (!(fmt)) {
+-        free(t);
+-        return NULL;
+-    }
+-
+-    if (!strptime(str, fmt, t)) {
+-        free(t);
+-        return NULL;
+-    }
+-
+-    /* Convert to local time */
+-    localt = time(NULL);
+-#ifdef _WIN32
+-    ltm = localtime(&localt);
+-    memcpy((void *)(&localtm), (void *)ltm, sizeof(struct tm));
+-#else
+-    localtime_r(&localt, &localtm);
+-#endif
+-    t->tm_isdst = localtm.tm_isdst;
+-    return t;
+-}
+-
+ X509_CRL *cl_load_crl(const char *file)
+ {
+     X509_CRL *x = NULL;
+diff --git a/libclamav/libclamav.map b/libclamav/libclamav.map
+index 809341f42..f3efe1a33 100644
+--- a/libclamav/libclamav.map
++++ b/libclamav/libclamav.map
+@@ -271,7 +271,6 @@ CLAMAV_PRIVATE {
+     cl_verify_signature_hash_x509;
+     cl_verify_signature_hash_x509_keyfile;
+     cl_load_cert;
+-    cl_ASN1_GetTimeT;
+     cl_load_crl;
+     cl_sign_data_keyfile;
+     cl_sign_data;
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
