From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 07 Nov 2013 17:26:52 +0100
Subject: [Buildroot] [PATCH 2 of 3] infra: remove incorrect default for
	FOO_DIR_PREFIX
In-Reply-To: <patchbomb.1383841610@argentina>
References: <patchbomb.1383841610@argentina>
Message-ID: <d03022b206c995b8b942.1383841612@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Variable FOO_DIR_PREFIX is populated from pkgparentdir by the various
package infrastructures. However, if that would be empty (which in fact is
the case for the linux package), FOO_DIR_PREFIX would be set to
'$(TOP_SRCDIR)/package'.
Not only does this make no sense (LINUX_DIR_PREFIX becomes /package/linux,
and for all other packages pkgparentdir is not-empty anyway), but it is also
using a non-existing variable TOP_SRCDIR.
This patch therefore removes the incorrect default.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/pkg-generic.mk |  2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -313,7 +313,7 @@ endif
 $(2)_INSTALL_STAGING		?= NO
 $(2)_INSTALL_IMAGES		?= NO
 $(2)_INSTALL_TARGET		?= YES
-$(2)_DIR_PREFIX			= $(if $(4),$(4),$(TOP_SRCDIR)/package)
+$(2)_DIR_PREFIX			= $(4)
 
 # define sub-target stamps
 $(2)_TARGET_INSTALL_TARGET =	$$($(2)_DIR)/.stamp_target_installed
