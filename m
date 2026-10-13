Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4544ECC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F7FC406FA;
	Tue, 13 Oct 2026 20:53:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uc4SgIHo3DsB; Tue, 13 Oct 2026 20:53:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2DEBD40719
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791924792;
	b=qAFAZflP2ObMR7eXB1KFZce8vUSemostc3QPxwfD/o9y93Zd0Ib4Ms7QtpFA4GlcDpQv
	 raub9xY3ZFZm+Ijd7/x15kFFrWT0EBf0lHluM7dtcCteVOOCKgzJXAvATc58mO3Yg1+X9
	 ukdS+gJOVBqVDQfpyVN7DtVW7UPBCoGpuAOq25EERRahwNx1gR79FfpDvkjOzf3goR2y6
	 isUuugYjOaAakzL2WMmjI9VmqPEQrY8XjAkZv+upC7JXkPJGYcb0muiNST5Sb3v5Eprs2
	 7qkl1UmmQLfPX/rry8iQlgbNkhzd/o8z7KiYYLk9kwpJtFncYOQ+sO627A7C6bLqviQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791924792;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=kDc5pxbd0LYgg2WOVOA9PiRA3eAx7clxCtKleH6D7C4=;
	b=Km29JeBS2M4kUL7oyRrnWFfqbdY/4DSpOWec2wBNZIEi7IGu9WWUCgTS1KWemBTRxaLb
	 pg57upBHECEGifDAFzn5n59Z9PcNyPVvP1uYGzs9lW3BWnFthIVpoFEyI9Lga+/a7e2Ot
	 9viUAV6CyTVTGSl9DCjrFFmQo3BItJ0k9kJ5oy8d3E2F9mX+kXiW5vZFCwMnjAO5os3Te
	 m8TiFuSvNLyy54xZpwg8j9JzHQdQx99HPogdVyPE/wMcxQCgagJv467Z8c1BtCY/9H7h9
	 Rr+waBkWODK6I26nccodLgwkbtG9RMZrCG8q/tyGrJpPjGcbVYMg6e+GZAUG7IRQLtw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791924792;
	bh=kDc5pxbd0LYgg2WOVOA9PiRA3eAx7clxCtKleH6D7C4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EBmE8jolf1tPte/4eVBbmDPIwfNVPhdzCO68h2OhcF0ORzGhcnyg8KFYSPqKmNNqY
	 9Q7fr6VhDDkh58HyjPkh4Ih5tiD2q+GkaEhX1Lv9weldgvkFEAq8IWshd0MVDPdl4S
	 WuUyBNxqgS8p9OEUYK6gaJspmCujo3liTLBsLiRx1vfqSp0zoiOHuXQWkNybXfx/Vd
	 HRZMICF1A0rABi+MbU/I7ThAdruEFY1jYVUmL3KxCB6PXcVfJUzMn8dYnGXaM5vMme
	 OJ0NggAuMu6f3+8W+b3S5b1NDUl6Ls3pv98d0KxrNVkEEkpjDcWwXhNb7ZZN6jxO0m
	 U/XeS8GATHX9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DEBD40719;
	Tue, 13 Oct 2026 20:53:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D17EA43F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2F0F60705
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ktGl5mqiRi1m for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 19EEB607D2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791924747;
 b=N1CqHz2uC9hq/Shv9wzAtOOTWNOxv9HYf3sZitZZnmM3l2F3qKofqD4i4o6P4HwjMREq
 +tiX+lI3zl3rBF3wx1FvTgQymPWYftHdzlUhUyFrIk11RmCo8ib4u2Aq6cJKwvX7NiX1B
 7ZBt6FhzK+6RDO8sZ5RY6DJgWSO5N0WY+41vlkZBNsroeYAOY+iEtVByFUlbJfevLo2jI
 Br9Crh4EXTQGehj7Rl/QiWnQMtaA23AMcfKwu57ttuRmCgXjowJXtSepCr1zya6PYnvg5
 Lwsx7nhQmMACyrv92f3ftwUHwRAKudV78Cdrn3FGLoCeyLzzSo4HnDmq6Nlk7UkcXUA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791924747;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=TajGMg4Cx9psodI/GcPhJcJ7mtjK5lajELWF7jY+src=;
 b=dP1FlS4ywsVvIGXX04BKMvQ329bMSZTIsUMg9SIRXWAvgt7IvSUubwlj4ei6cvzGkISt
 vmCZYKmvkq4hR2ttEjPfpB73DLXyI1ezXMYTiegcYipw54vMxOBg0YdLzb00bXeup52Su
 6ZLi0KoxNIDHb4Jk6wUeqQJOAnKb1b2pma8i/hCQ9jQgEKbGQ3accySKIutKDfGJiZDEc
 Gi68MWi1V+NvmOBcDnw9gTMdIVblMEpVK4cY9kK1z02YklMr7Uva2T8/EWb7hotl8xidn
 zrBCd+ViAW1lFQCqpsijowEh8Z31cnq7jxvgLdDyYsLfck99kRSS7z+52iqxNUgBS6g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19EEB607D2
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 543E9956E9; Tue, 13 Oct 2026 20:51:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:46:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 52da0bb32dcd9c184a2ede84c93da8d7fb4711ec
X-Git-Newrev: 5c0905f096ff0bb705da1eeb84b7dd78982509e0
X-Patchwork-Hint: ignore
Message-Id: <20261013205107.543E9956E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-wcwidth: bump to version
 0.9.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5c0905f096ff0bb705da1eeb84b7dd78982509e0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-wcwidth/python-wcwidth.hash | 4 ++--
 package/python-wcwidth/python-wcwidth.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wcwidth/python-wcwidth.hash b/package/python-wcwidth/python-wcwidth.hash
