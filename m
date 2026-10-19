Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B113CCF2D6
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 08:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2903C80F74;
	Mon, 19 Oct 2026 08:37:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1VKvV6zwDTA5; Mon, 19 Oct 2026 08:37:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 40E9D80F6C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792399063;
	b=Yc3sCaCLQL7gLX6rNDLy2M8UE3oAFpDKJXasZOzMmWdVrB/0P91mD9BW34zYOoPkWVOZ
	 BiPArJs6xTLJ7V9Rvp/Qj0xogLprN9wNjE8V86ShF62tNnLm814Euiipu6zU99W2Lyl8g
	 I1nSIhgv1lyCXpNVW1mlHtin6GzBCbH3aqBeuDMXvrwZzH35SbOtcgelQK95syvNHx0C3
	 rRMOpVu5sUb5L03ma5UVVRMeRvIyLBwy1u3go1c5Tx7Js+CuIhkL9giBeT1MGU4f7WRsv
	 j3fZkfYzuEBn09BsgKEYvDuJXOIZBEy88+LtYhjFrcIulnXdErNWtdXinnwjZzHcKEg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792399063;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jiWylDjExnuBSXcZemUTAWGFBolSYnpWKEQHeqYhv0U=;
	b=hb98NztEY4IGL57euUxGTRMTHDHHsZz9F9VX6pRx05X/xUZaNk4hAqYlMOl9ftdXxHfX
	 SlrAmf6Naey0PGQquRb17cbF/BA+hRIegZFtS1IA1cP9S5X+gS2AuB9HVO7asTB2Jj7Xy
	 CA4+W9hsMMJIkHJNgGGacPPQJwiyTmNFCBlSz7kIFXsvd/foaq3nfsV9jnIFlvKGf2Fyu
	 a5T8OEWVgk/9+wjF23XRR27T0JEyDoeyP0h1sxiYK6rkp4+lIW9LOrWUbzdLWNzB5i5jk
	 FSeFCfVib9k/LlCJHTxunNF5db/N6JiWSBi77mDL5PfLGtVFHU/OTw91UcypixSSyyQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792399063;
	bh=jiWylDjExnuBSXcZemUTAWGFBolSYnpWKEQHeqYhv0U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=R/Zfl+OIIGwEwtBJOMKAvfddrP0LqqlXSeow8ssiXoUEffcz/oJIc5ez+TAcSWVW7
	 HQMe5Vw4D+zHoT6CRScXABSyaAR/+wPZlfufqia0lLN5B8PSvQWuJRPfJPzOHK+yzq
	 X+8XJZYF5+/3vYJdJayEO5ipf0fFKrNO4Iu/6H2jpiecgiMR8jmUh5+sTnPcUo+0df
	 8n9odUFzq6Sj3MxieHXeMQRtPNSTy4kXUqaMiqDc8gSGHOT/1f7nZGZXW38QVVLdId
	 BpXrIOsC8K8+POEKfGpdFjodiU1/2OXF+VIIm9wro6eEcVck4eB2QAmlLgf9PZZYa5
	 1MM2C/iai4AWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40E9D80F6C;
	Mon, 19 Oct 2026 08:37:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C75F1151A
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C41E74018B
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5q-hEfLHSDRp for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 08:37:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 108FA401EB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792399052;
 b=X9ehcdMgibN2AVLgLXMeMaG1bhBI06oV2i/RMOLTn3YSii62z8g6sOcafUhkZa3dc8rH
 FaaIKRgempv7m3BZ3RjKQAf9NTxVG0pWoXDn9Y+bzzR6OC9lgZ6iYE1eUu3rHgAwVmswB
 deHJ7/dHlH95islSXhpOASCiptzc9PL+3F7GAwN729O/ea8g2jA3C2tFhPL+GwYjsijiQ
 Xkav8qbCxwiXYbOUMjIdi5cO92u9q4EsBgYMRZq62jOzacnxGA4AYOKUxBRyXR3ilfwqW
 cTHDDX7QwNEPI6prZOIi4dpiGYumSy8mYlFKbBpWlEBhDmL/C1zf3wcT6ukpqV9MWTg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792399052;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=20eeWutYolMpKFAklgBxRqfVY3CdZpYO+L+jRMeLnGk=;
 b=pu7PjAmmOQPorXFNb9eQQ78+r5Hn1J1tO8XH4Ru4OJfdbrZuibNSKmQlcQueE/OhzebC
 hn0/o24di2AEYVdgFlJhf6p4uLtsYPUXfHfPeivpXtKb2+WEsvKPTnCNjV/XisqcuyhDL
 NcivAqLtmYC59MiSjvM0fPt+G+S8wxmFOfA4RdzNOyVNL+RGKZVetaMRrcYnxKLsxJ1W8
 yMdCxhTP3QeDUhoxCGM2XnYVS5ixg/A/tuufV4IRZShu2wCzj0v9G8bJsJ4mdINzByw5J
 Ai5kIdqilaG9QFpeg5KJMy+gWYTwDMJiEmlFeC+e9vB0pzkl+WzgVn01PF9lj3GnQ0Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 108FA401EB
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:37:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 89C96984AE; Mon, 19 Oct 2026 08:36:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 10:29:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 05a6a2cf3aa8ac119b7e5b61dbf550cbae0a066c
X-Git-Newrev: 2107d22b592616eb8f571536d0e34a16f5dc14eb
X-Patchwork-Hint: ignore
Message-Id: <20261019083609.89C96984AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-texttable: bump to version
 1.7.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2107d22b592616eb8f571536d0e34a16f5dc14eb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-texttable/python-texttable.hash | 4 ++--
 package/python-texttable/python-texttable.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-texttable/python-texttable.hash b/package/python-texttable/python-texttable.hash
