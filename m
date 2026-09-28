Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740ABCA5FA2
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 21:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41F7480AF5;
	Mon, 28 Sep 2026 21:16:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XoKHE0R62lMt; Mon, 28 Sep 2026 21:16:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5CA9080A9F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790630197;
	b=O2kWT5pthflFNpkHEzgXAov1Zvtx+Z8USJJlxRKVWx0uJW/3uPB6PM6cpSIbiWUgfUHE
	 5RxrH4hyaxwoIvTfOPWWNSQeHgLR/dpjiydX8xSBV2Zn7otXQI4YXkDnl1ikCmWSm+SJ7
	 IEfhKjo9USKGNNsTP5QibOYCxduOWH/9+LW1DTKPrI/udZIaH/hFt5+CdN1BfCFLx3hRX
	 AVe9JwdD2OXCMwwJziBbrb916+dqfaB1Z5Yx8KT66xpgFlm+46NgYpcKlj23ilH66FzQf
	 vP2HaZHCxvNaps80WRk7yazOkvH8BG111llqmQcwM6mbT+jhSWxDHHkmLI3YxugC7RA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790630197;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Wn1mTUo+Hma6vwgcw7Bv0XC2m80OTWDfJuM+F4H8rRI=;
	b=qGF1MmKClGkRQY0alvUZD52gHLrV34nUqvZAGQ7nvopGmHWzPDhvXy4kUGRxvCcsDZIU
	 P0vx85e/0dbDf5iJVv12O5s1/zqhZFIQRQXSYuMipEQUJr9cCTyQxF17ZqnLZ9WIXHNGZ
	 D7FPjkYpdNgszjIfY+fGOGgbNdtc6n/HBdkOgCoRz8YyDz3OyUNZ4zOkPrh6+Mo0EoU5u
	 Kh8OIGzlL2Q+6X7+/hZkEdzqfsomkECVYKrcCim+Bku3VmTGqN9SOiPsbBqtBM5dhXKYr
	 RjSql48jmzEW5iZANotbtoA8HOEdXYPcE7KW4qmn61+sFvLuK7nfKKBHRH7Eeez8pRQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790630197;
	bh=Wn1mTUo+Hma6vwgcw7Bv0XC2m80OTWDfJuM+F4H8rRI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KhaJJKQvN/fel257ivn1IBlza1AF+yIrxujPTImvY0JWcIxPDp6n+RJrMgE7ZELca
	 xoWzr3iLDskNzWADcnJ4YG7O+5x8CAu1uy8mED8/M21iFFi2B3mX2kjqVAWQJag71Q
	 17zmuGCy9iT3C3NJo3pmCLQzMVOH9NhM+sGwTHYFMY1bgYtZ6ZkdK+xiRVLJh6riIg
	 o5cfLOHMv+l74KpN5kG9s/T/ncFvWTzF/wfg2Pyy2TMnevThnDEY31Lz9M1lg9UqEy
	 Rnnl9fXMbRxvdvKZH2+AwdBdZeWz2dtxJsOjVjVtkxI14QbEtMyuXCGnUZYpuvCNgE
	 CXZ8xcp9Bgp9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CA9080A9F;
	Mon, 28 Sep 2026 21:16:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 122CF3D8
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EBA3D4052E
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:16:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FlB7Fmtty-Dk for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 21:16:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 47F0440528
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790630195;
 b=JbGWyUOGM7uURqKeY+nuwFpIhqPwyJS88rQ4ENmwkD8aExRT7Zvy0tCdHgpumz6mBH3/
 dXt2qBmR2Z90QdSj+VJs2NR9mmBGkO2KUz1pVZNBESKuJET9jGreKW2pOJUlQ7plyPZNk
 K+XCUWN9ZcADaJbX3yGV8iGxLeUYFRkibqxZDdpPAFnCChmS6UOSzXxIehAEsP/aTJHC4
 9dutqgH6jNo+s9IXH0rxxBP7JK5BF760reK/ViWXz+IMGeyGsr0sclhXJtYwlCJoPZ6ds
 BE1ef/myKW1sJehAWmx78HhwL1Hx8W5KZnDjT3xxweQAsKCrE+9cgHweHQ+lrZKXMoQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790630195;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=XLdNbqpcsuV85JN8D4GlDYUpH3/5dcgvzuEt5QTeX8E=;
 b=Y5DjtTLTinScIIgOrTOix8eDhiFM+JjjczEwXbivJden/KBe4z88lp6ZKMfKD1TMudGM
 IdcNfQmrE31wPek5z/6I2SAJmDA6vEXWeagf4Lr7vCYlzctiAgJfhnS/+B/dFcd8/88YX
 ESLuakp/theomjVK8J5kDar9/eNuNZElH6iBh7/NV9gOy2n3CBIunRe9kJCyH7Re7XXjl
 2Nvp1FBgPOAc3DqMMhNwr6XVJZyCVHEEmRo2Z2+im4EC9BKqPiowdxWX7MALJ0jH2d90o
 hBffjw2wRhSku96q3Rs61Kh+WDYFPM1yiz+WvPOll4UbF85+tkg0pAKAK27YvhDXynw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47F0440528
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:16:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DBAFE983EA; Mon, 28 Sep 2026 21:15:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Sep 2026 23:16:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8b57f2f4215992fd9f53af92d15b507dd5d433fb
X-Git-Newrev: 79e6e2d88c52fe421205b6829e73a76ff964b4ad
X-Patchwork-Hint: ignore
Message-Id: <20260928211522.DBAFE983EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lpac: bump version to 2.3.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/79e6e2d88c52fe421205b6829e73a76ff964b4ad
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://github.com/estkme-group/lpac/releases/tag/v2.3.0

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lpac/lpac.hash | 2 +-
 package/lpac/lpac.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lpac/lpac.hash b/package/lpac/lpac.hash
index bf93ef245f..1b2b136bb0 100644
--- a/package/lpac/lpac.hash
+++ b/package/lpac/lpac.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  3d87080a625b10430eebb82f89e2d24e16a84a8435a9c40b3718fd88c82028ba  lpac-2.2.1.tar.gz
+sha256  661dffbd1e9e5732dab4a0bb0a9837d4906c8c66bd748bda262fe3e8d3e420f6  lpac-2.3.0.tar.gz
 sha256  8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef  src/LICENSE
 sha256  b673293d21e887eaa9b971696b33f0f9141839900c65c83e560afa469d291ba6  euicc/LICENSE
 sha256  163766832b15cc9c90d593216360c67af579b8b36932b297fca2aeb61544de2f  cjson/LICENSE
diff --git a/package/lpac/lpac.mk b/package/lpac/lpac.mk
index 36cd4d591d..50b7175ab0 100644
--- a/package/lpac/lpac.mk
+++ b/package/lpac/lpac.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LPAC_VERSION = 2.2.1
+LPAC_VERSION = 2.3.0
 LPAC_SITE = $(call github,estkme-group,lpac,v$(LPAC_VERSION))
 LPAC_LICENSE = LGPL-2.1+ (library), AGPL-3.0 (programs), MIT (cjson)
 LPAC_LICENSE_FILES = src/LICENSE euicc/LICENSE cjson/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
