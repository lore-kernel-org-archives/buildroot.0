Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF32C25B77
	for <buildroot@archiver.kernel.org>; Mon, 20 May 2024 20:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C8E160611;
	Mon, 20 May 2024 20:34:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4T6kJekagkDc; Mon, 20 May 2024 20:34:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3E5B6064E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3E5B6064E;
	Mon, 20 May 2024 20:34:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 51D891C4D0C
 for <buildroot@lists.busybox.net>; Mon, 20 May 2024 20:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E0F36064E
 for <buildroot@lists.busybox.net>; Mon, 20 May 2024 20:34:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9N1tR1W-ZNzt for <buildroot@lists.busybox.net>;
 Mon, 20 May 2024 20:34:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB17960611
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB17960611
 for <buildroot@buildroot.org>; Mon, 20 May 2024 20:34:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D233087454; Mon, 20 May 2024 20:34:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 20 May 2024 22:33:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6a4bf735f49387b74f3832f6f546c5fd5d447ec9
X-Git-Newrev: c617ebbc977d28c5c0ebc7d3bdfa3888f432640c
X-Patchwork-Hint: ignore
Message-Id: <20240520203415.D233087454@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-*: fix hashes for
 cargo-vendored python packages
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

commit: https://git.buildroot.net/buildroot/commit/?id=c617ebbc977d28c5c0ebc7d3bdfa3888f432640c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The recent commits that touched vendoring and hashes, totally missed
the non-native vendored packages, like python packages that contain
rust code, and are thus cargo-vendored.

The issue in this case, is that we need to download the archive as it
is hosted and known to PyPI, but store it locally with our vendoring
suffix. This is inherently conflicting.

Fortunately, the PyPI webserver will ignore the query part of the URL,
so we can request the archive known to PyPI, and append an arbitrary
query, that is automatically constructed with the actual filename we
will use to store it. Basically, an URL for a python package like:
    https://pypi.org.pkg/pkg-hash/pkg-vesion.tar.gz
can be turned into:
    https://pypi.org.pkg/pkg-hash/pkg-vesion.tar.gz?buildroot-path=filename/python-pkg-version-cargo2.tar.gz

This way, we can use out default _SOURCE value, and construct a _SITE
that contains the actual package URL, with an arbtrary query.

NOTE: this is a stop-gap measure, to quickly fix those packages, while
waiting for a generic solution that works in all cases, not just with
PyPI.

NOTE-2: of course, if PyPI changes its policy, and no longer ignored the
query part, this is going to break again. Hence the need for a generic
solution...

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-bcrypt/python-bcrypt.hash               | 2 +-
 package/python-bcrypt/python-bcrypt.mk                 | 5 +++--
 package/python-cryptography/python-cryptography.hash   | 2 +-
 package/python-cryptography/python-cryptography.mk     | 5 +++--
 package/python-maturin/python-maturin.hash             | 2 +-
 package/python-maturin/python-maturin.mk               | 5 +++--
 package/python-orjson/python-orjson.hash               | 2 +-
 package/python-orjson/python-orjson.mk                 | 5 +++--
 package/python-pydantic-core/python-pydantic-core.hash | 2 +-
 package/python-pydantic-core/python-pydantic-core.mk   | 5 +++--
 package/python-rpds-py/python-rpds-py.hash             | 2 +-
 package/python-rpds-py/python-rpds-py.mk               | 5 +++--
 package/python-rtoml/python-rtoml.hash                 | 2 +-
 package/python-rtoml/python-rtoml.mk                   | 5 +++--
 14 files changed, 28 insertions(+), 21 deletions(-)

