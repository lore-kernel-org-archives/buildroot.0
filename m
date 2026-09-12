Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26544C88E53
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 13:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5673540729;
	Sat, 12 Sep 2026 13:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 45HZa14olHO6; Sat, 12 Sep 2026 13:09:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6AE75406E7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789218547;
	b=q4vfwtyc7pLxfYktSW6CNDHpe0j5ZfcK2+dGme+7P741XffGmimGEBa/bTX8mtUkzceW
	 KwIjWADgY/gyq0U+7UMV6EgV0ZUH3rabjQdJSP0wDBjnp60Hp57xk0KhkECzKHtniGfFk
	 k8JR2rDU6FzQcfLzXtaW/cV23Zg7BObZQkvWX5HoSEcqoNWOGexUF7Nwz661FWPgiqzgS
	 ncNjuPlwhsz+wdz2B5SqyUy8JxIYnIha7NCBoq/o2u/MPc2StiLY4OCdyXUeoXZhGY1hS
	 EyQkvGroKQHVWoViProEoXIj4PMgxxKfo1HaF8JwMRZAh/8qq6ZQVMnriH33Euxtf8w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789218547;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=gkoqpVhqnm1wcCJXkNXktemi32Xz5b4xuFujA0hQokw=;
	b=RB7xEpqsFz/4yz0Wqu+LLuaFOYHKHxZpcnSZpP89dfBDq8Qext7VifWpPf9Vcy7ERPRN
	 +242seUcEA5X1Eq8uoBZ2OKkDF/PQeb08RDKmSuksSWJKEmsOwZWt3spqWFZYnO1jsTW1
	 WdWLSxrpjEdvN7SK/0SDF3rZLq5rZVk4vZfj1CGM3lGsQt10QZsmZywZ90ggoPuDiVXpF
	 3nU5lV+R9WRoW/WDw2BNalFtVYboWZA9xD2MatR7nNsrXh8KErSNtPssx6OKwZ2iHncDG
	 nUSBACgtr4IKBqHr/TsQJTI4GUXNcdCN3w99fk5zJLTJd5Fzj46e1tjw0x1dNLaswGg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789218547;
	bh=gkoqpVhqnm1wcCJXkNXktemi32Xz5b4xuFujA0hQokw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=U1+eNEJEAE3h7rc1dDhfDH+J75G1kvR7jTXIq6Zvkt7rapN/O6IFfo3FyO+pFmkt3
	 tT9QSYqPIsd1gMt9Xg/oPhiDH6mbRnF09dBQXMSay4DOj6OFlmm/GTPTnDgDS0Q+IF
	 7O6z6L5UzQ48BQkJtPghfSUaAUE7HsZuDcLiZQi5DWat3uW/mLaSTwcmt6K+69mvtL
	 W7z9vyRWmmUFgko1MJT1s166y3mYyy+IaoZbXgxXrxUpuektggGBrtvYjqXxVjkVVa
	 r7t2m8W4kJCdA63WPggd8g4ViqNpnQuY/HYM0k3PBQDW3bDeWXM/lCoF5dRtxINzgC
	 X47f71UUFT3bA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AE75406E7;
	Sat, 12 Sep 2026 13:09:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 10061EB
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 13:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D08A80D88
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 13:09:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k-WJ1lLPCkwD for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 13:09:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org AE14880D7F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789218544;
 b=ZPT8ZICtdmldvcOTylZhq05jRg8kzhIpGu6XZ9aImtXPeMfxgNgfr0CFPQnoIXr60Fa/
 AS6zrJDnf+9LEiXf6QqJ21OsTm6uD9TT8GwpS1crJU80c9klzGadafZUfTHE0cOQDhtB9
 E6GLmbMvzoqX0VjrxBRk3AH4jweNEJ63VD+ZMKvnX7KNZt4TJ0UMjnEd9OSElnQz7qnqC
 vZWI+SDDY4Oyo6gI0ELoEIYaWyqsiUOxakETSwrlSYgM5YSGAo/Da+oNycZ5fMsz1YLb+
 40YN0apC4BJT5r9393drGQKWoJGVtIJL7QVynNuKzPMPH/MzfurjD2JIb3sbFNd9Q5g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789218544;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=M8AOqfGuFFh3dlTPYBCfQdEYlu3IeyX7lBMH3vzQV5o=;
 b=OAnv3xIXB6DxpKPn0bKAd0fb9tvJ3q+VPQ8XkGd1mdfEiqNrHcV7F3WKZZsGLToUP8oo
 YrZyckxamlkWWSGrEFwYoszjYMWlOFCZIlKKiZpoE8qPYfPIkolWZKKb5I3tmoaSQMS7I
 hyWlf41wt9xjkVbNghIiYT8TvPhzHIbtpCUWE21n2q7dNgLvDomc/ry6iMq0y17+r0yEo
 if9rOz/+SkcVFmyEKSgNfhwPRJ5GeZoGGEpfmhj1c7Pu+IoDHbKXzmKlb4dp5WXGm2Xpo
 EHY4j1QZBvOgJPmI/Rm5ku0JckXpBEvIxwg5IXhFnyVNRrWc6eazDmaOgLj7YoA24/A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE14880D7F
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 13:09:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4FF73955F4; Sat, 12 Sep 2026 13:08:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 12 Sep 2026 15:04:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c527520f07168e447652c5c0ee42fcd9a551693c
X-Git-Newrev: ee5c69065eb3152b45e6d9f41550af23678b4eb9
X-Patchwork-Hint: ignore
Message-Id: <20260912130800.4FF73955F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sentry-cli: bump version to 3.7.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ee5c69065eb3152b45e6d9f41550af23678b4eb9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/getsentry/sentry-cli/blob/3.7.0/CHANGELOG.md

