Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76FD4CA5FA3
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 21:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3855040519;
	Mon, 28 Sep 2026 21:23:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ha4LsQpV8iru; Mon, 28 Sep 2026 21:23:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4F86540509
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790630603;
	b=gLbZU5/9iG8tAy7LWQDtqmQDy0VJvRLS3BhzeM9Wz2ZGaVlwEUJMhauzakF+foRGTk6n
	 oj+oCQMKTJwgBWHmeOmacjy2uIxSLKIhKygDorJgyg0WKKOmiuPJHoCa24DE6xj58pfGE
	 S+LXEQLhFobiNeXNK5YDBKoknTS7V+XCT3o1qi0K85Hid1xI8zfWoeN7dVo/06AZ+3zSe
	 B1wtOGbUNrfn1LP96Nk+TBv/ieIF6hOvSIMkKjzYhNChn+Mqn/ZXew//gbp8KIdlY7cw9
	 u16IQskN5lrRc91uo2zl9GWb9TaMKRTE7rfPC+1W6Lpy10Ibb/TAPo6uNmqSEomF3+A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790630603;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=cosQa0rBc278ZllpdLiFpqwmThCRwWc5jGHZpjH1fmE=;
	b=TF0cDmWpN75RutPNySJsKhddWFIWnqhnoerCmSxGNU4GRhDelch5d8l71/RWIRmz2aop
	 33yAZFLQiV8wq1xESFMJML9QkPBWghGs0gdTONha9XfBzu72ePMrW/Ma1zeZ/7i6046oJ
	 ZwKd50n9+LU968C0OH9anPh+u1oPhDTNKenBCY4hacm9ts3i7sPXi2vS1h0iNti49LKmd
	 GuIh3NZBd9/B4MV9Hv7Nd/0BrbLJSwv+fOnVOtA+Zh5leVFJmNXN6lAU3c4vHBpZWgsd2
	 gmbpnHldnwBJ8V/fImqz9lQxFTG1Ns4be4H+AP3q+mFJfLz/wXbHNJbgP7dSv3eG6Ww==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790630603;
	bh=cosQa0rBc278ZllpdLiFpqwmThCRwWc5jGHZpjH1fmE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lkAfj00sAWxjLix5zhJpzvpXIBSQNSe5XWX+vgoipZ07KAlG9bxEWS99Ca1Sn4a3g
	 SRv5UGwhaYro31YcKVvARSaqyBkeArgAaxSwbz4CAZBGRkC4xlapsoXva3ovwKjWkn
	 MgMGJsI6uPDJJnDgsslA5XiPo2h3gi+VWX7s3D+58MaEumP9bDGRDVjqZqJ3iMBmuh
	 RY82s3d/uBHmQSM+OAGGLLSkHz9ahZKAjuxKF06JpjWQKpnPLGxNbTep0B29bW5clr
	 fk0wlEcT/GYE84fhuDtpmaPKDYUOXRPM2jYPApg2EmzE8y4OgKvl/+8sFbAmYFOt84
	 1CYw8C5vhDOpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F86540509;
	Mon, 28 Sep 2026 21:23:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 498D972
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3003660632
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:23:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bdlSEji2OQv2 for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 21:23:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8594B60607
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790630601;
 b=ZU20odF+z4KYWBcyDPF007DDLzRHuHwoBgI0N2A7n736SaEuh5uOalkzrYOrSL7SGbJp
 W9MUZo4iACcgts8ckeTBc7k4wF2uPEKj3drNPPYmjHZ0Vu9ShK4nuLzJ225Kao8B4pgSa
 dzEI9O9xFhB3ZOLJikSk5ugA1pPMzDq6r3+vRHTHUr4FQqHz2jkw6hkxahgny7eZDolRR
 uvQS0732Qpj9wkSx9lK2TiE74IelCxOWJi+ujBt26fYberHwEfr7bJ3WuHn4gHeSLZSig
 /wYwqQIWDlkj4pnJdWSjQzLO2UF+pHcuJCscpUAf4NkjzVaWIzksl8KaZM+tLi4NySQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790630601;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=7I5xqO7AWqSrX8NEIg+5lr3xpbDF+WLEaJoUVtvOP3I=;
 b=pE5tN6QJYQZbLs2isyKh1exZoOAoN+ntRrf6aiiRdP/kjXGkt1g+s3cEPED60M04E11T
 UQbeFBd5z49LLOockBKmF9y438RJ7RSJ8OzDnjK8WgAuRSsrMD0kIBUl6xtUmIqTrJBRD
 lJ/bJk4Kv/TRR5esgzvRNsK+WeJ7GDckyZYgkN/3mfvwjXSaeou71dSfJNYRY4TnaFEy9
 TQUBrCAC1oAD5slksuI7yP/weCJw7YUcjaFlAmpOQgnXEEWh+QY5hW42HDkF9kZTTppSc
 A50m4SLfdYQGGM1p0dz6d4aEuQmKXzH2R3C6fU7UTkHAFElUzqStHCGuVCewu5+LcWg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8594B60607
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:23:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E80791FED; Mon, 28 Sep 2026 21:22:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Sep 2026 23:22:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: af7fca093e3a0e6e9cd2061f3023f86e4bfaabf8
X-Git-Newrev: 59b5c3d2bb8992069d68a2a0c650a736a7bd9aa8
X-Patchwork-Hint: ignore
Message-Id: <20260928212209.1E80791FED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/less: bump to version 710
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/59b5c3d2bb8992069d68a2a0c650a736a7bd9aa8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For change log, see:
https://www.greenwoodsoftware.com/less/news.710.html

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/less/less.hash | 4 ++--
 package/less/less.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/less/less.hash b/package/less/less.hash
index 8d29dbc87d..eaa29514dd 100644
--- a/package/less/less.hash
+++ b/package/less/less.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
 # using DSA key AE27252BD6846E7D6EAE1DD6F153A7C833235259
-# https://www.greenwoodsoftware.com/less/less-704.sig
-sha256  20a0b0a2bb2525fa53c7eee9beb854b4c9cf172eabb209af7020743547bfe9fb  less-704.tar.gz
+# https://www.greenwoodsoftware.com/less/less-710.sig
+sha256  d1008fb78dcae1323ddab664bcb352a61f022b1b131bd8018548e021d975ec7a  less-710.tar.gz
 # Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/less/less.mk b/package/less/less.mk
index d8ffadb8d2..a43d7a2fa0 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LESS_VERSION = 704
+LESS_VERSION = 710
 LESS_SITE = http://www.greenwoodsoftware.com/less
 LESS_LICENSE = GPL-3.0+
 LESS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
