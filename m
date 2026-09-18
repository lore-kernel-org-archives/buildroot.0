Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314D5C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 17:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2351812FF;
	Fri, 18 Sep 2026 17:53:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5WCqSBeZLBmp; Fri, 18 Sep 2026 17:53:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DF6B381303
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789753998;
	b=gWX85HWeBr5l5vHSieJzCeYOaeuwxf/mS23yTz9HYQUXoDxakf7Xgcj6PwxdDrtFKbj3
	 VnPIQoCBnTDoLWuWRps33VqZDBWv7bl9fqPTAvkLXMpKko8XYDd3mhJ5c/ng0+c0Nzy3+
	 DlQjbrCPMZ+7fpNa8HQXmGJ/RqEWaJ6fq6BT2emEskZPnXmCNrQ8+qD8GvbrpNkzd/++m
	 +p9y07RzsPQGAatPu7XJ9QZUj8F383AYg940H1RR90VIgVXQ8JzTLaBrlec3YQ1ZKoY8j
	 MPAMm7a0eAAedwrQ689fkF33otyMqgBqXH+Cmc2uJvEkQKc/H6G/XwFOqOuUbrMMqJw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789753998;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=roYxvm3Dd18zWlF/1R9EflUhWvQtxKHejptyX/YTiLc=;
	b=JPzDrL2jy3OpHJIaAAXhQm8S0lUgOgRJWXY4IWoV+lIBU1OMMGHSBQBStTMJlf9keQJk
	 okz/gn3hJqWoOIbqyIldioHbSBf33ESGB7Q4uq8am3HSZLgfiY+HkJjofnnZbFcTnouJS
	 MATmQWhNTmObAVHS8lQafz/3HDZXUE5ql9a8hlhj4l+666Uy5vf15oxmavyqaWOG9hb16
	 vZai3OoR7jVj7zmsvl/0FROu/xeIAxDanuF8SGO7cLN5fJwsoXW2ZpweDZlUv00LymdV9
	 Sqowy39yY2r8O3cqMSLigtlmmmNgIioe+kOj8luLKnKlSQYDY0rERAVfITLselMHIFw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789753998;
	bh=roYxvm3Dd18zWlF/1R9EflUhWvQtxKHejptyX/YTiLc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JTdg4ADBOQjMQSxIZmDO7K27kX6WyF6zAWgRuTOZEokWUvKlGIeLxmC6uhkaA9xc3
	 IzlMmJa+cOykGqckt93SLQdfyqGV2W+1F9xsXJ/Dfh56KyswcAp2KBkwIdNtC/BSlV
	 e1aWOe53S5Gcl06CLMSkP9zuPvWa3xbzP+JQBvqR7EjVj8a6TSFUD3rF/O3Z0BmyXI
	 pW5rNRCTbcdo1MVx959RzN5sHCtO2POHfCncUBYgMFSeGBezpTIGyNDmigoo4bUgdf
	 V05kz5a5PL3DuqtpsJh/xGxEzZWyprWZ28PVv2KoGsjQnj/ZZ669mAjjAf/IW+xt3F
	 aJ7LmNJm6ebsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF6B381303;
	Fri, 18 Sep 2026 17:53:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8EEC6224
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74BE960C31
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:53:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aMFER2A57lwE for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 17:53:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9D4A060D5B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789753995;
 b=lJgHKDJsHk8JDM6I5CiXCmGUBi9VoS//n3Pn6bVKsN4tbCKRFucfqwVKePibzjs12eKw
 ZrPwUH4Jtpdz03/DbO1yMnhNR5l/klbvkskUbHByQUIpVJYpjXd+4Uvxl/mHcGEDpmIHV
 nsAOoO7w4vQC9TMqW5GDAZ1fZtchSXKlIoYVn0RBd5lWMgsvXJaiS7jPL27glKq4kc4sI
 SbFCx2NelrOxWQwIWgnKPLpyhYuWYFnGRI89ProO25m7BHZtoGzH3pCugUGjIsjiwOgtl
 93mGHmh9khzHbxabtmC3GZsZP3UsoVhaY01Pq/JPVr3ROvwNfCUt8TdemOGFKKG+Fag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789753995;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=2woHIc2KmepOeeJVIi2jxRbK4n1Chx65Ed9j460edc0=;
 b=beP/CzSWBhJ0UpZHEBe4SUI56DirBgFmx9DobLWORejhD61T+9zeQmkFpBJehvGn8MAZ
 tfhMbCUMMMcBapL+ogiYNupgFsDwcC1cJJktMY7dD3m6kk8OpChl6smK46U54oXJv3BUN
 vORoy20znwGc1eq/whAPpyvBpNoYWJ3c4Fxurr7yIaP6BVsjaCqrSOQb0P1tpqVMwPU3v
 iuX2b+00NAGr0H4EBVsZzYNxhjP2Q/Gcdjta0owovqTx/m4MBH2yXWGibvSXoeYYtjBjy
 TB+GbfYAk+I4hRyFb1Av4OaAoaRIwB9fxHHffGuU1G4wOLdC44rS+d/VwrYzDDCrPfg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D4A060D5B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:53:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D634976A3; Fri, 18 Sep 2026 17:52:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 19:41:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d24f5fcc20c3ac2b63a75835050559c3f43ceaa6
