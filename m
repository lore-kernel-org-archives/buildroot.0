Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C245BCC6B19
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8892580D48;
	Tue, 13 Oct 2026 20:52:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OULDfZU35hF8; Tue, 13 Oct 2026 20:52:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 938A980BD6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791924778;
	b=plS6c4r5wPn9uwCPWy9DSoliqC+3PJxTzGE8jAQqHjOejhmRsULUihaPvQx/twT9vh2x
	 44Nb+8F6rWu8klO5QE1PpwiQIxosF+QrikBSZl+Y+3J7jXusgSridAq26CINDIHZec8nF
	 cZ10OVO43ik9BhkKHpZxndiMiynZdOcUbNicRs/NaM0MTRcl8prKIGeAFuOSifhQDiZt+
	 egYi5lySR5ZoJ41FiTW8NVWLaBKBPD7mDDt3mrvzsVJ5HNux89ZruHbS2wd9GEOAqr/NB
	 YI5kcTqSmsp9S8zaRwCr75+GxMH6+Xrkm/PqH0XmbzGB+989gCd4WnTEodW9WmzKJog==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791924778;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0u1kzYCCILqX9vpyye5gyQJ8kMJfZ6I+vR8yaNH2u1s=;
	b=OCBC57QAhQuTJ36JJ+Utw3xLJnTF/HcJXDELoYFoWviks40n/567gcC1KsLxWpFM96JE
	 7ubdoxJl6KpwIpBrzgEYJx9bhaDBL98zOBe6Em+o6uhHGG6+4ejLIUN1h1MG1Utnlmyaa
	 UEWRTksH7rM3eilos9uo023K1BBzfBjBxxaksx1KhuzHzvQu85EGoCcQGC6Htm8NeHq1o
	 qyX6zSRSGnTpdrIiDbtuA8sGQ/lmrcTHdrkLfVQw9EY+3DHZK/f7Xf19VeVtTqQkA+TTt
	 o56gggAe4eYQPGXq9R+4txJGUDQ/odP5dZV67F6c8SA1Qavn/Ix7Grv+33gSdzSnS8Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791924778;
	bh=0u1kzYCCILqX9vpyye5gyQJ8kMJfZ6I+vR8yaNH2u1s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WU7VHeQtHNKouxS6XJ43zB1cyZlqD9NXyfkQaJoQHF23ybn5uoh6536z8rqaZAXNV
	 XRVWS+IScraJd9fbHGINfOxjPacSRX4K4KeIIn6QYMaQK1//2XdIwkDc4i1jslviGr
	 9Wa+x051oqOc5GHKMH0QHRWnG+2MdSwmxo+eHMX84LAUDccBAQca//vImBN6jRGOTR
	 k01nale0KnhbPxEIcRwiJxrnF3nnjdxUTUJvMw5MM5XDvV/d+4a8SxJU5Vzj0PzKVd
	 225eB0tdc3IG5x70RpeVm+SOo8COP3clQjvUqNCig80RE2DF0NM5Vt50PXN91xcQ0V
	 0SWVronzawmnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 938A980BD6;
	Tue, 13 Oct 2026 20:52:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 48097788
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D78360809
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jMBo4Y9_PnQC for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 72B8B60806
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791924746;
 b=ZTNgbFxx0Z/eLuz9RsRNpPDLWhdO9JGcToZLIfYRrivjIlfaLgexzwl1svs5wa3eUEKJ
 WtZj3c/kS7A8pf/xfUsZ8EHm5A9P5uVFIrj123RZfhPTA4H/u1E53bhDEbKUFgLFiNW6r
 Lmn8al2NMAqKglV2D39X7C8Z/vEHHvbWRpPAJJzqR04oLXFfWll+XXaru5wG/AY1/6qMx
 5HJmyp591tK/g7XMoMdVJ6+G4QBKUZe/SToYmRRM44cAklI84RisIda4ZV/jAzg9jEeGD
 yr43iNhgIPvNcdkhGYldD63zSyCOyLoHaOb/FVItEmbkrOJjyTFrcW8WTFDQ1QI6Ffw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791924746;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=WnISQGvFPWxbJ9e8M8qmpESW2irhpdR3NskIj3ym0OM=;
 b=qIOrEYG0R8BVy7tcxsG2R8zVl8zNE1LLkBQxqxBb3/9HtEhJNrmbxW1/TmxaRo7Ah+Ez
 TJX8kAKHbhry61EZwsJq+Y+WwKRRxsIxAJoVG2lDCht3siq2D3m7Ktjsn8n78p5iZwrUA
 5qj34AMA4nveGhZQ0rqB9imz9exke1JgyshFIuwXuk8DasmfJkEHe8yw/WhoCblWK1oXo
 IyAL0oFrfVWf2NplxhtMsOJDu2LofXSz+I/n/9t0rDod2QHukwniPBmc+xKLkTNQwHNQt
 yvxVDSIYrgMkZr9MsywJl57mndvyFjRl8j+ccIJoQPhzbpflRbzSuhsssg/0WpTJkpw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72B8B60806
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A99A4956D0; Tue, 13 Oct 2026 20:51:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:43:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1e38e780d3f2439213e521f1090a51f153c27d49
X-Git-Newrev: 30fb24f7c00cd6ab742a54aa4b2fee2235480786
X-Patchwork-Hint: ignore
Message-Id: <20261013205106.A99A4956D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pycairo: bump to version
 1.29.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/30fb24f7c00cd6ab742a54aa4b2fee2235480786
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pycairo/python-pycairo.hash | 4 ++--
 package/python-pycairo/python-pycairo.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycairo/python-pycairo.hash b/package/python-pycairo/python-pycairo.hash
