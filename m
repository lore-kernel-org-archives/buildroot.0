Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D68CCF2DB
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 08:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82BC4406FA;
	Mon, 19 Oct 2026 08:37:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uZrGtVz_1AP3; Mon, 19 Oct 2026 08:37:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 79ADA40702
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792399056;
	b=qQWtC5oh6XlgHm/0Tp2fDD02yyyhyD3l1wP0eHLYOjd46ajInzV52iU3sy2KXDkfOGXS
	 EK6zQpTbVKXua7tdJpmsS1aI4cDEnvLBlfwaoUZBnC3wWDhZNIkVhDNe3nKn1on8xDPS5
	 KWS/yUs9ozSkbwVD7nZXkIB0bkEt1/NYObxrElHwY+oZPSFefwiU+TisomGP55xZnV6uy
	 Q8kHilyXtTd3eS957GBdt+F3v9ZXlJFFV2w0lTxZWN8JQSO4PdRLE47xpPbmWfzXp5Jcj
	 oFqsf9njC3cxN/Dwec19rdBMEn8c0ck/l5NLsZfbk1rMf5Jg4x+yyQe4PRE3F+U7ZBA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792399056;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=amhKtzynnqkzoLp9iVr8a1LTiuHyFwPQFVN5NxM6ayg=;
	b=nHvSQt4ynX/FDWnLxugG2krJ2rkxDtvZ0BeGO3y43y/KEXetb/hDm1xHSYjYoNlcDr8m
	 DFaeZqmuGUujG8i1O/EeIbjKp6OJkYGXCh8dw3GkIgNBW5lop7vdaPrKdy08dwjtZIz3W
	 BwAZo/Ez6NWW7D/oVa4F8Dq440t6Wfw+tQubSgYxgI6qAydMt0NhBohuGRfRsXkFGTw6N
	 SA9OMf0gzbWX9AfVBk5v1n2TS082zadH7UeSDjLD9aHswv6I+bMlbD8IgMS3TBFORTCCk
	 oPEmYnly65iqMwV0zpnCHWtKDHbI07+m+56hy3fe+wx0isXyoxxz/60TJySJqGwZwGw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792399056;
	bh=amhKtzynnqkzoLp9iVr8a1LTiuHyFwPQFVN5NxM6ayg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Kn5KXfgD/KB0+caHA/KNwUZOYlTRX6a5+XJWNfFj2bBcZFHzt7HOF04DAhwKWg59g
	 lzY/D8h96ooR13JSSXlaGYqgwmGd2FhPYMWKeo9iEfsWcyOiMqmuEhs8vSIte3JKMl
	 0Fv2iTpqZD60tIHEmvZznEF//gI0nsLJ8kW7lbuDbyvPPOukQyxOMQLjxYsAtAiyLn
	 WhZAogxFC4dHKslfmc0htn9J6tVBLa1rVUquWZwAaEk8TBS0cHwcjIF8FLowrpVzc0
	 k5Ijae5NJOxv1k76P01HsoES+S6TuUnXbU1XQK5+89jhPmE/6wP78SOriHTdR4VNhV
	 F6pRu8j3QDcRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79ADA40702;
	Mon, 19 Oct 2026 08:37:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A94F1D7E
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FEB340204
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qQiJJc51keaD for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 08:37:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D57BD4018B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792399051;
 b=sFFlAHljR/N7mGJzSH//Yf7xEEFsy5adarxt7Gu/AhcF9fYed3NpS7LtvHit2WdbPQ7B
 ttYHAl4BDPmNKd3/l8kfv+mQX7RB5ajxsudwzhjP6xAgeF+mq0QU2/pSeZF9vRXH2/D6p
 SqIfZ0xfNxzMVOHFiCnUWMZ5MkhYgfrvOdPfdkmj43c5TxpH5ibHHhh1t9FEI3U7jQo4H
 33GD4LmCl6DxOHYjOJjgbciGMhN5Jw7jZENv4KAI/+JTEv4+Tw9GLsV7Zlhiy6G+9fBOq
 CgfdoPi0+1fH8CT+QhmYteB9rAYmS2m/vSpu2cjKmtQCvAOrBq75ze9PJRuWJ7zjYUg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792399051;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=EY9AtyAtmi/g+djVveGNIEBQAZfzawlV4ILGh4PJ36c=;
 b=bo4v5KKhsdQ+n3SxEzzpCHsjgVRQejk0G2pPPKC48XUKCzVA8y1kQ+JXC5rpivaZ0+vj
 rjUyfTlxic8H8bumKUSmvmDfl6l7W9bVV0VFLvd1FMLY825rIBpc36j6Nl8JpHdpvj8rX
 ZYjDDIRSpBCYvqqramo5Jm1Rt4bV68MZf1WGO5sdcex+xqorjiUQbgj38LPxbVOTOwtxi
 kOZ1oEU/V4OwRN7RqwqOhAEETV9g/eylQRs2gk/lKBEtEVl+5taNUHpgqo5ArIiX0TvIY
 kClKBFZCRJIptPnvXL5q9MB0goosuEVh03cl+e3IUDufUTa1XeNo4mFlB7pjcz6L4GA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D57BD4018B
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:37:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 654CB984AD; Mon, 19 Oct 2026 08:36:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 10:29:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 23730639b96ce91562202476c79f536661cd3cf4
X-Git-Newrev: 7462a6a7536f4cff74d4280ddeaf623245a66a4e
X-Patchwork-Hint: ignore
Message-Id: <20261019083609.654CB984AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-httpcore2: bump to version
 2.14.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7462a6a7536f4cff74d4280ddeaf623245a66a4e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-httpcore2/python-httpcore2.hash | 4 ++--
 package/python-httpcore2/python-httpcore2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-httpcore2/python-httpcore2.hash b/package/python-httpcore2/python-httpcore2.hash
