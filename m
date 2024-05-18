Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4931BC25B74
	for <buildroot@archiver.kernel.org>; Sat, 18 May 2024 20:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 008F060764;
	Sat, 18 May 2024 20:25:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0hGhstv8FgH9; Sat, 18 May 2024 20:25:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80A836078B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80A836078B;
	Sat, 18 May 2024 20:25:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9A1081BF3F0
 for <buildroot@lists.busybox.net>; Sat, 18 May 2024 20:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3FEC60674
 for <buildroot@lists.busybox.net>; Sat, 18 May 2024 20:25:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IlJjL2IJrAu7 for <buildroot@lists.busybox.net>;
 Sat, 18 May 2024 20:25:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 349BF60642
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 349BF60642
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 349BF60642
 for <buildroot@buildroot.org>; Sat, 18 May 2024 20:25:11 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-420180b5922so14633165e9.2
 for <buildroot@buildroot.org>; Sat, 18 May 2024 13:25:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716063909; x=1716668709;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LIJKUXtBhDq6PFXOGfVetNLqh5V275NhC4T8YMI/Hxw=;
 b=hHj96dPEW9+EPvnX5bVVhmrdzS9vJR2p+BWPUbXzN0yhEqil0eQgN0NCzMt4l+rOXw
 XbzC7bDO8E30nqch54FhZdNsogE2CBltJ15j299WVnDNJ6p+u8lpc5P+Ey0bR99UYtHn
 k3waPmM4r1fiXcumwE3VSVZ0TUuJgEhrM8AUwZ7Ujd6c8GOZ7cSoujHsgw7lnkTqDB2Y
 qsGCJYFyhrLpNUdhOGdlggRIPK2nRZXLIsSW3EUeKfYUuV+rHcPnEiJYosB3JiA2Hkcu
 oBd7n3dc+vdmHp+VE6E9wOguaQEZeNgaijWWHMkMBk2UGFwukQLk6EEo+yPoaIejVXV/
 RHJA==
X-Gm-Message-State: AOJu0Yypg6P5arqqbmPYma5lLEpUp9X/hE1AJWlNVjXci4JqLWGCfMOe
 y+QU30Eq51uTFJdZsVwnJmpZ/K+PuhdZy7np8ACbrp8QUxt9N/Vm+mi/wQ==
X-Google-Smtp-Source: AGHT+IHwHNhmOOnpnv8YAy5bvuCSbdJndN6/xqaiqRbnMffauHwGakje89w21uQDpkrI0lyHn1WjFA==
X-Received: by 2002:a5d:6b89:0:b0:34d:a159:48e6 with SMTP id
 ffacd0b85a97d-3504a20ac1cmr22977221f8f.0.1716063909212; 
 Sat, 18 May 2024 13:25:09 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b8a76e6sm24981434f8f.62.2024.05.18.13.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 May 2024 13:25:09 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 May 2024 22:25:07 +0200
Message-ID: <9acaf4118aa1e3ba7ad9e0516a78273af7d05d3c.1716063903.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1716063903.git.yann.morin.1998@free.fr>
References: <cover.1716063903.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716063909; x=1716668709; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LIJKUXtBhDq6PFXOGfVetNLqh5V275NhC4T8YMI/Hxw=;
 b=P3no/u1+F3XxJVSB7aA6tQtTWSasKjgUzs2v4qM3u0R5zqoNOl4vhbERMoSsk/nYQI
 aPINMgoc6i2Lm1D97GSja80PzZ+rMdp7b7PLUb17bWhYRaFp/fCgkArMKCX3HqIe18aW
 vqfZtmBUmRFuVQd0Q53qfTvS2qUpW2TZF1dYmIfduUzeG3QmA3Sf+Pof5qBm7H4CsjXA
 4fwVQzcGRNsUlO87/pkpT3RNjku3TKGsKh1hx9MMieLP4OHaXSjgYMMQe0k9tBOtI6vh
 aYTVW85HWRayU4OPmT5KodWlI4pkH1rh3y6ody9+Jhq68BTWaOijANQHzE9BHNVfjqmU
 SoPQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=P3no/u1+
Subject: [Buildroot] [PATCH 1/2] support/download: introduce curl backend
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

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in                     |  4 ++++
 docs/manual/prerequisite.adoc |  1 +
 package/pkg-download.mk       |  1 +
 package/pkg-generic.mk        |  2 ++
 support/download/curl         | 45 +++++++++++++++++++++++++++++++++++
 support/download/dl-wrapper   |  1 +
 6 files changed, 54 insertions(+)
 create mode 100755 support/download/curl

diff --git a/Config.in b/Config.in
index b5a94325c4..534efa4050 100644
--- a/Config.in
+++ b/Config.in
@@ -103,6 +103,10 @@ menu "Build options"
 
 menu "Commands"
 
+config BR2_CURL
+	string "Curl command"
+	default "curl -q --ftp-pasv --retry 3"
+
 config BR2_WGET
 	string "Wget command"
 	default "wget --passive-ftp -nd -t 3"
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
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
