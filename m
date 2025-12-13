Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF0ED59F76
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 14:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E20866077E;
	Sat, 13 Dec 2025 14:07:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RuU3ovbLeOAc; Sat, 13 Dec 2025 14:07:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FD6E60860
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765634856;
	bh=oyHO8+uTALaJ07P0e7L30hfGpu6lRNMioSj1jEGbEEg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=SlvMX/noPxUQWEpSnDrdaF+CoblI6FbZZEBqpxMZhwXuE4EK+dFHcM09oaFghVGXf
	 QBdVwQRox4wyNGMdK3IzX9K7hvGCYogPz+tivywgsA/LSGBej8SXIzaVybUePC6zge
	 pendgsMYmR+5kw6nHvhBD4szbCflUxAAgJU1HBkJp/UrAVmeBiPdctjItbm3WEwTRR
	 Lp9vt6fejBptkevPfjqBix6R/AJyXIlZW2J3tApXeF7BIcJjvyvOGy001BA88/Wg55
	 AKzl79yGHAUBVfzMHnOZSdI6DWbXCrmFDOA+/n11jFvuSPZDoD+rLnIFEyCqLYzMF/
	 +NvDbhUbMbrdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FD6E60860;
	Sat, 13 Dec 2025 14:07:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3900913D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B205440C8A
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:07:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_jduM9pOGkn for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 14:07:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ED2F440D04
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED2F440D04
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED2F440D04
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:07:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc21.dip0.t-ipconnect.de [79.214.204.33])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AF757A4C407E;
 Sat, 13 Dec 2025 15:05:29 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49778)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vUQFO-000000004dt-2jP1;
 Sat, 13 Dec 2025 14:05:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 15:05:13 +0100
Message-ID: <20251213140522.1322763-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251213140522.1322763-1-bernd@kuhls.net>
References: <20251213140522.1322763-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765634729;
 bh=R0zrNF+mivYYALHCRQYUaoqAT6yuZL0oF5u5wa4ABbg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=de5gkKxQozoE3hqoOJvvn/nfIQaUO9lggEIeYcJyaELWi3ftIwUPfrxsGRonTZ/r+
 24Nd2xxBIoNJj6Oux77SP0nwiwL9O70e6aBM9+lhj8bs2NvoeHSMvGf4efBlAmNXtP
 VgYRJIK67HLUenL/qqXNc/D9HBvu++M2MXNqLT8ruZXP+vZ2bkNfVuNvgo2lZNjyTE
 nzZsyYqRAAepgHDYZ8Hiyp0udMWWrNX3TsZeMGdsTB6/7spAYrLzWRizgRRbrWgPxG
 wIB85IojnfXKY9Q62hAhhcqw7w+REiPQxHKQbG20XG/2CDewtVcJKCdKidYbQ2YlPL
 JRzuvq1j629yw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=de5gkKxQ
Subject: [Buildroot] [PATCH 05/14] package/python-markdown: bump version to
 3.10
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://python-markdown.github.io/changelog/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-markdown/python-markdown.hash | 4 ++--
 package/python-markdown/python-markdown.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-markdown/python-markdown.hash b/package/python-markdown/python-markdown.hash
index 25725b3c8e..4aa4ff7c1c 100644
--- a/package/python-markdown/python-markdown.hash
+++ b/package/python-markdown/python-markdown.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/markdown/json
-md5  46aaa9fe3d42144f185368e819b7e720  markdown-3.9.tar.gz
-sha256  d2900fe1782bd33bdbbd56859defef70c2e78fc46668f8eb9df3128138f2cb6a  markdown-3.9.tar.gz
+md5  357bb6397bf50ee1b15f2de751a8e44f  markdown-3.10.tar.gz
+sha256  37062d4f2aa4b2b6b32aefb80faa300f82cc790cb949a35b8caede34f2b68c0e  markdown-3.10.tar.gz
 # Locally computed sha256 checksums
 sha256  7ba4eb6d10b32b2d11dce13821340351cdbbb30ba8ccc67841db2ffd86e79aca  LICENSE.md
diff --git a/package/python-markdown/python-markdown.mk b/package/python-markdown/python-markdown.mk
index 6fcdd6b830..2dc699c22f 100644
--- a/package/python-markdown/python-markdown.mk
+++ b/package/python-markdown/python-markdown.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKDOWN_VERSION = 3.9
+PYTHON_MARKDOWN_VERSION = 3.10
 PYTHON_MARKDOWN_SOURCE = markdown-$(PYTHON_MARKDOWN_VERSION).tar.gz
-PYTHON_MARKDOWN_SITE = https://files.pythonhosted.org/packages/8d/37/02347f6d6d8279247a5837082ebc26fc0d5aaeaf75aa013fcbb433c777ab
+PYTHON_MARKDOWN_SITE = https://files.pythonhosted.org/packages/7d/ab/7dd27d9d863b3376fcf23a5a13cb5d024aed1db46f963f1b5735ae43b3be
 PYTHON_MARKDOWN_LICENSE = BSD-3-Clause
 PYTHON_MARKDOWN_LICENSE_FILES = LICENSE.md
 PYTHON_MARKDOWN_SETUP_TYPE = setuptools
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
