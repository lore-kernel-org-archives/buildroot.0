Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A69BF8FA9E
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 17:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A8CE41249;
	Tue, 21 Apr 2026 17:26:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 584_GVBZOjw8; Tue, 21 Apr 2026 17:26:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DD564122B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776792408;
	bh=9q96WlnYw64D5HvtXNMQxZ5Cp35i8nuwFlUzWV8XV0k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=hLKow84zTuvYaJ46VfEw0mbDF0U9dWQZVF6WQ+vSZj6oh4xHOTF6yTN9VEEkfUQ3q
	 luVgvtpv79oq/zwUSUt6+d5mRsD3vifK4n9EkR/q6/DOpL1CH7A+6oZRRvUYsBqfsJ
	 N1b0gYhqCZKOh6VndqXuzlTDcD+eTwIBnzi7e1pTFMolR4uCqe6jHzR7LL0f5BYeBn
	 IgvlzeyU9T6QCuMDbyIQw4mQhvTh+ECeoDaQFZVy9clxHkG1MwuVn6GlnpkeOxctlS
	 qWdBd4m8funWVGI0kjiKorneknDLPAQltbqfFcj/OYwpVFdYuezAy6KDC9pXvmBZef
	 c6SBP9mey3xYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DD564122B;
	Tue, 21 Apr 2026 17:26:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E52F724D
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 17:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6CDE402DB
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 17:26:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sQ4wofwKWRvI for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 17:26:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E28EB40262
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E28EB40262
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E28EB40262
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 17:26:45 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 1627760143;
 Tue, 21 Apr 2026 19:26:40 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue, 21 Apr 2026 19:26:22 +0200
Message-ID: <20260421172625.735873-1-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776792403;
 bh=QtVNhn15iD9TrhRqYOWEjM0RyyJ8Y3B1ziqVybn3V98=;
 h=From:To:Cc:Subject:Date:From;
 b=ebQ3cFLOK/FN12Fe1mXn9lob/8RkyoC5iQPYL+adRbKo6/KyxfDEDAzRPkEJ1hoXe
 lp5z1nCfbed79h29SiJsu6DEAJigdxQmXqOUJw4NDlQvWonNZE6+XWEX8VqjFP0W14
 KBocHXhoawM74YL3picqBctoqV9g/7uqIMd0mcUUQKa1TyGDocZ1cyHqY4oP/N8MZ0
 0uaQgsznCdv6mXjxlfKacFc2Fh5BzBCxil+eCfxUEbtogEBDTghg5oyP0oNPI2qpxH
 6c5pW2aj9MZh2wxu4pcLXyxf7JVRN2rcr9BLs1BMJR2luUFklfiyYmWwFSig8BBxaG
 D65Y+quRTQmhw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ebQ3cFLO
Subject: [Buildroot] [PATCH 1/4] package/python-magic-wormhole: add CPE ID
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Cc: James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The CPE ID `magic_wormhole_project:magic_wormhole` is valid for
magic-wormhole. See:
https://nvd.nist.gov/products/cpe/detail/591D7832-786D-4BBD-A16A-04CBDE20333B

This commit adds the information.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-magic-wormhole/python-magic-wormhole.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-magic-wormhole/python-magic-wormhole.mk b/package/python-magic-wormhole/python-magic-wormhole.mk
index 11d4a8867e..7b74113df1 100644
--- a/package/python-magic-wormhole/python-magic-wormhole.mk
+++ b/package/python-magic-wormhole/python-magic-wormhole.mk
@@ -10,6 +10,8 @@ PYTHON_MAGIC_WORMHOLE_SITE = https://files.pythonhosted.org/packages/65/34/08813
 PYTHON_MAGIC_WORMHOLE_SETUP_TYPE = setuptools
 PYTHON_MAGIC_WORMHOLE_LICENSE = MIT
 PYTHON_MAGIC_WORMHOLE_LICENSE_FILES = LICENSE
+PYTHON_MAGIC_WORMHOLE_CPE_ID_VENDOR = magic_wormhole_project
+PYTHON_MAGIC_WORMHOLE_CPE_ID_PRODUCT = magic_wormhole
 PYTHON_MAGIC_WORMHOLE_DEPENDENCIES = host-python-versioneer
 
 $(eval $(python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
