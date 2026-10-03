Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E98CA5FE6
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB03260E91;
	Sat,  3 Oct 2026 10:07:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xIlcf0Cb_3D3; Sat,  3 Oct 2026 10:07:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E7ED060E8D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022046;
	b=YxLkjevKf+HSeYIN1uSSkDA1qoeQBkaAS6uiIwer4/vwx2suof2xQJrC3eWoSZGWK/WG
	 f2sgzLh4aTH41aERx8setJ/g+iNi3HYWIt5jW/umbPrDQMfmEYAWRfwTkY6u3MF8e33lJ
	 B0XHzvwLX6UtInu3mocIPYZMeGgwqCfNgDRs3jXTReMwojRIb2oRwAs3mri90qKl2Nxy6
	 2D8bq9pIYe62gyF0jAIYG8GOqWHyHfi7847BEhfJLQ/ijXAv77nnLMD60HsyqPVcvhHun
	 LuHbIuYYI19MIO+fEkFXTfgbh0L6GeS17qyUaG1nXPumnuoCgjwBAPPwBHCYk5xGK5A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022046;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=c0Zyy5pACPJtKex+FUQ8jytnnzDb7WERi/AdtoOFs5o=;
	b=CEkP3J35Lr81KS14bz+mmZq6gP/I78X1oUVx4VMNVpGpTaLIm4FiCpj0+VVbM+9JbwLJ
	 Bw8Dxq+AzebeW+6BsRDkopNOFUZ0kwOy2RnJwbX5abBsV0w26Gut9wL7cmtdBgKHqmlHb
	 2UuP5u9MaG0l6b9lzRViOerSUYSRSU8j48XkR2y2C8eAH0XsrDz1B9XfIDilpLyVOHcrj
	 xARCVMaPNCxMCJNrwYu6aGWKDMkUz3ZSQqilqcjBG6rbnQfcbJQwPUs0FSZuy+OdQ/OQU
	 Wkz8PYsk3XQpYjFC4S4wBnCm+/ZTz6X0bSSmmk+fe8siwFSBjinLnHlmLL/zXa5bNLA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022046;
	bh=c0Zyy5pACPJtKex+FUQ8jytnnzDb7WERi/AdtoOFs5o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qSJoDS2T/n2HC1uZrI6cSlLuXWiPOq3YAD49siTQyiMEZP8aI3I0w2AGuGHHboQiz
	 T5QHjQi0awD5oofzwit+YMRSrVl3QZ9aFo3FEYWSSD4bY9RjDAy+Otr+MT5gw+bLpG
	 0lqqRUtGVlOjofLVqbBwpfKf3dlByadFAwSftUWXPdlpomclXjMZxjJoJbaVUQznFt
	 mbSz9XwA/nSiCRFYvinI115kHTwhCXYidrm/s4cUwrMpk3NZUI1qBWt/j1ULHsrlRY
	 awxXAQhGCrP4K60X2Eh9mYkhsWQT1nHQBUldsKZXKUFjAGNi9WVbWrw2qqRZRgm0s6
	 1xxKjAljygOsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7ED060E8D;
	Sat,  3 Oct 2026 10:07:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A9514B7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A97760E9A
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u_7M7eR02y-T for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:07:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7ACE560E7E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022028;
 b=WLBbKCsSZFg8RXT+hQwMpsMY3E/sQ4VswnCZZ5miInZnlSr7nr/mpKseAGR7oQpO7EdC
 gzF/lI1m/M6hmTtshMk5bqMP6QwFSFnjLkQXJYHjfyiQPqMyHbwO4OmVtePG2TdTY0G5i
 lvtn1KYGPCn2l4xo+mDMmFujPj5GEhCzxsPXxa7HhFPwznV7Cw9nPiYgb8jR4qxRIGkR9
 38QSQGBspC3G1it9p727nL3pZnad4BBMLz8HIvysEQTDWYaNfoSe2Be92pOLCFVCR+z8f
 Jftn5aPwZ9VFx+TF6ThQ9IbxizNKP+vKw8dqI1eu4nh7CuQFdB/bImwxdPZeOGNpjfg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022028;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=tpen+HBuPQPTX1642hJC4CEqEISmKt0kuf7ojekiRzk=;
 b=cWxtAcH0iDMdZhXT1lXm4GDmHeghNRDoBZtpDEFubsh/6lfS5iXDZ5bsaheq9K8MejUJ
 wudsfjzA6Sgb9IPkbHSOMd1yJyKvY49bWtHVjgseeB27LS32Q1g/gandNvZL/PBXsu47V
 XnXJpREE+B7cSKzHmxrURNsiJqNJRW1HubTYYkDK3RH83QHIAXbraEgtrso02KiDW6D+1
 8n+vLVPqFcgXY6GskQPhTlzwmvklIZ/EU6OQaZV9Xrp2MHhOPDnThA0Pjpbbe18+fLOhC
 ub1mQPr+n9ozwdgetxt0HNLFPzMPuE+mNZOhObiQsJO5/bN1nd4/+myhSIxcLWZeAcA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7ACE560E7E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD337884C5; Sat,  3 Oct 2026 10:05:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:06:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4d369f9093975b532983f565f1b7013d7d6d709a
