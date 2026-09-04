Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9DFC79F82
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 18:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D96560B8F;
	Fri,  4 Sep 2026 18:41:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wx45fsjFW3mK; Fri,  4 Sep 2026 18:41:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AEEC360B86
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788547303;
	b=hC/sh7kpcdyg/2FT5WS0KT0FNWk30g4obh5KCa2jNGz4HrNiwuOHbG+OJE618GGHARKO
	 DzsELAmMvhDuccY3FRu8iFyp69CbogA7/DflQ+2A4AdnGItO6tOqgBbNM9ph/GTImwj4W
	 JPZgQRt+HKNzpLfFXUDBUEk97APVrAZQQD9SbBC/X8tmoeZHjCmBjg3zE+21iNYVL2eYT
	 2XAU85r8Bd01MciQiohdO+YUBX6G1mRz52n8Tj3paOJDmwnDT7Sh6bo8ZnL+5YwnFAaIW
	 gzG6rKwg9fmFMHRWDhljQZoVv08rxxlspV9a78Mx23LgwVsY8vDFruo3fPyotpum8KA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788547303;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=lJFzqDGDASYlAChcLRJHv5lwDA4CBhtV6fpgGUKHeNY=;
	b=C0PL7Z8r1O+c1C4A4/45rXlGRkc5HnqAFRNDDeb+ueeefd2FatAOl4coAss26HesYjVF
	 PRV9DNiVc80Fyu48szs+92esfHzMGceRIBKfHY0lBA0GDe2rWkChYKkeYR+cyPFllcON2
	 sCR4rdas+xbvFglT4vP5ONCD0aDQjVqNOgTT2mO5dqyLwviq3UAdvPRRzqNebEFka28pa
	 +IdeoCA+g9sbXHuX/LbRTuZmmEZTiPQkvo4TAWVPPdllkAhi9dqVeh7p25ww3QAbggEZ9
	 KqzGl/NSAK5pdvC2+QwVjAQR7rcuK8HSAGh2sbagyuZJNDKD2NVkU8mrq99e9EGJx2Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b="go/KLSEr";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788547303;
	bh=lJFzqDGDASYlAChcLRJHv5lwDA4CBhtV6fpgGUKHeNY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ki40uMlvpnO+9sWWw2dquy4QbcpkPTYobQ39TB/AJLpKKMqfKiN5h5D/BruhuhENb
	 UT2zXOG6+XSBn31+By6awyIbemLtRYZ4S5ZoeQzKOXT9XOwV5RQWNesNdgGHnv9Crx
	 6sc0p39zdVtw6y0jeyCkMNYsp1dJtB4RCHf4vvBI9CralZ2UqUG0wOWhCUVH1DaZWB
	 hZ+v2wjwrf4QENxHIN00sMXr3jrErkE4KLG/yNnfjb167qfktv8z3jbin7jq4ASYoP
	 3tgB54PbYkaP/bORtNkjBqySuxeJXBWEfE9I3J700Db6pT5xsUkyPrJvqDq7Dtalm4
	 utT4m9tEBl+SA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEEC360B86;
	Fri,  4 Sep 2026 18:41:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F74829B
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 18:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30D0560B86
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 18:41:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vISEWmgZUYsz for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 18:41:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org F1F64605EC
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788547301;
 b=eXt2Jx9VY8m7P6VInkH71TDZHIslfwwaGhxMUP9sCwoeI0db398xGXbJ8WCTQ/f0UN9r
 1eaMcm7f0al7/i7oAw8HFiPSHCwvsRKQ96zsB+h8eih4mU35gCm5aLmtbI1V5BuXQaYiK
 QH57vXoGOz3sdkMImA7bVOerWHWsIbFLx2dn6jT81f73HtyLAkYkiT7rN8lrNBEQ2B7Gl
 mT9RR778rgtLYullNrBqeJNadlroV4YhBajB60p5FkepY13ixu6BEVWQYMhAA6w/QSe6y
 p+TfMMwTLXO5RqDDsu6PHmxmmrjOySflMtkpFzHnylHaLXDFx2mbKmqsRn4BVwFZo8g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788547301;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=S+jShKYkcCAvQgdsXdXwW1hajcm+OGgeobyhNRrMroE=;
 b=phI7I1xMoQiuFQHctOD6UzwSKKnkQV9m2vu0dUiTimBubMyE/Y2Ppyul4Z1Rp78ujBJH
 DGLTxl9r9bM+QjDcelGhX0TgZ0N+uZ08kZCPiemi1BIonrM8a6XOdBhhJBexn4jlh9oDT
 GaGE9G/hnfiE2z75Qq5CDVznecthzifUQUktwSRGLNfnRRhuNnSIge2QhCFXy1ZJvyBez
 AvNxlygWPISdZ9tvP1GHXYoW2VUsi0oupxVsPFu6Q14rCwW5Qxqb3GEBHvWbZqt+JWH/T
 CC5k8p5aRbvZ2h5wK3jwrRMKWbKpRPhQNv0WuRQCZLgrsgTcL2nYS2E4lp7O9NDUS7w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="go/KLSEr"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=go/KLSEr
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F1F64605EC
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 18:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788547296;
 bh=S+jShKYkcCAvQgdsXdXwW1hajcm+OGgeobyhNRrMroE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=go/KLSErX6z/UI0JOBiLAUa7IDFdBUL9ncUy76Zr8QmVa2h2qMNn32bU9DBAECxha
 xENtG6Xj2Mkxb3kDh+z+z1VSVs+gMa3xBZXly7/BjGS2X1C+kEtlhwTm4JTZOQJZuT
 vjSqGEcMnTq/wW5jDHlPPxz8i3SYD47PUwv/zQL5vkTtO7w89ZWKvW14N66DlK1MZ9
 xAhWY2F+tTLY7mhsdmvnsaMLfcZMwM0T2HiEOEQbuWPpIIPbyyEzeX0r7mpUATh8/t
 ENpt0LvprfVB9l9QvSBADHFczLwHZX+aEbieAEkgRswypQejIcXMaI6cYDoudBKYbv
 I9MEPxuL0qudg==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2A73CA4C3377;
 Fri,  4 Sep 2026 20:41:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51846)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2Yr1-000000004rO-3lrv;
 Fri, 04 Sep 2026 18:41:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Fri,  4 Sep 2026 20:41:34 +0200
