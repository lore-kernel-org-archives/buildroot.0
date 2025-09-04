Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61098CA101C
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36A9280796;
	Thu,  4 Sep 2025 16:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ujNZyoqXaixT; Thu,  4 Sep 2025 16:14:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B0B48079A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B0B48079A;
	Thu,  4 Sep 2025 16:14:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D3D28106
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFB2540075
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SxUGjaOHXLV9 for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:13:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A85884005F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A85884005F
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A55E887F44; Thu,  4 Sep 2025 16:13:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 13:57:23 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 60d63597000dc5e91d7775176d9debc585ed107e
X-Git-Newrev: 354cc72f99d2062cc0b937dcb88179de83fee2f4
X-Patchwork-Hint: ignore
Message-Id: <20250904161347.A55E887F44@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-pyroute2:
 add missing python3 ssl dependency
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=354cc72f99d2062cc0b937dcb88179de83fee2f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Buildroot commit [1] "package/python-pyroute2: bump to version 0.9.4"
added the python3 ssl runtime dependency while updating the package
in the "next" branch. It incorrectly suggested the dependency was
introduced in version 0.9.4.

This dependency was in fact introduced in upstream commit [2],
first time included in pyroute2 0.8.1, which is the current version
in the Buildroot release stabilization branch. It is worth mentioning
that this package was updated to that version in Buildroot commit [3].

Running the command on target:

    python3 -c 'import pyroute2'

Fails at runtime with error:

    ModuleNotFoundError: No module named '_ssl'

This commit fixes the issue by adding this missing dependency,
the same was it was done in commit [1].

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/786557d859dba7e52c883e5215e53e93fac13b88
[2] https://github.com/svinota/pyroute2/commit/e87c14581b883c12ecadc75bf0fd07bf359de842
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/816641bbe1c60e881526510bd55fb2ed0d740298

Signed-off-by: Yacin Belmihoub-Martel <yacin.belmihoub-martel@silabs.com>
[Julien:
 - reword commit log
 - add the "runtime" comment
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c399b6d682c480512622d71ac2317c8494d2d73e)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/python-pyroute2/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pyroute2/Config.in b/package/python-pyroute2/Config.in
index 9e685f9d1e..2e667165a8 100644
--- a/package/python-pyroute2/Config.in
+++ b/package/python-pyroute2/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_PYROUTE2
 	bool "python-pyroute2"
 	select BR2_PACKAGE_PYTHON3_SQLITE
+	select BR2_PACKAGE_PYTHON3_SSL # runtime
 	help
 	  Python netlink library - Linux network / netns / wireless /
 	  ipset configuration.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
