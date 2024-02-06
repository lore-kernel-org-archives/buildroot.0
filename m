Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CC6C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 16:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0067461292;
	Tue,  6 Feb 2024 16:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0067461292
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R8F464Q_hfMj; Tue,  6 Feb 2024 16:26:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4256661299;
	Tue,  6 Feb 2024 16:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4256661299
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 36FB71BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CAEE6113F
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CAEE6113F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MysdaIj4E71E for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 16:26:05 +0000 (UTC)
Received: from iodev.co.uk (iodev.co.uk [46.30.189.100])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC384612B4
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 16:26:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC384612B4
Received: from localhost (unknown [85.119.216.19])
 by iodev.co.uk (Postfix) with ESMTPSA id 34847290A81;
 Tue,  6 Feb 2024 17:25:57 +0100 (CET)
From: Ismael Luceno <ismael@iodev.co.uk>
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 17:25:53 +0100
Message-ID: <20240206162555.31657-1-ismael@iodev.co.uk>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam: Yes
Subject: [Buildroot] [RFC PATCH v3] docs/website: Add Makefile to
 pre-generate the website
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
Cc: Ismael Luceno <ismael@iodev.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Supports the current includes plus smu [0] lightweight markup.

[0] https://github.com/Gottox/smu
Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
---

Notes:
    Changes since v2:
    - Integrate with toplevel makefile
    - Use parethesis instead of curly braces for variables
    - Removed smu rule
    - Copy resources to output directory too
    - Filter-out footer.html & header.html

 Makefile                 |  8 ++++++--
 docs/website/incfile.awk | 30 ++++++++++++++++++++++++++++++
 docs/website/website.mk  | 31 +++++++++++++++++++++++++++++++
 3 files changed, 67 insertions(+), 2 deletions(-)
 create mode 100644 docs/website/incfile.awk
 create mode 100644 docs/website/website.mk

diff --git a/Makefile b/Makefile
index ac625152c678..cd56bc268917 100644
--- a/Makefile
+++ b/Makefile
@@ -123,7 +123,8 @@ endif
 noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconfig \
 	defconfig %_defconfig allyesconfig allnoconfig alldefconfig syncconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
-	print-version olddefconfig distclean manual manual-% check-package
+	print-version olddefconfig distclean manual manual-% check-package \
+	website
 
 # Some global targets do not trigger a build, but are used to collect
 # metadata, or do various checks. When such targets are triggered,
@@ -1180,6 +1181,7 @@ help:
 	@echo '  graph-depends          - generate graph of the dependency tree'
 	@echo '  graph-size             - generate stats of the filesystem size'
 	@echo '  list-defconfigs        - list all defconfigs (pre-configured minimal systems)'
+	@echo '  website                - build website'
 	@echo
 	@echo 'Miscellaneous:'
 	@echo '  source                 - download all sources needed for offline-build'
@@ -1234,7 +1236,7 @@ release: OUT = buildroot-$(BR2_VERSION)
 # documentation to the git output
 release:
 	git archive --format=tar --prefix=$(OUT)/ HEAD > $(OUT).tar
-	$(MAKE) O=$(OUT) manual-html manual-text manual-pdf
+	$(MAKE) O=$(OUT) manual-html manual-text manual-pdf website
 	$(MAKE) O=$(OUT) distclean
 	tar rf $(OUT).tar $(OUT)
 	gzip -9 -c < $(OUT).tar > $(OUT).tar.gz
@@ -1253,6 +1255,8 @@ check-package:
 	$(Q)./utils/check-package --failed-only `git ls-tree -r --name-only HEAD` \
 		> .checkpackageignore
 
+include docs/website/website.mk
+
 include docs/manual/manual.mk
 -include $(foreach dir,$(BR2_EXTERNAL_DIRS),$(sort $(wildcard $(dir)/docs/*/*.mk)))
 
diff --git a/docs/website/incfile.awk b/docs/website/incfile.awk
new file mode 100644
index 000000000000..e8ae571de271
--- /dev/null
+++ b/docs/website/incfile.awk
@@ -0,0 +1,30 @@
+BEGIN {
+	FS="\""
+}
+
+FNR == 1 {
+	curdir = FILENAME
+	sub(/[^/]*$/, "", curdir)
+	if (curdir !~ /[/]$/)
+		curdir = curdir "/"
+}
+
+{
+	do {
+		if (match($0, /^<!--#include file="([^"]*)" *-->$/)) {
+			file_stack[++file_cur] = curdir $2
+		} else {
+			print
+		}
+		if (file_cur > 0) {
+			e = getline < file_stack[file_cur]
+			if (!e) {
+				--file_cur
+			} else if (e == -1) {
+				printf "%s: read error\n", \
+					file_stack[file_cur] \
+					> "/dev/stderr"
+			}
+		}
+	} while (file_cur > 0)
+}
diff --git a/docs/website/website.mk b/docs/website/website.mk
new file mode 100644
index 000000000000..d3f7b28aaa07
--- /dev/null
+++ b/docs/website/website.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# The Buildroot website
+#
+################################################################################
+
+AWK ?= mawk
+
+website-dir = $(TOPDIR)/docs/website
+website-src = $(wildcard $(website-dir)/*.html)
+website-gen = $(filter-out %/header.html %/footer.html,\
+	$(website-src:$(website-dir)/%=$(O)/website/%))
+website-res = $(patsubst $(website-dir)/%,$(O)/website/%,$(wildcard \
+	$(website-dir)/js/*.js \
+	$(website-dir)/css/*.css \
+	$(website-dir)/fonts/* \
+	$(website-dir)/images/* \
+))
+
+website: $(website-gen) $(website-res)
+
+$(website-res): $(O)/website/%: $(website-dir)/%
+	install -m644 -D $< $@
+
+website-dep = $(website-dir)/website.mk $(website-dir)/incfile.awk
+
+$(O)/website/%.html: $(website-dir)/%.html $(website-dep)
+	mkdir -p "$(@D)"
+	tmpfile=$$(mktemp) && \
+	$(AWK) -f $(website-dir)/incfile.awk $< > "$$tmpfile" && \
+	mv "$$tmpfile" $@
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
