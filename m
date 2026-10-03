Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6885CCA5FEF
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2128C606B6;
	Sat,  3 Oct 2026 15:54:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BIhskr41FNki; Sat,  3 Oct 2026 15:54:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 419A76069F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042876;
	b=C7FYL8FCiFMbK6fn3u69LSv6/EqmA1mPat2M+kQgLEiWcI96xaHy0R/l53/RxhAbodoX
	 ErdMGqlANoCYxQN8Z05Rxo7ZXAnewI+Nr8S2S0b7/M1y7YW4c9L4Vbn7XoptyyKRtD52t
	 6+0E4URXLqns9l1/oCrOdoUnfVGQGobn5qH/JXBhv7NklSirZo5VwAqjt0XjnR8wScSpP
	 /Mdoce7M8TVms/o11VAx9S8Im4Xm1CR5nLdGYgChuRfUSah13N+eK8USEZYGU9iHpbLmn
	 PJKJVWiEwBKl7uz8fRSdirOBFLeGjdtVkPC7sn+yoYf44QHJhgjVT5JobW/Fu1eCQLA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042876;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Seppb1dKdqwIHN5taHV0ExNcHUvJQs2H7Ttm5LZjoO8=;
	b=LSEr9I+ba2Ly7eD8viy3Ki0C3DULtAr1B5jmAhiHGZPY0kaBZPAyOQ9Zli+zUu7U2zP4
	 NzRmkpiC7FJJPV9iVR+lWVWMmhAfsMVbAzetbkWroMBnlDjcH0c5GbA6l27DcezmSom/5
	 xyFFvpAPMG2lK0oS3zhaDh15X1VfJlzn1V0VxFqUfaNekVPtm4Z0NjZ0fWPrLRN+71+DR
	 Ct9ZUYRRlID+sx3LA5qOtDTrzNVA+u7thvaX3VxRdPjuOvcqrHfuFRW//oKYfiWjlMWSb
	 exVODnmsE3ZloAT2kM+8c9YMy8viF3lkw/lg7lUzCF+MOs6wmPfrf0HDx77Ngh34YLA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042876;
	bh=Seppb1dKdqwIHN5taHV0ExNcHUvJQs2H7Ttm5LZjoO8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YTFkOXNKS+BE/L1CzhyF/QBen/wT9YSBByhwvwiR7lx3lWsRBzEtrHyCkRx9YLSpc
	 fvJsJQ/wiy6ZxQTxV08PcMtns4hz/iDPR+b3ZrXv2KRJ8kD5MdaCOwWgbdmzuuXkp8
	 Y8282dLWiqtBdm+yS9Znrpjif7woRAAMQi35L3yLqwaj+dwK6/NnlQWZiaBCwBEv+/
	 fvIJ0OD8uelU9DZ6sEU7hZAg71A7LN2KP2ihJNSTw5UCVKas7WEVTDJzg0lHQXDU3T
	 lFjn0afO1cUtZ7iLQjtHcYc0vQTmgco8LZvgKU+iLNHTSvdoVWuTXCkPVZTDQcbSEZ
	 7gBg9yOBKXmqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 419A76069F;
	Sat,  3 Oct 2026 15:54:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4497F476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2969F6069F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qEPpiHYkGrnL for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 10F6960674
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042844;
 b=YMSmTO4Mh9wmS6DjmmoHvYfyawCPGoq5VysPjKqLLQy0SIjiUk1hVMKrkPdCe4noKmmj
 qelesBg2WzCONasnUuwFtnUVEjMg9xLSQOljGnzZ4kEFim9EafAQROm+uTaGMnc0NbJW3
 RruajTzprZCYpQCbzU5wpa9qJqY7wAgTtaXLkITC+WKjHM8mj/e7I+6+T9+u2vUYM2Fz3
 YpdKA6wijuXJlLud3q/utjl9UaK8nInf/Udo3H6X99BpbQOw/paWBFtYBCie1Lwax1IFv
 qFmF+D1R0aoUuHHXDny5AG49438T0qbopSGNINK/VvhUOgy9GIuyBhPx7axlNqAF+2g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042844;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=TfZQRLYjGAwtME3ODCkqgFGh4GCgLSd9IvkNLGVwJBA=;
 b=hRQyvP2JsZsBUj3hg4O3Yx+anvZb62JgqZHhiRYgNhZfkzWxsSG2UxbNVVK1jNyH9+E+
 +p9+b+3kn5P9QZmJQRWLFNv9h6vZdQuY1UJwJaPj66hBDKifOvEvPrmvIJ+4bIzinZnKY
 uimacOT6yCBHq1NBGddWrPOHeMsaBC8D5m3P4oGhYAnM0Jjvm9zsjxbW5N9qKiRs1Cj6U
 74fbbMxZD9CZK0h6Kh37FydyIKFCj1KY7ao8VyLLHifPmi8FwdAfU15tl3qv2xr6qT4xK
 s9cdmW2+j0SLORqNtJk4BXyUqd2+MhWqmuFMwEqSQuWO4WkyclmL434Eo5J7p3g7TqQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10F6960674
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 52263886F7; Sat,  3 Oct 2026 15:52:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ed13f740932d4bdfd6d0a078c05fa5a88f194c6
X-Git-Newrev: 0b02143f39b92bc636179374e287b482016de221
X-Patchwork-Hint: ignore
Message-Id: <20261003155249.52263886F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pycairo: bump version to
 1.29.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0b02143f39b92bc636179374e287b482016de221
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pycairo/python-pycairo.hash | 4 ++--
 package/python-pycairo/python-pycairo.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycairo/python-pycairo.hash b/package/python-pycairo/python-pycairo.hash
