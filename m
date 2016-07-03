From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 Jul 2016 12:46:10 +0200
Subject: [Buildroot] [git commit] core: do not attempt downloads with no
	_VERSION set
Message-ID: <20160703111556.566AE8179A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=75630eba22b20d6140a5b58a6d1e35598fb3c0d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, when the package defines no _SOURCE and no _VERSION
variables, we end up trying to download <PACKAGE>-undefined.tar.gz.

This is utterly pointless.

Change the logic to not attempt a download when neither _SOURCE
nor _VERSION is set:
  - do not set an undefined _VERSION to "undefined"
  - do not append an empty (or "undefined") version to the package
    rawname

Consequently, for packages that have no _VERSION, the build
directory will be just the package name (which to some may look
nicer than the current "package-undefined").

Furthermore, the message trace is also a bit leaner (to the same
people that find "package" nicer than "package-undefined").

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 94187f9..dab455c 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -386,8 +386,6 @@ ifndef $(2)_VERSION
   $(2)_DL_VERSION := $$($(3)_DL_VERSION)
  else ifdef $(3)_VERSION
   $(2)_DL_VERSION := $$($(3)_VERSION)
- else
-  $(2)_DL_VERSION = undefined
  endif
 else
  $(2)_DL_VERSION := $$(strip $$($(2)_VERSION))
@@ -398,8 +396,8 @@ ifdef $(3)_OVERRIDE_SRCDIR
   $(2)_OVERRIDE_SRCDIR ?= $$($(3)_OVERRIDE_SRCDIR)
 endif
 
-$(2)_BASE_NAME	=  $(1)-$$($(2)_VERSION)
-$(2)_RAW_BASE_NAME = $$($(2)_RAWNAME)-$$($(2)_VERSION)
+$(2)_BASE_NAME	= $$(if $$($(2)_VERSION),$(1)-$$($(2)_VERSION),$(1))
+$(2)_RAW_BASE_NAME = $$(if $$($(2)_VERSION),$$($(2)_RAWNAME)-$$($(2)_VERSION),$$($(2)_RAWNAME))
 $(2)_DL_DIR	=  $$(DL_DIR)/$$($(2)_BASE_NAME)
 $(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASE_NAME)
 
@@ -429,7 +427,7 @@ endif
 ifndef $(2)_SOURCE
  ifdef $(3)_SOURCE
   $(2)_SOURCE = $$($(3)_SOURCE)
- else
+ else ifdef $(2)_VERSION
   $(2)_SOURCE			?= $$($(2)_RAW_BASE_NAME).tar.gz
  endif
 endif
