Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16318C76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 19:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0EE16FEB6;
	Mon, 10 Apr 2023 19:39:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0EE16FEB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zJb7NJ52MOOD; Mon, 10 Apr 2023 19:39:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E01676FEA5;
	Mon, 10 Apr 2023 19:39:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E01676FEA5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BA1011C3BA3
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F219B40949
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:36:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F219B40949
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XKrccWTO4FiI for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 19:36:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7BBE40B83
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 19:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7BBE40B83
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B283483D2A; Mon, 10 Apr 2023 19:36:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 10 Apr 2023 21:30:49 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 20fa9e84edf8d0acc29e84f0faa940f511d794fd
X-Git-Newrev: ff7d9c639b0af36c6b9ac56c8bcc0d9972d58ea9
X-Patchwork-Hint: ignore
Message-Id: <20230410193614.B283483D2A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/runc: security
 bump to version v1.1.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=ff7d9c639b0af36c6b9ac56c8bcc0d9972d58ea9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

This is the fifth patch release in the 1.1.z series of runc, which fixes
three CVEs found in runc.

CVE-2023-25809 is a vulnerability involving rootless containers where
(under specific configurations), the container would have write access to the
/sys/fs/cgroup/user.slice/... cgroup hierarchy. No other hierarchies on the host
were affected. This vulnerability was discovered by Akihiro Suda.
GHSA-m8cg-xc2p-r3fc

CVE-2023-27561 was a regression which effectively re-introduced CVE-2019-19921.
This bug was present from v1.0.0-rc95 to v1.1.4. This regression was discovered
by Beuc. GHSA-vpvm-3wq2-2wvm

CVE-2023-28642 is a variant of CVE-2023-27561 and was fixed by the same patch.
This variant of the above vulnerability was reported by Lei Wang.
GHSA-g2j6-57v7-gm8c

In addition, the following other fixes are included in this release:

 - Fix the inability to use /dev/null when inside a container
 - Fix changing the ownership of host's /dev/null caused by fd redirection
 - Fix rare runc exec/enter unshare error on older kernels, including CentOS < 7.7
 - nsexec: Check for errors in write_log()

https://github.com/opencontainers/runc/releases/tag/v1.1.5

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 52976c54f76758aeab53f4b7777299cd5c8a3150)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index 6c8fddd397..eee2e34cbf 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4f02077432642eebd768fc857318ae7929290b3a3511eb1be338005e360cfa34  runc-1.1.4.tar.gz
+sha256  76cbf30637cbb828794d72d32fb3fd6ff3139cd9743b8b44790fd110f43d96b2  runc-1.1.5.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 5b559981e3..088b577856 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUNC_VERSION = 1.1.4
+RUNC_VERSION = 1.1.5
 RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0, LGPL-2.1 (libseccomp)
 RUNC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
