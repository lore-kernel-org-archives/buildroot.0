From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 13 Feb 2014 12:34:45 +0100
Subject: [Buildroot] [PATCH 2 of 2] uclibc: copy config file from configure
	iso patch step
In-Reply-To: <patchbomb.1392291283@argentina>
References: <patchbomb.1392291283@argentina>
Message-ID: <99638f32b4ac5349460c.1392291285@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The three typical packages that use .config files in buildroot copy the
config file at different times in the build process:

    busybox copies its .config from the post-extract hook.
    linux copies its .config in the configure_cmds.
    uclibc copies its .config from the post-patch hook.

Copying the .config file from the configure step is the only way to properly
support an OVERRIDE_SRCDIR that does not yet have the .config file, because
the extract and patch steps are skipped in that case.

In a previous patch, the situation was already fixed for busybox. This patch
applies the same fix to uclibc: copy the config file from the configure
step, as linux is doing.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/uclibc/uclibc.mk |  3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -453,9 +453,8 @@ define UCLIBC_SETUP_DOT_CONFIG
 		oldconfig
 endef
 
-UCLIBC_POST_PATCH_HOOKS += UCLIBC_SETUP_DOT_CONFIG
-
 define UCLIBC_CONFIGURE_CMDS
+	$(UCLIBC_SETUP_DOT_CONFIG)
 	$(MAKE1) -C $(UCLIBC_DIR) \
 		$(UCLIBC_MAKE_FLAGS) \
 		PREFIX=$(STAGING_DIR) \
