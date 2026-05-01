Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08741CCFA13
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4E3040ED2;
	Fri,  1 May 2026 12:35:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jQ1Glms29IdZ; Fri,  1 May 2026 12:35:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DCA841146
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777638912;
	bh=bnR9jg7OGZ0i1TKKmm+vEHqz27UZCGJUHD8GpTmSWKk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=E7tBBw5WiR+fhNrE0eOHaQycbY6xfutz6uyBXhD0WsXjIbThGe8zvea+90HZ0leMo
	 GQVZ09fsdVkMvQ+n9BFXkakgeQanbDSJqWeGWwCwgSKASzCkjmnm7Rv1CdJA81t6jr
	 K7oF32VRdPRDsuLRK4O3ia0rxbhedqJbmYNUE0Cpoy0UheayHBwMZcScM9rlWmKXZS
	 CTcKDfjXD810/XjhJyXb9eYExEp/UdGdwEMiGHOlFj8XGrhhB4Ga7UuvP+jsoAUWHB
	 AIpdeoyBvD4vXd1eeXc5nGzC0dXOy9q2RLUfMutXCb6e5cGGDFlW/HtQwrgCBrUuCP
	 SZxSsHPw+UC5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DCA841146;
	Fri,  1 May 2026 12:35:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D52CE293
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D34B740ED2
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:35:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id USPmsQuyACVQ for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:35:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C9A4840DEF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9A4840DEF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C9A4840DEF
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:35:09 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BB8B0A4C2EB5;
 Fri,  1 May 2026 14:31:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1K-000000008NC-28wO;
 Fri, 01 May 2026 12:31:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:06 +0200
Message-ID: <20260501123100.1918951-21-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638664;
 bh=DDQNdhe4cEWxjwUC7pxHe99t34iZ9ErTolvbW+2X8z4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=TZcV9P38SVk46FZShZ0PhE2p48/PBteSmaqpAFbgVAexeLFSQiAQEfmiiQhkwIB4m
 I9Or0ta4IgAwxPH9uYNZzOvv7j7FRd/b4Q7NdjPEJ/bJ/5frSum6dgCZKDA3dhrrhk
 Fg2iYvO7QU3J0Q/nO5ynch9RfXQFaudO/3yuXb15jcW9N/FRBgRBFw7BNnAiLnpefK
 ykCLoswLQf1KYXCrXRyoLvXI86dtLlprWLa3vYATkUqQA9hqsdE7Jfqw7jU1DPP0HS
 dTUgva9Hp9RUXmtFbjVczcrvIc//MBPu+2iimOuVuJc7vEl+4UgWxV/RYJkiAEjRuA
 Iry45ItzWvYyA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=TZcV9P38
Subject: [Buildroot] [PATCH 21/75] package/python-googleapis-common-protos:
 bump version to 1.74.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Mauro Condarelli <mc5686@mclink.it>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/googleapis/google-cloud-python/blob/main/packages/googleapis-common-protos/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../python-googleapis-common-protos.hash                      | 4 ++--
 .../python-googleapis-common-protos.mk                        | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-googleapis-common-protos/python-googleapis-common-protos.hash b/package/python-googleapis-common-protos/python-googleapis-common-protos.hash
index 682b995bd6..6a67af9419 100644
--- a/package/python-googleapis-common-protos/python-googleapis-common-protos.hash
+++ b/package/python-googleapis-common-protos/python-googleapis-common-protos.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/googleapis-common-protos/json
-md5  8af6ac195972be9e561438dff863170e  googleapis_common_protos-1.73.0.tar.gz
-sha256  778d07cd4fbeff84c6f7c72102f0daf98fa2bfd3fa8bea426edc545588da0b5a  googleapis_common_protos-1.73.0.tar.gz
+md5  6f61f5d3d898fff893450a597839ed96  googleapis_common_protos-1.74.0.tar.gz
+sha256  57971e4eeeba6aad1163c1f0fc88543f965bb49129b8bb55b2b7b26ecab084f1  googleapis_common_protos-1.74.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-googleapis-common-protos/python-googleapis-common-protos.mk b/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
index 3bc384efa5..5fd2513d1a 100644
--- a/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
+++ b/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION = 1.73.0
+PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION = 1.74.0
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_SOURCE = googleapis_common_protos-$(PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION).tar.gz
-PYTHON_GOOGLEAPIS_COMMON_PROTOS_SITE = https://files.pythonhosted.org/packages/99/96/a0205167fa0154f4a542fd6925bdc63d039d88dab3588b875078107e6f06
+PYTHON_GOOGLEAPIS_COMMON_PROTOS_SITE = https://files.pythonhosted.org/packages/20/18/a746c8344152d368a5aac738d4c857012f2c5d1fd2eac7e17b647a7861bd
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_SETUP_TYPE = setuptools
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_LICENSE = Apache-2.0
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
