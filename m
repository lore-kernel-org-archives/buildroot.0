Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69DECA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 824496069E;
	Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SzgKaXf3Xpkb; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9C79C60689
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042844;
	b=Y02XLHXahquRSTcbmBiFKdCGDoIEqJbOLEFhdxNwab47SV18DP37lfNNOnHf4R74RL3f
	 SBR0lzcOQ14YPW11hege89cQ3UDCogBUyQbh8EeH9y+GghDM6gd4xNkgGSgc9/qeIDwjC
	 k7P/0djz1lHwYiLuuL5q0fOBDKMn5V2ydf39oMfyHcwXjXKRK7eKav0JuOJNQU9Jk3VNF
	 VLf8jP6f8SchBIsGSLIFCGOdSkLdZ/TYsnqXu1tGMhLqC3XbkcXezKNxwqAQa9A7fLWnJ
	 DLjZUNw8cKktvkRSeudp/FwjM559XcyK2j+4F7XWJ10BiL8vjT9oAQfFKjVFVi8h1oA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042844;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4v0JXt5RCwqJod+q3HPhS8WrYqhl5bOmxJdszHjfv40=;
	b=KtfCS8uaJ4XJ+8dKWx0EUzo6zMvhD8yjQGJIhlemDtmodV140LQOUX9++2DLhuaH74Cv
	 QV1pm65GoG9HDKoebUNEuL51V3SyBZgkfC33SjXrLIy5FySWNj7NDqyGhUxFIa5vN1LaP
	 x15ZMjjHnELUubldRtN8XOojavYPkQhV/EJWRSLJ9/dWnWpy0HxPve7LrAi157g9Ul/EN
	 +WxadvbU1j/jdEApoIpt+gJ7gqFYFrXSLJAt2CQCq68S79pD7aQdPlzNDWn2ao8sHE1uR
	 kPIKmPHNoTpMmWexM+H2K0IsXJAsB41sZnfLA5TS4BMpbgL/qBTZ9bXSeMw70s1ddZA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042844;
	bh=4v0JXt5RCwqJod+q3HPhS8WrYqhl5bOmxJdszHjfv40=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VXYfRtd/jThrpNqMBsJRltygaIsjktce17CxRNG0p58SzPyqQaNtLLHS/i1PgEZ/H
	 10gYBvHOY08zNk31tozZUQ6kytZb4b91DQOTjwmSzUL6D5D2Skc9srL7MiBBwkLF5r
	 8jeOLr70sw5K4TQQ+6iH65bzBK+tEYugB9sdz9abjsRIVurYlfyW1NxOJLIvsVqDOF
	 xDkRaGbKBf029NmWNFHPHrM16K3xO2uFK40FjHRo8ZWkMjfrSySl38Q3CL71y65KBR
	 h6jiBgssAg87iniN9G1n4zTKYAURkGeLlu0yRpbnhA5uNawn/qSyyCng8WU6z+k8sR
	 xqqeWXitKvtPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C79C60689;
	Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E89561D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E60D641001
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XPYagyiERSWq for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 41E1B40FC5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042843;
 b=UceJFnYxcVquPMSRF5m5F1MyjNIzlHMLLAAdfmpIhGybw3mZ/QrkyzGiR0vbK6iUX50i
 Nw/Nn50uTF38cpOXmByWoYuXjQgIcAyEJZBAVJnT1I2VZ8AF/I4SbXJ7Hg0yJB/hq3k1z
 iMNcDvmqlnU7iMFM/LGvDvezBPpjCOswAWA1lglVr8BoB/hl9Ol4EvSrI4ShOtro79t2i
 a/bcScyShjPyeZed0nv4maCz8PV1UFYSUqxB1JvsPa9Hph1H7MOdwpUHhUNiwrze9oSUi
 +3+IKTlmc4cT8SS4S9M275SX43BpPzem52dGrmTCCZf2vjdMdUuOdnsmbHGtcqTAgWA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042843;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=V2oPudjpI3O2cbfQEikJ37dpw2MW/Enj9FduZWc3Vhc=;
 b=BkSzhczEBIEKHzyMiqnUlKUUSIFmtOl1c6G24SZ2rtLGdyQiRsrLXsEr/2dzbRMoefWv
 AeEDJ3gWkMht95OZfyE2CTpZXYGKYku8vRafiR0Q4FHXQFDwzLX7o6FK42LuURXEs0BBz
 ewVxKC4vcxNzKP73gFGhnGcpZOmbR62NbIgRNU4Yk1rhju7KUS9sf2LA/HGbwd8I+fY7C
 PynPMPq6QQywyuR9seghbiHZr09ZMVvRht8gZmSlf7kRwcaFv9n9ys/CeONcXYuTqa0kw
 jvatpncZFctuBnh+Yb3WJ8Ix7bXGpMVCDDsN3+EdahWeyFB8k/vI/c01QkzxI4K4dIw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41E1B40FC5
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 73E9A8A342; Sat,  3 Oct 2026 15:52:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 16:10:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bbf4256610cf48fe69c56e929bcfda022b1ee04c
X-Git-Newrev: ddb5dfeb65085d32fc46afa3d756457c46c983b2
X-Patchwork-Hint: ignore
Message-Id: <20261003155248.73E9A8A342@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-asgiref: bump version to
 3.12.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ddb5dfeb65085d32fc46afa3d756457c46c983b2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-asgiref/python-asgiref.hash | 4 ++--
 package/python-asgiref/python-asgiref.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-asgiref/python-asgiref.hash b/package/python-asgiref/python-asgiref.hash
index aecbdf8000..43195778f9 100644
--- a/package/python-asgiref/python-asgiref.hash
+++ b/package/python-asgiref/python-asgiref.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asgiref/json
-md5  85bc32494d842f4941e2b1fc2c7b61cb  asgiref-3.11.1.tar.gz
-sha256  5f184dc43b7e763efe848065441eac62229c9f7b0475f41f80e207a114eda4ce  asgiref-3.11.1.tar.gz
+md5  1997ff1970b2879b5945c9e8c9f8765d  asgiref-3.12.1.tar.gz
+sha256  59dcb51c272ad209d59bed5708a64a333083e86017d7fcdd67498eeab7784340  asgiref-3.12.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-asgiref/python-asgiref.mk b/package/python-asgiref/python-asgiref.mk
index 392f0a1c1e..4955a631d1 100644
--- a/package/python-asgiref/python-asgiref.mk
+++ b/package/python-asgiref/python-asgiref.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASGIREF_VERSION = 3.11.1
+PYTHON_ASGIREF_VERSION = 3.12.1
 PYTHON_ASGIREF_SOURCE = asgiref-$(PYTHON_ASGIREF_VERSION).tar.gz
-PYTHON_ASGIREF_SITE = https://files.pythonhosted.org/packages/63/40/f03da1264ae8f7cfdbf9146542e5e7e8100a4c66ab48e791df9a03d3f6c0
+PYTHON_ASGIREF_SITE = https://files.pythonhosted.org/packages/e6/26/3b59f2bdae5f640389becb1f673cded775287f5fc4f816309d9ca9a3f93d
 PYTHON_ASGIREF_SETUP_TYPE = setuptools
 PYTHON_ASGIREF_LICENSE = BSD-3-Clause
 PYTHON_ASGIREF_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
