From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 19:06:56 +0100
Subject: [Buildroot] [git commit] postgresql: fix IPv6 detection for uclibc
	compile
Message-ID: <20150315181408.3D74180799@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f909587180c727f00d5c702603b8f71ddbb5aa7b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Assist configure IPv6 support detection for uclibc,
fixes the following uclibc compile failure:

auth.c: In function ???CheckRADIUSAuth???:
auth.c:2379:24: error: ???in6addr_any??? undeclared (first use in this function)
  localaddr.sin6_addr = in6addr_any;

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/postgresql/postgresql.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 03154af..7ebf795 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -14,6 +14,12 @@ POSTGRESQL_INSTALL_STAGING = YES
 POSTGRESQL_CONFIG_SCRIPTS = pg_config
 
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+# overwrite IPV6 detection
+ifeq ($(BR2_INET_IPV6),y)
+POSTGRESQL_CONF_ENV += ac_cv_type_struct_sockaddr_in6=yes
+else
+POSTGRESQL_CONF_ENV += ac_cv_type_struct_sockaddr_in6=no
+endif
 # PostgreSQL does not build against uClibc with locales
 # enabled, due to an uClibc bug, see
 # http://lists.uclibc.org/pipermail/uclibc/2014-April/048326.html
