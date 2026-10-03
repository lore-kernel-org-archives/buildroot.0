Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB35CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 005786064C;
	Sat,  3 Oct 2026 15:55:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id whv__Bwd6g88; Sat,  3 Oct 2026 15:55:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8513C606C4
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042940;
	b=nPM1iTtJmrdRoURDJ5e3IJsc5NbnaXZ1MiSwgKnNqF+IUiZjHGIgOMsr0FRKnHqFMKrv
	 /mpJZwONpdtyz4tOOGgZu3XwpImyI3TUwz3AVA3V2lqqAtI3x+2z2VZGOdcD7IkEK9jJe
	 MkJD4+baKyDofu9iAKirCI8cW+bSwzLUjus3samK1eqBp1bWBQpagnxRxzkiOoHn389A/
	 /AFk3/cCmF8q06oSZHle16iOOvqhS4nZpkWdpCNIIfXuhSwWFfoNo58LrNRIfveGhPQx4
	 kN37lvlHu3C+/9fJ4F8PJ9mst4wrYvRpOj1qCBzHaiBYIJnHUdozjm4AQ43lqE0fcpA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042940;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=CNRLnENCfzhBASJ8btXuaB1I4rzbvmDvxccb+qtwKfc=;
	b=a7vEfnP+DZFJ+kxerKxLPNpha2NQlWE0wDPTAyWLh8VQvm+YC5ZL3HChye6QQLOQO1jU
	 tQ+J6sPXCibFskkKneT/bAu0R3p2gwZlrq33atvim47LFzyTYpcMdI9rJcTSBO+vR6PRq
	 MyywpZeVPFBslEhJaoPpwzNKDMacQ7eYoERjuh56UhHhIGyKZSC/GMHzpfK86VgeY+fVW
	 4hCruWPt8vZeQtpBSdEBmA5RIPST5PXFnMtILPaUP8fpvqCOzcjI6gyAfyayVjpOENkJU
	 lBNyH5Z2SYITWWKsSpJpge/arDRsM18DU/VFx7WL5yMexA9GBCRE19qY/akwQgMyhsw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042940;
	bh=CNRLnENCfzhBASJ8btXuaB1I4rzbvmDvxccb+qtwKfc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=L6FfaLLDBovZ2LPYr/VyKAmdx4vlaPRVQPpMCMBwHL1GFCWwr/WZ+gRko5ROJ9DFV
	 ui5EiFM5BXo3bJQk6dhiMC4Dt0W35BpqLQeGSg/8ztxpKx2paJ8nL7TlGvgOy8ccWB
	 VBe5g+tYGlaIuemIsuhSrEPnSviEj52oag4Hsu0zsEYsXdDFUsYtLxmqVCtWMZIH/X
	 yBLi2ZavtvKvkyPyoL5i2KZeXdBJNX6QPVcZiwYEASq6AtDUOxyyO61ptlIIaTCdgA
	 NDzRdMDWVXmxIlqbCqa3t3I2w6EhNoLXOy6KDimKRDzasuzSutbG+PH+64yDkiVnzh
	 mBScuiDXWzQJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8513C606C4;
	Sat,  3 Oct 2026 15:55:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 703AF1D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6037240049
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8W2JujUoxZOz for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org B39F840024
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042846;
 b=DZDcpr9H/yXfCtOjQ6cikt1OPl7g+7gm3NLVmvgbRJX4bsY27JJh22aValq5Il5eIiPn
 rK6vn6l+zMLI6+ZI1wyGGcwXw9OBm/csPLdG+JnPK6WbuKGWqdKoN5LR5UzZYHP1DuYyi
 0W9UnOgi68ZhKZ1NE9Fmsp9g1+m3KQJRxWoJJJgUJ77uajAJd5P/FKfDhCbOpRYAoCYdR
 8d2fW4eBjyqZ7mmAdN68+JGlZjIn6eEX+cjeYFGntwn9IXtPYbW43/3V3FUCwrAQESlD9
 oiqsM8Atc0FrzkaZHwL9Mm+FvOtNRPs+NagBfj4HEThSK53X+n8OcMb5Xir030Y6bnw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042846;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=zng1GalWaZ1nw4H2BPCtfupyC1+9BmS6bjKSgtmA7+k=;
 b=QCsCZiKVePJb/Db0VBBLx3zmP7O2UIDAa4pssBmafv0J8H3Z5f6KbhGawzbChX/uf8/V
 +ZoIAH4CYpJD5p5OUuhX3sWr5ko1LwtOz0bBmrR6sf/LmI0R7xPtC4ePVzbEftlEphM+A
 pgs8gkeXTTYyAWuxi/a+l+f4SRDszDgJAJgCXUK9fjc8uQ8Usyma/ynsuVEXUxWmTqmLY
 sZ2L81r3sFMs/7/23HVl8raiEw5dG8CfJaXOdlNRihaMtk0aNT8JWe46B3qezZ3aSwIG4
 vYji48mfFNYhy1EYFQJxJj7zw00Nng0POSTHbv0MiNLjMwJEa3X/gRCq0IWCzz/8K3g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B39F840024
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0092D8A39C; Sat,  3 Oct 2026 15:52:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1383236e2e1ce1936739408e69b7b30063d3f590
X-Git-Newrev: 16bea591ff67164b79fc8e2caf49c4e8d7d10ba8
X-Patchwork-Hint: ignore
Message-Id: <20261003155252.0092D8A39C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-asttokens: bump version to
 3.0.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/16bea591ff67164b79fc8e2caf49c4e8d7d10ba8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-asttokens/python-asttokens.hash | 4 ++--
 package/python-asttokens/python-asttokens.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-asttokens/python-asttokens.hash b/package/python-asttokens/python-asttokens.hash
