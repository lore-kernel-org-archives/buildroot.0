From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Nov 2016 15:11:21 +0100
Subject: [Buildroot] [git commit] package/ser2net: disable threads for
	toolchains without threads support
Message-ID: <20161106141318.0072581765@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d02655cd2157636d6150daf3a1344b25141780c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ser2net configure script provide an option to disable threads support,
use it.

Fixes:
http://autobuild.buildroot.net/results/6bc/6bc0f99917c2069a1614f4cfcaa98af1b21762e4

Signed-off-by: Romain Naour <romain.naour@gmail.com>
[Thomas: use --{with,without}-pthreads instead of --with-pthreads={yes,no}.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ser2net/ser2net.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index 01aee95..c4dcaf3 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -9,6 +9,12 @@ SER2NET_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 SER2NET_LICENSE = GPLv2+
 SER2NET_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+SER2NET_CONF_OPTS += --with-pthreads
+else
+SER2NET_CONF_OPTS += --without-pthreads
+endif
+
 define SER2NET_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 755 package/ser2net/S50ser2net \
 		$(TARGET_DIR)/etc/init.d/S50ser2net
