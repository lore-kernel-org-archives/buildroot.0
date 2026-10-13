Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4FACC6B15
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B27FF607C8;
	Tue, 13 Oct 2026 20:52:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xlrNrG32x-kd; Tue, 13 Oct 2026 20:52:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C18F56083B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791924768;
	b=m/kgN8jLq9HQSd4IQpdoHhO8AtQfJrx4lZXcWeohRgHMLJ6Xq/Mz8NBgIyobGncZDZln
	 MMffbk1kYe6LDFE+FKa6qW0tCslvR7O92qpHPyQ4OhrkSiy5Zhhy9seZbPkDY32qQBna9
	 H1IBgVMW+28Lxr0DrTQNIJkQoLyM/4/t7IE0WBa5k/Lyg9uBuQXkxxv2NU0JJixg/yjw1
	 y72R9LEJhjfwh9cWXR6FbTZ9Lv2dR+aqKUCgDnQtqo9nwlZJI610+AE04Q0wFsIIIWoDi
	 UjjzBjoKdLmr932PUh27rcyRxKanE3cPpY3b3nXXSJaEAPeWQCDXQsV/bJ89X4gp2Kw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791924768;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+Qv4WoTiAPaL+YJMT5OTpyaqbzokUmgTTRZDgOltu80=;
	b=DpYIXapOz0K6CAeozdXJpvtO2MBUJK6zPQrewkRtWRlfT2EToPxclF4zltop8W89ELMt
	 bS51lhAOK7pla1H1RFOfVtesD92uq66fWCYN9FyQ4DgZJhLRDl8aDoicQirWO9SdZszrL
	 ETivFRKvuPtSDy0/bNw3CcP5htysH3MvHpwTceP70m7YqyrlsNxxnyv2V3DceXDz50aMF
	 NWFx1BRu1rx98jfTZenx+Iw+fi5iOBK4k7BMiKMQs91Ax3ft3sqH935lTyRQP0Th5AQgT
	 wPUYx4/WBM8aiJGTb0onfRgBKjoy80cvzB1CEHPYEJVYTL/8LKnVFAHa+pJf6pdA+7g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791924768;
	bh=+Qv4WoTiAPaL+YJMT5OTpyaqbzokUmgTTRZDgOltu80=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VtgVCXEzYTH5DmwTKJ1U1YH/mWjiWyFewoMK9Gdvur6iAc/J6VjnLYK+ao9t2+t6E
	 /2p7BXv20uusWFM5G7+ThX1tAt79sSHDUBcwRCerBrK3jtsokJZKOfdV5afT/gY6Bh
	 E0K8Mdg6UXBA7qYy/ihVqtz2xCeM5fYYyOIW+kvYprpyCHU8JAdyvjTr2mDF43ZNNa
	 iDHkI0MKWH3MlQVDGzM6aSAIKLb65o5i507xumWLqEn0HA6Ax+Nd95fViKy0wJyjsi
	 CnCPT1Mw8juortCOa3AfIN8LUA6UyEHH+CFK3pm4np3CLAa+PquW/tRfXKtx45q6dp
	 SYzku0UACSMuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C18F56083B;
	Tue, 13 Oct 2026 20:52:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DC9CB2AE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDF014008F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eoe61leKnT0T for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1E71A400DB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791924746;
 b=n25LzsHDoWk0X1TUzIUdOCH85NR9zffoOl+A6WxBHr7onFC7fVkB36igjwRQSXFem/bJ
 NpOb7EXJgMbSzl41lbLvHSxb6ag7rrvhwkxo9MvCUonuki78yB0TjaPW1fe1WBA+N6wYn
 nJPpaQJs8D76vSYam3AsdEjVNVaKt5LRibjgeiH95bM6J3+bofGReWVVr3OigEzDl+60g
 zE9Lip280L9cpJaHHER+ZEj0dGrwjRZFOvHKCkVUGWl1PEb3aLWtN9ohePL6kZyWfkxPj
 d98L89NZfvq/GTxElTYFbhkC5b8kQK3EdJBgqqO+K0Barm2PT1Pn0Vc8vHihQ9YFgHg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791924746;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=OAitkU1elIhPvAWOb8zjgcAS/WekOX2q3Mks8RGRGl4=;
 b=IfaRySFiT2INVSDxeYy3SrE1e75v0jHq8oPnEcPwjx7+GdRSNqRx9kQVI9UY9OTTqYBV
 J4e/8o6Hftched7XGlH0AVoMRHLkWdXDrwbtckIX0qlEKYJZo/LSnxoZNC2z1xj64FvEz
 z0YhJ/ZrEsxiaW0q1dDccBcZVV0k5L+LF5FnvTs7HeKwc2SRjfea7PBI+nTfZYgSvKW08
 v9Nv6h6c5ao9Iukz9m+qvCL2GYU7bNOFlryPm9ZAvKJ8PlSuIiJ/EPfvVrTEhMAQZY41A
 eI3PQOipLCEjJrwBNU8Nf08mv2zZQAAOgdlTbtxZo+Ih9zOsA1kTIZD76KecFbrpuxQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E71A400DB
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 57FC6956E5; Tue, 13 Oct 2026 20:51:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:43:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc57e6aa8ef34390c19b90b0ac0563b470cf4c0c
X-Git-Newrev: 23d83ada473dca86b1c53542f3e5ac439b90c211
X-Patchwork-Hint: ignore
Message-Id: <20261013205106.57FC6956E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-opcua-asyncio: bump to
 version 2.1.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/23d83ada473dca86b1c53542f3e5ac439b90c211
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-opcua-asyncio/python-opcua-asyncio.hash | 4 ++--
 package/python-opcua-asyncio/python-opcua-asyncio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-opcua-asyncio/python-opcua-asyncio.hash b/package/python-opcua-asyncio/python-opcua-asyncio.hash
