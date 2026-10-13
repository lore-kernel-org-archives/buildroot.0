Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C360CC6B15
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C85ED80DA4;
	Tue, 13 Oct 2026 20:53:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YSN_wbxwmmPo; Tue, 13 Oct 2026 20:53:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C9EBD80D64
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791924786;
	b=lGoO0cL0m1cyRh8Lw11MuLrrhIV1E0kpi+OBnn6U2ApjKJBw5x8qgsvc/rN4jgTLVah/
	 Ol4tKhlXCGzE8MYME/ZAFDp5EzBF8jWaej/kMAVDOl8w2pW9/VVq/WbOrTzbZIzJMKix9
	 qxJxYZm9KCqDf+gjcIhCwv/fs3i1ATMCTJEP24Xw88KBvM/kIjQ/lbR2vh2uj2Q+JZ6jE
	 4WH6jZl9f8Qv1oIlKnyvjIelHL+PNynax485uHi0Z4XwPEj7ulR0e7efwGR0zipj4whhY
	 c8xqSjy84lc/48md4jAx+Veb2V6JnHtbbBdmVhzEUKiSXmhqm4rCJWnpWhJf9Syz9eQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791924786;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QJO6o8KPMLdfUiuiEg8ncfRvZoMZAPdx+x2QyLXVTzU=;
	b=qA6MDcL7onP9rm68jlEKf/J4j6nFbDed7A4rBJbkJ8MSw7xr2g/Frb0aF54f0eMH8Lzv
	 s7QBSomtMQo6MpC6u5ZVD1LVyItcNCjPaXMH1YUQIe9py6o4vMRs93F4RNlCe1CB293Px
	 uBXJIVrEyajqa511jOPf9J1jI/kE94IU5+wuPW/a046CpFgVCxoAP3EfZlAKxsYMqFMk+
	 ULmo2UivWAnKgtY9zrEcV06osNRh5IkKN8yoQEnjItbZcCuosAWRmr6hlC9XteSToX51q
	 CWRAD/NfC9qtP+v7fHQBOVOR0BZptGRPblMI1JgzeUklNxo3Sft3nVK6zeAWvrLTiyg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791924786;
	bh=QJO6o8KPMLdfUiuiEg8ncfRvZoMZAPdx+x2QyLXVTzU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=moEBcdb/YFizhQ1Njhbed2WQjKTnTKSUlVDiPz+eAx3VJ/K2268YBi8mkeUvDDwvo
	 YwhAo935zd6bgl9vcHD3vjjiqPqqG0z7Yw0t30UK6razDErlE1X3+28Qq9ip/pRaE0
	 TzvuprHYoJ9pjy1V00PjlVx8v7KvgxL6Myk/w7D9pI/a/fO0eWcez6zOVKExzUt2BN
	 ABKY+xfNWyzgU60mJSQ2xGKGIVDHfXp3PwBlzzsEhBTffpfDGXFwBpbhfqi4wB4YIA
	 W29iVrt7csYfaLmDv67QOIsiorb11qWpwGd8wRgarZ5p45nvBYQBbQMhNAHArF8VQR
	 jDUshra1tuyXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9EBD80D64;
	Tue, 13 Oct 2026 20:53:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B51F43F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7890160705
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id evyRb0Rs0VPW for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C01E360810
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791924746;
 b=qq5j3T0KfPaMlrrX26PmnCsnF9KbjLUObffflr9E0hbL4KokwAji9FJdHMF7EXHMQtjl
 Tb12Uv58HwtG4RZv8UyxAW9OoZPbpTb2sH98fFzvb9B8a1uWGQIll7k2vIgGlBWSbXcaJ
 hXZzU4beLY/AQIKlEvMGZioQk95LxWPBQ7TtKMcMzDg+sEAo+8g3XvPou/UfYFNVmK/v8
 z4i2rjG5fMV1e7Zv5+d/6MwCTcOLDA5oXEkH5VD7NBiK9hRSnIA6LybCHTNMLEKXj4O6D
 6G9WzJHZEvMG6aWPJcZO3sNMROI3fDGOC6fSWQckNuaf9cN6M9cGqgGct2T8UupxcyQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791924746;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=6ykhL57Nq/R77AQCkrp+RYzssaxNGJie/xpMtsHxa9s=;
 b=d8L+rZAVgcdLt369UfG0ZNoViYcVNVf7fCYghOyfoSY12sM5aj9H0qNsjLpglbyynR+W
 7K2xchDGEJPRPSIUS1WFEg0lVFCh8jYqBbIEPp4p5u/VXiX26yE0oB4pi1929bs2ZqjST
 0BX3pX5kidtya5uxLxMVIyxYEI8icXb4BdQdhLe5QS+Rc4YrQnBuLc4SkIPCXjaOTYCUu
 axEXqnWkfUV8tRLwf+5g6A8kf8GwGMWL8wD5ax+c/XILaCda1GWlL8A9M1WYrrDjdaKeA
 yNI/pvudhzaU6k9jeheM4dzBVq8f0LnsHfsPemw7j2ik+pu61vw+bIpYG6RdDODWa4A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C01E360810
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0666D956E1; Tue, 13 Oct 2026 20:51:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:43:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7482d76e17166e6ecf3bf58b6812858806fea9c7
X-Git-Newrev: 8252f69992a0e70e9f85ac9d9f0e57a4c8a88488
X-Patchwork-Hint: ignore
Message-Id: <20261013205107.0666D956E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-selenium: bump to version
 4.51.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8252f69992a0e70e9f85ac9d9f0e57a4c8a88488
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-selenium/python-selenium.hash | 2 +-
 package/python-selenium/python-selenium.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-selenium/python-selenium.hash b/package/python-selenium/python-selenium.hash
index 4ac6965323..c17ad00388 100644
--- a/package/python-selenium/python-selenium.hash
+++ b/package/python-selenium/python-selenium.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  6cf2734ba0e1651163a936122739140a4a9689226a58f1c57fd56ef67dcc3fac  python-selenium-4.50.0-cargo6.tar.gz
+sha256  56d83852139d542e3d53cdadbe52e80697e08e91b7c804e0d4d8f0a495d793da  python-selenium-4.51.0-cargo6.tar.gz
 # Locally computed sha256 checksums
 sha256  307012b4481479a56605420e81db14686a0274d246d06d224c363ee09297d330  LICENSE
diff --git a/package/python-selenium/python-selenium.mk b/package/python-selenium/python-selenium.mk
index fdb9a5c7fe..e1d288cfe6 100644
--- a/package/python-selenium/python-selenium.mk
+++ b/package/python-selenium/python-selenium.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SELENIUM_VERSION = 4.50.0
+PYTHON_SELENIUM_VERSION = 4.51.0
 PYTHON_SELENIUM_SOURCE_PYPI = selenium-$(PYTHON_SELENIUM_VERSION).tar.gz
-PYTHON_SELENIUM_SITE_PYPI = https://files.pythonhosted.org/packages/1f/6c/09a5bdf96a5f850a2bf69ee670a246ae30a132dca3975c7fb081aae09338
+PYTHON_SELENIUM_SITE_PYPI = https://files.pythonhosted.org/packages/c3/d3/c925308af2c9b9a9ccf531cf23ffba4f38c0d750f088a06e560fb2ca0c59
 PYTHON_SELENIUM_SITE = $(PYTHON_SELENIUM_SITE_PYPI)/$(PYTHON_SELENIUM_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_SELENIUM_SETUP_TYPE = setuptools-rust
 PYTHON_SELENIUM_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
