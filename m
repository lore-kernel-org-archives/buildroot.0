From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 21 Mar 2014 07:26:53 +0100
Subject: [Buildroot] [git commit] pkg-autotools: add a
	AUTOCONF_AC_CHECK_FILE_VAL macro
Message-ID: <20140321062945.13B379C210@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f4642eea7e5c0c375f1b892074a3c22637042deb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When configure.ac scripts do AC_CHECK_FILE tests, they always fail in
cross-compilation contexts because it is not possible to check for
file existence during the build process. Therefore we have to preseed
the configure environment with ac_cv_file_<foo>=yes variable, <foo>
being the path of the file, where all slashes, dots or dashes have
been replaced by underscores.

In the context of the boot-wrapper-aarch64, we will have to use three
of these variables, with fairly complex paths. So instead of
replicating the logic each time, we create a
AUTOCONF_AC_CHECK_FILE_VAL macro to help defining such variables.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-autotools.mk |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 32ceef2..a646612 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -36,6 +36,16 @@ define CONFIG_UPDATE
 	done
 endef
 
+# This function generates the ac_cv_file_<foo> value for a given
+# filename. This is needed to convince configure script doing
+# AC_CHECK_FILE() tests that the file actually exists, since such
+# tests cannot be done in a cross-compilation context. This function
+# takes as argument the path of the file. An example usage is:
+#
+#  FOOBAR_CONF_ENV = \
+#	$(call AUTOCONF_AC_CHECK_FILE_VAL,/dev/random)=yes
+AUTOCONF_AC_CHECK_FILE_VAL = ac_cv_file_$(subst -,_,$(subst /,_,$(subst .,_,$(1))))
+
 ################################################################################
 # inner-autotools-package -- defines how the configuration, compilation and
 # installation of an autotools package should be done, implements a
