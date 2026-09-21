Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B492C982ED
	for <buildroot@archiver.kernel.org>; Mon, 21 Sep 2026 17:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7F5560749;
	Mon, 21 Sep 2026 17:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fCzKCPUsStZ0; Mon, 21 Sep 2026 17:18:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 128776070E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790011096;
	b=HSqq1PoQA3ROEke4In+z6J7aZPZbjvS+n0QXd4BV2+ujoszKb1QjZm3spzZfQ/qsQ0zY
	 qwGJiOsAJ/ItTGFiC3/ZO0R+hojqt1fdyN6V0Td+eBXJqskEPNlJuS0BVkNCXvyb8IEIL
	 fytmXsN61QoiycgrAs8w2/p4zxle4BkWQHLOGVJAnKRmtpm89i9bgsX3bxYhCPf8BC57B
	 L6LqQXkHxyDSfowzGSeTbvPTFWI7JT1osdXWlvUwJwWjQoPVKQ+4g2LvhMBZLbXla7iAF
	 Tk/EzL/BodfDBKxK3JroEeq4UwJ2qr/lkaG0ohyD2i8gMiku+w4F152ehK2071nAx6g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790011096;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=mGVN6ZTksqnSU/iXuamiov8QE/06cpQDtrjNMsUpX1c=;
	b=fUwidQWwYzNtC3X61RNJp0xpGvty6fDDk6RINeMZhDdXI2RBsXgM4x6POJAdE3FLRHQ0
	 YpRSQAqxAlRTrS4vrFgxQxuQuxUes9EfJhmni3GM1rp785cMJdkxpR2qGxgTrb6jIvxDw
	 XruULQvLPUXTfCPo1Cckg4f7XmA7un3W+QUL2+aAPp72ujFNOwo4GYTyqHi4fjeLxZWSz
	 qesQXvBMT2UQ8J0KqMKi9CeLIzLklxmJkrgf/UOFigJPJKqDdK2iMgbbIQJMbX6GU1UTA
	 5qu2LFj/b/mxQTSS7Cg5aTd7gM/unOknzv6aOF2Gzk7WGv8CNC6ztBmST2KgBFiAscA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790011096;
	bh=mGVN6ZTksqnSU/iXuamiov8QE/06cpQDtrjNMsUpX1c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mmzg8vYFQ+j2ryUdPjFJQojDyr9EnwU0C0FWGozpc98y0o5ku0EGn2/FRLVJAto7H
	 OjOad9rDTwhH+vZaNyndJ5yVbyEL4jO2K/g1mGG2uJRtSi0aaqy7jHCJ/Tngz7ymOg
	 /R4yTlCxLtuyHOB9OYVvbgJp6sW8A+tCH/hONkEZEPpc8kO0nqkK3/K+cJ6+odZHHv
	 gEouribB1/LV6TvN/6TA0lAgqQjJ4Xve2zdRoNzjKrV6hXK1n3yPpeevVNTLRNw73X
	 23AaxInB+xyRqbRrgbwek/ZT+629mY8Ryh8m1RWcdg1rSBgAUMzlSA6AHppzsPJl53
	 xudDOG3598pLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 128776070E;
	Mon, 21 Sep 2026 17:18:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CB7A32D4
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 17:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1D436070E
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 17:18:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ff5kV7ycABzE for <buildroot@buildroot.org>;
 Mon, 21 Sep 2026 17:18:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B32CE60684
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790011093;
 b=fKyMvCREyf3QJF14Y9+P4W6QCW2wvUAtfBRMSGX4Cd8tpohjLfQgNwgnNRd6NVWJtyP1
 DyNGDCvRCCCRddL+oBlaFxpAIaNPrWSXOjoQx1Mr0raniBSlzOX1K825WkFkvHP794jS0
 JnfCoxvZ47ssr7y4oz22aGq8gz+j/srdO51crJiAgqYIo4+wKh9A7uSmSGj9fPumXN1Al
 Gaj7Wj1e5apFQNfvvu5AcvvOviO9Vo2ZV1fZ0iv9v0LiLLmpfIX8SWWa+kopRPPwvb8ML
 kUEamjWquXgDpSzi0VY0Wv6q+X7SUGivMA/duJa+msV7fLA5Zj6w78gHeZUmANxUKvA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790011093;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=O7nSf+UOIicRl6IS1aQ0azr68lW9JC8J7svv00ImZXI=;
 b=e257i3YVTR/ZKRJMO2jLlxe4z8klvf5ChWoRjKPXkwK6QWgl9Raq9oQvxjWvDnilcrjC
 wI2oTV1VsoFgGgVFHUHDGMtuh3jLU6G1ltA7F2wXZJwCkxw+DjjfSXqhZqHsp/QlA04l0
 dxY0CpHUmCofB9JcOk/e2bA5TazbFpmUUggJ5M/vyKK24YjMDvyKV5wvNdJ3O1Jh4sZH8
 xMHoqOldG/vMxJTHSuPPTK9J/6pt2uRvdn4RGoTwjQtJbZhdCRzVnV+u1VZHZ4D6VXsT/
 /jTOKRiFzZN7G44F1Elp9UiCqi8y/dkJMqf11TjIaFVw0JS0LwKThyI5eEZR/o4fy+A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B32CE60684
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 17:18:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C4CB8935A7; Mon, 21 Sep 2026 17:17:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 21 Sep 2026 19:08:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 43de288bd1e11149068fe52595f56f33523e0159
X-Git-Newrev: e88c26904bbdc604eff0cf3029f41de943f1f9d5
X-Patchwork-Hint: ignore
Message-Id: <20260921171704.C4CB8935A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iniparser: bump version to 4.3.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e88c26904bbdc604eff0cf3029f41de943f1f9d5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://gitlab.com/iniparser/iniparser/-/releases/v4.3.0

Bugfix release: fixes stack-buffer-overflows in escape_value(),
iniparser_getseckeys(), iniparser_getsecnkeys() and
iniparser_dumpsection_ini(). Adds iniparser_load_buffer() to parse ini
data from memory and generates version number constants. The SONAME
major version is unchanged.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/iniparser/iniparser.hash | 2 +-
 package/iniparser/iniparser.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iniparser/iniparser.hash b/package/iniparser/iniparser.hash
index 27a5fa81aa..7d4ef52266 100644
--- a/package/iniparser/iniparser.hash
+++ b/package/iniparser/iniparser.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  67575ed032a544d5359610e5f697af786371bbc3eb01311218ef8adfd3e5e329  iniparser-v4.2.6.tar.gz
+sha256  7a339779ddb37fafbacbf73b176ce968ef9dc5146831b87aba80a18b68355ed4  iniparser-v4.3.0.tar.gz
 sha256  da809b67f3cc571433b7b97d4253ae1f9d8817770aa859aad202df6bde1d5fde  LICENSE
diff --git a/package/iniparser/iniparser.mk b/package/iniparser/iniparser.mk
index d5e4601d2b..1a6fa3fe8b 100644
--- a/package/iniparser/iniparser.mk
+++ b/package/iniparser/iniparser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INIPARSER_VERSION = 4.2.6
+INIPARSER_VERSION = 4.3.0
 INIPARSER_SITE = https://gitlab.com/iniparser/iniparser/-/archive/v$(INIPARSER_VERSION)
 INIPARSER_SOURCE = iniparser-v$(INIPARSER_VERSION).tar.gz
 INIPARSER_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
