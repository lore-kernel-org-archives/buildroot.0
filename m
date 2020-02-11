From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Feb 2020 23:30:20 +0100
Subject: [Buildroot] [git commit] package/exim: fix build error during
 install step
Message-ID: <20200211223133.CB33F8DB62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4dba4b40def74a5d0a3d8d0cd5b23ac64990c30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

exim builds some files during the 'make install' step, and these fail with
an error:

  lookups/lf_quote.c:49:3: error: 'for' loop initial declarations are only allowed in C99 mode
     for (int j = 0; j < vlength; j++)
     ^

Fix by passing the -std=c99 here, as it is already passed in the build
step.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exim/exim.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 0ad9a8de80..e4b0bfc1b4 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -135,7 +135,9 @@ endef
 # something when installing...
 define EXIM_INSTALL_TARGET_CMDS
 	DESTDIR=$(TARGET_DIR) INSTALL_ARG="-no_chown -no_symlink" build=br \
-	  $(MAKE1) -C $(@D) $(EXIM_STATIC_FLAGS) install
+	  $(MAKE1) -C $(@D) $(EXIM_STATIC_FLAGS) \
+		CFLAGS="-std=c99 $(TARGET_CFLAGS)" \
+		install
 	chmod u+s $(TARGET_DIR)/usr/sbin/exim
 endef
 
