From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Jun 2021 22:39:35 +0200
Subject: [Buildroot] [git commit branch/next] package/sysrepo: remove
 explicit setting of CMAKE_BUILD_TYPE
Message-ID: <20210601201208.9EAD080E41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=77b9b0f8cf9bf520959701928b7c8a5425ce2987
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

sysrepo explicitly sets CMAKE_BUILD_TYPE=Release, ignoring any possible
value of BR2_ENABLE_DEBUG (previously) or BR2_ENABLE_RUNTIME_DEBUG (now).

With the introduction of BR2_ENABLE_RUNTIME_DEBUG, this change should no
longer be necessary. Users that do not wish to have additional runtime
debugging just keep BR2_ENABLE_RUNTIME_DEBUG disabled (default value).

As the 'Debug' build type enables tests, disable them explicitly.
As the 'Debug' build type uses a custom REPO_PATH which does not exist on
target, force /etc/sysrepo like in the 'Release' build type.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
