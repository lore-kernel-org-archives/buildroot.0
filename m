Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12891C02198
	for <buildroot@archiver.kernel.org>; Wed, 12 Feb 2025 19:10:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E68CC84898;
	Wed, 12 Feb 2025 19:10:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t6eywPOZH490; Wed, 12 Feb 2025 19:10:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D14B8486C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D14B8486C;
	Wed, 12 Feb 2025 19:10:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3107D194
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 19:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2044460840
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 19:10:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JAD_D7k0MwXu for <buildroot@buildroot.org>;
 Wed, 12 Feb 2025 19:10:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8206761163
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8206761163
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8206761163
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 19:10:28 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aaee2c5ee6eso18923266b.1
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 11:10:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739387426; x=1739992226;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VnjypLKpZpIBrqXeBOsIp3BQFHSXCKQYIyP3nLm43zs=;
 b=IkjLVC23ubGwyFvag6JVUsrTu316f/lFUACBo0MKDTDSz1qzOMk4tFeJNGSxaYQQeO
 a47x+Uk2U8HK8oGuTDmHlIq5+rPB9h+4o3G8Bo5hX3iDdHTONjqzLNmPntmmVYYyecxd
 zmwIfu7ssDrsgAKzh7k9f2TopIGaZnqAsVmpM3X7OZ2qHjQhs9BRVp+xt3MyoCpsB99Y
 cHDUG3/vVGlutTht9rnFistEID20+58H4SBrbJc2eaiwtDQKVpo/9j/cU+UQH7AL4TiS
 hz6IdLYi6wfDmehtd7Vq4KPOzrMQlgvWqnnoaSJqbHI/srVFISHnRuyXy7z9gaDhQiEP
 jeOw==
X-Gm-Message-State: AOJu0YwZaXgqexDRCZUOQy9U11+dJyDfvXhftBSnDa65ahc9LgY6zoV5
 CLCcTQvKQ4ZM88JlX5xn8dPU1k015Uu93qPMXnjufOuRlEC6BLtkW1xWqJZeMEDLf31aBFvsfJq
 B
X-Gm-Gg: ASbGncvhdAblHenL3LjOLFE+oTWHRHPvQSRAyh9JoqN6ARY+DPITaE/xIqKbFDHA7x6
 Y7RBRIS6q6xbrkubk39fjiZkJgAw0lZVsXKELoVTRvBoiaAXRMMsMEHLysbwA4MtxAdKX/HfwEl
 SsGcIPYsLObsiz9QxmMCRYLhEP8nRRSVocRLbkcEM5Nig+/P2RPWzycffXEy+tHSzYpDWFGUhfc
 JysVqBc+JBubOFQnT9MwA19L7E/hglIG7muS428hgZhDw1eiMUUcevxGiT+n507pOKSSSLpWUDq
 oboabGAX1Tg5j67p9o4es0BZPWEd2UQamRX4ZzdYuz/54hPkvQ7ORaqMpo7twtht8zX0TAd9j/7
 FPMaXUnDr2Q==
