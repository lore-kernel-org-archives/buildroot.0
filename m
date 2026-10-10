Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FADCA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 08:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A40A813F1;
	Sat, 10 Oct 2026 08:39:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nH-ZqNPlE3yk; Sat, 10 Oct 2026 08:39:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7B478813F6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791621592;
	b=rCAemv/TwCm01BqrMDggYwNubS3BTwQG9JoCi3yqdvr0wCm9WSWF4XiQfb6qR7mINf9c
	 yMDn1r7TqMHOK7QY3EDeCOg8n2369zj4cS3oZushw5RIhud9s5KsGFcIcFtuSqmXBBGx4
	 miqYrJo0vhPtoL6ROwXAQFk+TyzL3S3ZR3FvHlbJYUr4qxSriU1FYLDSYaDuF02Iih/5A
	 k7WF+sXUo0RDiGSh5n/UbFiiFMye+2H8s1u+RSbjlfSfKFBj27KC0RS6mJ9tnAMsciukm
	 KIk+KB/P/vWXm4QSUeKFxLi+zH/ecN3HkQ4xETJpaLeyhst3HgdBhN9ubs5L7kRnKXA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791621592;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=1WhmHV46kgV/e5H+KIt+jtP328rB5B8j+JdW2D/7NBc=;
	b=lzQAofmMxfoSJsYtJBRHmgeG7qP/6q1vwP4BiI/MTaqTAF5hHZekWqOcuiZrDzh87R7J
	 N2vRMV4NhWvdzrtOkf4l65N/ffuUCn6C0W0LtBnMYc9f7B6F336cfuRk6SoPDFv2rbRX/
	 bWvoygqLTSYnwZ46wdTdQsLAHJ5N51FAL5LbKz1QPqOIgb5Vr60E1fPfWtZ03Uc9Pk0Aa
	 TggJNpjDGyYJsx+biiW7uLicHjTJeFE18xDaZwx6LGI3gvZBJ1QLNOWhsfaR7SECbiVET
	 1nlqaeHoTh7qf0vU4YMthNeldyKov71TvmcIlozMO2rrdd9xgdkj1Khphfe8nG5GQ7g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791621592;
	bh=1WhmHV46kgV/e5H+KIt+jtP328rB5B8j+JdW2D/7NBc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jXIYZA/i4sMVRd/gl9+1sgB3EeAZXZxO0abUP/rRNED31IPtMN2LqEyFoumjvW8Wj
	 Wcm+oE5ICHM16RxC+cCFERLXCJ8XhYIYYeAuv9mA+iejDkWe3af4f61nKksQA6X08s
	 o9kpyS8bIrTcwb2/HKxoM8jiIh72/2LWWSrr5QQS6HGga71RA/crdps7UYckJSh6Am
	 Wymx5z1uuCrUPd82ANPCbrmdKXNzEUxFZxIp36WPhPzuWnYC+4RkdpLT0reX/EAYLK
	 jeBNFeB7/ktK2uDNdc54W7jUhNglvK0tdDp1jJjNv9Y2gtjzXb/Uj8jI6jr2P0Kxf0
	 HOyJYYHbJTkqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B478813F6;
	Sat, 10 Oct 2026 08:39:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 355D5111
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26D3E6066D
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:39:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NqFy8wT1hkZQ for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 08:39:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 846DD6066C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791621590;
 b=TGRxm4D+xof9ezUa5CcVu7ilpnSRCFDAk9bvayt/SY3Gi2rql4gq73iIybBwafW/elY5
 H+PWeNtSKISDwmepwmbTv5s+hhbDmFL8FDNuUjzlFCjcup6MQ+RxW7UzjNmJFIrdWL5To
 d765D1wGkGAPoE+4h0WCtRZuhMxtk3R1vQdcpfI7izHn/kNdj7GuaDwfMD+6LeMIUfDzN
 5KgkJz9KPAzhpsImV5d9uJzmsghIQqSSB18/Cdsd+SUvon5n9haNxi08g/QAlfA4EKsok
 68AfAOsw/5URfKYbAMbwE18M0GSFpcoxCeH/dVZeRgT4kjOCcqIXsUlXdWkmehfpV/w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791621590;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=+psLeYJOtva67YtCow0+Wu5vSriIwMqZ0YeepcAc2jQ=;
 b=r3rKKZOH1dbkQ5rVNmU4EF0Idddb9r7mp0BUI6UAp2PmeDlj6y003rGcK7tmvB4QkcsZ
 e3C+Br+luzdeDuyoPbDuV8VqXfD7fgyrYf+9zPTaNeuAScM555YIQqYY0NfQk6pqxELmW
 YhSJDE3/OksFq9BObOe9FxW5WeWf/QACGy1QQ0jM/YcVW3nEjwSkvkGuXEJXCQiD+R/Fi
 ifoc2C2adNN2b0L518hcuHryc4Be+GXYtNclgezPoBEKfjYPQe3p8Xwyj7lVSRgFosgM7
 n+2TRN3tpSRxYRypBVpDCEzdNhIXCyuTaE7qXRV50il8nTVH3Sf52yLRyYpIFF73Fww==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 846DD6066C
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:39:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E18578F018; Sat, 10 Oct 2026 08:38:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 10:38:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f3fcabfb888dda0b68b5353777e832ad234e655f
X-Git-Newrev: daccdecf26112c31be424f087e6d0b2ea1068e64
X-Patchwork-Hint: ignore
Message-Id: <20261010083831.E18578F018@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ibrdtnd: fix build with OpenSSL
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/daccdecf26112c31be424f087e6d0b2ea1068e64
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...tificateManager.cpp-fix-build-with-OpenSS.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/ibrdtnd/0003-SecurityCertificateManager.cpp-fix-build-with-OpenSS.patch b/package/ibrdtnd/0003-SecurityCertificateManager.cpp-fix-build-with-OpenSS.patch
new file mode 100644
index 0000000000..4755409747
--- /dev/null
+++ b/package/ibrdtnd/0003-SecurityCertificateManager.cpp-fix-build-with-OpenSS.patch
@@ -0,0 +1,41 @@
+From 7dce31ed85b2e2299e63e7704ae2ffa7ce08d1c5 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Tue, 1 Sep 2026 22:44:06 +0200
+Subject: [PATCH] SecurityCertificateManager.cpp: fix build with OpenSSL 4.0.0
+
+https://github.com/openssl/openssl/issues/29117
+
+Upstream: https://github.com/ibrdtn/ibrdtn/pull/287
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/security/SecurityCertificateManager.cpp | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/security/SecurityCertificateManager.cpp b/src/security/SecurityCertificateManager.cpp
+index f2bbb017..0093d418 100644
+--- a/src/security/SecurityCertificateManager.cpp
++++ b/src/security/SecurityCertificateManager.cpp
+@@ -146,8 +146,8 @@ namespace dtn
+ 				throw SecurityCertificateException("certificate or common-name is empty");
+ 			}
+ 
+-			X509_NAME *cert_name;
+-			X509_NAME_ENTRY *name_entry;
++			const X509_NAME *cert_name;
++			const X509_NAME_ENTRY *name_entry;
+ 			ASN1_STRING *eid_string;
+ 			int lastpos = -1;
+ 			unsigned char *utf8_eid;
+@@ -188,7 +188,7 @@ namespace dtn
+ 				}
+ 
+ 				/* retrieve the string */
+-				ASN1_STRING *asn1 = X509_NAME_ENTRY_get_data(name_entry);
++				const ASN1_STRING *asn1 = X509_NAME_ENTRY_get_data(name_entry);
+ 				if(!asn1){
+ 					IBRCOMMON_LOGGER_TAG(SecurityCertificateManager::TAG, error) << "X509_NAME_ENTRY_get_data returned NULL unexpectedly." << IBRCOMMON_LOGGER_ENDL;
+ 					continue;
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
