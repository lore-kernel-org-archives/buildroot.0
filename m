Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AA1CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E2F3814BE;
	Sat,  3 Oct 2026 15:55:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OgP6DqKW-ApP; Sat,  3 Oct 2026 15:55:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4EED481496
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042926;
	b=EsRGDqCSE9nepmrRXfx2ebsXpUyzXuni4vG8aEm0Or1vC33lAduO1nhmip35dW4B9vNE
	 1wbqF2uooShgsuFYSCtoK+Oc/9LLAtQPrl1IKGIs429lXmhHbEtlxQALuNXUphsUi5ctr
	 8W+12+2UAxOm1IttZAE7Rq01R0Kjv7V7Hv55bZWjRVWiDuN3B+5bTvvvy/w/h35iDObvS
	 mvXcxD3Z0wWqOLKSWVPF1R507cGZWreexg+TXX3KuX8BqGUjSCdhtt16MvPAteQRZk5VN
	 AbsgSy1UfLrMcSx+IFM5yTvPQQ29+X7UTbyFfhXl+ktIG5Nip8v/D+vpwx965ZRzCnA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042926;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Zuw7MDIt7AM16jlkcBTpPRdfzaoY1vZ+BC1OcEDgtK8=;
	b=TOGiy9nXsZfuXH5vfSeACzScDE1KGtLfx0fck8aKTlCPnKcIFdvsTqrFMGypsEn2AXsR
	 mxGCKqg4Xp7ENFgTPF/Bs/sdbl9kLQJIfuUEGzBaAUOqdzpU38UcjcFD7Qzxe2LuY3+P9
	 jo1X0OMr+ke54pVOKDGvk0a1g783J//Tj+pAqkCSZ1sd19JjewXbAWcKkvY1vliigKcqs
	 7Z96yP6zZlfF3lNpi93z/5tv3cr8L2QD4H9d7w+XO3FtUTzKncdDWylyRNRfvQD7yywob
	 k7dVG5XL+vs7my2EcVrxp5Egyz2FvLEU9XQ+HmEp4GwF94yn1lNOiNuF2KQNCnnlAJA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042926;
	bh=Zuw7MDIt7AM16jlkcBTpPRdfzaoY1vZ+BC1OcEDgtK8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rz2HIpJe1s4ZtfUJe2unRV2Z23UogYP/QtR67bGfew36akEG2o3kq6T8AfwIxF/uX
	 WNWKWgdX8//krNLmCmBAWDko8xpquqURsuiL8jlM1Pp5UUVca1EJD6lIhKWX9H0eEj
	 ES91ibGYA7yOhBYJ2OO7EDvFc8yCoXiG9qB5VJRETyRtUFz2H53Afqt8Ay1kGN5j2I
	 igHapqwK3yGGHO6LQ+wxpEwTp1h+Q00RYpPkxB3w07iil9fxRFeL8E11FMlKgJzZ/U
	 hwoLooa8o30xmJUhMNKzltJP2ylrhbYNd27BibQ/3sUCgh4w3aHakS/SJfM/cb87Qh
	 FM12wu51Mlv9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EED481496;
	Sat,  3 Oct 2026 15:55:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 08B7A335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7D9C6068D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0fQPPs6pUbO8 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2D062606AA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042845;
 b=CziwbV2FZTwO1TLFq4jugE0XTtWQjGMqyOu8gSx7Z/JUr/fzA2KkVLmi/SfOeWXMAX5i
 HeJFXQuKu2oWMahRIVyLhMQWyaX1cYY7+TdCxAeTI7KjrA2+FwIJIMw09qW7jBmxVCO8Z
 ZY+kHhVz5w8QWdMzddPreN3/xTERlMBCsWvNAhjhjieuoRmDlopOmvNn+QPJAjRdeKoyD
 8inSFGo4ymfK7llQoUSlDxqC2v3Ex+aNph5uNv7s/Zv3QM3ssEIgDC7PVASTrLIYV0fxS
 swrQxAzWMxNQtLzNQjWyUemIRsDAd0WhW9cwtt18JqlOT7RvCjt6M6TifDEBpjlvr/Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042845;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=nfhKvqUXsIwpWEYVGBn6XznFDxahA7+SaSy/302eykw=;
 b=SFBntJWjLeplSc09kPB4rRv2yrw//5H30HeSnL7sgG2etRpGQAOCRw40SmXwZ61FhCcn
 IX0q7FkKyecMKSBXhpbPXhF22KeA2/MMA2cGe9dqTVxS+cCSi2DR3FQJaMUUmAEGtKpZf
 KLC/OdCrqTbrk8+m7WoDYET0B2y6urmXrISswxIbUCTAssAPh927yhB9D/JZDZdtudK+w
 jaSZUTFE/psVNIzgpIi4VIERqcPHI28QwUqE+ennENIo77pQzSSvG/xEPMgoYPvIizEwk
 kDrhq1RoemuWolZWbycQwx+sYSa/+IL3FNwnTUFUVa5S4hCcMKrxwB6HJHxAOxCDMvA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D062606AA
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D8998A31E; Sat,  3 Oct 2026 15:52:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 46f451df12a28106e90ae2c064a17c52e4109dc3
X-Git-Newrev: e276f369a7faaa0dcb58c3d11badae94c63d917c
X-Patchwork-Hint: ignore
Message-Id: <20261003155250.6D8998A31E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sh: bump version to 2.4.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e276f369a7faaa0dcb58c3d11badae94c63d917c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/amoffat/sh/blob/2.4.0/CHANGELOG.md

