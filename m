Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DDFD637A3
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 19:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDE9C61070;
	Tue, 16 Dec 2025 19:42:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oPs-K5OVG-MQ; Tue, 16 Dec 2025 19:42:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7E2D6104B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765914122;
	bh=FwuKqUyPwbE54/eR/qwIIW2BDZ0AB56vbHBIW55aGqg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=D446nsPtm3rahy8M0NhrNXRQh+rQGlnUMYvdXdztMn+kxIidx5Ine+LcN+MuOn93T
	 tGVkdUS3Lme8CNnCrNSyrhX/8Mh9PoaUgWZstjo3Sa5m6u3EgAkT7IDQ9O4Yjzuk12
	 PQx5mKRYuOShJ2P1VCiO/pbbELw1SjjdhQOmVj5yrt621A1PXFL121FYHTHwf44oKq
	 TWjM+2FZMNqpLztiyPNkMiBB3UP3P4xpOp2k44TkckQy+Nx6UWEr+v4YhGtY+rvzna
	 V8yMR5GCGKi0E7eP5E/k1k9vJNlGeflizV4MjdEfB+8lNEVSww+ZxKrhGCrdXNKJJ9
	 8h5d9MsdxOieQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7E2D6104B;
	Tue, 16 Dec 2025 19:42:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A78F5364
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A14780AA0
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:42:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tJK996u4SSgM for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 19:42:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8B2E5808D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B2E5808D0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B2E5808D0
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:42:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A64B8A4C459A;
 Tue, 16 Dec 2025 20:41:28 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47366)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVav9-000000000Bj-21WO;
 Tue, 16 Dec 2025 19:41:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 16 Dec 2025 20:41:01 +0100
Message-ID: <20251216194119.3020421-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251216194119.3020421-1-bernd@kuhls.net>
References: <20251216194119.3020421-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765914088;
 bh=SedtLrAfqHn4E4f8ag+P1vidKApeHxvm9HzPCiBPZ2A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ULgUiTF99LGul7MafhSTA+JEp8QIxWKc7PY+GYnxYc0P5QxgxS8k34YQY0uf0VqzY
 0kttlHTaoCzybDUtzuuRnr5rlsCZBOMecoknlN+bL4m6RCdtHWcm3uWkTh14A4upxQ
 I4io46FmGwD+BYKj984uz7qrlSysgODWQ4NdUcAXH98mbD6BsdLjzb237i6BzIukHz
 6e8J+HJH1bw0ijlXMZJXJw9sXV5lnSuu2q5yHb1lIfmSF7oiLaZCCXqor32LHQOYx8
 jlx3cuKbc9STUoP9TQjQR6YNGf5ShUa93ELFowamylsSBOjSi+/w5RkSt2IX5spDnC
 y3rYZDWZMOq8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ULgUiTF9
Subject: [Buildroot] [PATCH 08/26] package/python-tomlkit: bump version to
 0.13.3
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
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/python-poetry/tomlkit/blob/0.13.3/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-tomlkit/python-tomlkit.hash | 4 ++--
 package/python-tomlkit/python-tomlkit.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tomlkit/python-tomlkit.hash b/package/python-tomlkit/python-tomlkit.hash
index 21e61dd5fc..1e6fe31c0a 100644
--- a/package/python-tomlkit/python-tomlkit.hash
+++ b/package/python-tomlkit/python-tomlkit.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tomlkit/json
-md5  0db1a3750c64b141720f05430df9b433  tomlkit-0.13.2.tar.gz
-sha256  fff5fe59a87295b278abd31bec92c15d9bc4a06885ab12bcea52c71119392e79  tomlkit-0.13.2.tar.gz
+md5  b77382a3de2e0c1ab715ad456139e260  tomlkit-0.13.3.tar.gz
+sha256  430cf247ee57df2b94ee3fbe588e71d362a941ebb545dec29b53961d61add2a1  tomlkit-0.13.3.tar.gz
 # Locally computed sha256 checksums
 sha256  f2f9b460ba719da6626add264d3782f275a4ff7aab677beda08b330911e23adb  LICENSE
diff --git a/package/python-tomlkit/python-tomlkit.mk b/package/python-tomlkit/python-tomlkit.mk
index 79138d69e8..51e6e40483 100644
--- a/package/python-tomlkit/python-tomlkit.mk
+++ b/package/python-tomlkit/python-tomlkit.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TOMLKIT_VERSION = 0.13.2
+PYTHON_TOMLKIT_VERSION = 0.13.3
 PYTHON_TOMLKIT_SOURCE = tomlkit-$(PYTHON_TOMLKIT_VERSION).tar.gz
-PYTHON_TOMLKIT_SITE = https://files.pythonhosted.org/packages/b1/09/a439bec5888f00a54b8b9f05fa94d7f901d6735ef4e55dcec9bc37b5d8fa
+PYTHON_TOMLKIT_SITE = https://files.pythonhosted.org/packages/cc/18/0bbf3884e9eaa38819ebe46a7bd25dcd56b67434402b66a58c4b8e552575
 PYTHON_TOMLKIT_SETUP_TYPE = poetry
 PYTHON_TOMLKIT_LICENSE = MIT
 PYTHON_TOMLKIT_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
