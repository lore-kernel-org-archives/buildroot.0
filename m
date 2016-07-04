From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Jul 2016 15:27:49 +0200
Subject: [Buildroot] [git commit] package/open2300: fix static builds
Message-ID: <20160704134052.CFE1C800FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=382fa60f9c7445e962b290c74779a0e0fd7e310f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.org/results/036/036c9088cfaae421c15b650f35e7ffe6ab934031/

libmysqlclient needs -lz to build, so we have to pass it explicitly for
static builds.

For almost-two-and-a-half years this error has been happenning, noone
ever tried to fix it. This is now done, at last! ;-]

[Peter: add autobuilder reference]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/open2300/open2300.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/open2300/open2300.mk b/package/open2300/open2300.mk
index 73db2a0..323f566 100644
--- a/package/open2300/open2300.mk
+++ b/package/open2300/open2300.mk
@@ -21,6 +21,10 @@ OPEN2300_DEPENDENCIES += mysql
 OPEN2300_BINS += mysql2300 mysqlhistlog2300
 OPEN2300_CFLAGS += -I$(STAGING_DIR)/usr/include/mysql
 OPEN2300_LDFLAGS += -L$(STAGING_DIR)/usr/lib/mysql -lmysqlclient
+ifeq ($(BR2_STATIC_LIBS),y)
+# mysql needs -lz, so we need to specify it for static builds
+OPEN2300_LDFLAGS += -lz
+endif
 endif
 
 define OPEN2300_BUILD_CMDS
