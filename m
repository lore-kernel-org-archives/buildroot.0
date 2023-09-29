Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C92AE728E5
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 20:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0E4883E0D;
	Fri, 29 Sep 2023 20:05:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0E4883E0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jb1ozixOSv0h; Fri, 29 Sep 2023 20:05:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05FFD83E0C;
	Fri, 29 Sep 2023 20:05:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05FFD83E0C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F0E461BF357
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6E2D414BF
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:03:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6E2D414BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ER6AuJzc5UCK for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 20:03:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B76414149F
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 20:03:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B76414149F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6C598367C; Fri, 29 Sep 2023 20:03:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 22:02:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6cc84f8c20861f86164239baa727d8d8f37b8b8e
X-Git-Newrev: e9fd7e5b2b58b6721eed3fc7f7ac8e5d0557effc
X-Patchwork-Hint: ignore
Message-Id: <20230929200351.A6C598367C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cryptography: migrate to
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

commit: https://git.buildroot.net/buildroot/commit/?id=e9fd7e5b2b58b6721eed3fc7f7ac8e5d0557effc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We can now significantly simplify the python-cryptography build using
the new setuptools-rust setup type introduced in the python package
infrastructure.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-cryptography/python-cryptography.mk | 30 +++-------------------
 1 file changed, 4 insertions(+), 26 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 67aa20742d..07c88ec3da 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -7,36 +7,14 @@
 PYTHON_CRYPTOGRAPHY_VERSION = 39.0.2
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
 PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/fa/f3/f4b8c175ea9a1de650b0085858059050b7953a93d66c97ed89b93b232996
-PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
+PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools-rust
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
 PYTHON_CRYPTOGRAPHY_CPE_ID_VENDOR = cryptography_project
 PYTHON_CRYPTOGRAPHY_CPE_ID_PRODUCT = cryptography
-PYTHON_CRYPTOGRAPHY_DEPENDENCIES = \
-	host-python-setuptools-rust \
-	host-python-cffi \
-	host-rustc \
-	openssl
-HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = \
-	host-python-setuptools-rust \
-	host-python-cffi \
-	host-rustc \
-	host-openssl
-PYTHON_CRYPTOGRAPHY_ENV = \
-	$(PKG_CARGO_ENV) \
-	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
-HOST_PYTHON_CRYPTOGRAPHY_ENV = \
-	$(HOST_PKG_CARGO_ENV) \
-	PYO3_CROSS_LIB_DIR="$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)"
-# We need to vendor the Cargo crates at download time
-PYTHON_CRYPTOGRAPHY_DOWNLOAD_POST_PROCESS = cargo
-PYTHON_CRYPTOGRAPHY_DOWNLOAD_DEPENDENCIES = host-rustc
-PYTHON_CRYPTOGRAPHY_DL_ENV = \
-	$(PKG_CARGO_ENV) \
-	BR_CARGO_MANIFEST_PATH=src/rust/Cargo.toml
-HOST_PYTHON_CRYPTOGRAPHY_DL_ENV = \
-	$(HOST_PKG_CARGO_ENV) \
-	BR_CARGO_MANIFEST_PATH=src/rust/Cargo.toml
+PYTHON_CRYPTOGRAPHY_CARGO_MANIFEST_PATH = src/rust/Cargo.toml
+PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python-cffi openssl
+HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python-cffi host-openssl
 
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
