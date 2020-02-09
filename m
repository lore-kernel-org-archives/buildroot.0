From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  9 Feb 2020 16:12:41 +0100
Subject: [Buildroot] [PATCH 2/3] package/automake: also include
 autoconf-archive in search paths
In-Reply-To: <cover.1581261155.git.yann.morin.1998@free.fr>
References: <cover.1581261155.git.yann.morin.1998@free.fr>
Message-ID: <e78e62c9d171941a0c8c8a93ba73d3edade4a9b1.1581261155.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since d255b67972 (autotools: do not overwrite first include path), the
ordering of include paths has changed: the system directories are
specified with explicit options passed to autoreconf, which means that
any directory specified in the package _AUTORECONF_OPTS are no longer
first:

  - in package/autoconf/autoconf.mk, we define AUTORECONF as:
    AUTOCONF = $(HOST_DIR)/bin/autoconf -I "$(ACLOCAL_DIR)" -I "$(ACLOCAL_HOST_DIR)"

  - in package/pkg-autotools.mk, we call AUTORECONF with:
    $($(PKG)_AUTORECONF_ENV) $(AUTORECONF) $($(PKG)_AUTORECONF_OPTS)

For a package that needs autoconf-archive, this means that it has to
provide a custom include directive, in its own _AUTORECONF_OPTS. This in
turn means that this directory becomes the first, and goes directly
opposite to what d255b67972 was supposed to accomplish.

However, the path to the autoconf archive macro directory is mnot
searched by default either, so a package has no way to add such an
aclocal include directive.

We can only add it in the global search directory, and we do so only for
those packages that have autoconf-archive in their dependencies.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Michael Walle <michael@walle.cc>
Cc: Heiko Thiery <heiko.thiery@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/automake/automake.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index 89dcaa1293..238116cb94 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -33,5 +33,11 @@ $(eval $(host-autotools-package))
 AUTOMAKE = $(HOST_DIR)/bin/automake
 ACLOCAL_DIR = $(STAGING_DIR)/usr/share/aclocal
 ACLOCAL = $(HOST_DIR)/bin/aclocal
-ACLOCAL_PATH = $(ACLOCAL_DIR):$(ACLOCAL_HOST_DIR)
+ACLOCAL_PATH = $(subst $(space),:,$(strip \
+	$(ACLOCAL_DIR) \
+	$(ACLOCAL_HOST_DIR) \
+	$(if $(filter host-autoconf-archive,$($(PKG)_FINAL_ALL_DEPENDENCIES)),\
+		$(HOST_DIR)/share/autoconf-archive \
+	) \
+))
 export ACLOCAL_PATH
-- 
2.20.1
