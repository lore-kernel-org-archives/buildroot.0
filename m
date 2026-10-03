Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6539BCA5FE6
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 17:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1370B40B6E;
	Sat,  3 Oct 2026 17:47:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zZvQnaHWl1Wh; Sat,  3 Oct 2026 17:47:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 386CC40B56
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791049635;
	b=EzARoJPEIUXCyx80d4nnTaYyPsjEXIaTI9F77q/qsQjqOMUXQKtwfeuiIZQp9+v7l/ci
	 BJnC3sDqmQOLyXCcFycEr7p6GC9qKMX3mWFM9apphZXcHqVti8gtAjti2/ZF7tVJGXhBV
	 PaOBpQlSyN/js7A1bl0YuMvtWboXHPLGOiRDZpdqgWKVFprWSBI0pPKJRpoY3QPEkRYLi
	 5FJNCaXVaZQnbQffRKrrrA1JNnyARN3DEtHawk+PN0kp1Mneexq1lEVl8igS8v1h+ZDSm
	 bem+79Ni6c0phur+e4DIAEy/X5yxB/hHX4NTTquQoE4Z92phYPPqvC6I5EMhpZdbTew==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791049635;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=ibDAn5xlWFSJV20Xgm/8+vc7paWeRcCDpD8QMPJC4CQ=;
	b=tVsWza8CZL7hMMIp7VqWhNUCM2FXkpsLmhZ9vBke83heLadJtLDuA+jyNcImkJj2kiFT
	 UYw9YGzmHj677WFToRsfQYlW2nTsE2d8D9hwZbruGI1VpfkwWNH43JmwWA7ITvZM+g+aw
	 XT6S9rHUurQY19cfaTn+c+i57ACaN6zuHrJzBUeBAMYf85ZeyTmwlxABpHQCg8gAgt4du
	 yyUZsM7dkYVXRDDNGmJpDzYhYEXvm2OHdLvdZE8lxPipitb9cbym5uitzRkksr0tMk3OM
	 RmbdS54l4dKodexKjAVWLF2N8ABXRgBL06wrAcC0F6kX/CgfM4KjvL9ag2cJWdGLV7g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791049635;
	bh=ibDAn5xlWFSJV20Xgm/8+vc7paWeRcCDpD8QMPJC4CQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ka10O/laMbkZpQaqYvuCgzlWlkMAiBC/GMmbT3kaEc3CWYjgEaXg+ehlVwc1iFbzx
	 NBn9VgC9BrfEFRs/yik0gTh7AVJPFjrt0qf4fddSKt0BB3HTHrPPe4hr2oQzLyu5l5
	 2zrJ7gdx4FWDxdnU/p7S43n3QAa2Omd699mjaB5UQlchMz+P3RdxAoVcN0d9BcGOy7
	 ar2U0Fqbk9Ux3SGDTrjtZTP+tE4HZOfHDcM6dY/k7Ey82nBbC0oieVPZQoaoN3qBeC
	 b621QDcjdBWYKYqYw07SnOVUmkYuPBk/ZryWFjix5DFAcSgUKpN5K/gNDzlQOID6ZJ
	 sD5w2N8p+naVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 386CC40B56;
	Sat,  3 Oct 2026 17:47:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BD7C41D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF0F080C5D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:47:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XebQucffgiq6 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 17:47:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0DE8B802AD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791049633;
 b=C776ngUH0vsDHvthvl52scTqBWLyT12e4MPflVR2cFrk2SriAGT2ut3ErIdvpHwh1TDn
 eQ0pCIAQ7rJq/UjSsabVn/3p4WtxsecyBsHcr2Fxng8mmnFlnL6HW1HrgAhOd5q8U7+ZM
 PzUgWBq3xkJb2DtDAmpiJBmUKfGMDKh0iibWa+1QY0MzQVFmXMdCzWU507jcO5ENcQNsg
 KQSai0DL/iVkFUBP2NCaHU5t2prByMMhLQpcsW9QWLxGvMza6m6J7TDXxwHigZvMcniAe
 YbQ1uTzpUU9epVbMvp7ZHIdutgv5JWlwOk/7YhkK2CND0/biTHW2b50sWjbmZAko6Mw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791049633;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=DIF8B+tp+SGFqWTUy/yWWj1W53VbF6hBS5oI6s8SleE=;
 b=EEyYkZ34cALEbdXd+m+JatVXVNp2LBLyg4DEVlMxixZ1/qHa7jKMIlNKUk31uiGXDUm8
 cPxw259zMF6pECs0sa6AgPeb4CpC8f5pLh0nLwZNyPhl3leGJNtZNdeylpv0+jXxxHW0p
 hA0HXzcQkyLZfzplTQZIFkcMvIOiOYB5kY+L4uui5X8ahuYxi5PrV2RwTZINIJqmKcTFv
 zlnuhstEJ0CH7ejBy/KwdmTYKBUKSUpYc1u3yTZ4ePrWy9TLiQ1R3Qfae62zxRxQwdNfN
 XowXFzzxAeVRT3mbFaOdWbz21RzNzVVHH6w3WnKLz3Fgq6639V1blZoOqKM0WFEHdKQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DE8B802AD
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:47:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 37A4F8B523; Sat,  3 Oct 2026 17:45:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 19:46:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3010c801e36762a97c453cd7bd173bd02f4b6b6e
X-Git-Newrev: 875cc7bbf18f7878d9f32d3af9e02575703c3719
X-Patchwork-Hint: ignore
Message-Id: <20261003174558.37A4F8B523@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openjdk: CPE ID for openjdk
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
Content-Type: multipart/mixed; boundary="===============0958837144143350478=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0958837144143350478==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/875cc7bbf18f7878d9f32d3af9e02575703c3719
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The CPE ID on version 21.0.2 in NVD:
https://nvd.nist.gov/products/cpe/search/results?keyword=cpe:2.3:a:oracle:openjdk:21.0.2:*:*:*:*:*:*:*

The automatically generated OPENJDK_CPE_ID_VERSION cannot be used
because OPENJDK_VERSION includes a '+', e.g. "21.0.2+10". NVD will not
accept a version number with '+'.

Signed-off-by: Bjørn Damstedt Rasmussen <contact@bearware.dk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openjdk/openjdk.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index fbc860019c..e1d68e9a45 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -17,9 +17,14 @@ OPENJDK_VERSION_MAJOR = 17
 OPENJDK_VERSION_MINOR = 0.18
 OPENJDK_VERSION_BUILD = 8
 endif
+
 OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)+$(OPENJDK_VERSION_BUILD)
 OPENJDK_SITE = $(call github,openjdk,jdk$(OPENJDK_VERSION_MAJOR)u,jdk-$(OPENJDK_VERSION))
 
+OPENJDK_CPE_ID_VENDOR = oracle
+# Override automatic CPE ID because '+' in $(OPENJDK_VERSION) is not alphanumeric or ._-
+OPENJDK_CPE_ID_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)
+
 OPENJDK_LICENSE = GPL-2.0+ with exception
 OPENJDK_LICENSE_FILES = LICENSE
 OPENJDK_INSTALL_STAGING = YES

--===============0958837144143350478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0958837144143350478==--
