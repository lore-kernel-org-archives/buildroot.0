Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B405DE66886
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B53580DA5;
	Sun, 21 Dec 2025 22:31:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oyFV2Y_KqP-K; Sun, 21 Dec 2025 22:31:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A65C680DB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766356282;
	bh=KKhOMnKFatT+l85AAitldGRPs6zhjGnl7YrnUBmcyWc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=s3s1s6G7yn4GMC477rjVwcDM/uFPPnOHPIihlCSjHARxURBv12rc3C1MfcM+tLV3C
	 t6awZ6h9tTAUj4RRvrcAIZ5cfG2lZLr9MC0SEHdMAgbucc2uWT5eavDX77k3RWez6z
	 stsu00kW8vgwWTQQtpGOnppwFKYgL9+Tdcvl326Y7iW3NcJmG3fr40HBKM/l3wPS+1
	 G2iUi0XT8NPftrLYakagkIpXRXDza8YuLkzlQXJyX20rwCvMyAPz20B7HwZurO7bQ+
	 76dvzDptl1vZ4G47SrzuF0uwH4Mrk7747MPaVrZ5ch3nxgjRj2NlugI0z78sIU90c7
	 X0XcwZOLLKKuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A65C680DB2;
	Sun, 21 Dec 2025 22:31:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BFE4119
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3990C40523
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:31:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hOZqpFLnmIdb for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:31:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2381F404EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2381F404EE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2381F404EE
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:31:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 75D9BA4C4E03;
 Sun, 21 Dec 2025 23:30:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46252)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vXRw9-000000004xC-0W2h;
 Sun, 21 Dec 2025 22:30:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 23:29:59 +0100
Message-ID: <20251221223000.184312-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251221223000.184312-1-bernd@kuhls.net>
References: <20251221223000.184312-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766356202;
 bh=CVysSPY/jL9YqF099S9FyLnj1+wkO3r+USp18lErT8s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=c86td9BF44ylQU0z7uO0dUNk6vO2waiAEOQg3yRffW1julTdjy8FyiMoM3XWo1atR
 BuYn7GtPia5DAhPdXgaTgHlEi0UmnPL3APzt3ZPsk13S/E3f5uXM7KBMvRliEmS1bb
 yfRI1hFTbcRXJmqwxyU5Rj3qAPO+tj5Qo7QDGi49+0hYlaeUsxzagCstl2iCJBzfux
 FjQZ9yytndvhT5s+osht0J2SQu7e51ExR/FVB38KZCvzfSN9KAFQBjGg4OjYI8vYTS
 fkup5KexDpbpFyHG/2goQ5YVMF1v7ccDAXxlpJ3lK15nKLyROMg39KylRs1umGDmOZ
 sFnumSCQbG6fw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=c86td9BF
Subject: [Buildroot] [PATCH 6/7] package/python-pypika-tortoise: bump
 version to 0.6.3
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
 Marcin Niestroj <m.niestroj@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/tortoise/pypika-tortoise/blob/v0.6.3/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pypika-tortoise/python-pypika-tortoise.hash | 4 ++--
 package/python-pypika-tortoise/python-pypika-tortoise.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pypika-tortoise/python-pypika-tortoise.hash b/package/python-pypika-tortoise/python-pypika-tortoise.hash
index 7e9f397638..9dc7ea9aa0 100644
--- a/package/python-pypika-tortoise/python-pypika-tortoise.hash
+++ b/package/python-pypika-tortoise/python-pypika-tortoise.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pypika-tortoise/json
-md5  5b5c1be4096c75dd6994336f71936383  pypika_tortoise-0.6.2.tar.gz
-sha256  f95ab59d9b6454db2e8daa0934728458350a1f3d56e81d9d1debc8eebeff26b3  pypika_tortoise-0.6.2.tar.gz
+md5  21a08e348b537e745964323874f5a6fc  pypika_tortoise-0.6.3.tar.gz
+sha256  6e17f00e77e78468836cb5c63eb6dc01445f83b1167e4f29f1c678949179c079  pypika_tortoise-0.6.3.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-pypika-tortoise/python-pypika-tortoise.mk b/package/python-pypika-tortoise/python-pypika-tortoise.mk
index 7fa451f67d..72669f36b2 100644
--- a/package/python-pypika-tortoise/python-pypika-tortoise.mk
+++ b/package/python-pypika-tortoise/python-pypika-tortoise.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPIKA_TORTOISE_VERSION = 0.6.2
+PYTHON_PYPIKA_TORTOISE_VERSION = 0.6.3
 PYTHON_PYPIKA_TORTOISE_SOURCE = pypika_tortoise-$(PYTHON_PYPIKA_TORTOISE_VERSION).tar.gz
-PYTHON_PYPIKA_TORTOISE_SITE = https://files.pythonhosted.org/packages/1a/7b/0a31165e22e599ba149ba35d4323d343205a70d91a4f6e8c6565f5b4fa08
+PYTHON_PYPIKA_TORTOISE_SITE = https://files.pythonhosted.org/packages/cc/28/86ec1bccb2609d20349def444ef9dfe84aeccc984caa62f4634d50fee164
 PYTHON_PYPIKA_TORTOISE_SETUP_TYPE = pep517
 PYTHON_PYPIKA_TORTOISE_LICENSE = Apache-2.0
 PYTHON_PYPIKA_TORTOISE_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
