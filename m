Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36864CC6B03
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 07:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A94336073E;
	Tue, 13 Oct 2026 07:58:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kq6rZ3YyURB5; Tue, 13 Oct 2026 07:57:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B3772606F2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791878279;
	b=o4i8gkMeJAMGIQ1iHoN62NXB9ShZm+Qi7JnlvGuI23Tu7hT6H1i/IvClxrJ6sJ6r8Chr
	 SYhpCJoK8jHvuw2K7TbRkjgxfYXNCgjdd2+6p65YV/7uf63pgYQVGA0dNn8tAnmjvBBTc
	 bv+qxFeDUBffL7cAGx2tHodaXBsu3OM60t7PsD4ZSlgALwWJvEQCnM5s4d4NHQBtURJ24
	 Ow4Y4JvDzfMY18pXp/6nC8IYGwXEdOtFzKXmXKgixVK6uxAvXD1UqZnATQTf0s5Xqyo5G
	 PHL61o2Cm6udkN3QbrXzgoq4kCriMgNq6dVqNJ3ZRLLuDUBQflUsdQNfSjiKA4Mgo6g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791878279;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=P+zIAdhJRXvTMSZNiTLPJ/X3FbNFzWEGCPPjNvqJU1M=;
	b=tWWxdwOdOLRu0cUtOud3pi+IXeQ5dLjKPZ8tWHAnA5qddlr7puMCP5UE22T/IlzqTTJR
	 L+4lSjbkSLLjN22Kl5srZoo7xtoNquVQOogIh0QQpF/Vl27Z4Prdq+JQFFULoHZNBsm3K
	 fuv3XPea9oiFBYfFtY4k9VSQlffMHEy09p3cPRqL3mJRCFSnbcaMfYBq9NGOKn1QErmCO
	 4TaW4zX3SKkE2yv6awmCWf67Dk9OH73XRkXZ8Dc5FGig4T90flTKSiN/AK1ndqyH6paFr
	 uPrFeG8UJvYdXj2bTx0Y/WC6vwrZcg7IwTQ+6BEbb3sxIgv4l6sIpnIJ3l20BlodO1A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791878279;
	bh=P+zIAdhJRXvTMSZNiTLPJ/X3FbNFzWEGCPPjNvqJU1M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qGIa0GtUVuQwhQWb4DkjaYtlyrbFGYa2shgwyoGif1oOmpcC9cvkwUM07YpElQbsL
	 jvgXMPuW/ZcyQQ1fK9tsmaoyWjZsSVq7tit1c3Vi6eClM+7CZhfngLltgI6Fy5g13I
	 TibP5x+znXQAfqrkdDARvhXjqLK6C/8YUjaMQB9/dXWF55fe++gaKni8MPY36mSmDI
	 AaYtYmhrfooMHlDcWrNm9650ShEXmbVoR+2CFeANQUfbNyf60aSM3uE1Ca4srhtw1Q
	 20UdSSjFEVc5tcqzzpHhdjmzD3Y+tmKFYH7iPAh2eSeuOUFeaTp9+LT02XOneDlYXr
	 OzgMLAkW8lw/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3772606F2;
	Tue, 13 Oct 2026 07:57:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 97BAFDE0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 894894040E
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:57:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mEzR9JUW0r0u for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 07:57:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D121240411
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791878276;
 b=hAMuL17Z4khs7T0SnHdzmBpWrpSZZEFfxU28P4Ruc1MiErT0xZ2sigXXiSLcT5nXdi/2
 xnqJKbBckbc68jPw2G4h5Zj3MkKxmnNHuj6p9QXyf2lYlM4Bmv1bp/Xd++xGU02upjpDA
 OftW9rv02LTugwpRCy2LK6GvOsIKbjnbXRw3d/d6kzAJnN/Qo66Gn4givd/gZhJGeAER3
 KJhCYFAPhAdhZJvZ72ZdgJWAlzZuTzrBqB8oOsSlUp7XMWIRNiCAFqh4I2yxzkc6fNahZ
 iI19dgyK4GN9SG14WGUArgoLaJxkJmjJ39JVYO2VtyHUUDvr3L5C0jdbcHOhdHzqlgA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791878276;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Y9LOF2uQh1hQOFigX49YTXbKA3vjZ3OPlSXS2aHemZY=;
 b=mg6xVoS8XyRZcXPZrMf1X9NJ+EBxDTleWi7B7oFgs60isQc9J/X0OvyCGZiu/UnM9iei
 RNhtc/Ay5jfgII9MZBtvVcIG7B1fBeVEepWM+hOB+jvjcDpL5PkZjSRZkQZtPB1TEfd8G
 rBq2+QRyCF+cxcueewoa0Y4mfZht/68rJN2P1YrceQrO9LiAs7dnhmWbLCyG9AusALpcP
 nnMYMr4upCIebWpC0kX5W0HijPIyL0tRZ0K7kTvOH08QJH5llCAoUj8yAD+dydtc+bo4X
 jx19Sy56Y5bGClfBp76yGqZ83cAgk2/sK98x/7fINC/Dnk8qubYYxeLDXBTPyiKEbeA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D121240411
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:57:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 46170953A4; Tue, 13 Oct 2026 07:56:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 09:46:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9e0d3863d1549b3965fea29aa0c3b3858ce60cf5
X-Git-Newrev: 1037e4462fddc2a5b6f077d9511026da0c1817ed
X-Patchwork-Hint: ignore
Message-Id: <20261013075637.46170953A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-gymnasium: bump version to
 1.4.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1037e4462fddc2a5b6f077d9511026da0c1817ed
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/Farama-Foundation/Gymnasium/releases/tag/v1.4.0

Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-gymnasium/python-gymnasium.hash | 4 ++--
 package/python-gymnasium/python-gymnasium.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-gymnasium/python-gymnasium.hash b/package/python-gymnasium/python-gymnasium.hash
