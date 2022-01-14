Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFAA6C433EF
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 16:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 679EE404C0;
	Fri, 14 Jan 2022 16:18:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vBicNpLKZRfy; Fri, 14 Jan 2022 16:18:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C2CD404C4;
	Fri, 14 Jan 2022 16:18:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B2FB61C1162
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 16:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1C3C60A7E
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 16:18:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Y3b3_F_zg05 for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 16:18:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2D6660B57
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 16:18:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BF4D680127; Fri, 14 Jan 2022 16:11:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jan 2022 17:05:45 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 816b35a37ec96639dd61f54ab1017d1cefd72809
X-Git-Newrev: 53b28814de5c18a5305e717b6ecc3ba3988a93c8
X-Patchwork-Hint: ignore
Message-Id: <20220114161146.BF4D680127@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/runc: security
 bump to version 1.0.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=53b28814de5c18a5305e717b6ecc3ba3988a93c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
(cherry picked from commit 0acaad1be2a41aecd78ab36fdeb3095d395c8d90)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
