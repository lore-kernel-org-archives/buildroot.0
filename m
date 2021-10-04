Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36445C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 21:40:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADE5161425
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 21:40:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ADE5161425
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8151583C3A;
	Mon,  4 Oct 2021 21:40:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ABQGZBogSDTy; Mon,  4 Oct 2021 21:40:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE3B183C3C;
	Mon,  4 Oct 2021 21:40:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 320681BF20F
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 21:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 220CB83C3C
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 21:40:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 53k8hTe_urvc for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 21:40:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AB4083C3A
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 21:40:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 390188F29D; Mon,  4 Oct 2021 21:37:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Oct 2021 23:03:26 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 5ac8c8469355e6a15f3318cb966f04f0a2715192
X-Git-Newrev: cf949134b7371e23c4a8b44fc8b1d646628dfbce
X-Patchwork-Hint: ignore
Message-Id: <20211004213744.390188F29D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/python-pip:
 backport security fix for CVE-2021-3572
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf949134b7371e23c4a8b44fc8b1d646628dfbce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Backport the following security fix from the upstream 21.1 release fixing
CVE-2021-3572:

https://github.com/pypa/pip/pull/9827

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...plit-git-references-on-unicode-separators.patch | 45 ++++++++++++++++++++++
 package/python-pip/python-pip.mk                   |  3 ++
 2 files changed, 48 insertions(+)

diff --git a/package/python-pip/0001-Don-t-split-git-references-on-unicode-separators.patch b/package/python-pip/0001-Don-t-split-git-references-on-unicode-separators.patch
new file mode 100644
index 0000000000..0e591550d3
--- /dev/null
+++ b/package/python-pip/0001-Don-t-split-git-references-on-unicode-separators.patch
@@ -0,0 +1,45 @@
+From 62300cf398faacdd0e490b0a1400dec2558612bf Mon Sep 17 00:00:00 2001
+From: Pradyun Gedam <pradyunsg@users.noreply.github.com>
+Date: Sat, 24 Apr 2021 10:13:15 +0100
+Subject: [PATCH] Don't split git references on unicode separators
+
+Previously, maliciously formatted tags could be used to hijack a
+commit-based pin. Using the fact that the split here allowed for
+all of unicode's whitespace characters as separators -- which git allows
+as a part of a tag name -- it is possible to force a different revision
+to be installed; if an attacker gains access to the repository.
+
+This change stops splitting the string on unicode characters, by forcing
+the splits to happen on newlines and ASCII spaces.
+
+(cherry picked from commit ca832b2836e0bffa7cf95589acdcd71230f5834e)
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/pip/_internal/vcs/git.py | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/src/pip/_internal/vcs/git.py b/src/pip/_internal/vcs/git.py
+index 7483303a9..d706064e7 100644
+--- a/src/pip/_internal/vcs/git.py
++++ b/src/pip/_internal/vcs/git.py
+@@ -137,9 +137,15 @@ class Git(VersionControl):
+         output = cls.run_command(['show-ref', rev], cwd=dest,
+                                  show_stdout=False, on_returncode='ignore')
+         refs = {}
+-        for line in output.strip().splitlines():
++        # NOTE: We do not use splitlines here since that would split on other
++        #       unicode separators, which can be maliciously used to install a
++        #       different revision.
++        for line in output.strip().split("\n"):
++            line = line.rstrip("\r")
++            if not line:
++                continue
+             try:
+-                sha, ref = line.split()
++                sha, ref = line.split(" ", maxsplit=2)
+             except ValueError:
+                 # Include the offending line to simplify troubleshooting if
+                 # this error ever occurs.
+-- 
+2.20.1
+
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index 71f76e2842..e37d526a73 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -14,4 +14,7 @@ PYTHON_PIP_LICENSE_FILES = LICENSE.txt
 PYTHON_PIP_CPE_ID_VENDOR = pypa
 PYTHON_PIP_CPE_ID_PRODUCT = pip
 
+#0001-Don-t-split-git-references-on-unicode-separators.patch
+PYTHON_PIP_IGNORE_CVES += CVE-2021-3572
+
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
