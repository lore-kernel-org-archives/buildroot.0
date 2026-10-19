Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B969DCCF2DB
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 08:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 805C240715;
	Mon, 19 Oct 2026 08:37:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CpIYGARYAZUQ; Mon, 19 Oct 2026 08:37:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 975D94070C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792399066;
	b=czQKsQGRBPO0Sa5Ry/agnKvOSdf5y6azBDIq2S4kTm6kHOB0aBluSV5CEjubBQrjQDo9
	 pEIZY6OnVKtR1IXGspWZ6MlrSN2PL4iVkwzmX9TqkSL14FMLtLDUfglsuB5wPAxHfvZru
	 3ld+BLZw8/B6IsTBfgyEVwhrkVj6FwQKhe10Jp5BsrA4K6DAxt6EfDY77GjN+ktDY6ra1
	 sJUc6HZLPQwbpjtKUI+Xuu3C/waEjTwEXd3J4sq30osFbb10Vfh1MPGBc6V3OOnThvWfB
	 biCZUfQtzzJwyCkcNl1UAp/09D/ZCWTlbVFWTwUbXJXD0gk8BqdUfFFbb6YNUL5J7uA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792399066;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=1lyhYkzfFYRdCZ/VKA637NJ7QZQ7954efeXRKPpKrNg=;
	b=jxi0AuOc2M4TH/0zRIqzycxyGXv2vJyQzwduqoLNRk+ZNHOsyqS4HlwIp8iL8Hl4swDh
	 Oe9brkn0MYqDts6rM18d8EgYV3TAAmoSxcXVnWFVSCMLOFHRL1T/6BQ38h+x5nI04q+M3
	 06eigXB/3JcwS9xMk53wSAux5qEFx7AVyQNmhlgUfnIUPad5lnQL43P3QYRpIxESoUYOT
	 QgTls0qFmt7vaAChhxUMUZunb5M/YlwNrYbyvp9gv33Zun+FneZUHE+937g1IxYZQPes/
	 NFyS5ZAoGoRCIOLL8CvQFJPAp9ji2h2hojYLM6QB8x0Hg1PodMMLHyZHXhITdPFT4qw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792399066;
	bh=1lyhYkzfFYRdCZ/VKA637NJ7QZQ7954efeXRKPpKrNg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ma1o9cgauKXjT+n+Kr5Jl139egzWNcHywWkqT6I4a8WetdrQcMYEtifdkCpZQKlgy
	 fzgildqhEBoOPII+U/PfLBdy+b16g1mRDmviI1mhe++rZv+N+88MZQVWS7HIgfzDoM
	 t83qntacaQeI6wxhhgPI6oOO36u7xhGV7SvrOqQYJtsoBAu1AzaWTfUgEB6pX6Xju6
	 /W+VaU3EelLWBV79XaRX/DJ2bsm4yrY8tB4W2fvHeloro1m/PEx4CsttMSikjci3AZ
	 yLHkxvgm5y2y4ZU7HFfd4ocsWx1ONp15YYQ9dNo08H+tpqOmdmDXailXirpiMVQdbD
	 y5yYozGl2Kz4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 975D94070C;
	Mon, 19 Oct 2026 08:37:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D06731C64
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C153640062
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l2naaJohltsw for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 08:37:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 19F10401EC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792399052;
 b=UvMDFHdGlWs8VxI9VZf7yMDDbDGJl2CdUnYW+V2rTPQp7JeUQYwDn+ywFZZtxkC3/Zq4
 kTsv+qJ+lF8wgXuftXAzfQIgRJXgEm5mVT1oPkp0DK4QiuP0BhAgTlY9kvnaqqsUFpKG4
 aR6R78nrtrLSAzLQ7NmjPnkLFjEkOBw6p9QjUAomKq3YMNLd25sLf7ozJ217InqnQTS90
 o0k7HX6ymwtg96JwZPkOvsy9lHgak3j+70gaFYYBSAPdjt4SjVHTYG38Ff3qQG6gNbnVW
 BgpdRtWHdeY7SRC+hpDbDKtQ/kE5TyguEDAELEA/SKnmzqppRE19VX0UQlyLmWhmBaw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792399052;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=OnFcXugLWWmv37REtVYE+itBuIdFMzlUE8KbaXuaeWU=;
 b=iqMNNBlmhcL+NGQ6MEOkR+49xKBU64oK2uwx301H+dyKEwkg6vGb6cgAJAqlnefaGoyY
 uhfbAc0kjDrcQ5v7VaLGsJdkQ7PonISQWY7E5T3d1Nt3ygcTiajXq2b8OQHruYcPulbL6
 xksP5JbyTg2pVsDbE+UBu/8Ugb4k+uEKyQkG9SlnkOyJ6SZVzbts+vXR9QYbpFiofGToO
 OsdrbAelLtcGHqrf5PcOytv5f04qUx9o5wXdu0Wwfqc49BOkLNaYTQe9bHlFhkYXTJfZX
 7+wHLnwDx1VIlNet7m3NPayXqTah9kghh1Onzfhq5oPJL/zkpUr0K+RDYe6lcx8SLYw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19F10401EC
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:37:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 829D3984AD; Mon, 19 Oct 2026 08:36:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 10:29:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a6c5f4bf2e9794733ade18262712396000f9ae1c
X-Git-Newrev: 05a6a2cf3aa8ac119b7e5b61dbf550cbae0a066c
X-Patchwork-Hint: ignore
Message-Id: <20261019083609.829D3984AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-starlette: bump to version
 1.9.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/05a6a2cf3aa8ac119b7e5b61dbf550cbae0a066c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-starlette/python-starlette.hash | 4 ++--
 package/python-starlette/python-starlette.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
index b6b013ad17..1794b6b28b 100644
--- a/package/python-starlette/python-starlette.hash
+++ b/package/python-starlette/python-starlette.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/starlette/json
-md5  ed1e744017cf7bcd9097e0cf7c0f7578  starlette-1.8.0.tar.gz
-sha256  1565dc0b35d5737a271ed1e0e04e949f4e81198799f216d2667b0a0fb9cf9522  starlette-1.8.0.tar.gz
+md5  b5dd1c0ce8c69609544f47cdc76417c3  starlette-1.9.0.tar.gz
+sha256  3d931de246ed870e35ce605974440816ef895e592f255d1396cfdf191d4c4318  starlette-1.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index 4c94f1853a..d9fc4a221c 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_STARLETTE_VERSION = 1.8.0
+PYTHON_STARLETTE_VERSION = 1.9.0
 PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
-PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/e9/0c/6efb252d091ecccd7d62048ae11f0ea35cd75a4fbaeea5e30f9c3bf91d10
+PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/ad/eb/4e197bf26b023abafc5e9043ec8710d7de0fcb032d0969045236d72aa0b1
 PYTHON_STARLETTE_SETUP_TYPE = hatch
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
