Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 726FBCA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B0A961003;
	Sat,  3 Oct 2026 15:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rF6o1utNeRjs; Sat,  3 Oct 2026 15:56:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 44E506100A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791043004;
	b=Ao1S7nTsLxg+OUomowlWrQ62jtglePKqr/G+huGc9cd3NnriuZ5eJvrY0wd3Io1VLZ1K
	 YO5R/UuPLKmVs5j0/0NCRsmDZeTHZZZk+ag9u2ddNVCwxa790TOLobq8VclVE1tM7rqkB
	 FS/3vZSKqMwCCWsd6R+HL+on2mNLRN2FX4YYuwF7kFsVkb5l+7f5rPh0jom9ZbrC5hkTZ
	 PFTDE+z89PSmusz07obqdX+DocQfVKuwvBrvXB210jH3TPJS5UBkzyZCSpx+qtpDPX0DY
	 2um9XX/b5JnGyTs+GCy7fF+Al7Ajl5Bl3Na/w8DrDRoFx+FH09eMKxXUzvdyyrqDS4Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791043004;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=sBQcC29J6LVZKrO4epYG2QL2jEX7KPg7UBz5gCHHBfc=;
	b=i0zaMvwUfqU27MTZNWesQBYmbBZe5bMpYB61DFANm38cBsyV+J7Zw8Z3bOiAswY1+h4o
	 MUI68joqZ+cB/NSB5+Tv4m9HhYejVOElbWTnckJVNP3yNICn4tEqfvo87wmy9Ss2I8I13
	 p2cIWc/7nDHOZKP0LgqmLPahXocwk7PGFibZaPtNYTJbwciPMsELsLHIXdpwJKvZ+HCDp
	 CkOk/0iRgpsWz7j1kptGffAfDre3LrLZWp0TIy80Wz9k+rUXmErQXH+hX4vVWPzuuSP+T
	 DPoFPUqEnFcEUZr/XZ5QLKX7Z7r93KA0pAbVc08tPEIjLLGajYnnGShLylrM4lG81gg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791043004;
	bh=sBQcC29J6LVZKrO4epYG2QL2jEX7KPg7UBz5gCHHBfc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RZjMX6ffkgju/KNkN3bmUX8oE5w2C8esYP6u36ZYwuwlYm7Wx3o5MMpeJ6DWX86zi
	 T2mAuTjMsIwbhTBLx5n9Ib6I+B4gUDN56a2XRk/4cchEjcm6MkD1I3Afd1lVtlka/Z
	 OpaxpeplLVQyDCmahmUxsyfXoRnK8ls8zrRbvA4ilZbjJJwxqok6yhMoBYm2Kg8cxM
	 ODsCtAM2k6gJmesDHt+ZRtUEfMOdS0EVEL5aI2SeqM/LWBjhgJRK3w9u+wD5LYtmUt
	 Tzjdf/UGxvomKhL4i+GctxxeokxEBRDQjd94Bu3wNC9vhJDOBZR+2C4CS1+NflTolk
	 idLHhsNGMhEVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44E506100A;
	Sat,  3 Oct 2026 15:56:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DADF335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9C6E60662
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qyd3ReiBf29g for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 720D4606BB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042847;
 b=DITDJ7BJ1LPo4DbFEJy3xA4wVgqGApWuWX+cai6pukmxxgudF0BDjuZTBFo66a2dkDBA
 v6azEiHa89LYxjL9gxxIGl5SovSgMRchqGyBJ4ckAQxF4l95BT6BtQy5sfu6xNCaH7D5J
 L/y76aS9Xq+Zj3Ahn3ZOe7bXlxnr8H+3j+H9jrX1KpqBzDqX1LNW0wvKqjCI8I2MsONxM
 KueYQOZRrBOIGzNTaobA5cnoqvIGd9rtVD0eX1l6n8CSgfDfdXNokNZLYuRABFEafIgBf
 1l/dabZYAaaNWBFEhW+IkMM+zYwZ72X+SqisYqm1lAr6B8Se9taJhHlt8kv06MOKRjQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042847;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=8FynlKCmAPrLu/jq8ThUNAowLow4E2jko/IgvHvAHN4=;
 b=j/7iKCtKqNF1TSkAVGLdIG4OJQIB/mfV44N1pqswLGOZKms3EtyzEMobMagCX6A2bkRa
 0oSeOsujuq5Qce3njMIXN12jgGUb4oHeEbfsMB2wOpm4EgNdktv/QsnGFy9xEbhwMBCP3
 m48zulgwMqXRagZAbEIEFHB9WwChjtdYjWlvA2svKMoe77ySpYJy10L/RWs2m9fS/6Wy/
 Zv8MxJIjBZGOOFq3E73ekyQ3nUac03NqcynoLzDCmtPz7FxQU+kedoNxSernUJH/RbkGY
 7K9lKouG7i6aZL39pGp46O9pGI7sh9Ml9lRZKbP0kIrUhsU+YtYEegsapxqcFNDwDaA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 720D4606BB
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B2A998A4B8; Sat,  3 Oct 2026 15:52:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 625f024d6ed9d182c03c6d94eb5b281a3afbb20b
X-Git-Newrev: ce869b9cddef81e45bc80df36535ef203eb1bd02
X-Patchwork-Hint: ignore
Message-Id: <20261003155252.B2A998A4B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-fonttools: bump version to
 4.66.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ce869b9cddef81e45bc80df36535ef203eb1bd02
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-fonttools/python-fonttools.hash | 4 ++--
 package/python-fonttools/python-fonttools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fonttools/python-fonttools.hash b/package/python-fonttools/python-fonttools.hash
index 9218c8dea4..57e03d1f08 100644
--- a/package/python-fonttools/python-fonttools.hash
+++ b/package/python-fonttools/python-fonttools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fonttools/json
-md5  cd04d1eee484599b2fa502b3ab5c186a  fonttools-4.62.1.tar.gz
-sha256  e54c75fd6041f1122476776880f7c3c3295ffa31962dc6ebe2543c00dca58b5d  fonttools-4.62.1.tar.gz
+md5  c9a3637bc4d32de7254a1cce3212eff2  fonttools-4.66.0.tar.gz
+sha256  ef0610dfe7bb5bf574d9bdad6f597403ebc9807d124ac6f148d7604b2609be98  fonttools-4.66.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6787208f83f659ccbc2223b2fde952ffa6f7e8aca62f1a8a2bf5bc51bb1b2383  LICENSE
diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
index 1eb8224197..16979468ae 100644
--- a/package/python-fonttools/python-fonttools.mk
+++ b/package/python-fonttools/python-fonttools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FONTTOOLS_VERSION = 4.62.1
+PYTHON_FONTTOOLS_VERSION = 4.66.0
 PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).tar.gz
-PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/9a/08/7012b00a9a5874311b639c3920270c36ee0c445b69d9989a85e5c92ebcb0
+PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/a2/24/86f9930b930b97fc82266083320f3c34643ef67261c32651e893db525aca
 PYTHON_FONTTOOLS_SETUP_TYPE = setuptools
 PYTHON_FONTTOOLS_LICENSE = MIT
 PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
