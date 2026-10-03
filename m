Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A784BCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E47141237;
	Sat,  3 Oct 2026 10:08:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CKSdIUcRCCGl; Sat,  3 Oct 2026 10:08:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 60C9941246
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022091;
	b=BliX7P7mmo+yHKe30yyydl1thKR5A78RzeR03/27oqPh8fXkyHyd+VS5PFDNf/QRS3Ij
	 epHTThMsoQl5RJBcIDR5pNyBOhJ5QZbx1MvUNhSYEiQ/TNlKm4stJuCuVuvk5Oanihdnn
	 mN8pN449nUEQqna3AmQEwu1QlW9rWlNk7J0NBtpv8hXKaePCRU2mmRyiR95AKtIRYWEjC
	 iZgb+osviniNCYOhI3CsVa96sErO/S0k2a7TU1G5VV9WphDKWUjYR3LEPas+DuJSjypfQ
	 bkoxH9e8EIFai5geTQPmToaZ9JT6FNey9WtpJUQV7jKlrIV6o5JHk05RBnfJMVrd6Cg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022091;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2NJYX/upNmhr89QscybUbVNfWa5Z33vaN/iGpsI5QPw=;
	b=qMENb9JYBmwpDPAVFcJ4aVo6EVJiWprGuVvZ/fMOEyegG7LlCIFAwsLJ+ZtDEeMn45Uo
	 tn2AqfWn6471DIBQOYnCW9NjS6wAjT4bFcNaQ/odVOhDjQ4iTtTBkPMw8mQNRVIcWo1hq
	 s+up7+yKNYQuuejVgG3lrOiO3hAK2wk8lpd3LONLiKCdYgCyxKDzs0MO8b/aOeGo75hEF
	 tkJg09ZujllmFRZJldUChxYgf9wwBk6u2INR+cahIPyW+/A9lf5YnypaLzUwBCY9VYeTF
	 PahSx8ANw8PW+JnxH/xIEfraVrvXAbWNiDRM41HH3WG22Zm7+w/D5GFfOzCoqr6bvdQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022091;
	bh=2NJYX/upNmhr89QscybUbVNfWa5Z33vaN/iGpsI5QPw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gb2xqOYcGmd+8uI1R5RgBrG1Nmz8WnX996qXWS/lvsJGL/XhaubVNQKeWXHPxrkxz
	 Ajp5Tg6gk39hdqdZlv20p9Ev9hJy2ctEZiFb5a1pxEM8PQm9EiKXNzsO4evkpqDYWS
	 +4f+IEX0fS7+OLUfu79HDcjnK3+/XJE08uTtIKCYCSQ6NE2bxxWna8nWyPBIJgoo6G
	 PNEgL2Blt2MDjl6DwKHcHQlNwcTvWhx3jDCYLR1FVtjjnA51389muiBhst8p6UfNsm
	 IsLm7c1iU2svf3jYXhHTOjfucYWWGarfsXtMS13i5igHJ2H7Es5dZe968OZHaVQ/F7
	 Y9Te2BWkeMiSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60C9941246;
	Sat,  3 Oct 2026 10:08:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 64B63335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55FE860E84
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XnsnU32l_Q8m for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:07:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7501360E92
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022029;
 b=KGALqJOyWKCSdNoDy1bowmr0TtLUFr9RMxBww1MGiimWrC6X8ksHCY8zaKGIPzlqehvy
 3ffj/4uf7npTSXFK+aTDOTT5o6k81rogrIOTqigredq/zQAOaLyorAKExIeB/hONZwuXC
 6O6i50Sd7frC8QXE4qB/6rJHlG1UlsV/XuCPQrB39v92o9p0HyA8mTIUPlTMpBvoedvH2
 hdjxx0Gx45uZHap4Pw5lXvsPK5Ar6ncAQ/5jBIkDwdEfb4cQ2mzL5TP8X0sKqH9HKGC/1
 fK0y/GUhdYN4hBHyii9w1sY23YYi3a12XF/ejXjqCCoS+txjXTT985gd9V2EEKx1L2A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022029;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=sy9bvhrcmbZZksLmIeXwZwHa67wuqv1ySY7VwllTUBg=;
 b=rzSJg1V4ijs1LGG1Y0ovRi4ucEnTCGW1OVCAyKfqIgr1f7iIOp9wQ1wsPrex6UyYTFXU
 4dqrr1QFGQCHZlBWe3Cjo7Gsp+a8Fo3G6LVlTaBqM03RoQSOOdYvrgbxAIwzZ0Naq7Cc7
 odttlMcUMfQQt97QkZaNRWlXH2OTRudrZGCDnZK1nzYd840SwIFWBZdmDQGRMaed5dXv1
 zSaPJm5y+I1sOXEwPEZ7FiLap8tLreTO35qsI/4/nutllGRdCgRTKDJT+509AIHL2dDiA
 2FrGIWc78j3KvU7VWAHi68PO/PJHcKKkb+vA8BlLZcUeIivrQr7r6+0NsmIjHi0AT1w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7501360E92
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D42F88875A; Sat,  3 Oct 2026 10:05:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:06:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 528d1585c9ffb7461c19e6ffa1114881b9977d6b
X-Git-Newrev: ed53d2bc9e36e06c1ef5c756761571af443188d8
X-Patchwork-Hint: ignore
Message-Id: <20261003100554.D42F88875A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyproj: bump to version
 3.8.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ed53d2bc9e36e06c1ef5c756761571af443188d8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyproj/python-pyproj.hash | 4 ++--
 package/python-pyproj/python-pyproj.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyproj/python-pyproj.hash b/package/python-pyproj/python-pyproj.hash
index e42c371469..541812b424 100644
--- a/package/python-pyproj/python-pyproj.hash
+++ b/package/python-pyproj/python-pyproj.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyproj/json
-md5  1c0501d6055ff26565dae8fe2e6083c5  pyproj-3.7.2.tar.gz
-sha256  39a0cf1ecc7e282d1d30f36594ebd55c9fae1fda8a2622cee5d100430628f88c  pyproj-3.7.2.tar.gz
+md5  bf9101fa60868513cfc0bf6bb9906f28  pyproj-3.8.0.tar.gz
+sha256  efa59725bba68bf97fa808b61302df32934acdceb6a5c92a8dd0e71dc266a876  pyproj-3.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a652687151814d4c4715445912fcb49e7e58f5b248d47a1a88b859a8815e0822  LICENSE
diff --git a/package/python-pyproj/python-pyproj.mk b/package/python-pyproj/python-pyproj.mk
index ccb5c659d0..e91aedd617 100644
--- a/package/python-pyproj/python-pyproj.mk
+++ b/package/python-pyproj/python-pyproj.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPROJ_VERSION = 3.7.2
+PYTHON_PYPROJ_VERSION = 3.8.0
 PYTHON_PYPROJ_SOURCE = pyproj-$(PYTHON_PYPROJ_VERSION).tar.gz
-PYTHON_PYPROJ_SITE = https://files.pythonhosted.org/packages/04/90/67bd7260b4ea9b8b20b4f58afef6c223ecb3abf368eb4ec5bc2cdef81b49
+PYTHON_PYPROJ_SITE = https://files.pythonhosted.org/packages/c8/29/6598570c90cbfc84ddefc3ccac4aa412bf51a527d72c74cc4fe64a5e6f24
 PYTHON_PYPROJ_SETUP_TYPE = setuptools
 PYTHON_PYPROJ_LICENSE = MIT
 PYTHON_PYPROJ_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
