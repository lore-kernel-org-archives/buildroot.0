Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38D3C98321
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 21:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71C1D40A86;
	Fri, 25 Sep 2026 21:08:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TG3WldO4VotE; Fri, 25 Sep 2026 21:08:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9107740AB3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790370527;
	b=ZIBGnXKk2ZUza2ek0RxN4U/lsvIX8ZdzrMh1JyooTLizR+gpfcjKsOlxmNZFcmdrVnkG
	 0OZo+U772g6ZyxkKkTvj5lyrPxPHlUbr2/fz9AgxNGYj5Mtis5TnNMManuHCyNRtOirus
	 17ZlsCaZ/2DF1yGOngOddqqjfsasisgyMuKvKEYVY09vdPBk+uSjou+mu6V+LVHkPic0n
	 2IoBIwKwDL+np79d1zxy6f8QA8GtpN5wLewZ7J3D8KJKipVvCCCia20TtFuA4nonzatWP
	 txmj4HtkSPeI9C9qYcBCn4IiwTiC04efbCcO+kvrs4QIEuqR6pNZ7Ps2kAbQuQEoSZQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790370527;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=CTb+7r23j9gu1Bqn0ivN2sUPppsOdjHyO4ldngr6dbo=;
	b=ly1BqV3Mdo3kZNHxtWDD4Whba6MqYktfCzfGl9bn6DfRKFNMPa0lmtdMOpKLENqo5OZu
	 jZI/OP0ko0qoNbtm8jW5tZ9ppjYf7EnHIQAfx/OQuENmH3AbGmiv7IeANJDbv76tfAJ3F
	 N6cMPiIQSpgklKw+ktJ61UGZdJxC60OkQqlXbAFIXoUonI8V+VZ3imUXx7+p7gozC5jM4
	 +nBlZj6wgu1L1vqkBITelk87MgpzfzuAEmgLpKG7mYJIfUtv51czjHfPjGHtbC7Pgfmj6
	 DPf4auI6aL18tY1AOwhYU93wvRj6BKxS5RsuPnciImaG8Fr7PXjNwRKvdQpKO90/N4w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790370527;
	bh=CTb+7r23j9gu1Bqn0ivN2sUPppsOdjHyO4ldngr6dbo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Up9HT8FoaLhbHWqA4g35v+N/s7L3QRc2RrcAU6ZtHTBpEwLx7ZuggKfWkklrJiBrW
	 dHMgkRU9GyDGwePBVYzTHGbgzeeEFd+gywqA3NCxv2u887aCZ4eVB6PaM1i8OUG1XQ
	 D2XXJqZC5vCaD1029mQXhTK9iGmyVMf24o6O/OQ8VxL92l09+F+ly8U325ewCt23Uw
	 FhkUHoikdMddpuDgF25tljM1gjn+XAMC800UNorG4IqNurTCDj7zQnqKCrdWA2IIZq
	 Noy1scwC5a6Ix18hs0sRqYZEJrXqLe6mYW0e7o3AtjpbomK8nOqJJ6WHKUqg6/RTYF
	 AgTJFsXdvadnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9107740AB3;
	Fri, 25 Sep 2026 21:08:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5887C335
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 21:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A09B60BC9
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 21:08:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l6l4IkXwaHjk for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 21:08:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1D52D60B62
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790370525;
 b=Bgu9Qx1tSAwZfToepW0mHw5MbNP4QrnHWmN1TQSTPhbiy+lvaL3LTPm/lKQxs/VuY/3B
 rrxyMZGDcT6TxFZ3rsuO1NyR6b6zAs/X1Zx+FkdCfIEbi0L4jHDuTV9mUoNAZpMhidQry
 sfIeqQANXo3ura/ctO9IMZMRfcoEj+9aiIaS5kIv7trGMXFPMM8uYKj12cIbcx1DFcBg9
 ZvL7aNQ+5fel8PEF9Iv2T87xFpu6qBLE3Z8daFMiTF1B478FcTXlLmzEYUbsADn6j9wjz
 ZOji7uV8HA8H6/CLG8ttvcqGuhzKaJleA6jpNj+JsnUVaH3i7aUipQNmNzCjQkgloAg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790370525;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=k9lgV8q9xlDzhBEgcsgLBlX37Xpe8aH3dJOnoKxa+vI=;
 b=bzciC2gRFasnDlfV7OPa7BWficZOOiUNHeAj0V1UqCG48ubtYlxuk69mjniwAVNZmpwP
 IwcHO8rk4Qm3jFL2W4p9+5EjLhcaX6VfYtOunMqoMUPRJt+DAjtdrXaX2giWZcWMLMJfw
 aVCWpEhghQ77zXFlSadpjZPlPfjbiFBWXmiGh3kza16tVkYcf+ZmRDnLzq/3RxQuhOWCX
 33dMCGI36RYTqGnPM1iqlBV5n9cDPxcxq923GGtbPTayebQbyqaZaV62Ka/mG6/76CEiH
 78kL45c6vMZOyI1NgdTE1BG5rcz6ccqo0y7mhDNSzAsAjlzWGxjTkab7K6KbBhiShUw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D52D60B62
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 21:08:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F58D98393; Fri, 25 Sep 2026 21:07:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 25 Sep 2026 22:11:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0867818a73dd5884898be9bb226062ffe7c45dfe
X-Git-Newrev: 80114e20e409526fa19523569dbe12815f42d43c
X-Patchwork-Hint: ignore
Message-Id: <20260925210732.1F58D98393@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 7.2.x,
 6.18.x series
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/80114e20e409526fa19523569dbe12815f42d43c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the latest kernel releases to:
- 7.2.7 -> 7.2.8
- 6.18.53 -> 6.18.54

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 linux/{7.2.7 => 7.2.8}                     | 0
 linux/Config.in                            | 2 +-
 linux/from-6.17/linux.hash                 | 4 ++--
 package/linux-headers/{6.18.53 => 6.18.54} | 0
 package/linux-headers/{7.2.7 => 7.2.8}     | 0
 package/linux-headers/Config.in.host       | 4 ++--
 6 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/7.2.7 b/linux/7.2.8