X-Google-Smtp-Source: AGHT+IEt0cSTdgnMIzfJQBsqtBBJeCvSORYDXXfh35ERfouwadRfc05gQvF3sj3njlzcUgOZEt9TjQ==
X-Received: by 2002:a17:907:2d8b:b0:ab7:f2da:8127 with SMTP id
 a640c23a62f3a-ab7f347397dmr422797166b.36.1739387425910; 
 Wed, 12 Feb 2025 11:10:25 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([176.200.206.123]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7e4936eccsm361634366b.101.2025.02.12.11.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 11:10:24 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 12 Feb 2025 20:10:15 +0100
Message-ID: <20250212191015.3413693-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1739387426; x=1739992226;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VnjypLKpZpIBrqXeBOsIp3BQFHSXCKQYIyP3nLm43zs=;
 b=EAQzBAlugcy22BR/ysJ764sSIAq8/yPRU1zcLmcYeVL+0xX9M3F4T37eI3D4CgM/Ow
 xlVar5ONfSa5volfB5QTVZSw9lxQpIkAxgcWOcO2f1MI+gboX7R+ak9NmQ7EC/1nWcuF
 Um7nJkg2mZ88Gbu3nk4lGC/j8PFmSOUd5kOIY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=EAQzBAlu
Subject: [Buildroot] [RFC PATCH 1/1] package/pkg-download: don't export the
 download command variables
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, Julien Olivain <ju.o@free.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Exporting the download variables can cause unfortunate name clashes, as
occurred with the SCP variable used by Binman for compiling U-Boot [1].
The patch removes the global export of the variables containing the
commands used for downloading the packages and passes them as
parameters, using the new -C option, to the dl-wrapper, which in turn
passes the appropriate download command to the specific script under the
support/download directory.

[1] https://lore.kernel.org/buildroot/a023971c7c8bfa4826a9a8721500c7ff@free.fr/T/
Cc: Julien Olivain <ju.o@free.fr>
Suggested-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/pkg-download.mk     | 27 ++++++++++++++++++---------
 support/download/bzr        |  5 ++---
 support/download/curl       |  5 ++---
 support/download/cvs        |  5 ++---
 support/download/dl-wrapper | 27 +++++++++++++++++++++++----
 support/download/git        |  5 ++---
 support/download/hg         |  5 ++---
 support/download/scp        |  5 ++---
 support/download/sftp       |  5 ++---
 support/download/svn        |  5 ++---
 support/download/wget       |  5 ++---
 11 files changed, 59 insertions(+), 40 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index ca01ff67a59e..580cc01cf882 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -8,15 +8,15 @@
 ################################################################################
 
 # Download method commands
-export CURL := $(call qstrip,$(BR2_CURL))
-export WGET := $(call qstrip,$(BR2_WGET))
-export SVN := $(call qstrip,$(BR2_SVN))
-export CVS := $(call qstrip,$(BR2_CVS))
-export BZR := $(call qstrip,$(BR2_BZR))
-export GIT := $(call qstrip,$(BR2_GIT))
-export HG := $(call qstrip,$(BR2_HG))
-export SCP := $(call qstrip,$(BR2_SCP))
-export SFTP := $(call qstrip,$(BR2_SFTP))
+CURL := $(call qstrip,$(BR2_CURL))
+WGET := $(call qstrip,$(BR2_WGET))
+SVN := $(call qstrip,$(BR2_SVN))
+CVS := $(call qstrip,$(BR2_CVS))
+BZR := $(call qstrip,$(BR2_BZR))
+GIT := $(call qstrip,$(BR2_GIT))
+HG := $(call qstrip,$(BR2_HG))
+SCP := $(call qstrip,$(BR2_SCP))
+SFTP := $(call qstrip,$(BR2_SFTP))
 export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 
 # Version of the format of the archives we generate in the corresponding
@@ -132,6 +132,15 @@ define DOWNLOAD
 		$(if $($(PKG)_GIT_SUBMODULES),-r) \
 		$(if $($(PKG)_GIT_LFS),-l) \
 		$(foreach uri,$(call DOWNLOAD_URIS,$(1),$(PKG)),-u $(uri)) \
+		-C '$(CURL)' \
+		-C '$(WGET)' \
+		-C '$(SVN)' \
+		-C '$(CVS)' \
+		-C '$(BZR)' \
+		-C '$(GIT)' \
+		-C '$(HG)' \
+		-C '$(SCP)' \
+		-C '$(SFTP)' \
 		$(2) \
 		$(QUIET) \
 		-- \
diff --git a/support/download/bzr b/support/download/bzr
index 6f77bc286efb..2472e30ff3ab 100755
--- a/support/download/bzr
+++ b/support/download/bzr
@@ -11,9 +11,7 @@ set -e
 #   -u URI      Clone from repository at URI.
 #   -c CSET     Use changeset (or revision) CSET.
 #   -n NAME     Use basename NAME.
-#
-# Environment:
-#   BZR      : the bzr command to call
+#   -C          The bzr command to call.
 
 
 quiet=
@@ -24,6 +22,7 @@ while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     u)  uri="${OPTARG}";;
     c)  cset="${OPTARG}";;
     n)  basename="${OPTARG}";;
+    C)  BZR="${OPTARG}";;
     :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
     \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
     esac