X-Git-Newrev: ea899e79ab5ef529d665151647830b1fe25971ce
X-Patchwork-Hint: ignore
Message-Id: <20261003100553.CD337884C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cachetools: bump to version
 7.2.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ea899e79ab5ef529d665151647830b1fe25971ce
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update license hash due to copyright year update:
https://github.com/tkem/cachetools/commit/1b704d0bd4b1656109f20905d76f1564a185afd7

Add the host-python-setuptools-scm build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cachetools/python-cachetools.hash | 6 +++---
 package/python-cachetools/python-cachetools.mk   | 5 +++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-cachetools/python-cachetools.hash b/package/python-cachetools/python-cachetools.hash
index aa44ad61ba..30d162f443 100644
--- a/package/python-cachetools/python-cachetools.hash
+++ b/package/python-cachetools/python-cachetools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cachetools/json
-md5  1501ed3542a4ea9212d74e3bf5974bdc  cachetools-6.2.4.tar.gz
-sha256  82c5c05585e70b6ba2d3ae09ea60b79548872185d2f24ae1f2709d37299fd607  cachetools-6.2.4.tar.gz
+md5  6e88355ee27dd4c21a817cebc3c3c6b6  cachetools-7.2.0.tar.gz
+sha256  bcac1a1b8da6909994a2957238a57b8140dab7c5c5c69a43669654fe87a33c1d  cachetools-7.2.0.tar.gz
 # Locally computed sha256 checksums
-sha256  23c4eff7a1c027a977a0b79c4497e17582c334c5f17ef6ac8ca0b52d1e7d8417  LICENSE
+sha256  28c000b52b0ee27138a68ef778227e4057046e86b65f62f1cacb99b0cc49e0d2  LICENSE
diff --git a/package/python-cachetools/python-cachetools.mk b/package/python-cachetools/python-cachetools.mk
index 0804e0f2a5..19d4a6877f 100644
--- a/package/python-cachetools/python-cachetools.mk
+++ b/package/python-cachetools/python-cachetools.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_CACHETOOLS_VERSION = 6.2.4
+PYTHON_CACHETOOLS_VERSION = 7.2.0
 PYTHON_CACHETOOLS_SOURCE = cachetools-$(PYTHON_CACHETOOLS_VERSION).tar.gz
-PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/bc/1d/ede8680603f6016887c062a2cf4fc8fdba905866a3ab8831aa8aa651320c
+PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/29/2c/3f18755527b03ca9ff6be724bd5370cb777c76a87f17301377cf04a4729b
 PYTHON_CACHETOOLS_SETUP_TYPE = setuptools
 PYTHON_CACHETOOLS_LICENSE = MIT
 PYTHON_CACHETOOLS_LICENSE_FILES = LICENSE
+PYTHON_CACHETOOLS_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
