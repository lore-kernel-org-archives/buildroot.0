Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D53DC433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 21:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFF7481BCB;
	Thu,  6 Jan 2022 21:07:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3iUcoMb093Tn; Thu,  6 Jan 2022 21:07:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2967881947;
	Thu,  6 Jan 2022 21:07:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4711B1BF38A
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:07:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42A2E81947
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:07:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FvjLOMCiGI33 for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 21:07:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 51D4581458
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 21:07:41 +0000 (UTC)
Received: from relay10.mail.gandi.net (unknown [217.70.178.230])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 0B6AACC4C3
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 21:00:24 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 155B224000A;
 Thu,  6 Jan 2022 21:00:17 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>,
 Christian Stewart <christian@paral.in>,
 Buildroot List <buildroot@buildroot.org>,
 Matt Weber <Matthew.Weber@rockwellcollins.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Thu,  6 Jan 2022 21:59:52 +0100
Message-Id: <20220106210000.397694-5-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220106210000.397694-1-thomas.petazzoni@bootlin.com>
References: <20220106210000.397694-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 04/11] package/pkg-golang.mk: implement Go
 vendoring support
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
Cc: Patrick Havelange <patrick.havelange@essensium.com>,
 Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit introduces the download post-process script
support/download/go-post-process, and hooks it into the Go package
infrastructure.

The -modcacherw flag is added to ensure that the Go cache is
read/write, and can be deleted properly upon "make clean".

The <pkg>_LICENSE variable of golang packages is expanded with ",
vendored dependencies licenses probably not listed" as currently for
all packages, the licenses of the vendored dependencies are not taken
into account.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-golang.mk            | 13 +++++++++++-
 support/download/go-post-process | 35 ++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100755 support/download/go-post-process

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index d07242310d..35bcb1673b 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -42,12 +42,13 @@ define inner-golang-package
 
 $(2)_BUILD_OPTS += \
 	-ldflags "$$($(2)_LDFLAGS)" \
+	-modcacherw \
 	-tags "$$($(2)_TAGS)" \
 	-trimpath \
 	-p $(PARALLEL_JOBS)
 
 # Target packages need the Go compiler on the host.
-$(2)_DEPENDENCIES += host-go
+$(2)_DOWNLOAD_DEPENDENCIES += host-go
 
 $(2)_BUILD_TARGETS ?= .
 
@@ -81,6 +82,16 @@ define $(2)_GEN_GOMOD
 endef
 $(2)_POST_PATCH_HOOKS += $(2)_GEN_GOMOD
 
+$(2)_DOWNLOAD_POST_PROCESS = go
+$(2)_DL_ENV = \
+	$(HOST_GO_COMMON_ENV) \
+	GOPROXY=direct \
+	BR_GOMOD=$$($(2)_GOMOD)
+
+# Due to vendoring, it is pretty likely that not all licenses are
+# listed in <pkg>_LICENSE.
+$(2)_LICENSE += , vendored dependencies licenses probably not listed
+
 # Build step. Only define it if not already defined by the package .mk
 # file.
 ifndef $(2)_BUILD_CMDS
diff --git a/support/download/go-post-process b/support/download/go-post-process
new file mode 100755
index 0000000000..a6e74e6221
--- /dev/null
+++ b/support/download/go-post-process
@@ -0,0 +1,35 @@
+#!/usr/bin/env bash
+
+set -e
+
+. "${0%/*}/helpers"
+
+# Parse our options
+while getopts "n:o:" OPT; do
+    case "${OPT}" in
+    o)  output="${OPTARG}";;
+    n)  base_name="${OPTARG}";;
+    :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
+    \?) error "unknown option '%s'\n" "${OPTARG}";;
+    esac
+done
+
+# Already vendored tarball, nothing to do
+if tar tf ${output} | grep -q "^[^/]*/vendor" ; then
+    exit 0
+fi
+
+post_process_unpack ${base_name} ${output}
+
+# Do the Go vendoring
+pushd ${base_name} > /dev/null
+
+# Generate go.mod if it doesn't exist
+if [ ! -f go.mod ] && [ -n "${BR_GOMOD}" ]; then
+    printf "module ${BR_GOMOD}\n" > go.mod
+fi
+
+go mod vendor -v -modcacherw
+popd > /dev/null
+
+post_process_repack $(pwd) ${base_name} ${output}
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
