From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 Nov 2015 09:14:55 +0100
Subject: [Buildroot] [git commit] openntpd: fix linking problem when
	building statically
Message-ID: <20151124081516.67CD081E95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7f1ec872cd163ff1b5dd2448f8ff8af1a7178347
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The problem looks like this:

  CCLD     ntpd
../compat/.libs/libcompat.a(libcompat_la-arc4random.o): In function
`arc4random':
/br/output/build/openntpd-5.7p4/compat/arc4random.c:183: undefined
reference to `pthread_mutex_lock'
/br/output/build/openntpd-5.7p4/compat/arc4random.c:185: undefined
reference to `pthread_mutex_unlock'
../compat/.libs/libcompat.a(libcompat_la-arc4random.o): In function
`arc4random_buf':
/br/output/build/openntpd-5.7p4/compat/arc4random.c:192: undefined
reference to `pthread_mutex_lock'
/br/output/build/openntpd-5.7p4/compat/arc4random.c:194: undefined
reference to `pthread_mutex_unlock'
/br/output/build/openntpd-5.7p4/compat/arc4random.c:194: undefined
reference to `pthread_mutex_unlock'
collect2: error: ld returned 1 exit status

Adding -pthread to CFLAGS fixes the problem.

Fixes:

  http://autobuild.buildroot.net/results/b12/b120b6da87ae4eb355d06f2fd8f4fc8050410897/

[Peter: unconditionally pass in CFLAGS, add comment about why]
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openntpd/openntpd.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
index d51f902..40bb1bf 100644
--- a/package/openntpd/openntpd.mk
+++ b/package/openntpd/openntpd.mk
@@ -9,6 +9,10 @@ OPENNTPD_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenNTPD
 OPENNTPD_LICENSE = MIT-like, BSD-2c, BSD-3c
 OPENNTPD_LICENSE_FILES = COPYING
 
+# openntpd uses pthread functions for arc4random emulation but forgets
+# to use -pthread
+OPENNTPD_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -pthread"
+
 define OPENNTPD_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 package/openntpd/ntpd.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/ntpd.service
