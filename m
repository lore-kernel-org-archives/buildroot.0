Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459F2CCA464
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 20:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C236C4083C;
	Thu, 15 Oct 2026 20:01:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v_kQQm0ezzDT; Thu, 15 Oct 2026 20:01:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E4E44408BE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792094485;
	b=c9riLA98JOOZ8GWJWs0ThrICiScji7wKjzCcOtR+rb4fjfeVzHo7PbjJAaqr9dw0T9DT
	 4edkuIRAj6wEEdS/9O26d8jxa9rcleVWd5a1HBjm6+Az/auLCW16T3mT76OlBxBeUh1uJ
	 0u57QQwfXLIWzGtiieO2H1r1md8cqF8EcuqDluek8xySFpYz9sujp3T68oeh3t7MkXYBH
	 JJudovA2JjNgK7Oduo7V8VE6V2xGQ7zsP3+LRFE1ZLPbQc5zngu1NxT9J3Jw9586iiNyc
	 bt9f8IyVIztIc26IqK6Y9CCGNuB3D9zSkxrjeCe1x6T5p5OsEzER347qSBkpmw2aA/A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792094485;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qMI9o+qDCu9uqLoJbgeIXUXGYYQBIkUY76P1n5HkVdQ=;
	b=KOfn/PuStqDh5Q77rXDunw7nHJzvpt6gl7ByzPWHHBzAFLxUfMtuZWRPA6XMHQug7Og3
	 pHvfTlzl2ybFcrqRpkQkxGe9a49V9KsJbkd8nVH++SLbvzgBX5c56ZTtj5aUpysOef5f/
	 c/4ggWkwGgqCdUOGgk0gh84TPnRId7OBUyXuJlue+eXfbohLOBI5T26Yg0r1xl+DuZuzk
	 ptpy2fd6ADPiOL4Cbhx4PlkqghaylIPMHfzt++FEZiVu7rI9fCaMJ2FpCNu+6ryWx7UU3
	 RR6Z4hRmJ+CuoB3B1mMoOfo5qzkDcUvLcIo6ZZ/H2IYDPoSegx1II4hP4FEcLEWDRZQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792094485;
	bh=qMI9o+qDCu9uqLoJbgeIXUXGYYQBIkUY76P1n5HkVdQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DqYYCdhtytFq+cQM3c/oQQ9ilbmDBSiNiD+9G8Xl+7tcphdHN0E/bjgOy3uG6W9Lg
	 Ko4qNG3WbXF1EnqXXIf26cgWQ/6ommLwsj4RGhV00wrPrWvGWa0ZkbbXA80kPPmDBM
	 426i+JT/k7daUbP63g5KBF9TLdX/8iKfcY0iWD2QqzSjjYFlu3RP536IW348TBBrMv
	 k+wkc5fmDAH0rUnN3l2H6zt0BgA3KWD4dXm59NaIneNZGDX+KsT1m3dnNNDGtmMPsz
	 WVMmkEPjEjCoVwmkRwxbLv55us7Kp24Q0aW5M2gE4Wfqe8v+QwvanoGRGyHfVDOi0+
	 45FwOuiin7Yzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4E44408BE;
	Thu, 15 Oct 2026 20:01:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E799A920
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5585811F1
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:01:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xXf-TZvq269g for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 20:01:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3C6B4811EC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792094483;
 b=RzL34cZiWYyMrXXaRPfaEAFPJa7OhsTLOSaa2+AwPfOgMKacSXGpNJ1kXRp9SK4D1Rj5
 lk2T6j6YsWCxm7sGAbfh1qjqB9GpXbzNMscyRZoK724vdZ3zjaX3i0UXqIXUy1I9eXKKH
 gBRMrgX7OJGDM1H47i+AgaeEZ90+1rmE0EgCx0LmU2kZxMM8MNdnBL0JY48LVi/z4dK1N
 0nDx+Sgf9ZS3Z/E2SpYGcPFz9iK4H4egkesvGv9NQptL42MSuGvrH4QOdIbIEWCmcXL8+
 Y+zsl2f+DDCCvh0Xp5Oar3L3kQ0WWwgd022qs+A+JjCMdlQcXyJAB1i+dD6KeUEY4ZA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792094483;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=dUAcYEPyBg1+8n4unnhtu28WTZcaBpmNdbVhJyll/ZY=;
 b=hkGDohnZ9yoO5AVycJR9uz6Bi6oJZRI57V+GnzSnRJmM35JgFwx5/MD0AM01uGCwnXPF
 E/X9guqqgRrE8w6OIaWjwFnp7xFjfFLqYfPmCekyHhD2Ufn+THi5FWi1YgDfRTI2ZnS5y
 k0akfNRFRaYpYjPWqGCpdy54W3hVz0PBJsxCrvkMxBv6bKZhopQhCJqAUC/nnDWAKvlNx
 C9SAhIVYQhK8im3fVccbnoRmePJYcJqF/kr/mD4aIVraaj3iUJOmt3rIrE0T32UbgQe0Z
 gSuUfrqkssIegxFaMOVCPjh9odWQcsqwTZlnv8AadpDm9wCc3WTaoyicFWykM72plmA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C6B4811EC
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:01:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7239C95CED; Thu, 15 Oct 2026 20:00:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 22:00:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 529b876a850e90266eeb09b20ae4a82b7ad841fa
X-Git-Newrev: bbb4710efc2590ecb96921e80128a4b8ed7eba29
X-Patchwork-Hint: ignore
Message-Id: <20261015200002.7239C95CED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-markdown: bump to version
 3.11.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bbb4710efc2590ecb96921e80128a4b8ed7eba29
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-markdown/python-markdown.hash | 4 ++--
 package/python-markdown/python-markdown.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-markdown/python-markdown.hash b/package/python-markdown/python-markdown.hash
