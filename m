From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Nov 2013 00:14:36 +0100
Subject: [Buildroot] [git commit] infra: remove incorrect default for
	FOO_DIR_PREFIX
Message-ID: <20131110231541.B9E609BB0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9e7e9b215017ee91c9369f01476bb4b4fc5f2484
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Variable FOO_DIR_PREFIX is populated from pkgparentdir by the various
package infrastructures. However, if that would be empty (which in fact is
the case for the linux package), FOO_DIR_PREFIX would be set to
'$(TOP_SRCDIR)/package'.
Not only does this make no sense (LINUX_DIR_PREFIX becomes /package/linux,
and for all other packages pkgparentdir is not-empty anyway), but it is also
using a non-existing variable TOP_SRCDIR.
This patch therefore removes the incorrect default.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 80b38a5..3b6bc76 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -314,7 +314,7 @@ $(2)_DEPENDENCIES ?= $(filter-out $(1),$(patsubst host-host-%,host-%,$(addprefix
 $(2)_INSTALL_STAGING		?= NO
 $(2)_INSTALL_IMAGES		?= NO
 $(2)_INSTALL_TARGET		?= YES
-$(2)_DIR_PREFIX			= $(if $(4),$(4),$(TOP_SRCDIR)/package)
+$(2)_DIR_PREFIX			= $(4)
 
 # define sub-target stamps
 $(2)_TARGET_INSTALL_TARGET =	$$($(2)_DIR)/.stamp_target_installed
