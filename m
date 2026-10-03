Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BF7CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4D0360FA1;
	Sat,  3 Oct 2026 13:58:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cY1b92y1Z_K8; Sat,  3 Oct 2026 13:58:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9A42E60FA5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035887;
	b=idSUJz4Hla+KGgYPggCyTxPo28OTaah6ZcKbs4c0RWjYF0FCbGB6nEpqL1QF/LE/Wj8N
	 yYP4mtATPkZwu6AG1trPfVNEHLA3BsF4WdVxaLt/3EO2LxlZ7zQCnDFjo73gZILcQgDlS
	 dehLQ6No87dfCCbzJS6BB6nB47DXVNnEoXbtt4KZog+Ul0/jKpGcKuVgRXgl71xvTOpLn
	 YoHbG7lBG/utC4qD4t5TrPSHnrDBiTFyxAh9/K9oMaUM+x0+ZPpioYXLWpBaDAXm994Ay
	 pfLC6/Qqru6Z0V1ftZuoX71XDo2ncjIpp0vR8iH6VGXzxd5yphl6rnHeA3/+XgjWNgw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035887;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=onG+i1yvU88KKk+HzAlZ8AMFp342XL82/qOgvrwQ90k=;
	b=BwX3pLIs04a8aLsNFnK8t5fGWhMWZGBVndD7AhZDTT67/3ermW9zZXMlIP5hs3tL904A
	 1zD4VwQ5LLnflLMkUCxLSsJy5bOUFs8MlRxci380Fqkohjf0rc5L1tJpZ3K6O9BZwIpwl
	 g8/ogAy11iM1cMOBNIoPgGhCtfVt7qjKi6+RSya5M/JHYSSTik4q2tQnugbIn+DeN7hmU
	 JvVzjDwZJZwli8X7fYFsHrRA14QoHrX1ai7yXinL71LYeLOYa5oIPKCOBZMMlv5+d+Hc+
	 BYbZe8U1m8klR7VfoNTXYeTUdzz/D0kUuMI73NhF82+ECKJNdhQyl4/OtkD7KHZ341A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035887;
	bh=onG+i1yvU88KKk+HzAlZ8AMFp342XL82/qOgvrwQ90k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qPm6xaaZSYoB3u6UaxV2pbohhRPYFEhtmkL/1pmHc+ko41QKnYUW49WkTZqNOVuoW
	 i5tKSxlKWE+1KqBSHsVY2jUVps2gwUdZqgb0WcmWmF7ffn4rL3nOOzGs6kRqnmGb+k
	 UlEgka+yyTz2v7VVI7NJO9oX1tC17+03EF/f+wvaobZDS9mbqtzHeKhSXHZMMS3VVD
	 3GE2DbI5bV5o+zBFGxN57KvAZ7cmPYsAvJ5mE4ngwMQXaaerWvu9u1RoVbF5m4N/7v
	 E7WGmYdQ6q6oALxYESWKQfVo+yt7jFr9IMQIJejkWEMT4pGdIICSvH9SeqJxI+dqsO
	 rKqxmtd228phg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A42E60FA5;
	Sat,  3 Oct 2026 13:58:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CDA44A10
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B328E414CB
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mVWeh4y-cee1 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E647B414B6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035816;
 b=s/adR7pkeGh1TP6olYKBkBVEAD68NOG7ZzQ6mXNNIqy2Nhvs0HAj5nLs3pRY4a1CKcs1
 /054AcEn3Z77OJ5N7FZB+RWGLCFNi9XjZ4MlkI+cJwsQnVOHxFc+JHcMMWfA7Uwp2V5uN
 uzqqynVQ3Z57WFvzEZJ6SBFf85IoansUFe5bM73xpxTeywW7DhqxnZpQwWjzWcA4aHS/m
 PtSTm7WORZaAt6c5Ot7L+WOZFvR2P33UEFzwxT38YmF3CY8gv63g7xLuS4hXWQ5HniLEH
 IH+c2QPBh1AOU/yEuBkqJf5Nv60hdMB+39wVFT0iPYxWXyRuvK6SQbLRVQdRFx4m0DQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035816;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=XfKh7cPjWoO4Xq1qXxfmNhVsxNi7oWl8LF2aB0aT4s8=;
 b=UkS2ZAMGV9vX7QGIC2Oq0c/l3Ut8CTKUFMTYTpVfbSORBClr+cJEIzeqyl+jeh9holT7
 Gpl1bguCpP8VzGmcVFfX5OAGXzpjrTaL57KTmX62GG/XU29O218Y6DvfVRkWjh+X90vsv
 fyVLf/WC5M1Pr5pGIpqvQabPQU8tC2xgS7pQjhs9q6YlVphOHtZTpHcDvmCv+XBSN/JO7
 ekx1grpd87T94fqOWX0gcfVZejyed2gV6KYMHc1i0iJRtMnKMFR2t6T209+2nucgm8hzC
 Szd8h+mCktVYldvL75IsdhJMdq/q+aEPIym8v1H7HuhRhlyGqBGSmAGVVDVpzpPLbZw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E647B414B6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D56B88699; Sat,  3 Oct 2026 13:55:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:44:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5764b6893677086932ca6fa7595f413d3ac17b8f
