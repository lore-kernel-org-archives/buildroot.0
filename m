From: Tian Yuanhao <tianyuanhao@aliyun.com>
Date: Mon, 21 Sep 2020 10:48:54 +0800
Subject: [Buildroot] [PATCH v2 1/1] package/e2fsprogs: disable e2scrub
In-Reply-To: <20200920211236.GK2422@scaer>
References: <1600333425.32426.1.camel@aliyun.com>
 <20200917213935.67fc4894@windsurf.hq.k.grp>
 <1600394250.18560.2.camel@aliyun.com> <20200920211236.GK2422@scaer>
Message-ID: <1600656534.31411.3.camel@aliyun.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

e2scrub_all depends on coreutils' readlink. If you use busybox's
readlink, you will see the following error:

	readlink: invalid option -- 'e'

Embedded systems usually don't install e2scrub, which is useless without
LVM.

Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
?package/e2fsprogs/e2fsprogs.mk | 4 ++++
?1 file changed, 4 insertions(+)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index eb82a55..44413ba 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -73,6 +73,10 @@ E2FSPROGS_INSTALL_STAGING_OPTS = \
?	DESTDIR=$(STAGING_DIR) \
?	install-libs
?
+# Disable e2scrub as we don't need it.
+E2FSPROGS_MAKE_OPTS = E2SCRUB_DIR=
+E2FSPROGS_INSTALL_TARGET_OPTS = E2SCRUB_DIR= DESTDIR=$(TARGET_DIR) install
+
?# Package does not build in parallel due to improper make rules
?define HOST_E2FSPROGS_INSTALL_CMDS
?	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D) install install-libs
--?
2.7.4
