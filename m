Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06EFCCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AF4960674;
	Sat,  3 Oct 2026 15:54:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wknrIreeis-y; Sat,  3 Oct 2026 15:54:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1ADF16063A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042854;
	b=mFo6eTp7xStZCrRpmL9SVc0t0O7bKx5/PKCuyGx8RrF85+rl34mKNjOc5XvtNQkvN5n9
	 xxF10QIjO0aRJtRqCjy6vyyz2ec8UbQMdx4Koq4dIbqa4Dw48SOrI2MGVjR41QCI5plTP
	 fq4S+FvyuuF3mf1S8Z26stHe/1nRgaynV0lovXGYoFSW0npsNVsXYU00NQ42xV/NKSJju
	 hEBPGWEalWpPQsxHqdWp+MK2G9JP9QSY25FmYGV5elVgj7+womLRFW7s6cXCpKdkBG1XY
	 ooyEcA09qVHjx+mQuaq/Of3mLzpz3Gjl53ycSKtrxcz4aKOPxLVc9gvlsN1WG8dD4wQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042854;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qDu3QKYTzjcQ9q/qziDBebwRaZn1UnxUtdYrFA45poY=;
	b=a5eH2iLKxufCEYPPkD5MwdoKd61zpWFcd+nIvaCszyg6mb994WkgH54iKO1+JmWUa9iR
	 yAvNhuAUCR4/HX9bOnJtZDPCZA4MbDxzHvetmKjLcZwMZMbWYs6Ez4pPpYlzDvtY89GL+
	 6Hc9DxzmveKLh6BbZngVaOiy1a5b+5amLB7/sogj8Op4nBUH5g4WhWMREaBaO8u6G1wQn
	 pTFweMJt2BLSG++e0Ua3Gy0ppFku3shRMEv4V2Wx6KeUVBkepKol9NeqzjYo5XdciY5uz
	 yK7xIWrHNLF2w90lGuJG69v0oEkLIvb5iBZrTrzjR7LN9zFRHPpa02ZMFnY79HXvuRA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042854;
	bh=qDu3QKYTzjcQ9q/qziDBebwRaZn1UnxUtdYrFA45poY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bHiN1FGGFdgQuKIbAAxbZPGMUjxx11s+WAfLdNltVRoodTwsYKXbs/5hUXVvp2yy9
	 vxxDgF1I1SbB6pxERzhaOiKU6m7rxiSoj8TYHtHqZe0wUG/deLRXTHae5vgPR1oEm3
	 cDlSe1CCVVtvPqYFDnD27kCLPspQs4ZWQpCmwKkwCbqbbYg0PDknrtHclyZrB2SRR6
	 tH6xUyjtd16EMsawPGgEJepOqjW+FGLJj2cGTS3TD8p4R8BMrEH+QGAsIqyg311q6A
	 kVBuI2RBuIxmSybvwHUhJpBzzgCqQ82qUb5XHjer+0z5ZgPl6H3bu5ditYmIrwhoD+
	 NPoYrT52EWOeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1ADF16063A;
	Sat,  3 Oct 2026 15:54:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 40C991D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 236E240055
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ADy2iXyBkGWZ for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 781B240024
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042843;
 b=VkN2PGiC5OLtH1hh5XMjBonY/f0mFA+6eiIfEjVH3yNDcCSSAFi9bZCzOXjmBDUsORZ2
 puCoMQ5dzPmFYJ5PS67DhdQuvN38aOjbrPsz2zGoFClbCkprR0ZapNxMLOkP+mPfVrE82
 Xq5nWHw3MSbmqUyg9/vkYODJyZ0OcaD7zJE6kNpubl4NQd9inJ53UeE11uhMltXnjNGSI
 HXdxtjBZQSTfKWilcKMz5C8o7+18MX8nMLz0oGLwMstl8wHk//mvFRrLcltzscd5C2E26
 Svg8xYdWtwuHjDUEY1dG5k50GEnFia2X+HlUiCBW2nK2+JvarPd5fKnmWvQ8LbGdt+A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042843;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=L+WrIUy9ozmb5E3REn6alW6FU1SLwX+57mkpHHQtcyw=;
 b=kghkKArIquYS5Sy3fyz+F7fH11bjZ7BEnQuM0WXFvaWZHJ1WDry4K8eBMJiDVuZEASRU
 Q6lc9Fa6BZAX0MvUm0xNUxzjntKqMQDrf0txE9YD/qC8PHa2iP37B0ua9QzpgGCLGZhFo
 ryjMDkNH0xxzPvof59SW9MaGxpA2KjMpCKS1+yzz10cjiI27BBtD3Eknak/uLlHnDooOn
 qiNpAYbNjpIesbpq7jQfeO6gJPmlB4igzdhWP++4cgZEIHlzCyiFzBKmS8cHpdNacBLm5
 RYQiST9DUTBniDNrYitME+N1fjtzJl72FQaWMZlMTRW76altlgAFbgHCkUemF8MLckA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 781B240024
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 97F408A30A; Sat,  3 Oct 2026 15:52:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 16:10:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7a954f61af649d32c7d02f8d83da7995439f88e4
X-Git-Newrev: e88e0315ac9b8719f680ec83a72cc5bba0d8b756
X-Patchwork-Hint: ignore
Message-Id: <20261003155248.97F408A30A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-urwid: bump version to 4.1.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e88e0315ac9b8719f680ec83a72cc5bba0d8b756
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-urwid/python-urwid.hash | 4 ++--
 package/python-urwid/python-urwid.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-urwid/python-urwid.hash b/package/python-urwid/python-urwid.hash
index ec81bb59e3..b106a0d9e9 100644
--- a/package/python-urwid/python-urwid.hash
+++ b/package/python-urwid/python-urwid.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urwid/json
-md5  d9dca1925cd4f8324cbb4817c22ef85f  urwid-4.0.0.tar.gz
-sha256  58ddc5c65eb3109b69e2e95469553f9f86070645cc1b553d6ee3fe8dbac2e0ba  urwid-4.0.0.tar.gz
+md5  32766817ecb7ed597cb2822939c63b03  urwid-4.1.7.tar.gz
+sha256  e69c299f0e9cdedb839d5ec6d58d31b08fa6895cfc5dfd59c8cb016377aab26f  urwid-4.1.7.tar.gz
 # Locally computed sha256 checksums
 sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
diff --git a/package/python-urwid/python-urwid.mk b/package/python-urwid/python-urwid.mk
index b6622864a6..58b212a61a 100644
--- a/package/python-urwid/python-urwid.mk
+++ b/package/python-urwid/python-urwid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URWID_VERSION = 4.0.0
+PYTHON_URWID_VERSION = 4.1.7
 PYTHON_URWID_SOURCE = urwid-$(PYTHON_URWID_VERSION).tar.gz
-PYTHON_URWID_SITE = https://files.pythonhosted.org/packages/1c/09/afbd44c7c57b1124d94ffe6321154798b816bd09c00e0aaabb701583a1c8
+PYTHON_URWID_SITE = https://files.pythonhosted.org/packages/6f/55/ae4b607277b6c6a7d02e145e9a24c777e5bd2b9189d7145f0afc731bf639
 PYTHON_URWID_LICENSE = LGPL-2.1+
 PYTHON_URWID_LICENSE_FILES = COPYING
 PYTHON_URWID_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
