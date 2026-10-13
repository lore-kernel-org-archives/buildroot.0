Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60273CC6B15
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D363405B4;
	Tue, 13 Oct 2026 20:52:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id liztHjeMbNSI; Tue, 13 Oct 2026 20:52:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 36B87405DD
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791924750;
	b=rpqr2nYEAYcpfGjOS687/xg4gbX9H8GNOLwLmiU+skwCn030uVCBMbgB7+piyaTQ/ghG
	 xCF5wWQGjzbn85RhsEpMVh4vFz4vbNyXYi2axkaOatgbKDqn4Ovnxj0nafQjzAeB72Bic
	 R5ZTKZ7Y88jGldMIFWJXWb2lUhGuTJqnCDfLvmDChR32f2ea0Mt5HvRy/rmbPgIo3W5Ve
	 MSpjdK6K6AsI0/af0kGH8ys/ypPsn5t1tY4pOSXGsUd/e6yu16LAqW1viobocDFBwfxj0
	 9Z9UNHN/gsZBbV5ldY6LxYmUE/NKa8A9E9O8ww18BN9sqfa27hYKGnjDpvMlunQ42+A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791924750;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=UHcfIb3sIvohuafNsqqX249JwiTtFQoluO9eIrMe6ig=;
	b=eIAeZwwMc4Imsp+eUjYf+ffrQ7MdtFV2FcU3Xo7O+TZuFbJLvCGfJ+CN/+5spGt6c72a
	 h18OdtX+gFjrpX428gLHQHyY1kzy41kovruQGRlJvy/FTHC8jQPoT8P8KZSDxEpA0BAGw
	 b5U3MtWGPj+W6xyxJEdpGX8of4eF2scUd9Ud4fkZ27yOjkb07geZPtVPy9ybRMwWOOU4t
	 1oW2zu4gCXzCX3D2Tv3M5fEdqhMYnUM4uPDt6mNRK4PZLrvD3x4P/zvVqyBB2iobsdUmJ
	 Bn/5sVmd9jm0z9wR0QdjPgXAQCL88aq8w5fgIntoSZqg9xxTcw5F8WRNtEGiRVsypdg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791924750;
	bh=UHcfIb3sIvohuafNsqqX249JwiTtFQoluO9eIrMe6ig=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=k+zh1zrB/LGNldoM57TugfFlYMUnqaZwbEfmGx/md/h7h59ND86EUmnVwDmBhE3sS
	 N1mWJd/ZJENzvENnHC1RnqdQnMjCqsOr27AbRhFuTSFwAX09W9sngpo8N4Wq5Bphxa
	 etKkCwBBgwFafBjE0uG+GakTnONWeOhbz9v+VQckLe7pEgzFgTocqXXlz2YFJHx/eG
	 8bOlOC8udde5R7RVj+QEfGdk1m+BGLId1/7nWcsWrbj1iXfUIvCkIf0f0U3qrigpw/
	 j7wzPR1OQr1JsD6A1Ft7qmbuKn+D+ynb4k1rO5dENmHxH3hCAU1wn0tUkKV3Flh4Fh
	 ASjxUFr2BOZeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36B87405DD;
	Tue, 13 Oct 2026 20:52:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 415212AC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2727B405DD
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AiEKp9aTXyFN for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:52:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7481940619
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791924745;
 b=PFJvMX08QuaYlsBlZpGEtvvdywm8CGn0jijd19lo6EDm7rt2EWLnbFKBo2JFzdPEhKw4
 yaIussbH106hm7NB3zpnkMzjlrdC9mDNHeCXUCi7gcYge+HMFOGHId6hJI7T+XkjThG+e
 tcMZHze4wZnnU6Riv1MyL52BuGjnU1d5D0oSkNcnW6AKbsxGLgbmSbOTysoAe6xzXqeCi
 NA47vVdUcwBBwcW9SXehYLa3NNlfBi1Op0z0Voh6i4pWSNTyUsGKAXNg8b/ac9SwgSZQ5
 zgCdrO1PCOeczOJKibKgdc1BJiah/yLQB4Utv4IE1DNE1LzdweITeCKASLeojTZDojA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791924745;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=MeyqmNNLzKHPd0TuFYGRw+s8CrJb2vU1dgjowYljZSE=;
 b=GOp5jz3xMNlVK3El3BoWO1o7YPZAMyhJ8ZUzhNiUWe2yle03VZ4yobE4OvYbKFk6e51q
 tEr996dkJHOHyqYHDjv5Ok23+k+edW/shi7gXE0makKEUbMlGvmDNIM8IURcxaIU/h1q+
 f33D1V/flsBZ5Rg9x+ig8cODg768M7u+em1r3i0yTcVYGSLlJPi6VCrfcErtfDChsb+Yb
 IooJ2FgO9iAwAkZqx/wgpx7YGJ1G2YBUQke/mqwQwzrpcVEWBii5iRJui4KiipxGArBSh
 CRWf/xdMqKdQeAuqdtqcLN7FJw3UY2LKYQC9QcvINYX8eO2zDfeazykT6ETq5jxHKgw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7481940619
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A08E793577; Tue, 13 Oct 2026 20:51:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:42:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 82e3d29d352b8ddce0d55a8f41be5a16b0a47b30
X-Git-Newrev: 9b15f3804dcad33e9b1ed1e4f72c1708d2def38e
X-Patchwork-Hint: ignore
Message-Id: <20261013205105.A08E793577@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cchardet: bump to version
 2.4.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9b15f3804dcad33e9b1ed1e4f72c1708d2def38e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cchardet/python-cchardet.hash | 4 ++--
 package/python-cchardet/python-cchardet.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cchardet/python-cchardet.hash b/package/python-cchardet/python-cchardet.hash
index f2e72a0bb4..63ab2a276e 100644
--- a/package/python-cchardet/python-cchardet.hash
+++ b/package/python-cchardet/python-cchardet.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cchardet/json
-md5  e8a5838c4d705346489d4335fda539b2  cchardet-2.3.0.tar.gz
-sha256  e08fade06af9aa4888ad99609a66bbce99ad01c1269c0ea673af75a15a6f762e  cchardet-2.3.0.tar.gz
+md5  112deebf0ead57d5627038c06b289aee  cchardet-2.4.0.tar.gz
+sha256  7b062e7e92e5ab1a00aaf5c164d5f056daae648ba1f144082baf5b4c229b794e  cchardet-2.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  107a29ccdd2d778aa2df5462f85dddfa099059abd22e064e07ec2cc9bafc37cd  COPYING
diff --git a/package/python-cchardet/python-cchardet.mk b/package/python-cchardet/python-cchardet.mk
index cadd892256..e9102af82c 100644
--- a/package/python-cchardet/python-cchardet.mk
+++ b/package/python-cchardet/python-cchardet.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CCHARDET_VERSION = 2.3.0
+PYTHON_CCHARDET_VERSION = 2.4.0
 PYTHON_CCHARDET_SOURCE = cchardet-$(PYTHON_CCHARDET_VERSION).tar.gz
-PYTHON_CCHARDET_SITE = https://files.pythonhosted.org/packages/86/80/6b87429533a8a6fc5b970c44a3a844c315c3313377ecc4fb9efeb56a3241
+PYTHON_CCHARDET_SITE = https://files.pythonhosted.org/packages/ae/f2/4db3f22a942ab99fbf4860bfc8594ac753ff0601e84d82b20f670e55280e
 PYTHON_CCHARDET_SETUP_TYPE = setuptools
 PYTHON_CCHARDET_LICENSE = MPL-1.1
 PYTHON_CCHARDET_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
