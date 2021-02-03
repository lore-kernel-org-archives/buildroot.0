From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Feb 2021 23:00:01 +0100
Subject: [Buildroot] [git commit] package/collectd: stop passing
 '--with-libgrpc++'
Message-ID: <20210203214040.3DCB98111E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=326236649dfbf65d76d49f472aaa5293e182c90a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 903de16f5fd586a32a7aed7a792a43dce16365eb added passing
'--with-libgrpc++' with the explanation:

    "Use --with-libgrpc++ option as otherwise collectd will try to find
    grpc++.pc which is not available."

At the time of above commit, grpc version in Buildroot was 1.23.0.
Since grpc 1.25.0, a grpc++.pc file _is_ generated from cmake builds.
Hence, remove passing --with-libgrpc++.

This change fixes a problem introduced by commit
fedf3318e3fd3c9ba57389ed2b36472f1a772b9e. As a side effect of that change, a
target version of 'grpc_cpp_plugin' was now created. When collectd was built
after grpc, even without grpc support in collectd enabled, the collectd
configure script would find this target grpc_cpp_plugin and try to use it
(which is not possible because it is built for target).
When not passing '--with-libgrpc++', collectd will instead find the host
version of grpc_cpp_plugin, which works fine.

There are still two underlying problems:
1. the target version of grpc_cpp_plugin is not actually needed. This will
   be disabled in a subsequent commit.

2. collectd should not execute any grpc-related action if grpc support for
   collectd is disabled. This problem has been reported upstream:
   https://github.com/collectd/collectd/issues/3836

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/collectd/collectd.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index ccca9bf388..3fcca12a45 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -193,9 +193,6 @@ COLLECTD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_COLLECTD_WRITEREDIS),hiredis)
 
 # include/library fixups
-ifeq ($(BR2_PACKAGE_GRPC),y)
-COLLECTD_CONF_OPTS += --with-libgrpc++=$(STAGING_DIR)/usr
-endif
 ifeq ($(BR2_PACKAGE_JANSSON),y)
 COLLECTD_CONF_OPTS += --with-libjansson=$(STAGING_DIR)/usr
 endif
