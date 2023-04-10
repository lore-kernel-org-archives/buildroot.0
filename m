Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1557DC76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 19:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9B946FEDC;
	Mon, 10 Apr 2023 19:41:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9B946FEDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wQnxmYd7Wtes; Mon, 10 Apr 2023 19:41:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE91E6FEE9;
	Mon, 10 Apr 2023 19:41:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE91E6FEE9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7E9931C3B6F
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74EB9417AE
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74EB9417AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id THzqohTI22x7 for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 19:37:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC675417C7
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 19:37:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC675417C7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC54B83DD4; Mon, 10 Apr 2023 19:37:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 10 Apr 2023 21:07:30 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 2bc49f4cb25678c2d941807c2dbfe2384a31c2b5
X-Git-Newrev: a23d06e96cd4eb6bd8feb03cf4cf0e1422072626
X-Patchwork-Hint: ignore
Message-Id: <20230410193722.DC54B83DD4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/openssh: security
 bump to version 9.3p1
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

commit: https://git.buildroot.net/buildroot/commit/?id=a23d06e96cd4eb6bd8feb03cf4cf0e1422072626
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

From [1]:

 * sshd(8): fix a pre-authentication double-free memory fault
   introduced in OpenSSH 9.1. This is not believed to be exploitable,
   and it occurs in the unprivileged pre-auth process that is
   subject to chroot(2) and is further sandboxed on most major
   platforms.

 * ssh(8): in OpenSSH releases after 8.7, the PermitRemoteOpen option
   would ignore its first argument unless it was one of the special
   keywords "any" or "none", causing the permission list to fail open
   if only one permission was specified. bz3515

 * ssh(1): if the CanonicalizeHostname and CanonicalizePermittedCNAMEs
   options were enabled, and the system/libc resolver did not check
   that names in DNS responses were valid, then use of these options
   could allow an attacker with control of DNS to include invalid
   characters (possibly including wildcards) in names added to
   known_hosts files when they were updated. These names would still
   have to match the CanonicalizePermittedCNAMEs allow-list, so
   practical exploitation appears unlikely.

From [2]:

* ssh-add(1): when adding smartcard keys to ssh-agent(1) with the
   per-hop destination constraints (ssh-add -h ...) added in OpenSSH
   8.9, a logic error prevented the constraints from being
   communicated to the agent. This resulted in the keys being added
   without constraints. The common cases of non-smartcard keys and
   keys without destination constraints are unaffected. This problem
   was reported by Luci Stanescu.

 * ssh(1): Portable OpenSSH provides an implementation of the
   getrrsetbyname(3) function if the standard library does not
   provide it, for use by the VerifyHostKeyDNS feature. A
   specifically crafted DNS response could cause this function to
   perform an out-of-bounds read of adjacent stack data, but this
   condition does not appear to be exploitable beyond denial-of-
   service to the ssh(1) client.

   The getrrsetbyname(3) replacement is only included if the system's
   standard library lacks this function and portable OpenSSH was not
   compiled with the ldns library (--with-ldns). getrrsetbyname(3) is
   only invoked if using VerifyHostKeyDNS to fetch SSHFP records. This
   problem was found by the Coverity static analyzer.

[1] https://www.openssh.com/txt/release-9.2
[2] https://www.openssh.com/txt/release-9.3

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 68ca5f1e1f9f3f79e5a48928ad2dfac0cceee843)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssh/openssh.hash | 4 ++--
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index eefb11ec15..2be54431ec 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-9.1 (base64 encoded)
-sha256  19f85009c7e3e23787f0236fbb1578392ab4d4bf9f8ec5fe6bc1cd7e8bfdd288  openssh-9.1p1.tar.gz
+# From https://www.openssh.com/txt/release-9.3 (base64 encoded)
+sha256  e9baba7701a76a51f3d85a62c383a3c9dcd97fa900b859bc7db114c1868af8a8  openssh-9.3p1.tar.gz
 # Locally calculated
 sha256  05c30446ba738934b3f1efa965b454c122ca26cc4b268e5ae6843f58ccd1b16d  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index b70e327620..26d6bd504d 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION_MAJOR = 9.1
+OPENSSH_VERSION_MAJOR = 9.3
 OPENSSH_VERSION_MINOR = p1
 OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
 OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
