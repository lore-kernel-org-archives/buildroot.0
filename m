Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4722CC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A9F1406CD;
	Tue, 13 Oct 2026 20:52:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IHE20ur-OYx4; Tue, 13 Oct 2026 20:52:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 88FDF40693
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791924767;
	b=MSeFmNYhxYp4MkJ/G2ROAOJAHyL15xFWiRMSJAHoRIaMTgLezCvaXrgXjpr3DBs0nlL2
	 zBmRrP0r/Gg7dH5qtngjF36FhzVuGFDdpsZdb304FUnRKkd6j8clguDOdDxdjH+COxy2j
	 sDrFaD3YATM/AO6h8RZ2YxcHW2lZh0RjOxdfqv6ZDGt0ymJMcrIuGXL44V28YEhHrNZsn
	 u2OY32IJqmeKAjJZ7m0ydhdgL5Sh6QTsQeVxjZm7WO0NzNpW4W+RVT1lfo4NcLtG4JmFB
	 uo2+egNrR5RrOIFYLV/1Y9RQmK3dZRefh88tVC4d/tsrgv0JHTa7mFClfEfDqVr5zjA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791924767;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=StoKPKBCKVGlzwTy5UP7isCqIQAqCE6GN/sCtCxaICI=;
	b=FS8NG/YpTbdSLM0cYA/9BatGkbzEmD5XMQrT9dxS8atWxIkujJmxYqPeBjzupAwVMt5o
	 Cg4lU4IJ0jQ5zSnH696UL4teQks+k1Ubh5dorQ/MwGQ/uz4Xx65CTqY90f2SKqyshGmPz
	 sC7KaoJjMgWhT11AvFUk6oR8GZ5QJDRSG/SEWCDsIBfAjhK8l2sM0tS4WU+Twe4h+faRl
	 nB+F1WruJKJHe5fjzFuOH+QxAW438fo2x7HLlMWz1DxI1p2BddQHG2MtPA48dKW5N8jgm
	 hlxAZwe5ozdj3vEpm74VN0ZdAkuxsCYJbaDPHVgi62Hr6rdg0EpluBnxVz9qv+p28PA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791924767;
	bh=StoKPKBCKVGlzwTy5UP7isCqIQAqCE6GN/sCtCxaICI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jc5vXQgBzq6JmPAd0esKmoqFnBZ/2gm9/R9CZ+7LBs239mQXK/CuFt7mvrqUtZbi/
	 w51zHUFBc9PkqJvZBauaw4bhdpqx+tNAy8nxTmGMX9boxegu1izTZ/Y8BKvqnSZN6Z
	 w85SZvmnJxz2wgk9mIuFuPueRQXLjDCEBPamFBnln7bSa5yS3kiPZrHCYN8bU8pWdx
	 FyAx/JNeM+ILoEx4JSpcsn5qwFBGF1nWU9/5I9qyJX8anYH2AWWDexav+bhBcfZB9H
	 6rbkPZEuJdiIrq+1/DQwKeM4CrNPqa7FWTCE1cerHCsbFqQBvGgBufjtcnEHV0/j/d
	 NbEwQfCrF9HEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88FDF40693;
	Tue, 13 Oct 2026 20:52:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DE91143F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFACB60809
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BUw73zm7NDhM for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org ED3F3607C8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791924746;
 b=dIzHBtm+7eATt9KFSafmP71iNrzH8xJf3LgwxsS1FgsFweT92sOAJvvgRnYPQBQj+V3P
 ESmNptO3Re4vmhmdFrOURE9Vhqf3df4NsUChx7bTUch/Xf5gejsBRZRc0YiL0vFLFt8Ic
 yfPrr0SiY70xV90DnxrHefo6lOdcc9JTJslSSoCg1TDy2IgzL8IyuKNrmTxGA9lcUJT/q
 Jve7OX1swVHRzqpqZRj1VlXJNWwY7JJpEYIvLSA+rTa6hpnl6qGhW2Aj+MRQrIAl4CLtW
 9bFMzDn3E2IgHYsNP5OEfD6M7tUG+LaVPlHzfQS+duIabgiBWoUdKernIjv6piLFa9Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791924746;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=x2J37K8mBPdrWbF96M1nFjhuNEz5FTQdbWD3K9Coplk=;
 b=qSMzhBZaFjq9pmdh354rTIPN1Gz8BU8dYPRbLBxAk6UTCud6tKsLyNjM9s5Qoy5q8Bfe
 jH8Ijh59UfdNxRLjB7FEuRrz8XMSX9JuNYTnwfdGY8Ibvt+3pXNp5qFFwDxKy262pw+aq
 4kTqzUOlYL3nwAI/JdE/fmWdWXb2ElRvjsRhhToeRJhC8jqpwBCS837AdHheKKootsF/8
 NEGRb6KNeU9qHVbWDD81I8Vyqqc6cMy1+mXVdYfIacFzDiLjuyjiw0VNQy2kpAHilVDFH
 2FfW+PkPaSIX9IpO10/Ang08BlqdLKj8BeIA4HKZF8MDOExhA2AShWZxw/sR+d56kSg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED3F3607C8
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 332079550E; Tue, 13 Oct 2026 20:51:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:43:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a2f910ab31a22805354281ecf4fb9fcd4519270c
X-Git-Newrev: ba1434dfc3334eda2d858931dde2faf82b11dfe1
X-Patchwork-Hint: ignore
Message-Id: <20261013205106.332079550E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-iniconfig: bump to version
 2.3.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ba1434dfc3334eda2d858931dde2faf82b11dfe1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-iniconfig/python-iniconfig.hash | 4 ++--
 package/python-iniconfig/python-iniconfig.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-iniconfig/python-iniconfig.hash b/package/python-iniconfig/python-iniconfig.hash
