From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 16:57:22 +0200
Subject: [Buildroot] [git commit branch/next] package/strace: enable
 demangling of C++ symbol names in stack trace
Message-ID: <20180520145817.A8052812DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=191d3c2b27c7460873b0d6786f02774db0822970
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/strace/strace.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 4d42085819..7b3ff184fb 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -18,6 +18,14 @@ else
 STRACE_CONF_OPTS += --without-libunwind
 endif
 
+# Demangling symbols in stack trace needs libunwind and libiberty.
+ifeq ($(BR2_PACKAGE_BINUTILS)$(BR2_PACKAGE_LIBUNWIND),yy)
+STRACE_DEPENDENCIES += binutils
+STRACE_CONF_OPTS += --with-libiberty=check
+else
+STRACE_CONF_OPTS += --without-libiberty
+endif
+
 define STRACE_REMOVE_STRACE_GRAPH
 	rm -f $(TARGET_DIR)/usr/bin/strace-graph
 endef
