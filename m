From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 23 Nov 2011 14:59:50 +0100
Subject: [Buildroot] [PATCH 1 of 3 v2] dependencies: add function
	suitable-host-package
In-Reply-To: <patchbomb.1322053783@devws108>
References: <patchbomb.1322053783@devws108>
Message-ID: <03cbc212567081a0d7bc.1322053784@devws108>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sometimes, buildroot needs a certain host tool to do its job, e.g. tar. In
many cases, we expect this tool to be present on the host system, but this is
not always the case. Or maybe, the version on the host system is not
suitable, and we need a more recent one.

In some of these cases, instead of bailing out, buildroot could build the
package first (but only if the existing system package is not suitable).

To aid in detecting if a host package is suitable or not, this patch adds a
function suitable-host-package. When called with parameter foo, it will
execute check-host-foo.sh. This script should return either the path to the
suitable host package, or the empty string if no suitable package can be found.
The rules to determine whether something is suitable or not is left to
check-host-foo.sh and depends on foo.

An example usage of suitable-host-package is:
DEPENDENCIES_HOST_PREREQ += $(if $(call suitable-host-package,foo),,host-foo)

To avoid cluttering the existing dependencies.mk file, it includes any
check-host-foo.mk file. These files can be used to hold appropriate
dependency-related actions for foo.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
 toolchain/dependencies/dependencies.mk |  9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/toolchain/dependencies/dependencies.mk b/toolchain/dependencies/dependencies.mk
--- a/toolchain/dependencies/dependencies.mk
+++ b/toolchain/dependencies/dependencies.mk
@@ -6,6 +6,15 @@
 ######################################################################
 
 DEPENDENCIES_HOST_PREREQ:=
+
+# suitable-host-pkg: calls check-host-$(1).sh shell script, which
+# should return the path to the suitable host tool, or nothing if no
+# suitable tool was found.
+define suitable-host-package
+$(shell toolchain/dependencies/check-host-$(1).sh)
+endef
+include toolchain/dependencies/check-host-*.mk
+
 ifeq ($(BR2_STRIP_sstrip),y)
 DEPENDENCIES_HOST_PREREQ+=host-sstrip
 endif
