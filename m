Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08797C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:34:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 864E260F8F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:34:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 864E260F8F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5162483B17;
	Wed,  4 Aug 2021 00:34:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AiXuujD7gs5y; Wed,  4 Aug 2021 00:34:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9027B83A7E;
	Wed,  4 Aug 2021 00:34:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6D9441BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8204140F56
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ueBQSmtcSjGq for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67E2540EE0
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BEC4281F12; Tue,  3 Aug 2021 21:10:17 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 16:46:30 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 00de2a1cced508f930b78049c1212973b16c919e
X-Git-Newrev: 6fbdf51596079b17ef360e942b604237efbcc217
X-Patchwork-Hint: ignore
Message-Id: <20210803211017.BEC4281F12@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Makefile: Parallelize glibc
 locale generation
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=6fbdf51596079b17ef360e942b604237efbcc217
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Parallelizes locale generation based on `BR2_JLEVEL` setting.

Locale generation always runs during the finalize stage and can consume
a significant amount of time. Parallelizing it greatly reduces that time
on multi-core machines.

To parallelize it, we first invoke `localedef` for every locale in
parallel with the `--no-archive` option. This creates the intermediate
locale data instead of writing to the finally archive directly.

Then, we invoke `localedef` again once to create the archive from the
intermediate compiled locale data files.

We have to do it this way because `localedef` does not do any locking
when writing to the archive file, so calling it without `--no-archive`
concurrently could result in a corrupt archive file or an archive file
that is missing some locales.

While we're at it, make two additional improvements:
- Remove locale-archive before adding to it. Otherwise, repeated
  applications of target-finalize will keep on growing the file.
- Sort the locales when creating locale-archive so its contents are
  reproducible.

We use `find` to collect the installed locales rather than LOCALES. This
makes it possible for something else (skeleton, overlay, custom package)
to create and install additional locales and still have them added to
locale-archive.

Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
[Arnout:
 - Remove -j$(PARALLEL_JOBS), it's already part of $(MAKE)
 - Remove HOST_DIR, TARGET_DIR, STAGING_DIR, they're already exported
 - Extend commit message
]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile                          | 25 +++++-------------------
 support/misc/gen-glibc-locales.mk | 41 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+), 20 deletions(-)

diff --git a/Makefile b/Makefile
index 74c238cb20..d3c67c20d4 100644
--- a/Makefile
+++ b/Makefile
@@ -663,32 +663,17 @@ endef
 TARGET_FINALIZE_HOOKS += TOOLCHAIN_ECLIPSE_REGISTER
 endif
 
-# Generate locale data. Basically, we call the localedef program
-# (built by the host-localedef package) for each locale. The input
-# data comes preferably from the toolchain, or if the toolchain does
-# not have them (Linaro toolchains), we use the ones available on the
-# host machine.
+# Generate locale data.
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
 GLIBC_GENERATE_LOCALES = $(call qstrip,$(BR2_GENERATE_LOCALE))
 ifneq ($(GLIBC_GENERATE_LOCALES),)
 PACKAGES += host-localedef
 
 define GENERATE_GLIBC_LOCALES
-	$(Q)mkdir -p $(TARGET_DIR)/usr/lib/locale/
-	$(Q)for locale in $(GLIBC_GENERATE_LOCALES) ; do \
-		inputfile=`echo $${locale} | cut -f1 -d'.'` ; \
-		charmap=`echo $${locale} | cut -f2 -d'.' -s` ; \
-		if test -z "$${charmap}" ; then \
-			charmap="UTF-8" ; \
-		fi ; \
-		echo "Generating locale $${inputfile}.$${charmap}" ; \
-		I18NPATH=$(STAGING_DIR)/usr/share/i18n:/usr/share/i18n \
-		$(HOST_DIR)/bin/localedef \
-			--prefix=$(TARGET_DIR) \
-			--$(call LOWERCASE,$(BR2_ENDIAN))-endian \
-			-i $${inputfile} -f $${charmap} \
-			$${locale} ; \
-	done
+	$(MAKE) -f support/misc/gen-glibc-locales.mk \
+		ENDIAN=$(call LOWERCASE,$(BR2_ENDIAN)) \
+		LOCALES="$(GLIBC_GENERATE_LOCALES)" \
+		Q=$(Q)
 endef
 TARGET_FINALIZE_HOOKS += GENERATE_GLIBC_LOCALES
 endif
diff --git a/support/misc/gen-glibc-locales.mk b/support/misc/gen-glibc-locales.mk
new file mode 100644
index 0000000000..3db1e0dc11
--- /dev/null
+++ b/support/misc/gen-glibc-locales.mk
@@ -0,0 +1,41 @@
+# Generates glibc locale data for target.
+
+inputfile = $(firstword $(subst ., ,$(1)))
+charmap = $(or $(word 2,$(subst ., ,$(1))),UTF-8)
+
+# Packages all the generated locale data into the final archive.
+#
+# We sort the file names to produce consistent output regardless of
+# the `find` outputs order.
+$(TARGET_DIR)/usr/lib/locale/locale-archive: $(LOCALES)
+	$(Q)rm -f $(@)
+	$(Q)find $(TARGET_DIR)/usr/lib/locale/ -maxdepth 1 -mindepth 1 -type d -print0 \
+	| sort -z \
+	| xargs -0 \
+		$(HOST_DIR)/bin/localedef \
+			--prefix=$(TARGET_DIR) \
+			--$(ENDIAN)-endian \
+			--add-to-archive
+
+# Generates locale data for each locale.
+#
+# The input data comes preferably from the toolchain, or if the toolchain
+# does not have them (Linaro toolchains), we use the ones available on the
+# host machine.
+#
+# Uses `localedef`, which is built by the `host-localedef` package.
+$(LOCALES): | $(TARGET_DIR)/usr/lib/locale/
+	$(Q)echo "Generating locale $(@)"
+	$(Q)I18NPATH=$(STAGING_DIR)/usr/share/i18n:/usr/share/i18n \
+	$(HOST_DIR)/bin/localedef \
+		--prefix=$(TARGET_DIR) \
+		--$(ENDIAN)-endian \
+		--no-archive \
+		-i $(call inputfile,$(@)) \
+		-f $(call charmap,$(@)) \
+		$(@)
+
+.PHONY: $(LOCALES)
+
+$(TARGET_DIR)/usr/lib/locale/:
+	$(Q)mkdir -p $(TARGET_DIR)/usr/lib/locale/
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
