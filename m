From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 11 Apr 2020 10:12:27 +0200
Subject: [Buildroot] [PATCH 2/8] infra/pkg-generic: don't set
 INSTALL_{TARGET, STAGING, IMAGES} for host
In-Reply-To: <cover.1586592741.git.yann.morin.1998@free.fr>
References: <cover.1586592741.git.yann.morin.1998@free.fr>
Message-ID: <c6febf929ca8d42bbd7d053643dc342272fe4f74.1586592741.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By their very nature, host packages have no target, staging, or
images install steps; they have a single install step, that is
always performed.

As sucj, setting the corresponding _INSTALL_{TARGET,STAGING,IMAGES}
variables does not make sense for host packages.

However, people (and scripts) may get confused when they process the
output of printvars, e.g.:

    $ make printvars VARS=HOST_LIBTOOL_INSTALL_TARGET
    HOST_LIBTOOL_INSTALL_TARGET=YES

Only set those variables for target packages. There is no corresponding
variable for host packages, as they are always installed (and only
once).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Vadim Kochan <vadim4j@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: eeppeliteloop at gmail.com
---
 package/pkg-generic.mk | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 7679c41556..8cd5a7ff62 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -706,10 +706,6 @@ $(2)_FINAL_RECURSIVE_RDEPENDENCIES = $$(sort \
 	) \
 	$$($(2)_FINAL_RECURSIVE_RDEPENDENCIES__X))
 
-$(2)_INSTALL_STAGING		?= NO
-$(2)_INSTALL_IMAGES		?= NO
-$(2)_INSTALL_TARGET		?= YES
-
 # define sub-target stamps
 $(2)_TARGET_INSTALL_TARGET =	$$($(2)_DIR)/.stamp_target_installed
 $(2)_TARGET_INSTALL_STAGING =	$$($(2)_DIR)/.stamp_staging_installed
@@ -770,6 +766,9 @@ $(1):			$(1)-install
 ifeq ($$($(2)_TYPE),host)
 $(1)-install:	        $(1)-install-host
 else
+$(2)_INSTALL_STAGING	?= NO
+$(2)_INSTALL_IMAGES	?= NO
+$(2)_INSTALL_TARGET	?= YES
 $(1)-install:		$(1)-install-staging $(1)-install-target $(1)-install-images
 endif
 
-- 
2.20.1
