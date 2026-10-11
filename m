Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9318ACA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F173406CD;
	Sun, 11 Oct 2026 13:10:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wIrX_cdrRpI7; Sun, 11 Oct 2026 13:10:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 00019406ED
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791724219;
	b=LcOp1tQSOCa615ENjVWa9WEDPCCuNkG+cWpMAZVV3CLZBuXL7qI7L/rUhAKnmM0CZcAH
	 7lZwEdi7eKEKXLqKL/85rjIuZoMfzP4+HPyd2xpSc5BCDOfNaXZ3Vw736XYkRgvnJaca5
	 BLhkUDI9YUaD0YRZQGmq9leLJdjTPOq4r19lbU7cywOvN9WVN61ENIcYOinieKX64bGQ+
	 ++21OBLFT/BRx5Vs+jKnuf78phVWHzUbX7ZKSBTqSzyKHKDr8K0tHkLH+9vdSIY5U4/db
	 6CcwHOfdvk4KgEYVzJ7mJDycArzsC4lLhUyO3bee237lY9JNJ6gNVTul9VCc9DewrCw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791724219;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=zwQRU8xb1MG6XRN80wTE85MVerq/mPrMyAaKADrSNMY=;
	b=hTFuXsIXpdqMOGAUmU3LmPwi1EXspZieoT8vx7BUTbCkVTXfORaeP+jhMDtRCDT7F95c
	 TAJbtaLlpwn4Vb8O/t52Inci7A2/QXvcD7Dwfz6TqEDuEyuxdMmG1lONojuOjL2orejyG
	 RuFMc/3srTqNJcPRqKUizSfR9HoEzU5fSqTOJKDDW76kV2Jyqq39S5axuFmmWyo1jHfdg
	 cjPqjp21V8xl+zRcWFL0uKL7o3K05wFIVIyevfFiALgtrrnUXDQ75SLYBRxBKwSyjWxDi
	 KyldWX+fg5xB8XTzLZR6fAPq/sTIiIRvRNcFlcyEMlJHwsDFz34qAAu9hqfK4uE7X+w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791724219;
	bh=zwQRU8xb1MG6XRN80wTE85MVerq/mPrMyAaKADrSNMY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dnrm4e9lbQsfqeCL1GsLjRE3dJd1OQHRo0PSV+eUHRp8+5YqzXvCdKPiXQ3PAlBXj
	 jVJb0cE1O4nKBID6WSUDxgKqr+VAOuQZn7WSjMW81mc6+E6nv8nW+zkC/cMJkUKefk
	 gSTfD2lUiSV4CPk4zjHVZaTaJ+zHQwSWb+4JjdGA9p4tvhpI5w2pAxg9LqJgBtLN5h
	 OvPL0HGUKoxaV4rpdyI5MlChXlf51hCNVXip/bj2Yd90EcId7hcrOKRaGq+0j2cdDG
	 qMmzfCMaKubHfa+nTV4S1vHpPk3/m6FI7Be7bJmUdMBQ60f0pLmTN4L6AzpQFv7IYG
	 iJi9CqhAwpVFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00019406ED;
	Sun, 11 Oct 2026 13:10:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AA9422E0
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9094260616
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:10:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lKyE3g3WLP6Q for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:10:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2028B6060E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791724216;
 b=A7cn1afxX2en0SwEaWtNdIg74aVC/shfkZJJKmlJNggyNTkSalmGrP3xO1xhjsSjFusw
 Ye3aTqukhIkBrnFfJWVvlURBkI3cjNr0gKB2S5SI8WvdRhpZrgucC3KNxm5vymHpy2nLj
 e+NRcEg8y/GkOD+Ry7n9aecRsFVfhep10qZkFLfnR6whjjMfs34sh6p9bKnCaMgkR+2fB
 7D3Dag99wFJlaAJE6ex9jM4l5E5G7UcOzuDLorpkLcsGhPPzCqHGlk565XKGn8BrXUwNj
 /O5lUw06P/sjMWZBY3c7CfrXhZYSoWJFGuywaAnlibo5XHgxzpM5q8iDvMVI+yCO+FQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791724216;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=5+2ETS7ITeS4aOt0axM5v8SKeLc/8Mo+qMcToccSCPc=;
 b=X2BqR4TwC97hVvm+hnlJ4mywjRVx9AD+XDSV6ZqW/n+l5uku1HSnWWNtgK9svvXX6Bvn
 xKDFG2cadQK0JKNeqKkFumzlIfw+qxHyGvYEqTXDSJLY4cz3jfc214U0qKIhrnbNY7Jfr
 6xgiF1IEV4g1+WSQucafEzZeQYcZD4Kw8+FKFUZoHviEn0Tgxcup7lng/VkmnbpVLlgho
 fEDjeI2J7vvZJMTO6keBhrtN0BStU83pT3y60dMkFfH0JQSxDwuZTVOo4DioQrQhbDTg8
 AZjsVKc3CNPW2z43iEHFQFz7iCib25WJ8DQwNZV5nmNquUmXsO9eMMlGM+Wgpf8BozQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=S8NCwSYp; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=S8NCwSYp
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2028B6060E
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723684;
 bh=5+2ETS7ITeS4aOt0axM5v8SKeLc/8Mo+qMcToccSCPc=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=S8NCwSYpCfn64g4t7kqdlOSFrg7km0aiJsCJELiVBOdi0vVcMJN51YjiqsukuATJK
 evpIS1P738T0vDoUOC1KS4EvXy+kpkVb82/qeg3I+GFcogKuH5cI8Wq/528SH0x1+b
 CbQUHpgMyP6J0w+YjrubSfKpmFIt7qBSLuP6xCmdK3JmnwJJbxGqTUbSPttp7AhefR
 UWC8F+bE3FySwYLzp8+KiiXP3YQIrdE0H2PvjR0za2GCOq2gW2UCyJ+3t9CSzJSNwK
 qDmNqDyMBvQZe4s7SVp8nEsDWciK3Wk4Fs+bkmsLoaOGkl94CLjy3y2YMtt9sxjrgj
 TSVKYOZllMz+g==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 d+plUEFXLVDDQxMGJowKjIbTvq+Xks5MKDLB0YVRrgkJobiL7tve1It62wAX/QJXhMeFpfsnfcV
 ezA9ep9UeVGs/WNQURX9CH1jop+cPijfz49BJWm0hulXvggySwSsvVlABfGvjGGi4RmS+0b49k9
 6W5CSa09KQQ29D0jRBYnL3kcjm81MoZUzRsJbmD0uyPjzjzXVcN+TNjIn+mp8Nf3RdGH1rPRM9q
 8X2V2ug41WvCslGIVbA+x9WwvG0bAC90Cj2rWpbfhgZ85Jlwx2PGPW243auPdDhkn3S5FmAdWv0
 EyDrsUxk2D/T4eYeDmTkVqKolIcNT3sa5a5VXBYbiWAy+rTr/Mn5CIzN3LscY+4zOHLwi6A15rZ
 fxIdqdkDHmuMEVLe64JqKPnwL3lkDY7IJRqzW6WJxJzVHTaLYneuz8RhZbY1L7B+gmxZe/BknOk
 YMzDqO8gexQdTOfa/QDG0xjbROUuDODkirOBzxOvLgsEjhQhc2TvQeReR+rYOcQvMr9Kwe90aYJ
 dtY5m6b2baJjKF0UZv5ZmxBlFEDdbS3/7VueasDAgjXjy1QknAut+6mw0zVbPXH3IhpcAn6QQln
 NDSk9j0=
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6623DA4C58A7
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 15:01:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAo-000000007Fz-1HjJ
 for buildroot@buildroot.org; Sun, 11 Oct 2026 13:01:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:00:50 +0200
