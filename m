Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD97CA5FED
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC0E660E7A;
	Sat,  3 Oct 2026 15:56:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hmGUlfy_lE6M; Sat,  3 Oct 2026 15:56:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E42A160697
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042978;
	b=SUCbwvfqauGHg596z+jcnavLoOAaeMvLICe26vOCHi9Vl1JzPLC7HoRXfdx8+ZMG6S9O
	 QkUfSmvbKkFJTF5q4BSVVwbOeRRoyAk5HM77JJB8FmKkRLNb17a1GoJUOIjzuyeM5mdOb
	 BVgwi3JFQxq0QoBZL8RvCxQCqqEvAdtWnS/nr5gsieGt7eRVWl4fBjgHNMx91zD0grwxG
	 Db9BB0Xl6ex7hJc3izQ/KOd+eOx00yWuSnTJ6E7LVctH4J2yK9tKBQHak5yRsO72Lr540
	 NaNP1XmgythsKMF2zVpFQWU4FWrbpH9ZhES7FqkB1lrynR/3bcvcJze2Gmfd2FnXLmw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042978;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=KF4kVzQ8HdtEaPbW552cIuC1ZOtf51cAlQ//EUO3KHs=;
	b=UV43QhIgmQb2NiKyiLDIgWcJFMZcWVMxF8x5K1eBBQ8DEKc6vvRBQyN6B9Qkifbg4T1k
	 zRT/Ykvl+vx/dx7kxcin3eikHa7LvxhjNIM53UFBaaSSm1BjaGjUt0HEp2biCbgj+gVqz
	 6Cz/cSFOiOyWBc3j94+xkyytBaYXYuG5JlDviFcPv6p6+Kvl9XXYkDiM0IniqheoWvPSu
	 05+MkIkS4UjgtipZ26UO+Sp43hHF32yD168rmAhOmC7UAd0NH56HDiAexL76aInF9FYFt
	 IxkMe5hESL6syPp651/9VVglttySrEI5BuNLGo5FF238+KJvLz8TAJYxGdrHfAQaXzw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042978;
	bh=KF4kVzQ8HdtEaPbW552cIuC1ZOtf51cAlQ//EUO3KHs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fpAyl6cSVRGDVzjtDMj/0v3oggWeKPJRDlqAqMrod02OoiJELZVliycirZ21SG+j0
	 Fgl8SeJviD7KjAJl4F716RRHUWLk8Ac14ZBFtx7VCLy5Tgg2QEuZKwryzNGVsqdqHG
	 hiFmkDrJZfUFwv1xRET3wLL4Lgu5R7wYRgUB32zZf+thyTq8NY99d0YQaEOMi2HcS/
	 lnbs8j/fTdzxeNT4SQRAahMBZzvn8RaYy1Jyy87KJ+XkRBg2CXCBAigE3qiH6/bR9z
	 SxUbbEMbi6Hm6iaNqMzW3b5/wQ9k5wnDNZxf4l8ZLVIOd3kTNoPoqoUDrLwQCern8o
	 ro9pSK+wm6xqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E42A160697;
	Sat,  3 Oct 2026 15:56:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 806BB9DF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EDCB6067E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r0AZqtS6iRuI for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7D0C56068A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042846;
 b=dwHNCHABaModsdFlQW0kM82n0qqtX96DjkTi/2d2htin82nGIpHwoPVrkQbH5ACOwqNL
 dwuOC3V70mBBXRMKfliWe/ng3H2SgQruXm2YPNwCWi9ne0eiLM16nkHuZ2Vc1QKuzZGpX
 moQhj0IYCgORmBl2uEetBxZeQJD9NPtZGSnlCqwW4y3mknZcngA8azeutksE4lm1C5jSz
 PJ5COX3J/UZfxHryox6HeaZnB+048j+MbKU/wH1kDgk6OZnxdQHHtZW9kn80xsuDAIviQ
 fxVvYanD/NvsuMM5r8K+VWGhkvmOY69LjfrZ931Pd/wN2K+CKtXGvHgjeuBqwzk+TnA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042846;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=QvebZyqYhaWSP2+j/jbYMqJOxOLjsE73GAJeNk2rQTI=;
 b=jDgNKBFz9Ij5XlnCPM2WTUwyj/5kyjxnwn2Jg2DDrMutOS9PKWzWc4Z8GnMmguanAeM5
 orlnpN8+eeyqUlWl0KibT0NIV04in8U3daxadlIvAtSoUu9/um+mYJiPjV4UviUUbE2Lu
 hGHaFnjKX0tcbVC0QZqTpRkkikZiv5GQ9ypJaFUoRxeniFsu2kbRARDc9GAUZtq707IUG
 LQ2hGqpfGWZ2yksJUdwYAwaOPH3XjDA8BDZmswbR3AiSUjVPaGCcJSCZPrGwUOVmEmUzh
 /vz6rIfXl88yXFE5dz0RQ5BK1C/67vq21M+wwBBzYj1odQlBI3OAeCoYFcwD1sEqeAw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D0C56068A
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD2FC8A30A; Sat,  3 Oct 2026 15:52:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 00acc293f83f924f9d4be5e51bbc6f107f4d1809
X-Git-Newrev: ffc6cee1ee8171630e285e7cd35c7e3213e860dd
X-Patchwork-Hint: ignore
Message-Id: <20261003155251.BD2FC8A30A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-crc: bump version to 8.0.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ffc6cee1ee8171630e285e7cd35c7e3213e860dd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/Nicoretti/crc/releases/tag/8.0.0

