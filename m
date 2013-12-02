From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  2 Dec 2013 07:49:25 -0300
Subject: [Buildroot] [PATCH 2/5] coreutils: bump to version 8.21
In-Reply-To: <1385981368-2235-1-git-send-email-gustavo@zacarias.com.ar>
References: <1385981368-2235-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1385981368-2235-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set PERL=missing so as to avoid generating manpages with help2man that breaks
on many occasions (and it's pointless).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/coreutils/coreutils-uname.patch | 173 --------------------------------
 package/coreutils/coreutils.mk          |  13 +--
 2 files changed, 3 insertions(+), 183 deletions(-)
 delete mode 100644 package/coreutils/coreutils-uname.patch

diff --git a/package/coreutils/coreutils-uname.patch b/package/coreutils/coreutils-uname.patch
deleted file mode 100644
index faa8908..0000000
--- a/package/coreutils/coreutils-uname.patch
+++ /dev/null
@@ -1,173 +0,0 @@
-On linux platforms, grok /proc/cpuinfo for the CPU/vendor info.
-
-Prob not suitable for upstream seeing as how it's 100% linux-specific
-http://lists.gnu.org/archive/html/bug-coreutils/2005-09/msg00063.html
-
-Patch originally by Carlos E. Gorges <carlos@techlinux.com.br>, but
-heavily reworked to suck less.
-
-To add support for additional platforms, check out the show_cpuinfo()
-func in the linux/arch/<ARCH>/ source tree of the kernel.
-
---- coreutils/src/uname.c
-+++ coreutils/src/uname.c
-@@ -50,6 +50,11 @@
- # include <mach-o/arch.h>
- #endif
- 
-+#if defined(__linux__)
-+# define USE_PROCINFO
-+# define UNAME_HARDWARE_PLATFORM
-+#endif
-+
- #include "system.h"
- #include "error.h"
- #include "quote.h"
-@@ -138,6 +143,117 @@
-   exit (status);
- }
- 
-+#if defined(USE_PROCINFO)
-+
-+# if defined(__s390__) || defined(__s390x__)
-+#  define CPUINFO_FILE    "/proc/sysinfo"
-+#  define CPUINFO_FORMAT  "%64[^\t :]%*[ :]%256[^\n]%c"
-+# else
-+#  define CPUINFO_FILE    "/proc/cpuinfo"
-+#  define CPUINFO_FORMAT  "%64[^\t:]\t:%256[^\n]%c"
-+# endif
-+
-+# define PROCINFO_PROCESSOR      0
-+# define PROCINFO_HARDWARE_PLATFORM 1
-+
-+static void __eat_cpuinfo_space(char *buf)
-+{
-+	/* first eat trailing space */
-+	char *tmp = buf + strlen(buf) - 1;
-+	while (tmp > buf && isspace(*tmp))
-+		*tmp-- = '\0';
-+	/* then eat leading space */
-+	tmp = buf;
-+	while (*tmp && isspace(*tmp))
-+		tmp++;
-+	if (tmp != buf)
-+		memmove(buf, tmp, strlen(tmp)+1);
-+	/* finally collapse whitespace */
-+	tmp = buf;
-+	while (tmp[0] && tmp[1]) {
-+		if (isspace(tmp[0]) && isspace(tmp[1])) {
-+			memmove(tmp, tmp+1, strlen(tmp));
-+			continue;
-+		}
-+		++tmp;
-+	}
-+}
-+
-+static int __linux_procinfo(int x, char *fstr, size_t s)
-+{
-+	FILE *fp;
-+
-+	char *procinfo_keys[] = {
-+		/* --processor --hardware-platform */
-+		#if defined(__alpha__)
-+			"cpu model", "system type"
-+		#elif defined(__arm__)
-+			"Processor", "Hardware"
-+		#elif defined(__avr32__)
-+			"processor", "cpu family"
-+		#elif defined(__bfin__)
-+			"CPU", "BOARD Name"
-+		#elif defined(__cris__)
-+			"cpu", "cpu model"
-+		#elif defined(__frv__)
-+			"CPU-Core", "System"
-+		#elif defined(__i386__) || defined(__x86_64__)
-+			"model name", "vendor_id"
-+		#elif defined(__ia64__)
-+			"family", "vendor"
-+		#elif defined(__hppa__)
-+			"cpu", "model"
-+		#elif defined(__m68k__)
-+			"CPU", "MMU"
-+		#elif defined(__mips__)
-+			"cpu model", "system type"
-+		#elif defined(__powerpc__) || defined(__powerpc64__)
-+			"cpu", "machine"
-+		#elif defined(__s390__) || defined(__s390x__)
-+			"Type", "Manufacturer"
-+		#elif defined(__sh__)
-+			"cpu type", "machine"
-+		#elif defined(sparc) || defined(__sparc__)
-+			"type", "cpu"
-+		#elif defined(__vax__)
-+			"cpu type", "cpu"
-+		#else
-+			"unknown", "unknown"
-+		#endif
-+	};
-+
-+	if ((fp = fopen(CPUINFO_FILE, "r")) != NULL) {
-+		char key[65], value[257], eol, *ret = NULL;
-+
-+		while (fscanf(fp, CPUINFO_FORMAT, key, value, &eol) != EOF) {
-+			__eat_cpuinfo_space(key);
-+			if (!strcmp(key, procinfo_keys[x])) {
-+				__eat_cpuinfo_space(value);
-+				ret = value;
-+				break;
-+			}
-+			if (eol != '\n') {
-+				/* we need two fscanf's here in case the previous
-+				 * length limit caused us to read right up to the
-+				 * newline ... doing "%*[^\n]\n" wont eat the newline
-+				 */
-+				fscanf(fp, "%*[^\n]");
-+				fscanf(fp, "\n");
-+			}
-+		}
-+		fclose(fp);
-+
-+		if (ret) {
-+			strncpy(fstr, ret, s);
-+			return 0;
-+		}
-+	}
-+
-+	return -1;
-+}
-+
-+#endif
-+
- /* Print ELEMENT, preceded by a space if something has already been
-    printed.  */
- 
-@@ -250,10 +344,14 @@ main (int argc, char **argv)
-   if (toprint & PRINT_PROCESSOR)
-     {
-       char const *element = unknown;
--#if HAVE_SYSINFO && defined SI_ARCHITECTURE
-+#if ( HAVE_SYSINFO && defined SI_ARCHITECTURE ) || defined(USE_PROCINFO)
-       {
-         static char processor[257];
-+#if defined(USE_PROCINFO)
-+        if (0 <= __linux_procinfo (PROCINFO_PROCESSOR, processor, sizeof processor))
-+#else
-         if (0 <= sysinfo (SI_ARCHITECTURE, processor, sizeof processor))
-+#endif
-           element = processor;
-       }
- #endif
-@@ -306,9 +404,13 @@ main (int argc, char **argv)
-       if (element == unknown)
-         {
-           static char hardware_platform[257];
-+#if defined(USE_PROCINFO)
-+          if (0 <= __linux_procinfo (PROCINFO_HARDWARE_PLATFORM, hardware_platform, sizeof hardware_platform))
-+#else
-           size_t s = sizeof hardware_platform;
-           static int mib[] = { CTL_HW, UNAME_HARDWARE_PLATFORM };
-           if (sysctl (mib, 2, hardware_platform, &s, 0, 0) >= 0)
-+#endif
-             element = hardware_platform;
-         }
- #endif
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 17c81f7..e0e9d80 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COREUTILS_VERSION = 8.18
+COREUTILS_VERSION = 8.21
 COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
 COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
 COREUTILS_LICENSE = GPLv3+
@@ -53,20 +53,13 @@ COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
 		gl_cv_func_working_mkstemp=yes \
 		gl_cv_func_working_utimes=yes \
 		gl_getline_needs_run_time_check=no \
-		utils_cv_localtime_cache=no
+		utils_cv_localtime_cache=no \
+		PERL=missing
 
 COREUTILS_CONF_OPT = --disable-rpath \
 		--disable-dependency-tracking \
 		--enable-install-program=hostname
 
-define COREUTILS_TOUCH_UNAME_C
-	# ensure uname.c file's timestamp does not change,
-	# so help2man does not run
-	touch -d '2010-01-01' $(@D)/src/uname.c
-endef
-
-COREUTILS_POST_PATCH_HOOKS += COREUTILS_TOUCH_UNAME_C
-
 define COREUTILS_POST_INSTALL
 	# some things go in root rather than usr
 	for f in $(COREUTILS_BIN_PROGS); do \
-- 
1.8.3.2
