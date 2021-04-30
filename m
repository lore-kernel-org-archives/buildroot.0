From: Tian Yuanhao <tianyuanhao@aliyun.com>
Date: Fri, 30 Apr 2021 17:16:27 +0800
Subject: [Buildroot] [PATCH v3 1/1] package/e2fsprogs: disable e2scrub
 conditionally
In-Reply-To: <1600656534.31411.3.camel@aliyun.com>
References: <1600656534.31411.3.camel@aliyun.com>
Message-ID: <20210430091627.3414609-1-tianyuanhao@aliyun.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

e2scrub_all depends on coreutils' readlink. If you use busybox's
readlink, you will see the following error:

  readlink: invalid option -- 'e'

Disable e2scrub if its dependencies are not met.

Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: James Hilliard <james.hilliard1@gmail.com>

---
Changes v2 -> v3:
  - check dependencies (suggested by James)

Changes v1 -> v2:
  - use make flags instead of configure options (suggested by Yann)
---
 package/e2fsprogs/e2fsprogs.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 4420d16aff..db4b849143 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -74,6 +74,16 @@ E2FSPROGS_INSTALL_STAGING_OPTS = \
 	DESTDIR=$(STAGING_DIR) \
 	install-libs
 
+# e2scrub support needs bash, coreutils, lvm2 and util-linux
+ifneq ($(BR2_PACKAGE_BASH)$(BR2_PACKAGE_COREUTILS)$(BR2_PACKAGE_LVM2)$(BR2_PACKAGE_UTIL_LINUX),yyyy)
+E2FSPROGS_MAKE_OPTS += E2SCRUB_DIR=
+endif
+
+E2FSPROGS_INSTALL_TARGET_OPTS = \
+	$(E2FSPROGS_MAKE_OPTS) \
+	DESTDIR=$(TARGET_DIR) \
+	install
+
 # Package does not build in parallel due to improper make rules
 define HOST_E2FSPROGS_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D) install install-libs
-- 
2.25.1
