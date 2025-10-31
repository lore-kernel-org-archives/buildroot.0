Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFC8CCFA02
	for <buildroot@archiver.kernel.org>; Fri, 31 Oct 2025 20:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84F7B41CA0;
	Fri, 31 Oct 2025 20:35:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UkMsNKvp4zx7; Fri, 31 Oct 2025 20:35:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4504241B55
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4504241B55;
	Fri, 31 Oct 2025 20:35:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A49691166
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 20:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95DDA84A34
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 20:35:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QmC0CdlQPq-H for <buildroot@buildroot.org>;
 Fri, 31 Oct 2025 20:35:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7490684A32
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7490684A32
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 20:35:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 70DDD835D0; Fri, 31 Oct 2025 20:35:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 31 Oct 2025 19:21:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c0f6d2379b67a65e78359118cb7d2025b13d85f
X-Git-Newrev: 6a20a930fd7a10aecd2b217a643a60a748eb986f
X-Patchwork-Hint: ignore
Message-Id: <20251031203513.70DDD835D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bind: enable parallel builds
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

commit: https://git.buildroot.net/buildroot/commit/?id=6a20a930fd7a10aecd2b217a643a60a748eb986f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit e4749b826c04cda213768332f67ffb82f06105b2 disabled
parallel builds back in 2016. Nearly 10 years and a "Complete rewrite
[of] the BIND 9 build system" later

https://gitlab.isc.org/isc-projects/bind9/-/commit/978c7b2e89aa37a7ddfe2f6b6ba12ce73dd04528

we enable parallel builds again, make -j1000 finished without problems.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bind/bind.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index d137245ef9..64cf2fa9fb 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -7,8 +7,6 @@
 BIND_VERSION = 9.18.33
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
-# bind does not support parallel builds.
-BIND_MAKE = $(MAKE1)
 BIND_INSTALL_STAGING = YES
 BIND_LICENSE = MPL-2.0
 BIND_LICENSE_FILES = COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