index 9a3b598346..03734cfe51 100644
--- a/package/python-gymnasium/python-gymnasium.hash
+++ b/package/python-gymnasium/python-gymnasium.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/gymnasium/json
-md5  e401a13a7c39201ec6e55c2dac1f91f2  gymnasium-1.3.0.tar.gz
-sha256  6939e86e835d6b71b6ba6bfd360487420876deafc79bfb7bacba83a7c446bcf3  gymnasium-1.3.0.tar.gz
+md5  39c1de8f59c47ae3a5f062ef708c159f  gymnasium-1.4.0.tar.gz
+sha256  9754f630a32abfdbb76386abe1bc1e706c982db2d62dfa119c9952eb2de7697d  gymnasium-1.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7dacaa9772e856aee6943b32ef663d3634d91d72ec7bbc74d136943673f91e18  LICENSE
diff --git a/package/python-gymnasium/python-gymnasium.mk b/package/python-gymnasium/python-gymnasium.mk
index dd5ca59f30..dcff08ed61 100644
--- a/package/python-gymnasium/python-gymnasium.mk
+++ b/package/python-gymnasium/python-gymnasium.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GYMNASIUM_VERSION = 1.3.0
+PYTHON_GYMNASIUM_VERSION = 1.4.0
 PYTHON_GYMNASIUM_SOURCE = gymnasium-$(PYTHON_GYMNASIUM_VERSION).tar.gz
-PYTHON_GYMNASIUM_SITE = https://files.pythonhosted.org/packages/4d/ff/14b6880d703dfaca204490979d3254ccd280c99550798993319902873658
+PYTHON_GYMNASIUM_SITE = https://files.pythonhosted.org/packages/fb/3a/6713c8a92c259fd7619dc93ff19e6e435463f20d3d7b180b14ce99074c10
 PYTHON_GYMNASIUM_SETUP_TYPE = setuptools
 PYTHON_GYMNASIUM_LICENSE = MIT
 PYTHON_GYMNASIUM_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
