Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2D0C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 14:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9DA341F24;
	Tue,  6 Feb 2024 14:40:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9DA341F24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Plgz5htCssh; Tue,  6 Feb 2024 14:40:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4072541F11;
	Tue,  6 Feb 2024 14:40:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4072541F11
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A25161BF423
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 14:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8760E4059F
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 14:40:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8760E4059F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C2utft5aBHNZ for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 14:40:41 +0000 (UTC)
Received: from iodev.co.uk (iodev.co.uk [46.30.189.100])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17CE040227
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 14:40:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17CE040227
Received: from localhost (unknown [85.119.216.19])
 by iodev.co.uk (Postfix) with ESMTPSA id 64DCD2908E5;
 Tue,  6 Feb 2024 15:40:37 +0100 (CET)
From: Ismael Luceno <ismael@iodev.co.uk>
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 15:40:12 +0100
Message-ID: <20240206144030.18329-1-ismael@iodev.co.uk>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam: Yes
Subject: [Buildroot] [RFC PATCH] docs/website: Add Makefile to pre-generate
 the website
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
 docs/website/Makefile    | 33 +++++++++++++++++++++++++++++++++
 docs/website/incfile.awk | 23 +++++++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 docs/website/Makefile
 create mode 100644 docs/website/incfile.awk

diff --git a/docs/website/Makefile b/docs/website/Makefile
new file mode 100644
index 000000000000..b0a56919c0e7
--- /dev/null
+++ b/docs/website/Makefile
@@ -0,0 +1,33 @@
+.PHONY: all
+all:
+
+# Avoid implicit rules
+MAKEFLAGS += -r
+
+AWK ?= mawk
+
+SRCDIR := ${CURDIR}
+DEPLOYDIR := ${CURDIR}/out
+
+src-pages != find ${SRCDIR} -maxdepth 1 -name \*.html -o -name \*.smu
+dst-pages := ${src-pages:${SRCDIR}/%=${DEPLOYDIR}/%}
+dst-pages := ${dst-pages:.smu=.html}
+
+all: ${dst-pages}
+
+conf-files := ${MAKEFILE_LIST}
+conf-files += $(wildcard ${HOME}/.tidyrc)
+conf-files += ${SRCDIR}/incfile.awk
+
+${DEPLOYDIR}/%.html: ${SRCDIR}/%.html ${conf-files}
+	mkdir -p "${@D}"
+	tmpfile=$$(mktemp) && \
+	${AWK} -f incfile.awk $< > "$$tmpfile" && \
+	{ tidy -q -m -i "$$tmpfile"; :; } && \
+	mv "$$tmpfile" $@
+
+${DEPLOYDIR}/%.html: ${SRCDIR}/%.smu ${conf-files}
+	mkdir -p "${@D}"
+	tmpfile=$$(mktemp) && \
+	smu < $< | ${AWK} -f incfile.awk | tidy -q -m > "$$tmpfile" && \
+	mv "$$tmpfile" $@
diff --git a/docs/website/incfile.awk b/docs/website/incfile.awk
new file mode 100644
index 000000000000..350a88e7b956
--- /dev/null
+++ b/docs/website/incfile.awk
@@ -0,0 +1,23 @@
+BEGIN {
+	FS="\""
+}
+
+{
+	do {
+		if (match($0, /^<!--#include file="([^"]*)" *-->$/)) {
+			file_stack[++file_cur] = $2
+		} else {
+			print
+		}
+		if (file_cur) {
+			e = getline < file_stack[file_cur]
+			if (!e) {
+				--file_cur
+			} else if (e == -1) {
+				printf "%s: read error\n", \
+					file_stack[file_cur] \
+					> "/dev/stderr"
+			}
+		}
+	} while (file_cur)
+}
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
