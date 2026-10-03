Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35798CA5FE8
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE45460E82;
	Sat,  3 Oct 2026 10:07:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a12LDZoAmF3l; Sat,  3 Oct 2026 10:07:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org DDE7C60E7C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022035;
	b=eBjJ6KCpeMd8xRqtX3ghVY2gOs9ON6Vk8ZO5yUkIHRDAWrv52uSsqMcgRPu77uxnR5zd
	 4+GNW2n8u6JAIuzvfoZljBekKSbdot60vgmGe53zFnAAlzqBieaiPblVO2BdnMMzQv/Xd
	 ObsfF48J+vtraPgRz8FPQ239HWK9pT/qoG8rjFjluDpDObkfjWpKfcmilQkNOpsZLZNHI
	 x4Yx8EPkoi80FNALy2fDDzpIAusFiTit4cHyGPyC9fmv1rNmrgAWOTVzLytTcJXF8miq/
	 N6qEFJGnF8hH38lxtTDeClo6/C08dELML5FbUeZDztsd40UipF+yxNb0YKx+94vYd6w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022035;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=srQB2HRJCMnJct0s/kJ2OYeHq4uUkisHZGKTocYrahs=;
	b=dsX61qT4W0MBmnlWwtMRr86JjYr22fkjh7UpTbdy+R5aVL+haKSIXKfC+MhrreOV2IVi
	 O8PYG4YuMqQVir8xz1em5/3tjEgKvxhSwycpdJr/II3/YovG9QQGtGBFztXXfV2B82lm7
	 qBXpdMln3R595FQnySckjS95rTrgGqGmM14Fk765QGnJJKS68Pt4YoO29SS+rpIJthsFF
	 t0Ks84rM4h0Wo/dcq2/i4WsjuOfvnSAm3/dudraWbRmNtd1mp73KCt7QIsKBaKo8SEzTo
	 lc9bA920m77YZDzRSZfvh4RJn7qnbbFvq8eZUoUqagycFJpvjqTd7KqMzFbqG3Nulyg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022035;
	bh=srQB2HRJCMnJct0s/kJ2OYeHq4uUkisHZGKTocYrahs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UqW+/wcrgheRWa3xmNVNrBIii7iIPKyxXQofTpRQ0KU/0yPTIwyWs85jseiHCQfJM
	 uDBerKHxE5yXaQrzOl0M+OtaXNDiw0rYQy6IL+wZL8GGSnNcUwYo2ADZU1REBEH7tq
	 99d7DbaK8NKNDJ+EfCCA3blBY8MT+dka6n2w4Ujz0YVj9KKLOiFNLiyb+L4YjvO3LL
	 lrpiGA4jWg30ill/JV6bkmxEK4OwSu1m50LjhM6BDscndb6J8vA6iAeAuWhqOJP3D7
	 UfEDV4tXmTVL5rY/PT1RViKhA1UaLHELv58Nv7LqCaw5hZJ9bZekspCbiZZfUrpf1R
	 aBXyA5zwKuY1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDE7C60E7C;
	Sat,  3 Oct 2026 10:07:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BE09179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7215741110
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z9tFr-QVWORC for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:07:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B6CD54110B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022028;
 b=nmyabSP7/Rha0k0KjKzPFmhJIzKzuKorxUUWL138Z4Ohl4l3sJfYZR9q/K8sle7I7Le6
 06vkR2t8euOnH85YzVJH8y8d/jZ/8mI/4kBzEmqiISJWXrlRQB6LCs/63U4AVcVmt5Hzr
 GzBD4MusYatudd0aEwKEbr6CqIqmc72bq91QLZTy8D/XCCRTtmpV7Yonhqw4Jsn+54doy
 7lHKK1C2Yod0mLiuzMRbDh6pKVUjLoEtIwc0Tx6jT+9F+z/XHdeAY4wgV10XoZhBV5Uho
 lzOe0QJ2nKxCeigzAqS6gzgBYFNhE3eRq3Eh2l6GofP4WPNKkP0ZMSqKs6XcDMCpTjA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022028;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=qR5o6fvzd2xSzG+S+aFeFmG0wRhfnNUCKJ+nnTG6YLE=;
 b=KNa+GeS5M7xc8kiLSIJjWn8SdCftsogvoPyepUMRaCpdDu2QTSyobaoefjMunoDOudr1
 6qSWS2uYU9cQPkvC9Lgzk34rdXctcxfVNjef5AYLRr8zrr/OPJVo0XgZmTPJgVLTg2lFy
 WIP7nWJLZtoJdGWIN0oNIwFs5gpinQGlWOTgPZYFfX3/tme+Pv8RGuIa+aR/MhnCZbQsK
 jqk86jxhcQP9eMnFRABSF7i+tjWzQO2tXIvAqImFURSOLFqEC0os3qTdPSJL+6a5M1248
 XKS9j18A5KqPrLCfzwE80ikATvHAkKPyEPxE7pxekdEkNQzjJPu0ok7BdkQY1kk8bog==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6CD54110B
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 14EC288814; Sat,  3 Oct 2026 10:05:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:06:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f8f9092b0d9fd813fec3310e6eb01fa2575ce8b
X-Git-Newrev: c6c2223f0fd8ac4a88f323ac7c34f8fed195720d
X-Patchwork-Hint: ignore
Message-Id: <20261003100554.14EC288814@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-git: bump to version 3.2.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c6c2223f0fd8ac4a88f323ac7c34f8fed195720d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-git/python-git.hash | 4 ++--
 package/python-git/python-git.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-git/python-git.hash b/package/python-git/python-git.hash
index cda8ae49e1..f86121683b 100644
--- a/package/python-git/python-git.hash
+++ b/package/python-git/python-git.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/gitpython/json
-md5  e011828008698572f60dbc3a798e594d  gitpython-3.1.46.tar.gz
-sha256  400124c7d0ef4ea03f7310ac2fbf7151e09ff97f2a3288d64a440c584a29c37f  gitpython-3.1.46.tar.gz
+md5  1d057defef1a684993a1b664062c3f64  gitpython-3.2.0.tar.gz
+sha256  fb92310af6844d96adc95ca066ed2e617c00e1dbd146a326626c81e72e18cc2e  gitpython-3.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  86fc94c321a9afbc11514713511bafded225f25100dcc0f7350e82bc231b8beb  LICENSE
diff --git a/package/python-git/python-git.mk b/package/python-git/python-git.mk
index 49cd04f66c..8dd87cfd65 100644
--- a/package/python-git/python-git.mk
+++ b/package/python-git/python-git.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GIT_VERSION = 3.1.46
+PYTHON_GIT_VERSION = 3.2.0
 PYTHON_GIT_SOURCE = gitpython-$(PYTHON_GIT_VERSION).tar.gz
-PYTHON_GIT_SITE = https://files.pythonhosted.org/packages/df/b5/59d16470a1f0dfe8c793f9ef56fd3826093fc52b3bd96d6b9d6c26c7e27b
+PYTHON_GIT_SITE = https://files.pythonhosted.org/packages/6e/2d/6f6e649818da44d4499604802c89329b8d9799687a124e3a5e467a643336
 PYTHON_GIT_LICENSE = BSD-3-Clause
 PYTHON_GIT_LICENSE_FILES = LICENSE
 PYTHON_GIT_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
