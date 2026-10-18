Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE00CCF2D3
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 14:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD774606C5;
	Sun, 18 Oct 2026 14:24:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pROUhWhTKWqV; Sun, 18 Oct 2026 14:24:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B92DE60679
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792333471;
	b=btSv/9Dqa48T6gAsoMY8NN3DPDuoU2gmeS5cUAs0uFthxLF17pJgXYhDe8y9vIx8GYrg
	 yohLdi+uX0V5kIA5VKfnodC46wuQ6+JSEjJjn/ZuPk3xwCI1a2Q9wJZMIoWPmMn7A3eGx
	 ryw6W641xVp5vdIbIrKJ3WqkiCAh4sVj5YhHAe/JK0Ge+jjiyHfRNOA8FQSRzUDO7o6uU
	 kuqAZXdp2lcZPXN34Ro/b6JHq38AgSdqyVY0zmdFfarOy5JlBSW/K6SX37qt14dL8aeVc
	 qakzTErMLzcS71Q2EhpARbT0KbxJ6BXvWfi3C1gCEs/sn+YcE/a8PZSfuTIuAXvNNBQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792333471;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9TMEoPenlzCAiqO+iMjGC/TfFW4qgNi2Q2EAglo4tc8=;
	b=ghEq5wwvAHOHC3FXHWjfWrSAOQVp/pFD2ZTVOSH8HjZn6/qA8ELOR6FX1AVR9ZewSwFJ
	 qVSRKSQwOFQnZ8J6eYFVqWVnMkqNjtlzz/0T+tqTM6CVOLUgvCjP0zC8j4CrOhUhF1kaA
	 mnDN6YO7f6VNJV1RRIp4JDl+mBzrsZPpogkpPjBvme26ginNh9Frvxwez/DIWw/tkjegY
	 7U8rkkw67aoYaTNuL/IdhMrAu5/e80Nzyi60xR0Pv0KtCQXm/YWcRIXifNgy31mR3/m08
	 C52GrXWTcDhujg9h/tneupsDhK8lyojaBt5Ojt4xjbJPcMSiHPrcb0HYpbZRe591m/g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792333471;
	bh=9TMEoPenlzCAiqO+iMjGC/TfFW4qgNi2Q2EAglo4tc8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DeEij5GTRY2HXF11Ss8iYSI2kxNSrZiPYLNFNrGG1YIymiJ1G2e6amltv3732HggV
	 qUr4Yl/r88pSssb0gSkuWrO6uRgoij/cPcie9IioMwLXZXXsYfPgrJrIGO8RsnHdzH
	 GIlG5sRlsOf8IIkBvTvowHcJMoj1AlumKZmE0gLcKqxz+CfsGRBJvWBa8BLkhXS7az
	 q7TY8ofCBKAjV1X/zxoyVIHLud011dwOSg2PN4rYyblX3o3BrdHZAa5SpR6HECqZKf
	 w6noljFLR6m59Fl8v95KI+7NMutHCBynFL98M8qBIXO0RAntd8l/pvf9DglZSM5Yn+
	 aV9YBG1vYzedA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B92DE60679;
	Sun, 18 Oct 2026 14:24:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C96061
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E9CF60634
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6nBHlX0GiFT6 for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DFB6E605FA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792333465;
 b=V30bIRuHKuCcHA9oVUOIzpGn9BCGiDeEPmNi/l5qR1mDZPOfRCECC5x/g1FMzNzD7dBy
 3+uIlW9w8kwK9uoCSr78e7WVUWvYYyuUSeptzhqCtiq1pxVFK9j/B3HJz1GVIfOGIhr/s
 QV4e/nVMrigb2lYmhhQlVNZ0doyKfSwAb3yy75lltgZMIjcHQ29g6AGqgdaDpo0JXOUCW
 C9s7bn0GoEn4u5CLAJiYF0b1m/vTG9AuONumj5Dh+FPyeDYU9Rg78fgG+rr0/UarhFjVO
 W6krQSgE+NE5jtJBo9pS7UHXxPABc482gOm9bZ0DTZRAljCeek1Bd9+1ouuoRv8o1hg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792333465;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=zpLg5W+roS7DWgLyfbFh1FN9CEOr+VMPRMXlRVnqzPc=;
 b=R6EobEePaRLlFPe9q9fOJa7dQBQVV+bwjtw/rYROv/l7uzFNgzvP9bp14Rb2A9Sl0AWT
 Feec/OQH5CRQfAM17eGOpvZjEeyqYNYmon8c1Cgs3mPmjbGFANeEVpG4j3i8o9TMbVy0V
 Gq8rwQYyFS20s9lvSFd/ja+oDOBR8MzEA15ajKVhN2D18Jwz/pEFXQbmdOwq6vKkBukGR
 tB0ZSmtJWapzAd1hlFT2YXDABWMLXc+n26ea3LYL3brcqLz8hzr5bc+n8g5rEbCNDLVAE
 IrJja0/CTeZ/Mqdo0CCusfkcjCs/MNiVcYRS8ymYeKPIQNgE+sQ59ChBEdA5rQfOyig==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFB6E605FA
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C2AC09828F; Sun, 18 Oct 2026 14:23:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 15:56:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8bbbcc67f0cc462851d69e22d0dbb08e1af5d3c8
X-Git-Newrev: 1200532cddb6422db3e3eb212cc0bed7a5dcbcb7
X-Patchwork-Hint: ignore
Message-Id: <20261018142303.C2AC09828F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-fastapi: bump to version
 0.143.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1200532cddb6422db3e3eb212cc0bed7a5dcbcb7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index c59c623df0..97346560ab 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  1bb72b474ca0981a837e4237a0ab402d  fastapi-0.143.0.tar.gz
-sha256  1acffe48206a80917cf7dac21992b5c44b25384e8902bf745c1fd9dabcf6c51f  fastapi-0.143.0.tar.gz
+md5  de01fa672d0af011a4d534e5dfbe3240  fastapi-0.143.2.tar.gz
+sha256  e9e6d97018dcfd748da7d9e7c61cedefbe9eb91b1a3288e45b13fbae76df2d54  fastapi-0.143.2.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 7bda802199..1b373acdfb 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.143.0
+PYTHON_FASTAPI_VERSION = 0.143.2
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/0b/d7/6a8753ab6c1d432dc53703c3e1b92974a94531b7d047c32bbaae461ea844
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/19/f5/4bbb2df9bb6f365151f2c02795ca3f17f78d08e670a394df963f3d8881ce
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
