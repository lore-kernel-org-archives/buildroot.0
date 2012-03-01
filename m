From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu,  1 Mar 2012 00:50:31 +0000
Subject: [Buildroot] [PATCH] target-finalize: Also copy .so files if
	BR2_HAVE_DEVFILES is enabled
In-Reply-To: <201203010030.08802.arnout@mind.be>
References: <201203010030.08802.arnout@mind.be>
Message-ID: <1330563031-20637-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

If BR2_HAVE_DEVFILES is enabled, target-finalizes copies the static
libraries from STAGING_DIR to TARGET_DIR.  However, there may also
be .so files that are not present on the target (because only the
versioned .so.x file is present).  In particular, this is the case
for libc.so.  So copy these ones as well.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Note that the whole copy.sh script could use a bit of refactoring.  It
could be called directly from the Makefile with something like:

for FILE_PATH in `find $(addprefix $(STAGING_DIR),lib usr/lib) -name *.a -o -name *.la -o -name *.so`; do
	STAGING_STRIPPED=$${FILE_PATH##$(STAGING_DIR)}
	mkdir -p $(TARGET_DIR)`dirname $${STAGING_STRIPPED}`
	if [ ! -e $(TARGET_DIR)$${STAGING_STRIPPED}]; then
		cp -a $${FILE_PATH} $(TARGET_DIR)$${STAGING_STRIPPED}
	fi
done

But I didn't have time to test that...
---
 support/scripts/copy.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/support/scripts/copy.sh b/support/scripts/copy.sh
index 508ed56..b6636f1 100755
--- a/support/scripts/copy.sh
+++ b/support/scripts/copy.sh
@@ -8,7 +8,7 @@ echo "Copying development files to target..."
 cp -af ${STAGING_DIR}/usr/include ${TARGET_DIR}/usr
 
 for LIBSDIR in /lib /usr/lib; do
-	for WILDCARD in *.a *.la; do
+	for WILDCARD in *.a *.la *.so; do
 		for FILE_PATH in `find ${STAGING_DIR}${LIBSDIR} -name ${WILDCARD}`; do
 			STAGING_STRIPPED=${FILE_PATH##${STAGING_DIR}}
 			EXTENDED_DIR=${STAGING_STRIPPED%/${WILDCARD}}
-- 
1.7.9