index 6f03581ff8..c390d723c5 100644
--- a/package/python-pycairo/python-pycairo.hash
+++ b/package/python-pycairo/python-pycairo.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pycairo/json
-md5  8202d252ea754e2a17852b9031e01b32  pycairo-1.29.0.tar.gz
-sha256  f3f7fde97325cae80224c09f12564ef58d0d0f655da0e3b040f5807bd5bd3142  pycairo-1.29.0.tar.gz
+md5  fc7c3b4104e88df7dea34af4314b9d12  pycairo-1.29.1.tar.gz
+sha256  4fbd26b4af24c9787d84cf5448e34eb8dca064b732479aaecd03109520eebd5f  pycairo-1.29.1.tar.gz
 # Locally computed sha256 checksums
 sha256  360b9a526d47c51a7cab7f1ec49ca5893050562d639b742d588934ff84823a72  COPYING
 sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  COPYING-LGPL-2.1
diff --git a/package/python-pycairo/python-pycairo.mk b/package/python-pycairo/python-pycairo.mk
index fb1d2bac74..20eb5b511f 100644
--- a/package/python-pycairo/python-pycairo.mk
+++ b/package/python-pycairo/python-pycairo.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCAIRO_VERSION = 1.29.0
+PYTHON_PYCAIRO_VERSION = 1.29.1
 PYTHON_PYCAIRO_SOURCE = pycairo-$(PYTHON_PYCAIRO_VERSION).tar.gz
-PYTHON_PYCAIRO_SITE = https://files.pythonhosted.org/packages/22/d9/1728840a22a4ef8a8f479b9156aa2943cd98c3907accd3849fb0d5f82bfd
+PYTHON_PYCAIRO_SITE = https://files.pythonhosted.org/packages/26/7c/ab4637b028d9ee12280ab9342f28310e613d5ca30c4d72d2aebeaa6a4969
 PYTHON_PYCAIRO_DEPENDENCIES = cairo
 PYTHON_PYCAIRO_LICENSE = LGPL-2.1 or MPL-1.1
 PYTHON_PYCAIRO_LICENSE_FILES = COPYING COPYING-LGPL-2.1 COPYING-MPL-1.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
