From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 17 Jan 2012 18:25:28 +0100
Subject: [Buildroot] [PATCH v2] bash: Adding features that can not be
	automatically detected while cross-compiling
In-Reply-To: <1326820937-28384-1-git-send-email-arnout@mind.be>
References: <1326820937-28384-1-git-send-email-arnout@mind.be>
Message-ID: <1326821128-29133-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Arkady Gilinsky <arcadyg@gmail.com>

There are some bash features that can not be detected automatically during
configure stage while cross-compiling. This commit adds the ability to force
support of such features.

Signed-off-by: Arkady Gilinsky <arcadyg@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/bash/Config.in |   26 ++++++++++++++++++++++++++
 package/bash/bash.mk   |    6 +++++-
 2 files changed, 31 insertions(+), 1 deletions(-)

diff --git a/package/bash/Config.in b/package/bash/Config.in
index 9ee46e8..74f03e0 100644
--- a/package/bash/Config.in
+++ b/package/bash/Config.in
@@ -5,3 +5,29 @@ config BR2_PACKAGE_BASH
 	  The standard GNU Bourne again shell.
 
 	  http://tiswww.case.edu/php/chet/bash/bashtop.html
+
+if BR2_PACKAGE_BASH
+
+comment "Bash features that cannot be derived automatically when cross-compiling"
+
+config BR2_PACKAGE_BASH_JOB_CONTROL
+	bool "job_control"
+	help
+	   The job control feature (Ctrl-Z and etc.)
+
+config BR2_PACKAGE_BASH_NAMED_PIPES
+	bool "named_pipes"
+	help
+	   Named pipe presence
+
+config BR2_PACKAGE_BASH_SIG_SET_JUMP
+	bool "sigsetjmp"
+	help
+	   POSIX-style sigsetjmp/siglongjmp
+
+config BR2_PACKAGE_BASH_PRINTF_A_FORMAT
+	bool "printf_a_format"
+	help
+	   Printf floating point output in hex notation
+
+endif
diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index f1f951c..78face7 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -7,7 +7,11 @@
 BASH_VERSION = 4.2
 BASH_SITE = $(BR2_GNU_MIRROR)/bash
 BASH_DEPENDENCIES = ncurses
-BASH_CONF_ENV = bash_cv_job_control_missing=no
+BASH_CONF_ENV +=                                                                \
+   bash_cv_job_control_missing=$(if $(BR2_PACKAGE_BASH_JOB_CONTROL),present,no) \
+   $(if $(BR2_PACKAGE_BASH_NAMED_PIPES), bash_cv_sys_named_pipes=present,)      \
+   $(if $(BR2_PACKAGE_BASH_SIG_SET_JUMP), bash_cv_func_sigsetjmp=present,)      \
+   $(if $(BR2_PACKAGE_BASH_PRINTF_A_FORMAT), bash_cv_printf_a_format=yes,)
 
 # Make sure we build after busybox so that /bin/sh links to bash
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-- 
1.7.8.3
