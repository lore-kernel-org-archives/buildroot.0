Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77537CA5FA2
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 11:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4525180D73;
	Mon, 28 Sep 2026 11:36:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eL09uPJ1ySk0; Mon, 28 Sep 2026 11:36:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 60CB880D60
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790595392;
	b=BBZLJ16n8uEMsPSJPP2olR/Q6lF+wCPDULUoHlCSVvusqotash2sQ2wzIJClEZmESBs8
	 gw+qKKGnRWHy0NgaGTRuHT5fUoBOYThi1vuCw60xo+d9MBAFdYiVLTAa51E9KDyuLDWWI
	 6CTksF3ilNwvMne653BBBZtI61AZAIvIG5u6fmKrjbDoDde4eDXKi3UqPJ/+2NAILrY/W
	 cdFc4YqFN7mq8xW/U/nXS2u07Vaf7Ag+dNo7zQf3DPs4ivVbwKHmBhffTqIG2vqlg+XTF
	 7s5kwJrLoxZY8lY7zfBN0GTMk5u2ovybbNHl151IFuk/bCFg/8kKkjhN3Fks25e0Ugw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790595392;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=DLcNz6U1Bhlz4CXvpZyW3c/h8j4EG824DXbWns0mQKk=;
	b=bS1XX2dS7GAKHnFXRRv6hciNco55kRUzDkha7wQ9tZeMQWmCr0kEoZ/ebLBtC8z3t6wQ
	 Xz3SW03gKC6IwOlmplZZIIWt3hbyF8dbbmZX31UFimlBYEAh5sZFj3+oMgTawg+OFm2c5
	 5jKOUnIpds7eR16jJo25Yejn0uYOIlo1xxevbT98HlzJvoOxvGs4gTpupivk5l7TyqAh0
	 HQkcFeA4Dbf3pROSABcUCpacWsvd+URzv/OoZyBjldFjRAvY6fHueh+/GOQzQ0bzQkx57
	 PnmjHmK9GtB/Eu8VyY0mi1c1BMlnceTeqq6A3cQJ1VYoYRvjZP93Es8UaQVaP383gIQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790595392;
	bh=DLcNz6U1Bhlz4CXvpZyW3c/h8j4EG824DXbWns0mQKk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PfmrKEidGD4ww/RUF5AzIMuHa0iUAPnaaI4D/0zpHb3Dg2sWX5FCVqKUBy/Y4eOcZ
	 GzkayVjszmf7XfehNN6wtR/s4/EOgFo85GlqG2IM2fI7k2pdbY9xJiI23dEUCDR3Ec
	 +N6GKii9hZKjInb8aXfGMj9Nq3xX68WzosMDyEOElSAZPKr5jZQaDXLzT2dee7sd5E
	 Bp0bKrCnCyGoZmXeRU0s8KI10VshQeX9RniCC/b0kq/KImOJI6upBQhODvNkB/Z3RR
	 v1CtYK2i44uUB8qyQparQNFPlQ3qq5tln7ljhZP5ix7GaswU0WPxmAsHaF8/lq1x9i
	 XBXbe3cn+o5lw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60CB880D60;
	Mon, 28 Sep 2026 11:36:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AD49E24E
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B3AF60631
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:36:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FwE9sRh3neJB for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 11:36:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E4EA360601
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790595389;
 b=fSyFfzO72sYUJcpXlLYh5UBg4WIXZcHW/y/afZpY7i93HZL2pcS57p1eFM6JyiydTa/N
 6ecequORMs1J03l86rBUmkt7IF/Wk177HxQbYGy+J0TumlHMRnuLWo/PFiJu2wWMXPJ9m
 MJL81AaerbWnA0C8AWOvBozsJAe2WAzd7ihKlVCVxlJGwgsAgQL/Uke0+qRJ/wzsnYaBJ
 PeudcQKVN7PYV8topPwrXS1SV/go7znXz7TRcNKh9BCVnDIiHJzdpVkXun02MS2ttWXRG
 lfQkw0dDnAmH/r6XLtQ0YVl/acNLF/Upq6TXcBT6TWlmNGhDUpoil1HFiTFWse8OxzA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790595389;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=NrmzFl+M89EfmUdWUR+YJmZU6MxANxFXfArSjhJziQQ=;
 b=CCOTHelvrZJkFjfGaIvOj50VZjz8jYztaUFsJgJyoJ+tPkZaDUwbheQuOkkgpOh/vCZT
 BZ/xkt9rzNSvYyt05vz7lsGYi4KNVOQPw7gpQyg7e97w+FGlgMNkKZyv3VoZ9zSF/T26W
 sqG5C22Hsf1gCIDrFQ55q63tNyBQ0Z9DzSRTLiNznmyyXtljsWehHu6owtTHoj0y/kr5I
 urAQn2LbxRqMvWDWRKCruZ8EvnuwSRIdBcBqGfJqRV+OMfwJoach9r71MFHoMezlb53Hj
 xMS125l6zsJEvPasVbQ1RWmbsXwMKnUbPfvXyBXYuD/GwaVkO5HzdBSrkL2CkvluqXw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4EA360601
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:36:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B733B9830F; Mon, 28 Sep 2026 11:35:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Sep 2026 13:36:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 061a33b36a5887f3e1101de687b2b77ac6cbb198
X-Git-Newrev: 79e1d59d274cc22b86f9951a70357a71acd1619e
X-Patchwork-Hint: ignore
Message-Id: <20260928113517.B733B9830F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gloox: fix build with OpenSSL 4.0.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/79e1d59d274cc22b86f9951a70357a71acd1619e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../gloox/0001-Fix-build-with-OpenSSL-4.x.patch    | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/gloox/0001-Fix-build-with-OpenSSL-4.x.patch b/package/gloox/0001-Fix-build-with-OpenSSL-4.x.patch
new file mode 100644
index 0000000000..bae3319115
--- /dev/null
+++ b/package/gloox/0001-Fix-build-with-OpenSSL-4.x.patch
@@ -0,0 +1,43 @@
+From 69c49c945aa3847eb12a995f949d97a2a99642f6 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Wed, 9 Sep 2026 23:27:07 +0200
+Subject: [PATCH] Fix build with OpenSSL 4.x
+
+Upstream: dead
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/tlsopensslbase.cpp | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/tlsopensslbase.cpp b/src/tlsopensslbase.cpp
+index bfa1fd9..a71ff11 100644
+--- a/src/tlsopensslbase.cpp
++++ b/src/tlsopensslbase.cpp
+@@ -224,12 +224,12 @@ namespace gloox
+   int OpenSSLBase::ASN1Time2UnixTime( ASN1_TIME* time )
+   {
+     struct tm t;
+-    const char* str = reinterpret_cast<const char*>( time->data );
++    const char* str = reinterpret_cast<const char*>( ASN1_STRING_get0_data(time) );
+     size_t i = 0;
+ 
+     memset( &t, 0, sizeof(t) );
+ 
+-    if( time->type == V_ASN1_UTCTIME ) /* two digit year */
++    if( ASN1_STRING_type(time) == V_ASN1_UTCTIME ) /* two digit year */
+     {
+       t.tm_year = ( str[i++] - '0' ) * 10;
+       t.tm_year += ( str[i++] - '0' );
+@@ -237,7 +237,7 @@ namespace gloox
+       if( t.tm_year < 70 )
+         t.tm_year += 100;
+     }
+-    else if( time->type == V_ASN1_GENERALIZEDTIME ) /* four digit year */
++    else if( ASN1_STRING_type(time) == V_ASN1_GENERALIZEDTIME ) /* four digit year */
+     {
+       t.tm_year = ( str[i++] - '0' ) * 1000;
+       t.tm_year += ( str[i++] - '0' ) * 100;
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
