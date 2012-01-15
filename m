From: Arkady Gilinsky <arcadyg@gmail.com>
Date: Sun, 15 Jan 2012 19:14:32 +0200
Subject: [Buildroot] [PATCH] BASH: Adding features that can not be
 automatically detected while cross-compiling
Message-ID: <CA+gTGJG2ZZayS9hbyqiZwJG_-eWDjJx8cZgKd5i5goEFNXBT0g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Arkady Gilinsky <arcadyg@gmail.com>
Date: Sat, 14 Jan 2012 11:27:11 +0200
Subject: [PATCH] BASH: Adding features that can not be automatically detected
 while cross-compiling

There are some bash features that can not be detected automatically during
configure stage while cross-compiling. This commit add ability to force
support of such a features.

Signed-off-by: Arkady Gilinsky <arcadyg@gmail.com>
---
 package/bash/Config.in |   33 +++++++++++++++++++++++++++++++++
 package/bash/bash.mk   |    6 +++++-
 2 files changed, 38 insertions(+), 1 deletions(-)

diff --git a/package/bash/Config.in b/package/bash/Config.in
index 9ee46e8..b7cc27d 100644
--- a/package/bash/Config.in
+++ b/package/bash/Config.in
@@ -5,3 +5,36 @@ config BR2_PACKAGE_BASH
 	  The standard GNU Bourne again shell.

 	  http://tiswww.case.edu/php/chet/bash/bashtop.html
+
+menu "BASH cross compile features selection"
+	depends on BR2_PACKAGE_BASH
+
+config BR2_PACKAGE_BASH_JOB_CONTROL
+	bool "job_control"
+	depends on BR2_PACKAGE_BASH
+	help
+	   The job control feature (Ctrl-Z and etc.)
+	   Configure variable - bash_cv_job_control_missing
+
+config BR2_PACKAGE_BASH_NAMED_PIPES
+	bool "named_pipes"
+	depends on BR2_PACKAGE_BASH
+	help
+	   Named pipe presence
+	   Configure variable - bash_cv_sys_named_pipes
+
+config BR2_PACKAGE_BASH_SIG_SET_JUMP
+	bool "sigsetjmp"
+	depends on BR2_PACKAGE_BASH
+	help
+	   POSIX-style sigsetjmp/siglongjmp
+	   Configure variable - bash_cv_func_sigsetjmp
+
+config BR2_PACKAGE_BASH_PRINTF_A_FORMAT
+	bool "printf_a_format"
+	depends on BR2_PACKAGE_BASH
+	help
+	   Printf floating point output in hex notation
+	   Configure variable - bash_cv_printf_a_format
+
+endmenu
diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index f1f951c..78face7 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -7,7 +7,11 @@
 BASH_VERSION = 4.2
 BASH_SITE = $(BR2_GNU_MIRROR)/bash
 BASH_DEPENDENCIES = ncurses
-BASH_CONF_ENV = bash_cv_job_control_missing=no
+BASH_CONF_ENV +=
          \
+   bash_cv_job_control_missing=$(if
$(BR2_PACKAGE_BASH_JOB_CONTROL),present,no) \
+   $(if $(BR2_PACKAGE_BASH_NAMED_PIPES),
bash_cv_sys_named_pipes=present,)      \
+   $(if $(BR2_PACKAGE_BASH_SIG_SET_JUMP),
bash_cv_func_sigsetjmp=present,)      \
+   $(if $(BR2_PACKAGE_BASH_PRINTF_A_FORMAT), bash_cv_printf_a_format=yes,)

 # Make sure we build after busybox so that /bin/sh links to bash
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-- 
1.7.7

-- 
Best regards
Arkady Gilinsky
