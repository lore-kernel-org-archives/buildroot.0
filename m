From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 10:01:30 +0100
Subject: [Buildroot] [git commit] core/pkg-virtual: do not check they are
	neabled
Message-ID: <20151230090205.4D4DA82712@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f674c428c2ef76f6486eae10facfb702f8be7244
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Virtual packages do not have a Kconfig symbol, so we must not check that
they are enabled.

Fixes:
    http://autobuild.buildroot.org/results/287/28713478cc6edf8e5d5c3e830fee86a42f0afa8d/
    ... and numerous similar failures ...

[Thomas:
 - use "$($(PKG)_IS_VIRTUAL)" != "YES" instead of !
   "$($(PKG)_IS_VIRTUAL)" = "YES"]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk | 5 ++++-
 package/pkg-virtual.mk | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 2daf337..9e88423 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -186,7 +186,10 @@ $(BUILD_DIR)/%/.stamp_configured:
 # building a package, even if not enabled in the configuration, we
 # want to accept it.
 ifeq ($(MAKECMDGOALS),)
-	@if test "$($(PKG)_TYPE)" = "target" -a -z "$($($(PKG)_KCONFIG_VAR))" ; then \
+	@if test "$($(PKG)_TYPE)" = "target" \
+		-a "$($(PKG)_IS_VIRTUAL)" != "YES" \
+		-a -z "$($($(PKG)_KCONFIG_VAR))" ; \
+	then \
 		echo "ERROR: $($(PKG)_NAME) is in the dependency chain of a package that has" ; \
 		echo "added it to its _DEPENDENCIES variable (directly or indirectly)" ; \
 		echo "without selecting it from Config.in." ; \
diff --git a/package/pkg-virtual.mk b/package/pkg-virtual.mk
index 9c68b51..244c1d0 100644
--- a/package/pkg-virtual.mk
+++ b/package/pkg-virtual.mk
@@ -41,6 +41,8 @@ $$(error No implementation selected for virtual package $(1). Configuration erro
 endif
 endif
 
+$(2)_IS_VIRTUAL = YES
+
 # A virtual package does not have any source associated
 $(2)_SOURCE =
 
