Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDDECA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B48A6064E;
	Sat,  3 Oct 2026 15:55:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6N59ugbdOQTI; Sat,  3 Oct 2026 15:55:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C312B60E85
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042934;
	b=eRo9Ry2tx08eaRr4v6RwbqW9H9/rDzYsjTN9Tp18S2J5SnSLgtde15dWRNfeauxWbB7c
	 b9NLDsfNumKH1B6Ic2sU637CFYNwoic7s7TBP0b0rdRl8yFxdFQdMrFywzAr9strJ47Vc
	 d1ba2eTOy0yXl3m9nEhro9OERunZooUshzR9t7SSry9R75BLTTRqikNKNyTuZS48M9aFp
	 MiIIXmye5KeWuTUMyvGWZenVyQHct53pUT/EwOAjmoCTKxJBouUxYOSOq6hd1ez2Hyw3C
	 4UOPOlgLnAotczBNdgqpLSwfoYvgKfwOg81SJSBKeVB4EnCf2Ntkwxt83qvx4C3hpKg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042934;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=wnCqyDM1poKDp+a9mO+fc0doefEbcGFheuhQLVa+NZo=;
	b=thSHFp8EuIlZZuPG35QtxXeFlpbDpdHU7kPjjfYoWs7KjI/j4bmH4vdPloUNSjbmz9bK
	 BI58LqVNlWweu4gpxV7gtex/Tb4s6ieiLoJ6jYiSRpQUdsR6AQl97qOjBZFKBI/A0mWJw
	 RWxevrGxjzm6iSER1c9Ng9b8h8zFqm2OJhY2Qj+mD1fNkfEJ4DyzMRvCqSFNEFn8TpnAi
	 Roq0oai1L9gEXz17oylcUx1uJkUsgdNyi6Dt77JcBbq/qPuiTD/ApbktnCUKCTtWUEbDw
	 tz2HLraBX3Ee7rcXGGfMk/ZeaETTSTzjMMr4FGgmV+eUW282hBxT0irAbQ0QcFK0Tkg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042933;
	bh=wnCqyDM1poKDp+a9mO+fc0doefEbcGFheuhQLVa+NZo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VVI4Dr0yRo21uKrADauw+bg7GywPmAAsXTwwEXmDbhoCjsHRSN1+4gCXoCfZ8t8PK
	 2yMnckKZcZcQUstzDS4ik7SdMq2NXD0PkABXwjtZJZnXowWwKRjadw6gNfHsQjWi66
	 XQ7V8uoxPMvm1MCBBk2fvC8wD9nLToRwdQMWOL4blXWe47V4jprhm2ORqOfkETCM4o
	 oDS5AfD4fzmyfpf9rTupZCJBeQvunyGDKNbfaiUzTsLlpFazFmnmvSlLzM9l7IYL7R
	 gl2P1dgoUUgDYU7jiSX3CHYZpGNOZSDe0lFqfa0t/ZSE1GUG63QnR78RQirHUe66b8
	 BDOlYMB4em4/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C312B60E85;
	Sat,  3 Oct 2026 15:55:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B182335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47F7B40049
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pv3jqDBlvspH for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 95283400AF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042846;
 b=AAVLQYQmfrRZzezcdQA9NChnKsvEC8aq0s6UheHCN+YK8w1al4enySWd7CRvNypyarxH
 kOHwUCJlpzRPvFuob3Ap3yP4aO9/b6044Ysl0UOGr9LFoGuxUqYMZcdzQQAPeITPm5jsw
 jRwDr9qRlLXPouERbJ6xVBJdiDE3EuWLcBWDbeyvaLsc04HcNeXMEoZsNWkLs1IzxUKFZ
 mFgdolRdxFa1kVDwFQjRVI7mOgpMCRjQKi6v731j/0M7Re+P7d0ym03vGya1wHw8/KACx
 AG0qUK08T6TbZyuSSmKYOoKYFnL6/antEZtxxhEn/KzC0jT/DbodlrbTveyf/gCZXTg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042846;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=wWANtOQwiJ40VT47PmkOutHBYZxYlyXrevR5wCXs1kg=;
 b=OTHKOFCcI+DDKYw0ovIUvAcCvy+RiXZj5Q10C8PIvnTxRcCKT3HXLHF+nOTF4YRbtpNX
 G8Jg3AX4G4lcDMEoAd7WX3SvHEpUx0hBPpQFkEq8HFPI7JShrQ8py6zuXHbl1bbgEXhtn
 ROlWtoIWP1RoRk3zdzuk81XhawNeEkZ72lgpdUYt0uP8DaeMbpjDTsgjjAo2v4hYQzFRJ
 JV0X07FBoBPqxqTIKK/j+9h0a0uX2PHBgsrLY5inPikmWAwtcA+CSCnVxjnxqRnM/zMoN
 OKi3bF1ZQZYjxXL66l2Rr4Vw/OMLU6ER8jcAMzMptQoppiuZneZDeZ6vDKHpel49OFQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95283400AF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D5BE78A5EB; Sat,  3 Oct 2026 15:52:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 105bd5db6b9afea00a6d7874be47e5ac3738bb38
X-Git-Newrev: c79f971fe3989c90dbd3631f19ddba955e822fba
X-Patchwork-Hint: ignore
Message-Id: <20261003155251.D5BE78A5EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-daphne: bump version to
 4.2.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c79f971fe3989c90dbd3631f19ddba955e822fba
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-daphne/python-daphne.hash | 4 ++--
 package/python-daphne/python-daphne.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-daphne/python-daphne.hash b/package/python-daphne/python-daphne.hash
index e0619c6463..fbafd0a199 100644
--- a/package/python-daphne/python-daphne.hash
+++ b/package/python-daphne/python-daphne.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/daphne/json
-md5  10ce77cd61e3b048bac7fe4539800f37  daphne-4.2.1.tar.gz
-sha256  5f898e700a1fda7addf1541d7c328606415e96a7bd768405f0463c312fcb31b3  daphne-4.2.1.tar.gz
+md5  2418ee7efc15d3ba3f44a05f78808929  daphne-4.2.3.tar.gz
+sha256  1c458f81926b37301cadc8ec1b6316d9a5db53fba061fc4826610395fe5d5c81  daphne-4.2.3.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-daphne/python-daphne.mk b/package/python-daphne/python-daphne.mk
index 69f5a9f466..065ac5e8f2 100644
--- a/package/python-daphne/python-daphne.mk
+++ b/package/python-daphne/python-daphne.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DAPHNE_VERSION = 4.2.1
+PYTHON_DAPHNE_VERSION = 4.2.3
 PYTHON_DAPHNE_SOURCE = daphne-$(PYTHON_DAPHNE_VERSION).tar.gz
-PYTHON_DAPHNE_SITE = https://files.pythonhosted.org/packages/cd/9d/322b605fdc03b963cf2d33943321c8f4405e8d82e698bf49d1eed1ca40c4
+PYTHON_DAPHNE_SITE = https://files.pythonhosted.org/packages/ed/23/81d442839029f3f343e536650ee49dbfb5a444520876fadb5b5f19f33c02
 PYTHON_DAPHNE_SETUP_TYPE = setuptools
 # https://github.com/django/daphne/blob/master/LICENSE
 PYTHON_DAPHNE_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
