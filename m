Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3032ACA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 08:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D7E4608DB;
	Sat, 10 Oct 2026 08:40:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XxdbmT1YT5Eh; Sat, 10 Oct 2026 08:40:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D2A956066F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791621653;
	b=l74Sw/+VoXXofuTisVgsVAG+CckTN6OEVxUR2aqWgPwn4v1rwRZLsr8yO+wZcKd/kxwH
	 I2GwGHzrcoGrcdEncEi9HbKL/aOuE7boDJ/SmnxA6f5umizelDr6pE6PkmZ0hQxE3psgg
	 yEGQMzpCEvzkDyOxoJRw0EoOgsDUYYIs67FnNO6kr4Zq5vwHppHM6+aci+6h+R/KMkTzF
	 mXG6g25Ky/eo+hKL7Cq/nSGzlxnA2kyg3mwr90ngtiZ4uc6HJGXdGz2r44BXss+t9hk8o
	 dJjuQ8ePbTN2hPFGzYGpsd+2GsyVr0wmilHdM6aW7a8vj14chQuHppt4ox32nqdDZ3Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791621653;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=b9HB52ubHC1XdRbOIvDB4JbW9ETvSnh31T7VRCtMHWA=;
	b=PZq97JimHr7MeMH9mY8RNEE1eHndgIdd8rpaAgWWY5iNuMkXxxqfDA3viYqoimrfutiD
	 suREA+LK6NYod1EJazPbCCK9AuEZjIOXzwKYGYzx1vdGRUaIpiKSZwkgKxD0opLuvbQsy
	 6FXtiIpcOZEq0JtYOeM1sqVRWCm49Y6YDMCyNn1iXzoAcqjXfhniRqIsBAX8Oh8AZdt7d
	 RfHPIllVmYGaHzwOtIn6zOwMe6XlARvFplMfSdz5AqdPu23TDx7suOOmlRvbcJNAqX/Iz
	 cghRyYOsnxlxRfK62Iy6vMtkTpjjnCwA0rrDmfCAyd0v36K9ffkhimwJtzknRpFpV1w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791621653;
	bh=b9HB52ubHC1XdRbOIvDB4JbW9ETvSnh31T7VRCtMHWA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ovZvQeMTXXfwG7N1vvNvpLa8/0An2XaXk4FOFG06C2sL7JpleVgM4EI0oEx4T280p
	 jek1S81DZnmrVsprNtpthbrSI70ALxtnZxjhvrd0AIx/JEHihxZh5VtEHcHzw+LG4L
	 tZUZpR1plZgeTWoj6eP0ZoIRpw/FHSJpz/pWQymJm81Oz/xq06I9l+wWrOqVtb6440
	 QtGEkFGyvN0KjwIP5inqyGBvNzrUmZwzNgxauQNwkCNcqsICKTI+cr6WyrTdojrbE/
	 jH3MO0VaM5qOkBBIhCAxjlVr5VFAul65DmHhPYcEpZI3jsJTW0ExRl+ML+uCRpLprE
	 FUgyqb4NAelxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2A956066F;
	Sat, 10 Oct 2026 08:40:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D344111
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E716A813F6
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:40:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e-awrGoYLfGl for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 08:40:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 42685813F1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791621651;
 b=JvNd7A0Ti64C/5589hYMy6GCqymn/shKqzQkDyXD0LgajMIukBuld+7Pot4PGxxtnuna
 k3muj2QrU1d1T2gIrtvf09pnDt+Rt+tYhyIBULpQWD4uVwBxH1dG3DzYIy3y1DlZWw7lH
 vPiky9EfoD28rE6cdRoAZ7zrMpclZ/PpA4gwVwtvcag2np5C59ytp46tkMf9mc6dNdHAu
 tygLfwtJD4IwaPgB7vDxj8iAPV58dcyn8SbHe1ehl09cWnkCf+ZZj7lSAChFcayVEZuGw
 SgXn8eAJGBIuOKgzJoJ5WntcHVPWee2CvWDfAkoG1xN445SgQCc0VaWAlSF2z5H4Zcw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791621651;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=xc+0eqxO8gqnr3GON+o/HAxQMQ3bypI7hXkfQQQ94OE=;
 b=aCLqEUHyd/eugsFFZ95d/7KkfwrES7GjLfftGGYNW/wHAylQqOTtvmsjxXsPpUUGp+wE
 AZ1OwqsVxRr+WXcS0ynvaINz/WRnfQ3wgiKiel2w2Tz5U7FBkBTl7lP++KvRCUupekzCP
 3oW5IOsahFwdBjwiyB4K8Qsw6jE5uzsM8jP+1k1aBzca0XEIzjaXm125Zqd/3OVX0umr6
 W0IR9MYSsGAwY2huGs77T04z/i15IPM/I6iRHGofr7R6Jqs9q19/xE9gcynL+9t6e1MPg
 ysgBovDbE+L7LtXKPuUmziAqA/Va42sVhiQAVBgalxoRTEl3q/Q9MDt5b345DOF36KA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42685813F1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:40:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2307F8F01E; Sat, 10 Oct 2026 08:39:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 10:39:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: daccdecf26112c31be424f087e6d0b2ea1068e64
