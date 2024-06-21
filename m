Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738DCC27C4F
	for <buildroot@archiver.kernel.org>; Fri, 21 Jun 2024 21:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B1F18100F;
	Fri, 21 Jun 2024 21:24:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gvGJJvYYvHEn; Fri, 21 Jun 2024 21:24:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F42A810A0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F42A810A0;
	Fri, 21 Jun 2024 21:24:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B1681BF834
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 21:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8431240168
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 21:24:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WfbmHe-9E95z for <buildroot@lists.busybox.net>;
 Fri, 21 Jun 2024 21:24:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C91140153
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C91140153
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 21:24:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D9470825CF; Fri, 21 Jun 2024 21:24:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Jun 2024 23:14:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4aff617b9591dc46d965eaa00f9701943e0cd723
X-Git-Newrev: 6701a91e69a1dd1d5afdf627565936cf7df5cf70
X-Patchwork-Hint: ignore
Message-Id: <20240621212407.D9470825CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgit2: bump version to 1.8.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6701a91e69a1dd1d5afdf627565936cf7df5cf70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream notes that libhttp-parser is unmaintained and suggest llhttp
as a replacement.  This version bundles llhttp (and includes its license
in COPYING) but still allows to use a system-provided libhttp-parser.

llhttp (https://github.com/nodejs/llhttp) is a C library that depends on
a nodejs interpreter and more than 10 npm dependencies to generate its
parser code.  The bundled version contains the generated sources and
could be built without nodejs.  But distributing this generated code
as part of libgit2 would probably be legally dubious because of the
GPL's original source code provision, even if llhttp is MIT-licensed.

Packaging llhttp would be a daunting task and its build will require
considerable time and space, so for now, keep using libhttp-parser.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/libgit2/libgit2.hash | 4 ++--
 package/libgit2/libgit2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index 20e6929265..c02a149a68 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9e1d6a880d59026b675456fbb1593c724c68d73c34c0d214d6eb848e9bbd8ae4  libgit2-1.8.0.tar.gz
-sha256  08041a7e9c4d0e5e84f9711c824a0bd0366ee782ec29c6d7275fdab73e2ca115  COPYING
+sha256  8c1eaf0cf07cba0e9021920bfba9502140220786ed5d8a8ec6c7ad9174522f8e  libgit2-1.8.1.tar.gz
+sha256  e3712465634e97cfd850822a4eb5ac7d2f8a10f753189366d5a2060046f28288  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 3364841e8f..e817a5916a 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.8.0
+LIBGIT2_VERSION = 1.8.1
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = \
 	GPL-2.0 with linking exception, \
@@ -22,7 +22,7 @@ LIBGIT2_CONF_OPTS = \
 	-DUSE_GSSAPI=OFF \
 	-DUSE_ICONV=ON \
 	-DREGEX_BACKEND=regcomp \
-	-DUSE_HTTP_PARSER=system \
+	-DUSE_HTTP_PARSER=http-parser \
 	-DUSE_NTLMCLIENT=OFF \
 	-DUSE_XDIFF=builtin \
 	-DUSE_THREADS=$(if $(BR2_TOOLCHAIN_HAS_THREADS),ON,OFF)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
