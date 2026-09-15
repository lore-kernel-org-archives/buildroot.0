Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D30C88E7D
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 17:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91F8280A79;
	Tue, 15 Sep 2026 17:04:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uYe3jDs-XLQm; Tue, 15 Sep 2026 17:04:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 86D0080AD5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789491861;
	b=sAC/xcGYX9MY/2DjZxja/JDXZ3FXcluIOqjyX23XUqxb1drd0Gxe0XNiSWqXBTSle6Mm
	 uT/ygSR8ZyvDpDTwY0RqQUM4AOzgpaQJA/rCZ0D3jSx3cm054iXXmQ/kLCWmTJdDgOPC3
	 9uDGnV58vND6HE7jm873O7zqhzvNCRiz8ROFCHMk8zI7YhILwe5ipfMBnzyto8UOn7NLr
	 LC56kP67wsyd9JkNiNpL0Ro55xLCatMbqgs1hYSBYRRCCzFHgULrZRMo42gsOz6PDPeAr
	 dHrYoKSHoYV4ZGTV3qgjIPJO8qROut1MD6cw/tlW1/gzMQA5iABMIi38GzH+gjCkJgQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789491861;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tkZMXLvE5yZmTumaDRRLKZHNE1LGrwH5YNIFCXnIlis=;
	b=QONlOCvhflPpNzW7+hlXRXG+nUEzJfuU09PIwP4NflqecdCa9LQAHXdXrm3BZG9L7h6W
	 ZZj6iru+fJo7HZlCBNoR5A9o04k5eHckVhdxea3zaZLeG08nqoglIvcqZ0Pp6JLQFHqyG
	 0uP6/ktY5iNdAbYM1Lb/PUcfe0m+qNCSOCGa1aDXWfN96YMNsk2nkwd+4Ssgg7ZI43PDr
	 eVQnwurrqNEKSQgqcQfDMM72Auhs41BeX2kiKB4M+cqPYo8iwF1IEJ9d264ip6AApwaC+
	 nT/4BmuF1S0m1Z5FSh8FwsvMWydeCVAWsYfuIIue1mHK5gk37zWYZih1Jq9e8l8uyNg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789491861;
	bh=tkZMXLvE5yZmTumaDRRLKZHNE1LGrwH5YNIFCXnIlis=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=seeHvz3wEEIfq1I5OxhxgFD/ja6sBKh/R7fta5Bg6AqCvoOc/zDzFuvx0rpkowa8X
	 6gV3QPozzakHLyU5UkuvWJlXUnIdu6UyMMP6ruQgJH/ltEkmQRGsUqWydAWUq6VPxR
	 mK6+nmxTLepQ3qnAvXthATtFriMj49sQn6TUAiOXMxb/krYHI07F2LZ7C+pq1yB4mT
	 yGKEg0ONktvfajUtgyDvYiwcwrms2nHsDrklv/aAqq20XQqcHUb8Q1LHn1YV79jvCW
	 fMjr1srDzNzFecNv2yemjl3GpStts8KttlmaB9oH0mqoTmmRxYxEZhA6BnmD1W0P/v
	 NZlPpvqnUIkDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86D0080AD5;
	Tue, 15 Sep 2026 17:04:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FFB1DD7
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2BDF4055D
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:04:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KfT3wEUkjNFD for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 17:04:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B588840535
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789491856;
 b=YJr0CuKj0VeuLOOdQ6/UBVJrTQBZdJ4X1dcFnPMJTZSUl1cl/Y5vKdNVTddZfiwW25uj
 ithISJVimUyk5MrahE5BHefk64/oMvpqkbtZ7FXOBQUgw4KE2QeNB8lTrjR4LehrqFLhR
 Ov72f2syEyCw75/iSZ37soTYzkkaMLufn9D8OGkJmJMUyh4cCRhtRG+oZOtjYOCMj93kR
 ZiPj0WiTRKwbUzTki2g+uTFjst9YxRjhVxmLVMV226EsRxzWuzrTdH7tNCczADg3LODzA
 wcTh0bhHAZu9+65keVcnBMBF6P+O29ea7ih6iOa6qAun5EV3deNzSPHekdnbLENoa1w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789491856;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=u6kSw5L9ejxQ3fejckq7a5h6SsHOrYeEuTRuS5EX6iU=;
 b=PvSOy10aSGgVF/gcnHtHZiaklLEft3VbXqIKg1iSo0cjvkTWQcLQ+1hCKHcbEBJv8Rxs
 UafQHaKhiU5X348gT326Cv3fxPYwnUNEKo953AS4Y9j+4yRubdIY8i6NSFt//rClVSdva
 bBVeHDPkOO9wFzfxnQK//kcuOW89BKJ0yjnVBO/dMEccdQvmSPyMUJp8gJKTIcQ0pyVlA
 6lue0SbuCQdF7WzumAP3jjkYjNhZmaznY0YjmDtIhrDTKOjuibok7kIN2iMa3eNvi1GE3
 BTRDA+BKSNUwL4tefOo80SVOkqjAqdxvjHr8tU3uBSrpuEq/t9sKjsB7+s9qgUuzkyQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B588840535
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:04:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BEB9A95CEB; Tue, 15 Sep 2026 17:03:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Sep 2026 18:52:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 053c724d6efad1412f2a6c4b460b0f0c36517085
X-Git-Newrev: 7878630479ae26bcbac37c73f64e043f773ed171
X-Patchwork-Hint: ignore
Message-Id: <20260915170310.BEB9A95CEB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zabbix: update SITE
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7878630479ae26bcbac37c73f64e043f773ed171
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Zabbix version 7.2 is no longer maintained. The version 7.0 is the LTS
and the stable moved to 7.4 [1]. The source location moved from "stable"
to "oldstable" directory.

This error is present in the autobuilder since the 22nd of May.

[1] https://endoflife.date/zabbix

Fixes: https://autobuild.buildroot.org/results/636/636c4514c67f1b0fcd20976d064f17b0e0a314fe//
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/zabbix/zabbix.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
index caa69fda38..50bdfed609 100644
--- a/package/zabbix/zabbix.mk
+++ b/package/zabbix/zabbix.mk
@@ -6,7 +6,7 @@
 
 ZABBIX_VERSION_MAJOR = 7.2
 ZABBIX_VERSION = $(ZABBIX_VERSION_MAJOR).13
-ZABBIX_SITE = https://cdn.zabbix.com/zabbix/sources/stable/$(ZABBIX_VERSION_MAJOR)
+ZABBIX_SITE = https://cdn.zabbix.com/zabbix/sources/oldstable/$(ZABBIX_VERSION_MAJOR)
 ZABBIX_SELINUX_MODULES = zabbix
 ZABBIX_LICENSE = AGPL-3.0
 ZABBIX_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
