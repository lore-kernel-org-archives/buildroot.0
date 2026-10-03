Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29FC2CA5FED
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFD8F8162F;
	Sat,  3 Oct 2026 13:57:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uaBv4QVFMvIv; Sat,  3 Oct 2026 13:57:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3C31C816D4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035864;
	b=LaqM1wKwhckcPtyOxJmRvzsOYrr+XilOPWyiJ2alIJWuBmAZNvuWVvTlQuf8MEICeNfM
	 Y5qw9pD5tToI6kAQC8c2x7lo1O61xZ1xgoymkRjBA2MYUB1yrzHeh5LIz2MqI2gP8SEJM
	 KBIbCdz190CJziB75z+A8fD8xeosDUjQ51q9eMj19tVranNgmJlsTC+bCdiZho9u5bMFF
	 5apIb7MRuR5cXEU/jUyNbCSjlsH+RwgfLz8mKp2/CfFR3O12BuVlA9BhCDpKvrFpUJVHV
	 5lPiNw9EjOlz/GtXFL7W526s8L44W6dzwNE8lmZmqjZdectXnzy+Xc8YeaPQg7oIVvg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035864;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PqYYNbQsaQbVZ+n4gNJhjSCIEKrtx4mvGBKHRoOxi28=;
	b=HGWjATWIJqXgUwQteqQ0HA+iL0oZWIp+SN3bycf6ZV0xFHx2XokUgndwgFcgfm0tbAc1
	 61U1Pp7Aob2O5BdTiBOK9/4TlUKM0NbaNIfLu4s9Yb8akq1wkzistTxij9gnQW8ULXSiz
	 ugA1B9XDqZZLlqeSN6H3XYY2aGkRJiHnhRjF182SS+FMtOyeIqn0Xvx0ctGvoaCIbOtle
	 qgAArhXW0tZ4RyWBSj9zlrU+TSzN+kRUFDrPRVq0xIl3gRujWJomCeSKBmmm6t5KKSv0M
	 ltbHYLvgHnpKD+yxxF0/RQfkVAFmASCN3j5k0M0GmIQsy2D+105LS0kSoQLMWmK2kkA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035864;
	bh=PqYYNbQsaQbVZ+n4gNJhjSCIEKrtx4mvGBKHRoOxi28=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YzPLOctVniv7bcA/ZQSClnRT70RwmcrqyDAh2sbvXK3pmb+wPCHYyVCPk8v+WT1F0
	 X5q2CmiuDztVrVI/3wbWbl+a/ZaghyufTa6pVxStyy7dqdYAKZg89hVnoQaMRZByIS
	 vzlEDdXworTseWYoJYRDtyX56GRuajsqnP4F0N9Xu0agZTZ7EPdpBe36X6BeTWCRkI
	 ZfnU6omS1ksvQ+eulj1ZoTeyJKl8Q5uKcy5nbuvWpRbYqZqqwNFDwvkd35GLdyq7of
	 KHnY5BJiXHtOXgHaEzV3VN6UXcvAC75xfpmDryzepOMjcwzOb5/YSy6lZDLkbF3CTX
	 ECM31gg35PHVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C31C816D4;
	Sat,  3 Oct 2026 13:57:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 23106179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2BE6414ED
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bg8Wi4FFhcti for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9CF8A414E3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035816;
 b=ZnvkC4NO/gBdSboDWL1UkInkFAgC6SlcdgIxWIzGV/SnyxbI+066Upxy5QyLLiz2IA+q
 5bstEqV6PQLrgY2ls/3RGBCxOlf2w3XIUiYii8JdGuiY0z9acZ/EfRzjn9TaVvWoKMjZa
 duzdtDxvQhwBbxXo7WE0PFMXhd9JfJQdR34KAssk2zES+ByxwEzQKAGJjzrPETUG13wrN
 JAZyvxgijCbh5icjMYda9FVo0XlYJsdMAtD6e4Bd23tkkdvFWoNueDHASaBwdEHaNoQ4e
 vOMTQKj2Dx4BPZae+v+45dLf+UjSS9yChoRv6LePTlbS0T/s6a/ukebRHh5DgiV7qIw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035816;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=7RXjTz7OE9EjRZZJvAgadzTbZN759ii8rdvm4KoYQDg=;
 b=prjodNBouy+cX84bWzyTfHHrsTe43oCNcPPZGmyscGAiTudGRtPVw2+E+I6SCHOD+cMm
 VfeJkt/00kOsErHQdptTWbfKw1lDMnJEkq2G/POExoDGgm+JKm2JOtRD+It4xx9TzpIjX
 hgvJYD1IOQxmxWqHidoZl8Piw/oRCfsHhecAYHNXyvVkX4rVD9h5nTUQL51RHv3pzvvC7
 qWr3MtGrDPqOUDYIM4OP3PFGpZLju2c1JkLGepMmDcP5dz5mOprM+9vR6zj3ATsbIYkEu
 rK8XMEwlc8DJXphEkOR/BrLam0Zm/znMrAMga8IuV1699/NU13V+Ml+m3UtYXrcTSvw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CF8A414E3
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E767488731; Sat,  3 Oct 2026 13:55:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:43:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd61c7f16fca3ffa7b811ad697ed9840dbeb84fe
X-Git-Newrev: b5ea4614a2b110d50eb8bf2f28bbc73b31c3827d
X-Patchwork-Hint: ignore
Message-Id: <20261003135541.E767488731@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiohttp: bump to version
 3.14.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b5ea4614a2b110d50eb8bf2f28bbc73b31c3827d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update license hash due to the inclusion of the full Apache-2.0 license
text:
https://github.com/aio-libs/aiohttp/commit/cbf255319921ba84a115d123f7304f9f813e1139

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-aiohttp/python-aiohttp.hash | 6 +++---
 package/python-aiohttp/python-aiohttp.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aiohttp/python-aiohttp.hash b/package/python-aiohttp/python-aiohttp.hash
index 1db5c71b1a..13f6e2be21 100644
--- a/package/python-aiohttp/python-aiohttp.hash
+++ b/package/python-aiohttp/python-aiohttp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp/json
-md5  eb22a738fd03b7b009286e048a015780  aiohttp-3.13.5.tar.gz
-sha256  9d98cc980ecc96be6eb4c1994ce35d28d8b1f5e5208a23b421187d1209dbb7d1  aiohttp-3.13.5.tar.gz
+md5  1befc420af8c5cc860a80a629d66cb00  aiohttp-3.14.3.tar.gz
+sha256  9491196535a88924a60afd5b5f434b5b203b6cc616250878dbdb223a8f7844bc  aiohttp-3.14.3.tar.gz
 # Locally computed sha256 checksums
-sha256  9f80d0db7d755a941db4572172c270ecbd8f082ba215ddd095985942ed94a9eb  LICENSE.txt
+sha256  2e4be5fc6c4c72a466fcb665d726e049a6891981fe536c4f04b6366749461d23  LICENSE.txt
diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index 504393c711..7f48f5a19c 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_VERSION = 3.13.5
+PYTHON_AIOHTTP_VERSION = 3.14.3
 PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
-PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/77/9a/152096d4808df8e4268befa55fba462f440f14beab85e8ad9bf990516918
+PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/58/d9/22ce5786ac0c1653ae8b6c23bded02c1686d11f0dbb45b31ce128e0df985
 PYTHON_AIOHTTP_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
