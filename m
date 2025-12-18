Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA47D68BDD
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 07:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 369C860BF9;
	Thu, 18 Dec 2025 07:41:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZOom_uux7tKQ; Thu, 18 Dec 2025 07:41:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C3B460B95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766043691;
	bh=Cmlzd1rSI7Wm8TGho2FFbWNopixp8HK8Tj9KtwZKvaI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AIbSKNXa8nW03ha0MIPJestpzyNwkQ0hMKgGmVoxCWo6IUxhfxZqTnwTlgY0u49uX
	 /LixRC4VV6/Qqew6/k7B+09sjXGgwizoVkhfvz8LUwXhNaB1gOBXQ29pTPQkpctcAt
	 ricoJ1gke1eglgufHg/95AdQ67y16vsj+u9EPOkkI7Y+I/nkXgYAGOXnlhZzetpJnt
	 qkKjVDIS5PlZKz6c0ZN1NFp97MqpX1t95uAUldP9zq8+rlhA3zqV5ZTrgml3S+rfV4
	 bZt9M4XTVx3dikstJRrknmiwBph0yjqh6z6SzitUrFJpHaFQWbuBeFqicowLBe5U8J
	 g7it0O+iyPh3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C3B460B95;
	Thu, 18 Dec 2025 07:41:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B69C2A2
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 07:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DCA140E92
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 07:41:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TMoXoi2jkdGt for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 07:41:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B8E040E84
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B8E040E84
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 07:41:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8B9E88711A; Thu, 18 Dec 2025 07:41:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Dec 2025 08:39:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d69dfb41e3290c8220a8c9891fb480e5b13ccf8
X-Git-Newrev: d5230e88a1d88e6aff26dac921eeeb3577986749
X-Patchwork-Hint: ignore
Message-Id: <20251218074129.8B9E88711A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/json-c: fix build with CMake 4
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

commit: https://git.buildroot.net/buildroot/commit/?id=d5230e88a1d88e6aff26dac921eeeb3577986749
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The build of host-json-c currently fails due to the move to CMake
4. However, we don't need to patch the problem, as we can instead
disable building the json-c applications (-DBUILD_APPS=OFF) for the
host variant like we already do for the target variant.

Fixes:

  https://autobuild.buildroot.net/results/dcf72922750a830901279e8eb8fc2def95d35e01/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/json-c/json-c.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
index 254b6fd838..20fa767c23 100644
--- a/package/json-c/json-c.mk
+++ b/package/json-c/json-c.mk
@@ -11,6 +11,7 @@ JSON_C_LICENSE = MIT
 JSON_C_LICENSE_FILES = COPYING
 JSON_C_CPE_ID_VENDOR = json-c
 JSON_C_CONF_OPTS = -DBUILD_APPS=OFF -DDISABLE_EXTRA_LIBS=ON
+HOST_JSON_C_CONF_OPTS = -DBUILD_APPS=OFF -DDISABLE_EXTRA_LIBS=ON
 
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