similarity index 100%
rename from linux/7.2.7
rename to linux/7.2.8
diff --git a/linux/Config.in b/linux/Config.in
index e1f7c141dc..b9e69e6d7f 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.2.7" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.2.8" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 7ed646686c..d5e874c113 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  4ac34c47db2540ffb2713943f8d891ff1702e0ba6934525a493b7d1cad43145a  linux-7.2.7.tar.xz
+sha256  12e8d5a973d1ad7c5a5c69882e4022b131ed715db7003fdcd760ddf8c3e51941  linux-7.2.8.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  4d6fba95c2244b08a7b4144a4d38b9be4fb31abb5e7682ae40bb5cb11374cfe0  linux-6.18.53.tar.xz
+sha256  9df30b02dd8102bbd0be52556288ef6889ddbe7f1ddb96fbf847d0becf3eacac  linux-6.18.54.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.18.53 b/package/linux-headers/6.18.54
similarity index 100%
rename from package/linux-headers/6.18.53
rename to package/linux-headers/6.18.54
diff --git a/package/linux-headers/7.2.7 b/package/linux-headers/7.2.8
similarity index 100%
rename from package/linux-headers/7.2.7
rename to package/linux-headers/7.2.8
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index dfad885f1a..88ee7ab17a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -481,8 +481,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.1.188"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.157"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.111"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.53"	if BR2_KERNEL_HEADERS_6_18
-	default "7.2.7"		if BR2_KERNEL_HEADERS_7_2
+	default "6.18.54"	if BR2_KERNEL_HEADERS_6_18
+	default "7.2.8"		if BR2_KERNEL_HEADERS_7_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
