Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D92F8FA9E
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 17:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EB0C83E2D;
	Tue, 21 Apr 2026 17:26:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xLSDrW3J2PzC; Tue, 21 Apr 2026 17:26:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5925183E2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776792413;
	bh=RHQ0QohhWWpGamFaoN582hHEioD0UdqLghh/KCUIn4w=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Kk/9Z35GCYQh3PAvOv8J+s+Y9r+0on9iyevD6hSb5wnDkz3kHEcReLU160Z3kiuDp
	 gNfhCC4p8OIyNOUAusp/rQ5nOOpu9r7SYnlNBQNS51c3CaaJT/nBCeaKwfROVytmnY
	 96NcLQxBxhFEJ8ctGxrf0euPBQLLp/WY9PlKC6BgqLwNhJBe1LrhEMuu70XIfutg+G
	 gLNp2B4wb3S6TlQfLxjL8YnVnXgQplbDV6TpV6m7Z0nhMJtLuUE2keVTlcxNF+cpK1
	 Q2tQsRz3ofqAW1kRnfZDAEr5AL0zkmSeS6C4eoBtO3Z2uMptVDibt5xqsujJa+oco6
	 8tGNEPFzXK0YQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5925183E2F;
	Tue, 21 Apr 2026 17:26:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A756924D
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 17:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D4D783E2F
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 17:26:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w7Q959NhEaFi for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 17:26:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8637B83E2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8637B83E2D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8637B83E2D
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 17:26:50 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id AAC2A60141;
 Tue, 21 Apr 2026 19:26:43 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue, 21 Apr 2026 19:26:23 +0200
Message-ID: <20260421172625.735873-2-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260421172625.735873-1-ju.o@free.fr>
References: <20260421172625.735873-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776792408;
 bh=CIave370MsqN36vYY4BmdpWS8xsPsthf/ij+Pccg3Ug=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M8JMUmpseiS6aqddL6CaziK6nE1JrEzc16mWAqrqi9vY943s/BBp/U5V1WOBaR9Y6
 5Z0RXI+JIFF65fEE5RN/tQR9qptNxyrLZTgOjl9+Uz/VSKHT0r1DH4wL/Vjn6MJXoO
 k5dC1HNsBTAs/gQa7wfJhIE10RNYgrST5kY0fNuBkzgw7wIwTnzYV2B9ScjLOJtWlq
 afMe8rMFVlOBfKGAzVwaHytFGVV1Gq/V2uj2HwKCbbQMiikC4N4HwiFvaCdvd7EiXQ
 +3Wi5QlK+VvVatQ2YQ+ZGVii3JpnE+oBlhw4+xUkff/Vxo1M3udRd1eQrzDfMlCN6R
 gbCw81+Wvtj7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=M8JMUmps
Subject: [Buildroot] [PATCH 2/4] package/python-magic-wormhole: security
 bump to version 0.23.0
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

See NEWS:
https://github.com/magic-wormhole/magic-wormhole/blob/0.23.0/NEWS.md

This commit also updates _SITE to use a stable URL which will redirect
to the package archive, to reduce future maintenance.

Fixes:
https://nvd.nist.gov/vuln/detail/CVE-2026-32116

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch series tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/14023074896
---
 package/python-magic-wormhole/python-magic-wormhole.hash | 4 ++--
 package/python-magic-wormhole/python-magic-wormhole.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-magic-wormhole/python-magic-wormhole.hash b/package/python-magic-wormhole/python-magic-wormhole.hash
index b0f32e2d13..2f03594cc1 100644
--- a/package/python-magic-wormhole/python-magic-wormhole.hash
+++ b/package/python-magic-wormhole/python-magic-wormhole.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/magic-wormhole/json
-md5  e57bac643bbc691e94919be496813a4c  magic_wormhole-0.22.0.tar.gz
-sha256  52a3ae2f0c56d0d4cd52188e50f10d2fe14bfd46e287dd50b72e7f7e851434ac  magic_wormhole-0.22.0.tar.gz
+md5  23f71fc6d6f78b93d419cee6d4af4d94  magic_wormhole-0.23.0.tar.gz
+sha256  4cd8f48a5c47f70578be7063f892988177681ab66845f4d6ad2d5eb03ce82acf  magic_wormhole-0.23.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4a9cc2415c52cef591b6822eee68fed36d7e6d80284b09638cff61d762d99060  LICENSE
diff --git a/package/python-magic-wormhole/python-magic-wormhole.mk b/package/python-magic-wormhole/python-magic-wormhole.mk
index 7b74113df1..9f3b4dfe1c 100644
--- a/package/python-magic-wormhole/python-magic-wormhole.mk
+++ b/package/python-magic-wormhole/python-magic-wormhole.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MAGIC_WORMHOLE_VERSION = 0.22.0
+PYTHON_MAGIC_WORMHOLE_VERSION = 0.23.0
 PYTHON_MAGIC_WORMHOLE_SOURCE = magic_wormhole-$(PYTHON_MAGIC_WORMHOLE_VERSION).tar.gz
-PYTHON_MAGIC_WORMHOLE_SITE = https://files.pythonhosted.org/packages/65/34/08813891da57999cf953e9c553193c900ff363c4cdfdd48a74f65536a883
+PYTHON_MAGIC_WORMHOLE_SITE = https://files.pythonhosted.org/packages/source/m/magic_wormhole
 PYTHON_MAGIC_WORMHOLE_SETUP_TYPE = setuptools
 PYTHON_MAGIC_WORMHOLE_LICENSE = MIT
 PYTHON_MAGIC_WORMHOLE_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
