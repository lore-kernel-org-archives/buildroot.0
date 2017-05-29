From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 29 May 2017 22:13:29 +0200
Subject: [Buildroot] [PATCH] package/google-breakpad: use PRE_CONFIGURE
	hooks to copy linux_syscall_support.h
Message-ID: <20170529201329.13455-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As reported by Bernd [1], using POST_EXTRACT to copy
linux_syscall_support.h break the legal-info target when
google-breakpad package is selected.

Step to reproduce:

Create a foo defconfig with google-breakpad package:
$ make foo_defconfig

Call legal-info
$ make legal-info

/usr/bin/install: cannot stat '/home/bernd/buildroot/buildroot/output/
host/usr/i586-buildroot-linux-uclibc/sysroot/usr/include/
linux_syscall_support.h': No such file or directory

Use PRE_CONFIGURE hooks instead since there are not used by legal-info.

[1] http://lists.busybox.net/pipermail/buildroot/2017-May/192844.html

Reported-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/google-breakpad/google-breakpad.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/google-breakpad/google-breakpad.mk b/package/google-breakpad/google-breakpad.mk
index 191ee5b..3501f45 100644
--- a/package/google-breakpad/google-breakpad.mk
+++ b/package/google-breakpad/google-breakpad.mk
@@ -23,14 +23,14 @@ define HOST_GOOGLE_BREAKPAD_LSS
 		$(HOST_DIR)/usr/include/linux_syscall_support.h \
 		$(@D)/src/third_party/lss/linux_syscall_support.h
 endef
-HOST_GOOGLE_BREAKPAD_POST_EXTRACT_HOOKS += HOST_GOOGLE_BREAKPAD_LSS
+HOST_GOOGLE_BREAKPAD_PRE_CONFIGURE_HOOKS += HOST_GOOGLE_BREAKPAD_LSS
 
 define GOOGLE_BREAKPAD_LSS
 	$(INSTALL) -D -m 0644 \
 		$(STAGING_DIR)/usr/include/linux_syscall_support.h \
 		$(@D)/src/third_party/lss/linux_syscall_support.h
 endef
-GOOGLE_BREAKPAD_POST_EXTRACT_HOOKS += GOOGLE_BREAKPAD_LSS
+GOOGLE_BREAKPAD_PRE_CONFIGURE_HOOKS += GOOGLE_BREAKPAD_LSS
 
 define GOOGLE_BREAKPAD_EXTRACT_SYMBOLS
 	$(EXTRA_ENV) package/google-breakpad/gen-syms.sh $(STAGING_DIR) \
-- 
2.9.4
