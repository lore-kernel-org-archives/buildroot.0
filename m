Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3625C25B74
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 18:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84365400B9;
	Sun,  2 Jun 2024 18:23:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iCAbCUxBMMAv; Sun,  2 Jun 2024 18:23:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AB614051A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8AB614051A;
	Sun,  2 Jun 2024 18:23:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C8101BF4DA
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 18:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68B3082079
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 18:23:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4gkqYokisGyu for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 18:23:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1EAE482077
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EAE482077
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1EAE482077
 for <buildroot@buildroot.org>; Sun,  2 Jun 2024 18:23:10 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-354cd8da8b9so3428546f8f.0
 for <buildroot@buildroot.org>; Sun, 02 Jun 2024 11:23:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717352589; x=1717957389;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=I5qTuOreNjTGObSmOm9g14fSbUS3DLopyzEVELHnbng=;
 b=cwBhRLQeVmFj6uBWpWgNDUg5bBEtIcu5uRGAMAWUBTKkqUD9T+CZsdZVViOCCHYkL5
 icPMQEed+E6WLTLwUqSuqgej236Y7tQ9wKodkB1y4EL/WGxZn72vXTy8DvMA9YchOqDb
 qu6e9Pf9oybGPMkSoRLGSWhInbDBm8uSGN2R61tPWzHLoN2wjhObxgcOgAWnqEq+v/rB
 vmHuyOWW79vwWsEyQjJXqWdjuo4zyV3M0qI3td4jbXIVg+pENL7s+PxuhCx3uRcgYRSc
 31np7/l37jdIVhs0KlelfzDhSIu2YLIj/sD6/0i8m/i2bYOYPv010w8cMx5RmAHABIaE
 wWrA==
X-Gm-Message-State: AOJu0YwmwoTuYYjAUavuD4ZO3TZI4hJy++zbTCemQRJcIjhVNI8kVuTC
 NOVR7GJ/ac1teyEdzRp9sPU3EDxpt4FOlsYGN+OGpUY9Qlcb3uQcWqrrtw==
X-Google-Smtp-Source: AGHT+IFKWSA9s91FhpYW4Qz/A+I1CeSJFBRjJXFuKK9FA4NBn6frqRU7mFt9DbHrqNiO49SPKEHzaA==
X-Received: by 2002:adf:b306:0:b0:35d:ce01:7957 with SMTP id
 ffacd0b85a97d-35e0f32e2a0mr5142241f8f.66.1717352588981; 
 Sun, 02 Jun 2024 11:23:08 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35e52ec4616sm2528488f8f.4.2024.06.02.11.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 11:23:08 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  2 Jun 2024 20:23:07 +0200
Message-ID: <149238f4ea82fd91fc1a880025ab8b38954da518.1717352584.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717352584.git.yann.morin.1998@free.fr>
References: <cover.1717352584.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717352589; x=1717957389; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I5qTuOreNjTGObSmOm9g14fSbUS3DLopyzEVELHnbng=;
 b=SJjexu5nu4g3lW4qj2CnzFly/oeH/XuKhcsa7nYRJa5beUUY3a8mGjdN6Cb/a2j/R6
 Dimu0ouQgvS/dpqprhlRpRrGluAWsfpGmgxOr6Fk1gdy8xiCadMss1lP+H6+CCAQr+Nn
 PyJHx/P4EzOSJkmCYpoV4ttv5uTA75c7ctobTfInqmI28EVKzvfEj4RX8UIgdbQnpDCE
 AmzxLuKhN20BikwUpO8+Rco2HI5n3CdbzAQxKTxC9N0Tbjfkt7mCpi2VZN+Ku6B8pkQ6
 tFzEz82Z5tPBroNKGJxOar94gEeUIOeMHEnIX8zEyjXWdHmhNP1kAa+6CeOzkDBDduR5
 /7KQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SJjexu5n
Subject: [Buildroot] [PATCH 1/2 v2] support/download: introduce curl backend
 for FTP transfers
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Recent versions of wget, starting with wget 2.0, aka wget2 thereafter,
no longer support FTP (nor FTPS, aka FTP-over-SSL). wget2 is packaged in
Fedora 40, recently released; F40 does not even have the old wget
available in its repository anymore.

Introduce cURL as a download backend, that we use for FTP and FPTS
protocols.

Note that the -q flag does not means being quiet; it means that a curlrc
file should not be parsed. The long option is --disable, which meaning
is not much more obivous than the short -q. It also has to be the first
option on the command line.

Since we no longer use WGET to retrieve FTP-hosted files, we can drop
the --passive-ftp option, which is what was causing wget2 to abort in
error.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

---
Notes: the pre-existing shellcheck errors in the dl-wrapper were not
fixed; this is not urgent, so is left for another series.

---
Changes v1 ->v2;
  - drop --passive-ftp for BR2_WGET
