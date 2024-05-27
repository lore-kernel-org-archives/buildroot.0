Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030A6C25B78
	for <buildroot@archiver.kernel.org>; Mon, 27 May 2024 15:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C48A94148E;
	Mon, 27 May 2024 15:55:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h7d9Ai0e_Vs3; Mon, 27 May 2024 15:55:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C82E40454
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C82E40454;
	Mon, 27 May 2024 15:55:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E69341D1E62
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 15:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D123581493
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 15:55:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nJyKcDaNwkOK for <buildroot@lists.busybox.net>;
 Mon, 27 May 2024 15:55:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2B778149A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2B778149A
 for <buildroot@buildroot.org>; Mon, 27 May 2024 15:55:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC746876DC; Mon, 27 May 2024 15:55:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 May 2024 17:42:52 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 7246f1951665e9c15f38f0b0fa21a2b1473cca33
X-Git-Newrev: 4eb7098a1a6391fa8c4e32d5703a0abdf589a1f1
X-Patchwork-Hint: ignore
Message-Id: <20240527155526.BC746876DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/python-rpds-py:
 bump to version 0.18.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=4eb7098a1a6391fa8c4e32d5703a0abdf589a1f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

As reported by Antoine Coutant on the Buildroot mailing list [1]:

rpds depends on the crate pyo3. This crate uses

  "std::sync::atomic::AtomicI64"

which doesn't exist for 32 bits targets.
That leads to an error as reported by Buildroot Gitlab-ci.

An issue have been opened on pyo3's github [2].
A fix have been accepted by pyo3 [3] and merged in pyo3 0.20.3 release
[4]. This pyo3 0.20.3 uses crate portable-atomic [5] to provide atomic
types and compare and swap operations for all targets that can use std.

python-rpds-py 0.18.1 is the first release that use pyo3 0.20.3.

Before python-rpds-py 0.18.1 release fixing this issue would require
that we be able to patch a package during the Cargo vendoring step [6].

[1] http://lists.busybox.net/pipermail/buildroot/2024-February/684867.html
[2]: https://github.com/PyO3/pyo3/issues/3614
[3]: https://github.com/PyO3/pyo3/pull/3619
[4]: https://github.com/PyO3/pyo3/blob/v0.20.3/CHANGELOG.md
[5]: https://github.com/taiki-e/portable-atomic
[6]: http://lists.busybox.net/pipermail/buildroot/2024-February/684886.html

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6783811842 (TestPythonPy3Dtschema)
https://gitlab.com/buildroot.org/buildroot/-/jobs/6783811860 (TestPythonPy3FlaskExpectsJson)

Reported-by: Antoine Coutant <antoine.coutant@smile.fr>
Cc: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 26b054083d36a0fb16340b10a9df239879a2c573)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-rpds-py/python-rpds-py.hash | 2 +-
 package/python-rpds-py/python-rpds-py.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-rpds-py/python-rpds-py.hash b/package/python-rpds-py/python-rpds-py.hash
index 4650d9c385..62b508ae6b 100644
--- a/package/python-rpds-py/python-rpds-py.hash
+++ b/package/python-rpds-py/python-rpds-py.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  760b05720269195d86071ac7cf627b3a4ab9366680d8d449a6a63b84d96a5bc0  rpds_py-0.17.1.tar.gz
+sha256  d9b542bf5321495737005a78d9fbf40541b898d1e2b3309cbe36a2431977be8b  rpds_py-0.18.1.tar.gz
 # Locally computed sha256 checksums
 sha256  314e4e91be3baa93c0fb4bccc9e4e97cd643eb839b065af921782c2175fe9909  LICENSE
diff --git a/package/python-rpds-py/python-rpds-py.mk b/package/python-rpds-py/python-rpds-py.mk
index 80670f2e4f..57fe0be7e8 100644
--- a/package/python-rpds-py/python-rpds-py.mk
+++ b/package/python-rpds-py/python-rpds-py.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RPDS_PY_VERSION = 0.17.1
+PYTHON_RPDS_PY_VERSION = 0.18.1
 PYTHON_RPDS_PY_SOURCE = rpds_py-$(PYTHON_RPDS_PY_VERSION).tar.gz
-PYTHON_RPDS_PY_SITE = https://files.pythonhosted.org/packages/b7/0a/e3bdcc977e6db3bf32a3f42172f583adfa7c3604091a03d512333e0161fe
+PYTHON_RPDS_PY_SITE = https://files.pythonhosted.org/packages/2d/aa/e7c404bdee1db7be09860dff423d022ffdce9269ec8e6532cce09ee7beea
 PYTHON_RPDS_PY_SETUP_TYPE = maturin
 PYTHON_RPDS_PY_LICENSE = MIT
 PYTHON_RPDS_PY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
