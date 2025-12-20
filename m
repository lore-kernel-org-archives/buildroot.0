Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02816E668BC
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 21:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8F9880972;
	Sat, 20 Dec 2025 21:43:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fvRefPtqThRp; Sat, 20 Dec 2025 21:43:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9D78818CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766267037;
	bh=aPyXeLUvqfZDFdHGrzabUEVQDUc3hSb85qJu3UAtQO8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=LIG+Bid/5N4XyhrYnZxsjowgWA8wNUdSFYA137/QK0MjJagYA6tsiNrzKGOv4N5XI
	 SVnMOusUBSVI1TN1sl5VAJEuo9xdNF1PFpnpBQUiTnmQZRxSWHHvfzbE7deo76sk+6
	 gYV8HgqyPnm0asU+RHj5Q5+NmBRv/emXyeFcUA2ZLgxFCJMucMHYmXo0gTr1eK0rO9
	 kkJEVBAMVeGHGJDZM43PiYoALbLm81N9+9qbTggoSj5rgUEr93JBKK9rkE/yffmey/
	 HMD75LElc4qhuQyo6eFe6pZB7hN7oTTyaTzh7FnQ9EF3ifbM9EFv8lqTsJ4SlHeOBr
	 rVSKbI66wcClA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9D78818CA;
	Sat, 20 Dec 2025 21:43:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D2A6E23D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4592818CA
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:43:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sOHheRmiYPRc for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 21:43:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B9BE080972
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9BE080972
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B9BE080972
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:43:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 077B8A4C4D56;
 Sat, 20 Dec 2025 22:42:10 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39116)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX4iF-000000002DO-07bH;
 Sat, 20 Dec 2025 21:42:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 22:41:52 +0100
Message-ID: <20251220214206.1089100-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251220214206.1089100-1-bernd@kuhls.net>
References: <20251220214206.1089100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766266930;
 bh=r1DwX2PdsOjCWimreGZpIo/wtwZgTycxo6I3457ocDs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=fhPS/tSKqbdhYaf1qJ4fP2timnt8GZ61vz8XnL8di2dJ5Z9/ZW5KZ0GQZlO97pVAI
 6VHtEZZWd7U7fC3rGcyiqKCcFCm5n6HQbKjyl+W6rgB9ocCt5rgRCQ1kIPlFobKOiR
 IFxl0hKfHv3EEUfd2gsMDGdfuDE+2ZAXd8tl+2D/X9+RdjlB+N8Z1qqMNew51MkxjJ
 LogmAhZ52ub3Oc0eRab1GDg0MYcStLCko/nrwJ2mKoGzh1jpgUVuWlMRL6RgwKl5jk
 JYrWwHLq/PQNBTArX5/rIsFgMMrXp0LudLoalTxBxBNC/VFQMV+YEI7U87JnLYjXJa
 PVWTOVCFqNyCg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=fhPS/tSK
Subject: [Buildroot] [PATCH 04/18] package/python-docutils: bump version to
 0.22.4
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>, Joris Offouga <offougajoris@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://docutils.sourceforge.io/HISTORY.html#release-0-22-4-2025-12-18

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-docutils/python-docutils.hash | 4 ++--
 package/python-docutils/python-docutils.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-docutils/python-docutils.hash b/package/python-docutils/python-docutils.hash
index b435135f15..7393c029a5 100644
--- a/package/python-docutils/python-docutils.hash
+++ b/package/python-docutils/python-docutils.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/docutils/json
-md5  98a6168e7f4719c9fd90184e88157656  docutils-0.22.3.tar.gz
-sha256  21486ae730e4ca9f622677b1412b879af1791efcfba517e4c6f60be543fc8cdd  docutils-0.22.3.tar.gz
+md5  58f718cd60a87725d4dac56ae427c9f8  docutils-0.22.4.tar.gz
+sha256  4db53b1fde9abecbb74d91230d32ab626d94f6badfc575d6db9194a49df29968  docutils-0.22.4.tar.gz
 # Locally computed sha256 checksums
 sha256  6ab4f27c76c74f96e5e692da5944a6f82968f3bddaac5660a4aa723e70eb5d8f  COPYING.rst
diff --git a/package/python-docutils/python-docutils.mk b/package/python-docutils/python-docutils.mk
index 20773fae91..bad9ce56af 100644
--- a/package/python-docutils/python-docutils.mk
+++ b/package/python-docutils/python-docutils.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DOCUTILS_VERSION = 0.22.3
+PYTHON_DOCUTILS_VERSION = 0.22.4
 PYTHON_DOCUTILS_SOURCE = docutils-$(PYTHON_DOCUTILS_VERSION).tar.gz
-PYTHON_DOCUTILS_SITE = https://files.pythonhosted.org/packages/d9/02/111134bfeb6e6c7ac4c74594e39a59f6c0195dc4846afbeac3cba60f1927
+PYTHON_DOCUTILS_SITE = https://files.pythonhosted.org/packages/ae/b6/03bb70946330e88ffec97aefd3ea75ba575cb2e762061e0e62a213befee8
 PYTHON_DOCUTILS_LICENSE = Public Domain, BSD-2-Clause, BSD-3-Clause, GPL-3.0+ (emacs mode)
 PYTHON_DOCUTILS_LICENSE_FILES = COPYING.rst
 PYTHON_DOCUTILS_SETUP_TYPE = flit
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