Message-ID: <20261011130058.3443432-46-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v9 45/52] package/kodi-screensaver-rsxs: bump
 version to 22.0.5-Piers
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

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-Fix-build-with-CMake-4.x.patch       | 346 ------------------
 .../kodi-screensaver-rsxs.hash                |   2 +-
 .../kodi-screensaver-rsxs.mk                  |   2 +-
 3 files changed, 2 insertions(+), 348 deletions(-)
 delete mode 100644 package/kodi-screensaver-rsxs/0001-Fix-build-with-CMake-4.x.patch

diff --git a/package/kodi-screensaver-rsxs/0001-Fix-build-with-CMake-4.x.patch b/package/kodi-screensaver-rsxs/0001-Fix-build-with-CMake-4.x.patch
deleted file mode 100644
index e9f80a98c4..0000000000
--- a/package/kodi-screensaver-rsxs/0001-Fix-build-with-CMake-4.x.patch
+++ /dev/null
@@ -1,346 +0,0 @@
-From f6ad95576920944e64a368ae4074812efbcedc4b Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Wed, 11 Mar 2026 21:58:40 +0100
-Subject: [PATCH] Fix build with CMake 4.x
-
-Fixes build errors with CMake 4.x:
-
-CMake Error at lib/Implicit/CMakeLists.txt:1 (cmake_minimum_required):
-  Compatibility with CMake < 3.5 has been removed from CMake.
-
-CMake Error at lib/Rgbhsl/CMakeLists.txt:1 (cmake_minimum_required):
-  Compatibility with CMake < 3.5 has been removed from CMake.
-
-CMake Error at lib/rsMath/CMakeLists.txt:1 (cmake_minimum_required):
-  Compatibility with CMake < 3.5 has been removed from CMake.
-
-Raise minimum version for all addons.
-
-Upstream: https://github.com/xbmc/screensavers.rsxs/commit/0635422964b6797d693866483d16dff51bcf4b57
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- CMakeLists.txt                    | 2 +-
- depends/common/bz2/CMakeLists.txt | 2 +-
- lib/Implicit/CMakeLists.txt       | 2 +-
- lib/Rgbhsl/CMakeLists.txt         | 2 +-
- lib/kodi/gui/gl/CMakeLists.txt    | 2 +-
- lib/rsMath/CMakeLists.txt         | 2 +-
- src/biof/CMakeLists.txt           | 2 +-
- src/busyspheres/CMakeLists.txt    | 2 +-
- src/colorfire/CMakeLists.txt      | 2 +-
- src/cyclone/CMakeLists.txt        | 2 +-
- src/drempels/CMakeLists.txt       | 2 +-
- src/euphoria/CMakeLists.txt       | 2 +-
- src/feedback/CMakeLists.txt       | 2 +-
- src/fieldlines/CMakeLists.txt     | 2 +-
- src/flocks/CMakeLists.txt         | 2 +-
- src/flux/CMakeLists.txt           | 2 +-
- src/helios/CMakeLists.txt         | 2 +-
- src/hufosmoke/CMakeLists.txt      | 2 +-
- src/hufotunnel/CMakeLists.txt     | 2 +-
- src/hyperspace/CMakeLists.txt     | 2 +-
- src/lattice/CMakeLists.txt        | 2 +-
- src/lorenz/CMakeLists.txt         | 2 +-
- src/matrixview/CMakeLists.txt     | 2 +-
- src/microcosm/CMakeLists.txt      | 2 +-
- src/plasma/CMakeLists.txt         | 2 +-
- src/skyrocket/CMakeLists.txt      | 2 +-
- src/solarwinds/CMakeLists.txt     | 2 +-
- src/spirographx/CMakeLists.txt    | 2 +-
- src/sundancer2/CMakeLists.txt     | 2 +-
- 29 files changed, 29 insertions(+), 29 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index e93c31bc..1a9ca89c 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensavers.rsxs)
- 
- set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${PROJECT_SOURCE_DIR})
-diff --git a/depends/common/bz2/CMakeLists.txt b/depends/common/bz2/CMakeLists.txt
-index 6b1a0a56..b83f34dd 100644
---- a/depends/common/bz2/CMakeLists.txt
-+++ b/depends/common/bz2/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(bzip2)
- 
- if(NOT WIN32)
-diff --git a/lib/Implicit/CMakeLists.txt b/lib/Implicit/CMakeLists.txt
-index eef20e3b..14fb63d7 100644
---- a/lib/Implicit/CMakeLists.txt
-+++ b/lib/Implicit/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.0)
-+cmake_minimum_required(VERSION 3.5...4.0)
- 
- project(Implicit)
- 
-diff --git a/lib/Rgbhsl/CMakeLists.txt b/lib/Rgbhsl/CMakeLists.txt
-index 984ce9ba..ca01c592 100644
---- a/lib/Rgbhsl/CMakeLists.txt
-+++ b/lib/Rgbhsl/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.0)
-+cmake_minimum_required(VERSION 3.5...4.0)
- 
- project(Rgbhsl)
- 
-diff --git a/lib/kodi/gui/gl/CMakeLists.txt b/lib/kodi/gui/gl/CMakeLists.txt
-index 6fc4d87b..1b096d79 100644
---- a/lib/kodi/gui/gl/CMakeLists.txt
-+++ b/lib/kodi/gui/gl/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- 
- project(kodiOpenGL)
- 
-diff --git a/lib/rsMath/CMakeLists.txt b/lib/rsMath/CMakeLists.txt
-index cc31d308..76100e89 100644
---- a/lib/rsMath/CMakeLists.txt
-+++ b/lib/rsMath/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.0)
-+cmake_minimum_required(VERSION 3.5...4.0)
- 
- project(rsMath)
- 
-diff --git a/src/biof/CMakeLists.txt b/src/biof/CMakeLists.txt
-index 810bec46..ec344ba8 100644
---- a/src/biof/CMakeLists.txt
-+++ b/src/biof/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.biof)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/busyspheres/CMakeLists.txt b/src/busyspheres/CMakeLists.txt
-index 41650ca6..cc829bd9 100644
---- a/src/busyspheres/CMakeLists.txt
-+++ b/src/busyspheres/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.busyspheres)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/colorfire/CMakeLists.txt b/src/colorfire/CMakeLists.txt
-index 3667cbd4..f8da4884 100644
---- a/src/colorfire/CMakeLists.txt
-+++ b/src/colorfire/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.colorfire)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/cyclone/CMakeLists.txt b/src/cyclone/CMakeLists.txt
-index 8af4172f..084f928b 100644
---- a/src/cyclone/CMakeLists.txt
-+++ b/src/cyclone/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.cyclone)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/drempels/CMakeLists.txt b/src/drempels/CMakeLists.txt
-index 1ebd427f..d4c38a95 100644
---- a/src/drempels/CMakeLists.txt
-+++ b/src/drempels/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.drempels)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/euphoria/CMakeLists.txt b/src/euphoria/CMakeLists.txt
-index d3f55ee3..de2e2f67 100644
---- a/src/euphoria/CMakeLists.txt
-+++ b/src/euphoria/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.euphoria)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/feedback/CMakeLists.txt b/src/feedback/CMakeLists.txt
-index b37c430a..fd417d61 100644
---- a/src/feedback/CMakeLists.txt
-+++ b/src/feedback/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.feedback)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/fieldlines/CMakeLists.txt b/src/fieldlines/CMakeLists.txt
-index de60dda8..b0dc30b6 100644
---- a/src/fieldlines/CMakeLists.txt
-+++ b/src/fieldlines/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.fieldlines)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/flocks/CMakeLists.txt b/src/flocks/CMakeLists.txt
-index c2b4a793..a15db4d8 100644
---- a/src/flocks/CMakeLists.txt
-+++ b/src/flocks/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.flocks)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/flux/CMakeLists.txt b/src/flux/CMakeLists.txt
-index a2de0b2a..6aeda787 100644
---- a/src/flux/CMakeLists.txt
-+++ b/src/flux/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.flux)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/helios/CMakeLists.txt b/src/helios/CMakeLists.txt
-index d64a6194..6feb0ac2 100644
---- a/src/helios/CMakeLists.txt
-+++ b/src/helios/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.helios)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/hufosmoke/CMakeLists.txt b/src/hufosmoke/CMakeLists.txt
-index 44d13231..b4fe79a5 100644
---- a/src/hufosmoke/CMakeLists.txt
-+++ b/src/hufosmoke/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.hufosmoke)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/hufotunnel/CMakeLists.txt b/src/hufotunnel/CMakeLists.txt
-index b18ce736..f8c67c85 100644
---- a/src/hufotunnel/CMakeLists.txt
-+++ b/src/hufotunnel/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.hufotunnel)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/hyperspace/CMakeLists.txt b/src/hyperspace/CMakeLists.txt
-index 6bd303e2..5733be37 100644
---- a/src/hyperspace/CMakeLists.txt
-+++ b/src/hyperspace/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.hyperspace)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/lattice/CMakeLists.txt b/src/lattice/CMakeLists.txt
-index ef884e4c..9f9455f4 100644
---- a/src/lattice/CMakeLists.txt
-+++ b/src/lattice/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.lattice)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/lorenz/CMakeLists.txt b/src/lorenz/CMakeLists.txt
-index ab3026f6..35f749d9 100644
---- a/src/lorenz/CMakeLists.txt
-+++ b/src/lorenz/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.lorenz)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/matrixview/CMakeLists.txt b/src/matrixview/CMakeLists.txt
-index d98a8f14..d5f77ec7 100644
---- a/src/matrixview/CMakeLists.txt
-+++ b/src/matrixview/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.matrixview)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/microcosm/CMakeLists.txt b/src/microcosm/CMakeLists.txt
-index d05b639d..65437c28 100644
---- a/src/microcosm/CMakeLists.txt
-+++ b/src/microcosm/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.microcosm)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/plasma/CMakeLists.txt b/src/plasma/CMakeLists.txt
-index e7fc7956..fd25963f 100644
---- a/src/plasma/CMakeLists.txt
-+++ b/src/plasma/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.plasma)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/skyrocket/CMakeLists.txt b/src/skyrocket/CMakeLists.txt
-index 8a89f28f..8e9e0500 100644
---- a/src/skyrocket/CMakeLists.txt
-+++ b/src/skyrocket/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.skyrocket)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/solarwinds/CMakeLists.txt b/src/solarwinds/CMakeLists.txt
-index f1ef41c7..2417edf0 100644
---- a/src/solarwinds/CMakeLists.txt
-+++ b/src/solarwinds/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.solarwinds)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/spirographx/CMakeLists.txt b/src/spirographx/CMakeLists.txt
-index 2ccb751d..41a245d4 100644
---- a/src/spirographx/CMakeLists.txt
-+++ b/src/spirographx/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.spirographx)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/sundancer2/CMakeLists.txt b/src/sundancer2/CMakeLists.txt
-index a0e47a6d..a3bfbbe9 100644
---- a/src/sundancer2/CMakeLists.txt
-+++ b/src/sundancer2/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.sundancer2)
- 
- message(STATUS "--------------------------------------------------------------------------------")
--- 
-2.47.3
-
diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
index 86174991f0..b9378e1576 100644
--- a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
+++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  76c1df60f3b4bf4c61f827e07ac61173e3b72defe6ab54d1a1fa34f1cd6f38ab  kodi-screensaver-rsxs-21.1.2-Omega.tar.gz
+sha256  4e44e6b6e804b81208c6d47f156e63e24d5af0e61fa46d5959c61e00ba2b36a8  kodi-screensaver-rsxs-22.0.7-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
index dcca031b51..f04daed71c 100644
--- a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
+++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_RSXS_VERSION = 21.1.2-Omega
+KODI_SCREENSAVER_RSXS_VERSION = 22.0.7-Piers
 KODI_SCREENSAVER_RSXS_SITE = $(call github,xbmc,screensavers.rsxs,$(KODI_SCREENSAVER_RSXS_VERSION))
 KODI_SCREENSAVER_RSXS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_RSXS_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
