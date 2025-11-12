Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B82CD3443
	for <buildroot@archiver.kernel.org>; Wed, 12 Nov 2025 19:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 617EF82EE1;
	Wed, 12 Nov 2025 19:13:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t1YsOFxmjWVT; Wed, 12 Nov 2025 19:13:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1D5C82E9C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1D5C82E9C;
	Wed, 12 Nov 2025 19:13:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A0825230
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 19:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86B8740072
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 19:13:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k4lWaw9YA3fl for <buildroot@buildroot.org>;
 Wed, 12 Nov 2025 19:13:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7A5F64002C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A5F64002C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A5F64002C
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 19:13:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bd38.dip0.t-ipconnect.de [84.161.189.56])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3B5F6A4C5A96
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 20:12:58 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52600)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vJGH3-000000000PU-3Ug4
 for buildroot@buildroot.org; Wed, 12 Nov 2025 19:12:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 12 Nov 2025 20:12:57 +0100
Message-ID: <20251112191257.3727401-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1762974778;
 bh=BA/590pUd/QQeDJOgJK5CPgOi1DvZLCE1516qiKTQV0=;
 h=From:To:Subject:Date:From;
 b=zbHyYrIvPb+4vDr+G1C9hGy1dbGtWGIdwHgeqNXuGpJWxz8Yd6bmkmdOqjK/OWraP
 4ad5VcfymebPLVMWFn88ZQQkKhJKSV3tDITR8lPn7LrWYSEY4cP3yyCaI1Hd4igLOd
 /P8/HtIWFHG2L5z1zl95iSly94P43G4Sm/J3BoKTmwBX+TbmhIMAFFqWo2emXrsqaM
 +CdR6lirKFsDjn+Z+XLfWJg/CDJ957/74NaVk7muiOytzAGYdGbp6Glitysb6SemOC
 3JEJSATBTd0nfR8v5GHBNhXif/zNbB8/TEnH7GDLMcsLcC6mC4rxQ7UfD2ICwUga5h
 wvdGDU0SFIAXw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=zbHyYrIv
Subject: [Buildroot] [PATCH 1/1] package/sqlite: bump version to 3.51.0
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

Release notes: https://sqlite.org/releaselog/3_51_0.html

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/sqlite/0001-disable-rpath.patch | 59 -------------------------
 package/sqlite/sqlite.hash              |  2 +-
 package/sqlite/sqlite.mk                |  4 +-
 3 files changed, 3 insertions(+), 62 deletions(-)
 delete mode 100644 package/sqlite/0001-disable-rpath.patch

diff --git a/package/sqlite/0001-disable-rpath.patch b/package/sqlite/0001-disable-rpath.patch
deleted file mode 100644
index 6eb20488b0..0000000000
--- a/package/sqlite/0001-disable-rpath.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-Add the --disable-rpath configure script flag to address
-
-Upstream: https://sqlite.org/src/info/a59d9bb25e
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
-
-Index: autosetup/sqlite-config.tcl
-==================================================================
---- a/autosetup/sqlite-config.tcl
-+++ b/autosetup/sqlite-config.tcl
-@@ -334,12 +334,12 @@
-         # canonical build!
-         static-shell=1
-           => {Link the sqlite3 shell app against the DLL instead of embedding sqlite3.c}
-       }
-       {canonical autoconf} {
--        # A potential TODO without a current use case:
--        #rpath=1 => {Disable use of the rpath linker flag}
-+        rpath=1 => {Disable use of the rpath linker flag}
-+
-         # soname: https://sqlite.org/src/forumpost/5a3b44f510df8ded
-         soname:=legacy
-           => {SONAME for libsqlite3.so. "none", or not using this flag, sets no
-               soname. "legacy" sets it to its historical value of
-               libsqlite3.so.0.  A value matching the glob "libsqlite3.*" sets
-@@ -2138,25 +2138,25 @@
- }
- 
- ########################################################################
- # Handle the --enable/disable-rpath flag.
- proc sqlite-handle-rpath {} {
--  proj-check-rpath
-   # autosetup/cc-shared.tcl sets the rpath flag definition in
-   # [get-define SH_LINKRPATH], but it does so on a per-platform basis
-   # rather than as a compiler check. Though we should do a proper
-   # compiler check (as proj-check-rpath does), we may want to consider
-   # adopting its approach of clearing the rpath flags for environments
-   # for which sqlite-env-is-unix-on-windows returns a non-empty
-   # string.
- 
--#  if {[proj-opt-truthy rpath]} {
--#    proj-check-rpath
--#  } else {
--#    msg-result "Disabling use of rpath."
--#    define LDFLAGS_RPATH ""
--#  }
-+  # https://sqlite.org/forum/forumpost/13cac3b56516f849
-+  if {[proj-opt-truthy rpath]} {
-+    proj-check-rpath
-+  } else {
-+    msg-result "Disabling use of rpath."
-+    define LDFLAGS_RPATH ""
-+  }
- }
- 
- ########################################################################
- # If the --dump-defines configure flag is provided then emit a list of
- # all [define] values to config.defines.txt, else do nothing.
-
diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 2ade5afe03..e33c87f34e 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a3db587a1b92ee5ddac2f66b3edb41b26f9c867275782d46c3a088977d6a5b18  sqlite-autoconf-3500400.tar.gz
+sha256  42e26dfdd96aa2e6b1b1be5c88b0887f9959093f650d693cb02eb9c36d146ca5  sqlite-autoconf-3510000.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 667ee8d70e..13ae9d9281 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.50.4
-SQLITE_TAR_VERSION = 3500400
+SQLITE_VERSION = 3.51.0
+SQLITE_TAR_VERSION = 3510000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2025
 SQLITE_LICENSE = blessing
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
