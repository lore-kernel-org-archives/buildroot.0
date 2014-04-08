From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Apr 2014 00:25:19 +0200
Subject: [Buildroot] [git commit] tzdump: new host package
Message-ID: <20140408224018.C41459C63E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=75622c75fa6ea1309419d805f23c6f1fba5919f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

tzdump takes timezone info in the installed tzdata format, and
outputs timezone info parseable by uClibc.

[Peter: adjust host-zip dep, simplify build/install, use INSTALL variable]
Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
[yann.morin.1998 at free.fr: split zic header-install to its own cset]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tzdump/tzdump.mk |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/tzdump/tzdump.mk b/package/tzdump/tzdump.mk
new file mode 100644
index 0000000..3f035a5
--- /dev/null
+++ b/package/tzdump/tzdump.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# tzdump
+#
+################################################################################
+
+TZDUMP_VERSION = 65a10105564801094b18c3fcacf4dde4c44e4ab8
+TZDUMP_SITE = $(call github,alexandrebelloni,tzdump,$(TZDUMP_VERSION))
+HOST_TZDUMP_DEPENDENCIES = host-zic
+
+define HOST_TZDUMP_BUILD_CMDS
+	cd $(@D) && $(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) -o tzdump tzdump.c
+endef
+
+define HOST_TZDUMP_INSTALL_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/tzdump $(HOST_DIR)/usr/sbin/tzdump
+endef
+
+$(eval $(host-generic-package))
+
+TZDUMP = $(HOST_DIR)/usr/sbin/tzdump
