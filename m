From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 11:38:00 +0200
Subject: [Buildroot] [git commit] package/poppler: bump version to 0.32.0
Message-ID: <20150404093904.1CE5C80E34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=03671be949aecdfc54fa8d67ab78b39770ea87e4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit also adds an optional dependency on openjpeg: if
--enable-openjpeg=none is not passed, poppler assumes openjpeg is
available.

[Thomas:
  - add optional dependency on openjpeg instead of mandatory
    dependency.
  - remove --enable-xpdf-headers, since there was no justification for
    it.]

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/poppler/poppler.hash |    2 +-
 package/poppler/poppler.mk   |    9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/poppler/poppler.hash b/package/poppler/poppler.hash
index f3225bc..c4c7f66 100644
--- a/package/poppler/poppler.hash
+++ b/package/poppler/poppler.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	a2654910100c923c44e366242495e226db2798254f2fa2781138867348759f84	poppler-0.24.5.tar.xz
+sha256	4963e31ba5e17530a87b16588e22928bc044e8d28d02303dded981bff6725b98	poppler-0.32.0.tar.xz
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index d797fc7..5a6b22b 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POPPLER_VERSION = 0.24.5
+POPPLER_VERSION = 0.32.0
 POPPLER_SOURCE = poppler-$(POPPLER_VERSION).tar.xz
 POPPLER_SITE = http://poppler.freedesktop.org
 POPPLER_DEPENDENCIES = fontconfig
@@ -69,4 +69,11 @@ else
 POPPLER_CONF_OPTS += --disable-poppler-qt4
 endif
 
+ifeq ($(BR2_PACKAGE_OPENJPEG),y)
+POPPLER_DEPENDENCIES += openjpeg
+POPPLER_CONF_OPTS += -enable-libopenjpeg=openjpeg2
+else
+POPPLER_CONF_OPTS += -enable-libopenjpeg=none
+endif
+
 $(eval $(autotools-package))
