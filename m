Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C6DCCF2D3
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 14:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EB6360670;
	Sun, 18 Oct 2026 14:24:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x_WmPrOrYcVO; Sun, 18 Oct 2026 14:24:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8E4C360679
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792333478;
	b=Z9LMXYLtHjEFua7eg7y7HwhhGwf8ksR55Qcd1ZKE2CxnMEjWXFQDoAVPzgYCGqD/Xnnf
	 h7vt/3uwwCAXbXcgqQuOV1V/3Y0AW5apJ8pCVhGNGN6StmPh93syWOZCxpBTGHjzIz20y
	 bguS1H8RLM97GjQgCRom5+5ZmPYReuJq25tOIHqPmgGPx4HZIJaMM/9DjjNR/PR+hgmGj
	 zTS4D5YiNSnnXcW1wL0UxrqhvFEtiyoUdHvz4g55OIZWoI4xBXqvrMBPTI5qK+W8Bl5w2
	 wbbqLGU1wwY0SODS/mA2O5SLR/86xIrWSSWa6OOenlx4NP7MmpLXprq9WIjDQ4RE3Gw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792333478;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fFTzBPMuTBl48vgvhqyzNNT0MD+Sbkeyx/jM3aokx/w=;
	b=px+gNyCnsuIc02vsFUWIa6Z0ZKO9wJFOUbwUegcOqZcjNIVqFOVXv+Ek/2SxxZjVFZii
	 7d1lKQ+O8gm3KtelVnj5EDAsVh1iLKUl3GdOxqkfRlK2obAReh0IXRk8LSIsQdG7cjIM5
	 n9pa5ntQ774D9BlCP5zHXd2jUp7OZ2+oc3UIcrePnr6e0ywXNQmNRMt292mJGzvQsmRGM
	 deXMSIHYcRBxyzd9PkB9h9/owRqXrm0xGEmzVSuxqLswXwys+ReHR1TjkResgfruQBtSG
	 6w/NcujLYAfIWz3OSLwZLClIOx3vkzRh+XpSEeGkSS51O1SXu9mQ3cd1OPM8KEriQ1w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792333478;
	bh=fFTzBPMuTBl48vgvhqyzNNT0MD+Sbkeyx/jM3aokx/w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=g4YQwN7kvaIUgFrsHgRreGSEClDDhl4xMTt9E4ZQmhqZqYwejVkaRWPn8dOnM5YgT
	 bLFMq2wF9zKXg/PcyRLZH9cTEwJH6HqsC3mY2ErF5oJLxhyHLqhTfF3zy2Et43a5/7
	 E/Ty8OTij03XhtcVNdl7+fNbnC1cPAseMF9D6vj0T4jOVX2AM1qISpNkhMKY8GIzrK
	 5qhO5wMgGygW0JBPGJjB24oPvwJVZwgZk5mX9FN7eMhaIbVhj6EqPlTESgWo4apbf+
	 NBgRlYubI355cZ4tS8321jkllAExak+3bVvcgzN9aRccECg1Lk1zmrpBMnif0eIqUc
	 2EYqJ1FXxlcTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E4C360679;
	Sun, 18 Oct 2026 14:24:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E3EE8D7E
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D56E5400BE
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LonRQcKGwsip for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2E687401CF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792333466;
 b=T0jgA5tIBP8cTHQWOIzAc3juEEZZKDEoLKErz81BEfPiISFS6VvrP67VpNM7w101GxIx
 0DXqHaMdmgn4l0vTMKsFmOl8/HQWrUYCJFh/qJU8ZWhxnEzm6KVmvmLDgwE6qh4NoVlDe
 8d/dHD55VuVrAcWX0TAC7vtmH1kdpE9ZJVmQyq4x2poVyTekZA6EqlsCsu4gYNl33/8bZ
 3WcWT3D7cvDyarFFn43590bK1pqySJuooY7Uops0Q7xDJwkJa9q+tuLrLQ8dymy2Gp8ZW
 YefHPo9Bc81MwyGxFjvk/dw6Z/U0FQR4fa9/BoTbbEBhz0kRUAbNWIShXvT8Ls78bFw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792333466;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=QUpQ4R+iC2T27lA/ukICNw8xwX3okilSK9AZn0tTULc=;
 b=nelqv8NwCYMEdKsw4C2NZOGMRXZjUPWb4f6Ixf8HjNFMZVGy4D11qXbm8sVnDM19nB2g
 hrXQ4CZGPk+D/wDpsIM8fGqv3uvl2GGsUy6bhQXtsQEUFZ3mutlntfdiTYFDRezoUEZv/
 v/luiu/KLV0Stcyee1jNNnQPpL7laNnzBaIbrJroVsX1X94KJtsf7W3GfAQGSLSREYACj
 19GY4YCKiDaUro5tnYLIFUidA4K+SbdbX1zHjCMCaSQa7cDRaFmF4J+BsBVKiObo/UUyj
 fVpO6+YZhrO5zvo6J7lW357mSnJqm0/kaCrSCI/GMhy5A9+xA1zuukTonkNwp2tfFwA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E687401CF
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E2049828F; Sun, 18 Oct 2026 14:23:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 15:57:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: af2a965cd6e6c73209e67270eb1bf3ada50e442f
X-Git-Newrev: f7c0436dbb90cd5fc2c67dfb8f991a2b461eba7f
X-Patchwork-Hint: ignore
Message-Id: <20261018142304.1E2049828F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pluggy: bump to version
 1.7.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f7c0436dbb90cd5fc2c67dfb8f991a2b461eba7f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pluggy/python-pluggy.hash | 4 ++--
 package/python-pluggy/python-pluggy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pluggy/python-pluggy.hash b/package/python-pluggy/python-pluggy.hash
index 94a20accf1..4a330a99b5 100644
--- a/package/python-pluggy/python-pluggy.hash
+++ b/package/python-pluggy/python-pluggy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pluggy/json
-md5  54391218af778acb006c2d915085d469  pluggy-1.6.0.tar.gz
-sha256  7dcc130b76258d33b90f61b658791dede3486c3e6bfb003ee5c9bfb396dd22f3  pluggy-1.6.0.tar.gz
+md5  857ff9374965f8d1cc422941608746c3  pluggy-1.7.0.tar.gz
+sha256  d1eaa46ebb595891b860ab086b4d09c8588af65ebd4361b8e8f4bb8920b90ba8  pluggy-1.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  d6b65e6c213a5d0b577911d34d6e5949b9f59d76c238c5071a2f3fc16cfb2606  LICENSE
diff --git a/package/python-pluggy/python-pluggy.mk b/package/python-pluggy/python-pluggy.mk
index a5d8f5e94b..798a407bfe 100644
--- a/package/python-pluggy/python-pluggy.mk
+++ b/package/python-pluggy/python-pluggy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PLUGGY_VERSION = 1.6.0
+PYTHON_PLUGGY_VERSION = 1.7.0
 PYTHON_PLUGGY_SOURCE = pluggy-$(PYTHON_PLUGGY_VERSION).tar.gz
-PYTHON_PLUGGY_SITE = https://files.pythonhosted.org/packages/f9/e2/3e91f31a7d2b083fe6ef3fa267035b518369d9511ffab804f839851d2779
+PYTHON_PLUGGY_SITE = https://files.pythonhosted.org/packages/bf/db/7fc19e6f2dc92a966727031389fc2e08b558f0f25eb7403c1119ad4713cd
 PYTHON_PLUGGY_SETUP_TYPE = setuptools
 PYTHON_PLUGGY_LICENSE = MIT
 PYTHON_PLUGGY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
