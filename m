Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF88F327D4
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 17:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52E3041244;
	Tue, 21 Apr 2026 17:26:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5wcbCTOlySyY; Tue, 21 Apr 2026 17:26:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 661BF4127D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776792417;
	bh=+1Vq42e91D+JEcTMyBCm04wVmlNAjypf0dYRvSnw8+4=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=nDJRYU/V1163X4N8A9vLP/uZM9XlRwZMuxVFwoMFPaZr5OE8+smHVQIR/MFxs2BlL
	 wEtp8ilhVOIkPVyqoxvcibPt6PWYB4vTeUq2vo3mhND2KU/Vk/iwBiFgZ4PCmHyp3P
	 OoA08gu6Olf1i8pr9xNppWqBEpz2VYQ22OSWErTj837CZlrlGP66M4yDWunUKoofRO
	 xv4IsifSCvHw05O8N3MBmxhqzmJ4w6m2fNS4yx6sLDPKDrqrEsO1mYMYPTlfQw0P+z
	 aQdQoMa0hq0T0pQleFkDlkfSjjZptIeAxXZ9Zr5IkokHtgDOii0jbXWD/lm34Lz1K7
	 MxA8oRTy3+yrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 661BF4127D;
	Tue, 21 Apr 2026 17:26:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BCB5257
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 17:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 522C7402DB
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 17:26:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WsOJQsc0QFr5 for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 17:26:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4400F40262
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4400F40262
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4400F40262
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 17:26:55 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 915345FFB7;
 Tue, 21 Apr 2026 19:26:48 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue, 21 Apr 2026 19:26:24 +0200
Message-ID: <20260421172625.735873-3-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260421172625.735873-1-ju.o@free.fr>
References: <20260421172625.735873-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776792412;
 bh=wx0G3/A23Pq/3Md5sa9Isr7AoEXaAKpLZWs8lO+h7P0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H2L8K+fMax1IViQZA+CltSVypvgJo1+AxUK6GGep3ZRf4q+cynH//TAwGgm0GdyCV
 p+xnAbO8CDlgiQSTGbjv4negaNXQGdKjzFTz5JS7sWf1KdnfHRns2IJy4GV4cvw1xu
 1QzE0N/p3hIlKhU3Kj8jZTQsbN9jVBEeMC7vdaXOGE3A8EShP9ZcCByrby9ygGodsc
 7EIM/AW9uGGFKVKFcdU0aSbjkxBCnFOikOF691IGx00FQ8NJ3LGXAL+loJs2FSLwQd
 6MJv+tjMuqI6HKdd6v3+uKDa8GvACEMOgZG7u6FoaaqpRqGuM+qGPASzcIaaE0ZTTT
 3uIrxLpoHMtdA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=H2L8K+fM
Subject: [Buildroot] [PATCH 3/4]
 package/python-magic-wormhole-mailbox-server: bump to version 0.6.0
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
https://github.com/magic-wormhole/magic-wormhole-mailbox-server/blob/0.6.0/NEWS.md

The upstream source archive name changed (dash '-' changed to
underscore '_'). This commit updates _SOURCE to reflect that change.

This commit also updates _SITE to use a stable URL which will redirect
to the package archive, to reduce future maintenance.

This package has been broken at runtime since Buildroot commit [1]
"package/python-setuptools: bump to version 82.0.0", which removed
the python module 'pkg_resources' which was deprecated. This new
version removes those usage and fixes this issue.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/13904071794

Note: this commit fixes only the runtime invocation of
wormhole-mailbox, the complete fix for the test_python_magic_wormhole
runtime test also requires the update of
python-magic-wormhole-transit-relay.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/51365ff06379aaf6fcc9a751e8ff32ac694f3e92

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../python-magic-wormhole-mailbox-server.hash               | 4 ++--
 .../python-magic-wormhole-mailbox-server.mk                 | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.hash b/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.hash
index fd02bcc758..d701edfc72 100644
--- a/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.hash
+++ b/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/magic-wormhole-mailbox-server/json
-md5  bb9f84e7ecddc43413b4287b7b20d285  magic-wormhole-mailbox-server-0.5.1.tar.gz
-sha256  a007a03672293204657681dbf502045d6d5817c57f9aae2f2226e6ea1a008ca1  magic-wormhole-mailbox-server-0.5.1.tar.gz
+md5  29a3ab90583e6858a74f11c3f485a77c  magic_wormhole_mailbox_server-0.6.0.tar.gz
+sha256  b1bf145f3a26d905ebff6820407976d57614f1ad8b9806210e9c4e36579a1f79  magic_wormhole_mailbox_server-0.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4a9cc2415c52cef591b6822eee68fed36d7e6d80284b09638cff61d762d99060  LICENSE
diff --git a/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.mk b/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.mk
index 7525054167..616d72dfbf 100644
--- a/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.mk
+++ b/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_VERSION = 0.5.1
-PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_SOURCE = magic-wormhole-mailbox-server-$(PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_VERSION).tar.gz
-PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_SITE = https://files.pythonhosted.org/packages/9d/5c/71566147af3f28017035ebe69ce7253ea26917225ae7c39b964578541bff
+PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_VERSION = 0.6.0
+PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_SOURCE = magic_wormhole_mailbox_server-$(PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_VERSION).tar.gz
+PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_SITE = https://files.pythonhosted.org/packages/source/m/magic_wormhole_mailbox_server
 PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_SETUP_TYPE = setuptools
 PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_LICENSE = MIT
 PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
