From: James Knight <james.d.knight@live.com>
Date: Sun, 30 Aug 2015 08:20:42 -0400
Subject: [Buildroot] [PATCH 1/1] package/bash: indicate getcwd is
	malloc-supported
Message-ID: <BLU436-SMTP2066E5D6D70E93216F0327EA0680@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When Bash attempts to find the current working directory, it uses a C
library call `getcwd` to resolve it. When cross-compiling, the
configuration process cannot determine if the target system's C library
can support an "unfixed" path length. Therefore, Bash will fallback to a
size of `PATH_MAX` for determining the current working directory. When
using OverlayFS (and possible other file systems), this becomes an issue
since file paths can commonly exceed standard `PATH_MAX` length. This
typically results in the following error appearing:

   error retrieving current directory: [...]

Common C library `getcwd` calls can default to a higher limit (usually
the system's page size). The current configurable C libraries (as of at
least 2015.08) support a zero (0) size buffer length. Most use the
system's page size; musl, being an exception, which defaults to
`PATH_MAX` (as Bash was doing). Since these C libraries support
allocating buffer space with a zero (0) provided size, the following
configuration change allows Bash to support getting a larger-length'ed
working directory on target's that support it.

Signed-off-by: James Knight <james.d.knight@live.com>
---
 package/bash/bash.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index 9865e19..97d7182 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -16,6 +16,7 @@ BASH_LICENSE_FILES = COPYING
 BASH_CONF_ENV += \
 	ac_cv_rl_prefix="$(STAGING_DIR)" \
 	ac_cv_rl_version="$(READLINE_VERSION)" \
+	bash_cv_getcwd_malloc=yes \
 	bash_cv_job_control_missing=present \
 	bash_cv_sys_named_pipes=present \
 	bash_cv_func_sigsetjmp=present \
-- 
2.4.3
