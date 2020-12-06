From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  6 Dec 2020 18:35:37 +0100
Subject: [Buildroot] [PATCHv5 5/5] package/bcc: add optional luajit
 dependency
In-Reply-To: <20201206173537.1397691-1-romain.naour@gmail.com>
References: <20201206173537.1397691-1-romain.naour@gmail.com>
Message-ID: <20201206173537.1397691-5-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Qais Yousef <qais.yousef@arm.com>
---
 package/bcc/bcc.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/bcc/bcc.mk b/package/bcc/bcc.mk
index bafa9e2096..8b6ba63f90 100644
--- a/package/bcc/bcc.mk
+++ b/package/bcc/bcc.mk
@@ -19,8 +19,14 @@ BCC_DEPENDENCIES = host-bison host-flex clang elfutils flex llvm python3 tar
 BCC_CONF_OPTS = -DENABLE_LLVM_SHARED=ON \
 	-DREVISION=$(BCC_VERSION) \
 	-DENABLE_CLANG_JIT=ON \
-	-DENABLE_MAN=OFF \
-	-DENABLE_LUAJIT=OFF
+	-DENABLE_MAN=OFF
+
+ifeq ($(BR2_PACKAGE_LUAJIT),y)
+BCC_DEPENDENCIES += luajit
+BCC_CONF_OPTS += -DENABLE_LUAJIT=ON
+else
+BCC_CONF_OPTS += -DENABLE_LUAJIT=OFF
+endif
 
 define BCC_LINUX_CONFIG_FIXUPS
 	# Enable kernel support for eBPF
-- 
2.25.4
