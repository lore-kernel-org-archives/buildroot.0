From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 10 Feb 2020 22:48:40 +0100
Subject: [Buildroot] [PATCH v2 3/3] package/exim: fix build error during
 install step
In-Reply-To: <20200210214840.15023-1-luca@lucaceresoli.net>
References: <20200210214840.15023-1-luca@lucaceresoli.net>
Message-ID: <20200210214840.15023-4-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

exim builds some files during the 'make install' step, and these fail with
an error:

  lookups/lf_quote.c:49:3: error: 'for' loop initial declarations are only allowed in C99 mode
     for (int j = 0; j < vlength; j++)
     ^

Fix by passing the -std=c99 here, as it is already passed in the build
step.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>

---
Changes since v1: none.
---
 package/exim/exim.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 0ad9a8de8000..e4b0bfc1b488 100644
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
 
-- 
2.25.0
