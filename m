Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B425BC25B77
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 11:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A7FC8196A;
	Wed, 22 May 2024 11:47:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E3DDTlYmgN0t; Wed, 22 May 2024 11:47:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DF1D818BE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DF1D818BE;
	Wed, 22 May 2024 11:47:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5AB0F1C5AB6
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 11:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4557B818BE
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 11:47:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uzlt6v-QM5D1 for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 11:47:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C37D8188D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C37D8188D
 for <buildroot@buildroot.org>; Wed, 22 May 2024 11:47:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4513187505; Wed, 22 May 2024 11:47:02 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 13:44:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 47078cc11862c564ece3242fa7c8d23fcb914a8b
X-Git-Newrev: 4b4ec03998e89003b11692ff7f7dad2453432f4e
X-Patchwork-Hint: ignore
Message-Id: <20240522114702.4513187505@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ml-dtypes: skip dependency
 check
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

commit: https://git.buildroot.net/buildroot/commit/?id=4b4ec03998e89003b11692ff7f7dad2453432f4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package pins overly strict numpy dependency versions apparently
for compatibility reasons that don't appear relevant to buildroot.

This package also appears to pin an overly strict setuptools version
for unclear reasons.

See:
https://github.com/jax-ml/ml_dtypes/blob/v0.3.2/pyproject.toml#L51-L55

To fix this lets just set the --skip-dependency-check build option and
ignore the build dependency version mismatches since they don't appear
to cause any build issues.

This error was introduced when we migrated setuptools to pep517 in
8937db8dd595e0988751e5dbb568e870b07b39cc.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6888691520

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Tested-by: Julien Olivain <ju.o@free.fr>
[Romain: add gitlab-ci link]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/python-ml-dtypes/python-ml-dtypes.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-ml-dtypes/python-ml-dtypes.mk b/package/python-ml-dtypes/python-ml-dtypes.mk
index 676137ecf1..8097265078 100644
--- a/package/python-ml-dtypes/python-ml-dtypes.mk
+++ b/package/python-ml-dtypes/python-ml-dtypes.mk
@@ -10,6 +10,7 @@ PYTHON_ML_DTYPES_SITE = https://files.pythonhosted.org/packages/39/7d/8d85fcba86
 PYTHON_ML_DTYPES_LICENSE = Apache-2.0
 PYTHON_ML_DTYPES_LICENSE_FILES = LICENSE
 PYTHON_ML_DTYPES_SETUP_TYPE = setuptools
+PYTHON_ML_DTYPES_BUILD_OPTS = --skip-dependency-check
 
 PYTHON_ML_DTYPES_DEPENDENCIES = \
 	host-python-numpy \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
