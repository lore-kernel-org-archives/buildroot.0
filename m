Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE283CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E98981170;
	Sat,  3 Oct 2026 15:55:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A_8v2qOnVVWd; Sat,  3 Oct 2026 15:55:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org AB73B8145C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042902;
	b=k6bzvFYbsA4GphXnoUwvO7lKQVUms4/cWQxszctjAM1WUJpColJlE8+Jy73904FAZ61m
	 +fljlqhdTK+T4vqEd4C1LRq1ZOpXNUi+J9ElQpOlY0Eey3uUKpo6PUvsDeBmZtwkqpXXC
	 0ff4WypbOsQEs4KMY7Qg6/lF+mt3FTXjKSkiZF0rHJnzuUdgnRj7h9BpNS0dA7kHJNoaY
	 BbseDjssdA1wd6dV2dJ/M4N6Hob1B9Cnxst90vNO91waqp08BYQ9pRXCn01HewyQWDjrH
	 h/eQSpjyyQbiHZg7+UwFwunK7VKO/G1qeWWL5bddWbcFoJPf0UJ2+QsjNOSbm7836QA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042902;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=pl3Aii9orZFpwdVoUFa4ROF9ZW9ceGPG3CegZevQi88=;
	b=Hd2HGCrnuuORndiUc6w9zsIqvSZp5rlJ5wPT+4Sg+6wTbGKn8uD9V+gae1Az4m+ZdQHP
	 UfaOiE+gxoyc21PI1KYyWaijqBiEMKr61xsI7X6d+ClD7AkSMaEezG8TWNUiOmyUYU3Ou
	 Un55W5L/ttl3AF7qDFBeCarKV8MVA4p5pQbBkFaREN1NgqIO133EMoFyeGW3LmeK0/lcO
	 BfrtbzM8wu3YknSXn3c7Tz05cTV3Mza2pWlmzxuIluJCPSo/Kdv39GHJi9mWDwK55YDIF
	 gq9GWnN9yDn2nDtdg6zrvX27Q2EnOcI0wfg7wj49XWGSKQvAXEVqhB9z2SN79hrM+Qw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042902;
	bh=pl3Aii9orZFpwdVoUFa4ROF9ZW9ceGPG3CegZevQi88=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TqSVdJvFWQpqdeq5MVWFsivRRsk7J+mMuXCbJ/kdQZOeSGIxD/i4XrCH5w/jDU1Om
	 y2GPwPrwu66gc8J1kWup+HKxE8tjUiZTFaesLap7JlOWETLD390jZvNIgkGbgilxlg
	 abCUUbEipHOO0ETVUgDANTogStdjTRxxuetaUIRSsAe0VoGzvVxjimH/pBlyeCrLfe
	 /FCXU6rUtvmBaUg1zZcdx0gBWloGcRvpLThdFprnkzGM7jibhrhULcWADGpqDJVpIM
	 9dTcnQAXL2sdHoDOhE4jbNmPFpVNhJ7DM3Zwovhlqgj9rq/M8gmx6O545tyX0j0lKi
	 /HGHfszutZaYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB73B8145C;
	Sat,  3 Oct 2026 15:55:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 62CA4476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 524BE606B9
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1lVFZ62_lDRg for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 461716063A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042844;
 b=fGrmXzqj/+iDPMd6AW6lsE4iM8ok0eh+buXUB5eoTqB0+cr6lef3DsLrI/7NFhXDjxvA
 2e7t5ci7yxMTde5paPI6Y/zbP40zl/o4keXP08Pk/gVpM608mXdgmEfJJNv1OzSIjULYs
 8vTb70kmzJ89PdMfBCPo8ZF15ioFGNds93FpzJE2JB4z/nYHtZ9/JEXcbOe5eH3HX91u0
 ovRuKCjuEwabjuV2S5SMz6MujwwtZt46nHNn25E8iIeMz6VtP7K97+YX6JUBP/TuhereY
 0K1U7+J2MJQDZFtkVsK/ut3RLQIuKDsgBDdbUkNfGRXHbTxI8JbLqDmjJyQogIQhUWg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042844;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=q82Ntv54styFrGQxeGXyRpNYAW9lP727k75WA60OZcs=;
 b=KGfKJPJGkh9TsARHkQPo+XJh5S+80KuKS0GMeDcyl2NzHS9rAK+VEsmIXrbuJFnkKS2H
 5qqlPzA1LLGuhFAU41VO6LgUFZOS4WAKJu4BtZZF8voyjGUwakahbTo6dZ9mIEIkNYoEM
 YV0pskHVfill32Y4EX0mDxIjYbFfGM3fdEBaidWVVpSe6U1VFUQmFWSaNLPOpji4EFxvy
 vVPFzuCy4VOyL+m4zR6CEA3nSU4IRBzGDtUAoKQ047pHu+JOEhEDFitGr3uaOcmJxtpuj
 y/5W9s6CUUgnEgx4jmesIYNKObkV8YGfMDpegzm8GUZkzOCyY0K9A+EnNqy45MJv1yw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 461716063A
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 866438A309; Sat,  3 Oct 2026 15:52:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bfb1ddf2d5f139524cf2edb1c8373f429c6f7f55
X-Git-Newrev: 5ee51ba072b92657977cb483cd9dcfdc22c53668
X-Patchwork-Hint: ignore
Message-Id: <20261003155249.866438A309@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pymysql: bump version to
 1.2.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5ee51ba072b92657977cb483cd9dcfdc22c53668
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Steve Calfee <stevecalfee@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pymysql/python-pymysql.hash | 4 ++--
 package/python-pymysql/python-pymysql.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pymysql/python-pymysql.hash b/package/python-pymysql/python-pymysql.hash
