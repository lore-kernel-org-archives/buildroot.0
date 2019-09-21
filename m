From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Sep 2019 15:19:33 +0200
Subject: [Buildroot] [git commit] package/protobuf: work around gcc bug 85180
Message-ID: <20190921132635.462E38ED77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e975f1cbefbd9c6ed6764978dbee3357fe47979b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 package/protobuf/protobuf.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index e698bac228..77b01b5b88 100644
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