index c390d723c5..29244baf2e 100644
--- a/package/python-pycairo/python-pycairo.hash
+++ b/package/python-pycairo/python-pycairo.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pycairo/json
-md5  fc7c3b4104e88df7dea34af4314b9d12  pycairo-1.29.1.tar.gz
-sha256  4fbd26b4af24c9787d84cf5448e34eb8dca064b732479aaecd03109520eebd5f  pycairo-1.29.1.tar.gz
+md5  e8ddba92cf6b9999f13abce1d5e7c403  pycairo-1.29.2.tar.gz
+sha256  3e69fff74fe64f5ba2dfa31f67c6bdf26413342574047437d2ac520d35e9a489  pycairo-1.29.2.tar.gz
 # Locally computed sha256 checksums
 sha256  360b9a526d47c51a7cab7f1ec49ca5893050562d639b742d588934ff84823a72  COPYING
 sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  COPYING-LGPL-2.1
diff --git a/package/python-pycairo/python-pycairo.mk b/package/python-pycairo/python-pycairo.mk
index 20eb5b511f..033f3c5ad5 100644
--- a/package/python-pycairo/python-pycairo.mk
+++ b/package/python-pycairo/python-pycairo.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCAIRO_VERSION = 1.29.1
+PYTHON_PYCAIRO_VERSION = 1.29.2
 PYTHON_PYCAIRO_SOURCE = pycairo-$(PYTHON_PYCAIRO_VERSION).tar.gz
-PYTHON_PYCAIRO_SITE = https://files.pythonhosted.org/packages/26/7c/ab4637b028d9ee12280ab9342f28310e613d5ca30c4d72d2aebeaa6a4969
+PYTHON_PYCAIRO_SITE = https://files.pythonhosted.org/packages/bb/5e/19ab2572981a996ce96b853a189d2dcced40506b67d9555a7568457abcf2
 PYTHON_PYCAIRO_DEPENDENCIES = cairo
 PYTHON_PYCAIRO_LICENSE = LGPL-2.1 or MPL-1.1
 PYTHON_PYCAIRO_LICENSE_FILES = COPYING COPYING-LGPL-2.1 COPYING-MPL-1.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