index 6fbb632cde..2911984494 100644
--- a/package/python-opcua-asyncio/python-opcua-asyncio.hash
+++ b/package/python-opcua-asyncio/python-opcua-asyncio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asyncua/json
-md5  0e7ce8a935969d74a4e14147d4514c78  asyncua-2.0.1.tar.gz
-sha256  f9f73804b4d56a12aaad7a2f062b15f08c856718d93a10c647d82a9f38f787df  asyncua-2.0.1.tar.gz
+md5  3bbc7886e7686ba4374ffe2e9560d95e  asyncua-2.1.0.tar.gz
+sha256  d741f5e21f189ac0a45b8dda13539c2d49d8d992b9b62d2758efe1bfd3d1454c  asyncua-2.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
diff --git a/package/python-opcua-asyncio/python-opcua-asyncio.mk b/package/python-opcua-asyncio/python-opcua-asyncio.mk
index 15a5e9b525..4c81dd8d63 100644
--- a/package/python-opcua-asyncio/python-opcua-asyncio.mk
+++ b/package/python-opcua-asyncio/python-opcua-asyncio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_OPCUA_ASYNCIO_VERSION = 2.0.1
+PYTHON_OPCUA_ASYNCIO_VERSION = 2.1.0
 PYTHON_OPCUA_ASYNCIO_SOURCE = asyncua-$(PYTHON_OPCUA_ASYNCIO_VERSION).tar.gz
-PYTHON_OPCUA_ASYNCIO_SITE = https://files.pythonhosted.org/packages/d9/7d/14830444700e18631853c417b05472c7036cd266e90866e8d0ae4bcd7c72
+PYTHON_OPCUA_ASYNCIO_SITE = https://files.pythonhosted.org/packages/c6/90/13c47fa62aa83f2ed98a931aa3a7bcc77a3e7163400eb9f2d9e1d3c9df07
 PYTHON_OPCUA_ASYNCIO_SETUP_TYPE = hatch
 PYTHON_OPCUA_ASYNCIO_LICENSE = LGPL-3.0+
 PYTHON_OPCUA_ASYNCIO_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