---
 Config.in                     |  6 ++++-
 docs/manual/prerequisite.adoc |  1 +
 package/pkg-download.mk       |  1 +
 package/pkg-generic.mk        |  2 ++
 support/download/curl         | 45 +++++++++++++++++++++++++++++++++++
 support/download/dl-wrapper   |  1 +
 utils/genrandconfig           |  2 +-
 7 files changed, 56 insertions(+), 2 deletions(-)
 create mode 100755 support/download/curl

diff --git a/Config.in b/Config.in
index b5a94325c4..e0257ba3e8 100644
--- a/Config.in
+++ b/Config.in
@@ -103,9 +103,13 @@ menu "Build options"
 
 menu "Commands"
 
+config BR2_CURL
+	string "Curl command"
+	default "curl -q --ftp-pasv --retry 3"
+
 config BR2_WGET
 	string "Wget command"
-	default "wget --passive-ftp -nd -t 3"
+	default "wget -nd -t 3"
 
 config BR2_SVN
 	string "Subversion (svn) command"
diff --git a/docs/manual/prerequisite.adoc b/docs/manual/prerequisite.adoc
index 262a5153f5..846a7482ac 100644
--- a/docs/manual/prerequisite.adoc
+++ b/docs/manual/prerequisite.adoc
@@ -75,6 +75,7 @@ packages using any of these methods, you will need to install the
 corresponding tool on the host system:
 +
 ** +bazaar+
+** +curl+
 ** +cvs+
 ** +git+
 ** +mercurial+
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 4be45c9d12..455443c164 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -8,6 +8,7 @@
 ################################################################################
 
 # Download method commands
+export CURL := $(call qstrip,$(BR2_CURL))
 export WGET := $(call qstrip,$(BR2_WGET))
 export SVN := $(call qstrip,$(BR2_SVN))
 export CVS := $(call qstrip,$(BR2_CVS))
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index a2749320c3..e1c16b7343 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1253,6 +1253,8 @@ else ifeq ($$($(2)_SITE_METHOD),hg)
 DL_TOOLS_DEPENDENCIES += hg
 else ifeq ($$($(2)_SITE_METHOD),cvs)
 DL_TOOLS_DEPENDENCIES += cvs
+else ifneq ($(filter ftp ftps,$$($(2)_SITE_METHOD)),)
+DL_TOOLS_DEPENDENCIES += curl
 endif # SITE_METHOD
 
 # cargo/go vendoring (may) need git
diff --git a/support/download/curl b/support/download/curl
new file mode 100755
index 0000000000..bea4485a6c
--- /dev/null
+++ b/support/download/curl
@@ -0,0 +1,45 @@
+#!/usr/bin/env bash
+
+# We want to catch any unexpected failure, and exit immediately
+set -e
+
+# Download helper for curl, to be called from the download wrapper script
+#
+# Options:
+#   -q          Be quiet.
+#   -o FILE     Save into file FILE.
+#   -f FILENAME The filename of the tarball to get at URL
+#   -u URL      Download file at URL.
+#
+# Environment:
+#   CURL     : the curl command to call
+
+quiet=
+while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
+    case "${OPT}" in
+    q)  quiet=-s;;
+    o)  output="${OPTARG}";;
+    f)  filename="${OPTARG}";;
+    u)  url="${OPTARG}";;
+    :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
+    \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
+    esac
+done
+
+shift $((OPTIND-1)) # Get rid of our options
+
+# Caller needs to single-quote its arguments to prevent them from
+# being expanded a second time (in case there are spaces in them)
+_curl() {
+    if [ -z "${quiet}" ]; then
+        printf '%s ' "${CURL}" "${@}"; printf '\n'
+    fi
+    _plain_curl "$@"
+}
+# Note: please keep command below aligned with what is printed above
+_plain_curl() {
+    # shellcheck disable=SC2086  # We want splitting
+    eval ${CURL} "${@}"
+}
+
+_curl ${quiet} "${@}" --output "'${output}'" "'${url}/${filename}'"
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 35428faeef..069b2c1c21 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -91,6 +91,7 @@ main() {
         backend="${backend_urlencode%|*}"
         case "${backend}" in
             git|svn|cvs|bzr|file|scp|hg|sftp) ;;
+            ftp|ftps) backend="curl" ;;
             *) backend="wget" ;;
         esac
         uri=${uri#*+}
diff --git a/utils/genrandconfig b/utils/genrandconfig
index b838dda34d..b7d277105f 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -688,7 +688,7 @@ async def gen_config(args):
         configlines += minimalf.readlines()
 
     # Allow hosts with old certificates to download over https
-    configlines.append("BR2_WGET=\"wget --passive-ftp -nd -t 3 --no-check-certificate\"\n")
+    configlines.append("BR2_WGET=\"wget -nd -t 3 --no-check-certificate\"\n")
 
     # Per-package folder
     if randint(0, 15) == 0:
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
