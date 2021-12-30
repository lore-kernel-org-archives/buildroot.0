Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A44C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 20:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A919681346;
	Thu, 30 Dec 2021 20:42:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id flH1CUs8zcX9; Thu, 30 Dec 2021 20:42:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3F4F81331;
	Thu, 30 Dec 2021 20:42:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7904E1C113E
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67A8B81358
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:41:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qbegLKoerWat for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 20:41:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89F2B81331
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 20:41:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id F361782A05; Thu, 30 Dec 2021 20:35:53 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 21:37:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb342619e1fc8aa99c3a8d91c78c81790ff1bafb
X-Git-Newrev: da4cb17aa165a5c4b41efc09a6e7c606186d038f
X-Patchwork-Hint: ignore
Message-Id: <20211230203553.F361782A05@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Makefile: introduce show-vars,
 a json-formatted equivalent to printvars
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

commit: https://git.buildroot.net/buildroot/commit/?id=da4cb17aa165a5c4b41efc09a6e7c606186d038f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current printvars output suffers from a serious design flaw:
variables are not delimited, which makes it impossible to reliably
retrieve the value of variables; only variables that are known to
not contain a \n can be relatively safely extracted.

However, in some cases, it is important to be able to retrieve the
multi-line value of a variable, notably the CMDS or the hooks. One
such use-case (to follow in an unscheduled future) would be to hash
the variables that make up a package "configuration", and cache or
extract the files for that package to speed up the build.

Modeled after printvars and show-info, we introduce show-vars (what a
lack of imagination here) that outputs a json dictionary which keys are
the variable names, and for each variable, provides the raw and expanded
values.

Unlike printvars, we do not provide a way to get either the raw or
expanded value; both are systematically printed; a user will get just
the one is needs. Additionally, strings in JSON are quoted, so there is
no need to provide a way to quote variables; that would not make sense.

Note: for printvars, we require that the user provides an explicit
pattern to filter variables on. This is historical (see fd5bd12379dc,
Makefile: printvars: don't print anything when VARS is not set). The
underlying reasoning was that printvars is too "raw", and variables are
not well delimited, so printvars was mostly used to extract a few values
here and there, from scripts, or to quickly inspect a specific package's
variables during debugging.

But show-vars, although technically plain-text, being JSON, is not very
human-readable, and is mostly aimed at tools that will parse it with a
real JSON parser, and which will want to have a complete view of a lot
of variables at once. As such, and contrary to printvars, it makes sense
to report on all variables by default, unless the user explicitly
requested a subset.

As a final note: a lot of our variables only make sense in the context
of an actual make target. For example, a variable of package foo, that
contains $(@D)/bar, would expand to .../build/FOO-VERSION/bar. This is
because our CMDS and hooks are expanded as the recipe of a stamp file
that lies in the package build directory.

But for show-info, this falls flat on its face: it is not the stamp file
of a package, so there is no package directory, and show-info itself has
not directory part, so $(@D) expands to '.' (dot).

Additionally, some variables may contain calls to $(shell) (e.g. to call
pkg-config), and this also does not work with show-info.

These two issues make it impossible to emit the correct expanded value
of variables. To be noted: printvars has the exact same limitations for
the exact same reasons.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Makefile | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 99a34c1600..0b8c7b2867 100644
--- a/Makefile
+++ b/Makefile
@@ -141,7 +141,7 @@ nobuild_targets := source %-source \
 	clean distclean help show-targets graph-depends \
 	%-graph-depends %-show-depends %-show-version \
 	graph-build graph-size list-defconfigs \
-	savedefconfig update-defconfig printvars
+	savedefconfig update-defconfig printvars show-vars
 ifeq ($(MAKECMDGOALS),)
 BR_BUILDING = y
 else ifneq ($(filter-out $(nobuild_targets),$(MAKECMDGOALS)),)
@@ -1062,6 +1062,7 @@ endif
 # Makefiles. Alternatively, if a non-empty VARS variable is passed,
 # only the variables matching the make pattern passed in VARS are
 # displayed.
+# show-vars does the same, but as a JSON dictionnary.
 .PHONY: printvars
 printvars:
 	@:
@@ -1074,6 +1075,22 @@ printvars:
 			$(info $V=$(if $(RAW_VARS),$(value $V),$($V))))))
 # ')))) # Syntax colouring...
 
+.PHONY: show-vars
+show-vars: VARS?=%
+show-vars:
+	@:
+	$(info $(call clean-json, { \
+			$(foreach V, \
+				$(sort $(filter $(VARS),$(.VARIABLES))), \
+				$(if $(filter-out environment% default automatic, $(origin $V)), \
+					"$V": { \
+						"expanded": $(call mk-json-str,$($V))$(comma) \
+						"raw": $(call mk-json-str,$(value $V)) \
+					}$(comma) \
+				) \
+			) \
+	} ))
+
 .PHONY: clean
 clean:
 	rm -rf $(BASE_TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) $(HOST_DIR_SYMLINK) \
@@ -1166,6 +1183,8 @@ help:
 	@echo '  pkg-stats              - generate info about packages as JSON and HTML'
 	@echo '  missing-cpe            - generate XML snippets for missing CPE identifiers'
 	@echo '  printvars              - dump internal variables selected with VARS=...'
+	@echo '  show-vars              - dump all internal variables as a JSON blurb; use VARS=...'
+	@echo '                           to limit the list to variables names matching that pattern'
 	@echo
 	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
 	@echo '  make O=dir             - Locate all output files in "dir", including .config'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
