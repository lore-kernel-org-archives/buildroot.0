From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sun, 28 Feb 2016 13:38:29 +0100
Subject: [Buildroot] [PATCH] package/czmq: fix static linking
Message-ID: <1456663109-19904-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

czmq requires zeromq, which links against the C++ runtime libstdc++, which in
return depends on libm. For shared library builds, there is nothing special to
do about this, but for static library builds, it is necessary to pass -lm when
linking czmq.

Fixes:
http://autobuild.buildroot.net/results/206/2061238affb685db998100a56c6571538d089a5b/
http://autobuild.buildroot.net/results/caf/caf002d213c9dd09df07858c5c199411ca8ddfa3/
http://autobuild.buildroot.net/results/568/568ac92d2f6d0604b9bf354ea9dca0a7cb5341f6/
http://autobuild.buildroot.net/results/945/9452982fc14f579c61b45a1a189db5f89aab3b80/

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/czmq/czmq.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/czmq/czmq.mk b/package/czmq/czmq.mk
index 0060c89..6ea2c27 100644
--- a/package/czmq/czmq.mk
+++ b/package/czmq/czmq.mk
@@ -18,6 +18,11 @@ CZMQ_LICENSE_FILES = LICENSE
 # host-python, so disable asciidoc entirely.
 CZMQ_CONF_ENV = ac_cv_prog_czmq_have_asciidoc=no
 
+# zeromq links against the C++ runtime libstdc++, which depends on libm. For
+# shared library builds, there is nothing special to do about this, but for
+# static library builds, it is necessary to pass -lm when linking czmq.
+CZMQ_CONF_ENV += LIBS+="-lm"
+
 define CZMQ_CREATE_CONFIG_DIR
 	mkdir -p $(@D)/config
 endef
-- 
2.7.2
