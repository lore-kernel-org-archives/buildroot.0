From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Jun 2017 16:31:24 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/google-breakpad:
	use PRE_CONFIGURE hooks to copy linux_syscall_support.h
Message-ID: <20170601144624.082428296D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f287506b13d36adf777f82ac77b9c5c5d5d877bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

As reported by Bernd [1], using POST_EXTRACT to copy
linux_syscall_support.h break the legal-info target when
google-breakpad package is selected:

/usr/bin/install: cannot stat '/home/bernd/buildroot/buildroot/output/ost/usr/i586-buildroot-linux-uclibc/sysroot/usr/include/linux_syscall_support.h': No such file or directory

This is because linux_syscall_support.h is installed by a dependency
of google-breakpad, and dependencies are only guaranteed to be
available for the configure step of a package. To fix this, we use a
PRE_CONFIGURE hook instead of POST_EXTRACT hook.

[1] http://lists.busybox.net/pipermail/buildroot/2017-May/192844.html

Reported-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 557f8d649d9a959e810a3c92774020a434d567a8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/google-breakpad/google-breakpad.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/google-breakpad/google-breakpad.mk b/package/google-breakpad/google-breakpad.mk
index 7a11c72..68ff853 100644
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