Message-ID: <20260904184135.875634-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260904184135.875634-1-bernd@kuhls.net>
References: <20260904184135.875634-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 2/3] package/libksba: bump to version 1.8.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/gpg/libksba/blob/libksba-1.8.1/NEWS
https://dev.gnupg.org/T8253

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/641bea0dd5838e2ecb955efdb4a17684a35deaef

 package/libksba/libksba.hash | 4 ++--
 package/libksba/libksba.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libksba/libksba.hash b/package/libksba/libksba.hash
index afb9e5756d..7179e01624 100644
--- a/package/libksba/libksba.hash
+++ b/package/libksba/libksba.hash
@@ -1,6 +1,6 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  789ca7db1b1dcb87bca3eb2f53d5e6729810e943  libksba-1.7.0.tar.bz2
-sha256  e1d3a5745911f5a663fddecf526541c4241052a9e4cafbc92dc7f4096c7efdac  libksba-1.7.0.tar.bz2
+sha1  5d24e4c3f9a59838e5c77aaf1346ed197a3df221  libksba-1.8.1.tar.bz2
+sha256  c2f84393011827219ae117131dba8e7684c2bed0961eed11b0642c2acba440b5  libksba-1.8.1.tar.bz2
 
 # Hash for license files:
 sha256  078dca2d4a2a5d19788b18dc05e039f7a63cb789f6f0b6f9e3fbe6284e6968bd  AUTHORS
diff --git a/package/libksba/libksba.mk b/package/libksba/libksba.mk
index 10ec0ab2d5..a16d78d8b0 100644
--- a/package/libksba/libksba.mk
+++ b/package/libksba/libksba.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBKSBA_VERSION = 1.7.0
+LIBKSBA_VERSION = 1.8.1
 LIBKSBA_SOURCE = libksba-$(LIBKSBA_VERSION).tar.bz2
 LIBKSBA_SITE = https://gnupg.org/ftp/gcrypt/libksba
 LIBKSBA_LICENSE = LGPL-3.0+ or GPL-2.0+ (library, headers), GPL-3.0+ (manual, tests, build system)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
