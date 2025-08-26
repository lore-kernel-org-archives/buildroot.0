Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF6CCA0FF0
	for <buildroot@archiver.kernel.org>; Tue, 26 Aug 2025 22:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 444076081E;
	Tue, 26 Aug 2025 22:02:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KFhWMpnyE3Em; Tue, 26 Aug 2025 22:02:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59F2A60829
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59F2A60829;
	Tue, 26 Aug 2025 22:02:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4943EB8C
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 22:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F4CE60829
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 22:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XNrp8FrNbKoD for <buildroot@buildroot.org>;
 Tue, 26 Aug 2025 22:02:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72BB66081E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72BB66081E
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 22:02:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 667DA87B20; Tue, 26 Aug 2025 22:02:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Aug 2025 23:55:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 36eed021b6cb291e4892e4749e8b123aed328ba4
X-Git-Newrev: c399b6d682c480512622d71ac2317c8494d2d73e
X-Patchwork-Hint: ignore
Message-Id: <20250826220222.667DA87B20@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyroute2: add missing
 python3 ssl dependency
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c399b6d682c480512622d71ac2317c8494d2d73e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