index 576a93455b..7ae82fa863 100644
--- a/package/python-iniconfig/python-iniconfig.hash
+++ b/package/python-iniconfig/python-iniconfig.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/iniconfig/json
-md5  5c1d9c21275feb3da71400bf716edd72  iniconfig-2.3.0.tar.gz
-sha256  c76315c77db068650d49c5b56314774a7804df16fee4402c1f19d6d15d8c4730  iniconfig-2.3.0.tar.gz
+md5  dbeb0b0ccd25144e7ed5ba66aed46bf8  iniconfig-2.3.1.tar.gz
+sha256  67f4b9c50da0dedf52af349e7749a80a9057a5031199791b906c3bb3ae878960  iniconfig-2.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  3409fa91f7ace557894632676656e32264fe5ef7581535725dc9a23774551bd4  LICENSE
diff --git a/package/python-iniconfig/python-iniconfig.mk b/package/python-iniconfig/python-iniconfig.mk
index 68392aaa10..4308ec7939 100644
--- a/package/python-iniconfig/python-iniconfig.mk
+++ b/package/python-iniconfig/python-iniconfig.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_INICONFIG_VERSION = 2.3.0
+PYTHON_INICONFIG_VERSION = 2.3.1
 PYTHON_INICONFIG_SOURCE = iniconfig-$(PYTHON_INICONFIG_VERSION).tar.gz
-PYTHON_INICONFIG_SITE = https://files.pythonhosted.org/packages/72/34/14ca021ce8e5dfedc35312d08ba8bf51fdd999c576889fc2c24cb97f4f10
+PYTHON_INICONFIG_SITE = https://files.pythonhosted.org/packages/01/e1/2069291243c926a2ff1cd706c7f3eeb9b62144bf60f77c9fb9ff2fb26bd3
 PYTHON_INICONFIG_SETUP_TYPE = setuptools
 PYTHON_INICONFIG_LICENSE = MIT
 PYTHON_INICONFIG_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