X-Git-Newrev: 55cec1d01307f8e93c6ce61c95c22c863fc1ce28
X-Patchwork-Hint: ignore
Message-Id: <20260918175208.2D634976A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsoup3: bump to 3.7.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/55cec1d01307f8e93c6ce61c95c22c863fc1ce28
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

News:
- https://download.gnome.org/sources/libsoup/3.7/libsoup-3.7.1.news
- https://download.gnome.org/sources/libsoup/3.7/libsoup-3.7.2.news
- https://download.gnome.org/sources/libsoup/3.7/libsoup-3.7.3.news

Add zstd support which was added upstream:
https://gitlab.gnome.org/GNOME/libsoup/-/commit/579ff56747c3aea2fa7dcbf125bfbd424b3ac59a

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libsoup3/libsoup3.hash |  4 ++--
 package/libsoup3/libsoup3.mk   | 11 +++++++++--
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/package/libsoup3/libsoup3.hash b/package/libsoup3/libsoup3.hash
index c0b860875c..588390b957 100644
--- a/package/libsoup3/libsoup3.hash
+++ b/package/libsoup3/libsoup3.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libsoup/3.6/libsoup-3.6.6.sha256sum
-sha256  51ed0ae06f9d5a40f401ff459e2e5f652f9a510b7730e1359ee66d14d4872740  libsoup-3.6.6.tar.xz
+# From https://download.gnome.org/sources/libsoup/3.7/libsoup-3.7.3.sha256sum
+sha256  4e6a67fb8ff1376577afc24a26c842a347b0034eabf71ef13d0382b1c5bc05e7  libsoup-3.7.3.tar.xz
 # Locally calculated
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libsoup3/libsoup3.mk b/package/libsoup3/libsoup3.mk
index 34a9ed2741..a850fbaa21 100644
--- a/package/libsoup3/libsoup3.mk
+++ b/package/libsoup3/libsoup3.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSOUP3_VERSION_MAJOR = 3.6
-LIBSOUP3_VERSION = $(LIBSOUP3_VERSION_MAJOR).6
+LIBSOUP3_VERSION_MAJOR = 3.7
+LIBSOUP3_VERSION = $(LIBSOUP3_VERSION_MAJOR).3
 LIBSOUP3_SOURCE = libsoup-$(LIBSOUP3_VERSION).tar.xz
 LIBSOUP3_SITE = https://download.gnome.org/sources/libsoup/$(LIBSOUP3_VERSION_MAJOR)
 LIBSOUP3_LICENSE = LGPL-2.0+
@@ -51,4 +51,11 @@ else
 LIBSOUP3_CONF_OPTS += -Dgssapi=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+LIBSOUP3_CONF_OPTS += -Dzstd=enabled
+LIBSOUP3_DEPENDENCIES += zstd
+else
+LIBSOUP3_CONF_OPTS += -Dzstd=disabled
+endif
+
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