Upstream switched from poetry to hatch:
https://github.com/Nicoretti/crc/commit/4be738e67b9842591a0d4ae46c10dd6344f7bf49

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Manuel Diener <manuel.diener@oss.othermo.de>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-crc/python-crc.hash | 4 ++--
 package/python-crc/python-crc.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-crc/python-crc.hash b/package/python-crc/python-crc.hash
index f54044af5b..d459305540 100644
--- a/package/python-crc/python-crc.hash
+++ b/package/python-crc/python-crc.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/crc/json
-md5  cca626fb7bc30b4c468216ca67ee21c2  crc-7.1.0.tar.gz
-sha256  99dd540909a37ae4f62c65441df8ecb4e7f9af014fecaf4f331052a41d66c07d  crc-7.1.0.tar.gz
+md5  fc406fc84867b2f2549eb6dc45be8a2b  crc-8.0.0.tar.gz
+sha256  e1ef893b042c26c9f47fd32f3c17507b7d1bd81169acebaef908774856fdaa3e  crc-8.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  803152006c87fdfd8b30b087734fd590e7a8d871df1a6de40a8fbdd27673907f  LICENSE.txt
diff --git a/package/python-crc/python-crc.mk b/package/python-crc/python-crc.mk
index afee463092..dcce1c58f6 100644
--- a/package/python-crc/python-crc.mk
+++ b/package/python-crc/python-crc.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_CRC_VERSION = 7.1.0
+PYTHON_CRC_VERSION = 8.0.0
 PYTHON_CRC_SOURCE = crc-$(PYTHON_CRC_VERSION).tar.gz
-PYTHON_CRC_SITE = https://files.pythonhosted.org/packages/7e/e6/c3488c35ecae290751466252e5ea01ef50fc67bfc1a9aba43983329b7025
-PYTHON_CRC_SETUP_TYPE = poetry
+PYTHON_CRC_SITE = https://files.pythonhosted.org/packages/48/b8/79b2c41836b5f8503342956ef31218059159a3f556c31e76ef5c14233d4b
+PYTHON_CRC_SETUP_TYPE = hatch
 PYTHON_CRC_LICENSE = BSD-2-Clause
 PYTHON_CRC_LICENSE_FILES = LICENSE.txt
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
