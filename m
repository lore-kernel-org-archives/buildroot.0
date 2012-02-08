From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 08 Feb 2012 17:22:18 +0100
Subject: [Buildroot] [PATCH 3 of 5 v6] dependencies: add function
	suitable-host-package
In-Reply-To: <patchbomb.1328718135@beantl019720>
References: <patchbomb.1328718135@beantl019720>
Message-ID: <ac206b814e2a0c5c762a.1328718138@beantl019720>
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
v1 Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
v3: Add optional second parameter to suitable-host-package, to specify a
    candidate tool.

 support/dependencies/dependencies.mk |  10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/support/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
--- a/support/dependencies/dependencies.mk
+++ b/support/dependencies/dependencies.mk
@@ -6,6 +6,16 @@
 ######################################################################
 
 DEPENDENCIES_HOST_PREREQ:=
+
+# suitable-host-pkg: calls check-host-$(1).sh shell script. Parameter (2)
+# can be the candidate to be checked. If not present, the check-host-$(1).sh
+# script should use 'which' to find a candidate. The script should return
+# the path to the suitable host tool, or nothing if no suitable tool was found.
+define suitable-host-package
+$(shell support/dependencies/check-host-$(1).sh $(2))
+endef
+-include support/dependencies/check-host-*.mk
+
 ifeq ($(BR2_STRIP_sstrip),y)
 DEPENDENCIES_HOST_PREREQ+=host-sstrip
 endif
