From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Aug 2019 09:48:44 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/python3: adjust
 _REMOVE_USELESS_FILES fix for new layout
Message-ID: <20190831074637.C0DDA88398@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ace10dd654cac2b75cc09a5aa27e58a63e7db090
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

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
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit b3424c8fc9d1199f5836483f15af48b56373609e)
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
