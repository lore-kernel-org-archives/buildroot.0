Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7387DC36002
	for <buildroot@archiver.kernel.org>; Fri, 21 Mar 2025 13:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 217E88405A;
	Fri, 21 Mar 2025 13:39:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kHa1GFdPS9xY; Fri, 21 Mar 2025 13:39:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F9E682021
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F9E682021;
	Fri, 21 Mar 2025 13:39:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F59A1A4
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 13:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 361AE60821
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 13:39:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8BlnZ9srm9zU for <buildroot@buildroot.org>;
 Fri, 21 Mar 2025 13:39:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.123;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E23E1606E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E23E1606E6
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.123])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E23E1606E6
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 13:39:23 +0000 (UTC)
X-CSE-ConnectionGUID: rTfwkOh9TVyFqKp8aUb7DA==
X-CSE-MsgGUID: 08TKXYqhSbCy33Vc3ghgjQ==
Received: from unknown (HELO opfedv1rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 14:32:13 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 21 Mar 2025 14:32:13 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Fri, 21 Mar 2025 14:32:11 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 21 Mar 2025 14:32:11 +0100
X-CSE-ConnectionGUID: g9t6mWg+SxWqYsHCA2IHhA==
X-CSE-MsgGUID: Xfvf3xgtQyeo1FbXQnn6MQ==
X-IronPort-AV: E=Sophos;i="6.14,264,1736809200"; d="scan'208";a="270099554"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Christian Stewart <christian@aperture.us>
Date: Fri, 21 Mar 2025 14:32:08 +0100
Message-ID: <45bf4abdbbb4ff9d87b4ac7d7eebf687e723e7c4.1742563913.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1742563913.git.yann.morin@orange.com>
References: <cover.1742563913.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX207.corporate.adroot.infra.ftgroup (10.115.27.8)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1742564364; x=1774100364;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eh+r9bFknbnkLikbVXx/0ZqnZe5+evWxHiEInmtMK1Q=;
 b=rbrIt059gjqHxuTx5PAVztUy3NOnhdIj+5JyGbjUhHVTTo2+In/Y9s/Z
 h5HedM9vCX3eTHNu6wZzZp1n96nAPfxpAPdwK8lEISuZSROI5q3hSjE4y
 mkK993Jw1F+KBaFqCeBOQ1k2c6aHTNCPkgZ51wosslXOUUmpZ2pui/wEX
 cPts+KtPLuPaX7A4EWJkCw0C4vFq3TffbqXhEdZjKD0NiZy4zgabEJ8b3
 3yDViQXSgZtfwr8YZLCIML1EXMrut+VaeKtdsUjXt7Y7yUCbq1q/ARR3o
 ee5POigR2CCItMYcvVwlQ1C4X+fLn9QBgKt0SS/S5Y7uWo2jb71Q9dpNO
 A==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=rbrIt059
Subject: [Buildroot] [PATCH 1/4] package/pkg-golang: support _SUBDIR
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Some packages have their actual source tree in a sub-directory (even if
that is the only source in the repository); this is the case for example
with the Amazon ECR credential helper (to be packaged in a follow up
commit):
    https://github.com/awslabs/amazon-ecr-credential-helper

Do the build in _SUBDIR, and also do the vendoring in there.

We don't need the build to generate executables inside _SUBDIR, so we
just keep using $(@D)/bin as a place to generate them (and install them
from).

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Christian Stewart <christian@aperture.us>
---
 package/pkg-golang.mk            | 13 +++++++++----
 support/download/go-post-process |  5 +++--
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index bdf8de4d66..a4e8bd30cc 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -79,8 +79,8 @@ $(2)_GOMOD ?= $$($(2)_SRC_DOMAIN)/$$($(2)_SRC_VENDOR)/$$($(2)_SRC_SOFTWARE)
 # Generate a go.mod file if it doesn't exist. Note: Go is configured
 # to use the "vendor" dir and not make network calls.
 define $(2)_GEN_GOMOD
-	if [ ! -f $$(@D)/go.mod ]; then \
-		printf "module $$($(2)_GOMOD)\n" > $$(@D)/go.mod; \
+	if [ ! -f $$(@D)/$$($(2)_SUBDIR)/go.mod ]; then \
+		printf "module $$($(2)_GOMOD)\n" > $$(@D)/$$($(2)_SUBDIR)/go.mod; \
 	fi
 endef
 $(2)_POST_PATCH_HOOKS += $(2)_GEN_GOMOD
@@ -91,6 +91,11 @@ $(2)_DL_ENV += \
 	GOPROXY=direct \
 	$$($(2)_GO_ENV)
 
+# If building in a sub directory, do the vendoring in there
+ifneq ($$($(2)_SUBDIR),)
+$(2)_DOWNLOAD_POST_PROCESS_OPTS += -s$$($(2)_SUBDIR)
+endif
+
 # Because we append vendored info, we can't rely on the values being empty
 # once we eventually get into the generic-package infra. So, we duplicate
 # the heuristics here
@@ -135,7 +140,7 @@ endif
 # Build package for target
 define $(2)_BUILD_CMDS
 	$$(foreach d,$$($(2)_BUILD_TARGETS),\
-		cd $$(@D); \
+		cd $$(@D)/$$($(2)_SUBDIR); \
 		$$(HOST_GO_TARGET_ENV) \
 			$$($(2)_GO_ENV) \
 			$$(GO_BIN) build -v $$($(2)_BUILD_OPTS) \
@@ -147,7 +152,7 @@ else
 # Build package for host
 define $(2)_BUILD_CMDS
 	$$(foreach d,$$($(2)_BUILD_TARGETS),\
-		cd $$(@D); \
+		cd $$(@D)/$$($(2)_SUBDIR); \
 		$$(HOST_GO_HOST_ENV) \
 			$$($(2)_GO_ENV) \
 			$$(GO_BIN) build -v $$($(2)_BUILD_OPTS) \
diff --git a/support/download/go-post-process b/support/download/go-post-process
index ef96a76948..edc23ec564 100755
--- a/support/download/go-post-process
+++ b/support/download/go-post-process
@@ -5,10 +5,11 @@ set -e
 . "${0%/*}/helpers"
 
 # Parse our options
-while getopts "n:o:" OPT; do
+while getopts "n:o:s:" OPT; do
     case "${OPT}" in
     o)  output="${OPTARG}";;
     n)  base_name="${OPTARG}";;
+    s)  subdir="${OPTARG}";;
     :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
     \?) error "unknown option '%s'\n" "${OPTARG}";;
     esac
@@ -22,7 +23,7 @@ fi
 post_process_unpack "${base_name}" "${output}"
 
 # Do the Go vendoring
-pushd "${base_name}" > /dev/null
+pushd "${base_name}/${subdir}" > /dev/null
 
 if [ ! -f go.mod ]; then
     echo "ERROR: no vendor/ folder and no go.mod, aborting"
-- 
2.34.1

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
