From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Nov 2020 22:36:56 +0100
Subject: [Buildroot] [PATCH next 11/12] support/download/cargo-post-process,
 package/pkg-cargo.mk: enable vendoring for Cargo packages
In-Reply-To: <20201119213658.1232531-1-thomas.petazzoni@bootlin.com>
References: <20201119213658.1232531-1-thomas.petazzoni@bootlin.com>
Message-ID: <20201119213658.1232531-12-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds support/download/cargo-post-process to perform the
vendoring on Cargo packages, and enables it in package/pkg-cargo.mk.

Since it changes the contents of the tarballs for ripgrep and
sentry-cli, it changes their hashes. To not have a different hash for
the same version of ripgrep and sentry-cli, we bump their versions. It
has to be done in the same commit as the Cargo vendoring to make the
series bisectable.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-cargo.mk                |  5 +++-
 package/ripgrep/ripgrep.hash        |  2 +-
 package/ripgrep/ripgrep.mk          |  2 +-
 package/sentry-cli/sentry-cli.hash  |  2 +-
 package/sentry-cli/sentry-cli.mk    |  2 +-
 support/download/cargo-post-process | 38 +++++++++++++++++++++++++++++
 6 files changed, 46 insertions(+), 5 deletions(-)
 create mode 100755 support/download/cargo-post-process

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index 52c237aa3c..6653f64594 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -37,10 +37,13 @@
 define inner-cargo-package
 
 # We need host-rustc to run cargo
-$(2)_DEPENDENCIES += host-rustc
+$(2)_DOWNLOAD_DEPENDENCIES += host-rustc
 
 $(2)_CARGO_ENV += CARGO_HOME=$$(HOST_DIR)/share/cargo
 
+$(2)_DOWNLOAD_POST_PROCESS = cargo
+$(2)_DL_ENV = CARGO_HOME=$$(HOST_DIR)/share/cargo
+
 #
 # Build step. Only define it if not already defined by the package .mk
 # file.
diff --git a/package/ripgrep/ripgrep.hash b/package/ripgrep/ripgrep.hash
index 0841c0185c..81ac905d3d 100644
--- a/package/ripgrep/ripgrep.hash
+++ b/package/ripgrep/ripgrep.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 7035379fce0c1e32552e8ee528b92c3d01b8d3935ea31d26c51a73287be74bb3 ripgrep-0.8.1.tar.gz
+sha256 80d7f07325f4d485c5e4baf061b0376b45a497ee7a1c540d7894057bb9ac3a59 ripgrep-12.1.1.tar.gz
 sha256 0f96a83840e146e43c0ec96a22ec1f392e0680e6c1226e6f3ba87e0740af850f LICENSE-MIT
diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
index 97e9e2ce5f..d21f88a6e8 100644
--- a/package/ripgrep/ripgrep.mk
+++ b/package/ripgrep/ripgrep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RIPGREP_VERSION = 0.8.1
+RIPGREP_VERSION = 12.1.1
 RIPGREP_SITE = $(call github,burntsushi,ripgrep,$(RIPGREP_VERSION))
 RIPGREP_LICENSE = MIT
 RIPGREP_LICENSE_FILES = LICENSE-MIT
diff --git a/package/sentry-cli/sentry-cli.hash b/package/sentry-cli/sentry-cli.hash
index 3b0733a276..63b0c812bc 100644
--- a/package/sentry-cli/sentry-cli.hash
+++ b/package/sentry-cli/sentry-cli.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  5d0f7acf6a139d1c1716b9a8ff76c8bfaab09104ba663c957bb9a5dba2ffbabd  sentry-cli-1.57.0.tar.gz
+sha256  a657dd1a46e3de044deff4c311b7276c5a9409582e707e6e6a78b0cf712591c4  sentry-cli-1.59.0.tar.gz
 sha256  9503def7b54ceb6e3cd182fd59bc05d3a30d7eae481e65aaba4b495133c83c14  LICENSE
diff --git a/package/sentry-cli/sentry-cli.mk b/package/sentry-cli/sentry-cli.mk
index 40ca22fdf9..58f5f1e325 100644
--- a/package/sentry-cli/sentry-cli.mk
+++ b/package/sentry-cli/sentry-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SENTRY_CLI_VERSION = 1.57.0
+SENTRY_CLI_VERSION = 1.59.0
 SENTRY_CLI_SITE = $(call github,getsentry,sentry-cli,$(SENTRY_CLI_VERSION))
 SENTRY_CLI_LICENSE = BSD-3-clause
 SENTRY_CLI_LICENSE_FILES = LICENSE
diff --git a/support/download/cargo-post-process b/support/download/cargo-post-process
new file mode 100755
index 0000000000..5081476385
--- /dev/null
+++ b/support/download/cargo-post-process
@@ -0,0 +1,38 @@
+#!/usr/bin/env bash
+
+set -e
+
+. $(dirname $0)/post-process-helpers
+
+while getopts "n:o:" OPT; do
+        case "${OPT}" in
+        o)  output="${OPTARG}";;
+        n)  base_name="${OPTARG}";;
+        :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
+        \?) error "unknown option '%s'\n" "${OPTARG}";;
+        esac
+done
+
+# Already vendored tarball, nothing to do
+if tar tf ${output} | grep -q "^[^/]*/VENDOR" ; then
+        exit 0
+fi
+
+unpack ${base_name} ${output}
+
+# Do the Cargo vendoring
+pushd ${base_name} > /dev/null
+cargo vendor --locked VENDOR
+echo $?
+# Create the local .cargo/config with vendor info
+mkdir -p .cargo/
+cat <<EOF >.cargo/config
+[source.crates-io]
+replace-with = "vendored-sources"
+
+[source.vendored-sources]
+directory = "VENDOR"
+EOF
+popd > /dev/null
+
+repack ${base_name} ${output}
-- 
2.28.0
