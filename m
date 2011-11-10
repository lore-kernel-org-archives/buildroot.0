From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 10 Nov 2011 20:31:54 +0100
Subject: [Buildroot] [PATCH 2 of 5 RFC] dependencies: add function
	suitable-host-package
In-Reply-To: <patchbomb.1320911665@devws108>
References: <patchbomb.1320911665@devws108>
Message-ID: <59ff6675857a8c1c280b.1320911667@devws108>
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
execute check-host-foo.sh, or if absent, make function check-host-foo. These
should return either the path to the suitable host package, or the empty
string if no suitable package can be found.
The rules to determine whether something is suitable or not is left to the
check-host-foo(.sh) function and depends on foo.

An example usage of suitable-host-package is:
DEPENDENCIES_HOST_PREREQ += $(if $(call suitable-host-package,foo),,host-foo)

To avoid cluttering the existing dependencies.mk file, it includes any
check-host-foo.mk file. These files can be used to hold the appropriate
functions or definitions.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 toolchain/dependencies/dependencies.mk |  10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/toolchain/dependencies/dependencies.mk b/toolchain/dependencies/dependencies.mk
--- a/toolchain/dependencies/dependencies.mk
+++ b/toolchain/dependencies/dependencies.mk
@@ -6,6 +6,16 @@
 ######################################################################
 
 DEPENDENCIES_HOST_PREREQ:=
+
+# suitable-host-pkg: calls check-host-$(1).sh shell script if it exists,
+# otherwise calls check-host-$(1) make function. This script/function
+# should return the path to the suitable host tool, or nothing if no
+# suitable tool was found.
+define suitable-host-package
+$(if $(wildcard toolchain/dependencies/check-host-$(1).sh),$(shell toolchain/dependencies/check-host-$(1).sh),$(call check-host-$(1)))
+endef
+include toolchain/dependencies/check-host-*.mk
+
 ifeq ($(BR2_STRIP_sstrip),y)
 DEPENDENCIES_HOST_PREREQ+=host-sstrip
 endif
