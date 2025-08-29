Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9F4C8303F
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 05:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A76A981D0B;
	Fri, 29 Aug 2025 05:49:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BmLpEd0zYlEr; Fri, 29 Aug 2025 05:49:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE1E681D5F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE1E681D5F;
	Fri, 29 Aug 2025 05:49:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 53C9269
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 05:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45D11415FD
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 05:49:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RkmZLR__BfJ3 for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 05:49:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 76A93415FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76A93415FC
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 76A93415FC
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 05:49:41 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2130680941; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 Aug 2025 05:49:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1urrzW-00AeyI-0t;
 Fri, 29 Aug 2025 07:49:38 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 07:49:36 +0200
Message-Id: <20250829054937.2540763-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=WCplCz5kdGJFk5OtqmX79TLSLuanlE1uyCMhSrknHImxjvf14oAC7D/xi+REbZSKodCN7+ybPlE4uMDPXpCWcMBXJEX1+m+eDRlJ/8WHlGCTzfuvwq8vizo14VA3poX9XYg/HjIg64xJSluE1mThnacK/fKmeuIMHbsa5Se+SCexoShFJYWTNP9qKIpaJs47hPFm/n7YbGIYyN8XHlJ9UZkoKOGEhZNZ7fFdCVOj5v3bpmkbB4Q+9jb90K9T8FdyI0nKTQau89yfMs16Fi18Rk9g8IdKIrnNejE1UQFcHxLUKQJUBVzMEFNzEpP74ygB3fNLhXRmTBG3kqwaymwKmA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=ZDJi0x4tOhZuMf3HKjA8b+7HcGZBoq5hdE42Jl9tqog=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=WCplCz5k
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/python-h2: security bump to version
 4.3.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security vulnerability:

- CVE-2025-57804: HTTP/2 request splitting via CRLF injection

  https://github.com/python-hyper/h2/security/advisories/GHSA-847f-9342-265h

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-h2/python-h2.hash | 4 ++--
 package/python-h2/python-h2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-h2/python-h2.hash b/package/python-h2/python-h2.hash
index 2f9c8f647f..5adfc86f52 100644
--- a/package/python-h2/python-h2.hash
+++ b/package/python-h2/python-h2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/h2/json
-md5  4274f9619c0a43bb4ae01b6b02bf0c99  h2-4.1.0.tar.gz
-sha256  a83aca08fbe7aacb79fec788c9c0bac936343560ed9ec18b82a13a12c28d2abb  h2-4.1.0.tar.gz
+md5  b4781bbaaae609aa759565585718e0d7  h2-4.3.0.tar.gz
+sha256  6c59efe4323fa18b47a632221a1888bd7fde6249819beda254aeca909f221bf1  h2-4.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7a65a5af0cbabf1c16251c7c6b2b7cb46d16a7222e79975b9b61fcd66a2e3f28  LICENSE
diff --git a/package/python-h2/python-h2.mk b/package/python-h2/python-h2.mk
index 699e8baece..d9cfbdbf92 100644
--- a/package/python-h2/python-h2.mk
+++ b/package/python-h2/python-h2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_H2_VERSION = 4.1.0
+PYTHON_H2_VERSION = 4.3.0
 PYTHON_H2_SOURCE = h2-$(PYTHON_H2_VERSION).tar.gz
-PYTHON_H2_SITE = https://files.pythonhosted.org/packages/2a/32/fec683ddd10629ea4ea46d206752a95a2d8a48c22521edd70b142488efe1
+PYTHON_H2_SITE = https://files.pythonhosted.org/packages/1d/17/afa56379f94ad0fe8defd37d6eb3f89a25404ffc71d4d848893d270325fc
 PYTHON_H2_SETUP_TYPE = setuptools
 PYTHON_H2_LICENSE = MIT
 PYTHON_H2_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