index 628bf4bea2..880cc725d8 100644
--- a/package/python-texttable/python-texttable.hash
+++ b/package/python-texttable/python-texttable.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/texttable/json
-md5  fb024678d892bd42fec4a3907089d036  texttable-1.7.1.tar.gz
-sha256  ce71fc5928ede6cd7a60dbe3cb2845e6df8f5598fe435252ea1b31722415fda7  texttable-1.7.1.tar.gz
+md5  898e42e1a4bce44f9aaba321e6099725  texttable-1.7.2.tar.gz
+sha256  dc16ea6b35fbf5291ba6ef79d79e37d9b3ca6acd7bae3ca3450488d7c2e19c99  texttable-1.7.2.tar.gz
 # Locally computed sha256 checksums
 sha256  4ba7bdab54504a3bc44eb33ecca873a26a63ab902822101a87bb46235da63594  LICENSE
diff --git a/package/python-texttable/python-texttable.mk b/package/python-texttable/python-texttable.mk
index 5bb5b91684..221fa4fc7c 100644
--- a/package/python-texttable/python-texttable.mk
+++ b/package/python-texttable/python-texttable.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TEXTTABLE_VERSION = 1.7.1
+PYTHON_TEXTTABLE_VERSION = 1.7.2
 PYTHON_TEXTTABLE_SOURCE = texttable-$(PYTHON_TEXTTABLE_VERSION).tar.gz
-PYTHON_TEXTTABLE_SITE = https://files.pythonhosted.org/packages/72/c8/c926b35a849405ae0cb21956f8d7bd5e4f2c277c211784ed7d441df1b807
+PYTHON_TEXTTABLE_SITE = https://files.pythonhosted.org/packages/03/19/9590fd39a668ea0a0869493441fe65852246a3ec67616877baad98bcb039
 PYTHON_TEXTTABLE_SETUP_TYPE = setuptools
 PYTHON_TEXTTABLE_LICENSE = MIT
 PYTHON_TEXTTABLE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
