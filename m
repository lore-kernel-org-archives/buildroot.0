From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 May 2010 10:08:21 +0200
Subject: [Buildroot] [PATCH 01/19] Add a BR2_NEEDS_GETTEXT option
In-Reply-To: <cover.1274428595.git.thomas.petazzoni@free-electrons.com>
References: <cover.1274428595.git.thomas.petazzoni@free-electrons.com>
Message-ID: <54d64798e1e14b526c3cc1142961972cff9f1e8a.1274428595.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When using an external toolchain that uses the glibc or eglibc C
libraries, compiling a separate gettext and libintl is not needed and
is even a source of confusion, causing build failures. These build
failures are due to the fact that when libintl is compiled, it
replaces the C library libintl.h by its own, which does #define
gettext libintl_gettext. Then, when packages want to use gettext,
autoconf realize that gettext is available in the C library and
therefore do not add -lintl to the LDFLAGS, causing the build failure
because the program has been compiled to use libintl_gettext but this
function is not available.

Therefore, we should only use gettext if a uClibc internal toolchain
or a uClibc external toolchain. If an external glibc toolchain is
used, gettext shouldn't be used.

In order to implement that, we introduce the BR2_NEEDS_GETTEXT option,
which is hidden to the user, and whose value is computed automatically
from the rest of the configuration.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/Config.in.2 |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/toolchain/Config.in.2 b/toolchain/Config.in.2
index f04f18a..fc6759d 100644
--- a/toolchain/Config.in.2
+++ b/toolchain/Config.in.2
@@ -56,6 +56,14 @@ config BR2_ENABLE_LOCALE_WHITELIST
 	  will be available on the target - That purely depends on the
 	  support for that locale in the selected packages.
 
+# uClibc toolchains require a separatly-compiled gettext/libintl when
+# locale support is enabled. This isn't necessary with glibc
+#  toolchains as glibc includes gettext/libintl.
+config BR2_NEEDS_GETTEXT
+	bool
+	default y if (BR2_TOOLCHAIN_BUILDROOT && BR2_ENABLE_LOCALE)
+	default y if (BR2_TOOLCHAIN_EXTERNAL_UCLIBC && BR2_ENABLE_LOCALE)
+
 config BR2_USE_WCHAR
 	bool "Enable WCHAR support"
 	help
-- 
1.6.3.3
