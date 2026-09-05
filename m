Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C76AC79F85
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 13:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E015781067;
	Sat,  5 Sep 2026 13:56:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i2vG7wgvaWVi; Sat,  5 Sep 2026 13:55:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2AE5580F71
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788616558;
	b=YWUDnQ9+vB6aNQIpD90FRfhv7UxTl3YLmxkIgqo7gv2FdnZM3eml0h9+0qMGF3zNkrt7
	 ve/oRKsnjosbEDOlmky9Zh6zVBbYAlz4+l5LvQwMz0f7ogz4Ha0gRC6mJ9OiUH0E/ZDBY
	 RKF8pg4tZuz5fGl9n/4T2H5NwVWofjfjJEFXShU+IaMgc0xOyN7KXPYSxlopBwdxsRu/7
	 232JXJtlm0rv4ihGtE6Jeebw5L6W0M1bzNec0D2/fSr15eyf5jltyOqm7miHXSOTWbnYS
	 k2U0b4Vu+eR14KYaXi1Ce+KSyxmcp3F7gie1XkjIh7tiXvETTkhJP/pUSoigk8H2iag==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788616558;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=8y6eJjCzeHe9q2Qj8e93FscMo+JZmg8u2KU9JQ8H2eo=;
	b=Ale0txGUwPzPQJo1F/qyFQ6Nqu2GQ8mMjhavJ/HfNUhJuXmF/2Wwi/NXUjYGF5sXvcWC
	 c/UP0Hcy01+t/vkVihuttq3N4g6ibGJ2cUKpRVjHlDpKXq6g3ojO1ghtGK/oc3e9AzQq/
	 yDIwhz3LpCzjTik8PNX5+Ee4rs71YfxIy3AczOlfvja8AyeTlHPutKwKc+AbvRc6D9iDT
	 /VIqctKcauurKqInUVvJIKo1h+2cK3Pw0I4Fy4IZ1UrtF4RkA2cLks9nOJIwbVV6RN5iU
	 dTm3qcNtj9Hpb6UcXrgnjA2SMszfl0RKxmF2BgVjlsCr5nJm83BWSow1GQAZLjAcS1A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788616558;
	bh=8y6eJjCzeHe9q2Qj8e93FscMo+JZmg8u2KU9JQ8H2eo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UboyKqC/aGao31gff/PoXLYY0XhrJlvSYp7QQ+PCbHJi0d8s0rShlb8eww8Y3evpA
	 o4bg2/0lEOTXdb2Ht6FsJpw+eGmbeRhyDR2v2lDJ1H/kGomuzjDfyKVDMDtc6PpAcB
	 hD+ralkIuM5yWoqEYCdQGemn5y8fb0QT7XslrTxDxTgCsyW2iREytIDooniHq3DRss
	 VecIZVonuvHXUvCpCRQ1c4y2K2a+FMKzfjoKaAN1SnefkJ6OSSnef9GM849+qeLsji
	 E+V/ffdclmmwjLMTrUE97AjUglq21/81nhUcGiDfiFLcVnmJjQxG0Oyr+mcw5dFpR4
	 5iUipFtJlFQtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AE5580F71;
	Sat,  5 Sep 2026 13:55:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5645F49D
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 13:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CF4F4005B
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 13:55:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ojcPdKMNNudd for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 13:55:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 7B3684004C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788616552;
 b=Ar3MuQj2LkZKClGvt1hgJdDza6lS0om+VIYx3Kg5kceU6zLeL1HX+D+A7iV7OftO4PqX
 Z4FjJxIab2jQt76cHU8TOCv2KvLx4njhcz81pafU11AHnvkUom9gmSpoFsiaWmHWXTorx
 FQ2qdlzMoRLrZx7PQtF5QjeQzhzkXphFjynWIt9OYjky52j5AIHdeOPRy8lgxnUN36P4a
 RgcEs49VtsTVVLijn6y6U8x1OVM022P+bg7qN4d7OIGK8nBM/IcoNwvP+KKdxgTm6atx6
 BemdfFKBmQVz+phBpsHWi0tcPU4+yunOv3CVoYdxZdeB7ozTQlY3zM8aXgrPuFPvXqw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788616552;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=/Wabq84V3XfWf6Ax90OfOJ6GIgnjxjLZMq1XsNO+5y8=;
 b=nbs0mrgDWz0zbhZB4Ybz9WCVvpXiELHLK3yZjE5o+64+IooD9Zik/B/uPpq/F3/+0gCF
 S62oj0NR7cgL56RnmMYmW0UrlHC9OiWSSEPB9jc0p0fiNn/2dUwVnEEMHgJxOZaqpHfMh
 0eG85S2lORutl8vlU1tBAePGxlYZUwgO60JnuGt9OlKBsitPoiRMjJTFIHHTfihRxi48r
 iqT6SnIlywqjDebar4XtBnS1THxbGjm0OSXXIPq36PEn1a8k3LCvvSQfW0Bg3f4H5zRnM
 ascZljPdJlD0AirId/EuDBTxpQD0ujkgm29vZHX4DPQcXkTkzkwYOGM6KX58Lp9OaVw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B3684004C
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 13:55:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7DC4D8B84E; Sat,  5 Sep 2026 13:54:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Sep 2026 15:53:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 698535473f7340402d3c36bc1eb66237c63ef083
X-Git-Newrev: 99529edaef897844c3cb20a107ab0bc26f4ea9d2
X-Patchwork-Hint: ignore
Message-Id: <20260905135451.7DC4D8B84E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dtui: require 64-bit atomic support
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/99529edaef897844c3cb20a107ab0bc26f4ea9d2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

