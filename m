From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 12 May 2013 19:40:13 +0200
Subject: [Buildroot] [PATCH] linux-pam: fix missing includes
Message-ID: <1368380413-31647-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Two patches taken from upstream fix e.g.
http://autobuild.buildroot.org/results/fa31431066ce0f9c554bdb923e59aa0458508224

These patches are in linux-pam 1.1.6 already, but since I don't know
how to test it, I don't want to do a version bump.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...iables-are-no-longer-defined-unless-you-e.patch | 28 ++++++++++++++++
 ...pam_unix-fix-build-in-enable-selinux-mode.patch | 37 ++++++++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 package/linux-pam/linux-pam-RLIMIT_-variables-are-no-longer-defined-unless-you-e.patch
 create mode 100644 package/linux-pam/linux-pam-pam_unix-fix-build-in-enable-selinux-mode.patch

diff --git a/package/linux-pam/linux-pam-RLIMIT_-variables-are-no-longer-defined-unless-you-e.patch b/package/linux-pam/linux-pam-RLIMIT_-variables-are-no-longer-defined-unless-you-e.patch
new file mode 100644
index 0000000..a73ada6
--- /dev/null
+++ b/package/linux-pam/linux-pam-RLIMIT_-variables-are-no-longer-defined-unless-you-e.patch
@@ -0,0 +1,28 @@
+Date: Mon, 9 Jul 2012 09:43:11 +0200
+Subject: [PATCH] RLIMIT_* variables are no longer defined unless you
+ explicitly include sys/resource.h.
+
+Signed-off-by: Diego Elio Petten? <flameeyes@flameeyes.eu>
+
+modules/pam_unix/pam_unix_acct.c: Include sys/resource.h.
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+[This patch is in linux-pam 1.1.6]
+---
+ modules/pam_unix/pam_unix_acct.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/modules/pam_unix/pam_unix_acct.c b/modules/pam_unix/pam_unix_acct.c
+index 8e90cc9..4a362f8 100644
+--- a/modules/pam_unix/pam_unix_acct.c
++++ b/modules/pam_unix/pam_unix_acct.c
+@@ -41,6 +41,7 @@
+ #include <string.h>
+ #include <unistd.h>
+ #include <sys/types.h>
++#include <sys/resource.h>
+ #include <syslog.h>
+ #include <pwd.h>
+ #include <shadow.h>
+-- 
+1.8.2.1
+
diff --git a/package/linux-pam/linux-pam-pam_unix-fix-build-in-enable-selinux-mode.patch b/package/linux-pam/linux-pam-pam_unix-fix-build-in-enable-selinux-mode.patch
new file mode 100644
index 0000000..550e02e
--- /dev/null
+++ b/package/linux-pam/linux-pam-pam_unix-fix-build-in-enable-selinux-mode.patch
@@ -0,0 +1,37 @@
+From: "Dmitry V. Levin" <ldv@altlinux.org>
+Date: Wed, 10 Oct 2012 18:13:07 +0000
+Subject: [PATCH] pam_unix: fix build in --enable-selinux mode
+
+glibc's <sys/wait.h> starting with commit
+http://sourceware.org/git/?p=glibc.git;a=commitdiff;h=glibc-2.15-231-gd94a467
+does not include <sys/resource.h> for POSIX 2008 conformance reasons, so
+when pam is being built with SELinux support enabled, pam_unix_passwd.c
+uses getrlimit(2) and therefore should include <sys/resource.h> without
+relying on other headers.
+
+* modules/pam_unix/pam_unix_passwd.c: Include <sys/resource.h>.
+
+Reported-by: Guido Trentalancia <guido@trentalancia.com>
+Reported-by: "Jory A. Pratt" <anarchy@gentoo.org>
+Reported-by: Diego Elio Petten? <flameeyes@flameeyes.eu>
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+[This patch is in linux-pam 1.1.6]
+---
+ modules/pam_unix/pam_unix_passwd.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/modules/pam_unix/pam_unix_passwd.c b/modules/pam_unix/pam_unix_passwd.c
+index 9e1302d..94bc3ec 100644
+--- a/modules/pam_unix/pam_unix_passwd.c
++++ b/modules/pam_unix/pam_unix_passwd.c
+@@ -58,6 +58,7 @@
+ #include <signal.h>
+ #include <errno.h>
+ #include <sys/wait.h>
++#include <sys/resource.h>
+ 
+ #include <security/_pam_macros.h>
+ 
+-- 
+1.8.2.1
+
-- 
1.8.2.1
