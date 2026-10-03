Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BA1CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 966EE4107E;
	Sat,  3 Oct 2026 10:13:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8he_4JjHgpHX; Sat,  3 Oct 2026 10:13:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8DC5F41297
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022391;
	b=ecgRDvtvleVgN/Q2JHEg6mUnhdxP7OaAhydPs5dsML07M6AqupHThGlmubfEg5DGLp3C
	 UrFTz2mG5Y3kpUDvMX6zMz5ght1s8oTwcnmTawTZc106ogU4XqeEjyGu1OUgk0f1skaWN
	 dPxPp/utl59j9FJCGTpoOkGIK4/RhypmBIsIk6alx++dQbs6iKj+E16OkPMBNKb4ykDDE
	 XsXnyEZ6R0JGC40wlvH5LQrXvgzPQQe8ASiFAtPwC6Zn+V3X+I/ZUhqgcWkIEsr0Y+ftb
	 4DBzAFnQ3TLFWNgqYU4NErkOsJA3DvA9/fUVxeJvmqcZvg91XgiNnHgrpFUgamGpVSA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022391;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=v4MrVnJiZHkTRJHGhZdvL1fmNmTVjCLdwBQzJ/iokdc=;
	b=mkZGVKmDec6JEMmpMKhENd4t6zCgWvHDaHOQgHHRvei8hTkAobqDwqqXXtXlePEJnLMg
	 8LtGjzNIwjgrPzzt23tjOhLAJxddvsfM0B6fDKoJHWhNXkIFncrRn0D6Z+Mq8Tdz5kJIX
	 igd5Gbjg46mCDc/gk74/FHxjisCx3S7UdYig+IRZw8GXMx6TLu3XC0hvON6bOsTfhLoSi
	 F7Woj+KXlMsXa23d5bFsmGn3JrAvgNYR4t3HBHts7acjPU5spruf0/Oumu5GTlZCYKtoH
	 Ucz8Wpy2ZZIQmKoj/osYUSFaSr2ib7tENQ/2Fp91ij34nIUoOhre5CV33QEgrauYTaA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022391;
	bh=v4MrVnJiZHkTRJHGhZdvL1fmNmTVjCLdwBQzJ/iokdc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jYPAszSulWb8ZUO2flwuos64LOrYc4N6DjeRcPf8p/db3hTTPWJOBiXP0KU5ZjXXX
	 eGIwyAkymgZENzQcTGCDevPmbAJhsRe1+1nLJwMhNbgDSvCaFtggPf70vokrSiUIP1
	 7I5LiZTsqsQSU3VOniP8GhVcsqOztORM9zw0kLdvfHOh5qdEJVFmHqEKotzjf6M6aG
	 JXwQ9Om4uB8HSD57pQeRDmRscIcGZ4LMPHgbYUZzSsmpoZw1Px0g1Lp/CeGpTWTab0
	 wGVRYOTdj6egyRl4MFWXXtElHaPYAssNkOeQ5CbwoIhOwMHBdECpzQkA7KnlCEa1dG
	 cLHYSFHLsKEoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DC5F41297;
	Sat,  3 Oct 2026 10:13:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 87C03179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FC2C400E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:13:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qaYieB7M9tbu for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:13:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 55E36400CB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022383;
 b=Sm575LeO3abBpnbHhpX3hkaf0BvQZ+UXH0o8hCFleBis4Ukafp7A7HMkNMEMGFtknrRS
 g6vOUpIJg7r+WHJhFkFebpj+2G+9qzu0i5BZ3dCicJ+RAjqmIWPBgn1Tw/pLRXtP1sZ9C
 SlxTRpHx4Quinf0jTFwGr934wBLFgKbSzCW+dnbEiQKIwSDTaMinmICMaak4+DxPNLsPe
 uifWwE/TRDOo0Eaa6nSMse96JU50au77hsssbbKgbK4jB7vOi6hu7EChqEpjkZV/Uhwcc
 9MPr24kSQqP66g83phqFjFvuCEbxUJalcFa8Q8HBJFmbjuEPx+UR/NsWDrC35MUNoZQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022383;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=a7s5aR3CAWFqIi16PBmNri3T02c+cZy96jJbGLt8M3Q=;
 b=Bf9nxu9zzgdEfK7IQ1DSGY5/liyu2lKK+0tcK9rU2bwshbLdsjwzSLJ+lzIMVx1uXFAC
 Ges9nnj61RD8CF5nXaVOVaROfvfAo8UQQbrQkLZqdaVoMXlUmTdKZPRN55vAPMwQPKXHe
 1mte0HVBS76nO+H4MqcQmoQAs7dupJiQNok/2w9tuF2KPOJ3oD2Yan8OF0qrVBF5LyKOS
 WGDGjH74dr18mxY/50wd7iqWuAvlCDNH5+Jj2g4rxBk9Hq7NLUMg4mcKyq6fldVUmla+s
 JbJSEr511XjkzU972YwUCsB8qaKVb3QUykEC9pc5nwW7u+xfIgF9LH6dNQw/D3d5PLg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55E36400CB
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:13:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A5D8688F03; Sat,  3 Oct 2026 10:11:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:11:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1156357187bf15c06883a605dbe007e152397666
X-Git-Newrev: 7ce9f112d804e7047df13286c8333c54455cf51b
X-Patchwork-Hint: ignore
Message-Id: <20261003101148.A5D8688F03@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-markdown-it-py: bump
 version to 4.2.0
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7ce9f112d804e7047df13286c8333c54455cf51b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Fiona Klute <fiona.klute@gmx.de>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/python-markdown-it-py/python-markdown-it-py.hash | 4 ++--
 package/python-markdown-it-py/python-markdown-it-py.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-markdown-it-py/python-markdown-it-py.hash b/package/python-markdown-it-py/python-markdown-it-py.hash
