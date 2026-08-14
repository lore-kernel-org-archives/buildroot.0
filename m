Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F020C5CFDB
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 12:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5226940C7A;
	Fri, 14 Aug 2026 12:40:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id deKe16ZF_MeY; Fri, 14 Aug 2026 12:40:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B80140C19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786711234;
	bh=+HLk/sQ8WjMpKN9YqRSxK3WbIGcZDsNn6RQMbPZU9wI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=eVRJ/mU0XCXShU+UCgZp9Zy0kSxSntu+6E6CMgwUxdTBJVF3+ZQq/B/xGZC+niWiu
	 yxHvvJ60uhDIxM1te4G5+jx3YZ0I8TtN1VT0gPMKMIqTT8O9RpveGXtzLU56be7vuV
	 /kPwPuPdjGR4gpr1tHBJdTMxn5B2SF7RF82URnfNNoebQnW4k8Y97GQtOCNeiGP5LW
	 IU9cheIUzsBQeYT04Ha1b1kVR4piOLlvOL7dVnmR4MZsqwEALh/7Sg1+zDZmvyp/uj
	 iqPq99WxxWtPFvXRRNA0wkE8fva5mhloFIw+c7WOWrE0NTdSyH7TIdsOLoU5/9RJHl
	 cDZwNNMIpAmsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B80140C19;
	Fri, 14 Aug 2026 12:40:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2241C33B
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 12:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08435403D2
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 12:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vys0B1rLFI5y for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 12:40:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.10.208.40;
 helo=mout-b-210.mailbox.org; envelope-from=manuel.diener@oss.othermo.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E533E40351
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=oss.othermo.de
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E533E40351
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=oss.othermo.de header.i=@oss.othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=z0Votgj8
Received: from mout-b-210.mailbox.org (mout-b-210.mailbox.org [195.10.208.40])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E533E40351
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 12:40:31 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-b-210.mailbox.org (Postfix) with ESMTPS id 4hM1zF4JNtzFrC2;
 Fri, 14 Aug 2026 14:40:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oss.othermo.de;
 s=MBO0001; t=1786711225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=0V0bTUzePekjjKk7BqX4Is4lnfCA3IRrDr8r5JLKCu0=;
 b=z0Votgj884f2NXDHyhO++jZ3pfM1l5Oh+HW55chNzS8gkRNiql4jRgfpXQdJ11eHsWx7Ta
 x3mV2+AxTtKlKE+vUVMrY56FAVE+7jJ54SSRTQOSMmAHUzQFD+AAm+DYVympWGqUgf9iM1
 USsxZYx/HeYyqcQPlXmf+40h9crG//74qbKsAI0m4H6liRysqBeTyWLbDIxAiXtaZQqMwx
 TPsfP6XaPnBeMbOCJPhsPSC9V/eaKUuvBLuZqxMo97O7y15FD7xGu7wwaGQtAIfvneTW4p
 MDC3ukWKsYomJAH8OFrD3nqlcXJqbG0MrYB8XW8SDrsEkkutBE7QRNRwH0YVXQ==
From: Manuel Diener <manuel.diener@oss.othermo.de>
To: buildroot@buildroot.org
Date: Fri, 14 Aug 2026 14:37:52 +0200
Message-ID: <20260814123753.968246-1-manuel.diener@oss.othermo.de>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-tzlocal: bump to version 5.4.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Manuel Diener <manuel.diener@oss.othermo.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This skipps the following releases:
- 5.4
- 5.4.1
- 5.4.2
- 5.4.3

See the release notes here: https://github.com/regebro/tzlocal/blob/master/CHANGES.txt

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
---
 package/python-tzlocal/python-tzlocal.hash | 4 ++--
 package/python-tzlocal/python-tzlocal.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tzlocal/python-tzlocal.hash b/package/python-tzlocal/python-tzlocal.hash
index 838e6ded21..d870d54d1f 100644
--- a/package/python-tzlocal/python-tzlocal.hash
+++ b/package/python-tzlocal/python-tzlocal.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tzlocal/json
-md5  f8eb4bf0eb262ba422741d032d6cfedf  tzlocal-5.3.1.tar.gz
-sha256  cceffc7edecefea1f595541dbd6e990cb1ea3d19bf01b2809f362a03dd7921fd  tzlocal-5.3.1.tar.gz
+md5  24e01420acf49871034e25bcb64139ba  tzlocal-5.4.4.tar.gz
+sha256  8dbb8660838688a7b6ba4fed31d18dedf842afb4d47ca050d6d891c2c15f3be4  tzlocal-5.4.4.tar.gz
 # Locally computed sha256 checksums
 sha256  d99ab209aeb16aad2c25c90ffd83c1a981e290ffff76a420a2ab03e03f041b8c  LICENSE.txt
diff --git a/package/python-tzlocal/python-tzlocal.mk b/package/python-tzlocal/python-tzlocal.mk
index 2c1e5ff87a..fa60a1b7bd 100644
--- a/package/python-tzlocal/python-tzlocal.mk
+++ b/package/python-tzlocal/python-tzlocal.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TZLOCAL_VERSION = 5.3.1
+PYTHON_TZLOCAL_VERSION = 5.4.4
 PYTHON_TZLOCAL_SOURCE = tzlocal-$(PYTHON_TZLOCAL_VERSION).tar.gz
-PYTHON_TZLOCAL_SITE = https://files.pythonhosted.org/packages/8b/2e/c14812d3d4d9cd1773c6be938f89e5735a1f11a9f184ac3639b93cef35d5
+PYTHON_TZLOCAL_SITE = https://files.pythonhosted.org/packages/81/5b/879b2f932adfa7a053c360d50bc896c977fa6426109185f7c12ebdd0cb9d
 PYTHON_TZLOCAL_SETUP_TYPE = setuptools
 PYTHON_TZLOCAL_LICENSE = MIT
 PYTHON_TZLOCAL_LICENSE_FILES = LICENSE.txt
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