diff --git a/support/download/curl b/support/download/curl
index 2124fe7cad95..65e2f976f790 100755
--- a/support/download/curl
+++ b/support/download/curl
@@ -10,9 +10,7 @@ set -e
 #   -o FILE     Save into file FILE.
 #   -f FILENAME The filename of the tarball to get at URL
 #   -u URL      Download file at URL.
-#
-# Environment:
-#   CURL     : the curl command to call
+#   -C          The curl command to call.
 
 quiet=
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
@@ -21,6 +19,7 @@ while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     o)  output="${OPTARG}";;
     f)  filename="${OPTARG}";;
     u)  url="${OPTARG}";;
+    C)  CURL="${OPTARG}";;
     :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
     \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
     esac
diff --git a/support/download/cvs b/support/download/cvs
index a52e543e44c2..4e6ab8138997 100755
--- a/support/download/cvs
+++ b/support/download/cvs
@@ -12,9 +12,7 @@ set -e
 #   -c REV      Use revision REV.
 #   -N RAWNAME  Use rawname (aka module name) RAWNAME.
 #   -n NAME     Use basename NAME.
-#
-# Environment:
-#   CVS      : the cvs command to call
+#   -C          The cvs command to call.
 
 quiet=
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
@@ -25,6 +23,7 @@ while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     c)  rev="${OPTARG}";;
     N)  rawname="${OPTARG}";;
     n)  basename="${OPTARG}";;
+    C)  CVS="${OPTARG}";;
     :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
     \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
     esac
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 5445aad5a76a..f63d14ebf65a 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -20,17 +20,34 @@ set -e
 # shellcheck source=helpers source-path=SCRIPTDIR
 . "${0%/*}/helpers"
 
-export BR_BACKEND_DL_GETOPTS=":hc:d:o:n:N:H:lru:qf:e"
+export BR_BACKEND_DL_GETOPTS=":hc:d:o:n:C:N:H:lru:qf:e"
+
+dl_cmd() {
+    local match_cmd="$1"
+    shift
+    local cmds=("$@")
+
+    for cmd in "${cmds[@]}"; do
+        _cmd=$(echo "$cmd" | awk '{print $1}')
+        if [[ "$_cmd" == "$match_cmd" ]]; then
+            echo "$cmd"
+            return 0
+        fi
+    done
+
+    return 1
+}
 
 main() {
     local OPT OPTARG
-    local backend output large_file recurse quiet rc
-    local -a uris hfiles backend_opts post_process_opts
+    local backend backend_dl_cmd output large_file recurse quiet rc
+    local -a uris hfiles backend_opts post_process_opts dl_cmds
 
     # Parse our options; anything after '--' is for the backend
-    while getopts ":c:d:D:o:n:N:H:lrf:u:qp:P:" OPT; do
+    while getopts ":c:d:D:o:n:C:N:H:lrf:u:qp:P:" OPT; do
         case "${OPT}" in
         c)  cset="${OPTARG}";;
+        C)  dl_cmds+=( "${OPTARG}" );;
         d)  dl_dir="${OPTARG}";;
         D)  old_dl_dir="${OPTARG}";;
         o)  output="${OPTARG}";;
@@ -101,6 +118,7 @@ main() {
         esac
         uri=${uri#*+}
 
+        backend_dl_cmd=$(dl_cmd "${backend}" "${dl_cmds[@]}")
         urlencode=${backend_urlencode#*|}
         # urlencode must be "urlencode"
         [ "${urlencode}" != "urlencode" ] && urlencode=""
@@ -134,6 +152,7 @@ main() {
         # cleanup and exit.
         if ! "${OLDPWD}/support/download/${backend}" \
                 -c "${cset}" \
+                -C "${backend_dl_cmd}" \
                 -d "${dl_dir}" \
                 -n "${raw_base_name}" \
                 -N "${base_name}" \
diff --git a/support/download/git b/support/download/git
index 8123bc31531c..59e12cba8855 100755
--- a/support/download/git
+++ b/support/download/git
@@ -17,9 +17,7 @@ set -e
 #   -u URI      Clone from repository at URI.
 #   -c CSET     Use changeset CSET.
 #   -n NAME     Use basename NAME.
-#
-# Environment:
-#   GIT      : the git command to call
+#   -C          The git command to call.
 
 # shellcheck disable=SC1090 # Only provides mk_tar_gz()
 # shellcheck disable=SC1091
@@ -65,6 +63,7 @@ while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     c)  cset="${OPTARG}";;
     d)  dl_dir="${OPTARG}";;
     n)  basename="${OPTARG}";;
+    C)  GIT="${OPTARG}";;
     :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
     \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
     esac
