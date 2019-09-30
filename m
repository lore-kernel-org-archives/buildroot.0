From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Sep 2019 14:25:57 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/protobuf: work
 around gcc bug 85180
Message-ID: <20190930122147.6CB3682DDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a0adbf4ea81d7cbc0ecda13112c056b7aeac023
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

With Microblaze Gcc version < 8.x the build hangs due to gcc bug
85180: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. The bug
shows up when building protobuf with optimization but not when building
with -O0. To work around this, if BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y we
force using -O0.

Fixes:
http://autobuild.buildroot.net/results/73dc9610a13d6e14eec58d529617210d93d5dec4/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Arnout: fix variable name]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit e975f1cbefbd9c6ed6764978dbee3357fe47979b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/protobuf/protobuf.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 9caf87ed93..919aae5b7d 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -17,6 +17,14 @@ PROTOBUF_LICENSE_FILES = LICENSE
 PROTOBUF_DEPENDENCIES = host-protobuf
 PROTOBUF_CONF_OPTS = --with-protoc=$(HOST_DIR)/bin/protoc
 
+PROTOBUF_CXXFLAGS = $(TARGET_CXXFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+PROTOBUF_CXXFLAGS += -O0
+endif
+
+PROTOBUF_CONF_ENV = CXXFLAGS="$(PROTOBUF_CXXFLAGS)"
+
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 PROTOBUF_CONF_ENV += LIBS=-latomic
 endif
