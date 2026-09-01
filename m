Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270D5C61DD3
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 19:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2889407D0;
	Tue,  1 Sep 2026 19:27:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jD78RqO2_hVA; Tue,  1 Sep 2026 19:27:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788290854;
	bh=XJGF2N6eN8lFMYvSCm92mL/Y/yRuJzkPFS3j3+ByaxE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TtYU6s9JnJzXm2282CA+nlEgxLDnwAAtRvBzAToi3e3Kxp31Q49zzi67OIHB6BrO0
	 EpLi4fsaFQ6mHP4XU6ublsaBmWdG5ry+a6G3v3dmq5NWRxjB76Npjdsa1T4SI2NjJ1
	 E+K0zeJgepGvPRKs/hFqrp30y0K+E7hnTsepUGkozFEhfleNCbHPrg8OiQ9KVDqDOq
	 5mvi4fmsijGONlAbjemZ9x+ZOtvd1AETft+dCBrHzS8SEKwbHWSsuWX97s8BjYhlTx
	 F2oTyoXCTvlWZ07A3mqHkebRZFkOTfcgZyNWZ0m2nFbtnh5/uhj+9G4XdlitHaDz7b
	 vq9Xz2dp1owYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3504640757;
	Tue,  1 Sep 2026 19:27:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DA71E363
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 19:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0BC6607AE
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 19:27:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aGBmklBSwk6D for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 19:27:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=P8NkO5R0
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 017F160749
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 19:27:29 +0000 (UTC)
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256;
 b=P8NkO5R0LJz4BMxHBvWzKquVbO2m9rEIgfiXjYLAVD/rZui7BKyQEOyksbq689SmyNGCQd6YvLc44ECCk7L9+dq0KJuqrTKqMmacHqaLU0mepuTPcFEgd/lIqSkn0X4sQ6g7GycZ/eMfq0PeY5PW+gZm+6s0QqZBgUoeVZMjyXqXLDKcaYLZwx9EIBC2iTlFq4hCu+Q7yo9kgCjNga/elmzY1i08ciBnwjD4//MHyGx7b5pR3+8/8uMl8aeKLQJEqOmERfI9MD6ZhP4fjWArvqZn7j7Q/xPYMu9gjudTCMHqe7BhC78XB9qcLaY1TnUTYrhupFYxlkvWG9RsJo1MMw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=teYD412F9ZBIS7Q9rNbS+J56iNekKjMIHN2oT65yTTI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1064214295; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 01 Sep 2026 19:27:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1x1U8j-00000004Hkm-1iTq;
 Tue, 01 Sep 2026 21:27:25 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue,  1 Sep 2026 21:27:23 +0200
Message-ID: <20260901192724.1021544-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Subject: [Buildroot] [PATCH] package/libgcrypt: bump version to 1.2.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.gnu.org/archive/html/info-gnu/2026-08/msg00007.html

Contains a number of bugfixes, some of which may have (low severity)
security impact.  As stated by Werner Koch:

 All in all we received 26 reports alone from ANSSI but as even the reporter
 mentioned, the real world attack severity is not critical.  Thus we don't
 consider 1.12.3 a security fix release.  There are some bugs which should
 be fixed to avoid crashes, and thus may lead to DoS.  However, 16384 bit
 RSA keys can also be used for a practical DoS; it all depends on your use
 case.

https://www.openwall.com/lists/oss-security/2026/08/31/11

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgcrypt/libgcrypt.hash | 4 ++--
 package/libgcrypt/libgcrypt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index 7be6554d56..e76496a7e4 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  7b8ff21966a0b6e7a735466b9b9b55d9dac9fa87  libgcrypt-1.12.2.tar.bz2
-sha256  7ce33c2492221a0436f96a8500215e9f3e3dcb5fd26a757cd415e7a843babd5e  libgcrypt-1.12.2.tar.bz2
+sha1  b4654d75f0e5d0850cc699f02c9b44a06367502f  libgcrypt-1.12.3.tar.bz2
+sha256  98d1b0b3202d2b03fa754a35aa3cbbfcf526a3260d8d2ee213748001b1043006  libgcrypt-1.12.3.tar.bz2
 # Locally calculated
 sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING.LIB
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 0bc281da42..a49897fd4f 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.12.2
+LIBGCRYPT_VERSION = 1.12.3
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPL-2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
