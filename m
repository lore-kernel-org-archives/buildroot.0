From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 13 Feb 2018 14:27:11 +0100
Subject: [Buildroot] [PATCH] ejabberd: Call check-erlang-lib script directly
 from its location
Message-ID: <20180213132711.17722-1-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Avoid installing check-erlang-lib in the directory where the tarball is
extracted. Instead, use an absolute path to its actual location, i.e.:
$(TOPDIR)/$(EJABBERD_PKGDIR)/check-erlang-lib

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/ejabberd/ejabberd.mk | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
index 0f7af9b83e..acd52e5b38 100644
--- a/package/ejabberd/ejabberd.mk
+++ b/package/ejabberd/ejabberd.mk
@@ -23,24 +23,15 @@ ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 EJABBERD_DEPENDENCIES += linux-pam
 endif
 
-# Install check-erlang-lib script to the directory in which the
-# package has been uncompressed, so it is available during the
-# configure step.
-define EJABBERD_INSTALL_CHECK_ERLANG_LIB
-	$(INSTALL) -m 0755 $(EJABBERD_PKGDIR)/check-erlang-lib \
-		$(@D)/check-erlang-lib
-endef
-
-EJABBERD_POST_EXTRACT_HOOKS += EJABBERD_INSTALL_CHECK_ERLANG_LIB
-
 EJABBERD_ERLANG_LIBS = sasl public_key mnesia inets compiler
 
 # Guess answers for these tests, configure will bail out otherwise
 # saying error: cannot run test program while cross compiling.
+EJABBERD_CHECK_LIB = $(TOPDIR)/$(EJABBERD_PKGDIR)/check-erlang-lib
 EJABBERD_CONF_ENV = \
 	ac_cv_erlang_root_dir="$(HOST_DIR)/lib/erlang" \
 	$(foreach lib,$(EJABBERD_ERLANG_LIBS), \
-		ac_cv_erlang_lib_dir_$(lib)="`./check-erlang-lib $(lib)`")
+		ac_cv_erlang_lib_dir_$(lib)="`$(EJABBERD_CHECK_LIB) $(lib)`")
 
 EJABBERD_CONF_OPTS = \
 	--enable-system-deps \
-- 
2.14.1
