Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D2FC4332F
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 17:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 114D760C1C;
	Sat, 15 Oct 2022 17:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 114D760C1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bhyhuhsg_8G5; Sat, 15 Oct 2022 17:09:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CB86606FF;
	Sat, 15 Oct 2022 17:09:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CB86606FF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 007D71BF3D6
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 17:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE278402C1
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 17:09:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE278402C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wchs0881xlHx for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 17:09:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F82E401BB
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F82E401BB
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 17:09:12 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id q196so6182540iod.8
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 10:09:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wN6KjKFz8BiwdstRps9dix13sNX6zogdKP5bVStOuRI=;
 b=iWcGjteXbQoWmoqTw1MlpDMSqojpJldPhmP9QfU4DbeZEfo9c5Kdt2qbiepGma7xFI
 XewUD8AijDlL4MXE0X6/zWIw3ReuaiGnejr/QJaE9F/srm/mdsOVU/YSUc+dSWnVRSIZ
 AvaKCb1UBWSZIlXdojS8QGADDuGP3txZ0eN6uOII4P3QNhjvO+bdN0mpkXhIpPw9Zww/
 IrH3XyVwoUUQ6XGCA/JDLttv/J1cuFQoM8kzZ9C9yn1pOTEgFR2K+rOhzsd7427Pldfm
 QmoSx4QbZ6yOa/5P23NXFphZ8u2s3haahhCJWmLfMl45oIdDoo2wTbxYW5ftKS8+PE6C
 QUSg==
X-Gm-Message-State: ACrzQf1z9QPrfCKWJrAVQ4ouBkiMLw782t3aW9vyOvKBtOHkWdklaqB2
 fdbp+LIV1AXkUwnctCQuCtWT1ICVhTuPMQ==
X-Google-Smtp-Source: AMsMyM4NacH5jthBEuWIvoP1KOolyuUEeqMrIET3dzFtKqCdNE8NuqquWL3JdYgdqB/QtAHiDNTrqg==
X-Received: by 2002:a05:6602:92:b0:6a3:4c7c:7ab2 with SMTP id
 h18-20020a056602009200b006a34c7c7ab2mr1451922iob.57.1665853751139; 
 Sat, 15 Oct 2022 10:09:11 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 y21-20020a056602165500b006a92d813842sm2177855iow.3.2022.10.15.10.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Oct 2022 10:09:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 11:09:08 -0600
Message-Id: <20221015170908.1494436-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wN6KjKFz8BiwdstRps9dix13sNX6zogdKP5bVStOuRI=;
 b=qfpfAfV0/CME+B7fjJEDDDx8/phTOAnh51aAhNvRyw/Aex4aTHBY+J4Gr4o4cTWYzL
 Apv8tqJM1O265CnEBfeYC0TyvdwN3/AAw4rwRRQUXhJfs7uTQxO0W+XXR8fD4yjIzOUI
 eKhGiMjDQFxCjkqkpscebjA/S/0bPJqrVDOLW3Nd+hgWO0z8CLSQsVJUcUNaHX4+rEjL
 WeTdWP6J+dQx8VkqdbaRGhgByxHu03qd+nqocapRzaul0W9b8UEKLxWw3dHpWjWtG3UV
 xGX55Xl52sJG3ikeQhDbKFNgUmJuGy7MwL5AWHeR3Nx86XXGaamgAyZYEu7KxoV7fyRY
 CMEQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qfpfAfV0
Subject: [Buildroot] [PATCH 1/1] package/brltty: fix infinite loop in
 configure
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Mario Lang <mlang@blind.guru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Revert a broken commit that introduced an infinite loop during
configure.

Fixes:
 - http://autobuild.buildroot.net/results/82a/82af705f7ca282495461cb3994f5a7e6f64273e1
 - http://autobuild.buildroot.net/results/06c/06c9414a1ecbc1a147bc8dfddced03fc659af694
 - http://autobuild.buildroot.net/results/59e/59e36093f7e437a5a37037f7fa50ce2443c47fd3

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...ushProgramTerminationCommand-shell-f.patch | 107 ++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 package/brltty/0002-Revert-Add-the-pushProgramTerminationCommand-shell-f.patch

