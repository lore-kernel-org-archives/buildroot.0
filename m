Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52AD10706DD
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABE2641550;
	Sat, 14 Mar 2026 14:19:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NTK5XT9JYGYp; Sat, 14 Mar 2026 14:19:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7A744154F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497968;
	bh=mL/mm2vBasAbrbnq6ATGbjtBSrkA4jh+xYtnma37Y3g=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=qJ/TvjM9zX670py1RggSIhnj00NZXADn09GSUBsD9VYlfMrfvviGRrGDdrG2L1v3h
	 2cFznN6BLp58PAr/I/fMs2ZTT3pc0pjTTAIqTqPzFZqEdX0451iq99IvI9dcyuzz8A
	 oFA0YlpKfyZELbfavgvqz/cTjaFyuR0vBjpTJ+MWG4jHjZ0HkXfWM4IpboNPDkpZTo
	 GUMxLRBwiwM11kq7KI0YeCJMu+NObgQZEJqUFBSxZO3NlFYjj4VlkKQgTDMM8FpmrA
	 S+Ucr84xNEu0g8ukcD71Gy83sCAyi+HiIhSyGckyFkJcAz8Zw1gXD8zvWVtpiZKeLF
	 38HNJaFSJgDvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7A744154F;
	Sat, 14 Mar 2026 14:19:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 02A92201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E84F860788
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:19:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CnaRst7LUunS for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:19:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DA2E460781
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA2E460781
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA2E460781
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:19:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2B171A4C1871;
 Sat, 14 Mar 2026 15:07:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdS-000000003UM-3b5Q;
 Sat, 14 Mar 2026 14:06:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:17 +0100
Message-ID: <20260314140633.2967249-21-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497222;
 bh=zNvkIw0Hd0HVXaV1ZvsTUgXftuRZ0DQSiEFsObol5sw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ZkbZOzdRl6ZoiIWO4OmtpRE13QVMRlbBKDvXHJrfYn64RX3SVf5e/ZBkpAOntXESx
 qVPUCC9sQLsMyRk2llkt1pPJOQWPnGJNQqJNzSnhJTx4RntYlZ28gfpDbd6JO7sxLx
 4Pk9mAGqN/nbHYaLnvot2U8PqbtF0rilXofC+k0ldOoTH00O/qYu6Nn9fV/2RqZqrK
 wLwjn9Oz5molrW3oftcnn+nsSOysfqN4Vgad7Gu3RPKHjfck3BBPRSyeReDwSGH/5W
 Uxf0Fsvh6ReTNAsKhvQXQsHiFcdgHvUtV1yETaDCAI7GiQah/XxMZftOXXPD7KWJIs
 Z5BxJRz7TFqNQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ZkbZOzdR
Subject: [Buildroot] [PATCH 21/96] package/python-google-auth: bump version
 to 2.49.1
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

https://github.com/googleapis/google-cloud-python/blob/main/packages/google-auth/CHANGELOG.md

2.47.0 removed the dependency to cachetools:
https://github.com/googleapis/google-auth-library-python/commit/5c07e1c4f52bc77a1b16fa3b7b3c5269c242f6f4

2.48.0 added a dependency to cryptography:
https://github.com/googleapis/google-auth-library-python/commit/52558ae2881b1e6555f6f5c0d76365c15807ead9

2.49.1 removed the dependency to rsa:
https://github.com/googleapis/google-cloud-python/commit/e8927b9c0257912dc3eca42307bde10c505e3975

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-google-auth/Config.in               | 3 +--
 package/python-google-auth/python-google-auth.hash | 4 ++--
 package/python-google-auth/python-google-auth.mk   | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-google-auth/Config.in b/package/python-google-auth/Config.in
index eb5be9cda5..bfb7159170 100644
--- a/package/python-google-auth/Config.in
+++ b/package/python-google-auth/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_PYTHON_GOOGLE_AUTH
 	bool "python-google-auth"
-	select BR2_PACKAGE_PYTHON_CACHETOOLS # runtime
+	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	select BR2_PACKAGE_PYTHON_PYASN1_MODULES # runtime
-	select BR2_PACKAGE_PYTHON_RSA # runtime
 	help
 	  Google Authentication Library.
 
diff --git a/package/python-google-auth/python-google-auth.hash b/package/python-google-auth/python-google-auth.hash
index 6a7b5cd170..9a8aa4b204 100644
--- a/package/python-google-auth/python-google-auth.hash
+++ b/package/python-google-auth/python-google-auth.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-auth/json
-md5  702a1aa7d2a65e7ae2702167be9183f4  google_auth-2.45.0.tar.gz
-sha256  90d3f41b6b72ea72dd9811e765699ee491ab24139f34ebf1ca2b9cc0c38708f3  google_auth-2.45.0.tar.gz
+md5  9e586b998d814cf0a35e98f3221181ae  google_auth-2.49.1.tar.gz
+sha256  16d40da1c3c5a0533f57d268fe72e0ebb0ae1cc3b567024122651c045d879b64  google_auth-2.49.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-google-auth/python-google-auth.mk b/package/python-google-auth/python-google-auth.mk
index 69c2a32b70..8e54c52f49 100644
--- a/package/python-google-auth/python-google-auth.mk
+++ b/package/python-google-auth/python-google-auth.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_AUTH_VERSION = 2.45.0
+PYTHON_GOOGLE_AUTH_VERSION = 2.49.1
 PYTHON_GOOGLE_AUTH_SOURCE = google_auth-$(PYTHON_GOOGLE_AUTH_VERSION).tar.gz
-PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/e5/00/3c794502a8b892c404b2dea5b3650eb21bfc7069612fbfd15c7f17c1cb0d
+PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/ea/80/6a696a07d3d3b0a92488933532f03dbefa4a24ab80fb231395b9a2a1be77
 PYTHON_GOOGLE_AUTH_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_AUTH_LICENSE = Apache-2.0
 PYTHON_GOOGLE_AUTH_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
