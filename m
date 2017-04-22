From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 22 Apr 2017 19:38:35 +0200
Subject: [Buildroot] [Patch v5 2/7] rustc: new virtual package
In-Reply-To: <20170422173840.19694-1-eric.le.bihan.dev@free.fr>
References: <20170422173840.19694-1-eric.le.bihan.dev@free.fr>
Message-ID: <20170422173840.19694-3-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The compiler for the Rust programming language is called rustc.

There is only one reference implementation for it, based on LLVM, from
the Rust project [1]. It can generate code for various architectures so
it can be labeled as a cross-compiler. But, as for GCC, building it
from source takes time.

So it would be sensible to have at least one package which provides it
as a pre-built version, fetched from the upstream project. Later another
package can be added, to build it from source code.

In addition to the compiler, the standard library for the host and/or
the target should also be fetched/built.

So, add a virtual package named rustc to enable support for multiple
providers.

Currently, only the host variant will be available to allow the user to
cross-compile Rust programs for the target.

[1] http://rust-lang.org

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/rustc/Config.in.host |  5 +++++
 package/rustc/rustc.mk       | 21 +++++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 package/rustc/Config.in.host
 create mode 100644 package/rustc/rustc.mk

diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
new file mode 100644
index 0000000..fef78a7
--- /dev/null
+++ b/package/rustc/Config.in.host
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_HAS_HOST_RUSTC
+	bool
+
+config BR2_PACKAGE_PROVIDES_HOST_RUSTC
+	string
diff --git a/package/rustc/rustc.mk b/package/rustc/rustc.mk
new file mode 100644
index 0000000..fc743fa
--- /dev/null
+++ b/package/rustc/rustc.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# rustc
+#
+################################################################################
+
+RUST_TARGET_NAME := $(subst buildroot,unknown,$(GNU_TARGET_NAME))
+
+ifeq ($(BR2_ARM_CPU_ARMV7A),y)
+RUST_TARGET_NAME := $(subst arm-,armv7-,$(RUST_TARGET_NAME))
+endif
+
+ifeq ($(HOSTARCH),x86_64)
+RUST_HOST_ARCH = x86_64
+else ifeq ($(HOSTARCH),x86)
+RUST_HOST_ARCH = i686
+endif
+
+RUST_HOST_NAME = $(RUST_HOST_ARCH)-unknown-linux-gnu
+
+$(eval $(host-virtual-package))
-- 
2.9.3
