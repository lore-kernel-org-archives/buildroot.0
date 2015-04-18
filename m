From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 15:56:41 +0200
Subject: [Buildroot] [git commit] target-finalize: fix calling ldconfig
Message-ID: <20150418135953.D4DD58046C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1c4d3555f4e810e8268b5e1b98cc09de0cbce885
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On some systems (e.g. Fedora 20), the build breaks when parsing include
directives in our /etc/ld.so.conf, with error messages as thus:

    /sbin/ldconfig: need absolute file name for configuration file
    when using -r

So, enforce the path to the ld.so.conf file to point to our own, in the
target/ directory.

Reported-by: Al West <al.west@v-nova.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 6a28b28..d1d6ab3 100644
--- a/Makefile
+++ b/Makefile
@@ -583,9 +583,11 @@ endif
 	mkdir -p $(TARGET_DIR)/var/cache/ldconfig
 	if [ -x "$(TARGET_CROSS)ldconfig" ]; \
 	then \
-		$(TARGET_CROSS)ldconfig -r $(TARGET_DIR); \
+		$(TARGET_CROSS)ldconfig -r $(TARGET_DIR) \
+					-f $(TARGET_DIR)/etc/ld.so.conf; \
 	else \
-		/sbin/ldconfig -r $(TARGET_DIR); \
+		/sbin/ldconfig -r $(TARGET_DIR) \
+			       -f $(TARGET_DIR)/etc/ld.so.conf; \
 	fi
 	( \
 		echo "NAME=Buildroot"; \
