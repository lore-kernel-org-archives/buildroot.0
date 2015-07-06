From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 Jul 2015 09:53:38 +0200
Subject: [Buildroot] [git commit] ntp: drop uselss patch fixup which
	sometimes breaks rebuild
Message-ID: <20150706080825.BAAFF8164D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7917152f1353d670f5ada4a2f68397c339106d2c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop sed line which no longer changes anything as upstream has changed to
use strrchr.  Worse, it bumps each ntpd/*.c file's modification time, which
sometimes triggers a strange dependency path causing the makefile to attempt
to run the ntpd keyword-gen app, which fails, because it's been
cross-compiled.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ntp/ntp.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 5f05508..93cefa1 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -42,7 +42,6 @@ endif
 
 define NTP_PATCH_FIXUPS
 	$(SED) "s,^#if.*__GLIBC__.*_BSD_SOURCE.*$$,#if 0," $(@D)/ntpd/refclock_pcf.c
-	$(SED) '/[[:space:](]rindex[[:space:]]*(/s/[[:space:]]*rindex[[:space:]]*(/ strrchr(/g' $(@D)/ntpd/*.c
 endef
 
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTP_KEYGEN) += util/ntp-keygen
