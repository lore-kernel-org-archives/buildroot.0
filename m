Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C93A8CA5FED
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99601817AE;
	Sat,  3 Oct 2026 15:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gl-6gjuXwXpk; Sat,  3 Oct 2026 15:56:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A50B58179D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791043007;
	b=Y6HDJ/ksb34DMwfpH9JSq9SHgOAIZc0fn4o8iksKT2Dg1OpsV6utOc2rLOxTp5dIxBcD
	 KARw3cWeKWdzWSnqwm7uUGBhH0ToQY6bVOSIp7KHPe5Nw/EGwODkab3kFSJHnMw1b1X9j
	 TdTG+ifXb3VPhJKtSgd8QmHe2+cl/0r2CudZHVmuCi/AlKHideE9zY7bL0n0JJ1nXFUms
	 g/dBITwyQqFhM/MsMqdwZ42dUWVicNQEPqzOOCIZ8ek0B1XrkI4HWIqt8sG8GSaW5GIh4
	 U3765iMS3HtFLI11nDOjYsJ74K6rWYS5bZnmmi0j6XcGp0l+dBEtVzlrRm7ACdiKNNA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791043007;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=JUTmStgVw5HW29cvBjJ3BqS09DSOIKwWwOp2uCmRdrE=;
	b=kJfRJx7pQB7w7xtKj2omN54NtXS7a2FQOuABO5oefvx3Z787mSmHjQC8KZ3liGkL/qEj
	 tSQw1bscZKw9sEtvURKTx1hUW8cB/CVl7Wv1HaJhEALyEUsBabeVPIOiZ9+iJcD0H8zVX
	 fapMWjmEM1IN6v+Wmq7spAS1hLWlRSzWNGt9pjdQcebN7WDuyR86NvdCVAKDUxi0a0zqv
	 DgkDKFr825dyip4Hcy3KHCf6VTLqcFMhRgMS5Zv0prsmHJQlXDaHxjAUtkpOAisbslxgF
	 KU5BQIv3xXgRk+QTI9Sl25YkwcoFAyNU+D7B5kFuU24PIMjEPQCyB/a5Fbb+cBcObUg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791043007;
	bh=JUTmStgVw5HW29cvBjJ3BqS09DSOIKwWwOp2uCmRdrE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lpDGe1F8kwitWG9uNxO3Vx13ZPoq4i0zM74KRjsGM0loHW+231g16FuAraxGtmXK4
	 xxy9a6pM4tMGpOtKl/3HpIFH8URPZ79trg/bTX0wGDNvHW+qotqPPfIIdHVVz7i0s3
	 vQKvBvrcnTNwy4SJHEBuTuK/dOVMWo8USi4B/otJ90bjBuPbEXmX1le0jICaVZe94R
	 xRbdlMm/ByTBdRDVDPnmhMLz5zKhaEk0uGZo8Y7BfsribXuPAXQ7BruzIDJZJNrykD
	 tus+lQ3xsCwEDz3ifM2ttzvbsC60wsvoCifZ9rVg4uSaTJZHd2NJiObQSbwD0tY79l
	 xfeeORYrmyigQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A50B58179D;
	Sat,  3 Oct 2026 15:56:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 62397335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1D606068A
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9keqh0OLMqOO for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5EADB606B9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042847;
 b=QAfXcw6TpEttg6eeQML45p6P5Zkm/iH1KgH0lsG8M1xMIoQaWHIkWk7Cuzv0olVjk8z3
 2A0fEwMP6pt/ebsYvD1npqokWKeYaYHMhbu3OCTSmuZeznDPzt5Y9QjRHRVbW/59zESN8
 pmZ4VaQTjb77YuZF+aPccHxB++1rS9O/qIxQp2b0VzzBGD3E8g50vU6ELw7gsSLWUTLsX
 5YTbmyHBOggUEe64VaYENipMdESK+U9poFjnDwoT0cMxtrj5QYTc0GHASMzHChBDz8v+X
 KtBAVbVRF2g0kfOWVcIJLFUgtBi48yP5SO0sESUMG6dCxgxheASImZSHoNRcIU4BmvQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042847;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=6UYnqgf0RNUFAfR4atAuzXhAFGI5ZhjFjMtL9M4UhZk=;
 b=oGPhDqeV5YsQOr6usQK6Mx9K47EyGSVQrpLzml8YeeNKYAjkR7qe7qDIktonlaXiXkTQ
 TSmRunfwI6y+lsQHIC8eY9nScfkQz70sRnAEUvmXs24FfsU0jfeixiVnFEZc5JerXaEIj
 DtRf/kjpsIkwABMQ7ZNphg1JmhYDiSXBwWac5WfEdscOXvNik+bbehKmp4Vr9Fp+Lg59l
 64PaI6Nv0yInSmyWJRpuX5UvKo+meZTFQROoV8rh0PhVu4JYIr1+HgTs2QtcfuXsJnLku
 4DGtIUpxXxus3AEwj+fHmk9lBbrcI32fSL8IgQ2drSwwRMaFpY9rermwTHnLwWK7UIw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EADB606B9
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A0D768A39C; Sat,  3 Oct 2026 15:52:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cca0b08180130053c725249cb760381f71d01f73
X-Git-Newrev: 625f024d6ed9d182c03c6d94eb5b281a3afbb20b
X-Patchwork-Hint: ignore
Message-Id: <20261003155252.A0D768A39C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-flask-caching: bump version
 to 2.5.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/625f024d6ed9d182c03c6d94eb5b281a3afbb20b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Daniel Crowe <daniel.crowe@maxmine.com.au>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-flask-caching/python-flask-caching.hash | 4 ++--
 package/python-flask-caching/python-flask-caching.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flask-caching/python-flask-caching.hash b/package/python-flask-caching/python-flask-caching.hash
