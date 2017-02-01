From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed,  1 Feb 2017 12:27:08 +0100
Subject: [Buildroot] [PATCH 1/1] core infra: make sure apply-patches is
	called with correct tar
Message-ID: <20170201112708.17709-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Buildroot has a mechanism to detect a too-old or missing tar program on the
host machine, and builds a custom host-tar if needed. An example situation
is a RHEL5 host machine, where tar is knowingly too old.

The apply-patches script also employs tar, in case the patches come as an
archive. However, tar is called as 'tar' without any absolute path, and the
environment does not point in any way to the possibly custom tar. As a
result, the too-old-tar is called. A particular problem is the flag '-a'
which is missing on e.g. RHEL5.

Previously, this problem went unnoticed: tar would fail, but apply-patches
did not notice it, and the overall return code of the script was 'success'.
However, commit d5ae67b4 added 'set -e' to the script, causing any error to
halt execution of the script with an error.

Fix the problem by adding the Buildroot-built host tools to the PATH when
calling apply-patches.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/Makefile.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 688d5b1..4a3eb26 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -215,7 +215,7 @@ FLEX := $(shell which flex || type -p flex)
 BISON := $(shell which bison || type -p bison)
 UNZIP := $(shell which unzip || type -p unzip) -q
 
-APPLY_PATCHES = support/scripts/apply-patches.sh $(if $(QUIET),-s)
+APPLY_PATCHES = PATH=$(HOST_DIR)/usr/bin:$$PATH support/scripts/apply-patches.sh $(if $(QUIET),-s)
 
 HOST_CPPFLAGS  = -I$(HOST_DIR)/usr/include
 HOST_CFLAGS   ?= -O2
-- 
2.10.2