Removed patch which is not needed anymore.

Updated license hash due to upstream commits:

copyright year bump:
https://github.com/getsentry/sentry-cli/commit/734fa8cddc8308133d6f807cec01a9e5e668aba8

switch to FSL-1.1-MIT license:
https://github.com/getsentry/sentry-cli/commit/3ed4ada174945c83702350ceb83944651f1d8ff2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...1-Disable-SSL-support-for-the-curl-module.patch | 62 ----------------------
 package/sentry-cli/sentry-cli.hash                 |  4 +-
 package/sentry-cli/sentry-cli.mk                   |  4 +-
 3 files changed, 4 insertions(+), 66 deletions(-)

diff --git a/package/sentry-cli/0001-Disable-SSL-support-for-the-curl-module.patch b/package/sentry-cli/0001-Disable-SSL-support-for-the-curl-module.patch
deleted file mode 100644
index 819d8016ae..0000000000
--- a/package/sentry-cli/0001-Disable-SSL-support-for-the-curl-module.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 5b4179af15b435a476c006260718d4f6e22ea2ab Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Mon, 31 Jul 2023 22:34:04 +0200
-Subject: [PATCH] Disable SSL support for the curl module
-
-Fixes build with OpenSSL v3.
-
-Downloaded Cargo.toml patch from
-https://cgit.freebsd.org/ports/tree/devel/sentry-cli/files/patch-Cargo.toml
-
-Upstream: https://github.com/getsentry/sentry-cli/issues/1706
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- Cargo.lock | 10 ----------
- Cargo.toml |  2 +-
- 2 files changed, 1 insertion(+), 11 deletions(-)
-
-diff --git a/Cargo.lock b/Cargo.lock
-index e5031db..7357215 100644
---- a/Cargo.lock
-+++ b/Cargo.lock
-@@ -1521,15 +1521,6 @@ version = "0.1.5"
- source = "registry+https://github.com/rust-lang/crates.io-index"
- checksum = "ff011a302c396a5197692431fc1948019154afc178baf7d8e37367442a4601cf"
- 
--[[package]]
--name = "openssl-src"
--version = "111.25.0+1.1.1t"
--source = "registry+https://github.com/rust-lang/crates.io-index"
--checksum = "3173cd3626c43e3854b1b727422a276e568d9ec5fe8cec197822cf52cfb743d6"
--dependencies = [
-- "cc",
--]
--
- [[package]]
- name = "openssl-sys"
- version = "0.9.80"
-@@ -1539,7 +1530,6 @@ dependencies = [
-  "autocfg",
-  "cc",
-  "libc",
-- "openssl-src",
-  "pkg-config",
-  "vcpkg",
- ]
-diff --git a/Cargo.toml b/Cargo.toml
-index c8c9ca9..117e77d 100644
---- a/Cargo.toml
-+++ b/Cargo.toml
-@@ -25,7 +25,7 @@ clap = { version = "4.1.6", default-features = false, features = [
-   "error-context",
- ] }
- console = "0.15.5"
--curl = { version = "0.4.44", features = ["static-curl", "static-ssl"] }
-+curl = { version = "0.4.44" }
- dirs = "4.0.0"
- dotenv = "0.15.0"
- elementtree = "1.2.3"
--- 
-2.39.2
-
diff --git a/package/sentry-cli/sentry-cli.hash b/package/sentry-cli/sentry-cli.hash
index 0b1ef402e1..af50304475 100644
--- a/package/sentry-cli/sentry-cli.hash
+++ b/package/sentry-cli/sentry-cli.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  19d62065788c0b72d54875e834462f444204fcae99fe76f69a836cc17a7a0935  sentry-cli-2.20.3-cargo6.tar.gz
-sha256  9503def7b54ceb6e3cd182fd59bc05d3a30d7eae481e65aaba4b495133c83c14  LICENSE
+sha256  bf37c6beeebd1b1d7302e61653083f4d7bcfdb6ef7a8081d42b0bcd8ea2e677a  sentry-cli-3.7.0-cargo6.tar.gz
+sha256  f8171b7a645bca1eff1e69f911dc4c1fa93bf92a2f7d4d7fa24b4b7660c33041  LICENSE
diff --git a/package/sentry-cli/sentry-cli.mk b/package/sentry-cli/sentry-cli.mk
index 3ddf5e44fc..ff49f479a8 100644
--- a/package/sentry-cli/sentry-cli.mk
+++ b/package/sentry-cli/sentry-cli.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SENTRY_CLI_VERSION = 2.20.3
+SENTRY_CLI_VERSION = 3.7.0
 SENTRY_CLI_SITE = $(call github,getsentry,sentry-cli,$(SENTRY_CLI_VERSION))
-SENTRY_CLI_LICENSE = BSD-3-clause
+SENTRY_CLI_LICENSE = FSL-1.1-MIT
 SENTRY_CLI_LICENSE_FILES = LICENSE
 
 HOST_SENTRY_CLI_DEPENDENCIES = host-pkgconf host-openssl host-zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
