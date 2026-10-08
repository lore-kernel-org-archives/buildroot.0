Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619F2CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 266E860808;
	Sat, 10 Oct 2026 09:22:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id X5lUy0oNe3rS; Sat, 10 Oct 2026 09:22:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 17090608FD
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624122;
	b=glld6IxAs98eNQptzmK8elKo8KLrr9FPi/otodgfvGDDafSJzxcfiINtA4d0ALzFU9r/
	 dj9N8EoMVxV7+unhaLQIaJFOg6f1Eo1VA3lxlA9qyscsGmam826eCNVoQj98Ed4YyFdlH
	 HXS1xjKQR3gj48vSu9CMHoxC+KsvJuB3B6GB8mED0NT4hAoO44AtrptG0baKvhxBz/alM
	 Fm66+CmGSg9etIg6v6CJqkqYFA8QIGDdxUylVO0g39b049QVOQqcLFxmkxPEa8LgO32pb
	 F2YFbPmgFCseUCuCkar6nwrdY/KuE6Qt4plbthMPT2ls5SICLGeXf9RliheysQi0xaw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624122;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=5y8h4z7fA15HRSr8OE5PvQeoyP/o8l505RGmGupG6V8=;
	b=A7cPh/5obvjM1WYqGDC45UcB1TBFz9nKBm8RpJG+Oka0f+OBeeQ8eihctLDm++9lfqXt
	 Z8vC1W36WpTRYk5dcm5J/mmDq94ildtOJAU0xOgu1FoPuAw5xezDgx/61z8KxydOjb0eZ
	 CMThDUTH6fL4wmy2DDQGCdYltBerIggXsAoOVE08KkgINKa52aJGZhX+1AfxyeUcBd/VK
	 7TyGuX4agnuDc45GXIDbCQlZcum1JU8zBLPLJlKsoN48S/ZpuQFJegUkZW1AnRaF4oki5
	 Z/56YCJYt4qWt8LMhbH9zVD1nDL5WMqp0B771gFfpFzGXAoV68lQzzPa2GDof9smndQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624122;
	bh=5y8h4z7fA15HRSr8OE5PvQeoyP/o8l505RGmGupG6V8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KHw2GK1Q1jhGSQOBIFWdS54GVsw0Ax7o4KGHbmjsGTgI24vZA409NBWmLAvu29lwr
	 Ag06H7zMBXu541aCliwvaLXeKtxjJ1hHDmlrCLBFDatJBdLAxkvjj9OVWwubmc6lW5
	 BOs/JJ/79lohdiN0iWb77eoPqNZpySNP9B8kMHKUx+y8j0j38W6LusLKJIhahCpBxA
	 DebCZX1FOxNK6bo60B6Bx1MGz6Jav0QM/9ItNQxSmt/4rSkcQEaZABhemtoC2iKC7G
	 woXFa39yJrkrcM+Qv0Z20ygz+dmFgJAKKn4E5noLoe6+HAAvYJ7hythj4KsRj37Ca9
	 /G9JjaJFcIYFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17090608FD;
	Sat, 10 Oct 2026 09:22:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A98EDE0
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 500EF812D1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cr-_7UEoiZaD for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2768C812B1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624087;
 b=OKokTziJ71VUSHoHy6FnmgpuxXiDAR1cNqXs27gbUeEgw2O7VKPBDkT23OV/UXo+8pl1
 JwnLe32GqDuzhy3exWyNW8MDGj0HLpdqrlBQWyzkfoVgT7Vmo9xX3Y2ne30BFa46xw3/M
 3clip78OLfUAwD8X3fmDg/5AdUH7dz+K7WVArHkplCCwoJMUhZaKEPwdCxpbRvxEasIEI
 yI8lndL6xgR8GBCPIlcIoNvFLyN5+XI7qJfPKMSDXlIiQLRd1saxxmYDYeqk+K+yy+RDc
 k2VPeGnnloMVgG4zJRxfWoBC/X3vmQrz7q3laUX7y2nLdxzGWgqAt8vdafjoVXkPiTg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624087;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=4UIk+lo+7ToJoiC+F5zurMhIvHfHnAGyI2oZsduoB7I=;
 b=V8w+KsjYq15fAKmmNoJPjlP7Pc9z2yxg3aA2ExWwYO8L18Q9KcP/jGNpwf3xmNASjwH5
 2hmGh+JZiPsKsjcFRu7EHvU/6xpYgxXaV8oac8pe5W4aqvcJYfRQdP2M3Zbo3oOBkZK+7
 Ani7kDVYe6dOHCBflc53uhyfjcV120wpMV2Rorm1BJ4jhfyF76FGM8W9J72EiHwfHMlsr
 Wbse/2X13lnUYZzz58C7QgwLdHppz6kNwBfC/cKCzetnbc0e7V+5Lnadf/vMqSA8U7fcI
 RUC4h1TU8NlNlAubzAiMxhZh48QYAgK0h4AZtLPLEb9fo83YGfB7uVBfnbd5L4obsBw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2768C812B1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 116CD8F0B1; Sat, 10 Oct 2026 09:20:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:05:36 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 17da3206278007e7c44daa62e031760145846454
X-Git-Newrev: 385c25f4b0badc277b6f2fe8a2ea108098a49360
X-Patchwork-Hint: ignore
Message-Id: <20261010092009.116CD8F0B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/{glibc,
 localedef}: security bump version to 2.44-57-g34106fee6
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7893447843775396166=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7893447843775396166==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/385c25f4b0badc277b6f2fe8a2ea108098a49360
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Fixes CVE-2026-97399:
https://gitlab.com/gnutools/glibc/-/commit/34106fee698c83eb0af71d4d0381e66b399be746

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a205fa58d2261a33479cf64ad6bcc96b374ae948)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 5 ++++-
 package/localedef/localedef.mk | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 439fe1f140..51e29673c3 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  2ba6ee9ed5177a792fcce4da13225800f0cb3a2413a459e7864b8843eb5cb790  glibc-2.44-55-gc90398e00571476711792baacb6d92bd2a7b6891-git4.tar.gz
+sha256  902d628994c2f3b30af4a7f507835079852cc8ed21d8a7f340e45dc5dae148bf  glibc-2.44-57-g34106fee698c83eb0af71d4d0381e66b399be746-git4.tar.gz
 
 # Hashes for license files
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index a838ac1a81..435a97361b 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.44-55-gc90398e00571476711792baacb6d92bd2a7b6891
+GLIBC_VERSION = 2.44-57-g34106fee698c83eb0af71d4d0381e66b399be746
 GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
 GLIBC_SITE_METHOD = git
 
@@ -46,6 +46,9 @@ GLIBC_IGNORE_CVES += CVE-2026-8674
 # Fixed by 2.44-55-gc90398e00571476711792baacb6d92bd2a7b6891
 GLIBC_IGNORE_CVES += CVE-2026-89092
 
+# Fixed by 2.44-57-g34106fee698c83eb0af71d4d0381e66b399be746
+GLIBC_IGNORE_CVES += CVE-2026-97399
+
 # This CVE is considered as not being security issues by
 # upstream glibc:
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index e4bfce1a3a..becbdfae7f 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION, SITE, and LICENSE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.44-55-gc90398e00571476711792baacb6d92bd2a7b6891
+LOCALEDEF_VERSION = 2.44-57-g34106fee698c83eb0af71d4d0381e66b399be746
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://gitlab.com/gnutools/glibc.git
 LOCALEDEF_SITE_METHOD = git

--===============7893447843775396166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7893447843775396166==--
