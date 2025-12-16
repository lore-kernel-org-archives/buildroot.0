Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75C9D609DE
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 19:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B90F461082;
	Tue, 16 Dec 2025 19:50:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_DydRZekVoR; Tue, 16 Dec 2025 19:50:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEA7861065
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765914620;
	bh=vLZhHulRV5H7Mxs9Pmoi3TQE/my/deV3iopXkqtrjuY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=RLpZytWFbFDVB1CNKzz5nKQam2PEkKrqRJA+e6+LHikcaSTxeCWZLAIa6ooU8NGia
	 0GzIzXhH7kB79iHQo9TQ1pjqQcbCHEFh5sLYier3HDBqpdb2KeJsH/rGV1JUx494ld
	 PjXwCCQGVVXVMwdq9agM0t/F9GizHz7x9iUtHYO10TY3Wun/m+lKymoeRBfl/P6a4k
	 WoPjoBytqfGkXPz+huRYqKNAz44r78ALrxU6cIKg6DVlZX71W2LWZvfwM7CyvdgySc
	 YvZES86r+ygy1VZEvN+Pz/7tdcX+TF8Svz+bxhsA9gFnpN/NQlmgPc/As4GNvW67H8
	 XsoDHrTHAh4Mg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEA7861065;
	Tue, 16 Dec 2025 19:50:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D0A53364
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B780140103
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:50:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Fkh_d9uYfom for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 19:50:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ABC7740052
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABC7740052
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ABC7740052
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:50:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 137C7A4C3B99;
 Tue, 16 Dec 2025 20:50:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47630)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVb3a-000000001j6-1tkl;
 Tue, 16 Dec 2025 19:50:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 16 Dec 2025 20:50:02 +0100
Message-ID: <20251216195002.3031273-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251216195002.3031273-1-bernd@kuhls.net>
References: <20251216195002.3031273-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765914603;
 bh=MhCNuzyJ54fRJuVhOh3f7tmYaMo70letpeZ/rGsCTfs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=cZaqzEjkEMevUnGj41SU3yN3bVP/OZhEnmjZcjWyFPBMwNyFJt5Xcp40sF1P4Zcfd
 bQxejo+qpk9crBycXSCbUTjFyZ6hOwZzNdsFY7R9cjQi9QITZ2EwvgnFOa/IYa/+4r
 PBt9T0gHu+8Vqgy/Pljse22zOPiGrpG9czvaXWgv9AOruiH8/tQilhfwoji8Wty9kL
 4Jpo1nEzm4cYkD1odiwkoFrvpiK8u1wtspFsYaQGWoGynswpn2ArWaRfx6+uwol5Ib
 2jkI9rAG2CxpzuGr4n/ErpCCA4FbBirfy8tbFkP4zsK8XWglVb5iU/Af9Z2UdL6tRg
 ALN2ZKJZ4jhuA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=cZaqzEjk
Subject: [Buildroot] [PATCH 2/2] package/python-aiosqlite: bump version to
 0.22.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/omnilib/aiosqlite/blob/v0.22.0/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-aiosqlite/python-aiosqlite.hash | 4 ++--
 package/python-aiosqlite/python-aiosqlite.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiosqlite/python-aiosqlite.hash b/package/python-aiosqlite/python-aiosqlite.hash
index eed222f80f..b47cdaf6a2 100644
--- a/package/python-aiosqlite/python-aiosqlite.hash
+++ b/package/python-aiosqlite/python-aiosqlite.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiosqlite/json
-md5  693b491a6ad7caa281618a83bf83ddc6  aiosqlite-0.21.0.tar.gz
-sha256  131bb8056daa3bc875608c631c678cda73922a2d4ba8aec373b19f18c17e7aa3  aiosqlite-0.21.0.tar.gz
+md5  1277d7c460a278cc165ae52be14f8fa9  aiosqlite-0.22.0.tar.gz
+sha256  7e9e52d72b319fcdeac727668975056c49720c995176dc57370935e5ba162bb9  aiosqlite-0.22.0.tar.gz
 # Locally computed sha256 checksums
 sha256  ab0c171dc3ef8bf325a84bb77d855421f2611335ddf6e08816b2922c4edc0f76  LICENSE
diff --git a/package/python-aiosqlite/python-aiosqlite.mk b/package/python-aiosqlite/python-aiosqlite.mk
index bdb222001e..208960954d 100644
--- a/package/python-aiosqlite/python-aiosqlite.mk
+++ b/package/python-aiosqlite/python-aiosqlite.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOSQLITE_VERSION = 0.21.0
+PYTHON_AIOSQLITE_VERSION = 0.22.0
 PYTHON_AIOSQLITE_SOURCE = aiosqlite-$(PYTHON_AIOSQLITE_VERSION).tar.gz
-PYTHON_AIOSQLITE_SITE = https://files.pythonhosted.org/packages/13/7d/8bca2bf9a247c2c5dfeec1d7a5f40db6518f88d314b8bca9da29670d2671
+PYTHON_AIOSQLITE_SITE = https://files.pythonhosted.org/packages/3a/0d/449c024bdabd0678ae07d804e60ed3b9786facd3add66f51eee67a0fccea
 PYTHON_AIOSQLITE_SETUP_TYPE = flit
 PYTHON_AIOSQLITE_LICENSE = MIT
 PYTHON_AIOSQLITE_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