diff --git a/package/brltty/0002-Revert-Add-the-pushProgramTerminationCommand-shell-f.patch b/package/brltty/0002-Revert-Add-the-pushProgramTerminationCommand-shell-f.patch
new file mode 100644
index 0000000000..f5653342e2
--- /dev/null
+++ b/package/brltty/0002-Revert-Add-the-pushProgramTerminationCommand-shell-f.patch
@@ -0,0 +1,107 @@
+From 941acbb1caa8a85454a491364e74fb273223b7fb Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Sat, 15 Oct 2022 10:54:57 -0600
+Subject: [PATCH] Revert "Add the pushProgramTerminationCommand shell function.
+ (dm)"
+
+Fixes infinite loop during configure:
+
+config.status: executing build-configure commands
+configure: WARNING: libudev support not available
+configure: WARNING: Human Interface Device I/O support not available on this platform
+./mk4build: 104: let: not found
+./mk4build: 104: let: not found
+./mk4build: 111: cd: can't cd to /tmp/mk4build.20221015-092924.ZL6KlF
+./mk4build: 104: let: not found
+./mk4build: 111: cd: can't cd to /tmp/mk4build.20221015-092924.ZL6KlF
+./mk4build: 104: let: not found
+./mk4build: 111: cd: can't cd to /tmp/mk4build.20221015-092924.ZL6KlF
+./mk4build: 104: let: not found
+./mk4build: 111: cd: can't cd to /tmp/mk4build.20221015-092924.ZL6KlF
+./mk4build: 104: let: not found
+./mk4build: 111: cd: can't cd to /tmp/mk4build.20221015-092924.ZL6KlF
+./mk4build: 104: let: not found
+./mk4build: 111: cd: can't cd to /tmp/mk4build.20221015-092924.ZL6KlF
+./mk4build: 104: let: not found
+./mk4build: 111: cd: can't cd to /tmp/mk4build.20221015-092924.ZL6KlF
+./mk4build: 104: let: not found
+./mk4build: 111: cd: can't cd to /tmp/mk4build.20221015-092924.ZL6KlF
+
+This reverts commit df1e070d30f583381b48fddd829bdde8efcdd16a.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://github.com/brltty/brltty/pull/393]
+---
+ brltty-prologue.sh | 48 +++++++++++++---------------------------------
+ 1 file changed, 13 insertions(+), 35 deletions(-)
+
+diff --git a/brltty-prologue.sh b/brltty-prologue.sh
+index 05b817742..a4fa34053 100644
+--- a/brltty-prologue.sh
++++ b/brltty-prologue.sh
+@@ -94,41 +94,6 @@ logDetail() {
+    logMessage detail "${@}"
+ }
+ 
+-programTerminationCommandCount=0
+-
+-runProgramTerminationCommands() {
+-   set +e
+-
+-   while [ "${programTerminationCommandCount}" -gt 0 ]
+-   do
+-      set -- $(getVariable "programTerminationCommand${programTerminationCommandCount}")
+-      let "programTerminationCommandCount -= 1"
+-
+-      local process="${1}"
+-      local directory="${2}"
+-      shift 2
+-
+-      [ "${process}" = "${$}" ] && {
+-         cd "${directory}"
+-         "${@}"
+-      }
+-   done
+-}
+-
+-pushProgramTerminationCommand() {
+-   [ "${programTerminationCommandCount}" -gt 0 ] || trap runProgramTerminationCommands exit
+-   setVariable "programTerminationCommand$((programTerminationCommandCount += 1))" "${$} $(pwd) ${*}"
+-}
+-
+-needTemporaryDirectory() {
+-   [ -n "${temporaryDirectory}" ] || {
+-      umask 022
+-      [ -n "${TMPDIR}" -a -d "${TMPDIR}" -a -r "${TMPDIR}" -a -w "${TMPDIR}" -a -x "${TMPDIR}" ] || export TMPDIR="/tmp"
+-      temporaryDirectory="$(mktemp -d "${TMPDIR}/${programName}.$(date +"%Y%m%d-%H%M%S").XXXXXX")" && cd "${temporaryDirectory}" || exit "${?}"
+-      pushProgramTerminationCommand rm -f -r -- "${temporaryDirectory}"
+-   }
+-}
+-
+ resolveDirectory() {
+    local path="${1}"
+    local variable="${2}"
+@@ -512,6 +477,19 @@ verifyOutputDirectory() {
+    fi
+ }
+ 
++needTemporaryDirectory() {
++   cleanup() {
++      set +e
++      cd /
++      [ -z "${temporaryDirectory}" ] || rm -f -r -- "${temporaryDirectory}"
++   }
++   trap "cleanup" 0
++
++   umask 022
++   [ -n "${TMPDIR}" -a -d "${TMPDIR}" -a -r "${TMPDIR}" -a -w "${TMPDIR}" -a -x "${TMPDIR}" ] || export TMPDIR="/tmp"
++   temporaryDirectory="$(mktemp -d "${TMPDIR}/${programName}.XXXXXX")" && cd "${temporaryDirectory}" || exit "${?}"
++}
++
+ programParameterCount=0
+ programParameterCountMinimum=-1
+ programParameterLabelWidth=0
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
