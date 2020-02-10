From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 10 Feb 2020 17:58:24 +0100
Subject: [Buildroot] [PATCH] package/erlang: patch the tarball
Message-ID: <20200210165824.22245-1-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove the lib/ssl/src/deps directory before configuring the package.
Otherwise, during the compilation of the ssl app, it may fails by
looking for logger.hrl in the wrong location (bootstrap/lib/kernel
instead of lib/kernel).

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang/erlang.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 3dabfd40b9..f62126f0ad 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -14,6 +14,13 @@ ERLANG_LICENSE = Apache-2.0
 ERLANG_LICENSE_FILES = LICENSE.txt
 ERLANG_INSTALL_STAGING = YES
 
+# Remove the lefover deps directory from the ssl app
+# See https://bugs.erlang.org/browse/ERL-1168
+define ERLANG_REMOVE_SSL_DEPS
+	rm -rf $(@D)/lib/ssl/src/deps
+endef
+ERLANG_POST_PATCH_HOOKS += ERLANG_REMOVE_SSL_DEPS
+
 # Patched erts/aclocal.m4
 define ERLANG_RUN_AUTOCONF
 	cd $(@D) && PATH=$(BR_PATH) ./otp_build autoconf
-- 
2.20.1
