Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B409C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 12:35:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE0CF6109E
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 12:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE0CF6109E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BDB4440359;
	Tue, 14 Sep 2021 12:35:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BqU3NIcvTcQD; Tue, 14 Sep 2021 12:35:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBBF5402F4;
	Tue, 14 Sep 2021 12:35:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3210E1BF989
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 12:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B0D280DEE
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 12:35:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XMLILvrs_1SV for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 12:35:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 553E680CD7
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 12:35:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 701AA8A649; Tue, 14 Sep 2021 12:33:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 14:13:41 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 2b33ea382f5d610f5254340b7b05b6525ddafd1d
X-Git-Newrev: 8addd366a3d7a360d65aaa3b09cab20a3673192a
X-Patchwork-Hint: ignore
Message-Id: <20210914123327.701AA8A649@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/libssh: security
 bump to version 0.9.6
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8addd366a3d7a360d65aaa3b09cab20a3673192a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Fix CVE-2021-3634: A flaw has been found in libssh in versions prior to
0.9.6. The SSH protocol keeps track of two shared secrets during the
lifetime of the session. One of them is called secret_hash and the other
session_id. Initially, both of them are the same, but after key
re-exchange, previous session_id is kept and used as an input to new
secret_hash. Historically, both of these buffers had shared length
variable, which worked as long as these buffers were same. But the key
re-exchange operation can also change the key exchange method, which can
be based on hash of different size, eventually creating "secret_hash" of
different size than the session_id has. This becomes an issue when the
session_id memory is zeroed or when it is used again during second key
re-exchange.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 88cb451446e18ef657400e7df55dcfb56df521f9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libssh/libssh.hash | 4 ++--
 package/libssh/libssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libssh/libssh.hash b/package/libssh/libssh.hash
index bc6fa3f1f8..4dbab11374 100644
--- a/package/libssh/libssh.hash
+++ b/package/libssh/libssh.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.libssh.org/files/0.9/libssh-0.9.5.tar.xz.asc
+# https://www.libssh.org/files/0.9/libssh-0.9.6.tar.xz.asc
 # with key 8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D
-sha256  acffef2da98e761fc1fd9c4fddde0f3af60ab44c4f5af05cd1b2d60a3fa08718  libssh-0.9.5.tar.xz
+sha256  86bcf885bd9b80466fe0e05453c58b877df61afa8ba947a58c356d7f0fab829b  libssh-0.9.6.tar.xz
 sha256  1656186e951db1c010a8485481fa94587f7e53a26d24976bef97945ad0c4df5a  COPYING
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index eeb5d8489a..4cadf83aee 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSSH_VERSION_MAJOR = 0.9
-LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).5
+LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).6
 LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
 LIBSSH_SITE = https://www.libssh.org/files/$(LIBSSH_VERSION_MAJOR)
 LIBSSH_LICENSE = LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
