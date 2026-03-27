Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A608510F2862
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 18:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6DF083E3C;
	Fri, 27 Mar 2026 18:22:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FdqlapzA51ch; Fri, 27 Mar 2026 18:22:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77DFB83E29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774635736;
	bh=kkFYs64XRbROINzackA96AFgUyDKkaEj99I1lmXh/Dk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Ll0qg44Pl11/eD4+vNxwLUbDooALY3AFfbXML/AzV3gcEWWv4WW3KGFFGr3z0fq9T
	 914Zt6iVeNsCXBCwpfbRuUhsELhnL2PLaCnmsQc0wSo101h/W8tamjGw3QfIf9/koB
	 dDkmkl9rgg7fCEwS9dXvj0RK0toufOBkkUP37ZbgvFss8q1ALeuhc2nAeDYQGX1X4U
	 o24L7rD8VxEK3tl47ABcOsYG6E8kDJFTP9bC1ZbbFlkt9TlnxcbY20vG2eLBDeB1Dx
	 MiG3zaZ6JtIeYRFaNeFE9wU4M3SMHgAA2HxQF0jbL7sg6MOqJTXUCDT625LEosJKWf
	 WhJRvHkZxStEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77DFB83E29;
	Fri, 27 Mar 2026 18:22:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E3EB1D3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 18:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63D5460FDC
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 18:22:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yrkye6-AxaGb for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 18:22:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C0E3C605A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0E3C605A7
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C0E3C605A7
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 18:22:12 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1960693743; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 27 Mar 2026 18:22:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1w6Bos-00000000oBa-3P0w;
 Fri, 27 Mar 2026 19:22:06 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 Mar 2026 19:21:53 +0100
Message-ID: <20260327182155.192855-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=byX+3QKPRMyBZb7sh8GR6JQUbXmYFn9AnkXeGjDA/FrpzkMGnDpYFBUaWSc+OIRdK5plPTxz+us2qbUI5ZisJSpwxJEXwCu+5xskkWAdG5TdhHWaMQexg8nxLKJPDNgy9y9rpYy7Glw+xavM1jRegx8KGEXOO5XhYSN4Oun4azZ8BrRos6AhP8l2+7/tv4L3IVpnEeDcpi1EhGhBaQTFObTFbkkFuFPHzunKsgnEQAwu+QzbT3GuSUNbREoZNVj73cZxcnxByk+SPlVnTWrg1p+7c6O+hRoWKgKDPApKk91zZmRYPXahlBLzq00zOc2BK+/3lypsFK/+WrfDNAlkFw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=hn6UV5AlWGDyix01BUJbtFwXXZm8H/onW+0tHLw0uBg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=byX+3QKP
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/rauc: security bump to version 1.15.2
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Andrey Yurovsky <yurovsky@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issue:

CVE-2026-34155: Improper Signing of Plain Bundles Exceeding 2 GiB

RAUC bundles using the 'plain' format exceeding a payload size of 2 GiB
cause an integer overflow which results in a signature which covers only the
first few bytes of the payload.  Given such a bundle with a legitimate
signature, an attacker can modify the part of the payload which is not
covered by the signature.

Bundles using the recommended 'verity' or 'crypt' formats are not affected.

For more details, see the advisory:
https://github.com/rauc/rauc/security/advisories/GHSA-6hj7-q844-m2hx

https://github.com/rauc/rauc/releases/tag/v1.15.2

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rauc/rauc.hash | 2 +-
 package/rauc/rauc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index ea537c63b6..edfefb5a7b 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  603dafa5085b6b964c74d5f57a154a1489af2b415dd20c6ff1447815d02c094f  rauc-1.15.1.tar.xz
+sha256  127a24cde208c65b837ae978c695a00730f1094ee8b6c7d48cf58ef846eae340  rauc-1.15.2.tar.xz
 sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index ba30c70dad..54974abc09 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAUC_VERSION = 1.15.1
+RAUC_VERSION = 1.15.2
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