diff --git a/package/python-bcrypt/python-bcrypt.hash b/package/python-bcrypt/python-bcrypt.hash
index e148078699..8e660a158b 100644
--- a/package/python-bcrypt/python-bcrypt.hash
+++ b/package/python-bcrypt/python-bcrypt.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  d64daee0af1afe137718674e67a49b8bb791842aab265b588a6d68d44a449c70  bcrypt-4.0.1.tar.gz
+sha256  f0b2c7d5d79a6537e3d291b07d2be70dd122a15ea871854d4ce95b447c6873a5  python-bcrypt-4.0.1-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  8173d5c29b4f956d532781d2b86e4e30f83e6b7878dce18c919451d6ba707c90  LICENSE
diff --git a/package/python-bcrypt/python-bcrypt.mk b/package/python-bcrypt/python-bcrypt.mk
index cbd6855d9c..f3137401d7 100644
--- a/package/python-bcrypt/python-bcrypt.mk
+++ b/package/python-bcrypt/python-bcrypt.mk
@@ -5,8 +5,9 @@
 ################################################################################
 
 PYTHON_BCRYPT_VERSION = 4.0.1
-PYTHON_BCRYPT_SOURCE = bcrypt-$(PYTHON_BCRYPT_VERSION).tar.gz
-PYTHON_BCRYPT_SITE = https://files.pythonhosted.org/packages/8c/ae/3af7d006aacf513975fd1948a6b4d6f8b4a307f8a244e1a3d3774b297aad
+PYTHON_BCRYPT_SOURCE_PYPI = bcrypt-$(PYTHON_BCRYPT_VERSION).tar.gz
+PYTHON_BCRYPT_SITE_PYPI = https://files.pythonhosted.org/packages/8c/ae/3af7d006aacf513975fd1948a6b4d6f8b4a307f8a244e1a3d3774b297aad
+PYTHON_BCRYPT_SITE = $(PYTHON_BCRYPT_SITE_PYPI)/$(PYTHON_BCRYPT_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_BCRYPT_SETUP_TYPE = setuptools
 PYTHON_BCRYPT_LICENSE = Apache-2.0
 PYTHON_BCRYPT_LICENSE_FILES = LICENSE
diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index e083014750..5fbf69a208 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  405c9a6271e1a088ea0b432bc2094e2e8baadb2241e192ce9c73a7cc9793b127  cryptography-39.0.2.tar.gz
+sha256  b55c6c011ba4bb803de0b557f40f1765bab9f63240e93516daaf75c3c68e6618  python-cryptography-39.0.2-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  43dad2cc752ab721cd9a9f36ece70fb53ab7713551f2d3d8694d8e8c5a06d6e2  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 07c88ec3da..1cbccd0d5c 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -5,8 +5,9 @@
 ################################################################################
 
 PYTHON_CRYPTOGRAPHY_VERSION = 39.0.2
-PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/fa/f3/f4b8c175ea9a1de650b0085858059050b7953a93d66c97ed89b93b232996
+PYTHON_CRYPTOGRAPHY_SOURCE_PYPI = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
+PYTHON_CRYPTOGRAPHY_SITE_PYPI = https://files.pythonhosted.org/packages/fa/f3/f4b8c175ea9a1de650b0085858059050b7953a93d66c97ed89b93b232996
+PYTHON_CRYPTOGRAPHY_SITE = $(PYTHON_CRYPTOGRAPHY_SITE_PYPI)/$(PYTHON_CRYPTOGRAPHY_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools-rust
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index be6167afea..9807260ebd 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  3757ed29fbaa87a7dde95dade795ea80f099a867343e920ccc471f75d141a6fa  maturin-1.4.0.tar.gz
+sha256  53d51f5e2decca9af248748684aefa9245910757f19ae147dcf566172ecb0907  python-maturin-1.4.0-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index 91507468a2..37479dd7e7 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -5,8 +5,9 @@
 ################################################################################
 
 PYTHON_MATURIN_VERSION = 1.4.0
-PYTHON_MATURIN_SOURCE = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
-PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/20/90/43a3aa35f037e91582ec7516a92084a71f84e89e39ef580813bed072b154
+PYTHON_MATURIN_SOURCE_PYPI = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
+PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/20/90/43a3aa35f037e91582ec7516a92084a71f84e89e39ef580813bed072b154
+PYTHON_MATURIN_SITE = $(PYTHON_MATURIN_SITE_PYPI)/$(PYTHON_MATURIN_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_MATURIN_SETUP_TYPE = setuptools-rust
 PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
 PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit
diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
index 0e9b93f311..c010097fc7 100644
--- a/package/python-orjson/python-orjson.hash
+++ b/package/python-orjson/python-orjson.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  245a1ad9a8f926273787e91f7d7e14b4b357e263a215d8c96dd2039b3cddc238  orjson-3.9.10.tar.gz
+sha256  30dbdd4ebd62a40b6f13a3c741bb215004778c17fd951d0ce5812a7c34476b09  python-orjson-3.9.10-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
index a2e8a50468..dd538acb0a 100644
--- a/package/python-orjson/python-orjson.mk
+++ b/package/python-orjson/python-orjson.mk
@@ -5,8 +5,9 @@
 ################################################################################
 
 PYTHON_ORJSON_VERSION = 3.9.10
-PYTHON_ORJSON_SOURCE = orjson-$(PYTHON_ORJSON_VERSION).tar.gz
-PYTHON_ORJSON_SITE = https://files.pythonhosted.org/packages/72/75/642688bf5d99131fe8cf603f4ef9f26e4b1c6ed8f7f5c7e6fb31def54fb7
+PYTHON_ORJSON_SOURCE_PYPI = orjson-$(PYTHON_ORJSON_VERSION).tar.gz
+PYTHON_ORJSON_SITE_PYPI = https://files.pythonhosted.org/packages/72/75/642688bf5d99131fe8cf603f4ef9f26e4b1c6ed8f7f5c7e6fb31def54fb7
+PYTHON_ORJSON_SITE = $(PYTHON_ORJSON_SITE_PYPI)/$(PYTHON_ORJSON_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_ORJSON_SETUP_TYPE = maturin
 PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT
 PYTHON_ORJSON_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
index 817595ba8c..b5d975cb3b 100644
--- a/package/python-pydantic-core/python-pydantic-core.hash
+++ b/package/python-pydantic-core/python-pydantic-core.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  032fff43cdec54ac579bbdda1a09163e89634c729c1a8163340601a5dfc55eb3  pydantic_core-2.14.6.tar.gz
+sha256  23f5e10872d9c3d49ebc1fcbd317612eb63d65a7afd88dbef8d23cb63d830cb4  python-pydantic-core-2.14.6-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
diff --git a/package/python-pydantic-core/python-pydantic-core.mk b/package/python-pydantic-core/python-pydantic-core.mk
index 8b6e0053e4..38128ebe46 100644
--- a/package/python-pydantic-core/python-pydantic-core.mk
+++ b/package/python-pydantic-core/python-pydantic-core.mk
@@ -5,8 +5,9 @@
 ################################################################################
 
 PYTHON_PYDANTIC_CORE_VERSION = 2.14.6
-PYTHON_PYDANTIC_CORE_SOURCE = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
-PYTHON_PYDANTIC_CORE_SITE = https://files.pythonhosted.org/packages/b2/7d/8304d8471cfe4288f95a3065ebda56f9790d087edc356ad5bd83c89e2d79
+PYTHON_PYDANTIC_CORE_SOURCE_PYPI = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
+PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/b2/7d/8304d8471cfe4288f95a3065ebda56f9790d087edc356ad5bd83c89e2d79
+PYTHON_PYDANTIC_CORE_SITE = $(PYTHON_PYDANTIC_CORE_SITE_PYPI)/$(PYTHON_PYDANTIC_CORE_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_PYDANTIC_CORE_SETUP_TYPE = maturin
 PYTHON_PYDANTIC_CORE_LICENSE = MIT
 PYTHON_PYDANTIC_CORE_LICENSE_FILES = LICENSE
diff --git a/package/python-rpds-py/python-rpds-py.hash b/package/python-rpds-py/python-rpds-py.hash
index 62b508ae6b..3071f60df7 100644
--- a/package/python-rpds-py/python-rpds-py.hash
+++ b/package/python-rpds-py/python-rpds-py.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  d9b542bf5321495737005a78d9fbf40541b898d1e2b3309cbe36a2431977be8b  rpds_py-0.18.1.tar.gz
+sha256  c16ec7e898efa0302cde6ac3c83ef8a2400f865d44941085b4f87784325fb89a  python-rpds-py-0.18.1-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  314e4e91be3baa93c0fb4bccc9e4e97cd643eb839b065af921782c2175fe9909  LICENSE
diff --git a/package/python-rpds-py/python-rpds-py.mk b/package/python-rpds-py/python-rpds-py.mk
index c38f749521..398ac6682b 100644
--- a/package/python-rpds-py/python-rpds-py.mk
+++ b/package/python-rpds-py/python-rpds-py.mk
@@ -5,8 +5,9 @@
 ################################################################################
 
 PYTHON_RPDS_PY_VERSION = 0.18.1
-PYTHON_RPDS_PY_SOURCE = rpds_py-$(PYTHON_RPDS_PY_VERSION).tar.gz
-PYTHON_RPDS_PY_SITE = https://files.pythonhosted.org/packages/2d/aa/e7c404bdee1db7be09860dff423d022ffdce9269ec8e6532cce09ee7beea
+PYTHON_RPDS_PY_SOURCE_PYPI = rpds_py-$(PYTHON_RPDS_PY_VERSION).tar.gz
+PYTHON_RPDS_PY_SITE_PYPI = https://files.pythonhosted.org/packages/2d/aa/e7c404bdee1db7be09860dff423d022ffdce9269ec8e6532cce09ee7beea
+PYTHON_RPDS_PY_SITE = $(PYTHON_RPDS_PY_SITE_PYPI)/$(PYTHON_RPDS_PY_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_RPDS_PY_SETUP_TYPE = maturin
 PYTHON_RPDS_PY_LICENSE = MIT
 PYTHON_RPDS_PY_LICENSE_FILES = LICENSE
diff --git a/package/python-rtoml/python-rtoml.hash b/package/python-rtoml/python-rtoml.hash
index 59f17d9d62..dae1badcf3 100644
--- a/package/python-rtoml/python-rtoml.hash
+++ b/package/python-rtoml/python-rtoml.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  987d3d9e9d56761b17c3e4e172937cbcc793bf24b0ebb2730647a9a2cf86c789  rtoml-0.10.0.tar.gz
+sha256  624cc1ff2b3fdea42aeee3a4d1537d37431ec001870dfee1e04a12bd3076a2d3  python-rtoml-0.10.0-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  cd5ffde80e6d3286a2e2e5f02fb2cb07b823931ca368e7c735a6c5f5aebe7103  LICENSE
diff --git a/package/python-rtoml/python-rtoml.mk b/package/python-rtoml/python-rtoml.mk
index 16f9dea573..d5de20f832 100644
--- a/package/python-rtoml/python-rtoml.mk
+++ b/package/python-rtoml/python-rtoml.mk
@@ -5,8 +5,9 @@
 ################################################################################
 
 PYTHON_RTOML_VERSION = 0.10.0
-PYTHON_RTOML_SOURCE = rtoml-$(PYTHON_RTOML_VERSION).tar.gz
-PYTHON_RTOML_SITE = https://files.pythonhosted.org/packages/ca/b2/0e77a00e75ed582ec1c4c3a9e1eeed886a15c195bcce87b7daf1171c4115
+PYTHON_RTOML_SOURCE_PYPI = rtoml-$(PYTHON_RTOML_VERSION).tar.gz
+PYTHON_RTOML_SITE_PYPI = https://files.pythonhosted.org/packages/ca/b2/0e77a00e75ed582ec1c4c3a9e1eeed886a15c195bcce87b7daf1171c4115
+PYTHON_RTOML_SITE = $(PYTHON_RTOML_SITE_PYPI)/$(PYTHON_RTOML_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_RTOML_SETUP_TYPE = maturin
 PYTHON_RTOML_LICENSE = MIT
 PYTHON_RTOML_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
