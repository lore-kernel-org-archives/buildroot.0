Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6A9CA601E
	for <buildroot@archiver.kernel.org>; Fri,  9 Oct 2026 19:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90586608B6;
	Fri,  9 Oct 2026 19:35:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MKh3l-kRtntI; Fri,  9 Oct 2026 19:35:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CEA83606F8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791574513;
	b=gO3ryCsBgoMpVL9hLxlS6pnIDaiGL8W2Uew2IawYwLWhpiijOah6XN8SAggQlpNLKTtN
	 UCWdiNLF2mGThm6Et8prAw/8maCSRx2dbVRjTiHZO0VMrDqEXWrR9agqT68f7Vew4RYIR
	 xvznjpWNPbZzo20lXoo4sRc/kTZP+dW2jOLJRAWez3piiLStHbSuIYOfcS6e86jup/WkP
	 /yQNwMZs3+CKDaBYo6W6JGZHni7ysCUwMdX49JL0+lCBMaas9DBfTaIa8JDKM0PyeqNGh
	 WPl50Dykj6Oj95e2rPs5PUjKFmsW37w9Z8RETeYMQ9my2/OixDoHnoh+WypRLTFigjg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791574513;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tVJ/9TB+p6npHeliUq0GksezZBYUNygpkry+oNrrGeU=;
	b=U+JNMtpI0NYEz/YfwreeHpqLrNhRjYMINggY1P8A47NAndLyWJxJKHwFjCoPgS1bRyuM
	 +uFS7MhKQs64MFH7IB50hRHG1aoJ+dG3Q6oR6NniO4KSSLaZ3XBjyftt8+lDjSVikWf6w
	 kVOxSaAKT+jP030Gt1rcqwRG26sMCq4445MCRAY0wOS/t49DcZr6lmufZWrlu1wH/k0sk
	 kIu7oDwx7srnWaJLvIoAnNs5Pxl9LGkVmEAqaY797GRZJOb5nOeie5bfBuN+9FF1llj0r
	 SU5jK01jrWQfQLvYd+xrEOKMvl4kRmPhUWkIWhaoLTWt1ASQ96F0feqa8Xt6rBhpOmA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791574513;
	bh=tVJ/9TB+p6npHeliUq0GksezZBYUNygpkry+oNrrGeU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=puIoIk2jUj/sLuRIbxTf1j4ackqqdR7E58aeZVydun19ELmMsXvXLKdCfg9vwuuku
	 W6M1NXpe2s8Wrj6LNKYjXVHwK4C6YiYPs/YP90ei3HMgrUPae/FqRBibUtLyBbzInh
	 CAHp6yGlfCTgAf58R6LLmkWA4gK+W9IJZ+0Y5r91fsfj3/HAUYYw6eOdcNiCBiJuqV
	 6e3+//6/8EVI/iuhknEeZyWI77O0LJOKo/FKFvoxeVYMggPR61jp/F9jMvu5TSNC7A
	 1tkZypfRLFsDK2n5FdjI2Lim7NqR3iD2a3E+Ml9PvTr18+yWa1j6Z6gvsycsOc3lRG
	 U4DF306vBtS7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEA83606F8;
	Fri,  9 Oct 2026 19:35:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EE733B4
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 19:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBA1B40080
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 19:35:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fCmJmDtWq7rX for <buildroot@buildroot.org>;
 Fri,  9 Oct 2026 19:35:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B33A940053
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791574510;
 b=tFDE/TuTJWBwNebP3ACYj5tCP821O5Wlgq3E9bNSCG7L7b/jBHjPGg0hWfkinRnB1BHx
 rdyPLx2pTE2Qz314MfTNoeTwhpip8L/NWd2ZsIPUzq8OjDYv5IqDKskT6xJmZDjrRH2cw
 X00fOWvEegtizuej9HFVnoDGOajf1QWJ2/vodTS7MtGdxNmu9VJbc3dpLS76cUM70PNA5
 ng0+5uck4IXYXutdDq9pr1rLHHhSYa0BdlRVs0hMqZwiQp9gCC9jPBbneLA9FMAsXKxDv
 Hey815qfJtUIHaT/8fPlLJM/gwn9tAFUfOf9x+NFP7pnV35abuVJps1Gnt/EyRfXH4A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791574510;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=pN7EyIbvBk9ccKzsQal9w4Mq1cEdvyzhTpaMQNxdQWM=;
 b=m6jdgQgBh56f82oQU22MOvgeZMZW48ReHGCTXCBIxO4L6phIGHn2Hj1qSblfIi4jg+Ul
 STPoS/Tj75bCdAZsDIgU1x9tWpLF4OndpnyatwRWxx/ZNIOB6h5Yv1zle3bMUYmiSrVgr
 a5g7KX5+w5U3LqyxdWGRXAkyEsNBrnp0jBVKNd4adeXh9e8SmL7CFYXPJkfPzfs9n3moA
 PejtCZDm5nhu9eK454KjaYwyiuo/PTU2339heL2Pjz5hyDJp9VfABXc91Vam7gpuIwSez
 n+V/UBIXSj6mqHALPv7YNLI0uCu1AEbPJ/H5SA5zzKBefZqbGfdC07Vk7Iybm7ixWGg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B33A940053
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 19:35:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DED1C8E0CC; Fri,  9 Oct 2026 19:33:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Oct 2026 21:33:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0522d9af895473a34c0a467e72e70d6d6e2a853e
X-Git-Newrev: 4bc6ffdfda9f77c304d084149b8814a854065346
X-Patchwork-Hint: ignore
Message-Id: <20261009193352.DED1C8E0CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iniparser: bump version to 4.3.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4bc6ffdfda9f77c304d084149b8814a854065346
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://gitlab.com/iniparser/iniparser/-/releases/v4.3.2

Bugfix releases. 4.3.1 fixes iniparser_dump_ini() repeating the
previous value for NULL values, fixes dictionary_new() not detecting a
failed calloc() of the key array, and documents values without a
section. 4.3.2 lessens the strictness of the version macro test. The
SONAME major version is unchanged.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/iniparser/iniparser.hash | 2 +-
 package/iniparser/iniparser.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iniparser/iniparser.hash b/package/iniparser/iniparser.hash
index 7d4ef52266..b20f9744d9 100644
--- a/package/iniparser/iniparser.hash
+++ b/package/iniparser/iniparser.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  7a339779ddb37fafbacbf73b176ce968ef9dc5146831b87aba80a18b68355ed4  iniparser-v4.3.0.tar.gz
+sha256  d7382f72f94649afa7a9d61346a7fc31cd3ff9ae389a71f92770133d49f1b22c  iniparser-v4.3.2.tar.gz
 sha256  da809b67f3cc571433b7b97d4253ae1f9d8817770aa859aad202df6bde1d5fde  LICENSE
diff --git a/package/iniparser/iniparser.mk b/package/iniparser/iniparser.mk
index 1a6fa3fe8b..0e4dbc3ede 100644
--- a/package/iniparser/iniparser.mk
+++ b/package/iniparser/iniparser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INIPARSER_VERSION = 4.3.0
+INIPARSER_VERSION = 4.3.2
 INIPARSER_SITE = https://gitlab.com/iniparser/iniparser/-/archive/v$(INIPARSER_VERSION)
 INIPARSER_SOURCE = iniparser-v$(INIPARSER_VERSION).tar.gz
 INIPARSER_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
