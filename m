Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E485CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2411441253;
	Sat,  3 Oct 2026 10:08:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UMkOoJtQGWQA; Sat,  3 Oct 2026 10:08:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9541941231
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022089;
	b=MfE/6JvwEGZvtU/DQgv69Ic0nhZdJXdZkpybLeY0/kucN52x54R09MaYNJBz9fS2YT/k
	 oGdx/TXDfSsmvZgSAQ8ODXglciHldAlAXg8VAF0vNY4GQClfkTZxhoxEXFjNz5RHK8kE3
	 EeSTDolLa+2C9NxZMNDGP9XQfK3F2TC9Z1uDbysgm6tO+SkOA+J/yHNOcoDy6MI1fLB+B
	 ds8n2G/ENmVEUSWhlXzbdpp5BUzzMiK/qcv0oJh3JZtMpAVaS+xavQ4PzS0sAYWI+apjN
	 3HKpLjWPfcE/2FtaUDnzJGAoMCuKyhDdQ4+hdLwFzp1u3rsIGWHswHDT5UbDhrxTH0A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022089;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fsf1t6tSMESEBpGBdLs0BbV9f10Kx0H9KKgZRBGMDqo=;
	b=dOc/qhusaace2Uva3oLl9W8ZjgjujD8Kv2Lz+p+Nj6F541fsSRvaBr0Q2fJgxlai6I7c
	 XC1ctrxQNKE7sUe34qKuka3rVrck/KVioYqjWtUvuqAwEOKSErocwNflEROqCJx7nm9dy
	 G2L17g4NNwCZondEZJqB5z8c9brqQOeI1HEqS0KWAccsSrBfpb+/e8n0UlIJfp4Ki6UFm
	 usOyimd4s+kqGdaU3hJBkdZ+GvFAWK7q9Zd/OScVnOhwGVYt13SXy36K1b897j5ReFro2
	 wTv/reWNL1eJ2EFFyKZQ7qUrkjlJ4My81JIUjw4lNifd0tJXYuFLYGKXiIguA2XPI0A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022089;
	bh=fsf1t6tSMESEBpGBdLs0BbV9f10Kx0H9KKgZRBGMDqo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HCntfTpD20Mo45AdApq9JCDG4qUcb3mJt2/h2B3OZOhZVDg115lVSKbPg1llbmYPy
	 iojknFTJIfxonF0PO3Nxv5LBvIL6Xagp7NMRMbWV5DnvQcaqxaHpDPCPMDl/uUDHAH
	 1pNaNT66fzWQfmWVV/K5dzI3e7OURd394ubDbEmF9w4aACzxfeT0tCL4JGjTcchxec
	 Ih/DJi4r5S552GMOH04wEWPOLg+TZSibxaInVqtu16tbHxHkllJgquiz63o0iBFPQ/
	 GJ7GWrt9sd9HpN4QYOjgMybituOKJkgbbfjg0wSG8IiA6bSENMsucji7rketaxg7+v
	 UNYyapObWzsTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9541941231;
	Sat,  3 Oct 2026 10:08:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E63F476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 414F160E82
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WHrxvgQXXW_l for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:07:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CE5E060E97
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022029;
 b=E4O4dcCX0ff3I9lYWFq1p9oo0tYsY/i2/xDBYkF8d1bIIJP0rSRdB/d2xV8CsXd5S6eW
 rcQ2RCGh8gcKVcEE7e2mmgFO5+ILjxcL5Sj2KbHNDKs+QVQSn7tD6Em+sWF8vXcVLfsTo
 yrRyYNrDvZtoACPGMdcuM+0l5VGnrrpYjK2IQ+YRCdwVPfPVubqLo+FH2dhEXQ59hcDpE
 GNCU4a/dn52gdKIsv3mD+mcZRDegjHlW/ZQf5xxPwnDiF1bVAZSbLFDUCkETj7/xgH+2x
 N1JUFNqhKhCVH69RBV3yilsb5aj0clC8KOwTggkP+9tiriIwInJIn4x3kwNM+nq1pHA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022029;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=niYUaletEPM1hwzAPGW5FgOkejM5OoQC11/6/c3igJI=;
 b=DxMozFstJN/W1Ry2nBanXqB5r5BC9jr2JozpXHPYbsb9AHapsVfQ/ESYu/n+0umcbM+v
 kF0Z4wjAxFtEVE9NuM1FrucQVJTOZEDn69Sz6ks1QtGVGw1ReIEI5E2ipihN3+02skzZw
 1LT2tyuhdgxsh0wY7gT5zKOSxqOy2VCrlQ9tpYF7c3P6KjsJ2a5purXN2yvVUqzFE9a1w
 ddrG1u3KE8R8JtucQvatCAaPOcK6eNUkpTShH93d1sflvTQbHxC1sBYULttf9SCkDL5tH
 /LsSiJ9Lj6uf1UNc7tuRyPvDXFGpJgD/xYk4VrrpYJoZHU51led4tE7eL97LE88pWzA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE5E060E97
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 393178875A; Sat,  3 Oct 2026 10:05:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:06:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d3af06441fcc4b3c3f42704ea8812ada02c74119
X-Git-Newrev: e077275a119a666014277226f25af1613d7a9559
X-Patchwork-Hint: ignore
Message-Id: <20261003100555.393178875A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-wrapt: bump to version 2.5.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e077275a119a666014277226f25af1613d7a9559
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update license hash due to copyright year update:
https://github.com/GrahamDumpleton/wrapt/commit/9740b74522161056058696dd3b9981886eda3be0

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-wrapt/python-wrapt.hash | 6 +++---
 package/python-wrapt/python-wrapt.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-wrapt/python-wrapt.hash b/package/python-wrapt/python-wrapt.hash
