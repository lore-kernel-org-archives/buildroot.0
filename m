Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68FCCA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 08:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A3B560648;
	Sun, 11 Oct 2026 08:26:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Zsg-nBf_-ey; Sun, 11 Oct 2026 08:26:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5C33060631
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791707169;
	b=EFAuHi7hcpUxmMwwz5MskXICG2tX9R9gxkE+Ev34ZUgGDGKIGKIILuhu5H6MVHpqhxFv
	 PJwjZS7nWUxAjcFreMK8S9dSO0qkAOegoj7r1gKae04q/hx6mxm+IO+QbSvmkiCUFhETV
	 GgOzF21arSzxk+cvg3bq0nA7zJmwSZRoNUDYAu7Z59OT55SEycLA1ybmxOmfI/TGqaPPO
	 356wCARE7ciH8xcAa5r8hdUgf0vdinYRNSuqT4Cbszrm9dffCE5sLBXKwiKrwXtJKe3/O
	 Fu5rRyZQzRdA0j3v1FnY2rAmRCebKyvhyUMyLmxZPwLEJnyPCWuLrvAJsWkxTmYoZkA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791707169;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=xpbRvJMT5V13ORNv4joLeH85khS/meB7lQbCiBe8AhY=;
	b=PF3yt2JxbSTDovvEfZ8i9DyEdDBGVj0399u9GStMQW+5mD6Hj/fYSYsmeSU3KfufwYgG
	 zsolSgfs7QG1PrLowWgqQFrwN+v0pTZT4yZRVSI0C60emgIqhE8hM7OQRzVv94T7mfD4U
	 qYcCRG/zgaGFvNir8niFwpP5khTS79/G7YOOlbEWTHOvQPuopmJlQ4RtSgoDit1lOjY0W
	 Tf8xKrAl7AfEWHW98n41goalvhe3OmIpiGFIDyUpxyW08YW43OkCvcOReKdxvKeehsgv7
	 L2rQNxIjttdplCnBClUYqXbRJgPfRrbWAzF7Nfs1EdJwZjuLaeuHckBMP9uNxdFEaGA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791707169;
	bh=xpbRvJMT5V13ORNv4joLeH85khS/meB7lQbCiBe8AhY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qvG3CBJVEBr6bV/0tOcff5jC0mQPTGleYAB3aj4fwqytMWgZtabFGo9TEcQuq4zCC
	 lRw2DWaCguOS/Vje5unROukiejGdpetj7ReVyUOymHMeaXE7JzVq+EBGPv/CaZORBk
	 nPOwWgFDlURCcSmorsd149y1trM2d8FOJldwpjyi7VB/RopYjWjoMWG1nyq8lnSN0k
	 gVHAzJoFOMnjyiClDaPO4kI+yYMPOfD6bY0rfHaLboS0H0kQ66VJuTNwqc1GagvYED
	 wwDQD7pSkxjRDAmxRHLS2w8LaUvsy4G0fB/A07x1fzJwuBC6la0oKnAjzeXMVSvrEn
	 BIKq7xCQeBSIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C33060631;
	Sun, 11 Oct 2026 08:26:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 09A00235
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 08:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFDC380E83
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 08:26:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xDGwQhLvQAkQ for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 08:26:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1C30A80E82
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791707165;
 b=kfi4MEUnCOf/eFnoLwWQNqzohzHlt/nHMmPxtWb1fU87l61qpv4S5ThcR46rafV6ZaQu
 z0F1UGSM6l/hpggcDVyipCvM2nJCQooSeCGxWexxwQPSip/xtaUzXbp9blJUwYPBweUZl
 tzlTFsmlB7Tgo/oskX8WwnoUUXMUX+YaUWbY1gozumLOuG8mJ1HsoAFYt1Qaa6Xu39cL7
 +9GQRMs5DI1qox25h9CqO45ID1ccrCv3dbcLjF2bGJcdfO/IOo4HntT0moT6R99T2+a3c
 FqmX1EkiZQt1teuufLbiis+Vr67nmDid+61zOUQFCoTGUlXt9y4RHvqh6mvrmPTIS4A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791707165;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=S5Ad3V9feuiPPhlaw78FuZV16qTJV0YLIk9T8Io5IfY=;
 b=tC6uksydKUgIwgD1YTGJk6r00qEAzXi84hRtmIGD3B5c7UgNN7PvOLu7gipH864vSQ5t
 kHoQIqG637Dy0cvxVDeeTwDrr9svdAXusfqKoPD6vKuesOf2LUzffP7CEWfUoV4pP4qhY
 Qh3snzmQXmHNmh4xkVEjnusfG7K6yvOZtjiG1PrFUwnpbSJM6odVuU2mH25K6GCnkmR+I
 hEwNAFuyAgKa4Ia9tt25KrohOam+OyMXqanF2rgq5KswTTZdqRPs+5tHVnw5aH2cgS6Vj
 4xanldh5+6eWg455Le728wxXG9UEvvlkTrXxYyC6Vwzh2FaB+KIeP3AXKghjYpAbphw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C30A80E82
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 08:26:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 650F49358E; Sun, 11 Oct 2026 08:24:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 09:23:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 470faf4e6d75b1b55b766379f94912a493877948
X-Git-Newrev: 3ac595bdd199a2abfaf792cc5ce33d08fa9cd63a
X-Patchwork-Hint: ignore
Message-Id: <20261011082446.650F49358E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/checkpackagelib: remove unused
 variable
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3ac595bdd199a2abfaf792cc5ce33d08fa9cd63a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The `self.pending_patch` is set but unused.

Fixes: b00ac4e346 utils/checkpackagelib: add new check MissingCVEPatch
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 utils/checkpackagelib/lib_mk.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index eb5fbf474c..065733d464 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -130,7 +130,6 @@ class MissingCVEPatch(_CheckFunction):
     def check_patch_files(self):
         for patch_lineno, patch_name, patch_text in self.pending_patches:
             patch_file = self.package_dir / patch_name
-            self.pending_patch = None
 
             if not patch_file.is_file():
                 return ["{}:{}: patch file '{}' mentioned for ignored CVEs is missing"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
