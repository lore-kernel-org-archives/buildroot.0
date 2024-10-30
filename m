Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F55D6B6D0
	for <buildroot@archiver.kernel.org>; Wed, 30 Oct 2024 19:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13E8A608A9;
	Wed, 30 Oct 2024 19:46:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V5Kx3_hzvy-e; Wed, 30 Oct 2024 19:46:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 079C8608DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 079C8608DA;
	Wed, 30 Oct 2024 19:46:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D6FF5494E
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 19:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4B8D80B63
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 19:46:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dRUVHsaUpTnT for <buildroot@buildroot.org>;
 Wed, 30 Oct 2024 19:46:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCECE80AB9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCECE80AB9
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 19:46:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C1CE984CF1; Wed, 30 Oct 2024 19:46:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Oct 2024 20:45:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c5d6cde7b627f0f09320c0a431e186d78d6f931a
X-Git-Newrev: ebcccdfbd625b2773de705f4519454c131561f17
X-Patchwork-Hint: ignore
Message-Id: <20241030194650.C1CE984CF1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/musl-compat-headers: fix download
 of queue.h
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ebcccdfbd625b2773de705f4519454c131561f17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/sys/queue.h?rev=1.70 now
returns some HTML soup instead of the plain text version of the file,
causing the hash check to fail.

http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/sys/queue.h?rev=1.70;content-type=text%2Fplain
returns the correct data, but the ";" in the URL causes some issues
with the parsing logic in Buildroot.

So let's switch to
https://raw.githubusercontent.com/NetBSD/src/03be82a6b173b3c62116b7a186067fed3004dd44/sys/sys/queue.h
which delivers exactly the same file, but hopefully will be more
stable. The file name changed to just queue.h, but the contents is the
same.

Fixes:

  http://autobuild.buildroot.net/results/57c8078f382f74859076512425b2f1c52f44e95a/
  https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992850 (and many other similar cases)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/musl-compat-headers/musl-compat-headers.hash | 2 +-
 package/musl-compat-headers/musl-compat-headers.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/musl-compat-headers/musl-compat-headers.hash b/package/musl-compat-headers/musl-compat-headers.hash
index 626145df34..27e0afb68c 100644
--- a/package/musl-compat-headers/musl-compat-headers.hash
+++ b/package/musl-compat-headers/musl-compat-headers.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  c13407edd0e33be73cae72514cb234f8612e1c0e54401c9448daffd3a240158b  queue.h?rev=1.70
+sha256  c13407edd0e33be73cae72514cb234f8612e1c0e54401c9448daffd3a240158b  queue.h
diff --git a/package/musl-compat-headers/musl-compat-headers.mk b/package/musl-compat-headers/musl-compat-headers.mk
index 1cfa894879..865b0bae43 100644
--- a/package/musl-compat-headers/musl-compat-headers.mk
+++ b/package/musl-compat-headers/musl-compat-headers.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # No main site, just using extra downloads
-MUSL_COMPAT_HEADERS_QUEUE_H = http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/sys/queue.h?rev=1.70
+MUSL_COMPAT_HEADERS_QUEUE_H = https://raw.githubusercontent.com/NetBSD/src/03be82a6b173b3c62116b7a186067fed3004dd44/sys/sys/queue.h
 
 MUSL_COMPAT_HEADERS_EXTRA_DOWNLOADS = $(MUSL_COMPAT_HEADERS_QUEUE_H)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
