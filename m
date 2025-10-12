Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72FCCCD184
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 18:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B327C81212;
	Sun, 12 Oct 2025 18:20:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sDz4BhAgXqfl; Sun, 12 Oct 2025 18:20:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0081811FB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0081811FB;
	Sun, 12 Oct 2025 18:20:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 028D5BC
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD62D4008C
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:20:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q3ChV6rYT890 for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 18:20:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AF1824008B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF1824008B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AF1824008B
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:20:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A4D1AA4C6706;
 Sun, 12 Oct 2025 20:20:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45202)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v80g4-000000000yp-3vsg;
 Sun, 12 Oct 2025 18:20:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 20:19:58 +0200
Message-ID: <20251012182016.2711834-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251012182016.2711834-1-bernd@kuhls.net>
References: <20251012182016.2711834-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760293217;
 bh=P9zroWHIn8eEEwVovQAMaouhuNeaVGnByAubq0MmAEk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=A5l88xq7x7Z/7jvf/O8D5XwRQ91YkIFtkjUYGi8c8it4AMmWwDmZCFjMok5mBStsk
 k4FY5iLMKWsUyRpZRp8cLAEnYTRK/OhdTrLZd5dBkt+HUvKungVKBdRmm8FSPO/2AF
 ApJfh2wJzdQWHUH3nxTKhwEeMAW9h3+KKZtvQ4qcW+0uV39rrxjX97mvp2M77OVIRG
 h8ajsFWKll9Hpz4PjbcIl3hoj4WwPu+UvAqKMHowqvTESE3ZhNL0O8KA6djBSwhaOv
 4wBbExe/w3/KDIsO4W3e5WGKmtEcoEqgkXqUIb+ogovK+iA6nVWrmnaEtuevyQIfeA
 qIysgk+evRBjg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=A5l88xq7
Subject: [Buildroot] [PATCH 03/21] package/python-asyncssh: bump version to
 2.21.1
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
Cc: Attila Wagner <attila.wagner@onyxinsight.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Grzegorz Blach <grzegorz@blach.pl>,
 James Hilliard <james.hilliard1@gmail.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/ronf/asyncssh/blob/v2.21.1/docs/changes.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-asyncssh/python-asyncssh.hash | 4 ++--
 package/python-asyncssh/python-asyncssh.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-asyncssh/python-asyncssh.hash b/package/python-asyncssh/python-asyncssh.hash
index 604e57bd66..e484386cab 100644
--- a/package/python-asyncssh/python-asyncssh.hash
+++ b/package/python-asyncssh/python-asyncssh.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/asyncssh/json
-md5  2405165d0ccd23ae8ba6cfcf92d6a0dc  asyncssh-2.21.0.tar.gz
-sha256  450fe13bb8d86a8f4e7d7b5fafce7791181ca3e7c92e15bbc45dfb25866e48b3  asyncssh-2.21.0.tar.gz
+md5  367f96d0ad12d7a3a44d6b1c4e7c6b8b  asyncssh-2.21.1.tar.gz
+sha256  9943802955e2131536c2b1e71aacc68f56973a399937ed0b725086d7461c990c  asyncssh-2.21.1.tar.gz
 # Locally computed sha256 checksums
 sha256  0becf16567beb77fa252b7664631dd177c8f9a1889e48995b45379c7130e5303  LICENSE
 sha256  68c286b0cf4507bec8922103efe861adb0bd3218003b1ec1b25e2e64bdd76bd3  COPYRIGHT
diff --git a/package/python-asyncssh/python-asyncssh.mk b/package/python-asyncssh/python-asyncssh.mk
index 24d0e0474f..6fad7924c3 100644
--- a/package/python-asyncssh/python-asyncssh.mk
+++ b/package/python-asyncssh/python-asyncssh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASYNCSSH_VERSION = 2.21.0
+PYTHON_ASYNCSSH_VERSION = 2.21.1
 PYTHON_ASYNCSSH_SOURCE = asyncssh-$(PYTHON_ASYNCSSH_VERSION).tar.gz
-PYTHON_ASYNCSSH_SITE = https://files.pythonhosted.org/packages/e8/d6/823ed5a227f7da70b33681e49eec4a36fae31b9296b27a8d6aead2bd3f77
+PYTHON_ASYNCSSH_SITE = https://files.pythonhosted.org/packages/6b/b8/065c20bb5c9b8991648c0f25b13e445b4f51556cc3fdd0ad13ce4787c156
 PYTHON_ASYNCSSH_SETUP_TYPE = setuptools
 PYTHON_ASYNCSSH_LICENSE = EPL-2.0 or GPL-2.0+
 PYTHON_ASYNCSSH_LICENSE_FILES = LICENSE COPYRIGHT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