index ffda094bc9..eb43ffe260 100644
--- a/package/python-markdown/python-markdown.hash
+++ b/package/python-markdown/python-markdown.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/markdown/json
-md5  b5032b0df41befcc3c96f9fc966a0668  markdown-3.11.tar.gz
-sha256  180224db6aed87ba9ce1f2781ebcd5826253de8ff637112090e24b84502bbf9f  markdown-3.11.tar.gz
+md5  0a601cc89d8507e1409ed41ab718d929  markdown-3.11.1.tar.gz
+sha256  496f4f80f9ebd3395a04c8ec9595c40bbe8ec19e9c67d21fe071a1643e876606  markdown-3.11.1.tar.gz
 # Locally computed sha256 checksums
 sha256  7ba4eb6d10b32b2d11dce13821340351cdbbb30ba8ccc67841db2ffd86e79aca  LICENSE.md
diff --git a/package/python-markdown/python-markdown.mk b/package/python-markdown/python-markdown.mk
index 9e7559804e..e4f183588b 100644
--- a/package/python-markdown/python-markdown.mk
+++ b/package/python-markdown/python-markdown.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKDOWN_VERSION = 3.11
+PYTHON_MARKDOWN_VERSION = 3.11.1
 PYTHON_MARKDOWN_SOURCE = markdown-$(PYTHON_MARKDOWN_VERSION).tar.gz
-PYTHON_MARKDOWN_SITE = https://files.pythonhosted.org/packages/f8/4f/700155c8c20d9e655dd0732b5fc3c7614f291b9148da271d7388e50bf774
+PYTHON_MARKDOWN_SITE = https://files.pythonhosted.org/packages/4e/d4/f3f4b6ed70b7c7608fa026ff3bbe59ace9b1ebca43d8ae4886c87c95e81d
 PYTHON_MARKDOWN_LICENSE = BSD-3-Clause
 PYTHON_MARKDOWN_LICENSE_FILES = LICENSE.md
 PYTHON_MARKDOWN_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
