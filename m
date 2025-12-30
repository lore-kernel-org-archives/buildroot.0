Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E11EE57C2
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 22:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 044E760AF4;
	Tue, 30 Dec 2025 22:20:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 94xjJMqP4Q-j; Tue, 30 Dec 2025 22:20:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC717606CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767133239;
	bh=tbAFSPjbSyU/hUDTQVTG7xjRtGwZdCNEY9JYuEl2zEw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JbXsbmBDuVjDyjdhqOiWtMvqwbUJMwPxmuOWAu2pP5gyBKPn1Fij5Lno/xpfH8EPX
	 kL4uHSpvKbJ2vMODhsi+8v7mVlz+13nfc5Ke6soFWDEbvov5QjmOvwj8UhaTGeULOi
	 98Kw6Wt+seXsZMvUDzgtj6BY71l3weFohIAnhioX5pMMsafJ+MiXiaePGSzwgjMjAB
	 i5fLCQG4XCf4B9KW4+ayeAjR7Y4EMia966vAFSXGJX95RAcNZs5ftBpHVxNRclVXrg
	 DGdnIhUtuMxOT9cascevTX8qAecDNuuEgog40P6aSqbryxUtKLQr2pcKXIeeotTV1B
	 AxXyJBuzX2oOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC717606CE;
	Tue, 30 Dec 2025 22:20:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 01999277
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E773880FB1
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:20:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O7M_7KZay7E4 for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 22:20:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.117;
 helo=smtpcmd03117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D731680CCA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D731680CCA
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D731680CCA
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:20:34 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id ai4tvG2bxgRm2ai4uvccF7; Tue, 30 Dec 2025 23:20:32 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Alexander Dahl <post@lespocky.de>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 30 Dec 2025 23:20:30 +0100
Message-ID: <20251230222031.3626500-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfAZEQdJQCp2qSMHu14cIqbhcYPQ6YmURAokkD68sSNHTd4cbcfbobUF7RYGdpt+8pIH6vxHNXbaOCQvweysKw/fL4f+pKaxZKmB8P0SwKrZKU4hlK3MG
 OKG+6rIAH+dLUWVOGrjhck0TeYDc4R1VX1CTt2sWWLDJY9BllKuKsJSejCtWpV11mRm8ZB6JkmM+bfgVS3Ea/a/pPIWIBebtp8V75xjkyvQl+i9UH9SLSW4y
 IgawseGXpEZ+cXIL8A/0adkNYpMEOzB6Lh0kYWxjfT6nIpIIzqJMBgLKLr4DwB0R1sSq4EQxD+S9nlkncyD5Dg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1767133232; bh=JBG8MiUOFJFkMYaXmvDYb/cR00qow3YLihK8BfGvpR8=;
 h=From:To:Subject:Date:MIME-Version;
 b=k4YClknvvnhiM7ny22JoQJTw+gpcS8inTGp8YU16mMLjMAfs010OA6ECp16ftwAAd
 C68UP/ctW33YHn98Cqo2rvo3T2TYKSlQf2rPKPYAdEnAr1dmuBwLEkOaD0g9yEDDr8
 OidmKCAkHAhWMhbz0/ZjWzOIaJ8qZHx/zaCxbnlzY29zro9gHdAgxpiPlnc392aw7I
 oR9p0eNrB/WDyk65kAi6GdGU2k+RcU3OMLC2WN5EjOOP4GRjN8KxmH5qc5Ktoxh0zT
 97J7sBB9Gnyoj0LYdeR/2MSeemp5JvAfd5Haup5pwWztliPUfn4ugEI3xEDsDxnU3U
 Vnp09+hQWLXcw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=k4YClknv
Subject: [Buildroot] [PATCH] package/putty: bump to version 0.83
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
https://www.chiark.greenend.org.uk/~sgtatham/putty/changes.html

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/putty/putty.hash | 10 +++++-----
 package/putty/putty.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/putty/putty.hash b/package/putty/putty.hash
index 30b749c47b..33a9666bc2 100644
--- a/package/putty/putty.hash
+++ b/package/putty/putty.hash
@@ -1,7 +1,7 @@
-# Hashes from: http://the.earth.li/~sgtatham/putty/0.80/{sha1,sha256,sha512}sums
-sha1  8c88d871855d3730a0473bb1cb1006654e73b680  putty-0.81.tar.gz
-sha256  cb8b00a94f453494e345a3df281d7a3ed26bb0dd7e36264f145206f8857639fe  putty-0.81.tar.gz
-sha512  d86f2fd0e126b18275d58cf64334b3b27c450899a1c2be2502de9faa2ef58f7fc8efc5d45f25c8395623f1e21917aa02407343bb2fee44c4c00b9f81267d5ecd  putty-0.81.tar.gz
+# Hashes from: http://the.earth.li/~sgtatham/putty/0.83/{sha1,sha256,sha512}sums
+sha1  f9fd9ab5e3849bf8c22b218cdb7697dcdd1d8c9e  putty-0.83.tar.gz
+sha256  718777c13d63d0dff91fe03162bc2a05b4dfc8b0827634cd60b51cefdff631c6  putty-0.83.tar.gz
+sha512  4781616b7e9c5a779a54e6a8486513e0aa947d4a36e9dbfd4ffc0d32981a5ad4868cddbde0363467236ed67c43f990408a9326d10354954be716a270d587c0a6  putty-0.83.tar.gz
 
 # Locally calculated
-sha256  e0410341c5e45f7479c28d79298edbf615589cdfc115b2d69683d4ccd0425ce0  LICENCE
+sha256  c18aac5045fd30bff639b07884be44cb8c68eef16efe8c5e18deda1f58cacdfb  LICENCE
diff --git a/package/putty/putty.mk b/package/putty/putty.mk
index ec65991f41..9071fea208 100644
--- a/package/putty/putty.mk
+++ b/package/putty/putty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PUTTY_VERSION = 0.81
+PUTTY_VERSION = 0.83
 PUTTY_SITE = http://the.earth.li/~sgtatham/putty/$(PUTTY_VERSION)
 PUTTY_LICENSE = MIT
 PUTTY_LICENSE_FILES = LICENCE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
