From: Romain Naour <romain.naour@smile.fr>
Date: Fri,  6 Sep 2019 11:09:47 +0200
Subject: [Buildroot] [PATCH 11/11] linux: don't set -Wno-attribute-alias
 flag when Clang is used as cross-compiler
In-Reply-To: <20190906090947.5476-1-romain.naour@smile.fr>
References: <20190906090947.5476-1-romain.naour@smile.fr>
Message-ID: <20190906090947.5476-12-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Clang stop the build due to -Werror and -Wunknown-warning-option:

error: unknown warning option '-Wno-attribute-alias'; did you mean '-Wattributes'? [-Werror,-Wunknown-warning-option]

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
---
 linux/linux.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index d381c96d85..93d80d85e6 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -145,7 +145,8 @@ endif
 # abusing those aliases for system call entry points, in order to
 # sanitize the arguments passed from user space in registers.
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82435
-ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
+# Clang doesn't support -Wno-attribute-alias
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8):$(BR2_USER_HOST_CLANG_AS_CROSS_COMPILER),y:)
 LINUX_MAKE_ENV += KCFLAGS=-Wno-attribute-alias
 endif
 
-- 
2.21.0
