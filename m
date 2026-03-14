Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7749E10706DB
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E3C541539;
	Sat, 14 Mar 2026 14:19:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qrDiTNH2QO4i; Sat, 14 Mar 2026 14:19:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A8364153A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497955;
	bh=OEEOqMTCeFHJPmkNkkWIW20DZsx1y4nEsUrZCaF4eDU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ouD6/AlQKU/m8/0cVtJE+aZlUqQ3x09Au9yf5ngITB8EiZkQaEqWb51japzbQl71j
	 p9RvAd9kxbZw/qPwq09m//K6B8Smqx4jZhSCE5k7JBcvheWnHTHNWFNIzcIikHwAWe
	 C50KTnazqbbfmZUBHVWZv4hxRdDxpcPtYqnjXEgJ66KolYgIN0Ee9rmEPtcxFm/z9J
	 Xs2Gc+ME1/O2EoPiXU5aG+f00OUwupbliZ4NnW2UwQJ4QQ8m+jwpjqj+h2JfGuS6f+
	 XNFOCIAkKBuVi2rCBtq9CuKlmRobpfAmB7xurDxBIivkY1B0MkE6/ytjabefVQijhq
	 Sie5xTMD9IJgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A8364153A;
	Sat, 14 Mar 2026 14:19:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 08D48201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2FA941539
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:19:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H1qiV2fvZ9NM for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:19:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CF5A841536
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF5A841536
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF5A841536
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:19:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 255C1A4C1845;
 Sat, 14 Mar 2026 15:07:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdS-000000003UM-3DNA;
 Sat, 14 Mar 2026 14:06:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:16 +0100
Message-ID: <20260314140633.2967249-20-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497222;
 bh=UhFMF9w0x5KrbnpyadP83kIq9U5wJ2czjqoby0PRPcw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=NtA6+X7Rgyb9aauXe3ZGMKH5+E1IDKaShabq1gUtV5b3Jneg/IEfFebcSekkAQ2AW
 B1iA35XJeyZMio6UMxNGyzqdZRbHpOhg72rABnxidNfjgC65atu3YUl8jD2vKgPW3Z
 RDmjcrzqh+4wlr4VDwe/otDpBeIirTLJuEgpT5xYF5fizffkWdtgXVh00VBqvErelW
 LisD9MTUfCriapb0JZ29NcsfOCUIt2BPorMzY8B+TJruopSCrXQ3mxT9FVRIj03BWQ
 Swiz4bFxZmvefmkgLrcUhma/36I1XfUrXJAxkPbIVwxwP2cfqNyMvRNGzgBmDLurOa
 2fNKUvj7WekuA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=NtA6+X7R
Subject: [Buildroot] [PATCH 20/96] package/python-google-api-core: bump
 version to 2.30.0
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Ralf Dragon <hypnotoad@lindra.de>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Mauro Condarelli <mc5686@mclink.it>, Heiko Thiery <heiko.thiery@gmail.com>,
 Marcus Hoffmann <bubu@bubu1.eu>, Joseph Kogut <joseph.kogut@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Lionel Flandrin <lionel@svkt.org>, Fiona Klute <fiona.klute@gmx.de>,
 Colin Foster <colin.foster@in-advantage.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/googleapis/google-cloud-python/blob/main/packages/google-api-core/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-google-api-core/python-google-api-core.hash | 4 ++--
 package/python-google-api-core/python-google-api-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-google-api-core/python-google-api-core.hash b/package/python-google-api-core/python-google-api-core.hash
index 9e3c732773..83377ccd41 100644
--- a/package/python-google-api-core/python-google-api-core.hash
+++ b/package/python-google-api-core/python-google-api-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-api-core/json
-md5  fc633e6fd830f249f8dd205f10544660  google_api_core-2.28.1.tar.gz
-sha256  2b405df02d68e68ce0fbc138559e6036559e685159d148ae5861013dc201baf8  google_api_core-2.28.1.tar.gz
+md5  8c5ab43e8f25708f22a6f28d919bb45f  google_api_core-2.30.0.tar.gz
+sha256  02edfa9fab31e17fc0befb5f161b3bf93c9096d99aed584625f38065c511ad9b  google_api_core-2.30.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-google-api-core/python-google-api-core.mk b/package/python-google-api-core/python-google-api-core.mk
index 908a37c3e4..28c4518aef 100644
--- a/package/python-google-api-core/python-google-api-core.mk
+++ b/package/python-google-api-core/python-google-api-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_API_CORE_VERSION = 2.28.1
+PYTHON_GOOGLE_API_CORE_VERSION = 2.30.0
 PYTHON_GOOGLE_API_CORE_SOURCE = google_api_core-$(PYTHON_GOOGLE_API_CORE_VERSION).tar.gz
-PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/61/da/83d7043169ac2c8c7469f0e375610d78ae2160134bf1b80634c482fa079c
+PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/22/98/586ec94553b569080caef635f98a3723db36a38eac0e3d7eb3ea9d2e4b9a
 PYTHON_GOOGLE_API_CORE_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_API_CORE_LICENSE = Apache-2.0
 PYTHON_GOOGLE_API_CORE_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
