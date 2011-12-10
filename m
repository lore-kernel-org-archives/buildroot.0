From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 10 Dec 2011 22:13:15 +0100
Subject: [Buildroot] [git commit] imlib2: fixup imlib2-config
Message-ID: <20111210222040.B532B8F8F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8ad1885adbf14bfe731873dedd4e47ef72674b17
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ensure it doesn't add library search paths (-L<dir>) to linker flags.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/imlib2/imlib2.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/imlib2/imlib2.mk b/package/imlib2/imlib2.mk
index 5f10503..f32b865 100644
--- a/package/imlib2/imlib2.mk
+++ b/package/imlib2/imlib2.mk
@@ -52,5 +52,13 @@ else
 	IMLIB2_CONF_OPT += --without-id3
 endif
 
+# drop -L<dir> from linker flags
+define IMLIB2_FIXUP_IMLIB2_CONFIG
+	$(SED) 's/-L[^ ]*//g' \
+		$(STAGING_DIR)/usr/bin/imlib2-config
+endef
+
+IMLIB2_POST_INSTALL_STAGING_HOOKS += IMLIB2_FIXUP_IMLIB2_CONFIG
+
 $(eval $(call AUTOTARGETS))
 