index 3fc809d9c0..f384c7a016 100644
--- a/package/python-wrapt/python-wrapt.hash
+++ b/package/python-wrapt/python-wrapt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wrapt/json
-md5  43c737f84345bc317bbb028d9de1b4e4  wrapt-2.0.1.tar.gz
-sha256  9c9c635e78497cacb81e84f8b11b23e0aacac7a136e73b8e5b2109a1d9fc468f  wrapt-2.0.1.tar.gz
+md5  62a3f2bb129e77c859aaacff584c53a6  wrapt-2.5.0.tar.gz
+sha256  c48cdb6c904dca76d9915a579e4a5fab6b0c25f650c1019ce78a78effaf7a345  wrapt-2.5.0.tar.gz
 # Locally computed sha256 checksums
-sha256  9abc41aa6b8690c07ede9b44b7c6233d014290ed1e3b5ccc37e292295b5d058f  LICENSE
+sha256  d4f66854a24dda2f2a5282912aedebe6b18186b86284510a433d78fadcd88e5d  LICENSE
diff --git a/package/python-wrapt/python-wrapt.mk b/package/python-wrapt/python-wrapt.mk
index 86454371b2..7c3f4152a1 100644
--- a/package/python-wrapt/python-wrapt.mk
+++ b/package/python-wrapt/python-wrapt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WRAPT_VERSION = 2.0.1
+PYTHON_WRAPT_VERSION = 2.5.0
 PYTHON_WRAPT_SOURCE = wrapt-$(PYTHON_WRAPT_VERSION).tar.gz
-PYTHON_WRAPT_SITE = https://files.pythonhosted.org/packages/49/2a/6de8a50cb435b7f42c46126cf1a54b2aab81784e74c8595c8e025e8f36d3
+PYTHON_WRAPT_SITE = https://files.pythonhosted.org/packages/3e/d2/a254a26d8ceaea87e0eee2e89fcfe53ddc1858418647493bb2937549ab6f
 PYTHON_WRAPT_SETUP_TYPE = setuptools
 PYTHON_WRAPT_LICENSE = BSD-2-Clause
 PYTHON_WRAPT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
