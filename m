Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB7CC98321
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 19:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B4A040A7E;
	Fri, 25 Sep 2026 19:16:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HX0uztNKXsJs; Fri, 25 Sep 2026 19:16:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3895A40B10
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790363777;
	b=WplJg1ugFpCG7UBqt5tGMH80OKgxC97rKsFnOCsGRkoFc0KgNTcXrukleOLGk1s6U7L1
	 Y6i4D3bKOLQjOqZxcQoRrjfcrgisDLnnsTkZ1Py3T8oXERV0wHZThZROFDquvIVQj5WCI
	 MHY4jP6zmrdPKf956l7r0WiupKEGuUVf5pIiaT7GBDQ9rElBY+yPJ2CRRsdzvT3oYkRVm
	 bqAPAYl8is77YZGh/P8KlniGgPW3vfUuIY3KEde8R/mqEOAK2544g0B2Ri/AHTD8fSTK4
	 8iWYamdhVuWp62IinV8X7dvBjaM83bp8cUl1bXxKLYKceN4LK3UbGe6qSePjFyOPlfg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790363777;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=j3Byy2q2Ku1Bk48bIwAqfHeedOAGEPbKhg+bJ/6Mvyg=;
	b=ERwEZzIIRjBEAZUDzMFsl7s+KitPphal4ljeVjWjNn8CkCcXZo9VdgNinX5/NQfNIt9P
	 PFpzYSmmtrnE1inPeQYn7DiPwcy+4BnTMuEG8dRIFpOh1KQtLegkk5ER/X5aq2hGPiYWH
	 bifdSAHp8aXDTTTFDyoHB2X+R17rzHQ6iqndFegXfDRKUtGFKhyNb88ifStXe9Xqj2Oyu
	 M+A4XuopFylPcS9vg8O7yb2bUT9ORpvkEvA3w+To89c9OcuOjo8Kaz8c74W3/LvbdhKij
	 YNbnReXl48EsnniKo6ULDfMLVDGHRPc9FZDRLigeDK9WN+TMJHQoXVCobNoHJNhBmQA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790363777;
	bh=j3Byy2q2Ku1Bk48bIwAqfHeedOAGEPbKhg+bJ/6Mvyg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=j9lgyvFjCnqA3DG4ZtXEE1X515M7fk5q703j22F+pKZ3qLdeB77Izkl0+bNQVxH8c
	 /RuNbVoPEhAWAUl4bslMSXai77xXjpoYBrwy4U3cTRfKEN2JB473LTEct8f9zk6w7X
	 /1YReGLoeSSALgy8PuPLhpqIHcvWeFLcbOKsIlyx7XtsYrXgfRKSNcajolLiJv5CcF
	 522oiHwF2W7hZ06RKVmR1fddZTfUhZHuy2hclDYHMPtjPVq4R7eZwDYZWOeLosWQsj
	 9Qvtz5GR9JnUW3iFzV7MBnqPYgo0T7Vmpcu66aS/qkVIfSK5yBDPzyjgKpWAOuGyMF
	 eWKkBahmGv9cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3895A40B10;
	Fri, 25 Sep 2026 19:16:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E6251335
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 19:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D826860B66
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 19:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 65fm4o8HlbF7 for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 19:16:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D6BF7608A3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790363774;
 b=E/hc6cXCt22jvgl/1RdW3FVN4/DxGgzjSfKh9tDRxlfjcPD7DWlJ0I7mcKryz+Q/m4FJ
 AW6PE4k25eLOgSKCbOh4tDlsi8b5T0lNxwJjVOb9VoYfKHXNOHqR39GEKiyamkYlHaZ87
 zC03TK9aoMck2xOeMy5DGIkwKjZ17xRp8eWNd4TVnkChsJAqkwFv/KAIn8FJMuO/DkU0W
 /2NQz+R8cSFvWn9bJPbjK0kTCCd6vQWeTdRDADiWfMubA1ksGo3vLeSNLaSjIPZA4s+7Z
 /xNifPHzsZQuAJbHGebo4nohvKx5nIoxYXSk/cQB3T9ECEUBt/+pdSTj1KxaNR4zAPQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790363774;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=FmGnj++zgVDjTmH4i1HIsUg6Bs5zEssmiaQMLucmHwE=;
 b=JTj5JsL8F2I62GtrY8RPu5H0WtN2l0d+D0gQpUCfjb9JVmsmZjzZucUNohCt4iRJFTtJ
 uaSvwRrs6v+5aei+puEG77vIyMSwbqkyEeVoDRHJ2KxSG27D0dA7TRRU2oP628z6mcwlv
 Wk+CDM1RXqEStl/ieVkF6FBts6Oz66fqZT5CNQWsssok6enFJfYzMtv5hVLGWdwb/utDz
 vWCH2FKMiFG+U/cwecxtHtdO4IQIFHd5bEh7mb+IF28sejUMRiWG3igZ+gqZMc4DurUw9
 KvGwMkpBLmrLEwC3AyXCB6XJsB8hDNrxRK33W7PhU+F0rGEDcF5dG1asOo5h1hBSm6A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6BF7608A3
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 19:16:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D24AC98396; Fri, 25 Sep 2026 19:15:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 25 Sep 2026 21:11:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a962be2eea146e06661712159698bc7cbf3305f2
X-Git-Newrev: 0867818a73dd5884898be9bb226062ffe7c45dfe
X-Patchwork-Hint: ignore
Message-Id: <20260925191503.D24AC98396@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bubblewrap: security bump to
 version 0.13.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0867818a73dd5884898be9bb226062ffe7c45dfe
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

