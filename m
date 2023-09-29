Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388EBE728DE
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 20:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E69A08174C;
	Fri, 29 Sep 2023 20:04:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E69A08174C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nrEENXcVX0pT; Fri, 29 Sep 2023 20:04:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C34481369;
	Fri, 29 Sep 2023 20:04:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C34481369
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EB2E81BF995
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C51B560F17
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:03:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C51B560F17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E7IyBTjNObOm for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 20:03:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5E1B60BB5
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 20:03:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5E1B60BB5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 99FE783602; Fri, 29 Sep 2023 20:03:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 22:02:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a8fe36b5325e616b7c997c18527b969d9e7e9189
X-Git-Newrev: 6cc84f8c20861f86164239baa727d8d8f37b8b8e
X-Patchwork-Hint: ignore
Message-Id: <20230929200351.99FE783602@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-maturin: migrate to
 setuptools-rust infrastructure
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6cc84f8c20861f86164239baa727d8d8f37b8b8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The python-maturin build backend while itself is a pep517 backend
uses setuptools-rust for bootstrapping purposes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-maturin/python-maturin.mk | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index 4ff11e820c..d321e7941c 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -7,18 +7,9 @@
 PYTHON_MATURIN_VERSION = 1.1.0
 PYTHON_MATURIN_SOURCE = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
 PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/7b/78/2814bc0e46a96861aab337fd0404e7937acdb4ce187da239224ab4560d35
-PYTHON_MATURIN_SETUP_TYPE = setuptools
+PYTHON_MATURIN_SETUP_TYPE = setuptools-rust
 PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
 PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit
-HOST_PYTHON_MATURIN_DEPENDENCIES = \
-	host-python-setuptools-rust \
-	host-rustc
-HOST_PYTHON_MATURIN_ENV = \
-	$(HOST_PKG_CARGO_ENV) \
-	PYO3_CROSS_LIB_DIR="$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)"
-# We need to vendor the Cargo crates at download time
-PYTHON_MATURIN_DOWNLOAD_POST_PROCESS = cargo
-PYTHON_MATURIN_DOWNLOAD_DEPENDENCIES = host-rustc
-HOST_PYTHON_MATURIN_DL_ENV = $(HOST_PKG_CARGO_ENV)
+HOST_PYTHON_MATURIN_DEPENDENCIES = host-python-tomli
 
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
