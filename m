Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E68BCC6B03
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 08:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 187C340627;
	Tue, 13 Oct 2026 08:24:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cqmxSHlsKoqG; Tue, 13 Oct 2026 08:24:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1FC0940656
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791879851;
	b=p2ba3kUsOxrw5Lmf48yBllpJoGIM4+zxApE1B9uzM5VTX2gt+1OS1T03/Rzpc2kXyrJU
	 Cdi0cs4zMXiQGW38r4RrS6U8lQiWsZDJkHKNzigR++RUsdITJl7LJNV9RJRqhh6bDGjYq
	 vCmPpRQ78KGkWCqlrpReZl59jrfBY++38g9LsPSrK38mkNMbqF9qOc+Y+vxsa/xl1UpPN
	 4IKv2eS37Hbf2zYbxGAFPCicbTCMCj6q7zkIo13XtFPNnPINCqw5Wk7H5vKt7KNPdQnAe
	 FyG2tWaCIxFzAY+UuWPvZh6PoHRbctNufC802vu/C26G+GCbDV4cgJ8WcORdtmfwFYw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791879851;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=/LMG+2pLyb8mDr+dEJ8MjAdseY5bl/Ua5AxchUazgoM=;
	b=QPbebXZNfBLHXU7DtkDEsPWBiJzpIP9+opPbfWFYMC+1qyhqVDpsiU5QTF7oXnS8bFUK
	 LYkmZxez/GXAx4eh/JMYTr3JzN++L+/hVx7iJr4kXLubOEB36RGm+B89p6/zfgQyl+K26
	 uK2Mjof2Qr5ivLpQC6cgXuCTVrxaNtjHAwYgOm6htuCXI7L7lnPFeYX6FJYgtJq8p1CA1
	 ep/OV90IiGR/r/dzt7rFEzAQ+FY2o620ECHvtjsXPKPFQP4gewKYOtKc21RyYjrUGWTJD
	 N8KwEQB0ZaQLanaB+gVXTupsg2Q9w4nZNXqVHK5MqxxuKG/UTst6d62Dx+HCJbUBdcA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791879851;
	bh=/LMG+2pLyb8mDr+dEJ8MjAdseY5bl/Ua5AxchUazgoM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eOB2+P4Dc6Uo2jFVGe2VK5k6EuNnDg6cNyRjB8bM4JH3+l0xuuFuxylkw4ZE104Rw
	 X/fvFfDFipySmDd+5kvsR89I4Qxbwxr0+dUXkvOCF94kiU9FpT55Q1VuXMSV2rk8E6
	 kBUNUdqVHHmR9awZsGL0OCEX4HufyRxhTjlSLrqahameKNXsZHaaU2UJnaxQkna+Z9
	 hzMayFNFK+EMTUC0HSNcNYX9vXaBCyaR6Lp1S/4rjvKjQFs+NK62458AiHM4O9z6Ys
	 l+EhjL337J3i+t52ofTfbDbeIbCoXq/pCOiugNtq7Xcb/4LnMebhahoG1Ja7MC5Mub
	 ufNaaLXaBwu9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FC0940656;
	Tue, 13 Oct 2026 08:24:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F2281E9
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7578980CFE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:24:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8AODaUY6U1se for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 08:24:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B1C9380B33
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791879849;
 b=Gzv555gkcTn9ltRnHyNQJ2TpNGtlqwMtfGp5f3Ihw0tkci6hbZYxRyPr6qyI9Wydd/J3
 poyQxamHqcbCFBFcpYDXZ7Eyquoeb1i4PzQ9v03KoBMJOqy2oIkCvTb9Kwj03P/ST6esK
 kXJMdQfP6ARw6lLULhAgoJrDQFoe8bTsJxsvbvZ4fFwaaiKzefnV5Rm2XGetopODh4gyP
 f9zFS/Yu9jo5lF/qWt0Z0BFKLAQuSvrWVu7J5GOXpKGx0Cd3kOULcQvB+Fy0silr7awYM
 whZ0b15I7k1ENfZlJiWj3GK3emfso8FqwlvsNCe7sVwYlqCFnYz8L1WNqx+0JgNaA9w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791879849;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=PGP43ZYtCnDzfMs4j1hgNcBVl77WCm4F2o1gu9jY3Xc=;
 b=kQolOUxUPCSG2LTxxocwJgb1Sfc63uSiodiwsXAvchvAhif1gkXaFS1JpBGputXmdne2
 eNjBlEdDZsZY8YD2vfzZC/0XBDqIWwwF8JAZC3duQvMeSkh19qIWFlOlJK6jUoCt1hAyU
 EfxqoAICrQYCWYHpiN7mDgVr5igzKQZD98opYJfaBtmLkBWLmy83mZLeM8d34JjqvLD0H
 SWZWJlulsWQOZ80B09PV0HwQNyU03lBNR/BN26XKJTV/4Wj+U1jlZyt9BZoDBY6nehYvH
 MGQqFKDtriAQWEhCZl2Gd2m0husx6HKY6kvFSgwQAaSKwJgEfoCejSjjM1cmd1Maghw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1C9380B33
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:24:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 22C0C95499; Tue, 13 Oct 2026 08:22:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:23:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f87cf2d6239d676147dec1fef088d81ee873277a
X-Git-Newrev: 0adedbe86909621381bd758cae000ea41665bb05
X-Patchwork-Hint: ignore
Message-Id: <20261013082250.22C0C95499@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/znc: Fix build with OpenSSL 4.0.0
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
Content-Type: multipart/mixed; boundary="===============5970783316714537803=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5970783316714537803==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0adedbe86909621381bd758cae000ea41665bb05
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Cédric Chépied <cedric.chepied@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Fix-build-error-with-OpenSSL-4-2024.patch | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/package/znc/0001-Fix-build-error-with-OpenSSL-4-2024.patch b/package/znc/0001-Fix-build-error-with-OpenSSL-4-2024.patch
new file mode 100644
index 0000000000..1dc7eb28fb
--- /dev/null
+++ b/package/znc/0001-Fix-build-error-with-OpenSSL-4-2024.patch
@@ -0,0 +1,57 @@
+From 94bcf919e1163564e637df8d437585bc7b55e7aa Mon Sep 17 00:00:00 2001
+From: Ravi Kant Sharma <rks1986@gmail.com>
+Date: Mon, 29 Jun 2026 20:03:27 +0200
+Subject: [PATCH] Fix build error with OpenSSL 4 (#2024)
+
+More details here https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1138356
+
+Upstream: https://github.com/znc/znc/commit/94bcf919e1163564e637df8d437585bc7b55e7aa
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/SSLVerifyHost.cpp | 4 ++--
+ src/Utils.cpp         | 5 ++++-
+ 2 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/src/SSLVerifyHost.cpp b/src/SSLVerifyHost.cpp
+index ccc20898..99b215bc 100644
+--- a/src/SSLVerifyHost.cpp
++++ b/src/SSLVerifyHost.cpp
+@@ -306,8 +306,8 @@ typedef enum {
+ static HostnameValidationResult matches_common_name(const char* hostname,
+                                                     const X509* server_cert) {
+     int common_name_loc = -1;
+-    X509_NAME_ENTRY* common_name_entry = nullptr;
+-    ASN1_STRING* common_name_asn1 = nullptr;
++    const X509_NAME_ENTRY* common_name_entry = nullptr;
++    const ASN1_STRING* common_name_asn1 = nullptr;
+     CONST_ASN1_STRING_DATA char* common_name_str = nullptr;
+ 
+     // Find the position of the CN field in the Subject field of the certificate
+diff --git a/src/Utils.cpp b/src/Utils.cpp
+index ed2c9c83..744f61d1 100644
+--- a/src/Utils.cpp
++++ b/src/Utils.cpp
+@@ -129,7 +129,8 @@ void CUtils::GenerateCert(FILE* pOut) {
+     sEmailAddr += "@";
+     sEmailAddr += sHostName;
+ 
+-    X509_NAME* pName = X509_get_subject_name(pCert.get());
++    X509_NAME* pName = X509_NAME_new();
++    if (!pName) return;
+     X509_NAME_add_entry_by_txt(pName, "OU", MBSTRING_ASC,
+                                (unsigned char*)pLogName, -1, -1, 0);
+     X509_NAME_add_entry_by_txt(pName, "CN", MBSTRING_ASC,
+@@ -137,7 +138,9 @@ void CUtils::GenerateCert(FILE* pOut) {
+     X509_NAME_add_entry_by_txt(pName, "emailAddress", MBSTRING_ASC,
+                                (unsigned char*)sEmailAddr.c_str(), -1, -1, 0);
+ 
++    X509_set_subject_name(pCert.get(), pName);
+     X509_set_issuer_name(pCert.get(), pName);
++    X509_NAME_free(pName);
+ 
+     if (!X509_sign(pCert.get(), pKey.get(), EVP_sha256())) return;
+ 
+-- 
+2.47.3
+

--===============5970783316714537803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5970783316714537803==--
