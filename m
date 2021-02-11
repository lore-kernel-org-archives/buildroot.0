From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 10 Feb 2021 22:12:52 -0700
Subject: [Buildroot] [PATCH 3/3] package/python-setuptools-rust: new package
In-Reply-To: <20210211051252.966385-1-james.hilliard1@gmail.com>
References: <20210211051252.966385-1-james.hilliard1@gmail.com>
Message-ID: <20210211051252.966385-3-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patch to remove optional wheel dependency.

Enable host-python-package for python-toml.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...-t-require-optional-wheel-dependency.patch | 40 +++++++++++++++++++
 .../python-setuptools-rust.hash               |  5 +++
 .../python-setuptools-rust.mk                 | 16 ++++++++
 package/python-toml/python-toml.mk            |  1 +
 4 files changed, 62 insertions(+)
 create mode 100644 package/python-setuptools-rust/0001-Don-t-require-optional-wheel-dependency.patch
 create mode 100644 package/python-setuptools-rust/python-setuptools-rust.hash
 create mode 100644 package/python-setuptools-rust/python-setuptools-rust.mk

diff --git a/package/python-setuptools-rust/0001-Don-t-require-optional-wheel-dependency.patch b/package/python-setuptools-rust/0001-Don-t-require-optional-wheel-dependency.patch
new file mode 100644
index 0000000000..a17d41b720
--- /dev/null
+++ b/package/python-setuptools-rust/0001-Don-t-require-optional-wheel-dependency.patch
@@ -0,0 +1,40 @@
+From 4de1da1189d8f6d45b71bf036fbba1101ea5ec47 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Wed, 10 Feb 2021 20:54:37 -0700
+Subject: [PATCH] Don't require optional wheel dependency.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://github.com/PyO3/setuptools-rust/pull/111]
+---
+ pyproject.toml | 2 +-
+ setup.cfg      | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index eaf552d..6abb82f 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,5 +1,5 @@
+ [build-system]
+-requires = ["setuptools>=42", "wheel", "setuptools_scm[toml]>=3.4.3"]
++requires = ["setuptools>=42", "setuptools_scm[toml]>=3.4.3"]
+ build-backend = "setuptools.build_meta"
+ 
+ [tool.setuptools_scm]
+diff --git a/setup.cfg b/setup.cfg
+index c8a8fcd..d92bcde 100644
+--- a/setup.cfg
++++ b/setup.cfg
+@@ -28,7 +28,7 @@ classifiers =
+ packages = setuptools_rust
+ zip_safe = True
+ install_requires = semantic_version>=2.6.0; toml>=0.9.0
+-setup_requires = setuptools>=46.1; wheel; setuptools_scm[toml]>=3.4.3
++setup_requires = setuptools>=46.1; setuptools_scm[toml]>=3.4.3
+ 
+ [options.entry_points]
+ distutils.commands =
+-- 
+2.30.0
+
diff --git a/package/python-setuptools-rust/python-setuptools-rust.hash b/package/python-setuptools-rust/python-setuptools-rust.hash
new file mode 100644
index 0000000000..3ed046b159
--- /dev/null
+++ b/package/python-setuptools-rust/python-setuptools-rust.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/setuptools-rust/json
+md5  319d2968f076f37279c866e51bcccbcc  setuptools-rust-0.11.6.tar.gz
+sha256  a5b5954909cbc5d66b914ee6763f81fa2610916041c7266105a469f504a7c4ca  setuptools-rust-0.11.6.tar.gz
+# Locally computed sha256 checksums
+sha256  b20668c1590582b3882854050ccfbdb7aee1f71a1ffe9eacc4c5aeb08a14161b  LICENSE
diff --git a/package/python-setuptools-rust/python-setuptools-rust.mk b/package/python-setuptools-rust/python-setuptools-rust.mk
new file mode 100644
index 0000000000..42bc747a3b
--- /dev/null
+++ b/package/python-setuptools-rust/python-setuptools-rust.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-setuptools-rust
+#
+################################################################################
+
+PYTHON_SETUPTOOLS_RUST_VERSION = 0.11.6
+PYTHON_SETUPTOOLS_RUST_SOURCE = setuptools-rust-$(PYTHON_SETUPTOOLS_RUST_VERSION).tar.gz
+PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/9d/87/7d1487395ab2e1d3c101d34b8e6ed346308f45349e5cdd3101963cc1c9cd
+PYTHON_SETUPTOOLS_RUST_SETUP_TYPE = setuptools
+PYTHON_SETUPTOOLS_RUST_LICENSE = MIT
+PYTHON_SETUPTOOLS_RUST_LICENSE_FILES = LICENSE
+HOST_PYTHON_SETUPTOOLS_RUST_DEPENDENCIES = host-rustc host-python-setuptools-scm host-python-toml host-python-semantic-version
+HOST_PYTHON_SETUPTOOLS_RUST_NEEDS_HOST_PYTHON = python3
+
+$(eval $(host-python-package))
diff --git a/package/python-toml/python-toml.mk b/package/python-toml/python-toml.mk
index b4f9070f24..8a61be2f4f 100644
--- a/package/python-toml/python-toml.mk
+++ b/package/python-toml/python-toml.mk
@@ -12,3 +12,4 @@ PYTHON_TOML_LICENSE = MIT
 PYTHON_TOML_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.25.1
