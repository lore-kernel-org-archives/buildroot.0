Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F839CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D75AC60EC2;
	Sat,  3 Oct 2026 10:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P8ExOYwDvwc5; Sat,  3 Oct 2026 10:07:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org DA2A460E8D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022078;
	b=W4j7izLH5uJ1BED3jR6iQLxzIdwqONF9YytLht3XQx4Ewg+4vsIGKUhWZ51s+4CXzajV
	 eYKS6b9+vudebbZOlNy98AeSlgq6R1GKDqbh2Jq2XxEUI9UkfxyjWKvdK5konjfCzfv/1
	 XVfk/zUewZjAKWdb2IcihVA+te+mXhzL/tdvJMe+JgAyUV+IZcz3fMzRvHptlbIO+uHUa
	 h+4WDy9mzv9YLiQLxmmWmjTkRNnmRmIWaPk3rx9/WQXyDP94tyG6X+ZuOZN7QGabLXqx5
	 2Im1Hxtu+2VMn3CuYT4/onPXAaGw0Th2W6TB4FqfOHYjJ/m0r2di58YraQFOftCaVQQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022078;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=22pCEZBF2WICP4ofR7N6JW8HFzKMHIZMNrjzhS8VWGg=;
	b=ZmeJuoZvY4+roP1HPHhktSY9XwBkZ339jSJ5JCSZH7bfnbmw/B0C6l4yQUH4ldfjBZVQ
	 r/FPR8aI20IxJyw1CBITYopYQQ1jiM9wai8gfze/RMWmQXWMZiESAz1ql6NVqhfRGgI5B
	 NodLiF4PkmsR9ImTwi7FkZvV8umbwiXKGR3YBub1y14YdH5w3pOcjXKSzHZEodjSnVYkT
	 dH/Wr3CztTTV3iG6tvBDVhltdxQxjcNtjMnjMM7rRJONLkV3Y6UJO9B4nlNRTL1pm+Izx
	 9jJB1Og3czLrZ4Cos9atYxcXRPyc8GHEM/IRDDw3IJn+Oh7PJY6EtFmwHNw6U0Vrpzw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022077;
	bh=22pCEZBF2WICP4ofR7N6JW8HFzKMHIZMNrjzhS8VWGg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=az1GOtSA5shaN+sUvH+nCDbr7PCx0p+HXjV30Twh5M2TljWsbcyodbBeJkkoTichj
	 tzQzWBuq9v/WphZZTMy2tOq7u81PdRgXRakIDrcOC4BybQsmO93jERWmPCNI0d6QVI
	 3jJSWC+Li4XBhv3Jasyrnd2vcrcZAvflQbonK3KDGtD5Y0cYk0YRpsfMu662AOJp9B
	 wHveaA4yv9eZJjeSMGr/HS2dGr9H+NiSOrFI5bUaxAs4r4I98u5FNSgcyitgY1IBAr
	 gDnkQGBRSzBuJnpUxZJEEB3rMBJTp08vObYn6jY2tlOxrlnaDZ8y7EaX7HMP/EKBBM
	 8e3CDaLyKRpzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA2A460E8D;
	Sat,  3 Oct 2026 10:07:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BEA0476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1F4B60E84
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tYUtYz4j8LO9 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:07:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8DF3B60E93
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022029;
 b=LVweV9lw1o91QUnaU/8ElV5jxTSQfuoJzrVATiowU2R9LAMGBLORwM6gvuSdsVadk/nY
 FNrg0We52A1kLQoYUCJjkom9szRJjYuz6vCIh/3/qfkPr6Be1+dMFwqoypXqRVvvD4r7v
 LFcl4e9dG5nGjyJlUrV/k9R2osKn7mIi7mBhYAWTXpoEzY5rxaVCNUIl+ycB/0qTiNxI8
 lKpQTAUzU5aVf07vwFrDGPU5BSCRGypgUSsJFaWBa5NZ5xILTt7JInIYaAiuq6ScW193d
 Ck5jppCDnr5/1TKXxSOSOWyxgjqsHnBkugdhnZFNZRgnIjDw5gNOg3mPCKoiYoYaXAg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022029;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ogafBxurz+bTEQiYcoixq4yopH+rYmfHje8Fna0fZA4=;
 b=qTUyWdeg3JUOHg+5ImxEwxKhJ5pq/y6BZuFTjyGRNlXcLk23LfOe2L2AmFqDGFH4YnY0
 GGUfG8dr/mNMzU4NJQ72Y0MUmYkY45MmRyQSvOa9+mllEyvxmn9I0hZF1p3SWA8yqGlAW
 o9heD71WceB91KSMZQbA27E+KXQLjoPfeGN+DrWfOMBX/B99838PrW08nQ24zSjbTgAIF
 13/GE7vGiwClM5kcH4vLgw+j2L/ynl4LePvuQ+ymwUkYP5+QxVauctOULezKGQoY0XPGc
 XST44lZa0b24eHIQhUxzgWpX123aa4tWT9VDJcipqO+MHYhNFI2C2RrTJR6Dy9+2Prw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DF3B60E93
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ECFDF8875A; Sat,  3 Oct 2026 10:05:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:06:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b6fcedf51699b064ce4c01d29cdc173df41ecedd
X-Git-Newrev: 9d4a361263ce4fcc06392f30fdb6679ce4b95328
X-Patchwork-Hint: ignore
Message-Id: <20261003100554.ECFDF8875A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tornado: bump to version
 6.5.10
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9d4a361263ce4fcc06392f30fdb6679ce4b95328
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-tornado/python-tornado.hash | 4 ++--
 package/python-tornado/python-tornado.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tornado/python-tornado.hash b/package/python-tornado/python-tornado.hash
index 1eebd20284..01806b164b 100644
--- a/package/python-tornado/python-tornado.hash
+++ b/package/python-tornado/python-tornado.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tornado/json
-md5  765aacc9cb8931aa66c8f3a83050120c  tornado-6.5.5.tar.gz
-sha256  192b8f3ea91bd7f1f50c06955416ed76c6b72f96779b962f07f911b91e8d30e9  tornado-6.5.5.tar.gz
+md5  cb425742bae00f50c5c1ba81c74ba95e  tornado-6.5.10.tar.gz
+sha256  a6b1ccd08c04b4a06fb5aeb381be99de5ad1e5375c1785e31d78c880feb57687  tornado-6.5.10.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-tornado/python-tornado.mk b/package/python-tornado/python-tornado.mk
index 7b1759bbb6..35fc9ce131 100644
--- a/package/python-tornado/python-tornado.mk
+++ b/package/python-tornado/python-tornado.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TORNADO_VERSION = 6.5.5
+PYTHON_TORNADO_VERSION = 6.5.10
 PYTHON_TORNADO_SOURCE = tornado-$(PYTHON_TORNADO_VERSION).tar.gz
-PYTHON_TORNADO_SITE = https://files.pythonhosted.org/packages/f8/f1/3173dfa4a18db4a9b03e5d55325559dab51ee653763bb8745a75af491286
+PYTHON_TORNADO_SITE = https://files.pythonhosted.org/packages/06/61/53d562a57b28c08eda40b258c0f975e360541943ad7c7bef897a40caafda
 PYTHON_TORNADO_LICENSE = Apache-2.0
 PYTHON_TORNADO_LICENSE_FILES = LICENSE
 PYTHON_TORNADO_CPE_ID_VENDOR = tornadoweb
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