index cc799fa47c..a7eb08724c 100644
--- a/package/python-flask-caching/python-flask-caching.hash
+++ b/package/python-flask-caching/python-flask-caching.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/flask-caching/json
-md5  5e628f2a989e60fa99b154515d1e2499  flask_caching-2.4.0.tar.gz
-sha256  a7f14e43617cd0612a57bec2f80516d6d2ec888bfc50a807b1e4e41ca345a3b5  flask_caching-2.4.0.tar.gz
+md5  012ea61f220cc033a70d286dfdaaf33f  flask_caching-2.5.1.tar.gz
+sha256  f75b451fde3faac0e278da72263818134deca8c4ba6bb07b9b3b238991368dae  flask_caching-2.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  1f3c445faa26eb32d90291228510e2d8594bd1fe15463f5d70c87d44f38872fd  LICENSE
 sha256  7729328f7b1ce664dbf630f077581cdfe97379b58b49e9a4f20c63912a5e5c09  docs/license.rst
diff --git a/package/python-flask-caching/python-flask-caching.mk b/package/python-flask-caching/python-flask-caching.mk
index 0b32c87055..7e7563f391 100644
--- a/package/python-flask-caching/python-flask-caching.mk
+++ b/package/python-flask-caching/python-flask-caching.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_CACHING_VERSION = 2.4.0
+PYTHON_FLASK_CACHING_VERSION = 2.5.1
 PYTHON_FLASK_CACHING_SOURCE = flask_caching-$(PYTHON_FLASK_CACHING_VERSION).tar.gz
-PYTHON_FLASK_CACHING_SITE = https://files.pythonhosted.org/packages/42/53/5c46b6a80adc13ed9179879a93cfc2c1f190c64c48ba732b4f5819df520e
+PYTHON_FLASK_CACHING_SITE = https://files.pythonhosted.org/packages/a2/74/37c0cfc97444bc639a2854808c55ef61266c3637ab0a64c794b9f6ea1649
 PYTHON_FLASK_CACHING_SETUP_TYPE = setuptools
 PYTHON_FLASK_CACHING_LICENSE = BSD-3-Clause
 PYTHON_FLASK_CACHING_LICENSE_FILES = LICENSE docs/license.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
