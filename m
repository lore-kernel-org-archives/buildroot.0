Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87735C636CD
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 14:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28D7881494;
	Sun,  5 Feb 2023 14:12:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28D7881494
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FrvVyT_C733i; Sun,  5 Feb 2023 14:12:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32F9481764;
	Sun,  5 Feb 2023 14:12:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32F9481764
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 647011BF475
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B98D81764
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:12:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B98D81764
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sEnm4we-VHBR for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 14:12:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54B4181494
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 14:12:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54B4181494
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 418DC83837; Sun,  5 Feb 2023 14:12:16 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 5 Feb 2023 15:11:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d4ecefa3ccbe29b1e047c97a995a7c966a191583
X-Git-Newrev: 93e7fc3e53bff9db971f3ae951d93d3bd1a39d1e
X-Patchwork-Hint: ignore
Message-Id: <20230205141216.418DC83837@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain: make paranoid check of
 library/header paths unconditional
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=93e7fc3e53bff9db971f3ae951d93d3bd1a39d1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When we introduced support for the paranoid check of unsafe libraries
and headers path with commit 4ac8f78d3771 (Add option for paranoid
unsafe path checking) back in 2014, we made it optional, as we expected
that would break quite a few packages.

Now, almost 8 years later, we only have three packages that explicitly
reference the option (dillo, gnuradio, and libtalloc), either in a patch
or in their .mk.

The option has been enabled by default since 2016, with 61c8854cef2a
(toolchain: enable paranoid unsafe path check by default), and that has
not triggered many build failures in a while.

The minimal defconfig used by test-pkg has also had it enabled as of
b6c98b3549d8 (minimal.config: add BR2_COMPILER_PARANOID_UNSAFE_PATH=y)
in 2017.

It is time to make that globally unconditional now.

There is still a remnant, in our binutils patches. As our toolchain may
get used outside of Buildroot, people may got the expectation that path
poisoning is only a warning, so we keep the current behaviour.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in                               | 18 ------------------
 package/Makefile.in                     |  3 +--
 support/config-fragments/minimal.config |  1 -
 toolchain/toolchain-wrapper.c           | 21 ++++-----------------
 4 files changed, 5 insertions(+), 38 deletions(-)

diff --git a/Config.in b/Config.in
index 86699f58c6..0d7641633c 100644
--- a/Config.in
+++ b/Config.in
@@ -685,24 +685,6 @@ config BR2_GLOBAL_PATCH_DIR
 
 menu "Advanced"
 
-config BR2_COMPILER_PARANOID_UNSAFE_PATH
-	bool "paranoid check of library/header paths"
-	default y
-	help
-	  By default, when this option is disabled, when the Buildroot
-	  cross-compiler will encounter an unsafe library or header path
-	  (such as /usr/include, or /usr/lib), the compiler will display
-	  a warning.
-
-	  By enabling this option, this warning is turned into an error,
-	  which will completely abort the build when such unsafe paths
-	  are encountered.
-
-	  Note that this mechanism is available for both the internal
-	  toolchain (through the toolchain wrapper and binutils patches)
-	  and external toolchain backends (through the toolchain
-	  wrapper).
-
 config BR2_FORCE_HOST_BUILD
 	bool "Force the building of host dependencies"
 	help
diff --git a/package/Makefile.in b/package/Makefile.in
index 7f1b00ba24..d70aded82b 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -426,9 +426,8 @@ else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
 SHARED_STATIC_LIBS_OPTS = --enable-static --enable-shared
 endif
 
-ifeq ($(BR2_COMPILER_PARANOID_UNSAFE_PATH),y)
+# Used by our binutils patches.
 export BR_COMPILER_PARANOID_UNSAFE_PATH=enabled
-endif
 
 include package/pkg-download.mk
 include package/pkg-autotools.mk
diff --git a/support/config-fragments/minimal.config b/support/config-fragments/minimal.config
index 71344e2c69..3430fcce11 100644
--- a/support/config-fragments/minimal.config
+++ b/support/config-fragments/minimal.config
@@ -4,5 +4,4 @@ BR2_INIT_NONE=y
 BR2_SYSTEM_BIN_SH_NONE=y
 # BR2_PACKAGE_BUSYBOX is not set
 # BR2_TARGET_ROOTFS_TAR is not set
-BR2_COMPILER_PARANOID_UNSAFE_PATH=y
 BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 37b24dd24a..4c08e97237 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -154,12 +154,9 @@ static const struct str_len_s unsafe_opts[] = {
  * or separated (e.g. -I /foo/bar). In the first case, we need only print
  * the argument as it already contains the path (arg_has_path), while in
  * the second case we need to print both (!arg_has_path).
- *
- * If paranoid, exit in error instead of just printing a warning.
  */
 static void check_unsafe_path(const char *arg,
 			      const char *path,
-			      int paranoid,
 			      int arg_has_path)
 {
 	const struct str_len_s *p;
@@ -168,14 +165,12 @@ static void check_unsafe_path(const char *arg,
 		if (strncmp(path, p->str, p->len))
 			continue;
 		fprintf(stderr,
-			"%s: %s: unsafe header/library path used in cross-compilation: '%s%s%s'\n",
+			"%s: ERROR: unsafe header/library path used in cross-compilation: '%s%s%s'\n",
 			program_invocation_short_name,
-			paranoid ? "ERROR" : "WARNING",
 			arg,
 			arg_has_path ? "" : "' '", /* close single-quote, space, open single-quote */
 			arg_has_path ? "" : path); /* so that arg and path are properly quoted. */
-		if (paranoid)
-			exit(1);
+		exit(1);
 	}
 }
 
@@ -250,8 +245,6 @@ int main(int argc, char **argv)
 	char *progpath = argv[0];
 	char *basename;
 	char *env_debug;
-	char *paranoid_wrapper;
-	int paranoid;
 	int ret, i, count = 0, debug = 0, found_shared = 0;
 
 	/* Debug the wrapper to see arguments it was called with.
@@ -470,12 +463,6 @@ int main(int argc, char **argv)
 #endif
 	}
 
-	paranoid_wrapper = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
-	if (paranoid_wrapper && strlen(paranoid_wrapper) > 0)
-		paranoid = 1;
-	else
-		paranoid = 0;
-
 	/* Check for unsafe library and header paths */
 	for (i = 1; i < argc; i++) {
 		const struct str_len_s *opt;
@@ -492,9 +479,9 @@ int main(int argc, char **argv)
 				i++;
 				if (i == argc)
 					break;
-				check_unsafe_path(argv[i-1], argv[i], paranoid, 0);
+				check_unsafe_path(argv[i-1], argv[i], 0);
 			} else
-				check_unsafe_path(argv[i], argv[i] + opt->len, paranoid, 1);
+				check_unsafe_path(argv[i], argv[i] + opt->len, 1);
 		}
 	}
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
