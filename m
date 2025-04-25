Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08A7C369C2
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 16:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A935A42461;
	Fri, 25 Apr 2025 16:49:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g576FK4x4jhb; Fri, 25 Apr 2025 16:49:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D83E2424AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D83E2424AA;
	Fri, 25 Apr 2025 16:49:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 427A331
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2913983B54
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:49:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vW_Mvau4tVx9 for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 16:49:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.44.123;
 helo=mail1.insia.net; envelope-from=guillaume.chaye@zeetim.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 10CDA83BEA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10CDA83BEA
Received: from mail1.insia.net (mail1.insia.net [188.165.44.123])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 10CDA83BEA
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:49:34 +0000 (UTC)
Received: from smtp.insia.net (unknown [192.168.1.24])
 by mail1.insia.net (Postfix) with ESMTP id 13D5F3FA2B;
 Fri, 25 Apr 2025 18:49:28 +0200 (CEST)
Received: from UDERZO.insia.net (unknown [192.168.1.35])
 by smtp.insia.net (Postfix) with ESMTP id 1EFFD5F497;
 Fri, 25 Apr 2025 18:51:21 +0200 (CEST)
From: Guillaume Chaye <guillaume.chaye@zeetim.com>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Guillaume Chaye <guillaume.chaye@zeetim.com>
Date: Fri, 25 Apr 2025 12:49:25 -0400
Message-Id: <20250425164925.314461-1-guillaume.chaye@zeetim.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zeetim.com; s=mail1; t=1745599768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=9xWSL43XjARZ52zEPS7fUPZiHgnTLY5jyQy87YSyA3M=;
 b=rvb/rf++Z0KwxZ4tYf8LlbbpllXyhg96zk6PSoasmwOlJJ7nKcVrXQyENmjqcPIcxyarhV
 QA2guGQQJQr197qT/gGdcNRahS8qqfN+1bLH1G2BzT+Apmf6RmjUO84uqtDza8xcu8lYxo
 YgeakCPlle9wxK3/kLZCh4FkznGZM3rHjOg5muZ2JjMVJVyU1lWph7dbC9UvSQ4Zlpa9yV
 21KiQUhC+ZulM8cUcjBkeE+DHMkHx5vPlWW38vn4J9wYGbbHy9zDkICbURyirZJmKlH3PX
 kfIuZ9FRthgkV6muZub4Q+pxKZb72UaLxUMnBbTadXOYC2cvfxiiHPJWCbQ9dg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zeetim.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=zeetim.com header.i=@zeetim.com header.a=rsa-sha256
 header.s=mail1 header.b=rvb/rf++
Subject: [Buildroot] [PATCHv2 1/1] support/download/dl-wrapper: add basic
 support for smb file download using curl
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

It allows to download files from smb share in buildroot packages.
Usage is specified in manual.

Signed-off-by: Guillaume Chaye <guillaume.chaye@zeetim.com>
---
 docs/manual/adding-packages-generic.adoc | 7 +++++++
 package/pkg-generic.mk                   | 2 +-
 support/download/dl-wrapper              | 2 +-
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-generic.adoc b/docs/manual/adding-packages-generic.adoc
index 7e2e066c16..881beab6e1 100644
--- a/docs/manual/adding-packages-generic.adoc
+++ b/docs/manual/adding-packages-generic.adoc
@@ -337,6 +337,13 @@ not and can not work as people would expect it should:
      for +local+ packages, no patches are applied. If you need to
      still patch the source code, use +LIBFOO_POST_RSYNC_HOOKS+, see
      xref:hooks-rsync[].
+  ** +smb+ for retrieving source code from SMB share. Used by default
+     when +LIBFOO_SITE+ begins with +smb://+.
+	 It uses +curl+ as download backend.
+	 Syntax expected: +LIBFOO_SITE=smb://<server>/<share>/<path>+.
+	 This method might require to define -u option in +LIBFOO_DL_OPTS+
+	 For more informations, please refer to the curl documentation in
+	 +https://curl.se/docs/tutorial.html+
 
 * +LIBFOO_GIT_SUBMODULES+ can be set to +YES+ to create an archive
   with the git submodules in the repository.  This is only available
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f22b6e981a..95ff9135bd 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1260,7 +1260,7 @@ else ifeq ($$($(2)_SITE_METHOD),hg)
 DL_TOOLS_DEPENDENCIES += hg
 else ifeq ($$($(2)_SITE_METHOD),cvs)
 DL_TOOLS_DEPENDENCIES += cvs
-else ifneq ($(filter ftp ftps,$$($(2)_SITE_METHOD)),)
+else ifneq ($(filter ftp ftps smb,$$($(2)_SITE_METHOD)),)
 DL_TOOLS_DEPENDENCIES += curl
 endif # SITE_METHOD
 
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 5445aad5a7..b70c8edbd9 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -96,7 +96,7 @@ main() {
         backend="${backend_urlencode%|*}"
         case "${backend}" in
             git|svn|cvs|bzr|file|scp|hg|sftp) ;;
-            ftp|ftps) backend="curl" ;;
+            ftp|ftps|smb) backend="curl" ;;
             *) backend="wget" ;;
         esac
         uri=${uri#*+}
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