X-Git-Newrev: a16d792813d4c06de7745057c5b65496f30b05e4
X-Patchwork-Hint: ignore
Message-Id: <20261010083933.2307F8F01E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lftp: add support for OpenSSL 4.0.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a16d792813d4c06de7745057c5b65496f30b05e4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../lftp/0002-allow-build-with-OpenSSL-4.x.patch   | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/package/lftp/0002-allow-build-with-OpenSSL-4.x.patch b/package/lftp/0002-allow-build-with-OpenSSL-4.x.patch
new file mode 100644
index 0000000000..258d08fb2d
--- /dev/null
+++ b/package/lftp/0002-allow-build-with-OpenSSL-4.x.patch
@@ -0,0 +1,56 @@
+From e5d53bcb31b1f3792c6ab321e20d566b9a4ff0a5 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Sat, 21 Mar 2026 03:56:46 +0000
+Subject: [PATCH] allow build with OpenSSL 4.x
+
+Upstream: https://github.com/lavv17/lftp/commit/e5d53bcb31b1f3792c6ab321e20d566b9a4ff0a5
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/lftp_ssl.cc | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/lftp_ssl.cc b/src/lftp_ssl.cc
+index f53edf24..49328f74 100644
+--- a/src/lftp_ssl.cc
++++ b/src/lftp_ssl.cc
+@@ -1022,8 +1022,8 @@ const char *lftp_ssl_openssl::strerror()
+ int lftp_ssl_openssl::verify_crl(X509_STORE_CTX *ctx)
+ {
+     X509_OBJECT *obj=0;
+-    X509_NAME *subject=0;
+-    X509_NAME *issuer=0;
++    const X509_NAME *subject=0;
++    const X509_NAME *issuer=0;
+     X509 *xs=0;
+     X509_CRL *crl=0;
+     X509_REVOKED *revoked=0;
+@@ -1436,7 +1436,7 @@ void lftp_ssl_openssl::check_certificate()
+     unsigned char *nulstr = (unsigned char *)"";
+     unsigned char *peer_CN = nulstr;
+ 
+-    X509_NAME *name = X509_get_subject_name(server_cert) ;
++    const X509_NAME *name = X509_get_subject_name(server_cert) ;
+     if(name)
+       while((j = X509_NAME_get_index_by_NID(name, NID_commonName, i))>=0)
+         i=j;
+@@ -1446,7 +1446,7 @@ void lftp_ssl_openssl::check_certificate()
+        UTF8 etc. */
+ 
+     if(i>=0) {
+-      ASN1_STRING *tmp = X509_NAME_ENTRY_get_data(X509_NAME_get_entry(name,i));
++      const ASN1_STRING *tmp = X509_NAME_ENTRY_get_data(X509_NAME_get_entry(name,i));
+ 
+       /* In OpenSSL 0.9.7d and earlier, ASN1_STRING_to_UTF8 fails if the input
+          is already UTF-8 encoded. We check for this case and copy the raw
+@@ -1522,8 +1522,8 @@ int lftp_ssl_openssl::verify_callback(int ok,X509_STORE_CTX *ctx)
+    if(cert!=prev_cert)
+    {
+       int depth          = X509_STORE_CTX_get_error_depth(ctx);
+-      X509_NAME *subject = X509_get_subject_name(cert);
+-      X509_NAME *issuer  = X509_get_issuer_name(cert);
++      const X509_NAME *subject = X509_get_subject_name(cert);
++      const X509_NAME *issuer  = X509_get_issuer_name(cert);
+       char *subject_line = X509_NAME_oneline(subject, NULL, 0);
+       char *issuer_line  = X509_NAME_oneline(issuer, NULL, 0);
+       Log::global->Format(3,"Certificate depth: %d; subject: %s; issuer: %s\n",
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
