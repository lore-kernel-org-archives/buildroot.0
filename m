From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Aug 2016 11:02:15 +0200
Subject: [Buildroot] [git commit] package/libgpg-error: optionally depends
	on gettext
Message-ID: <20160826090904.EA3DB822F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2bd1ce7890741a92a6a6353a3832e41d3bc9f70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

configure.ac has AM_GNU_GETTEXT(), which will enable i18n if a gettext
library is found. For uClibc, it is found if the gettext package has
been built, and it will add -lintl to the link flags. For musl and
glibc, it is always found, in libc itself so nothing is added to the
link flags.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Matthew Weber <matt@thewebers.ws>
Tested-by: Matthew Weber <matt@thewebers.ws>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgpg-error/libgpg-error.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index e081b36..1945673 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -11,6 +11,10 @@ LIBGPG_ERROR_LICENSE_FILES = COPYING COPYING.LIB
 LIBGPG_ERROR_INSTALL_STAGING = YES
 LIBGPG_ERROR_CONFIG_SCRIPTS = gpg-error-config
 
+ifeq ($(BR2_PACKAGE_GETTEXT),y)
+LIBGPG_ERROR_DEPENDENCIES += gettext
+endif
+
 define LIBGPG_ERROR_FIX_CROSS_COMPILATION
 	cd $(@D)/src/syscfg && \
 	ln -s lock-obj-pub.$(call qstrip, $(BR2_PACKAGE_LIBGPG_ERROR_SYSCFG)).h \