index c088cfa87f..c783f884c3 100644
--- a/package/python-httpcore2/python-httpcore2.hash
+++ b/package/python-httpcore2/python-httpcore2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/httpcore2/json
-md5  345513f80f9ba004d66a8534c5b74dfc  httpcore2-2.13.1.tar.gz
-sha256  e0aa977abe17e69a3b820a24542a6fa88702676d83880b8d194dcd18408e5103  httpcore2-2.13.1.tar.gz
+md5  a540e0f456af9e4abf944965a361ba1a  httpcore2-2.14.0.tar.gz
+sha256  4f57a1a8249fe6af589d935cfd456f1d13bbdcb0f0fc72af9142368fc94811d7  httpcore2-2.14.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c4df125c807b0613501e943a5c92496dd11d2c16604ce396097a8dde396304d9  LICENSE.md
diff --git a/package/python-httpcore2/python-httpcore2.mk b/package/python-httpcore2/python-httpcore2.mk
index 48c3d64604..048d582bdf 100644
--- a/package/python-httpcore2/python-httpcore2.mk
+++ b/package/python-httpcore2/python-httpcore2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HTTPCORE2_VERSION = 2.13.1
+PYTHON_HTTPCORE2_VERSION = 2.14.0
 PYTHON_HTTPCORE2_SOURCE = httpcore2-$(PYTHON_HTTPCORE2_VERSION).tar.gz
-PYTHON_HTTPCORE2_SITE = https://files.pythonhosted.org/packages/cb/f3/1db7aa2bc2524062192bb0e0323969492d1883152a232fe36eea65f4e35c
+PYTHON_HTTPCORE2_SITE = https://files.pythonhosted.org/packages/30/ff/b53af1b49bb2cb5fa97c92215614b173ca5c1a99ded80e2d52f15a94fa6d
 PYTHON_HTTPCORE2_SETUP_TYPE = hatch
 PYTHON_HTTPCORE2_LICENSE = BSD-3-Clause
 PYTHON_HTTPCORE2_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
