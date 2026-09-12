Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC90C88E53
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 11:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BE4E40723;
	Sat, 12 Sep 2026 11:15:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 12Kq5GD4SbX3; Sat, 12 Sep 2026 11:15:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 75307406F7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789211757;
	b=Ud1biFqaqY88FJsokIQuK4CJ8N6nzxq4M8EIFauVvw1jfa6gZqflgT/jfQpiIAKIl4+P
	 mg73rcomOzML3cMVkxcVTWFgAOfstvsObqVbrvMx2Lwk4G/1mtMH+ZYuCyEyq5h0VIMth
	 ts4q99bXLXak6Ok0pI2zx8NGtDR7hryu0ev9Q2uM7M1VmS3iKZwTdKgMfmtXg491e2c4q
	 v9yC3D3Ybuz+4IcEGEn/scH2825NQkwkgDgISUN5weTlCwSvpcngLUoGObIXyEG0rAtL3
	 kxM8251dN0YLXuYjUVzpupDm1C4XzHIiTGU3ykceSnVYShyG7W0XVBxKVb08kwYhcUg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789211757;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=C9Lhfuvfegr0A3+8pIr6E+TSJpwsx/gQMtbarxeGo4w=;
	b=HsXRmvhOAzU7xsEMB0DzarE3Mjl9+uuBRRMyIxauw3d2UGntGczZRHYTAZF6c8mii0ms
	 rKtWfJqGTR//bXW3A1iktjyp3B013rRgd9yPnoYiyAWaYik1uZxLPG1irWvNEuB6WdiCD
	 gwxtIyAl4gM2tkP5i8ns8C3xy75dqsChvxE68ms8two2xHvICTiuYKzhQiRgA4P8imi8u
	 13Xbkj3BCpuFnJFWAora9S+6iUarb47H8PxWm1Tg9o0rEzqqQPcIWxZpSGIn/hqijbjws
	 rF8D9rlfQZ5hW/Rhr6f+GR3wyXfLCGNNyaZF3lH4pjihyYVmlvp5mwvRjxaXe1BKdXg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789211757;
	bh=C9Lhfuvfegr0A3+8pIr6E+TSJpwsx/gQMtbarxeGo4w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=evt8rXpGZG9oCIGNy90Qi8kvIWFGNQniCenLZvz6uQh6KoVLg8+7+OccDNgDwKI80
	 fEdBwl/zCfxhtfofLHH2oAb1mNadUhsfxU8dAPATwRXJmiaWFwQK6znG21asBxFB/3
	 MwefpR2Ya5bqKUwPUj0uszrwmFPzbDE/n44tb4RRN2ubhGkosdcF92Rj+t9bKtF6ZN
	 hrhjDrpO4+Omkr9RBsIYnnWZ2Mexno2uN8BdvejUxgugtN4Fk1oAKvpnXc1b3hV0Lk
	 xb6wXWepX8skrQbTYun2kbhieDMOnAPEvNsSaIwXNL7CN9IzT08xJKq+azsvb/xyy6
	 Fopw4fheNT3/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75307406F7;
	Sat, 12 Sep 2026 11:15:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 873D632F
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 11:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78BA140076
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 11:15:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nXMpY5id1V2P for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 11:15:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 7A5BB40068
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789211754;
 b=siSYXS6QhU3Qlmrd8lYwlU/CuFFFS7vz7mDAYrBZlwgahzCt/4Pgyz/STh46KDvViCAf
 hws7CV8eThS4lXVoalox6LiPvlgEsqdNTQnRAhSh0XNvlf0zjtwItUcQfkuxOvacFAuuu
 Jjj+sskCzjBdVqBPo9vuLwX0KOjzQGRiweSbByCaOJOesvLrA43ht/x/JQk6FHs4YaKbk
 I16EgsNXJwHuKihZEYC3jz1Tr9M8JVeUo1jDn5vxdNUnO5b6B8EqsFIsyf2MZvZjd1Z8X
 cCxupowZDKnmjfeiuSQ+t0M6PeOZruyaVkRj6i2r2NZx7QDDnlyqOfk360Fba9/GysQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789211754;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=qxhKl1DI9B2CYVbkBM7xuwx/lUgYbsAC5PSfqH1kTUc=;
 b=MpJ59900Ikb4TLvS5HUkaMqyNfuWtfu9FVmZgQLNNNSHcKrAVYUI78ZKzDnXvMU/IUGc
 ToZV20I6xbAVU/9ZKFk8aW0A8UEYVuA+0IQV3XS7AWf7zEZ//1wSlWhKwgOdRE+WvFuTZ
 8cQGwD9NmWsrH9P+gm2poqVhgYy5l72J92TQnDoOFLo3qp8fsE7jQZ4Yrj0jqu3GDk46I
 LQZ+iPUeTb5bhi5B/JgQP7SpUJ5zKzz3z7kNVOycOVFzrGxn7QQ6b/8Lto/1q1qf7z8fx
 qUWpDBOV4IQQLntuabpJRILknusYm02pcoObROKQzbcydKrXrGVduQg2Ax8GQu5sPjA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A5BB40068
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 11:15:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 23B7B8D265; Sat, 12 Sep 2026 11:14:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 12 Sep 2026 13:09:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d5f5eeaff46f44480a76b3175b273600ceb09969
X-Git-Newrev: 08b18e657105135517cf60c26864bfa907d06166
X-Patchwork-Hint: ignore
Message-Id: <20260912111450.23B7B8D265@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/meson: bump version to 1.12.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/08b18e657105135517cf60c26864bfa907d06166
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://mesonbuild.com/Release-notes-for-1-12-0.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index b2fff8974d..9c36164589 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
-# From https://github.com/mesonbuild/meson/releases/tag/1.11.1
-sha256  6788ae299979643f8d841bcaf64352558436cae45a0355148a3aeeccf7913866  meson-1.11.1.tar.gz
+# From https://github.com/mesonbuild/meson/releases/tag/1.12.0
+sha256  88afe0c20e52030218924ac37d0c81c59b4b5f3ae3752c8c6d7470c7d365886c  meson-1.12.0.tar.gz
 # Locally computed
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 0a61cc9c0b..cafbff4578 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 1.11.1
+MESON_VERSION = 1.12.0
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
