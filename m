Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F507CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 07:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 074A36061F;
	Sat, 10 Oct 2026 07:33:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P3UVpPtmCopT; Sat, 10 Oct 2026 07:33:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2000D6064C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791617616;
	b=BaT/o6TjlQrlnjsKs0Gf04AUns7WzuH0gP3FACg7QKyJAwUT/X4dxKBU347t2dQUOl/w
	 AWSxRiFVeNhWJ3E+b1kAmPTqCdyvCIga7gTBgOL3mtDWIcrAvgbeEbDQRViP+jFmElieY
	 Z+DM/wOiS0IWWtbqh9QPNKTzBydOh4n3joMY9V2FU3zWAzRTeqTid794IRNlDz2XgvJ0I
	 cjg5TU0Iw4kO0W7fFLGA8u03+xiEUzi5+tRCLVi6c6F/+cvyYsjdcBPX41j4WVrVKg5zI
	 tp8+bv6FjPGwkHECLdG0zRkn8wm+7ezcVk+lzTq1kMoOZeVoZyfLI0DzZnVkJmcczDA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791617616;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4CG/QnhWLNeXIlvLfbEsJBFWjJgnlTJ/i5v3HZcPzdY=;
	b=cW4JMjjifSQ408GsPrruxBC6uMRVHpcRdrDBZEQUzA1z3ozf0ZEKpdhIPfjPFtLmhkVW
	 4HD6ZngsGpFK0WaVhp7NXwKnkVtxiHoj8nXPvH+xJ1oYp2cu2/mYG8BTA9axJFWWUsju9
	 ugpuh9IkqsifT+ztdEUsMgIi9fmn+kkRUVHC+KBlaHhLSGDbwVmLwM8bQEo5elvQ9uugT
	 qxI7LbB1X1SoZAjmMZdwaP70TqF1kQb0V3EGZ9os7pxXO2dRWaJvRjzCPlVds0Wdza2uD
	 n1NczPp5eJx+fEEyvLonlQH1HDUbNmeOunU47Bwfm96DksUO4JWMceTok7MiJZ+UbjA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791617616;
	bh=4CG/QnhWLNeXIlvLfbEsJBFWjJgnlTJ/i5v3HZcPzdY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pdDcdl3AS6mL3UKQKtDIj5CT9Ng5VWfLP928GfqT/j4pf2X9X4bDMahFx+XtgQSv9
	 pMbTSmawY2jXvbfeHYioma0DVcN0wL+9mNCsY0oqJ4kiY+3gXwTDDp2jWD9LcBxhfR
	 J0xvsLZi2g7x0UamJWILoYZ2efmPnwnCznffyyYZ3iZr2ZptKii0QqiBcydhEsj9Bb
	 lcLPEUxd0gSjbnttijT6/tM3dTMPpIghNTzWMF4bV7Nu/grChLaaTnM7grqMn2sR4D
	 CUa3APbvCJYzfPP813hxk8714ttGmPhm0UxqQSbxQM7+uEKsAq2jKAWjPFa4EURJFa
	 UF8uE3G2DhdIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2000D6064C;
	Sat, 10 Oct 2026 07:33:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B3751111
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A574A40894
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:33:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5EP3dO8NiZwL for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 07:33:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D2EEA4088E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791617613;
 b=pbDsLWSYcg1fiDJCCUuuFRjN3RhEzc23L+XJckpZYEbaDchBkBxjMTwMFx158p5qd0kb
 EcZlz+DEfUpNh/0P3VfdBpFzcruLunFx3N3fTJWBaE8pyfC9imFzPB1vI+gU82iPUIDZs
 hjnwbxU7lf0GrrkQbObYUZWHLO9l+m8BkHBrA1iOnPB87aaiQ3Pg5M53AL0LhYW+S2/c/
 EdRge/V+cGdy/3TmxSTZ9P5/KB2M6VnUbL+9UNr51cHDhBW+tKJU+WhcyzD2/VWQU1s1o
 1Wo6/ou4pFYG9Xn+hGC9ldbg8d+IFyazUBHmUFOr6ucgwA+PAT1GWuhhzfsjxyjt8mw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791617613;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=xKH7lSkQPpCCAAt6gXEUqbMHLEx21QBwGG/zo1HWRtw=;
 b=DjxhyRMtYAAsUiudAKflZoQnDglGRqo2t3APMlV/a/oAH8oq9ZY/ZwTz+fGsJmWkuW2G
 Xyzf0udQftIafBMzQzV09EGQPdXpMK0w46DyXCYqHaumGet1JFmE7qEs4b70tT8qBO+pA
 RCkFBxVblBPMzpK7M4mwlyAFqPuTmTvo2HboKRxJa0lOLp5VrhxIFw1nG33sMUQwA/m/O
 lIkem0em8MPk/ZpNQNITUm9gwq5n5xk7PvR2iPvFhFuwHqADql5QmWHCehGumck52nmcT
 q1JxQ6Y7fCNdD3PC2p6Ol5HhnnJmcA/sv3Sy2FeVbg+x4jEA4yp9vjKOVimiwxMEr1w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2EEA4088E
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:33:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B7E2E8E706; Sat, 10 Oct 2026 07:32:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 09:33:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b3321fa8fb14ed55965cd95b5db10ca2e8f0fb4
X-Git-Newrev: e8194b1f22d79731d12dc3fa2b969cf61f5223d9
X-Patchwork-Hint: ignore
Message-Id: <20261010073215.B7E2E8E706@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/snort3: fix build with OpenSSL
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e8194b1f22d79731d12dc3fa2b969cf61f5223d9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-ssl-fix-const-qualifiers-for-OpenSSL-4.0.patch | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/package/snort3/0002-ssl-fix-const-qualifiers-for-OpenSSL-4.0.patch b/package/snort3/0002-ssl-fix-const-qualifiers-for-OpenSSL-4.0.patch
new file mode 100644
index 0000000000..9f4232901a
--- /dev/null
+++ b/package/snort3/0002-ssl-fix-const-qualifiers-for-OpenSSL-4.0.patch
@@ -0,0 +1,63 @@
+From a32587b0fc22a716b70f242f7a130de003fb3b42 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Thu, 27 Aug 2026 11:45:48 +0000
+Subject: [PATCH] ssl: fix const qualifiers for OpenSSL 4.0
+
+OpenSSL 4.0 returns const pointers from X509_get_subject_name(),
+X509_get_issuer_name(), X509_NAME_get_entry(), and
+X509_NAME_ENTRY_get_data(). Update local variables to match.
+
+This is backward-compatible with older OpenSSL versions since
+assigning non-const to const is always valid.
+
+Fixes: https://github.com/snort3/snort3/issues/476
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+
+Upstream: https://github.com/snort3/snort3/pull/477
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/protocols/ssl.cc | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/protocols/ssl.cc b/src/protocols/ssl.cc
+index 733d19adf..4afac05dd 100644
+--- a/src/protocols/ssl.cc
++++ b/src/protocols/ssl.cc
+@@ -860,8 +860,8 @@ ParseResult parse_server_certificates(SSLV3ServerCertData* server_cert_data)
+     while (len > 2 and !(common_name and org_unit))
+     {
+         X509* cert = nullptr;
+-        X509_NAME* cert_subject = nullptr;
+-        X509_NAME* cert_issuer = nullptr;
++        const X509_NAME* cert_subject = nullptr;
++        const X509_NAME* cert_issuer = nullptr;
+ 
+         int cert_len = ntoh3(data);
+         data += 3;
+@@ -918,8 +918,8 @@ ParseResult parse_server_certificates(SSLV3ServerCertData* server_cert_data)
+             lastpos = X509_NAME_get_index_by_NID(cert_subject, NID_commonName, lastpos);
+             if (lastpos != -1)
+             {
+-                X509_NAME_ENTRY* e = X509_NAME_get_entry(cert_subject, lastpos);
+-                ASN1_STRING* asn1_str = X509_NAME_ENTRY_get_data(e);
++                const X509_NAME_ENTRY* e = X509_NAME_get_entry(cert_subject, lastpos);
++                const ASN1_STRING* asn1_str = X509_NAME_ENTRY_get_data(e);
+                 const unsigned char* str_data = ASN1_STRING_get0_data(asn1_str);
+                 int length = ASN1_STRING_length(asn1_str);
+                 
+@@ -941,8 +941,8 @@ ParseResult parse_server_certificates(SSLV3ServerCertData* server_cert_data)
+             lastpos = X509_NAME_get_index_by_NID(cert_subject, NID_organizationalUnitName, lastpos);
+             if (lastpos != -1)
+             {
+-                X509_NAME_ENTRY* e = X509_NAME_get_entry(cert_subject, lastpos);
+-                ASN1_STRING* asn1_str = X509_NAME_ENTRY_get_data(e);
++                const X509_NAME_ENTRY* e = X509_NAME_get_entry(cert_subject, lastpos);
++                const ASN1_STRING* asn1_str = X509_NAME_ENTRY_get_data(e);
+                 const unsigned char* str_data = ASN1_STRING_get0_data(asn1_str);
+                 org_unit_len = ASN1_STRING_length(asn1_str);
+                 
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
