Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C8BC636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 11:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7F4C60B6C;
	Tue,  7 Feb 2023 11:32:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7F4C60B6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BGUQVsg4Xtuy; Tue,  7 Feb 2023 11:32:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8331F60B95;
	Tue,  7 Feb 2023 11:32:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8331F60B95
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EF9FC1BF2AF
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 11:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA56340273
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 11:32:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA56340273
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0UgehsIYmcmm for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 11:32:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4D4540232
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 11:32:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4D4540232
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D09B184074; Tue,  7 Feb 2023 11:32:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 12:32:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 231d00e63ac08c98d7e823c3bd60a618ff322577
X-Git-Newrev: 8a9da9a8cad5f77902547fab3b24d04175749a7c
X-Patchwork-Hint: ignore
Message-Id: <20230207113249.D09B184074@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-idna: set _SETUP_TYPE = flit
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8a9da9a8cad5f77902547fab3b24d04175749a7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Python idna package switched to pyproject.toml in commit:
https://github.com/kjd/idna/commit/2a00e518efe55d2eeb62cd3f88ace7db41338603
which is included in idna v3.4.

When using the old setuptools infra, the package is incorrectly
installed as v0.0, which is then incorrectly detected by other
packages when using setuptools pkg_resources.

The issue can be reproduced with the command:

    python3 <<EOF
    __requires__ = ["idna >= 2.5"]
    import pkg_resources
    EOF

which will fail with output:

    pkg_resources.ContextualVersionConflict: (idna 0.0.0 (/usr/lib/python3.11/site-packages), Requirement.parse('idna>=2.5'), {'hyperlink'})
    pkg_resources.DistributionNotFound: The 'idna>=2.5' distribution was not found and is required by hyperlink

This commit changes _SETUP_TYPE to "flit" to fix this issue.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Reviewed-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-idna/python-idna.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-idna/python-idna.mk b/package/python-idna/python-idna.mk
index 4d9994a9c7..3976cb1518 100644
--- a/package/python-idna/python-idna.mk
+++ b/package/python-idna/python-idna.mk
@@ -9,7 +9,7 @@ PYTHON_IDNA_SOURCE = idna-$(PYTHON_IDNA_VERSION).tar.gz
 PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/8b/e1/43beb3d38dba6cb420cefa297822eac205a277ab43e5ba5d5c46faf96438
 PYTHON_IDNA_LICENSE = BSD-3-Clause
 PYTHON_IDNA_LICENSE_FILES = LICENSE.md
-PYTHON_IDNA_SETUP_TYPE = setuptools
+PYTHON_IDNA_SETUP_TYPE = flit
 
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
