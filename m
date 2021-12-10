Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F11C433FE
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 20:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E811885349;
	Fri, 10 Dec 2021 20:40:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tHza-9vA5vho; Fri, 10 Dec 2021 20:40:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44EC385340;
	Fri, 10 Dec 2021 20:40:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4B1511BF28E
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 20:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 466B841329
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 20:40:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kEz2TjdJBn0K for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 20:40:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5485540129
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 20:40:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 6D40082588; Fri, 10 Dec 2021 20:35:04 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 10 Dec 2021 21:39:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5bbedea9c2317bfb04d1efd5fb157e725e86c2fb
X-Git-Newrev: 0acaad1be2a41aecd78ab36fdeb3095d395c8d90
X-Patchwork-Hint: ignore
Message-Id: <20211210203504.6D40082588@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/runc: security bump to version
 1.0.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=0acaad1be2a41aecd78ab36fdeb3095d395c8d90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2021-43784: runc is a CLI tool for spawning and running
containers on Linux according to the OCI specification. In runc, netlink
is used internally as a serialization system for specifying the relevant
container configuration to the `C` portion of the code (responsible for
the based namespace setup of containers). In all versions of runc prior
to 1.0.3, the encoder did not handle the possibility of an integer
overflow in the 16-bit length field for the byte array attribute type,
meaning that a large enough malicious byte array attribute could result
in the length overflowing and the attribute contents being parsed as
netlink messages for container configuration. This vulnerability
requires the attacker to have some control over the configuration of the
container and would allow the attacker to bypass the namespace
restrictions of the container by simply adding their own netlink payload
which disables all namespaces. The main users impacted are those who
allow untrusted images with untrusted configurations to run on their
machines (such as with shared cloud infrastructure). runc version 1.0.3
contains a fix for this bug. As a workaround, one may try disallowing
untrusted namespace paths from your container. It should be noted that
untrusted namespace paths would allow the attacker to disable namespace
protections entirely even in the absence of this bug.

https://github.com/opencontainers/runc/releases/tag/v1.0.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index 365beac21d..4ef04132bf 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6c3cca4bbeb5d9b2f5e3c0c401c9d27bc8a5d2a0db8a2f6a06efd03ad3c38a33  runc-1.0.2.tar.gz
+sha256  0eaf2f6606d72f166a5e7138a8a8d4d8f85d84e43448c08c66a1c93ead17a574  runc-1.0.3.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index e77ef8111e..c4e45a00a9 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUNC_VERSION = 1.0.2
+RUNC_VERSION = 1.0.3
 RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0
 RUNC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
