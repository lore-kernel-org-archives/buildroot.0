Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DDCC54E49
	for <buildroot@archiver.kernel.org>; Sat,  9 Mar 2024 23:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F2CB60A48;
	Sat,  9 Mar 2024 23:44:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YQGpI-884R-T; Sat,  9 Mar 2024 23:44:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B3B460B03
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B3B460B03;
	Sat,  9 Mar 2024 23:44:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1BC281BF853
 for <buildroot@lists.busybox.net>; Sat,  9 Mar 2024 23:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5688817FD
 for <buildroot@lists.busybox.net>; Sat,  9 Mar 2024 23:44:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3ld4GYbnAYVt for <buildroot@lists.busybox.net>;
 Sat,  9 Mar 2024 23:44:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CE0B981886
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE0B981886
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE0B981886
 for <buildroot@buildroot.org>; Sat,  9 Mar 2024 23:44:32 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4131ad76f05so11690785e9.0
 for <buildroot@buildroot.org>; Sat, 09 Mar 2024 15:44:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710027871; x=1710632671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ggXpucYE0Lqoq6DOmAOTavtMmlTDBkOBG43ipOY1MjA=;
 b=MppsRTNLJmJuXUALRgYoM8kK4trBWNpuIYoXCXJmE+8BXmnn8GkWOLzYCc6skjwqja
 l0kb9LRQ+SQp5eEnOtqU6cZwavV/KqnbPEAuyy/wZHH6LCQGScyjeTA/Oj5sMwFRG3KG
 s5TDw3dE3lOZqQZuRGJUes2Sok1mTyavDkRwQXRh9UuO/wh8P289lNQp+Z4cJNhv7Q74
 tYdMEkuYPN0PVb386pzBydKtIkEx4wL7iOdMd0L3s2HqSrK0Z5r5viZ2uIm61gcCnho9
 8tpRAjryFAe5qK6ngqQRKlX19eLUVhuRK8h8HUpfAMH7bQO0uwkxWPGSV9czRDANzrWt
 nG4A==
X-Gm-Message-State: AOJu0YyZ50ruYm8r8dZ0CTlOzpe9cfqEAZ8UsVlaqkgTZDjSzhhNIu/u
 1YzXyik8e3fN+4WOACxqKES/WUUwxvWT70Ug5J+JCI72emimACk7drkMUMm+
X-Google-Smtp-Source: AGHT+IFzmS3E8T/pc6XheBqmasazYcwazEIDgtNnpf/t+FObV28CdOGR5WWy2xvLZR2zCfgrJe28/A==
X-Received: by 2002:a05:600c:4e89:b0:413:1f59:63f4 with SMTP id
 f9-20020a05600c4e8900b004131f5963f4mr1898440wmq.17.1710027870726; 
 Sat, 09 Mar 2024 15:44:30 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 fc19-20020a05600c525300b0041312855081sm4005123wmb.5.2024.03.09.15.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Mar 2024 15:44:30 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 10 Mar 2024 00:44:26 +0100
Message-ID: <60125f836d8da8ed5480d85cac91918378428214.1710027863.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1710027863.git.yann.morin.1998@free.fr>
References: <cover.1710027863.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710027871; x=1710632671; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ggXpucYE0Lqoq6DOmAOTavtMmlTDBkOBG43ipOY1MjA=;
 b=kZab1OBLnHjVGLZWy+vm9X6/XDoUmKdDuiILy9NSromrfapbe8WsOwB+OPldKgDEZC
 MLFYzvsWRaG82VJvVD1tjVVdZ/JK8K0NLG/7wpoyb1wYtdbrxpfl81xDPkmuewcQp4Ya
 xIdCxR3C4Ix/Wc2samooAIalxn0114UqP89aFLNrEyNO8oL1ukXGRxmvh0yaYHmbmIBA
 907MZLbcDEc2MiI0LP/TJ4jJgunZfCr2IMN/qDt6eCFLhLLDsD6Zh390QcMCYazn/LBh
 GP4QELQpitoKlaY9WzfXqC961qpd7kKsDYBXUvKlg+ZrYwYDGWIoYKFry7EcusVZ5GTi
 xMog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kZab1OBL
