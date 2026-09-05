Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D823CC624D3
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 10:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B57781189;
	Sat,  5 Sep 2026 10:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sCeFFn7JxKsN; Sat,  5 Sep 2026 10:41:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5E843811A7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788604879;
	b=rJEB+h5Ftr8MmD8Z7OtoLDuqLEQpaYRVpimZETyaEHTUOxtfA3mqwGeeGHH2hdUi9iSb
	 beTYIz+jJDEjREx21Fh9x/Ih2Je46QrXBW6bgngpqB/gQOfH64kSxegSk4XQXCgk1poWQ
	 L5QggEabC2bZXWQeF4gkPm9xIWKtgNpdLQE1jSlKQ0thZ5nwVlUkUTsybfgrSTgpavu2m
	 lo2XJm4J/DeuGjTRQ85/Lsy7hvP/Ab7FaZstZjy+Itw1atHt9m6tK0PpDhZv1BPzSOBG0
	 ZQGa9aT+TIg31THbAZPlrLKkX7rBKKgPD8o4hytKUg4yP3oWwn/bTz4iYSPeDQ2vmhA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788604879;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=zbbYGGkuNeMcW0xEK7l9psMnu26HOZhpSWy+uCbZ9Uk=;
	b=OnnxWgQJU1UwXv/thPebPRu0xR/hpj4qSUpnzB2kezIuFSekTRE40leboRQDuibgUD6t
	 Kc2WmRlY56Ezij2qKFNorw/Bdcf92seC4yxexRVIpkMWdPXcoRruLvacXQmTnsyQwNmCX
	 wnLgYgphMBKiCAEGf8qwQHUjRVf0n1Q5ziJA7SaQ5394vKAIkbTtsGTWArxLhLZET98Wh
	 ZlEQ4E0Vpcn3JbKcPSdVPg9uUJt/SkB/+89mokG9tR6sWBM1Gs6UfSJFXevwtnTPjZYxJ
	 Y64o5eD+9a5NkzAD9spSdmt0+3eJ9bNYyBJIGNPMfppYKa03mYlta0RW0uNrACRD2gA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788604879;
	bh=zbbYGGkuNeMcW0xEK7l9psMnu26HOZhpSWy+uCbZ9Uk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=J1++r1C9DDkeAa93euWydHBQIqSKi37QEDqfS14H5SUCYsU2qoTJvNMU/O/mLRoQg
	 bBTXg01iQPNjPQO2NqLWCCnVkIA7mDkiDpD9NXgWXn8yLVaOuS5IPakVwkR7WeC117
	 HjFozHO1FOlhf1KhTmPM5hSrSWkt/V5n7LdbOJ2AvhTsJZ5vmQ9LKrX2Lc/YWJrE3D
	 ihwHqHSMvezPuhuDObl0ndTCbTJRVpi+ox4niVCvIDzZoKO2As2RxElpBCXTI/4tE8
	 skfIHpaGstCOpN3YTR9XlvrP2AiMVUY76WntFzpxFQtqyPMvaqVoiF4Eqj0PunK8Wh
	 YIDq9tYroa2Cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E843811A7;
	Sat,  5 Sep 2026 10:41:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EF707B88
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 10:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C91EB4053F
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 10:41:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id usYnnkzYw2AD for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 10:41:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org B180D40545
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788604875;
 b=RlJ6kQjPJPOo/MsCFweH0IpdgZIxaoepnzqLBztnsBl51nSuQTGCgFIcmWkUPHy1KuWK
 Qkp+uJgGLb6lfWdky43kmIQZTC2M08ZgUmK8jbVdC6cC3TJnmePgv1MglWWD5nbbjNonB
 8T961+9LgudN+WwaaLW/XfDXZvFzNqTpl+iaLfuCL4QrxDVKf2xQ1wCcF6JYmryFc4lKA
 3iG9FwpQR186kRFXNRhJ/SJx5AEqjw6vLZlL1jny1rlJ2WNMCPlUj7YN6wxyeE9EehW8x
 gRcejEMelHfTq/WtoVOdbsjdptRNWGGwP+qdMjUZf6vk0/ZHYnX1BtchZzN15Z3Sy+Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788604875;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=/E8u9qseA/rJiqhCntEpONc4+wmhQfEa3A/Z0W11BXU=;
 b=gUbUPtQedY0bqUFE4vuAnw/ppW68Q47qO937CTNP3Z2D0C6TcXu0zneKD6UT+EbqM99h
 whfdS4BOTXPjiksg1fnhzhFfBIbk+AH8ySA6z+6kQfsQgmUh3Akft4qgSjEiUI8W9BZJo
 nVHDhbn3jz3WKLYh0mukkG4Fy9q7dddPtTo7xVLYpwvEbgpReNd4/84bLuuKLzRxq1RQk
 Jhc1nK7KFZdsYagoDHWxqJ4Ox5wO7kskiKG9TvCKaER7b7sKPnqF+w/jRGbwhfYmuIylc
 mJfD5GrpLBfAAY8y1NtPSM5o6RYazffY3IlFmlQmV9DS+vXYP6QoFyOzCdsCvDw/1IQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B180D40545
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 10:41:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C55B97FB04; Sat,  5 Sep 2026 10:40:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Sep 2026 11:47:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 270ef20df15489ba9e5a1657b3ef24b14b1adb58
X-Git-Newrev: ab9097227c6665686b5b65526cb4e3ea084566a7
X-Patchwork-Hint: ignore
Message-Id: <20260905104014.C55B97FB04@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rrdtool: bump version to 1.11.0
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ab9097227c6665686b5b65526cb4e3ea084566a7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/oetiker/rrdtool-1.x/blob/v1.11.0/CHANGES

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/rrdtool/rrdtool.hash | 4 ++--
 package/rrdtool/rrdtool.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rrdtool/rrdtool.hash b/package/rrdtool/rrdtool.hash
index 85e894a642..72396586fd 100644
--- a/package/rrdtool/rrdtool.hash
+++ b/package/rrdtool/rrdtool.hash
@@ -1,5 +1,5 @@
-# From https://github.com/oetiker/rrdtool-1.x/releases/tag/v1.10.3
-sha256  843b7caa2a80a815d44ac5c65daa42920cb64586fe804e36d0bc0783554e0635  rrdtool-1.10.3.tar.gz
+# From https://github.com/oetiker/rrdtool-1.x/releases/tag/v1.11.0
+sha256  24c345b5c077c1b2b2fcbc1a364f1da051650fb6743ad5213096adc04c862ed4  rrdtool-1.11.0.tar.gz
 # Locally calculated
 sha256  ab6b4646e9e01f1ec287c29c351c886c4cb7f945c11efc0a1be9f6e5e6cc5320  COPYRIGHT
 sha256  d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388  LICENSE
diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
index f911d54623..3e2d234678 100644
--- a/package/rrdtool/rrdtool.mk
+++ b/package/rrdtool/rrdtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RRDTOOL_VERSION = 1.10.3
+RRDTOOL_VERSION = 1.11.0
 RRDTOOL_SITE = https://github.com/oetiker/rrdtool-1.x/releases/download/v$(RRDTOOL_VERSION)
 RRDTOOL_LICENSE = GPL-2.0+ with FLOSS license exceptions as explained in COPYRIGHT
 RRDTOOL_LICENSE_FILES = COPYRIGHT LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
