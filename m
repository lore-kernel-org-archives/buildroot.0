Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD55DCA5FFC
	for <buildroot@archiver.kernel.org>; Wed,  7 Oct 2026 16:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C6FC607D7;
	Wed,  7 Oct 2026 16:23:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cj6zNXWd41h8; Wed,  7 Oct 2026 16:23:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 81C7B60633
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791390190;
	b=ByObQTmf1N3oM4ZQ4IX5GQDsO7Yv2ELIrNEeLcQ1t/JV/c7K4N7tFJf8EVTbNmNGOqkh
	 yJOqdEc3MPKBq+fl8kR1gsGpL/VYCzlfRCploPGKtb+v3q0T19Fcheo0acebwjSsbGEhA
	 Wdp//wuYtyR57eKj4pwcCqvbODVWDAYYqEturi39z5lYQp/xtpaAw/KhiJ5nvrd8xVco0
	 YtsOKa+zykChTpyUWWewAvak/GgU7Q8SLQorjMO1koNBp7Mf/a4aX0/sECtNrgQn4QXt0
	 OGYvJgpYUQfoWGsKrhsXDMB9Kz6fYiN8LOSZUXnQDIazhl3DMAVORFUEv/5WKLNmgCg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791390190;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=dT/yrEuFwVGkholD+m7stcsxPTvL9nmSDA4D5nimvHk=;
	b=aRtTfuCDhfBKn7QxQFhhMASpr2HteDRGI+cjiZcAhi/jc1TkLDsgTUO04vblx2i2Taif
	 8U/jw9yc7ely05NQ8RfFUQfQSGM66r5kqY1FRH4/KanOVg3xkNpW8t2BSeCXbem+d/pfZ
	 Or+nA10TqQ7yEuLaEkLp5geiCj/nPuVQvzSA5lgkfP4QzMb4wegzfvDcSDccHrpsIEVuo
	 VSNbot4qBbGB7Koew6E3FysevDOJXbEWm3u/mogLCnapzNTMKBoVJEyuOVwLlsD6BIWDB
	 RlOx3TwMYBpLP8csSn4Y0MA6gBzKYDYqR3vZP6crhENtNaHiTc2K8oycnOhyfh5nx/A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791390190;
	bh=dT/yrEuFwVGkholD+m7stcsxPTvL9nmSDA4D5nimvHk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KOjLuVNZJFI48wMrs8+ybNR16mNXYNjzHrHqTsvW0DCw8Og6O79Gzo0dnrxNvDj45
	 ccdzNz/d+mLRqsjgH6ZzDUeB6/pdA4or+FJHaytrXa9ItbBwsS9D42GBr7XdnXUhWa
	 FYAX05JXIpp/BLxhBaBc3OADGFIUP0BrterW8mXR1ZMPfDo+FRviRJc1JzjD6QnSgF
	 qOeXsvBpTI4bATlrmLj6C8zl6OaVih8SjtvoRmR3Rw5XlkdONGGjyEPOM3k/mlyLAK
	 Fx9TZ5J5LA4hq+bXJBXNxsAFlKEUw7VypVqwIBu4H9/CHK28TiylPpAN1sF/6gwXVv
	 i8NeykULotinQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81C7B60633;
	Wed,  7 Oct 2026 16:23:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8909A2B2
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 15:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7ABC940522
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 15:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3mrBf3CUwQIj for <buildroot@buildroot.org>;
 Wed,  7 Oct 2026 15:36:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8AC8F4061F
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791387376;
 b=ONKeBM96fF08eTzsfaRH9tml0fWVO1N8XQ6xTE5JlGm0Y1ZPomXG0HPK9I8lUf9c+TsU
 NVGT9XtTcLlo+RZpnvh3N4bT9O49JfxMW5kdLT9gk4h2U00+FeapdCqMXb+8xRq7Yewiy
 JXOseXRzpfUMW8nlLKZVsSZnCFjbbN9Yo2yONbOHnZ6GOpy3sXGK+8OL3ETDEbG0NNA6N
 51r/E9EwUun0Iiz2iaiX0OrcCUKwaZvTAsoHyZJfh8zwZG5BXjk0xI9hH2373Mn0fvyGW
 KFPK9Eu2b0YfJirw/ScN8n/aGJYumhqfMk22ChEkzf5Fb//yNmV8+r2IYS8FsgG7zkw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791387376;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=jR3vauqMvJvN8ldNV57MLSUE4apFKcG6wbfaUi2zXrg=;
 b=hayW+NptRGmjb4H6l8wy0DSwsn5Aos9su+TpLtOnN9mdLDK7xbFLy2JpGHC82Gg+MTOd
 dJsww67mFpRO+B441WRsv3quvATQA9Cfcge42KEjBxpZiJQhL4wFXMObtK8OJWRMPdhkZ
 9miC26OFHQS+7V9/OZAUrC0G7Uuw/01YgHWtim9RLeFcBsNgHXGde4yahrH2G/ml9Lv2f
 LArEAHviRfqnWqLHM05CPR+j81bSaxzccah6LmgSiDh/YMsJgCKyuf9FqWX8i2ZZjNht2
 kWQ9oVRKHvmcXPqmtga2K0HPL+TqvV3rKelmj3o8iB79YolhQztYrNoNTlPQoPhoxyA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AC8F4061F
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 15:36:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BEB018DB40; Wed,  7 Oct 2026 15:34:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 7 Oct 2026 17:35:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 95455bb9ccb44e4aa80325376bb91891bd1e4e72
X-Git-Newrev: 1ab8f8ef5af5a170a1ecbea3209ca39afd49194c
X-Patchwork-Hint: ignore
Message-Id: <20261007153459.BEB018DB40@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-boto3: bump to version
 1.43.108
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1ab8f8ef5af5a170a1ecbea3209ca39afd49194c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-boto3/python-boto3.hash | 4 ++--
 package/python-boto3/python-boto3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index b35394b8c4..13a242c8da 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  e756f77886a1aa59d916de35340da68a  boto3-1.43.103.tar.gz
-sha256  524821052527f6446d249bf710847b032d9b12135e346c9751777a0a2811cf04  boto3-1.43.103.tar.gz
+md5  f1eec360124da94c8bb9b36f66bdfde1  boto3-1.43.108.tar.gz
+sha256  03341f089158368acf83e921aca98b706095322ca52bc4c039a616940aa5ad41  boto3-1.43.108.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index 8390e8d310..97b263d8d5 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.43.103
+PYTHON_BOTO3_VERSION = 1.43.108
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/46/59/012898d78087105e9c20fe31605d3f1999921745e1890ee0f0d993846e2e
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/48/59/fb93b6ebd9ad43eb9a58c7a6da51a0fe24ab0c04bc4d534a0bfc5eba7f59
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
