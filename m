Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18811C624D3
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 17:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C48F46061C;
	Sat,  5 Sep 2026 17:07:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3xUQYZRk0ZpB; Sat,  5 Sep 2026 17:07:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 46B3060BFF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788628036;
	b=FcNdSjE8KFMUYx4AiQrQFqnIWnFWZeuSD0LyxZ9VsbiXjATiHhunmWmoKPMpCiSv/6Xx
	 zpFP2IsjtSF72VnXDtVxb01ZaFAH0lMkF0VN7LZ961qgXEu3PphVWJT76v1pZzHkQy8tr
	 m7CTjUMLG1L9168yPGen0MjeQIPkBVzjBoyX1Ojtv8t+l9tmnoH/B3b74HwWxLa3Sx2gn
	 77vKW5Og0kjDLysKeEhWztU3KZIOu/svjwHWAEo0XxER8lYxfiukqE2Kkr0NcPH77y8Bb
	 Bx3b9iB/UKTnLcUKMBjLWwDBMbP2dPQ17A5rHzE57Wn8mvZapy2unwvndTCfzr78ZVw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788628036;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=IYSuIV/WYFBvmFEGqlOi1Zb6GafDw72lbRgff35iqzI=;
	b=hGEC7Uc2C3Y2acpksy2BJMi7Sm7faR3rTVN6SFGqEdhzhSI/jkLkHdDwE7EjnoyHRs94
	 P52q/eiLqTyJY1B8Mpp+A+prPkRxgX65NMPc4lwo0UCD2N/mjz/4BJzpeUZeLCLdKzBfz
	 tQu4GQbnqd9xiykMGwODB3jB9lyJQS41H/1eOsveQUn7NuPjbbGLv4fWQihkPNYDqKrNz
	 nIzH6nRZHqye8olD3ApTGqlu+MRypFel8cuH5xHng0j8iNUBDwSqgjtEx6cv6qy1Ytrza
	 xuCANoCcOYkB6JyI6lrFUFHASY9M06sgTxUZ4a3anOkq6LOG3qsUISvnZe3H9BI2wJg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788628036;
	bh=IYSuIV/WYFBvmFEGqlOi1Zb6GafDw72lbRgff35iqzI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XqGwpQDIiHSCUZmn5KOduesk0Ca8heQbuDzsQVd4QhCNzkE2o3FyDEbzm3F6Qd4D1
	 npXXK4GkntWq9kjWmN77V9VTes0IXoqwDg5BR8OccJJfljmDpsm7BDn5Qq1r/39YHW
	 MrgZ2HBDuPUkC1CZ1ng3LJWFzWXSeUG3heK1TSRf3XFEQn814UEGOBvVI+SAx3dI2C
	 Zv+Gg1MEZKRpUzbdL3Kpr+G08E3UYbPadpsgJFkY8dJFlpOG7rWbs/THoA9HN+qOVI
	 cMou5IVpcG5P+gcf5lDbSobiAEcWwcsE8s2mUznYf6t8+CK0sXdaQGiX7UORfaqJ9D
	 6IF5yv9wOcA5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46B3060BFF;
	Sat,  5 Sep 2026 17:07:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 31BDA1F2E
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 292B181097
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ODxERJBDt6Mo for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 17:07:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 23002810A3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788628025;
 b=Dr7RAcP97A8Piy87jkV+5Vnx3xUGA1fbA4hRedLGtBSrEcaAIflmKsSkVPF6FUMuy1YV
 edjOqyjUxqLtS8y6zZcSyo9x7CB4cWmC7hHYSQd6d8QAWPIJN+BxVS2cdsFTjzExQjn3Q
 H96A9uOLd8CTBYTbiNLhL6XwTqX+SF3PTYSPP76r6wFkGEWdwwbR7VIF4QXZAZzS1Q/0N
 iCV0jPV/O5WME4SV/DfH7KR7k+KCYEhDLETGPuNfR+UCsedc70w2QHfU5leaXXgeXeKYf
 /Ibu0NV0frfet/f6ihjJpJVKLCcV4jpy/QXBgcPMvU/taUcBkGbw3vJb6mGFcevejUA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788628025;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=IDzgPqEqd+lrEUWi/Fv9Q1F9RUdEQa+s4dP2nRCmYag=;
 b=bf4eV+6IfbRrWXFfuazjCrM5ogcmHts0s2ZOAKevqH9/+6/Ez4gCnr2dorSVNlckBAEK
 svYjPXs2FdJzq0o9XKBJLmYl7Lh5mil5cV7OdSSwFyS5noGTAfHExq5rvupx65r9w1fMX
 JKPQkvrd9dL7+uCtRLeTb35S3PyeTl9fFvBSTd6XYgzTMrToSz6A264RzOdguU8R5BdS6
 xspzkkjU5mYEkniF9Phl64XzwKtR12BAj8JXrgIAplddBvyyrHaCxq74eVQNicoDVNZ8J
 swGp6fUb+NCf8aJEHYSj/Hygpj2DmOu6En8EBcTFOa+28MgIJiv9kvKtQ6E7/gpwstw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23002810A3
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 18A8395260; Sat,  5 Sep 2026 17:06:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Sep 2026 18:27:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b0a256dfc59990bec252530d081c11d82879fd9f
X-Git-Newrev: 173cfaf5a324bf7b46531084738e5d0b1e3044cd
X-Patchwork-Hint: ignore
Message-Id: <20260905170604.18A8395260@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luadbi-sqlite3: bump to version
 0.7.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/173cfaf5a324bf7b46531084738e5d0b1e3044cd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/luadbi-sqlite3/luadbi-sqlite3.hash | 2 +-
 package/luadbi-sqlite3/luadbi-sqlite3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luadbi-sqlite3/luadbi-sqlite3.hash b/package/luadbi-sqlite3/luadbi-sqlite3.hash
index 96f083dcb8..2f8f448101 100644
--- a/package/luadbi-sqlite3/luadbi-sqlite3.hash
+++ b/package/luadbi-sqlite3/luadbi-sqlite3.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  ab4b0b47614aa26c143da0e164476779bfdd406d263e0c4184a97d59f0430cdf  luadbi-sqlite3-0.7.3-1.src.rock
+sha256  a9a5ceedd4dd8b8e3556f16b868141ec540350efff61793043fb2a6ea55d19e8  luadbi-sqlite3-0.7.5-1.src.rock
 sha256  988d73cc2e56f972e8177091e084855fc2904d0fafcfe5c4e02864f25ce2b928  luadbi/COPYING
diff --git a/package/luadbi-sqlite3/luadbi-sqlite3.mk b/package/luadbi-sqlite3/luadbi-sqlite3.mk
index ea01671605..474cf39bbf 100644
--- a/package/luadbi-sqlite3/luadbi-sqlite3.mk
+++ b/package/luadbi-sqlite3/luadbi-sqlite3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUADBI_SQLITE3_VERSION = 0.7.3-1
+LUADBI_SQLITE3_VERSION = 0.7.5-1
 LUADBI_SQLITE3_SUBDIR = luadbi
 LUADBI_SQLITE3_LICENSE = MIT
 LUADBI_SQLITE3_LICENSE_FILES = $(LUADBI_SQLITE3_SUBDIR)/COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