index ef108bd0d6..2498c49e12 100644
--- a/package/python-asttokens/python-asttokens.hash
+++ b/package/python-asttokens/python-asttokens.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asttokens/json
-md5  50670141dde921f807d8257be4a5df9c  asttokens-3.0.1.tar.gz
-sha256  71a4ee5de0bde6a31d64f6b13f2293ac190344478f081c3d1bccfcf5eacb0cb7  asttokens-3.0.1.tar.gz
+md5  63ce30cc87fd0d7e5dc1f1f48fd31164  asttokens-3.0.2.tar.gz
+sha256  3ecdbd8f2cc195f53ccada3a613538bb5f9ef6f6869129f13e03c30a677b8fe2  asttokens-3.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  62fb8a3a9621dc2388174caaabe9c2317b694bb9a1d46c98bcf5655b68f51be3  LICENSE
diff --git a/package/python-asttokens/python-asttokens.mk b/package/python-asttokens/python-asttokens.mk
index 4040a7bb73..6fbc924180 100644
--- a/package/python-asttokens/python-asttokens.mk
+++ b/package/python-asttokens/python-asttokens.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASTTOKENS_VERSION = 3.0.1
+PYTHON_ASTTOKENS_VERSION = 3.0.2
 PYTHON_ASTTOKENS_SOURCE = asttokens-$(PYTHON_ASTTOKENS_VERSION).tar.gz
-PYTHON_ASTTOKENS_SITE = https://files.pythonhosted.org/packages/be/a5/8e3f9b6771b0b408517c82d97aed8f2036509bc247d46114925e32fe33f0
+PYTHON_ASTTOKENS_SITE = https://files.pythonhosted.org/packages/25/1e/faf0f247f6f881b98fc4d6d07e14085cb89d13665084e6d6ac1dc2c03d0b
 PYTHON_ASTTOKENS_SETUP_TYPE = setuptools
 PYTHON_ASTTOKENS_LICENSE = Apache-2.0
 PYTHON_ASTTOKENS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
