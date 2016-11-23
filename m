From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 23 Nov 2016 12:14:04 +0100
Subject: [Buildroot] [PATCH/next] toolchain-external: support gcc < 4.3
Message-ID: <20161123111404.20661-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We currently support gcc as old as 4.3. However, Buildroot works
perfectly well with even older gcc versions (tested with 4.1). So we
can add an option BR2_TOOLCHAIN_EXTERNAL_GCC_OLD to support that. The
help text of this option is written with plenty of discouragement.

We use _OLD and not something like _PRE_4_3, because at some point we
will likely remove the 4.3 option and what would then require a name
change.

We don't set any _AT_LEAST option in this case because it's no use -
there is no lower bound on the version in this case. We therefore leave
BR2_TOOLCHAIN_GCC_AT_LEAST empty (the implicit default). When it is
empty, we don't do a version check at all in check_gcc_version. Indeed,
it makes perfect sense to not set any BR2_TOOLCHAIN_GCC_AT_LEAST
option.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
This patch conflicts with the external toolchain rework - I'll rebase
the one which "looses" in the first-to-be-committed contest.

We should also remove the 4.3 and 4.4 options, because they are
currently unused and also untested in the autobuilders.

I think something similar should be done for kernel headers.
---
 toolchain/helpers.mk                   |  3 +--
 toolchain/toolchain-external/Config.in | 11 +++++++++++
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 3991bc1..72e7292 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -145,8 +145,7 @@ check_kernel_headers_version = \
 check_gcc_version = \
 	expected_version="$(strip $2)" ; \
 	if [ -z "$${expected_version}" ]; then \
-		printf "Internal error, gcc version unknown (no GCC_AT_LEAST_X_Y selected)\n"; \
-		exit 1 ; \
+		exit 0 ; \
 	fi; \
 	real_version=`$(1) --version | sed -r -e '1!d; s/^[^)]+\) ([^[:space:]]+).*/\1/;'` ; \
 	if [[ ! "$${real_version}" =~ ^$${expected_version}\. ]] ; then \
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 5324599..7a3c504 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -712,6 +712,17 @@ config BR2_TOOLCHAIN_EXTERNAL_GCC_4_3
 	bool "4.3.x"
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_3
 
+config BR2_TOOLCHAIN_EXTERNAL_GCC_OLD
+	bool "older"
+	help
+	  Use this option if your GCC version is older than any of the
+	  above.
+
+	  Note that the Buildroot community doesn't do any testing with
+	  such old toolchains. Some packages may fail to build in
+	  surprising ways, or the generated root filesystem may not
+	  work at all. Use such old toolchains at your own risk.
+
 endchoice
 
 choice
-- 
2.10.2
