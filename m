Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53476CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B774813B6;
	Sat,  3 Oct 2026 15:54:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hG0xdkor6WCm; Sat,  3 Oct 2026 15:54:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org ECF4D81305
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042875;
	b=AQz11ChDglrALbLIcAWXpZBhWrOloCbHZWQvJoHNXg+Vrk8wPXoU7L9WtbbZ6MpVC91O
	 iC5gDFYlb4oIyq9lmzQ6clAl70Z4KLUa9p5iZzx0PhtwZDGfgwMqIsWWTfoj51eoNoE1s
	 cWwamf8sMm3q8z8bt6Mp3SvF8mqretALuKCfpL4gxWCcoFv3SMLqfaiWPogv9bOqFCyju
	 qIFa7NXtGY7L61bcxpbKoIwOWRHyCuuMWuhPtJVK4OO5MqAYRdzNAwDijL5b/Dk+kApwC
	 XuRxKnvj7EEFFlXg/H5toWu/tBipGW+7l+1XKzssaSbrG7HLl//edTuKoXzUFpUtjig==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042875;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=pmkyGZ3+OB7AC+AHqq7mLdgZ1UZeeJyZmzgN82gIQP0=;
	b=ns62LPfMbsUvtQMuqHaaahA/9oWrMGHS1AEaS+IdMOv2ZXpkscAGwn94lq+hWOzXsr9Q
	 g2J0dutWZMsMDaEUYriXUBQP814N03xjh7YKR8+9HhfDi11vifDKKL9o8oJRsFToEnIwD
	 72ESnV4M9zpBoUqqesTnZsk0nppWIGcjsmkagQAsPRwLUbqVzG7MpX0/HLKegr/ZsnTyL
	 DlL96/hyYTlNNesPvZSz3mZzGEkTvAj/Nb2l5XjGdJc6g1HOVb4WSvuuQzordbqa9FMKg
	 SwICJgt1zD7WCvryWStXKVc3TZbZMW8u402dKYPbk1JTGx7Uuc/hkRFFSwa4wFj8klA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042875;
	bh=pmkyGZ3+OB7AC+AHqq7mLdgZ1UZeeJyZmzgN82gIQP0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YAi0i9sfNwUbiIaJ0/yTb657iIyIZ7iGumjc0qp+9+qoh4po4kZCEs0I69w1XsV5C
	 3pLrh59FkxOeTWxBKF0mUigLucIymfoP1LaYcmKvN46bXYPd+qQ+PHCjOXh3JroxCY
	 egvKE5NYqfN3aQ5YrdCuzgUjtcJr/0tabxwvS2zE7rCggqDQiW8h2x9HYlafrhhSXp
	 P3/E7tdUIXHg11iluONUWmlIisSY5nZ7rgDt01qxQ4tVoJr772tn6TMWQqH17eFx2G
	 laKBUFznTfwmNrQQhLMAFyu0N/kRzZZ5cFyBgbpNL+D5qVviV25RSx+cnNua2oJGbe
	 2MZksRwNkxuxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECF4D81305;
	Sat,  3 Oct 2026 15:54:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 36A3C335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27F076066E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2vew4CLStK7t for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0499160673
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042844;
 b=L61iX/Xg5UhzdYX46ILOsCQ/h3K06rKHgOkSbXwdvoOtUbs4DZcMf9oZLDptf4IJ3luE
 P1pbU3MPdTMN1cVvHaARLP/1kSYaSZfeCXNqZMy59tMnU5HDHeDYG+W7fZ3sHqa4eXpTU
 OrE8tTgsBzVdyv0xuUBKbpsfAsy0AMIIpigsKB9tvlXkl6sSTCB5Cd6KK1jikhAzpxY9q
 LoAF7vu3xuO4Ekcid9iMB3uAZKKILsOA8ci/bNWh/MAtIBOt+voO4dhni5YU33j/R7KYD
 oU5+zcGaVq9hEiDBkQE+ayYnaQvICRZ6CnQVma6H2lGqiooR1rC77Sxtsb2EM62UoTg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042844;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=oAb9bD7WBgkczE3qVb+keYdm9EsxFJIqUlIDmAnhGtE=;
 b=McSAVSx9aaonYruwAwoFXo5i2+KjMV8JVzfMw+g2vznypyCYVOQXFIwcL5dS5bf7CS/g
 n8ZuWhG1RNaBirqbpSsQ160kkOLgd519q5jG5XnfG878CLIilkAHb8CDk7cvRKYdO4wjb
 Npfz36yi2syRucl410a7+wliHZpwyuB4/E41FE+VFhVP9g/tS3mgvPeoE5UUpb1YGeHQI
 jhAtptMb9XDjeRNdiYtBXk05ihUPpo50w7tssgPON0yOcf6G5MFdq9Y2i4hzRCv9LwqNz
 StykdF8RNQ5GCrFATmKXRENSUFOjMgJ0apv3d9E8Vlpa20P/kPY3UXJYIMx9+V3N+cw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0499160673
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 458288A309; Sat,  3 Oct 2026 15:52:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fcf1782664b853932794080126f98ca1e7bd257a
X-Git-Newrev: 4ed13f740932d4bdfd6d0a078c05fa5a88f194c6
X-Patchwork-Hint: ignore
Message-Id: <20261003155249.458288A309@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyasn1: bump version to
 0.6.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4ed13f740932d4bdfd6d0a078c05fa5a88f194c6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyasn1/python-pyasn1.hash | 4 ++--
 package/python-pyasn1/python-pyasn1.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyasn1/python-pyasn1.hash b/package/python-pyasn1/python-pyasn1.hash
index eea1118bee..1611a42549 100644
--- a/package/python-pyasn1/python-pyasn1.hash
+++ b/package/python-pyasn1/python-pyasn1.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyasn1/json
-md5  b7a8127ed5fc251943e47dbef51ea6c8  pyasn1-0.6.3.tar.gz
-sha256  697a8ecd6d98891189184ca1fa05d1bb00e2f84b5977c481452050549c8a72cf  pyasn1-0.6.3.tar.gz
+md5  8389c385b422c57820eca5f21bad64b1  pyasn1-0.6.4.tar.gz
+sha256  9c447d8431c947fe4c8febc4ed9e760bc29011a5b01e5c74b67025bd9fb8ce81  pyasn1-0.6.4.tar.gz
 # Locally computed sha256 checksums
 sha256  2aad5fc00f705c4a1addb83eed10a6a75d286a3779f0cf8519d87e62bc4735fd  LICENSE.rst
diff --git a/package/python-pyasn1/python-pyasn1.mk b/package/python-pyasn1/python-pyasn1.mk
index 7278b3f857..b8b9062985 100644
--- a/package/python-pyasn1/python-pyasn1.mk
+++ b/package/python-pyasn1/python-pyasn1.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYASN1_VERSION = 0.6.3
+PYTHON_PYASN1_VERSION = 0.6.4
 PYTHON_PYASN1_SOURCE = pyasn1-$(PYTHON_PYASN1_VERSION).tar.gz
-PYTHON_PYASN1_SITE = https://files.pythonhosted.org/packages/5c/5f/6583902b6f79b399c9c40674ac384fd9cd77805f9e6205075f828ef11fb2
+PYTHON_PYASN1_SITE = https://files.pythonhosted.org/packages/a4/9a/23310166d960def5897e91fe20e5b724601b02a22e84ba1f94232c0b7f67
 PYTHON_PYASN1_SETUP_TYPE = setuptools
 PYTHON_PYASN1_LICENSE = BSD-2-Clause
 PYTHON_PYASN1_LICENSE_FILES = LICENSE.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
