From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Aug 2016 08:13:21 +0200
Subject: [Buildroot] [git commit] package/quota: fix static build with
	e2fsprogs
Message-ID: <20160816062550.29C0A7FEA5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6d2533bdebdce21df13525cd723daa6837fcd1f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

quota does not use pkg-config to find e2fsprogs libs, so it misses out
on the fact that it may require -pthread when doing static links.

Fix that by manually adding -pthread in case of the static build (of
course, only if the toolchain has threads).

Fixes:
    http://autobuild.buildroot.org/results/733/733145e94d7c4f3b11e867c60a1e8f8e049a3ce0/
    http://autobuild.buildroot.org/results/666/6666f7c07339830fb45a5decb8825560ee432ce5/
    http://autobuild.buildroot.org/results/f5b/f5b1d57bd26adaf125555b97ff1eb9faf223a293/
    [...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/quota/quota.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index c30a2bd..a1e343a 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -21,6 +21,11 @@ endif
 ifeq ($(BR2_PACKAGE_E2FSPROGS),y)
 QUOTA_DEPENDENCIES += e2fsprogs
 QUOTA_CONF_OPTS += --enable-ext2direct
+# quote does not use pkg-config to find e2fsprogs, so it does not know it
+# may require -pthreads in case of static build
+ifeq ($(BR2_STATIC_LIBS)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
+QUOTA_LIBS += -pthread
+endif
 else
 QUOTA_CONF_OPTS += --disable-ext2direct
 endif
