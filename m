From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 25 May 2021 14:27:41 +0200
Subject: [Buildroot] [PATCHv3 06/15] package/sysrepo: remove explicit
 setting of CMAKE_BUILD_TYPE
In-Reply-To: <20210525122750.5022-1-patrickdepinguin@gmail.com>
References: <20210525122750.5022-1-patrickdepinguin@gmail.com>
Message-ID: <20210525122750.5022-7-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

sysrepo explicitly sets CMAKE_BUILD_TYPE=Release, ignoring any possible
value of BR2_ENABLE_DEBUG (previously) or BR2_ENABLE_RUNTIME_DEBUG (now).

With the introduction of BR2_ENABLE_RUNTIME_DEBUG, this change should no
longer be necessary. Users that do not wish to have additional runtime
debugging just keep BR2_ENABLE_RUNTIME_DEBUG disabled (default value).

As the 'Debug' build type enables tests, disable them explicitly.
As the 'Debug' build type uses a custom REPO_PATH which does not exist on
target, force /etc/sysrepo like in the 'Release' build type.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/sysrepo/sysrepo.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
index f5be29d2c9..c0db05e52c 100644
--- a/package/sysrepo/sysrepo.mk
+++ b/package/sysrepo/sysrepo.mk
@@ -13,8 +13,10 @@ SYSREPO_DEPENDENCIES = libyang pcre host-sysrepo
 HOST_SYSREPO_DEPENDENCIES = host-libyang host-pcre
 
 SYSREPO_CONF_OPTS = \
-	-DCMAKE_BUILD_TYPE=Release \
-	-DBUILD_EXAMPLES=$(if $(BR2_PACKAGE_SYSREPO_EXAMPLES),ON,OFF)
+	-DBUILD_EXAMPLES=$(if $(BR2_PACKAGE_SYSREPO_EXAMPLES),ON,OFF) \
+	-DENABLE_TESTS=OFF \
+	-DENABLE_VALGRIND_TESTS=OFF \
+	-DREPO_PATH=/etc/sysrepo
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 SYSREPO_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
-- 
2.26.3