diff --git a/support/download/hg b/support/download/hg
index 768a27e06fd0..bc133ac2c2ff 100755
--- a/support/download/hg
+++ b/support/download/hg
@@ -11,9 +11,7 @@ set -e
 #   -u URI      Clone from repository at URI.
 #   -c CSET     Use changeset (or revision) CSET.
 #   -n NAME     Use basename NAME.
-#
-# Environment:
-#   HG       : the hg command to call
+#   -C          The hg command to call.
 
 quiet=
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
@@ -23,6 +21,7 @@ while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     u)  uri="${OPTARG}";;
     c)  cset="${OPTARG}";;
     n)  basename="${OPTARG}";;
+    C)  HG="${OPTARG}";;
     :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
     \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
     esac
diff --git a/support/download/scp b/support/download/scp
index 14e768b601d0..ac88ea9e6285 100755
--- a/support/download/scp
+++ b/support/download/scp
@@ -10,9 +10,7 @@ set -e
 #   -o FILE     Copy to local file FILE.
 #   -f FILE     Copy from remote file FILE.
 #   -u URI      Download file at URI.
-#
-# Environment:
-#   SCP       : the scp command to call
+#   -C          The scp command to call.
 
 quiet=
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
@@ -21,6 +19,7 @@ while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     o)  output="${OPTARG}";;
     f)  filename="${OPTARG}";;
     u)  uri="${OPTARG}";;
+    C)  SCP="${OPTARG}";;
     :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
     \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
     esac
diff --git a/support/download/sftp b/support/download/sftp
index 0a44be7e618f..3bddc115fc64 100755
--- a/support/download/sftp
+++ b/support/download/sftp
@@ -10,9 +10,7 @@ set -e
 #   -o FILE     Copy to local file FILE.
 #   -f FILE     Copy from remote file FILE.
 #   -u URI      Download file at URI.
-#
-# Environment:
-#   SFTP      : the sftp command to call
+#   -C          The sftp command to call.
 
 quiet=
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
@@ -21,6 +19,7 @@ while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     o)  output="${OPTARG}";;
     f)  filename="${OPTARG}";;
     u)  uri="${OPTARG}";;
+    C)  SFTP="${OPTARG}";;
     :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
     \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
     esac
diff --git a/support/download/svn b/support/download/svn
index ff33f1fa39af..829e6bb6f226 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -17,9 +17,7 @@ set -e
 #   -c REV      Use revision REV.
 #   -n NAME     Use basename NAME.
 #   -r          Recursive, i.e. use externals
-#
-# Environment:
-#   SVN      : the svn command to call
+#   -C          The svn command to call.
 
 # shellcheck disable=SC1090 # Only provides mk_tar_gz()
 # shellcheck disable=SC1091
@@ -35,6 +33,7 @@ while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     c)  rev="${OPTARG}";;
     n)  basename="${OPTARG}";;
     r)  externals=;;
+    C)  SVN="${OPTARG}";;
     :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
     \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
     esac
diff --git a/support/download/wget b/support/download/wget
index 68bd0b13c870..be10e123410f 100755
--- a/support/download/wget
+++ b/support/download/wget
@@ -11,9 +11,7 @@ set -e
 #   -f FILENAME The filename of the tarball to get at URL
 #   -u URL      Download file at URL.
 #   -e ENCODE   Tell wget to urlencode the filename passed to it
-#
-# Environment:
-#   WGET     : the wget command to call
+#   -C          The wget command to call.
 
 quiet=
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
@@ -23,6 +21,7 @@ while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     f)  filename="${OPTARG}";;
     u)  url="${OPTARG}";;
     e)  encode="-e";;
+    C)  WGET="${OPTARG}";;
     :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
     \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
     esac
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
