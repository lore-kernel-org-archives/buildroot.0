Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C364C02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 22:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52E796076B;
	Mon,  3 Feb 2025 22:02:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ZPHQ2XFdME3; Mon,  3 Feb 2025 22:02:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D2B06078B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D2B06078B;
	Mon,  3 Feb 2025 22:02:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 739A512F
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 22:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 637466078B
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 22:02:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u5sKLVK8vnhP for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 22:02:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 89A6C60595
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89A6C60595
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 89A6C60595
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 22:02:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 4F6334437D;
 Mon,  3 Feb 2025 21:57:06 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  3 Feb 2025 22:56:53 +0100
Message-ID: <20250203215659.1178318-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeejhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdefiedvhfevieetgfethffgiefhjeevfefftdfhtddvffeuieeludehfeeguefgnecukfhppeduleegrdejkedrvdduuddrvddvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleegrdejkedrvdduuddrvddvtddphhgvlhhopeifihhnughsuhhrfhdrfihifhhighhuvghsthdrlhhotggrlhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738619826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=lGsckDo8ZAJrdQLIa83wyA747EC8AR5z7bJi3eoqvlY=;
 b=dLnewme22pgZ3iSGDYaholStxqrmeVfi+PHvcHuGj0KZOpbo6l+8QoB4Vt3EXLlxb1qJhh
 RX7azOBrARZsmXCJzuZg1eMd/gJczcbHbODsiyD2sgGSry1GhZA/VysSjatjTAZpAtNm6e
 8GakT+h4uFUXUUAXIH2OMz58DFLLDxJIllC6DSqTXawarB5ly34m8mpM7vKb2+5H1va1J0
 7/NQvLfhC4weGuD8AL0Lw9ZkgriXyA+K7f+dIXyQLbQXvrqq3Gsyr4GYuYc+zSKipnNOnK
 mrjc7Oa6308EeNBRstYfPZVNaKDrUT2WuBs31EeLZlRNe3I6+Vec5wR4dvDZkA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dLnewme2
Subject: [Buildroot] [PATCH] Bump binutils to 2.44
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

This patch does our usual dance of adding binutils 2.44, make 2.43 the
default, drop 2.41.

Thomas

Thomas Petazzoni (3):
  package/binutils: add support for version 2.44
  package/binutils: make 2.43 the default version
  package/binutils: drop binutils 2.41

 Config.in.legacy                              |   6 +
 ...ertion-fail-in-nios2_elf32_install_i.patch | 125 ------------------
 .../{2.41 => 2.44}/0001-sh-conf.patch         |  12 +-
 .../0002-poison-system-directories.patch      |  65 ++++-----
 package/binutils/Config.in.host               |  10 +-
 package/binutils/binutils.hash                |   2 +-
 package/binutils/binutils.mk                  |   2 +-
 7 files changed, 52 insertions(+), 170 deletions(-)
 delete mode 100644 package/binutils/2.41/0003-PR27597-nios-assertion-fail-in-nios2_elf32_install_i.patch
 rename package/binutils/{2.41 => 2.44}/0001-sh-conf.patch (84%)
 rename package/binutils/{2.41 => 2.44}/0002-poison-system-directories.patch (87%)

-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
