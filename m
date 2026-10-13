Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A77CCC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C1B76082B;
	Tue, 13 Oct 2026 20:53:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SrJN6lbzinCm; Tue, 13 Oct 2026 20:53:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 59EC76085D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791924785;
	b=bCb8ZLrP2URYp3LmbbxJTG6AVY07ZKg8mCcaA5gsHbMsZsRaBeBAMw2nhMMLbYBhAAbs
	 IIVJGscKf9RU+4VGDuAx1v8IDp2x+J9xcGoqH3hcAymVsEoU/v8uz08TUHkc2wUQRh2RZ
	 F/dg07ee5lVOVVmUZTk2eyzkm4HeqDLcmsvG7gZ5EAp4goFIhccj6+oQwESsMrJGCvcYn
	 9KuSZlQs/y4UXWHLoZPCeD4Qeb3UufPzgRvONklUKuA1ffD2KG6fBmM3ewLcsmYAeoktZ
	 NuBwXPSczpRNzu5wXXPChVsjLfA8X87YAcDgABOjzzkCB+wkBiYguah1b5PiFXJH+XA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791924785;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=sQYcG7x8zqhg5taqEu2N13oH3rz1gvH8+eg7+rmMT3U=;
	b=oaVDROWCWIRDo6BJKqOqyq+unDB2/TqE3J8Cifo44Lu2KobfpIciuBLBoxdeznsutRCt
	 iphLSgo9YMRSPLU0JzZdF1CLK50pOD4YBqVfwSBqRPkUyd/fc4ze6/Zwg7FIGfkucBP4a
	 ZnF4IZcDTQeERz23rEaUmclmHsBaFj2Tm/PoS3bYU6/YNksx8fAZeKxGJUGLrGr7l7qp5
	 BE8eBamdss0HabqfCdsbQYacH0IAORC5HHun/E6l0n311ego4v7JLrvbjeUZUI9RgVQeO
	 QoeJ+3Pbi1fylMsBiP8bG6e+hXbo2+mbG2sAm6qS15ZwkzdCduC2IN18NN1Tr81vQlg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791924785;
	bh=sQYcG7x8zqhg5taqEu2N13oH3rz1gvH8+eg7+rmMT3U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cU7pKTSYBDPli240ZU/M/0ZrnH0Rg+lc97zFLmdzGZj7ZgLZRDVdI9fZP9/pKxtJt
	 1r9XkIqk4gMdeaAUCJUNHfVkzKCe7FypXfTRiHwz2DYhr8k5j0uiMXs66QVytVIoP/
	 90N+g3AsNt0VfSbnnyAuuXctia4El0uI1LmMxcDnpovsrZvu1KJ5dqo4ekJCKF7sK3
	 VRDMVzxSRetD1X5PqChu0WIfR4rwSTJ6vcdEGmflF/J1Q7i2A2kDy63xo3fo/6gdff
	 TmA/uFznM+ZE0UiFu8TEBmd5G7F7GY+mzP4BDgBq+y7Li6LpZKdgNKJ4IF0IUzTQGv
	 /TQXsxMu47qew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59EC76085D;
	Tue, 13 Oct 2026 20:53:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 79970788
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5EF4A4062D
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KkWfapaEfH6v for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B2F7340619
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791924746;
 b=IMT4lPb41JHTHrkM7567ctubKQ/ACi9FsEkGCpt88zrH57yIQmDwaAT/LojQwWr1SRs7
 m0RsRyUjXwMoFoBVJ0jTRYA856ljZ/LXD17drBP7Hxb3e6mmt7UCqH7bDXGV3L6vVxA9t
 LWScQgNNZ+N3sCKB/sPg4HU80o2JA/taZIy7NLDmIm9LquIPj1+fI53q3TS3CuO+VJ4ON
 93Ormn4cNScDhu1OQW8UG/r78TCypWTgkSvQ+Jj2Sl1MlKZoKlOFl7EzLP73k6Vxs6Ssw
 sjh0mKCYVdPj+iSKoDS+5MBzNQ4+vnNkhVrw5sTqzcpQeyBmHLbah7xfTgMqwbfPp3w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791924746;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=vZfqQ7lksFyeELIUrdITJw0uMG1n1oEgBcfp2b/w7FA=;
 b=qqMQ0BiuhZFLSz2t6Bb9AZlxAYbROFREn1yiMe5GeG4Xaibhpxp9/NdLNEudBYjM0/oX
 FMJXHhDSjPOBeSo/m2WNcc2tzcaPl7d2tUQuXQT3e+O7SbZN5eiaMV9ynXRF664+yTV1v
 Lko4C3SsBWHU4+wAlxbHS+rvznfQjjc+zP7DDTWOY2BU9g5eTBF19IWM0yzxwXxHSfOmG
 MkBMTw5dMs1OLcpWt/Dq7CAccUmHOhXarNrLuIIDlZKkRwrsCf7SthY0LpzihMe5ryKOW
 qVC+Du19CqqtESJmPMRprIrkHJy6H0J5iRsr92FHroY1TgahJR/jMT1zDC9QjZgetJw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2F7340619
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED27B956D0; Tue, 13 Oct 2026 20:51:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:43:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a96edd9e453c547facfba48abc0d8789212b747f
X-Git-Newrev: 7482d76e17166e6ecf3bf58b6812858806fea9c7
X-Patchwork-Hint: ignore
Message-Id: <20261013205106.ED27B956D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-rtoml: bump to version
 0.14.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7482d76e17166e6ecf3bf58b6812858806fea9c7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the license hash for the revised copyright notice:
https://github.com/samuelcolvin/rtoml/commit/7e13c7f615ce378fd5202c7aa6331e11b1da6782

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-rtoml/python-rtoml.hash | 4 ++--
 package/python-rtoml/python-rtoml.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-rtoml/python-rtoml.hash b/package/python-rtoml/python-rtoml.hash
index 9f40e2abdf..c325b2214e 100644
--- a/package/python-rtoml/python-rtoml.hash
+++ b/package/python-rtoml/python-rtoml.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  9c9cd121f893bf7e8360519df29088e97d5455cc437d9400d10757ac84846d17  python-rtoml-0.10.0-cargo6.tar.gz
+sha256  4fde4c37526891406798108ba24f940cc039365131cd5925ed6157ddb1ad595c  python-rtoml-0.14.0-cargo6.tar.gz
 # Locally computed sha256 checksums
-sha256  cd5ffde80e6d3286a2e2e5f02fb2cb07b823931ca368e7c735a6c5f5aebe7103  LICENSE
+sha256  707bdb34c5b967650d5f87a0a6da6da5b8b323147fdc4f3abfd329ab2903a0b9  LICENSE
diff --git a/package/python-rtoml/python-rtoml.mk b/package/python-rtoml/python-rtoml.mk
index d5de20f832..b99e566925 100644
--- a/package/python-rtoml/python-rtoml.mk
+++ b/package/python-rtoml/python-rtoml.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RTOML_VERSION = 0.10.0
+PYTHON_RTOML_VERSION = 0.14.0
 PYTHON_RTOML_SOURCE_PYPI = rtoml-$(PYTHON_RTOML_VERSION).tar.gz
-PYTHON_RTOML_SITE_PYPI = https://files.pythonhosted.org/packages/ca/b2/0e77a00e75ed582ec1c4c3a9e1eeed886a15c195bcce87b7daf1171c4115
+PYTHON_RTOML_SITE_PYPI = https://files.pythonhosted.org/packages/da/fb/ef915d0c607fb92674b16e15792ed9d254c9db0b3fbbea90b7be46fe3e2b
 PYTHON_RTOML_SITE = $(PYTHON_RTOML_SITE_PYPI)/$(PYTHON_RTOML_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_RTOML_SETUP_TYPE = maturin
 PYTHON_RTOML_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
