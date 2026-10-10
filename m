Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84CACA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 08:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 959B76060C;
	Sat, 10 Oct 2026 08:06:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MqyYfjwjQHlu; Sat, 10 Oct 2026 08:06:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7EB1560616
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791619590;
	b=doTwkFEo52bOv/+JXSR4BL+U/uni3vbNkbdYWlfUa/BD0eOuue8qV8IHGnRlbNy8nS3j
	 cjAulRsc7bSYEAFf/6k0VroVNiJ0Hx7zh2PGxT/DluQUUaUEN1iQueBhPfS6iC/BM5F62
	 TiV8yNAreZrdaST7+tlKOuA5MckR1iMwJEMEQChKkN0EPGAjwRSPK1oUZ80kyrb6MjKsg
	 I9Y6TuFWtEH3vR8Em1PVcQ3YiK2Uwv4Q4t3NPceJYFWtAyOJDt5mU23Jf1GNo3ABzsQJr
	 F+KIGLFBYMOFKk/+9jvv+3DBtH7ErgzDxLNcvCPjpKI6p1jmvhGEtOycI0JW+YEniCg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791619590;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ah8B6D/6WTzfLBIM4m1ksaogLdStnU8PvGE26edC3nI=;
	b=cR5mfC3fLx+mYMCGiRSIvtDJTjdPs2Tl2ngsUxb3/QCGXcwJYMKt4XgZ7GrblNU1PSp2
	 foWd9tY6/924buf25Q7r4Oq1Jt6JLIzpJmM/kNs3hWZ8gdvZFQs2OQWQq9PWUHfNx42Z2
	 x1l1zEywzkIf1t/bkKtkQSxj4hK/e38lnIiyOjEwsKS4MiEsny5gfEtPXSc8Ml6umfkPI
	 nFNHMkVf8UASzwgn1G/ZL605DJX9W+4Bl1LBUdQgwukVqcWaOFN/lsTwrzoCguYyE5WRm
	 HGpGhJcoO1LSLEcBamgcmyofyH9SRQEb/0J9/wKh5KD9sHMMb/SmqqHd8Pdja34Qq/A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791619590;
	bh=Ah8B6D/6WTzfLBIM4m1ksaogLdStnU8PvGE26edC3nI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dZGq7beCRC51O2A2qosx9tNJYxpg6DVB0pEnurFp7Mp3p8tS+yK1+UAipcbTigdAh
	 2+Qbv9pSRGDJiuqP3PyKVtrlG3DwQbM6kuPl1Xc2CPRFxEbsA82PQ1HJGEHhhK0whc
	 SYV9k0YGB3tYJetwqqxneHRLo0CrF/TK3ZpRLks5ZhZTiHTaeKD74E5FOHhU86Exr2
	 5ezNjBzrq9zTQkhbLVT2ft5siWsuOU2Oa4NdwCwPdA0QI9QmEpSmvKFMojnT0GmVs5
	 MGj7+62e/zfJo8Z07et8oELO9JLszBpDLB6CQgfmel4Et+lREwjy5wpSWvmDg3Cz6/
	 XQb6NrdEVehsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EB1560616;
	Sat, 10 Oct 2026 08:06:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F9EB111
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8FCE60616
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:06:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u7k5iUQHlMSg for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 08:06:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 125946060C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791619588;
 b=owpIN3NYaRyiM7AYpSkfig+ONZhQY4z5pFDKegHp8z5QFl+HSWzGe3qpH2dSR5+c+qik
 r8b3+UtjRkmeVKPYz9LLz309/5vlcos8Cxutw0VR36ahnriY/2+pLoWp3Ra10/xuFMpOE
 O4ASBrU7MYNbHlQcN5rOdHDwYQkxCj2Ep5iSi3LagauqRU0yVVao0Sj8aZ20sxplXy7sY
 gx5DgS6rDEDuk1Z3Qq6HsALc33YFEKd6Kr8OuHicMvkqi2nNjQpPiSqF5T9uKQ/nuWOp6
 ms2BwRZy++NbpIf19md32O6yY60YPxNi1tmQs0qbVbuH9pkyLmP/bqP4qJmcLnM+F4Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791619588;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=zirY5jdTnh1+bp9eVOy1c/1vX3Tr7HL3c2V/qPyivuw=;
 b=WldxVxerk/2c8x5RhQeKsb8ObzCQ4n3dGMfBmMUygWD0XyHmI58bcH+T7tn2eqT/KzW6
 ye6L4EuTb0MFaSOui0/Mid37Gy33BIMer7YMqTPH5Q+bLAhKkNWjIWbsPyyyy9ECoNi2X
 zIoR3BvYNc6k7wxuo11FdNsozks/idcvL/RRPYZ9WiZ9fSbpqjXJfKObnKB3sqoHr7vRT
 lqQIDh998JlFIxnGQJ4MihJG0ZNJND4zdn4iqYJZU+QmyCot47se15kWOtFDl2YQMEBk4
 OMGSO0FsqXjaa+CIl5jf2psjUfVNAdVt9bTaSMgenEIq8Jfm43V9lsJN5V6cJPq8iyg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 125946060C
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:06:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EEF7D8EE24; Sat, 10 Oct 2026 08:05:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 10:06:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 197dedbd0af29e3a407d082cd5b9cbc7fb79cacd
X-Git-Newrev: 8df2ad69de03c61378a85dc08daa1e9a2fa46920
X-Patchwork-Hint: ignore
Message-Id: <20261010080509.EEF7D8EE24@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/clamav: fix build with OpenSSL
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8df2ad69de03c61378a85dc08daa1e9a2fa46920
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...lamav-crypto-Remove-cl_ASN1_GetTimeT-1731.patch | 136 +++++++++++++++++++++
 1 file changed, 136 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