Subject: [Buildroot] [PATCH 2/5] support/scripts/mkusers: fix shellcheck
 errors
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

the user tables do not use trailing backslash \ to continue lines,
so we don't want them to be interpreted thusly, so we use 'read -r'
(SC2162).

Integer variables need not be quoted (SC2086). In any case, should
there be an actual issue and they be set empty, that would cause a
runtime issue, wether they be quoted or not.

The binary -o and -a ar perfectly defined in bash's test (SC2166).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore     |  1 -
 support/scripts/mkusers | 27 +++++++++++++++++++++------
 2 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index f4bfa12e1e..db09574463 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1471,7 +1471,6 @@ support/scripts/expunge-gconv-modules Shellcheck
 support/scripts/fix-configure-powerpc64.sh EmptyLastLine
 support/scripts/generate-gitlab-ci-yml Shellcheck
 support/scripts/mkmakefile ConsecutiveEmptyLines Shellcheck
-support/scripts/mkusers Shellcheck
 support/scripts/setlocalversion Shellcheck
 support/testing/tests/core/post-build.sh Shellcheck
 support/testing/tests/package/test_opkg/post-build.sh Shellcheck
diff --git a/support/scripts/mkusers b/support/scripts/mkusers
index d786943cf8..ee09bbd1f2 100755
--- a/support/scripts/mkusers
+++ b/support/scripts/mkusers
@@ -26,6 +26,7 @@ error() {
     shift
 
     printf "%s: " "${myname}" >&2
+    # shellcheck disable=SC2059  # fmt is the format passed to error()
     printf "${fmt}" "${@}" >&2
 }
 fail() {
@@ -145,6 +146,8 @@ check_user_validity() {
         fail "invalid username '%s\n'" "${username}"
     fi
 
+    # shellcheck disable=SC2086  # gid is a non-empty int
+    # shellcheck disable=SC2166  # [ .. -o .. ] works well in this case
     if [ ${gid} -lt -2 -o ${gid} -eq 0 ]; then
         fail "invalid gid '%d' for '%s'\n" ${gid} "${username}"
     elif [ ${gid} -ge 0 ]; then
@@ -171,6 +174,8 @@ check_user_validity() {
         fi
     fi
 
+    # shellcheck disable=SC2086  # uid is a non-empty int
+    # shellcheck disable=SC2166  # [ .. -o .. ] works well in this case
     if [ ${uid} -lt -2 -o ${uid} -eq 0 ]; then
         fail "invalid uid '%d' for '%s'\n" ${uid} "${username}"
     elif [ ${uid} -ge 0 ]; then
@@ -190,6 +195,7 @@ check_user_validity() {
     fi
 
     # check the user does not already exist in another group
+    # shellcheck disable=SC2166  # [ .. -a .. ] works well in this case
     if [ -n "${_ugroup}" -a "${_ugroup}" != "${group}" ]; then
         fail "user '%s' already exists with group '%s' (wants '%s')\n" \
              "${username}" "${_ugroup}" "${group}"
@@ -218,6 +224,7 @@ generate_gid() {
                 break
             fi
         done
+        # shellcheck disable=SC2086  # gid and maxgid are non-empty ints
         if [ ${gid} -gt ${maxgid} ]; then
             fail "can not allocate a GID for group '%s'\n" "${group}"
         fi
@@ -233,6 +240,7 @@ add_one_group() {
     local members
 
     # Generate a new GID if needed
+    # shellcheck disable=SC2086  # gid is a non-empty int
     if [ ${gid} -eq ${AUTO_USER_ID} ]; then
         gid="$( generate_gid "${group}" $FIRST_USER_GID $LAST_USER_GID )"
     elif [ ${gid} -eq ${AUTO_SYSTEM_ID} ]; then
@@ -272,6 +280,7 @@ generate_uid() {
                 break
             fi
         done
+        # shellcheck disable=SC2086  # uid is a non-empty int
         if [ ${uid} -gt ${maxuid} ]; then
             fail "can not allocate a UID for user '%s'\n" "${username}"
         fi
@@ -323,6 +332,7 @@ add_one_user() {
     check_user_validity "${username}" "${uid}" "${group}" "${gid}"
 
     # Generate a new UID if needed
+    # shellcheck disable=SC2086  # uid is a non-empty int
     if [ ${uid} -eq ${AUTO_USER_ID} ]; then
         uid="$( generate_uid "${username}" $FIRST_USER_UID $LAST_USER_UID )"
     elif [ ${uid} -eq ${AUTO_SYSTEM_ID} ]; then
@@ -399,7 +409,7 @@ main() {
     fi
 
     # Read in all the file in memory, exclude empty lines and comments
-    while read line; do
+    while read -r line; do
         ENTRIES+=( "${line}" )
     done < <( sed -r -e 's/#.*//; /^[[:space:]]*$/d;' "${USERS_TABLE}" )
 
@@ -410,14 +420,16 @@ main() {
 
     # First, create all the main groups which gid is *not* automatic
     for line in "${ENTRIES[@]}"; do
-        read username uid group gid passwd home shell groups comment <<<"${line}"
+        read -r username uid group gid passwd home shell groups comment <<<"${line}"
+        # shellcheck disable=SC2086  # gid is a non-empty int
         [ ${gid} -ge 0 ] || continue    # Automatic gid
         add_one_group "${group}" "${gid}"
     done
 
     # Then, create all the main groups which gid *is* automatic
     for line in "${ENTRIES[@]}"; do
-        read username uid group gid passwd home shell groups comment <<<"${line}"
+        read -r username uid group gid passwd home shell groups comment <<<"${line}"
+        # shellcheck disable=SC2086  # gid is a non-empty int
         [ ${gid} -lt 0 ] || continue    # Non-automatic gid
         add_one_group "${group}" "${gid}"
     done
@@ -428,8 +440,9 @@ main() {
     # system gid if the uid is a system user (<= LAST_SYSTEM_UID),
     # otherwise a user gid.
     for line in "${ENTRIES[@]}"; do
-        read username uid group gid passwd home shell groups comment <<<"${line}"
+        read -r username uid group gid passwd home shell groups comment <<<"${line}"
         if [ "${groups}" != "-" ]; then
+            # shellcheck disable=SC2086  # uid is a non-empty int
             if [ ${uid} -le 0 ]; then
                 auto_id=${uid}
             elif [ ${uid} -le ${LAST_SYSTEM_UID} ]; then
@@ -450,8 +463,9 @@ main() {
 
     # Now, add users whose uid is *not* automatic
     for line in "${ENTRIES[@]}"; do
-        read username uid group gid passwd home shell groups comment <<<"${line}"
+        read -r username uid group gid passwd home shell groups comment <<<"${line}"
         [ "${username}" != "-" ] || continue # Magic string to skip user creation
+        # shellcheck disable=SC2086  # uid is a non-empty int
         [ ${uid} -ge 0         ] || continue # Automatic uid
         add_one_user "${username}" "${uid}" "${group}" "${gid}" "${passwd}" \
                      "${home}" "${shell}" "${groups}" "${comment}"
@@ -459,8 +473,9 @@ main() {
 
     # Finally, add users whose uid *is* automatic
     for line in "${ENTRIES[@]}"; do
-        read username uid group gid passwd home shell groups comment <<<"${line}"
+        read -r username uid group gid passwd home shell groups comment <<<"${line}"
         [ "${username}" != "-" ] || continue # Magic string to skip user creation
+        # shellcheck disable=SC2086  # uid is a non-empty int
         [ ${uid} -lt 0        ] || continue # Non-automatic uid
         add_one_user "${username}" "${uid}" "${group}" "${gid}" "${passwd}" \
                      "${home}" "${shell}" "${groups}" "${comment}"
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