Upstream switched to hatch in version 2.2.5:
https://github.com/amoffat/sh/commit/9956258e71ef054426564fbad937fbf225a9633f

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-sh/python-sh.hash | 4 ++--
 package/python-sh/python-sh.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-sh/python-sh.hash b/package/python-sh/python-sh.hash
index 43da0bc0ee..54eb66981c 100644
--- a/package/python-sh/python-sh.hash
+++ b/package/python-sh/python-sh.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sh/json
-md5  961d38de16f88556bd70381eddd7f415  sh-2.2.2.tar.gz
-sha256  653227a7c41a284ec5302173fbc044ee817c7bad5e6e4d8d55741b9aeb9eb65b  sh-2.2.2.tar.gz
+md5  3c11c9c853bf3d326dab0167e9610187  sh-2.4.0.tar.gz
+sha256  a250aef68509ed93419c9a1d90b0647cd5cbe26107ba94d3717ef5b6d595ffd9  sh-2.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  d8491c6e236568d04f7c8c07f2f1b8f5d142706dab6ab88f6e0d2dd476b6c706  LICENSE.txt
diff --git a/package/python-sh/python-sh.mk b/package/python-sh/python-sh.mk
index 6bbd621af1..e5b54b0974 100644
--- a/package/python-sh/python-sh.mk
+++ b/package/python-sh/python-sh.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_SH_VERSION = 2.2.2
+PYTHON_SH_VERSION = 2.4.0
 PYTHON_SH_SOURCE = sh-$(PYTHON_SH_VERSION).tar.gz
-PYTHON_SH_SITE = https://files.pythonhosted.org/packages/59/52/f43920223c93e31874677c681b8603d36a40d3d8502d3a37f80d3995d43e
-PYTHON_SH_SETUP_TYPE = poetry
+PYTHON_SH_SITE = https://files.pythonhosted.org/packages/e9/c8/137093889a8b8c9a66c9b46079cf2a0e155a8be027df212a4041e3b7b09c
+PYTHON_SH_SETUP_TYPE = hatch
 PYTHON_SH_LICENSE = MIT
 PYTHON_SH_LICENSE_FILES = LICENSE.txt
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
