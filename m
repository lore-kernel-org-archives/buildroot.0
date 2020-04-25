From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 14:56:59 +0200
Subject: [Buildroot] [git commit] package/pkg-generic.mk: don't set
 INSTALL_{TARGET, STAGING, IMAGES} for host packages
Message-ID: <20200425124249.E263A8FF93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee772f3256afc191e67ae662bcbdfe6ece12d1cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By their very nature, host packages have no target, staging, or images
install steps; they have a single install step, that is always
performed.

As such, setting the corresponding _INSTALL_{TARGET,STAGING,IMAGES}
variables does not make sense for host packages.

However, people (and scripts) may get confused when they process the
output of printvars, e.g.:

    $ make printvars VARS=HOST_LIBTOOL_INSTALL_TARGET
    HOST_LIBTOOL_INSTALL_TARGET=YES

Only set those variables for target packages. There is no
corresponding variable for host packages, as they are always installed
(and only once).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Vadim Kochan <vadim4j@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: eeppeliteloop at gmail.com
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
