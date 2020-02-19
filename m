From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Feb 2020 20:56:01 +0100
Subject: [Buildroot] [git commit] package/erlang: patch the tarball
Message-ID: <20200219194435.D992D8DAD7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=607040e91381aae35205659e8edd7b2eeb45d420
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove the lib/ssl/src/deps directory before configuring the package.
Otherwise, during the compilation of the ssl app, it may fails by
looking for logger.hrl in the wrong location (bootstrap/lib/kernel
instead of lib/kernel).

Fixes:

  http://autobuild.buildroot.net/results/97606fcd11eaf0822b58a9532c5325601d43eaac/

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Tested-by: Frank Vanbever <frank.vanbever@essensium.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/erlang/erlang.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 3dabfd40b9..9cedb62e05 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -14,6 +14,13 @@ ERLANG_LICENSE = Apache-2.0
 ERLANG_LICENSE_FILES = LICENSE.txt
 ERLANG_INSTALL_STAGING = YES
 
+# Remove the leftover deps directory from the ssl app
+# See https://bugs.erlang.org/browse/ERL-1168
+define ERLANG_REMOVE_SSL_DEPS
+	rm -rf $(@D)/lib/ssl/src/deps
+endef
+ERLANG_POST_PATCH_HOOKS += ERLANG_REMOVE_SSL_DEPS
+
 # Patched erts/aclocal.m4
 define ERLANG_RUN_AUTOCONF
 	cd $(@D) && PATH=$(BR_PATH) ./otp_build autoconf