index c1c6881ee1..c9d6197cf6 100644
--- a/package/python-markdown-it-py/python-markdown-it-py.hash
+++ b/package/python-markdown-it-py/python-markdown-it-py.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/markdown-it-py/json
-md5  175fe39a7fbec21878606db1947bc9ea  markdown_it_py-4.0.0.tar.gz
-sha256  cb0a2b4aa34f932c007117b194e945bd74e0ec24133ceb5bac59009cda1cb9f3  markdown_it_py-4.0.0.tar.gz
+md5  1b83a25193ec6c26c3ed83002419b51a  markdown_it_py-4.2.0.tar.gz
+sha256  04a21681d6fbb623de53f6f364d352309d4094dd4194040a10fd51833e418d49  markdown_it_py-4.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4a2260d6e2cd0f5a151a1e86dbfe7d3ed552b1e2beabf9941c1ba5c49cbce484  LICENSE
 sha256  792c48c5a849a15fdf9e37e8bcf9e6d1dd13b32b46c642a748a0a46a9919d473  LICENSE.markdown-it
diff --git a/package/python-markdown-it-py/python-markdown-it-py.mk b/package/python-markdown-it-py/python-markdown-it-py.mk
index 0b2666cc03..35ea875ab3 100644
--- a/package/python-markdown-it-py/python-markdown-it-py.mk
+++ b/package/python-markdown-it-py/python-markdown-it-py.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKDOWN_IT_PY_VERSION = 4.0.0
+PYTHON_MARKDOWN_IT_PY_VERSION = 4.2.0
 PYTHON_MARKDOWN_IT_PY_SOURCE = markdown_it_py-$(PYTHON_MARKDOWN_IT_PY_VERSION).tar.gz
-PYTHON_MARKDOWN_IT_PY_SITE = https://files.pythonhosted.org/packages/5b/f5/4ec618ed16cc4f8fb3b701563655a69816155e79e24a17b651541804721d
+PYTHON_MARKDOWN_IT_PY_SITE = https://files.pythonhosted.org/packages/06/ff/7841249c247aa650a76b9ee4bbaeae59370dc8bfd2f6c01f3630c35eb134
 PYTHON_MARKDOWN_IT_PY_SETUP_TYPE = flit
 PYTHON_MARKDOWN_IT_PY_LICENSE = MIT
 PYTHON_MARKDOWN_IT_PY_LICENSE_FILES = LICENSE LICENSE.markdown-it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
