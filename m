From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 22:03:31 +0100
Subject: [Buildroot] [git commit branch/next] arch: introduce minimal
 required gcc version
Message-ID: <20171124211341.355FA801D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=974d97bc267d4e529ec3619c6c71e59f8f51833d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Some CPU variants require that a recent-enough gcc be selected. For
example, ARM's cortex-a35 requires gcc-5, while cortex-a73 requires
gcc-7. Same goes for other architectures, of course.

Currently, we hard-code every such conditions in the gcc version choice,
as well as in the individual external toolchains.

However, as we add even more CPU variants, the conditions are getting
more and more complex to write and maintain.

Introduce new symbols, that architectures can select if they have a
specific requirement on the gcc version. gcc and external toolchains
can then properly depend on those symbols.

The burden of maintaining the requirements on the gcc version now falls
down to the architeture, instead of being split up in gcc and all the
external toolchains.

As the oldest gcc version to handle, we can either choose gcc-4.9, as
the oldest version we support in our internal toolchain, or choose
gcc-4.8, as the oldest external toolchain we support (except for the
custom ones, but they'll be handled specifically in upcoming changes).
We choose to go back up to gcc-4.8.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index c10bf16..607da36 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -261,6 +261,27 @@ config BR2_ARCH_HAS_TOOLCHAIN_BUILDROOT
 	bool
 	default y if !BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
 
+# The following symbols are selected by the individual
+# Config.in.$ARCH files
+config BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
+	bool
+
+config BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
+	bool
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
+
+config BR2_ARCH_NEEDS_GCC_AT_LEAST_5
+	bool
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
+
+config BR2_ARCH_NEEDS_GCC_AT_LEAST_6
+	bool
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
+
+config BR2_ARCH_NEEDS_GCC_AT_LEAST_7
+	bool
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
+
 # The following string values are defined by the individual
 # Config.in.$ARCH files
 config BR2_ARCH
