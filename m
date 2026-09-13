Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59360C88E5A
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 10:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E170D80E38;
	Sun, 13 Sep 2026 10:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0rM_8R9AMibQ; Sun, 13 Sep 2026 10:35:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D2AB180E3A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789295716;
	b=KcZOEzH8jHmSu0RKgsyPyf463EFaySSCxp6nbw6riIpsOdUCWdpex2gIV4BAoAXO8xiq
	 1OJgoxitQwelyEsL0br2NsJcfFn/T27C34O7RdTjm7WIXltJWqYCJqzYWB+qI7rg1W0X4
	 3L49fGHb6+/PkD8KYfv+0VXOIpwAC6JJYNPfl2+VbD2eM2/zoFQCj1G44DU14DMHkv3QJ
	 Qi1i3bIHXOrXArVq6iUfK3UqhLNjMBZWXhDZvZBSb1rne/A8y64JzHTgokxsV1huahJ/C
	 0PaPXXSh1nKha8xWtkiouR+wpVmH/WsUjvyygGUyQjdcZM1oxb3VFicyfo7cXRaEpGA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789295716;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Tb4StudbfZ4ttUKjhrGzbgBokJWgxRq2AsM+M69BADE=;
	b=kb3TIF9e+IuMRri6K8+Dzf2Bc1sDDhmeIrTqXPNSA1vRlbgbqFIPl9IxNOuVR5662eFg
	 GE/7yqUWGOeM6QP6x3hTWrs4XhFnp7WQjfyGJhcfFlHUS1AoeP7NOZpXbN2IaPYtg3Eor
	 +EGLTEK77scBL1QS9BUBjrU0EF0mMzz80qHBAmTAgZ83YtW4VLAHidRH0/t555xBMDV4i
	 zGfUZ9nXi1FmJBiJgHgng2sWuTPVrtvXC0/7DKzMrn5CL4rUUTDmXuFfY3aCP6+lvPHCG
	 hJJ0qsHNONH2lOHsblSQf8W5q77aKJPsL0YH1ISesf7jiFGyfS6MqBRqVPXIzmYSCnw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789295715;
	bh=Tb4StudbfZ4ttUKjhrGzbgBokJWgxRq2AsM+M69BADE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Dr7nNNm8fcmmftyr04QSXIacJWZLtZy9DqKyoVvhHMGkHmUPXVKT51wcCF4TI9aK0
	 /jpJGzcpCvlyyBF+lFvVumUEQGQYhcmVFK9LtpbPQVL61PbmLL7ClEJNX1uf5Jqhea
	 H8gpnsia9tXmue7ICOI8fxQHXsNNjnYSkNfiEULbv3sx2BeOXQrt04JPiT38jonH5c
	 HQXGcQilWWxujC9QyHgqNhfkp/0CvlE3PbwgI7nYzEINKAdvzqTwcUUjg+cFLnCqFC
	 uVDl3Sg6GCEfYYD1ya5UmXd6j7wV6QC9QNJmIyxYc5MIzoR2jBl2V3rTSHgGIoNYuy
	 eOPCGI/pS6QlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2AB180E3A;
	Sun, 13 Sep 2026 10:35:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4470A29B
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 10:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35CBF60622
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 10:35:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IneF7Tl9xXJM for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 10:35:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 731676060C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789295714;
 b=Sz2lh22kAwtisqehgpep7X/X5L60pLSgzvKHlVEqbCj40XegkFv7V+2HHs0/MCSd9kWv
 9NDhopdjqWuIRFuRbpfrfP/3ff1Iw0p75RqfLoRYgXRHj3bXLw77G3XPIhZjU0NU/4YC6
 veNlEvPiEnuuc7x/QvJQkWVSmv0EIh0ybyH6ZzDjBq229CDSPfpRvTxM/x+Ry/bJz8LTZ
 lI2u/wtkB2AV8Y/5f2qY3l1YGgU2WYEQ5c0Emu2HD1fnEhuzsQVf1c+ESQROV4LjTREu9
 laPdK2WBCc8HXsy4FXP0ZtApxggvi44cyr3HuFRgxrN5hW68KFE3hHfDAm8qfb5xNww==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789295714;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=4nrFP9XnKhWWYOK2qkM6VbY2BdpscZx8Tgidf3HisDE=;
 b=YaT4APPvTLM/BVWjLIGT4HD7g4Gj9/VAwpL0vmOd/kgvMYsrE2YrHOMrWjdZ4l9vUX8J
 GIb+ziOnKOceo1dNn+Yffi79Hh8zvxb9Xt6Fnz9iJikWsVC1PFRgKMnFsjHc4UMCH0n1Z
 kyj5Gp3+NnrSDi1rM6ZUeSZk35WPtMphdnRvGi/WxPYgZq2FIpAb0P4rN0tyx9YMND9xw
 g7wn3XHg1r5/90lmb58L6mYyVVaYyEkOnve6/aA9XkiwjV4ccxH7yWncNGH26NV3Sn2CR
 BjkKEwLzrzBiNMkqePu145XItmEn4cf4VPW+kfGVJ3ya1EE7B9aL/hffpmHARXo1Xhw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 731676060C
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 10:35:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A141F95BC1; Sun, 13 Sep 2026 10:34:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 12:27:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: be60575e606cbadfcca99e819141d1ea8c501a17
X-Git-Newrev: 3ca5af794fcb54d457a4ce5525a9643d1117f8ae
X-Patchwork-Hint: ignore
Message-Id: <20260913103409.A141F95BC1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ruby: bump version to 4.0.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3ca5af794fcb54d457a4ce5525a9643d1117f8ae
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.ruby-lang.org/en/news/2026/07/14/ruby-4-0-6-released/
https://github.com/ruby/ruby/releases/tag/v4.0.6

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ruby/ruby.hash | 6 +++---
 package/ruby/ruby.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index 453c028d22..f62a3fadb0 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,6 +1,6 @@
-# https://www.ruby-lang.org/en/news/2026/05/20/ruby-4-0-5-released/
-sha256  5dc5521ea54c726e6cc10b1b5a0f4004b27b482e61c04c99aed79315e30895e5  ruby-4.0.5.tar.xz
-sha512  379d78a6d1af0455df60da46551f43438ad3ee81f83787554fc34cb1c8febb1bd363e3dc1a057b34a69f96526efc308d3dccc4b87d368897c2d1ccf179096463  ruby-4.0.5.tar.xz
+# From https://www.ruby-lang.org/en/news/2026/07/14/ruby-4-0-6-released/
+sha256  9c9d121fe3314ea7c801e690b9de981d2b9d12d7849db99c27482468a541ba0a  ruby-4.0.6.tar.xz
+sha512  c9c391675a098b5a27dd687571ab0a164c788cbb8ddcbab6d17a3e8b3c4ba389346b2e6d7807d38db3e74d225c70e378a296d60d0f465cb0fcec9702242c83c6  ruby-4.0.6.tar.xz
 
 # License files, Locally calculated
 sha256  a74812486cffbdc55141a5d9f165d782cbb202660d827622ec966237d4717b99  LEGAL
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index eae9db2156..bea1820f74 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 4.0
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).5
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).6
 RUBY_VERSION_EXT = 4.0.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
