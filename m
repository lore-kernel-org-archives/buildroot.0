From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri,  2 Aug 2019 19:43:59 +0200
Subject: [Buildroot] [PATCH] package/python3: adjust _REMOVE_USELESS_FILES
 fix for new layout
Message-ID: <20190802174359.10033-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

python3 nowadays appends the triplet to the config-<version>m directory:

echo target/usr/lib/python3.7/config-*
target/usr/lib/python3.7/config-3.7m-powerpc-linux-gnu

Likewise, there is no longer a pyconfig.h:

ls target/usr/lib/python3.7/config-3.7m-powerpc-linux-gnu
config.c  config.c.in  install-sh  libpython3.7m.a  Makefile
makesetup  python-config.py  python.o  Setup  Setup.local

So adjust the removal logic to match.  Use a wildcard rather than
$GNU_TARGET_NAME as buildroot and python3's idea of the triplet doesn't
always match (E.G.  for musl/uclibc).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/python3.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index decae1b721..8e6a0296ed 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -203,8 +203,8 @@ define PYTHON3_REMOVE_USELESS_FILES
 	rm -f $(TARGET_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR)m-config
 	rm -f $(TARGET_DIR)/usr/bin/python3-config
 	rm -f $(TARGET_DIR)/usr/bin/smtpd.py.3
-	for i in `find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/config-$(PYTHON3_VERSION_MAJOR)m/ \
-		-type f -not -name pyconfig.h -a -not -name Makefile` ; do \
+	for i in `find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/config-$(PYTHON3_VERSION_MAJOR)m-*/ \
+		-type f -not -name Makefile` ; do \
 		rm -f $$i ; \
 	done
 	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/__pycache__/
-- 
2.11.0
