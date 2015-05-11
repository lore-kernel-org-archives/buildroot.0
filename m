From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 May 2015 08:56:59 +0200
Subject: [Buildroot] [git commit] package/gnuchess: add gettext dependency
Message-ID: <20150511070052.94491819C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=96e89e4a69500a99e129777439b80af7df56cb8d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gnuchess check for libintl library if BR2_NEEDS_GETTEXT_IF_LOCALE is set.

checking for GNU gettext in libintl... yes
checking whether to use NLS... yes
checking where the gettext function comes from... external libintl
checking how to link with libintl... -lintl

But the dependency on gettext package is missing to ensures
reproducible builds.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnuchess/Config.in   |    1 +
 package/gnuchess/gnuchess.mk |    3 ++-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/gnuchess/Config.in b/package/gnuchess/Config.in
index aa446f4..4993b1a 100644
--- a/package/gnuchess/Config.in
+++ b/package/gnuchess/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_GNUCHESS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_FLEX
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  GNU Chess lets most modern computers play a full game of chess.
 
diff --git a/package/gnuchess/gnuchess.mk b/package/gnuchess/gnuchess.mk
index 48e8bc8..0555cb1 100644
--- a/package/gnuchess/gnuchess.mk
+++ b/package/gnuchess/gnuchess.mk
@@ -10,6 +10,7 @@ GNUCHESS_LICENSE = GPLv2+
 GNUCHESS_LICENSE_FILES = COPYING
 
 GNUCHESS_DEPENDENCIES = host-flex flex
-GNUCHESS_DEPENDENCIES += $(if $(BR2_PACKAGE_READLINE),readline)
+GNUCHESS_DEPENDENCIES += $(if $(BR2_PACKAGE_READLINE),readline) \
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 
 $(eval $(autotools-package))
