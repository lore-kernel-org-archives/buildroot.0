Return-Path: <SRS0=JPVL=O4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8695C433EF
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 10:48:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93EEC60FC1
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 10:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 93EEC60FC1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48BA48413E;
	Fri,  8 Oct 2021 10:48:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 42tqtdhvYmh1; Fri,  8 Oct 2021 10:48:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A171B84106;
	Fri,  8 Oct 2021 10:48:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 85F461C1127
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 10:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80E774019B
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 10:48:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id su2ZZnpRpa41 for <buildroot@lists.busybox.net>;
 Fri,  8 Oct 2021 10:48:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 935784018D
 for <buildroot@buildroot.org>; Fri,  8 Oct 2021 10:48:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3E13C93530; Fri,  8 Oct 2021 10:45:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 8 Oct 2021 12:47:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7af7546f9acdefacac0e86e11c69e6e8cd3d2050
X-Git-Newrev: 29b6114acfefc5146410c722f9412a7ac31910c8
X-Patchwork-Hint: ignore
Message-Id: <20211008104542.3E13C93530@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openssh: security bump to version
 8.8p1
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

commit: https://git.buildroot.net/buildroot/commit/?id=29b6114acfefc5146410c722f9412a7ac31910c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2021-41617: sshd in OpenSSH 6.2 through 8.x before 8.8, when
certain non-default configurations are used, allows privilege escalation
because supplemental groups are not initialized as expected. Helper
programs for AuthorizedKeysCommand and AuthorizedPrincipalsCommand may
run with privileges associated with group memberships of the sshd
process, if the configuration specifies running the command as a
different user.

https://www.openssh.com/txt/release-8.8
https://www.openssh.com/txt/release-8.7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssh/openssh.hash | 4 ++--
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 0dcd725de5..aab3dba09c 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-8.6 (base64 encoded)
-sha256  c3e6e4da1621762c850d03b47eed1e48dff4cc9608ddeb547202a234df8ed7ae  openssh-8.6p1.tar.gz
+# From https://www.openssh.com/txt/release-8.8 (base64 encoded)
+sha256  4590890ea9bb9ace4f71ae331785a3a5823232435161960ed5fc86588f331fe9  openssh-8.8p1.tar.gz
 # Locally calculated
 sha256  432abf7480fb31473a6706627212913fc70032e3fb71b90fecb28ae26a2d741d  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 61b2c97cf4..75c4a0128b 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION_MAJOR = 8.6
+OPENSSH_VERSION_MAJOR = 8.8
 OPENSSH_VERSION_MINOR = p1
 OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
 OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
