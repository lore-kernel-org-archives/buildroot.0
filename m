From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Jul 2015 15:30:48 +0200
Subject: [Buildroot] [git commit] core/pkg-generic: host variants inherits
	target's override-srcdir
Message-ID: <20150720203936.DA37F81E77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3de81a46dc0087436c6785d60ba5d25fe4fe3b17
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When a package has both a target and a host variants, and there is an
override-srcdir set for the target variant, the host variant should
inherit the target's override-srcdir, unless explicitly set, like we do
for all other target-variant properties.

However, do not override it if expressly set to empty (i.e. when the
user wants to override only the target variant).

Also, as we do for the other variables, the target variant never
inherits from the host variant.

Reported-by: Mike <mikez@OpenPlayer.org>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Tested-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 75dc8b7..6a7d97e 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -340,6 +340,10 @@ else
 endif
 $(2)_VERSION := $$(call sanitize,$$($(2)_DL_VERSION))
 
+ifdef $(3)_OVERRIDE_SRCDIR
+  $(2)_OVERRIDE_SRCDIR ?= $$($(3)_OVERRIDE_SRCDIR)
+endif
+
 $(2)_BASE_NAME	=  $(1)-$$($(2)_VERSION)
 $(2)_DL_DIR	=  $$(DL_DIR)/$$($(2)_BASE_NAME)
 $(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASE_NAME)
