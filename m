Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05075C98304
	for <buildroot@archiver.kernel.org>; Wed, 23 Sep 2026 19:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5138E60DB8;
	Wed, 23 Sep 2026 19:32:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SFj_XIIPbmvQ; Wed, 23 Sep 2026 19:32:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 75E3360DA4
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790191953;
	b=araFmlGhgTbenyFWC65RO8uWMwlqPfJpO4mrhbXlAxGSxXbeRYq7ZORcFEWiih/N82MP
	 fjJdnXDaIaqo5KmTLt+tE/fxScmmOyctJkSinlEZCNB+MX6qr6LOXwosWfbohizoLtJXn
	 aBdPi1tfeqTxeKI85Q7B9xRmVAa/A34Yq00N9c+/ZVXpw9ae7jdI04bw8cFEGaoORv4X2
	 h41B7qMVHFiGAmegSK9cTbIaguQclral6TPyxoK2hfd2RdjnZl4bGsbXv8L8TEDDZ8aIh
	 temPudvlCV89ZwZHlveYk7MyxwrVpoA6p4dSRTXcKyNbX5uEtEmvL4tdsZ75O03tSvA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790191953;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QAEqrNZSzC7iM2LL29mXINJdB+ezRmF2rAMxySyT+Lg=;
	b=Fdft3M/ByPsTvxV4QSEaIDk6X1I8AH5RZD7a+Ts2cDvjHne0+DrwsN2kxUAZzWmVL/t1
	 1mL3Un3kSBptVOJyz9ThTSveG4IAFvVXD+Xw9yA33IkhV7HUDEICs5weg1Oco4V9KRksp
	 Ix2BRavupIjW838NDvINkCmu7Qg2sDjdrWMYAQ9kXPaxnOWWLH7MERQBOiA5xfZQvBLRm
	 iEbk17eFAnpbSy30Z5MaLs9RHiVfodvymgE4/7E9XIgpR33tQu6FoGJeFOK9Ps2y+Ka0p
	 zp3gU1x96TDzUZqFVgSpbRMYsp3TIpGdTdntQoSg+77Iw/iCS6wgP+zrB7sQ0SwtFBA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790191953;
	bh=QAEqrNZSzC7iM2LL29mXINJdB+ezRmF2rAMxySyT+Lg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OKrcAGDPAdm/51L4z0e6PW2+obtxks/SexsFgsOFaV5NcBZ9ElocHJW5mh/Mb1TQR
	 AOMYy7mbBSVLnq6P9xE740uZ5NUHM5zn67Fkgl3D5ZK5PgIKiwlNy4NBJP0zPQUS3e
	 yWc5ofpIv5VgbzGRRNoF9f+ftHpQpTUcOxV4eNoo9xTHcWaZp49PVW1RKo7S89MRtb
	 Mq/+m8xQfcPcxcqZ3y7op8eELPxqHvYowcqUlkG9/OX/egGXFsubrBwel0xX0/xoNg
	 RZUiWXL4j7gUyzWdOjF5TVs/os0kFGOZLvNEyoa4fIRIwJnFdyu1tgeJ/E0JEyON7m
	 bcurA++9STmCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75E3360DA4;
	Wed, 23 Sep 2026 19:32:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 65CA728C
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 19:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C2A040ED2
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 19:32:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jjzR5Sx8v4-J for <buildroot@buildroot.org>;
 Wed, 23 Sep 2026 19:32:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 54E7940BBE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790191950;
 b=Y79XWQCg3YTfhqGHPtSpF3x+RGBz5sFK57p7MLaWZdOUW1ZxfIukgst0ad/3yEA1k68W
 neug1ma6RFCxU5oTK0OnO32K5IRajihjAi+ThWYmxO/QLyrY5WJ5yulKoTlBXjBo0djuR
 eJclp54f/4NJB7rJyAKZZNFPzcwhEkNswdVMKtXtKWaWvYvqyEToenSbQPdo6ryyBW+V/
 iYZaAsGvShvoDmE9yOMIIdjbOic1BVJuYhG6q66N/itgoIWt705XA4D1Z5mUvo3hkDn28
 wLln8Q/CL5Wm9OV9dx9TSHC4kb4ju4Gb1naKbOzdn+flPqik8xVM9N7hAqY+rbuznHQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790191950;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=VMUta2NPz+9EM2iu58z86JHzS/g/UE0IB8oMy5mFIUc=;
 b=EhLBP6yLluf5YBgX5h5w1lw7/LIn/ElAvL5yyeNyMom76zU1LL2986J93wVlrQ2+ra8M
 RuSjWV3azSqYd6A/02JpDBLKQr9gQsgKjiEyQpKQlUamsJEcmvYK8K5Z5GuUSW6YBbaWN
 XggH63saY2gr633AkvelcgjC6YFSrCraeG781GfYOlTQcAci4DtFXsTOw8kWtOBw55XfH
 mlCWDyO3r4w+VSnjBIS/HYfCulRWC0uj1tt+U+rYyIlsP2Gtg2X6WyHobcoZ3ewh2xVuN
 V6KCyUxL3/0gbcAlOnlmVbXvYsYGxCPwdfOri4l+CWVhvD/MsyY1oZBSpMR6qHIUVOw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54E7940BBE
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 19:32:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6799D956E6; Wed, 23 Sep 2026 19:31:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 21:29:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 74fe3559d6d415d30833596afdb23586c95876e4
X-Git-Newrev: 67380a32f78ca09b4e302a92307de585b9ee18d7
X-Patchwork-Hint: ignore
Message-Id: <20260923193120.6799D956E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/expat: security bump version to
 2.8.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/67380a32f78ca09b4e302a92307de585b9ee18d7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/libexpat/libexpat/blob/R_2_8_5/expat/Changes
https://blog.hartwork.org/posts/expat-2-8-5-released/

Fixes CVE-2026-93990.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/expat/expat.hash | 4 ++--
 package/expat/expat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index d8b4eef2f9..262ad4bf0d 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,4 +1,4 @@
-# From https://github.com/libexpat/libexpat/releases/tag/R_2_8_4
-sha256  656ae1cc8da3b4ea513bb4e254f33e6243938084c0ec6239da873376b09985a7  expat-2.8.4.tar.xz
+# From https://github.com/libexpat/libexpat/releases/tag/R_2_8_5
+sha256  1e727b8933ec51a77a9a9d9afcf8e688bce45d907c13e36ab7393fe36e703182  expat-2.8.5.tar.xz
 # Locally calculated
 sha256  31b15de82aa19a845156169a17a5488bf597e561b2c318d159ed583139b25e87  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 1e5b738463..be4180992f 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.8.4
+EXPAT_VERSION = 2.8.5
 EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
