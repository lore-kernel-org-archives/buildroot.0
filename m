Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0FCC982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 19:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 028DB6065A;
	Fri, 18 Sep 2026 19:14:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PGFR0fFqA0aN; Fri, 18 Sep 2026 19:14:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0F2D860E15
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789758873;
	b=rnDJeQoBCfU5uq+pS1VEgx7rsIr26DMXbgZegrUWSJdhaTRJj/koBClsHQD4B3JnAEdv
	 0dKKjynz4VfTSmI3Rf3pIjy/XfgzUdYW3CcKFgziMor7Hh/eyUQ3+QhS/OB5O3ZVoSDJC
	 WMzTD5L7Xa9HvZDeHv7xnZXZ4icf05AkCEbfe+qpuNP59OftjGw9FwgzMdHOncopR1INl
	 DgkhlLtQ1aBvOKRJEnjNZuynnpDbll058VCCG7lejMLm4dTjeJSNM1gOIjQYTjrs7xpev
	 UngTgBiactRIGzpLmI1n+OQougRlJdtB8okGkFqUMnrtCVmfJCGycG8xCjeafFWGfPw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789758873;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZHz+KtYB9eOvPbrcWVHhjvxfSna1+R3W3nuV1KWbDpA=;
	b=FmXH0ZPbsrOiLE0vjbmMdRsZdHmSuDY+gGbIWcKVQ0kvrZm0I2LOHnYfXBkYDPbNyN6U
	 Bg++a09DD70KhU4vepTbVXTU42cSwT2gm/NscV54SKI3/U50P1OSTItyJLLcoHq8AQRpT
	 Gbr/Cs8Eay221NK3pjsuO+Q9Eu5msKQDQNwjT2hHfF3NtIWuBrwwwduclD7qfof/0GLAp
	 aQlvCafB9qJh1UYLVgRcHsrYyv7s6S22TxgmW0vEViG+vTQKlYhoY9RgFWISO2Yz39KLn
	 Ulp9cUht2Djulv77N1qEFO1Hm/Nvg7C8Rmh32WQn4YMmlqnxscvP5u107qnZukUCCsw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789758873;
	bh=ZHz+KtYB9eOvPbrcWVHhjvxfSna1+R3W3nuV1KWbDpA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fUF6935Q+9HVbEhdoPLpE8dNik+E9K1pI/HBvinm5EPY+9yVeqbzwNE5bSZT0BBB9
	 WMF5NDpXJnuYcPscQIW9LAEOHw06tNRgGzpZbuOxM/OGzXZd2kNZJYaYPrdroz2sty
	 DlPfmwdw6Dtj1A06Y0IQ5qffyviP6DnlPyNwHhcV02oz6xUR3SV8odieWnterKZN2q
	 BqAl3fnHr6eShIIsnL+iAN2lILBRssQQInSq8mbuxOZtjq3A77tJDa0Ktd2dV3H/V2
	 TzuBBQw8LsM6e5r6QpWWfVP/1Jb6LS7zaopIv+Jr6LLCsp4IGooeQefXWZmfF9j0lU
	 fzZQjsZx9ViPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F2D860E15;
	Fri, 18 Sep 2026 19:14:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 57ACD237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 499BB400F8
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:14:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id du9CeImg0VSI for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 19:14:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org A24744006F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789758870;
 b=pUHukqHlwmyyEKR1P7JeBs4+WN2vZI1Ca2HsBI66mpxQ85oYn26VSV7jA1CCTixeZbEd
 SiDescVZqrLK++1nM1LX4VAIeT9rUL9XXER4t491kn2XGW/L0QYYKmCbxgFZY4iEgwvjM
 xKkWlAGzeD+ve1CxqmRk6D8Pi5WR1wK7zr8BTv4rlSp4CSm8+6ZRIPQyiKufI/wwycddj
 vmi5FYpRC5CmYBGcNEm0t9oA2DDpv91s5arvqJR9BesrHCJ1PEHIewWca0Wdlr9savOuu
 vQ3Hi+jGwCI35aI26KT4cloCVpzzW5yiwUeJ7I+9jlW2u2cbt9aNL+07JR7DUFqx4tg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789758870;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=yaGjVXEkmA+VKntdwbHfVXS/9bQYK1QABzsrht23ylI=;
 b=o9gWIimlP/Pu+VJKoZAkbgLNd/fiThh+5RW0Aid5HtRkfF0hfUVyeifpDQyaxbR1y1Aw
 zKjOKLDQWyqEXNr4UxgEDX03iRBOYytQUc/mOAxGg8UCNrKbcXS72PpHvzkkFMchMtZoW
 taRyr4qqLKMYL3XSwTWj50JhTZFS4Ie5h1lm8X08FUTU4QwFux7bYGeGYNvjMBzd/I+Y9
 ihCjljeCRBrsOT3fr2C/0uVyBy19dpczJwJFaFi1sKmVatCvkS8GecoOpMLkcFsdhNzea
 jAH3laEFm8DJrbs+hK5elOipQC+AX5ZEpscHM++F7x1iNiabvkh5Mue130/dj5jLaQg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A24744006F
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:14:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D9D4976A5; Fri, 18 Sep 2026 19:13:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 21:07:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e59900428f540256721d37554948866e85b52727
X-Git-Newrev: a3164c837e1c9a9c56777138d161036ad403d452
X-Patchwork-Hint: ignore
Message-Id: <20260918191323.2D9D4976A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rpcbind: bump version to 1.3.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a3164c837e1c9a9c56777138d161036ad403d452
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog:
https://sourceforge.net/projects/rpcbind/files/rpcbind/1.3.1/1.3.1-Changelog/download

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rpcbind/rpcbind.hash | 6 +++---
 package/rpcbind/rpcbind.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/rpcbind/rpcbind.hash b/package/rpcbind/rpcbind.hash
index 3059751050..ab08688c49 100644
--- a/package/rpcbind/rpcbind.hash
+++ b/package/rpcbind/rpcbind.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/rpcbind/files/rpcbind/1.2.9/
-sha1  111058e312e0634f8bd23a783ea4f99912ced085  rpcbind-1.2.9.tar.bz2
+# From https://sourceforge.net/projects/rpcbind/files/rpcbind/1.3.1/
+sha1  17fc27ab73ae9d73a77324e9282fe601534c724c  rpcbind-1.3.1.tar.bz2
 
 # Locally computed:
-sha256  ce5f1a87c566ef0b2897a28f50a75c1dc23fec413a46a7f4183423b6b6aa991b  rpcbind-1.2.9.tar.bz2
+sha256  8e551b445f5172f8ef218845af342fb2a2d741b57ce8c777c781a01ea92f92a5  rpcbind-1.3.1.tar.bz2
 sha256  2b9477d2f4ab277b29702958f0058546edc120aae4b5fb8b8d1a9652104e1ba3  COPYING
diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
index 96025624ff..30030fdeba 100644
--- a/package/rpcbind/rpcbind.mk
+++ b/package/rpcbind/rpcbind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPCBIND_VERSION = 1.2.9
+RPCBIND_VERSION = 1.3.1
 RPCBIND_SITE = https://downloads.sourceforge.net/project/rpcbind/rpcbind/$(RPCBIND_VERSION)
 RPCBIND_SOURCE = rpcbind-$(RPCBIND_VERSION).tar.bz2
 RPCBIND_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
