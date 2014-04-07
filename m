From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Apr 2014 21:58:06 +0200
Subject: [Buildroot] [PATCH 4/6] tzdump: new host package
In-Reply-To: <cover.1396900553.git.yann.morin.1998@free.fr>
References: <cover.1396900553.git.yann.morin.1998@free.fr>
Message-ID: <bd0d8b1e63d1946a8dd482f5d40c54008bed8081.1396900553.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Alexandre Belloni <alexandre.belloni@free-electrons.com>

tzdump takes timezone info in the installed tzdata format, and
outputs timezone info parseable by uClibc.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
[yann.morin.1998 at free.fr: split zic header-install to its own cset]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/tzdump/tzdump.mk | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 package/tzdump/tzdump.mk

diff --git a/package/tzdump/tzdump.mk b/package/tzdump/tzdump.mk
new file mode 100644
index 0000000..471a719
--- /dev/null
+++ b/package/tzdump/tzdump.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# tzdump
+#
+################################################################################
+
+TZDUMP_VERSION = 65a10105564801094b18c3fcacf4dde4c44e4ab8
+TZDUMP_SITE = $(call github,alexandrebelloni,tzdump,$(TZDUMP_VERSION))
+TZDUMP_DEPENDENCIES = host-zic
+
+define HOST_TZDUMP_BUILD_CMDS
+	(cd $(@D) ;\
+		$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) -o tzdump tzdump.c ; \
+	)
+endef
+
+define HOST_TZDUMP_INSTALL_CMDS
+	mkdir -p $(HOST_DIR)/usr/sbin
+	install -D -m 755 $(@D)/tzdump $(HOST_DIR)/usr/sbin/tzdump
+endef
+
+$(eval $(host-generic-package))
+
+TZDUMP = $(HOST_DIR)/usr/sbin/tzdump
-- 
1.8.3.2