index db635d2a1b..a0aa0d902a 100644
--- a/package/python-wcwidth/python-wcwidth.hash
+++ b/package/python-wcwidth/python-wcwidth.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wcwidth/json
-md5  326db5f3f49128f6b69d967ee633c44b  wcwidth-0.9.1.tar.gz
-sha256  5823209b0d43af322ce698c689380d7c15ca31fa8e6e3be8459f27031bef0af5  wcwidth-0.9.1.tar.gz
+md5  114dfecbe7ccc3aced0243ce93b04daa  wcwidth-0.9.2.tar.gz
+sha256  ae0ef90b90f6af38b54f1fe6d58662ec33b3cb4b8391958a62416d654231727b  wcwidth-0.9.2.tar.gz
 # Locally computed sha256 checksums
 sha256  70b98a95a2144eb70af8017fa8c6d95ce247e40867436e8bc649e137fe13d21a  LICENSE
diff --git a/package/python-wcwidth/python-wcwidth.mk b/package/python-wcwidth/python-wcwidth.mk
index 32acf28e93..260f150a58 100644
--- a/package/python-wcwidth/python-wcwidth.mk
+++ b/package/python-wcwidth/python-wcwidth.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WCWIDTH_VERSION = 0.9.1
+PYTHON_WCWIDTH_VERSION = 0.9.2
 PYTHON_WCWIDTH_SOURCE = wcwidth-$(PYTHON_WCWIDTH_VERSION).tar.gz
-PYTHON_WCWIDTH_SITE = https://files.pythonhosted.org/packages/dc/ac/3a943d2792c9bb368aaa8b50121c0f778460ba2d7fbdc0a0366201d9e761
+PYTHON_WCWIDTH_SITE = https://files.pythonhosted.org/packages/f0/b4/7830542634bb2d3e62aa3b586a72d5b3b6c91c3168929e7000ef3fed041d
 PYTHON_WCWIDTH_SETUP_TYPE = setuptools
 PYTHON_WCWIDTH_LICENSE = MIT
 PYTHON_WCWIDTH_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
