Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC31AC4332F
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 15:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70E89415A3;
	Sat, 15 Oct 2022 15:39:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70E89415A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wwmEg5DP1jF0; Sat, 15 Oct 2022 15:39:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 257F6414E5;
	Sat, 15 Oct 2022 15:39:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 257F6414E5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A9C4F1BF5DE
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 15:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84131414CD
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 15:38:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84131414CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O-pTIkEs02zY for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 15:38:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7479441575
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 15:38:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7479441575
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F72586DCE; Sat, 15 Oct 2022 15:38:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 17:27:52 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: e468e372f997d1ba3320e7f00a95199c466123f3
X-Git-Newrev: ef0daa817d93903379eb544d21704b8cffb31b60
X-Patchwork-Hint: ignore
Message-Id: <20221015153823.4F72586DCE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/openssh: security
 bump to version 9.1p1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ef0daa817d93903379eb544d21704b8cffb31b60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

This release contains fixes for three minor memory safety problems.
None are believed to be exploitable, but we report most memory safety
problems as potential security vulnerabilities out of caution.

 * ssh-keyscan(1): fix a one-byte overflow in SSH- banner processing.
   Reported by Qualys

 * ssh-keygen(1): double free() in error path of file hashing step in
   signing/verify code; GHPR333

 * ssh-keysign(8): double-free in error path introduced in openssh-8.9

https://www.openssh.com/txt/release-9.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit bb571dc3e87d0e84b3ae121e0d4a9c6039a051fa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssh/openssh.hash | 4 ++--
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 4cfdb91484..81cea32d2c 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-9.0 (base64 encoded)
-sha256  03974302161e9ecce32153cfa10012f1e65c8f3750f573a73ab1befd5972a28a  openssh-9.0p1.tar.gz
+# From https://www.openssh.com/txt/release-9.1 (base64 encoded)
+sha256  19f85009c7e3e23787f0236fbb1578392ab4d4bf9f8ec5fe6bc1cd7e8bfdd288  openssh-9.1p1.tar.gz
 # Locally calculated
 sha256  d6807e99f3d159145c659060f57c3fa74e109faa39326dbfc38674cb550fd104  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 0e4253fa74..b70e327620 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION_MAJOR = 9.0
+OPENSSH_VERSION_MAJOR = 9.1
 OPENSSH_VERSION_MINOR = p1
 OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
 OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