dtui depends on tui-textarea which unconditionally imports AtomicU64 in
src/widget.rs to pack a viewport rectangle into a single atomic word:

  use std::sync::atomic::{AtomicU64, Ordering};
  pub struct Viewport(AtomicU64);

As there is no cfg(target_has_atomic) guard in tui-textarea, its
build fails on any target for which rustc does not provide 64-bit
atomics with:

  Compiling tui-textarea v0.7.0
  error[E0432]: unresolved import `std::sync::atomic::AtomicU64`
    --> .../dtui-3.0.0/VENDOR/tui-textarea/src/widget.rs:10:25
     |
  10 | use std::sync::atomic::{AtomicU64, Ordering};
     |                         ^^^^^^^^^ no `AtomicU64` in `sync::atomic`
     |
  help: a similar name exists in the module
     |
  10 - use std::sync::atomic::{AtomicU64, Ordering};
  10 + use std::sync::atomic::{AtomicU32, Ordering};

This has been reported to tui-textarea upstream, but unfortunately the
project seems to be unmaintained (issue linked below). A sane workaround
is to disable the package on targets which lack 64-bit atomic support,
which is exactly what BR2_PACKAGE_HOST_RUSTC_TARGET_HAS_ATOMIC_U64
describes: it is n for armv5te-unknown-linux-{gnu,musl}eabi and
powerpc-unknown-linux-gnu, the only rust targets Buildroot can generate
which lack 64-bit atomics, and y everywhere else.

The same problem was hit by package/dust and worked around in commit
3abc3b97bad9 ("package/dust: bump to version 1.1.2") by bumping to a
version in which upstream had added the missing guard. That is not an
option here as tui-textarea 0.7.0 is the latest release.

Note that a runtime test for dtui cannot use the default
infra.basetest.BASIC_TOOLCHAIN_CONFIG, since that builds with
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE, where dtui is now
disabled; such a test would need an armv7 or aarch64 toolchain instead.

Build tested with utils/test-pkg against:
- BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE
- BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_STABLE
- BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_STABLE

all three fail with the above error before this change and are skipped
after it, while armv7 (glibc and musl), aarch64, powerpc64le and x86-64
still select and build the package.

Link: https://github.com/rhysd/tui-textarea/issues/66
Fixes: https://autobuild.buildroot.org/results/188f6442371500731453f75983590c922eab6d57
Fixes: https://autobuild.buildroot.org/results/e254db2654f18f1d2110eb8b1a32b43ad0f2a3d6
Signed-off-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dtui/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/dtui/Config.in b/package/dtui/Config.in
index 65d51df7d5..7056cbdb08 100644
--- a/package/dtui/Config.in
+++ b/package/dtui/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_DTUI
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_USE_MMU # dbus
+	# tui-textarea unconditionally uses AtomicU64
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_HAS_ATOMIC_U64
 	select BR2_PACKAGE_DBUS # runtime
 	select BR2_PACKAGE_HOST_RUSTC
 	help
@@ -14,5 +16,6 @@ config BR2_PACKAGE_DTUI
 
 comment "dtui needs a toolchain w/ threads"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_HAS_ATOMIC_U64
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
