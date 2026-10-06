Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19792CA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 20:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A574B80E80;
	Tue,  6 Oct 2026 20:14:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JG9SY-RbZkpb; Tue,  6 Oct 2026 20:14:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8B1A780E3A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791317641;
	b=agcqkahqXH6llKfUMmx/F9BHymTdvKg5zVxv4+A7bJJqK37uJYHGd9KG75yIn4/TWvwB
	 NrUsiC7zDnOQw6InI5FX6jId8HLfCTHfcF6azCw85lCcyqHVsmj4dXTcXYI9uiioUd1a9
	 7S6sOEQFwbEtH4pHYBrEn9MFo1G9ErwCdtDKb5FuWwKm+2g9bSm5EBVL8AIsiqkQoJ9Pc
	 IYUtrk9o9E0W8kTv84sGkDvpp4+mZsx0ssBuD4YMGwQKfEj6YBgyyhfxvbrk6OvgHfX45
	 wL9SfIAFqCUbpsQufk8opM3yOlip/UbKeI7Uv/zeNtIIQSlqY8ZnVP+EDalYfsWU70A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791317641;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=ahtJyZeYZLgx/ciRiRI1oNR0ypZmCbTCRL6+rN7Juvo=;
	b=fDTnAX8YZHHShNqUGz1uJHWZvWQgg7bDnpm8KzFvracXfp5/nWIg5irK3fCIhZlAt7xi
	 8FEpkSLC2QoTWwsGwhsRe9USskWKu2xT3G3elW1xKNPTmlOwvjXtouKbJTxvMaqHHZ3EL
	 8qboGTKIzLIN+joSTX6Q188AWDVuu2BXM6YGJGpN8m4bmVRf2l5EGG76RqQxc7yWOGSpJ
	 H8PbfgDc9cEuvj57Oi/U7zoflWDH0fKkemZeGYs3cGJX/CWTjYM25wdrKoodp2I9yYLP1
	 kn9PWyV+U5q+wC+kDsQ3f8r7UjsZKBlMbbd9a4ijE/HW1/3dpH8xXx7DRCYVRPD7+Dw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791317641;
	bh=ahtJyZeYZLgx/ciRiRI1oNR0ypZmCbTCRL6+rN7Juvo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iAHDuBCD3ejofDy9xNzCsOeeZCp8uFKCuqyA7udBHziPHIeBdxKjebWV8e1tj24fC
	 pMOJgiNJBu2VkZ5xdXCe9HginNlKNV9972MD3eP8aQO66p3MsWuMjkMkyobdQktXe5
	 DQH5q4dvZ3aavElf7Yp817OhjiTy+ZR49Bip3q5lv3o08S/8QdymaFAuoF8x1/cixO
	 /AefMOFwpaEDT4Qh7BGFel6F6qnPmkCPPkXXsGfBlON4RIimd86mnjE64PZIpxiv1j
	 u0LAB0R2+6UV7wKGdR67UT98Ea6vFnINSyvKtf8r9oy0Vsw56iW+D0E/bTFBuIsApi
	 SSuwC9xhX+j3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B1A780E3A;
	Tue,  6 Oct 2026 20:14:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C589D32F
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 20:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3BBF4030B
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 20:09:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RtGREjoTb3MF for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 20:09:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 77B0E403A0
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791317356;
 b=bVft51Yui3xXFoPCp2cb6e6gEdBK0C98BwjtPQRtQPswOygQiobhvSrQbdvtg5jvpW5S
 933/05fxBF1SEojY0D5No+wBhL5+Wcmh5LThbZGCxVOY6nlOcoj4rhbPxw9+evamv3eM1
 riGUp8ToyGBpV6xTR3xXJlUuXmLm9Sz5XuYe+fcsFLQhy9tQIopb6bgKajDaIW+Ifv9CW
 LRVWyTMY/al4btfhbAat1lCTpOIwtkZQEDYefGJvQ6xgbq+IWNS8gAVgEF1DXe7GyV3qX
 0zghv3pdvuuHTKw/s2gQc9fyyQm0DVQDfDdSLFyL5UHe/yca1hjdai66MYP5R4Lnz0Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791317356;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=/MHRakgFevJk8WimiUwy0t7BJavDSrIHyey/Z9/WNlI=;
 b=pA5COKcIHJoZ/4pMrsI1kjSiELNjpGPUAzOigEqJ5MoH+XJ15Rdohp04i2MvomeolhIH
 fYWOYncHllLjargpsWVAnmxQJLzzeTJhxxnm8QydJPszBJJ+lEHfbqPQPh+5Qd/5I++3b
 f9Fhz3CsMb5StnfUG1w32pJhdx4wdYJzpkewSQIYhG3VChpE10GK7pQQgf1ngpNyDZhyl
 /56ZfFKLkyHURHULV+z3X0HO1AcYHnLmQAftQqIcaINTaq9nzekwx4LoBJ/U3UE0Coi7h
 ZnjFrwypdRVZdMtRe9sdMeaSVKcN2V92zyFVbYjUhTwsRgAUN3IOh8fzWZOTsq2soMA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77B0E403A0
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 20:09:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 140038DA60; Tue,  6 Oct 2026 20:08:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 6 Oct 2026 22:04:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7de1ed77454587fd17077bb724629a0106b06888
X-Git-Newrev: cd28a8cb99f88618e118238328d3a11f9e50d94b
X-Patchwork-Hint: ignore
Message-Id: <20261006200800.140038DA60@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-thrift: bump to version
 0.25.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cd28a8cb99f88618e118238328d3a11f9e50d94b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update license hash due to README changes:
https://github.com/apache/thrift/commit/09b177a3f67acbdce2d8e5ff7bd94d3bcd99d9df

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-thrift/python-thrift.hash | 6 +++---
 package/python-thrift/python-thrift.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-thrift/python-thrift.hash b/package/python-thrift/python-thrift.hash
index 452bb7176b..972c0e0173 100644
--- a/package/python-thrift/python-thrift.hash
+++ b/package/python-thrift/python-thrift.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/thrift/json
-md5  521e6b4fc5d135af2d16f7198dcfa0e2  thrift-0.24.0.tar.gz
-sha256  9ef601c49e988475ff0e741d8e1b45feec23b48514e524341efc274191f1789c  thrift-0.24.0.tar.gz
+md5  e01caa69e039b12ce4c47be63cd79bac  thrift-0.25.0.tar.gz
+sha256  e85615ae9245f5622a5e36a9d2d867e1e7b17a8ca467b257dece5dc1642ccd73  thrift-0.25.0.tar.gz
 # Locally computed sha256 checksums
-sha256  35e2508f171c3ac2529f402c123c12f3b2ac91643f2e52b334f71f8c861be321  README.md
+sha256  aabb457f78181734bf08e1da52f08fa6008cda8747647d8d540e0853016f7253  README.md
diff --git a/package/python-thrift/python-thrift.mk b/package/python-thrift/python-thrift.mk
index 182139015f..827818fbfe 100644
--- a/package/python-thrift/python-thrift.mk
+++ b/package/python-thrift/python-thrift.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_THRIFT_VERSION = 0.24.0
+PYTHON_THRIFT_VERSION = 0.25.0
 PYTHON_THRIFT_SOURCE = thrift-$(PYTHON_THRIFT_VERSION).tar.gz
-PYTHON_THRIFT_SITE = https://files.pythonhosted.org/packages/5f/bd/8f90501b11206e545da3343ed0e5740fc694be24a5f637d7dd7e4e3af927
+PYTHON_THRIFT_SITE = https://files.pythonhosted.org/packages/65/be/b3f5ef7af6c1209085f45d7004e148de1d157ac5a142a672021b44ef7195
 PYTHON_THRIFT_SETUP_TYPE = setuptools
 PYTHON_THRIFT_LICENSE = Apache-2.0
 PYTHON_THRIFT_LICENSE_FILES = README.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