index 21f84af741..e08aa83435 100644
--- a/package/python-pymysql/python-pymysql.hash
+++ b/package/python-pymysql/python-pymysql.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymysql/json
-md5  abb9c2e708ca71c6534cc04b7e4a8f86  pymysql-1.1.2.tar.gz
-sha256  4961d3e165614ae65014e361811a724e2044ad3ea3739de9903ae7c21f539f03  pymysql-1.1.2.tar.gz
+md5  fc45000cf0191d5c6a22fe01e7a60302  pymysql-1.2.3.tar.gz
+sha256  d5b288529782e536ae171866df3ca9dc4f6cbfb3cc2f18e6f837fbb90dbc262b  pymysql-1.2.3.tar.gz
 # Locally computed sha256 checksums
 sha256  314120dc65f0800f738a4b31400c76ee14decd1fbe77ce9c3540a421b86ea7b6  LICENSE
diff --git a/package/python-pymysql/python-pymysql.mk b/package/python-pymysql/python-pymysql.mk
index ce848d8e1b..7459286517 100644
--- a/package/python-pymysql/python-pymysql.mk
+++ b/package/python-pymysql/python-pymysql.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMYSQL_VERSION = 1.1.2
+PYTHON_PYMYSQL_VERSION = 1.2.3
 PYTHON_PYMYSQL_SOURCE = pymysql-$(PYTHON_PYMYSQL_VERSION).tar.gz
-PYTHON_PYMYSQL_SITE = https://files.pythonhosted.org/packages/f5/ae/1fe3fcd9f959efa0ebe200b8de88b5a5ce3e767e38c7ac32fb179f16a388
+PYTHON_PYMYSQL_SITE = https://files.pythonhosted.org/packages/b1/d4/c15b459e25a23767d2f4065ef40968920320f04e302889574310c21c96a3
 PYTHON_PYMYSQL_LICENSE = MIT
 PYTHON_PYMYSQL_LICENSE_FILES = LICENSE
 PYTHON_PYMYSQL_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
