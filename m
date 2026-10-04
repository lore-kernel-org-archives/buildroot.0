Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108B5CA5FCE
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 15:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDAA16060C;
	Sun,  4 Oct 2026 15:59:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BhcgkGbt3AHB; Sun,  4 Oct 2026 15:59:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org DAAE26060D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791129577;
	b=NpxF449bri9Ke9QmMzp6eHfWRRdOxYqRrsdRwwHZvbgwlEkeOI6XClyd6p88SotSz71n
	 CrB561tXCytdkeUPgCLfQmynaQ6BGXp3RlusIf+5bwrhX9hbjd8u4yThuD5tnatGcWuaf
	 dpQl+X8kF8pGtdINRpH6hvLKwex6FmseXF4J4A+jQAsqvgQmgsj+6tMZIyYObCl3oOOMs
	 KS3lXbyy/nUmJEHG/cpbz86yKg56uq+OimbRQoH3W/EtsVGOFV0ZR3aojHe0YEal35ks7
	 4P3pRx3kBY5mVAeFWTD3bKQLdNluijTf8p+dddIj09HVyPGnnKW568l52qBxo1/AF8w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791129577;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=v4c2M2Hh+hoprhp6DXTbSZVQ6FxZKhEAETEYsKI8ZrA=;
	b=btSH5MFz8Dt3P5wiQEkVwIE4jZIqQ+pB/Qgmv6vSDxK4rp/NsAPERXGnlFgCHpmXb9WD
	 B00hA3LzsQMXdQMFK/w6WUfFcotky9J6d/fWP/gwb8PHlnmAnvyuq0MGPFv4Tlu00CqQF
	 pnliCCCA3//SjzOdV8agRZCQBRjHKw9+VP3cIcdmFl6jmPPsaCmnBArXOsPyN7WN9y7Gh
	 UOiUcAuD9v4+EYvm1jinQOoMDVq3eDzX0dyJCfxzmuCZnkXuP1An5NwTl0grJPkhhzqsz
	 hfLpVSxs/0fwqtHD+8Ir1CGu5UeoAUTkuQ94JUiA9iRposDdMhhC5QMMPK1ilfjcihQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791129576;
	bh=v4c2M2Hh+hoprhp6DXTbSZVQ6FxZKhEAETEYsKI8ZrA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DkyRO0M8DCRP9wi43Va7NyQ6MsRenDoPPNDpFreybcJfTQrlvCuYx4GoAb5CQgCPF
	 9ITr0Znq9q7CHMV8Loam4n3YBXPOaWGqTAODcOKTN7U7ESWC2lcwV0JV0CHDobornS
	 FPLoVLhEZb1PF523pwP+hORosl1g1xjPFXQpsw4QX0SYcu86/jBIE/znomIuVE3lD7
	 Vd19ecs0sOLtDIPkPA4EI9CpS5urTC+PPMePhRbW76NIYcs64iuUstUFMGJOzsv/Yh
	 SFQSNXgJ8Y2GYNOYRAl2cPHlUJVp5imvdKiEQ9SZtY/w8UPb0DAS/YMzf9vc2JLUgV
	 GeZ2hI9ct0iTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAAE26060D;
	Sun,  4 Oct 2026 15:59:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A74B34E
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1AD424007E
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:59:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m8XpOh2_suyI for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 15:59:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 7976D40068
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791129573;
 b=WzBj3mi4c/D0MDtnoHG6hHn6rgC5WAYFs5jbUkLCrneuamxOH4HKpEAT4ti7GtSWd2RH
 huqXpE1yv3gPEHQzAekKtzrGBn06ZbOaCsG2BnO5P6gB2p/RpEItFqoFEiYewYkchFXMJ
 m9Ls4HSWXHuoCmInGonyLhqksfL/gg5nYZsEmsbSOBc0D3cSo/8xbG3xQv8zkB0z75M5k
 K5RbdYpsLJnpZI2Wz0+GbG/2Fir98jwHlXjyR8xWeYJBU9+HJH5Tpe5I8I7UGNgyshNSE
 uxDs6n8Lj2LktF6n/dc/JQg2YH9Wd5Wni0EMPuz6ex3otitIMpQzjIWr1aVtAA2ophA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791129573;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=05euJvBvmad7aYR5C9Nqx/nylTQbGmkbKt0GS91RXtU=;
 b=KjvpWZ4LjGLJXLmad2mhOtEbYX61KPlQd/QIq0cI7bC5IUVxuUSmCeA3rvrK0gFS/5fY
 dGOJFynA1RNGk35NOPHsryWb54E814D1q1SY2ydSuOek0k/+vh9Hc27OwyqtPVUUvs8u5
 vIsgt9zTGdFPPBvJJAn1B3alWDNIgMY30DpCrHzKfKlkTjPFpsRmOE4lj7e4RabxpcYrW
 l5t3+29takm+U5COdbGUG5qtGOE9T8ZWEbK66v8VxGdJARaxmJHVHrn8mDBy7AJM/l8HM
 QwySjxLiPJR/7qBUxiCs/9NzZZQH/YZfwKQkrO1KUESHT3O95cuIRYiaQB2I2mGkg2g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7976D40068
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:59:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C4D28B6BE; Sun,  4 Oct 2026 15:58:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Oct 2026 17:57:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 86b7c0c0a619edde1a1ec76c105b7d83add61610
X-Git-Newrev: 28fe8d91032aae1d5f12486eecc200580d076201
X-Patchwork-Hint: ignore
Message-Id: <20261004155818.3C4D28B6BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-falcon: bump to version
 4.4.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/28fe8d91032aae1d5f12486eecc200580d076201
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-falcon/python-falcon.hash | 4 ++--
 package/python-falcon/python-falcon.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-falcon/python-falcon.hash b/package/python-falcon/python-falcon.hash
index 6a78f0f617..269986fadd 100644
--- a/package/python-falcon/python-falcon.hash
+++ b/package/python-falcon/python-falcon.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/falcon/json
-md5  f6ed9db875cb6ea8d26791b5345cb0a6  falcon-4.3.1.tar.gz
-sha256  b5081be62f1e2d4f5140f4bad6993fd2bf8b1e503ee7261f56d324b87e41a67a  falcon-4.3.1.tar.gz
+md5  0c8029e7de3eb3a158770283c0bebd2d  falcon-4.4.0.tar.gz
+sha256  9f3ffbddc8baed4573295642eddb18a37eea37baba9f20c5be379c8b3d3d79e6  falcon-4.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-falcon/python-falcon.mk b/package/python-falcon/python-falcon.mk
index 44ba1c7bc4..4e6bbf8812 100644
--- a/package/python-falcon/python-falcon.mk
+++ b/package/python-falcon/python-falcon.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FALCON_VERSION = 4.3.1
+PYTHON_FALCON_VERSION = 4.4.0
 PYTHON_FALCON_SOURCE = falcon-$(PYTHON_FALCON_VERSION).tar.gz
-PYTHON_FALCON_SITE = https://files.pythonhosted.org/packages/a0/02/a51af369a4feded77801d744f2d4669c7fa0a294bc117acf6ee06439937b
+PYTHON_FALCON_SITE = https://files.pythonhosted.org/packages/a4/c7/a0584e932cdb42ab6e5dc3baab16352471dda1ba2215311c65d79ea3c0de
 PYTHON_FALCON_SETUP_TYPE = setuptools
 PYTHON_FALCON_LICENSE = Apache-2.0
 PYTHON_FALCON_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
