From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 12 Feb 2014 17:55:44 +0100
Subject: [Buildroot] [PATCH 4 of 4] alsa-utils: fix build on no-mmu targets
In-Reply-To: <patchbomb.1392224140@argentina>
References: <patchbomb.1392224140@argentina>
Message-ID: <fba13b278df3df6a3fc7.1392224144@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

alsa-utils uses fork, which doesn't work on targets without mmu, such as
Blackfin. Apply a patch by the Blackfin developers to fix this.

Fixes
http://autobuild.buildroot.org/results/9f8/9f8e572c9f1c677155cc7d1828371bcf572ff878

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/alsa-utils/alsa-utils-0001-no-mmu.patch |  61 ++++++++++++++++++++
 package/alsa-utils/alsa-utils.mk                |   1 +
 2 files changed, 62 insertions(+), 0 deletions(-)

diff --git a/package/alsa-utils/alsa-utils-0001-no-mmu.patch b/package/alsa-utils/alsa-utils-0001-no-mmu.patch
new file mode 100644
--- /dev/null
+++ b/package/alsa-utils/alsa-utils-0001-no-mmu.patch
@@ -0,0 +1,61 @@
+Signed-off-by: Aaron Wu <Aaron.wu@analog.com>
+
+Add no-mmu support for alsa-utils mainly for Blackfin
+---
+ alsactl/init_utils_run.c |    4 ++++
+ alsaloop/alsaloop.c      |    8 ++++++++
+ configure.in             |    1 +
+ 3 files changed, 13 insertions(+)
+
+diff --git a/alsactl/init_utils_run.c b/alsactl/init_utils_run.c
+--- a/alsactl/init_utils_run.c
++++ b/alsactl/init_utils_run.c
+@@ -89,7 +89,11 @@ int run_program0(struct space *space,
+ 		argv[0] = program;
+ 	}
+ 
++	#ifdef HAVE_FORK
+ 	pid = fork();
++	#else
++	pid = vfork();
++	#endif
+ 	switch(pid) {
+ 	case 0:
+ 		/* child closes parent ends of pipes */
+diff --git a/alsaloop/alsaloop.c b/alsaloop/alsaloop.c
+--- a/alsaloop/alsaloop.c
++++ b/alsaloop/alsaloop.c
+@@ -850,14 +850,22 @@ int main(int argc, char *argv[])
+ 			logit(LOG_CRIT, "daemon() failed: %s\n", strerror(errno));
+ 			exit(EXIT_FAILURE);
+ 		}
++		#ifdef HAVE_FORK
+ 		i = fork();
++		#else
++		i = vfork();
++		#endif
+ 		if (i < 0) {
+ 			logit(LOG_CRIT, "fork() failed: %s\n", strerror(errno));
+ 			exit(EXIT_FAILURE);
+ 		}
+ 		if (i > 0) {
+ 			/* wait(&i); */
++			#ifdef HAVE_FORK
+ 			exit(EXIT_SUCCESS);
++			#else
++			_exit(EXIT_SUCCESS);
++			#endif
+ 		}
+ 	}
+ 
+diff --git a/configure.in b/configure.in
+--- a/configure.in
++++ b/configure.in
+@@ -23,6 +23,7 @@ then
+   AC_MSG_RESULT($CC)
+ fi
+ 
++AC_CHECK_FUNC([fork])
+ AC_PROG_CC
+ dnl AC_PROG_CXX
+ AC_PROG_INSTALL
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -9,6 +9,7 @@ ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UT
 ALSA_UTILS_SITE = http://alsa.cybermirror.org/utils
 ALSA_UTILS_LICENSE = GPLv2
 ALSA_UTILS_LICENSE_FILES = COPYING
+ALSA_UTILS_AUTORECONF = YES
 ALSA_UTILS_INSTALL_STAGING = YES
 ALSA_UTILS_DEPENDENCIES = host-gettext host-pkgconf alsa-lib \
 	$(if $(BR2_PACKAGE_NCURSES),ncurses)
