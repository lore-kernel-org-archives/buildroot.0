Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD27FA3755
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 22:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4993B40851;
	Fri,  2 Jan 2026 22:20:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ksgEFbSuiYwP; Fri,  2 Jan 2026 22:20:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9AF84074F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767392429;
	bh=6OUR0OGkp7/hzkJEz9AoiDlp7Cg8wWNy1ryqDD/fhuU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mLdL3Yg8ZwPcZC7SaUJ6Ffs6AfCnJreAqImliJhMJWGFeFuyZCL6KcxSFFsj1HH8K
	 fJL/rAA5HXj7dwT5Snw1cX8Oye+H8OI4nvtdgf7UJss1vhNnm5XgKMQ2NpyeYtLgfa
	 ykdqY8s0sgaXwN19FrQ/NSd9KJsp/fPLHfDwc3P6ZyzTGYgZlVHoatcK5XNadLVtJO
	 LVkYT9sMW0o11JlgpFbyMpkdyFYuS3UrKCaUZGkUuxt+M83lJ4t1dBVJLPW2BstA1+
	 kPsHxMBOmGc6UINkHgixMuY5+z6LYjCoR4jzi5IOM66bkwwqRE0WvR+dS9Y1bGHpBi
	 a97Za6aykfY9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9AF84074F;
	Fri,  2 Jan 2026 22:20:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E066249
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E717608F2
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:20:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hr-TwbU-JEmV for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 22:20:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C3581608D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3581608D4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C3581608D4
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:20:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0AF8EA4C2AA1
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 23:20:23 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52814)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbnVO-000000002F0-2lmq
 for buildroot@buildroot.org; Fri, 02 Jan 2026 22:20:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 23:20:22 +0100
Message-ID: <20260102222022.3464952-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767392423;
 bh=+kC8a+c61t5kLd4atQOkBhylEoN/rDJKs9FMW8/gDxc=;
 h=From:To:Subject:Date:From;
 b=mDipp0lAPeHBWw2BAfSmoaHFf0suU4zCSHyoUnhYcxiADllJGBWd7HcQVUGuS2qqq
 Out+34PCHn7z5srGASSvwRCUjqbwxB2k1m8gv178h5PnEVq06EbgSCoCQOkLXwV+bX
 02Iams/UDW+jVpwz0AbtbwxWVpzivu3925ORVnBZgdmpl+ErQm7+qy6E0fTyeD6UUJ
 7ANG4BtVK1GIiJ7UebcRc0boujYyAM8Agm70+kVAdyn9i556yiGrjGBFiWAsHKpNgz
 DoIqf6k3MHmfANvxFFqP8MUJwRFLU9LM5XRDUL82CmFx4Co6ZLRfbc0QPxImZ2hWt9
 w6djquqwL2J6A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=mDipp0lA
Subject: [Buildroot] [PATCH RFC 1/1] Config.in: remove experimental status
 of per-package SDK and target
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

The last buildroot commit mentioning "per-pack" dates back to 2024:

$ LC_ALL=C git log --graph --pretty=format:'%h - %d %s (%cr) <%an>' --abbrev-commit -- | grep per-pack | head -n 1
* aa3ba97554 -  package/mender-grubenv: Fix per-package building (1 year, 3 months ago) <Adam Duskett>

so it should be safe to say that enabling BR2_PER_PACKAGE_DIRECTORIES
is not considered experimental anymore.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in                     |  5 +----
 docs/manual/common-usage.adoc | 10 +++-------
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/Config.in b/Config.in
index d730f2034b..477db11f1c 100644
--- a/Config.in
+++ b/Config.in
@@ -788,7 +788,7 @@ config BR2_REPRODUCIBLE
 	  packages behave properly to ensure reproducibility.
 
 config BR2_PER_PACKAGE_DIRECTORIES
-	bool "Use per-package directories (experimental)"
+	bool "Use per-package directories"
 	help
 	  This option will change the build process of Buildroot
 	  package to use per-package target and host directories.
@@ -802,9 +802,6 @@ config BR2_PER_PACKAGE_DIRECTORIES
 
 	    - Enable top-level parallel build.
 
-	  This is labeled as an experimental feature, as not all
-	  packages behave properly with per-package directories.
-
 endmenu
 
 config BR2_TIME_BITS_64
diff --git a/docs/manual/common-usage.adoc b/docs/manual/common-usage.adoc
index 7437a7c3c0..dc8eddc4e2 100644
--- a/docs/manual/common-usage.adoc
+++ b/docs/manual/common-usage.adoc
@@ -402,9 +402,6 @@ utils/size-stats-compare -h
 === Top-level parallel build
 
 .Note
-This section deals with a very experimental feature, which is known to
-break even in some non-unusual situations. Use at your own risk.
-
 Buildroot has always been capable of using parallel build on a per
 package basis: each package is built by Buildroot using +make -jN+ (or
 the equivalent invocation for non-make-based build systems). The level
@@ -414,10 +411,9 @@ adjusted using the +BR2_JLEVEL+ configuration option.
 Until 2020.02, Buildroot was however building packages in a serial
 fashion: each package was built one after the other, without
 parallelization of the build between packages. As of 2020.02,
-Buildroot has experimental support for *top-level parallel build*,
-which allows some signicant build time savings by building packages
-that have no dependency relationship in parallel. This feature is
-however marked as experimental and is known not to work in some cases.
+Buildroot added support for *top-level parallel build*, which allows
+some signicant build time savings by building packages that have no
+dependency relationship in parallel.
 
 In order to use top-level parallel build, one must:
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