While there are no CVEs for this Bubblewrap release, it includes a fix
to ensure that arguments that receive a path are not empty (which before
treated those as the root directory: a bit of a footgun!), and that is a
follow-up to the security fixes included in 0.12.0.

Additionally, it patches a number of build failures, which fixes e.g.:

  https://autobuild.buildroot.org/results/2eb2d222daaadc2eb16b42fa2ec102ab0689f038
  https://autobuild.buildroot.org/results/674413f089ce9b80a59058674b3ef6879e1d389c

Release notes:

  https://github.com/containers/bubblewrap/releases/tag/v0.13.0

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bubblewrap/bubblewrap.hash | 4 ++--
 package/bubblewrap/bubblewrap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bubblewrap/bubblewrap.hash b/package/bubblewrap/bubblewrap.hash
index e150e1495d..43b22dcb5e 100644
--- a/package/bubblewrap/bubblewrap.hash
+++ b/package/bubblewrap/bubblewrap.hash
@@ -1,5 +1,5 @@
-# From https://github.com/containers/bubblewrap/releases/download/v0.12.0/bubblewrap-0.12.0.tar.xz.sha256sum
-sha256  9760d007363e3abba7c747489910f9f82d9fca53ba3bd3282e396fa3c97a3314  bubblewrap-0.12.0.tar.xz
+# From https://github.com/containers/bubblewrap/releases/tag/v0.13.0
+sha256  4734237473c0e5d695e4e9034a34e43b2dbf5164655bd13fa59ae376b2b7a765  bubblewrap-0.13.0.tar.xz
 
 # Hash for license files:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
index cb31406c8f..dcc3c23d7c 100644
--- a/package/bubblewrap/bubblewrap.mk
+++ b/package/bubblewrap/bubblewrap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUBBLEWRAP_VERSION = 0.12.0
+BUBBLEWRAP_VERSION = 0.13.0
 BUBBLEWRAP_SITE = https://github.com/containers/bubblewrap/releases/download/v$(BUBBLEWRAP_VERSION)
 BUBBLEWRAP_SOURCE = bubblewrap-$(BUBBLEWRAP_VERSION).tar.xz
 BUBBLEWRAP_DEPENDENCIES = host-pkgconf libcap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
