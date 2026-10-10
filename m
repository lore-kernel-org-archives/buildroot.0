Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F21DCA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 06:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0982660662;
	Sat, 10 Oct 2026 06:10:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R7_fqqSBngB1; Sat, 10 Oct 2026 06:10:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C1D806066C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791612640;
	b=PH2DVRQ8c+QlhtbVhFA/27h7T+Y57gIU4TZgbEQWgYsTBzwfiUI1rXucNJxUsQDxB7DL
	 Ecz7nk+0kotOeFyTDfxBcakxsR2ZRR/Rrn3ouVmSfb/OFgXiHDeL1l2ucHclQ1Fi4PV5z
	 Jswy8O1+TwOhXq8l6hGtfnK/0P4BI725BVKdjFE6o9aUh4PsoWmJ5aBN3/Q1iHpghr6cz
	 MR2IMfgImWeq0/JK7Pqhp8xZjGvEXxlO3H7sJJxQP2Ybb7DEa08xSJ8bYlntvqgWaQTVy
	 e2QaZ+TncbUQJigFPM5gE8jEzGpCSfJgp4rYJ7XGugf9OzbogAFtjogxIahFlTuh3Bg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791612640;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=9h0r/u7MCK9Ekzr7mefrWzmyel3dVyZF9aOk9UH+XTc=;
	b=dgmFbTZXzsgo+v3lEW49iRJDA5BJnKQqj5aiOjW3gmF65uKgaKk0NHWhpsf6qp7MroJ3
	 7szydrMB7gepWaPdocIxwZYlJ1yMAA5V8aVmzLGvXWzyLP7NyfRWgQQNyJdsky73NT0qT
	 RudJcerbe0g+I1+E5iPwnj3x8e/Z9yozDVjmuANPIddydf9k7TzddGCNXy7+HMatJkdMB
	 hjuVMw8gT/fiPmFdQMkSAQw9HW2zgq00OuEevMzDJ3re1kgbUItI9C4OFiW9adOaOPT4/
	 gjKIGBL98dy/f0YhYiWX89V9V6/cav0Flff71/yibEMUG2sDNz0bLc8XVtuNXX9/L2A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791612640;
	bh=9h0r/u7MCK9Ekzr7mefrWzmyel3dVyZF9aOk9UH+XTc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZNHnWOoyT3EJne7xQwYOCS76/eTWJRFHBSPSxYfrokn/dNjlWj4rkWCqFC5nmiOtg
	 QY1rWsl6HDc3NGW8i8UKpekvygD/CVuitQVBys0hUCavAhYjnbZ7sjvftFgZ/cbLK5
	 2J0kCpEqs4DJkuJ5OnMl0IObM69lbWQhXDG4qBCdgoKqG9m421T0RVLfCyeTD2kwyH
	 KZmN7/0h1CQbqT+0/FAmzMBRnmm6WIdk+BK1sOrbmihaZ5WnKGdaAPh9tlWg4o4A+J
	 hseJ8yWR053MnSPLMpCb6LiLD9DrcqKs4609gXjf7rNvpiUelcAmInIWQmGfpW9wsU
	 tTuKJwEcbtAng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1D806066C;
	Sat, 10 Oct 2026 06:10:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BE1401DE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 06:10:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB297812D1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 06:10:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8lYENk9rZsIV for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 06:10:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B3F03812C2
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791612633;
 b=A6oiPMJvhiLOiSQKP0IO9xhwRioEs0bWBopRuL5QsrSVFa0+3yCvJAFpsSKvJS2zwEb7
 FSO4QiP4zK61Zh9GNlduMB790VKrV8Pu5ygnZGofALVOCnD89l9tAtqC7GYhn3Mlb03AN
 25JWICh2+tKoOOivZFwRdDhBricD10w+xGxgXACTS+rEOzcDodDyTJOqtVxGSIaLiVQyl
 gQ8eljZwvbzskd4wWRPok8aB+ZmBlxOuSdmtma4mOE9oEVJDqYcOTN+o59NkndGKrZuVm
 J3MHcH4MHVWNHmtsyzqA4K8WdBWBwTapVN4P1QVymmyP6Dm/i2hZBSPFP3kJtWr7qyw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791612633;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=5owDxOjT1gzeh8qY+znK/4+Nyinwfe65IscUIUw8O/0=;
 b=pZQlp2AX5SBJR5tuD4sG40KdIQnvKgzXOXoxqDgTb7CPCFEUHp78GEhMWbSGNGZNxSNz
 2F0+EAyzTLM1TVEPHIVPiLLK5ppBnLGoSFe1DS+3Ev4ihicR28wg8r+ZAQp3l2BWToEbE
 Z2lGKil/+EjEdqAs/fTEnuVxYERUzkGPov1kN2lK/7E6S6t9x5VyhkT3+HeOve7dFl4Y2
 vDMiCxgHTUb5q+3npIcjTryPMmIvgrz1V09blUPLmqXY9ZZzHBJNuOmDl/bpJ/0ge37+3
 evf73B8dogQvbbIRfbvbec0ovQnpnFjHlu/GH4GcDDImloe/5bCCl22y76TuhgKVHqw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3F03812C2
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 06:10:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A83A8E4A3; Sat, 10 Oct 2026 06:09:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 08:05:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 458fe813450414f5fd9f319dd27e6508bbc46210
X-Git-Newrev: e48f425409acb1bcd68a8de1f4dbf0efb386e644
X-Patchwork-Hint: ignore
Message-Id: <20261010060915.9A83A8E4A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-websockets: bump to version
 17.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e48f425409acb1bcd68a8de1f4dbf0efb386e644
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-websockets/python-websockets.hash | 4 ++--
 package/python-websockets/python-websockets.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-websockets/python-websockets.hash b/package/python-websockets/python-websockets.hash
index 63ead47a25..48fe192749 100644
--- a/package/python-websockets/python-websockets.hash
+++ b/package/python-websockets/python-websockets.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/websockets/json
-md5  1d11b405b284374774d43bb70a6faf92  websockets-17.1.tar.gz
-sha256  acfea4c20bf54384883ea33b1240fc1db4f52e190823a4e2b334bc3e8bfca96a  websockets-17.1.tar.gz
+md5  b84acf3c346484f3993dbb498e370aba  websockets-17.2.tar.gz
+sha256  36c2fb94c990cc2545143b12690e2de6c16300f9dbe5b4f33fa300cf57dc8792  websockets-17.2.tar.gz
 # Locally computed sha256 checksums
 sha256  3d6a0c050d8bec52fabad502e45fb25bd02bcadbd70dea34d447b6a0ff4e6da8  LICENSE
diff --git a/package/python-websockets/python-websockets.mk b/package/python-websockets/python-websockets.mk
index 35d1b9f824..3a6c50cb09 100644
--- a/package/python-websockets/python-websockets.mk
+++ b/package/python-websockets/python-websockets.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBSOCKETS_VERSION = 17.1
+PYTHON_WEBSOCKETS_VERSION = 17.2
 PYTHON_WEBSOCKETS_SOURCE = websockets-$(PYTHON_WEBSOCKETS_VERSION).tar.gz
-PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/18/72/fba934cb3dff7a85d811820efffcd141ddd52b5a2a01637f64551373ff4d
+PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/01/89/3f825ab71c242fffb62ea8fe638741c290f62f8d7aadf8125ff897747af3
 PYTHON_WEBSOCKETS_SETUP_TYPE = setuptools
 PYTHON_WEBSOCKETS_LICENSE = BSD-3-Clause
 PYTHON_WEBSOCKETS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
