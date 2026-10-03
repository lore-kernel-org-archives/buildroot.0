Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84124CA5FED
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43B2860FE8;
	Sat,  3 Oct 2026 15:56:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NNN9aCgNJdta; Sat,  3 Oct 2026 15:56:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4175860E93
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042999;
	b=bS4PTXPQFygwDh9SRvN6YFXD0aZPnx6FBlTI73m9r5JK4GFEsMcBNzPlbT2lbfTtuEzy
	 Kxtr+w1nrhPJamThJ+6Y0+tOCnQrdOHuFmLjo8S2olhtw1oW4aqxzk8ewi8zRlgXSPxZH
	 Vd4YH8gBL4qRbda/tEpb1J1vV/EOGiCxX+Ig9nZDXn8reg9bUbupngTuFC7JY56NIuSkW
	 iwEiF0upXmwGqpBZd9wb0jhPSF0z5b14Lh3rDc1ir0GbcXq2JHNZz7Ct3p2wOhnTsyaBZ
	 cD5irSYb5HegfkNAxah2GI041vtOlER6mQVknbOEh/K5nTLTTfCL/e2tsewtOyMemjQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042999;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=adsQDuxea2WCg+UxcTU2Ocd4kpzamkFNKiEpFy9pC/o=;
	b=CeftxJJGza2NVL2iDeS4dJeGLIfoStroivC6QNVt3VCfFDol2PATj2DQXFl1ZyvC6syr
	 pr6oH5lCU0A0mIj2GKIuBPmPP6HRPXZFXaYmgtzTMEqwnk9eDNnpoCI5m1jf3PEA84D2s
	 xiqwOEdCPhGcj2yC/uIlw4qGA3XRzK9LwCA9aqQ2MtZzEqcC7yiI6YKpSQiQnfMq2mYO1
	 ZwcnfLK61crKpWFc0Jcacr2Q+cVZdnOsJF4rHQQH9S7FvMAAGKVJ29BM6bAlyK8XCFdcH
	 HtHeymj5c9Rjno0/Ip+xE55BPvpRmuHbIH/X1fbvk9bDVajdIAiFbf7cyxzbNNB6ZfQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042999;
	bh=adsQDuxea2WCg+UxcTU2Ocd4kpzamkFNKiEpFy9pC/o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KqF37yPJ5tFdcycyvQKSycJjIS1XyVfd4XJ6I1PimskdItNaw3RwSKydeSlekvBYb
	 VY7qnEAmGd2i/zNFeA/TSmQiCVmjSCEOr8PI4DZeLlE8jyCAhE8nPogy4hsWoMCDkN
	 18NBwJ9yeBhyBIeezGXTXBwzUIisC6xATUlXy1yp3WXo9+tTbuPHoMr7mXNjTb//Pq
	 fP1yqksBxnv1REjigHl0jAPAtUDF6XzTcBdj3QaQCNGeFY1fx2+YKdlng2KCkQhRXN
	 9HDJy6IHIhilbI3twGQ1r0+ujT7APcWo7jIqXHWv7EC8phJCHzfFobGBAqJr3y15qz
	 yYM2jFkjkRjnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4175860E93;
	Sat,  3 Oct 2026 15:56:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0607F4B7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D537460683
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IUtKh8Y-cnop for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 19EA460662
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042847;
 b=PYPunJQ9skXcPGMXSgV411AaebbOjXBLYICe0eYuceVE0cjWEZuNNngZAh0PdfWUZW5x
 OCEJRX2Rx4A4aNpxkmv9v/fKN470wlZSEsWHM+dhp3XdPqBHHKSlNRjJ14OGwWbH70N4V
 e7FY5C+fksfZzrSvCiANfKbpGyAzHfjSGoM9SFqzz7Bm5mcOV6XFH4doOoJ6AYVAHwEOv
 Z3KWOhJ/jNkGjsxoS4RSu1xJayVRxinBAue4ETJNeU+rIZ6kAmqUHspr7ASK/zFwmSD2K
 nALjwF+hGUiETa1e1YJ1w/0AyhilIT7j4r/XbE7KXEkKInVeN4hNy1ejmQk+B1j+rtw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042847;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Y8tUYBpNsOK64VVSlCq0q7eT0Bbhi7G0jwRs8+x5J9s=;
 b=eoRuOmPKeFrDyKT8r/ymj95ORxlhjkIR7FAwge3oRkbjMmz6V6IVNViKz3hsdh7k9dg0
 irgjKGC+hX2bpX0pmCG0IXvTY/n6TqyJvC6Wa+s8TKyQmkXPEGQDTOzmnw1s+lWm5j/uo
 Ju16NLIKiIOBlWIksy2qMbFOC7NMpjcwf+8dKMi1ktn47L1pIauyLuuOgDllQ6vgw6j0P
 Qc42AQgJUt0nFQm+pK5X+4R13b2mZ3ZMEeJCDJ+lJqML9D6mywhLKQwQboXMaGyeAPNOv
 XEn0LY70xLc9fxOVJ+C062eRDzfMfKpDnjCOSQzTGHKj0dwuDcNeGfz51XDb2mGJBjg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19EA460662
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5AA198908D; Sat,  3 Oct 2026 15:52:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e5ce8011ce9a204a4c221bf32ef09acde11faca
X-Git-Newrev: a2b3e91816d5ab6217281d1633409f0836833a62
X-Patchwork-Hint: ignore
Message-Id: <20261003155252.5AA198908D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-esptool: bump version to
 5.4.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a2b3e91816d5ab6217281d1633409f0836833a62
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Bartosz Bilas <b.bilas@grinn-global.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-esptool/python-esptool.hash | 4 ++--
 package/python-esptool/python-esptool.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-esptool/python-esptool.hash b/package/python-esptool/python-esptool.hash
index af517e0844..2bb439b34c 100644
--- a/package/python-esptool/python-esptool.hash
+++ b/package/python-esptool/python-esptool.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/esptool/json
-md5  fc9cea4910ecfb6fbbb2942e44c835bd  esptool-5.1.0.tar.gz
-sha256  2ea9bcd7eb263d380a4fe0170856a10e4c65e3f38c757ebdc73584c8dd8322da  esptool-5.1.0.tar.gz
+md5  bdf32c6c0919520e64d7375471846301  esptool-5.4.0.tar.gz
+sha256  fd756598db0a26c9975fa18511b08687c54bf2ce7322ede80cf1f5117dad1f50  esptool-5.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/python-esptool/python-esptool.mk b/package/python-esptool/python-esptool.mk
index eda9d024c6..09dfc7a148 100644
--- a/package/python-esptool/python-esptool.mk
+++ b/package/python-esptool/python-esptool.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ESPTOOL_VERSION = 5.1.0
+PYTHON_ESPTOOL_VERSION = 5.4.0
 PYTHON_ESPTOOL_SOURCE = esptool-$(PYTHON_ESPTOOL_VERSION).tar.gz
-PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/c2/03/d7d79a77dd787dbe6029809c5f81ad88912340a131c88075189f40df3aba
+PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/2c/43/1a2ae2dd8ae97bf1ec9991db097e52626d35b57d242f9687c9314eac5b57
 PYTHON_ESPTOOL_SETUP_TYPE = setuptools
 PYTHON_ESPTOOL_LICENSE = GPL-2.0+
 PYTHON_ESPTOOL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
