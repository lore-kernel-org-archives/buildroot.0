From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Nov 2019 08:55:18 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] toolchain/helpers: make
 sure we bail out when kernel headers check fails
Message-ID: <20191119074820.1F8A38F306@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=421fba09b59088bc453e44cc8d0cefea4836f28a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

In commit 6136765b23abd9faba610dd54ed276a777811575 ("toolchain:
generate check-headers program under $(BUILD_DIR)"), the
check_kernel_headers_version function was simplified to not check the
return value of the check-kernel-headers.sh script, assuming that
"make" does bail out on the first failing command.

However, check_kernel_headers_version when used in $(2)_CONFIGURE_CMDS
from pkg-toolchain-external.mk, is called in a sequence of commands,
where the return value of each command is not checked. Therefore, a
failure of check-kernel-headers.sh no longer aborts the build.

Since all other macros are using this principle of calling "exit 1",
we revert back to the same for check_kernel_headers_version, as it was
done prior to 6136765b23abd9faba610dd54ed276a777811575.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Carlos Santos <unixmania@gmail.com>
Reviewed-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 68a0ec37581f1653e47f7107507f51eb4c6eeda3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/helpers.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 6a4f7223c8..28ae059693 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -163,7 +163,9 @@ copy_toolchain_sysroot = \
 # $3: kernel version string, in the form: X.Y
 #
 check_kernel_headers_version = \
-	support/scripts/check-kernel-headers.sh $(1) $(2) $(3)
+	if ! support/scripts/check-kernel-headers.sh $(1) $(2) $(3); then \
+		exit 1; \
+	fi
 
 #
 # Check the specific gcc version actually matches the version in the
