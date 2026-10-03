Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF64CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F32A60EBA;
	Sat,  3 Oct 2026 15:56:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id el52NdbOCoag; Sat,  3 Oct 2026 15:56:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3A53461031
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791043015;
	b=Es5r1gUrzvpRcq2rCvnvkkeYyYANC2PknMz8RDAGmTqpMyNDZVPNy36jZzbvHpoDxzsF
	 nZ6uFt4DY+hY6dTY0Nghu5QOrBtI5E4gRNJE3TtNdzDw+wpq9JlLvoTkMjK9TLFiLYavR
	 B5jtdRms+93NzVJb6bY3k8PLdFJmQFfRZbqEuFlketosfYuORmE1HNaDwL5QWKkVXd3F3
	 UHbw+ni9aoDfEpO4bmFtupeXuuGcNMLzNPeSrHRmvTlFXVyvQqxrxq5klaXs6/d3evk1c
	 D9+b3dJ+b0Une9TfQek08ETOh1UD9ZCJXdevz3p0mOuqKLUulba9PNDaE+Dwa6k5DPg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791043015;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=s7qSbkOHt6hKzIyoiVwsoRQ/wiGgDR8ZwvJT5AyO6FQ=;
	b=Zv1C+Swe7kkLUuoh4REhl30gHn8fYonnTRu3Jh6guLPi08GI4c8P6RYgteA7r9vu7ztn
	 xwNaES8aDnnp8pKJRhTobQ9TwGF9jjFI9rTi3zHyPhH5eeIqbrOWC9jJ88Ef6tivVjC7U
	 7UtMsOKG8Rl/OmV7FmPipSyleOOeydhZb+T4+kyetMsucrZURMaPlRCvUBk6FSsJgQY0B
	 ytTX4baLoP5UJZTsLF9sl6V2fjXTsPyaFA7TVakrgrPUmiFOGUETryy8j1M7YQ+cssIIZ
	 GERdLc11rbT5np1ndItvN5R3noE8BAqt6GlmnCUtCAaykGD4JIDSpR98eipPxAtBimA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791043015;
	bh=s7qSbkOHt6hKzIyoiVwsoRQ/wiGgDR8ZwvJT5AyO6FQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZEaEc1UzelVd9I2H0z7mp9OnELlgug4i4+yr7YGbV72D4cIzVjVpB4Rke7lXcQWXs
	 jCBuK9Em/GMDRBol8pRaRbyz6oeanHMWFEHLxAa3vY97Wodmdr6PDoSm8VawGgi+Uj
	 SkWsw94w0sNNrF5+N22LeSFBTYYwLitpbK6V/UldypUliVZNZqWnIBr+Fzxo7uH/6C
	 3RfFg9l2/QjnNCE+M65dB7wf6JAjKJj3yORVpZkA48VyYM+WgQtvw57n818924izmm
	 YYdf49BaVPJIYL6J7qfABqlKaPnMbLtwNUL4Jx6oKj3rYhARyyhwN6PaoIzdf3jfu+
	 Ju5/TXt4txHAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A53461031;
	Sat,  3 Oct 2026 15:56:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 240CE1D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 11C0F6066E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hj_V6cdNQGNI for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 99028606BA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042848;
 b=FLdkJrtHwxpj0+gNaJ4x7koPCUqGB/SdUXJMtXZtxnsO9x/1Lsx6YGHiD4+t3PZ47u8u
 P+6zIF/ZAFQgNRYA3O+9utivXFh4y13f/HHzvalNe5VOykwmSagbk8yZdUcvfOg2OnTaz
 XsDhSEetCbfp0xNySy4/EEUfDw+crgAgDrTZezWKf2QOkT2l18Q6Ob4owNN+KkCrf2hOm
 e3Y7ggrR9KIY7tM0uQCwDr/ZK+UhUthacX5Srh/mzknPEuGQRBxdhB1RYy1mYKxu9UBDk
 0OKsYTQ/mVaaScWHVm+PtIijTZ3lImcNOQ0kySRVIsmBG7G6gTWAcGS+qt153QyQMOw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042848;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Zu91dlF1ERrBR8pMQ6KNOZZdEda03NNxgTDVRIaui50=;
 b=ovEhUS5If8kZWJKEh/2OdZLCC5BM2O/L5jiK0DY280OeF0vb2q0SWaFOKyKtNoFlqnaR
 +jVUkiPdL19jniloAa4qmaYqJxWRsczrpjHk10/2HgOVAmZ3/ZNKTvirG4byphBwdfdEu
 8k19UyKaJvY5hbKQR0iwaiFQcnXoqSLA3EESmj7g/ON6/j8umNztVHZQD1aHxGc3boptS
 FDoWUoRwFMkDdaPcinGW3gHkFYu6V/x5gt+WkjWr/JoyL6Vg3U3tPVNGfYhNjstk/RTSf
 tPKb7QiBQQUM7vG8YRP1AUVoJwZNycbA71pqe+8FDj0vD2RjealrOV6gPWtZlINGh+w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99028606BA
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D925F8A574; Sat,  3 Oct 2026 15:52:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d55366889bc1aa30ffda0274e4f90fb9afd6e5a7
X-Git-Newrev: 3f40980e3897869d1089fa73f15c323e6c596345
X-Patchwork-Hint: ignore
Message-Id: <20261003155253.D925F8A574@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-msgpack: bump version to
 1.2.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3f40980e3897869d1089fa73f15c323e6c596345
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Wojciech M. Zabolotny <wzab01@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-msgpack/python-msgpack.hash | 4 ++--
 package/python-msgpack/python-msgpack.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-msgpack/python-msgpack.hash b/package/python-msgpack/python-msgpack.hash
index d17cd026b1..2b34d6a7c4 100644
--- a/package/python-msgpack/python-msgpack.hash
+++ b/package/python-msgpack/python-msgpack.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/msgpack/json
-md5  b69973fa3325abdced4051f5ef3847d3  msgpack-1.1.2.tar.gz
-sha256  3b60763c1373dd60f398488069bcdc703cd08a711477b5d480eecc9f9626f47e  msgpack-1.1.2.tar.gz
+md5  92fa9532cda14ebc2bc41266481e905b  msgpack-1.2.2.tar.gz
+sha256  9eb0b0e602064527a045ea28c4f174ed69383587e29cebe28947e3b84106eb2a  msgpack-1.2.2.tar.gz
 # Locally computed sha256 checksums
 sha256  492dedba85da5872f78e6091bcd1fea474d660d35acb4dee964b8aab3f007427  COPYING
diff --git a/package/python-msgpack/python-msgpack.mk b/package/python-msgpack/python-msgpack.mk
index 76606268ae..231d4f564c 100644
--- a/package/python-msgpack/python-msgpack.mk
+++ b/package/python-msgpack/python-msgpack.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MSGPACK_VERSION = 1.1.2
+PYTHON_MSGPACK_VERSION = 1.2.2
 PYTHON_MSGPACK_SOURCE = msgpack-$(PYTHON_MSGPACK_VERSION).tar.gz
-PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/4d/f2/bfb55a6236ed8725a96b0aa3acbd0ec17588e6a2c3b62a93eb513ed8783f
+PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/6d/44/ea2100ec54d30c46ee9dba10a3bfb79b655e96c6df237238a3234c75869b
 PYTHON_MSGPACK_LICENSE = Apache-2.0
 PYTHON_MSGPACK_LICENSE_FILES = COPYING
 PYTHON_MSGPACK_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
