Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74064CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4113B60F05;
	Sat,  3 Oct 2026 15:55:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z37riT-mOK-K; Sat,  3 Oct 2026 15:55:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4494C60F07
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042955;
	b=kqrZrnWnwdP5nWFb6LdQ19e3twEG2XLzvR1P+T20Ge7xZo6czym4KMrTlYH2B9CPYoAi
	 ZOf1M7a+qvIBkoNOROVZy3Yup9g3UDCx84PZJC3Iog9wB2Cne1Lu6jdRtjI0KkzMhlT72
	 NrNMw3ACuzp1PQrPgNy+XlfViAczSZBPEcZWu/EwozPsI47gCvjBHT8dsQenLObeBQyUt
	 E/WwG3ijG8fhdYeALjKKpZCRpEub9Gy3M811lEexQg6g+IIpNLQpFuKEQhzYqS2O8WVLr
	 Uym1HhUqdD/1ZSWP2JTsOx1exA87t2eAteOOcjpK0O07En58mUB4ot4c3WjVFbPzn7w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042955;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=1jJqHR6FtxWVr1RF9mYNHiN5XAnp9DjlpGMjkpv2jHg=;
	b=f5Il2bD5zp9VqhZg3jUT4dJTgDGJBHGLSKjlpbx8CGXco0ocN7W6FlFROmboERkbI0Mc
	 AebFZhyxAwmOx7XXVrSov9jflS+gVKx2Z2xqhhHINNcTXXTwU2Dvp6jBoNvPIGAPjbobl
	 b+Lj20cCq/mhjhQykOdxiJXAy+D9+mYNsFZIDghGXT8L/COauG7cA735nsMjZp6Ga8/8R
	 dV3FCx+aJQ/SeHtbqiJBcTWMJfG1ujVt5PTutAvsCO0/L9nH2yvOGa52MjysQGnNiSCSO
	 DS3P3gTqeTqngca/G5wDmOSLiwgTa52e6kLxiw6q0RiUJ+mNYVb7CvoTXYz39JU9GbA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042955;
	bh=1jJqHR6FtxWVr1RF9mYNHiN5XAnp9DjlpGMjkpv2jHg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mWtPRm0N13Z0ILwRKJeCISMUJbBRwUwESPfs2ymrCQG+gLmkC8Ys0SoWuQCyQnSEI
	 SUZse9ExC4sHAXn/gSJJ0nGaW+TE4zS3VJNM8j2f2Sbh6dxSlHuasjE83Arsk0H/aF
	 b0drVAFRh4mm0tng67uU8IjvLhSQUK3vORXFQi3y7SmEGQTeTcwvJsZkZCuFlkkz+2
	 TSGMi6TVtIp2jF55E0yhx9gJ/+z5veLIqJyef29FMPAPx1TFuK6K5wN5td869dnPis
	 GJ7wvhNze3IQUOaQUU1aIb0XEdYDWjXza1mYlHDb78ie2nBEZ6s07wff+6BQIvozua
	 EeTUjrc54KRjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4494C60F07;
	Sat,  3 Oct 2026 15:55:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 084269DF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE93C606C8
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3mYYDGurSg_P for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8984B6064D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042845;
 b=Utkm4ZALptKu0BArq1rXRuyb39JK9OGhA6j+oeBIlobVcoD+06Q9tuA5NzcJcflAOzgS
 3FMwqt+RzlXV3PFpsSR604A/gNidTVfIik00cAFmImjsEm9L6GPOqjaai6OjbjSpJeS3y
 9kFun8ydKjOdYtp08UbUi+O4E2M3eR1/te5YW730CS+LlxmUS3oSHlo1v/jXrG3UmVX1T
 o09UWbZTlCLLTlEKEOWZfSpAl48oQdc7gwh+AAGQZbajAfB0dpnm7EnGSuAl60YPVtkST
 SNIPhQ0/ik7cMOyw0+ophpqDZrzUdkxgbEpTtQ/h6tlmxXKMW6zipqSrVuW150FYy3Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042845;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=sohhds+QX1FVA+mgXtL2OGp2CDkNWzVirwOVmyUCz5c=;
 b=juvYFdWCh+dvhzLkBmwhO1EmNaO+6eAGUXQEysnCw1ZYudTGwK7CfRyGOdB2Q2q05P1I
 IsR+ZgjBX7AvHwTCXZ8cIs5xWbWlDqbgRzuMZSvxUyVwUuPV0aB9H/7vFODKFChQXSjdi
 DgTN6yjBuU44RFL3uptc3smHLRNlMBwP8lsEotyM6K7BKyuzll+vlHrBncPfo3LJ015GW
 yrpt7vyDhOGI9vUmCCMtentNRZYWihfwXIp6MtQpM3fo+ShWJEOacmXXV7/yX1eFaBkYx
 pRozJpXU5Q6mXqEkddMoh+f6T8FhTEiY3kRuGyYmhbYGwOaHumqzqPui2CUxbKRD+bw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8984B6064D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB649886D0; Sat,  3 Oct 2026 15:52:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 691ec67d3245ae3e2c539fab9cd71204849e81bc
X-Git-Newrev: a0b917292835da43571551f7ef7eeab7f6717e3b
X-Patchwork-Hint: ignore
Message-Id: <20261003155250.CB649886D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tomlkit: bump version to
 0.15.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a0b917292835da43571551f7ef7eeab7f6717e3b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-tomlkit/python-tomlkit.hash | 4 ++--
 package/python-tomlkit/python-tomlkit.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tomlkit/python-tomlkit.hash b/package/python-tomlkit/python-tomlkit.hash
index 51c8a2b560..d796a1c53d 100644
--- a/package/python-tomlkit/python-tomlkit.hash
+++ b/package/python-tomlkit/python-tomlkit.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tomlkit/json
-md5  5afa19bb5604584a7c7e718a5c0d8059  tomlkit-0.14.0.tar.gz
-sha256  cf00efca415dbd57575befb1f6634c4f42d2d87dbba376128adb42c121b87064  tomlkit-0.14.0.tar.gz
+md5  8e5245fd4099c9a6f99774b24a4591ae  tomlkit-0.15.1.tar.gz
+sha256  e25bbf38843005246210a12982776f27f99cb9be67160e14434d0c0d21ee1e97  tomlkit-0.15.1.tar.gz
 # Locally computed sha256 checksums
 sha256  f2f9b460ba719da6626add264d3782f275a4ff7aab677beda08b330911e23adb  LICENSE
diff --git a/package/python-tomlkit/python-tomlkit.mk b/package/python-tomlkit/python-tomlkit.mk
index df7b66f2e1..1466772fd9 100644
--- a/package/python-tomlkit/python-tomlkit.mk
+++ b/package/python-tomlkit/python-tomlkit.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TOMLKIT_VERSION = 0.14.0
+PYTHON_TOMLKIT_VERSION = 0.15.1
 PYTHON_TOMLKIT_SOURCE = tomlkit-$(PYTHON_TOMLKIT_VERSION).tar.gz
-PYTHON_TOMLKIT_SITE = https://files.pythonhosted.org/packages/c3/af/14b24e41977adb296d6bd1fb59402cf7d60ce364f90c890bd2ec65c43b5a
+PYTHON_TOMLKIT_SITE = https://files.pythonhosted.org/packages/94/96/e07752635b98536177fa1f37671c8f3cdde2e724c6bcf6034b2cfb571565
 PYTHON_TOMLKIT_SETUP_TYPE = poetry
 PYTHON_TOMLKIT_LICENSE = MIT
 PYTHON_TOMLKIT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
