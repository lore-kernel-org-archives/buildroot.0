Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11F7D339B2
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 18:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 054256F1F1;
	Fri,  5 Dec 2025 18:35:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AdWQzJenyQwE; Fri,  5 Dec 2025 18:35:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A49061CF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764959709;
	bh=upIuZfC1FsG+E5KCpTxVFEcfcwk3sBkH7IW1kWSsgb0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AMdKzCTLQUeGSJZ/kCuiN/nGNrBNj28LSkZj4y1chvr0NZ0NEJDLJBl/PXpIAlqhe
	 PsbaDp4JblFGoxQZTUtCntCnwo5Oggel0EhIzjqbvt9vOG7t2Fg0nlZJfdCcDFFtF3
	 P8lMDi42N8NqcJEufNBW8PuEla+t7Eo/sBcZ01jphxU9/7mfbVOl1h8qZ2d+dPxea/
	 311a6/IZRNRwLE/QhrhIlfcVDfdnXn06Ov3xo8tk6jz7nNKLBP+85CG5Tr5YYx1PHF
	 FDLKqfi3yLhgYh/1vXw/3QBR3UEByP+j1yMrU/OxTQlCaZeS4heYoC1nUfEAya833g
	 rzom1yRbZ27sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A49061CF5;
	Fri,  5 Dec 2025 18:35:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C36BA199
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 18:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA72E40B57
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 18:35:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SVtnSPIFw_eE for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 18:35:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5CA8E40B59
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CA8E40B59
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5CA8E40B59
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 18:35:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0092BA4C7909;
 Fri,  5 Dec 2025 19:35:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37992)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vRady-000000005Wq-16Xm;
 Fri, 05 Dec 2025 18:35:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Fri,  5 Dec 2025 19:35:02 +0100
Message-ID: <20251205183502.1740567-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764959703;
 bh=/jKAl0F5u/NYc/HZ8QmeJaAikHNz6H2fb6LiAVpVpzM=;
 h=From:To:Cc:Subject:Date:From;
 b=AcSoo/lQVyulXBvLawQJ9DDWu8ffH8M0CpfWr2AcFlBUtx8WQt8uv2qxdFrXe05qR
 NBNlJV2vo2eBcJqLkR+XresXV4onDWDrAu1tF8Y5X/Ftov+/0B18Lk+iB7WlPuXpNA
 2W/4b65xLTyfxQ0FvJLaxlCHTMg9vX2B2zr06OVKxLiU6rqJwEuJWEqZmDcFJV6a+k
 06Dv8osG3K9h2AyRonpmGZ+jZA08wndRAUE2n/ocyri+/7r1CSXzVhig3oLvBL4d+N
 6OfQv0YvbiXH7exRaTU7iAtsTzUWZz+uOLKYEWdSR4gPFxq7Dbp5D77BzyhIRkspWW
 e3JsUCzFEPbeQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=AcSoo/lQ
Subject: [Buildroot] [PATCH 1/1] package/lugaru: switch to github
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

Old site returns 404 for the tarball and does not contain any repos:
https://bitbucket.org/osslugaru/workspace/repositories/

Switch _SITE to URL shown at https://osslugaru.gitlab.io/

The hash value of the tarball is unchanged.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/lugaru/lugaru.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lugaru/lugaru.mk b/package/lugaru/lugaru.mk
index 53797f405e..57ec9fef3a 100644
--- a/package/lugaru/lugaru.mk
+++ b/package/lugaru/lugaru.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LUGARU_VERSION = 1.2
-LUGARU_SITE = https://bitbucket.org/osslugaru/lugaru/downloads
+LUGARU_SITE = https://github.com/osslugaru/lugaru/releases/download/$(LUGARU_VERSION)
 LUGARU_SOURCE = lugaru-$(LUGARU_VERSION).tar.xz
 
 LUGARU_LICENSE = GPL-2.0+, CC-BY-SA-3.0 (Wolfire and Slib assets), \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