X-Git-Newrev: e3abb7f05a47f425cd1d2ec26cfb027f8d02ff54
X-Patchwork-Hint: ignore
Message-Id: <20261003135542.3D56B88699@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-multidict: bump to version
 7.0.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e3abb7f05a47f425cd1d2ec26cfb027f8d02ff54
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update license hash due to the inclusion of the full Apache-2.0 license
text:
https://github.com/aio-libs/multidict/commit/19b465951efa17ed8a9ef1fb4837df82657b9843

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-multidict/python-multidict.hash | 6 +++---
 package/python-multidict/python-multidict.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-multidict/python-multidict.hash b/package/python-multidict/python-multidict.hash
index d2fe79e0ef..50a36404ea 100644
--- a/package/python-multidict/python-multidict.hash
+++ b/package/python-multidict/python-multidict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/multidict/json
-md5  aed0d99fa532a2b6570b88c900d60b99  multidict-6.7.1.tar.gz
-sha256  ec6652a1bee61c53a3e5776b6049172c53b6aaba34f18c9ad04f82712bac623d  multidict-6.7.1.tar.gz
+md5  efd429da40e56f8f5e8da04b381d7002  multidict-7.0.0.tar.gz
+sha256  a7fcd089a0af2e0ef053c0d39c22c9ebf2434dddcb91034fd2f59ec99623788e  multidict-7.0.0.tar.gz
 # Locally computed sha256 checksums
-sha256  93d11a968e2f0f36373c40811ff6d20e173f58c3cab5884cd6617bbfd795492a  LICENSE
+sha256  2e4be5fc6c4c72a466fcb665d726e049a6891981fe536c4f04b6366749461d23  LICENSE
diff --git a/package/python-multidict/python-multidict.mk b/package/python-multidict/python-multidict.mk
index dc92b653a1..f7db1ef314 100644
--- a/package/python-multidict/python-multidict.mk
+++ b/package/python-multidict/python-multidict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIDICT_VERSION = 6.7.1
+PYTHON_MULTIDICT_VERSION = 7.0.0
 PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
-PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/1a/c2/c2d94cbe6ac1753f3fc980da97b3d930efe1da3af3c9f5125354436c073d
+PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/c4/64/642465a4827331a98ba4ae29f97658be25d1bdcb868872a2f78f7482b507
 PYTHON_MULTIDICT_SETUP_TYPE = setuptools
 PYTHON_MULTIDICT_LICENSE = Apache-2.0
 PYTHON_MULTIDICT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
