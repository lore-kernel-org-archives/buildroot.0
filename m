From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 28 Mar 2011 19:16:34 +0200
Subject: [Buildroot] [PATCH 1 of 2] GENTARGETS: Allow disabling host package
	installation
In-Reply-To: <patchbomb.1301332593@localhost6.localdomain6>
References: <patchbomb.1301332593@localhost6.localdomain6>
Message-ID: <26b9d5d50f306815558c.1301332594@localhost6.localdomain6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For target builds, it's already possible to enable/disable installation in the
target and staging directories. Host builds, however, are installed
unconditionally.
In some cases, installation is not appropriate; building the package is
enough. This patch checks whether the new variable HOST_PKGFOO_INSTALL_HOST
equals NO, in which case the installation is not done.
This principle is inspired by the PKGFOO_INSTALL_STAGING and
PKGFOO_INSTALL_TARGET variables, but with negative logic to suit the common
case.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/Makefile.package.in |  6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -458,7 +458,11 @@
 $(1)-install-staging:
 endif
 
-$(1)-install-host:      $(1)-build $$($(2)_TARGET_INSTALL_HOST)
+ifneq ($$($(2)_INSTALL_HOST),NO)
+$(1)-install-host:	$(1)-build $$($(2)_TARGET_INSTALL_HOST)
+else
+$(1)-install-host:	$(1)-build
+endif
 
 $(1)-build:		$(1)-configure \
 			$$($(2)_TARGET_BUILD)
