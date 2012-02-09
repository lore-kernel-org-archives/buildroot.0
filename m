From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 9 Feb 2012 22:59:21 +0100
Subject: [Buildroot] [git commit] dependencies: add function
	suitable-host-package
Message-ID: <20120209221235.8C3CE90A44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1bbf39bd733007f2bda799622147924008a5d44c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/dependencies/dependencies.mk |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/support/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
index 3e621e9..cee2a48 100644
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
