Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253F2C77B60
	for <buildroot@archiver.kernel.org>; Sun, 30 Apr 2023 19:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A87060E34;
	Sun, 30 Apr 2023 19:54:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A87060E34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2x2eER-06aAu; Sun, 30 Apr 2023 19:54:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8624860D71;
	Sun, 30 Apr 2023 19:54:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8624860D71
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E9061BF2B9
 for <buildroot@lists.busybox.net>; Sun, 30 Apr 2023 19:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C0C481AAC
 for <buildroot@lists.busybox.net>; Sun, 30 Apr 2023 19:54:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C0C481AAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z1D3bPgEtrZr for <buildroot@lists.busybox.net>;
 Sun, 30 Apr 2023 19:54:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C1D481A65
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10olkn2082d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::82d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C1D481A65
 for <buildroot@buildroot.org>; Sun, 30 Apr 2023 19:54:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QW0GFITYZa7j6AK/jDaG9j2gg20t0VV6PmZ6RVUl1oIuazUxGuKKm24fxvnZC+CjlPHF/aK+gUf3J0YeTKSyR1aCBO1YGwzEgL0bMbKHJv/TgITw62bmMUWU3QqcgLhe2iC0+ic2cNJtkwsAGXi25meJ49Y+lgkFYlMKC///xxBOr3opTWls+AGJHYa71OjkZgxMJTfUveMx/HuEZgC/1391jjEUKKqRhUH0ReDj+LredWT4FHA1Y8ZLoaccGZ0diuNPJaomtgieDPC5H89o/upcX0pwiJGrbZefkDaWcMl4N50xALSn5tl83Ud6RjfUazXADEf+9z2PflD2b9+veQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMFC+0yD6iv1/Gu7hw48GZyClmy/YUSdwTpwPDIKU1k=;
 b=Bzp/b46zPrLRvguryyJVPddm1AFVKAXM2toeOPn9fT1Wt5P/SJRLzA4KgXZS0y9OwBDpD70lhhURZ0RV8pJHI1wNnXjDCMqN+fXxF6oodfLUlFMCliWpYfsCwmGXGLBnnPmvKHMPMTziBht4feCiqLYoyw7R+cPgrhkjBEUhHlHEnRMaKZA/WHUErxxcshkalfc9+rS4ZV5HIuBDDz0FWTmAbgG+GWK9Na7HC32T9sHlnX5QqFR+38pyRt8p0a2UMoSTe8x3KAwORQQY7ORjqwEnbwpUQLdWSy+9Gyv9op/l+FQl/9pzlof3t9Cc1vcoT0UXo4Eb1twqceDRULtNrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:1e9::12)
 by SJ1P221MB0846.NAMP221.PROD.OUTLOOK.COM (2603:10b6:a03:48b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Sun, 30 Apr
 2023 19:54:12 +0000
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8]) by SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8%5]) with mapi id 15.20.6340.030; Sun, 30 Apr 2023
 19:54:12 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Sun, 30 Apr 2023 15:53:25 -0400
Message-ID: <SN4P221MB0682FFDFA1E4FB65D998ABE5A0699@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.40.1.windows.1
X-TMN: [SDcibVYiF+wY/k7r3q4xCeSHdxhJVPgl]
X-ClientProxiedBy: YQBPR0101CA0111.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::14) To SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:1e9::12)
X-Microsoft-Original-Message-ID: <20230430195325.5001-1-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4P221MB0682:EE_|SJ1P221MB0846:EE_
X-MS-Office365-Filtering-Correlation-Id: cda10be9-fe5a-46f0-99ce-08db49b4ab77
X-MS-Exchange-SLBlob-MailProps: 0wLWl8rLpvvyTsXo3FnrY0cnXfId8zskwthITj6cfReBPPJHiVqgjFNRUealXksTMxaiZQldR0z4QCU1nO8No465+UNjLtNA63wgN8RSk4FZwBweeq1YTXU/2ScLmQf1pYfscTv0G07fd9bfTcdVlzrxb3i5o8V5xAdfLOe525gbXfFvADVLRRe5iFYbDuTxXp4WFV9raCdxFJVP135fwxunGYQWWu3JdUr+WFzvf3fRLqMgM60h6iqllRKlGJkkszaNvThr0qfHobWaDpujR3BYX5TzBFvPCdEn+5+BhRek5jJXvpQ9ZZLBk/zJlBfbmd9vNu8WJIuV2whGrkbWdtBWa9SEKh19hOX39u41xQ87YtrR1EDih3hGlPlVTxyoRaeXGbogp7rwKLXJFPtrvhPkUOh7mXYLQvH5X40oAluYihposg/nM1LYQESm6odFz7tDLtNpHA4LLmaa38OZ5pHFkCbqb+9iLIYwTre/bBAYvyOG083ujNxGGnKPW+8+nKPUyQa7Ho2voePrUn9blZC4Nn+Cx2qarVRrmJ7AkXPFTHMGdI/cxGRGpdKatIGPafG1zaWCqMStvwxTCvu5s6w4MutvFp+/04WaQ0MKADPMdh46s5DO9lJlIzQSYijQDdEOhV02zJ/rthZejogIUZMaEmZIWa8omN71SVDT9UKloXXOx+PGF3KM4+ppufTFSAXuhjRMTiaInXq4VvnyS/twj6z/Cp7IGxxcZ7f4hCaWy6D13zSdAep3K5zNNdlRJ810mvfBg8c=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F57M5EqfgL2cCMGEsohJTJHohcuoqXt+Yv6SU42wNOge8RBiD3ibjM4JIE27fBaB+AoX8O6vWLICZtanNsrZxjIKfzrEMTCMRWTWVY5/q7zVFxNTDZDHN8TDU1I/RNil6Z3WJiRcZqMxcRyYe5ZaYIGYH7bWch1EEFNGFlWMz1jfOxsSODqMih4DKvQ5hielMBYRtvgft5jdM59vH6Lq+9oZLm/TM3kx8V1djXfPpi/Ghsowjx3AnBX98VzEm3cxH2G1gZwrLXhme6MKECf/hJ0g+xPdep/5jUhf6AeLeoHfTq8T6SgeNTnmzEPSdbWhkUWzEL8mPGJvsqGzaU7AZQoE+5wrCKUMt2YOix1GvS5FeqIqbEeZMztJmiIh54d3rIV37X9MbFDpjqV6J5/ng4qB5GSPhQ0IWGHkAFPmLzisa5qWuhyz/oaLeghA8sljtn5+TPEuwVt+UIKASwiIsDR64Y5pCVhiiDQLLI7IgesJ7tc3Z60GJ5L88Fw4vr04c+mmVE+bNk01WdEAX0ArKAAXizPm9AKNDzjywQBD3eEKuUe24AON/pQGzcVk6ItfxWZnMyNJ3SDoOa+1QxY8O+0TXbKsHoSBbJbtEgwO5mHkPaGIIM2RwAvUMLW+nKm7
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7ao9UbXdB3gbrGlhXnvaC7+PYdU5d7+HFHPNJ1gLcZZrSYhucX0lzXgD8ZcL?=
 =?us-ascii?Q?Q7hOMOr0L5TK8TSzf5FjugWXOnuS2O9zDglYVpTBEQ1G80eEELvbpow5qTpp?=
 =?us-ascii?Q?xTU0vlHZGpqAMI4+dSrKKLiXSsuxnmEFQZYfWdBDBo7aL4pFaMBUoEaNFCHT?=
 =?us-ascii?Q?SEUdQtmjObthqX3+UHI3X7glKa/a9D0LijTPciOoQUh9kWQSqRnndMnQ1wqr?=
 =?us-ascii?Q?uNKAH0dArBD5870iqtNALZnjPTJKsJ840rY7ke2jMmVtzFej809WCWVoT5TV?=
 =?us-ascii?Q?EUk9+H7DMqy3KNm7tRQt84FPCu/Z6jxv0NVrtW7+vr57MOSC405ieFDR2Czu?=
 =?us-ascii?Q?KQC7NDCXsS7gv/l8C8gNt6bLGeYp/HyBKoFudH0Yw9cBGQ86BJGWAdPj6vkM?=
 =?us-ascii?Q?+qozyuhRnECRXEW4HUGxNxC6qpZdvXwxP2NRcg9LLNZ9/hvcsl7uN8VLy06+?=
 =?us-ascii?Q?CBgPUMzok2Cb2WR9SzGxPD49mIP2I8wIwAjHrO8Q4QP9UYPdlTlpMzOWolIe?=
 =?us-ascii?Q?oNAdhDXurLop1vpeBneK5Eq6CyvWVTtra063D+N/XWQis/GYDu313QO2OuyP?=
 =?us-ascii?Q?2oY5nYRxVAvR+mUHxXWHFCBFHOFDQz4vIP5FO2GKiZwsFPpa6J5C/77cwGnK?=
 =?us-ascii?Q?XnkCdHS0VRJgO5q4oc2Ko75mKoYeCQmgyUS0u8QeVwxef/2tDxWnm9WAvPjU?=
 =?us-ascii?Q?DUbRFvaChZAqm/D/YJXj7dEmbEwaPPrpzTsyHqxB/cH3PBvx86eXwMSZeG9q?=
 =?us-ascii?Q?edgCuIugWaUanYYHbzP+LcD4C/1ykEUJtyHbOL6HTZu4uGdcxkMNAmDXsOHA?=
 =?us-ascii?Q?clTq4L78+BOVBnJ2tcBjywHAfkgZarCgfqY656iixUHkRmohMX/fD+P2kMo7?=
 =?us-ascii?Q?O4Muwp2I6DlHWg3yRtavjoWHxNeyXXm9nTQbDEa9MXGJrTkH/ij0xi0Ovvtf?=
 =?us-ascii?Q?+ddYwE3mDCHJ+GJXDXV55B/gOl9ZN33AF4mM1P3TD+FvoTFLC4TDbqV9GXOh?=
 =?us-ascii?Q?by1cHQ355LK/17Qsyqr0EKTnnKpsqmLvTKnqDv0q8+LDeDdg1XzT8+3jy8uX?=
 =?us-ascii?Q?vhN4VtcpN70o0vUp0QejRI0rWHVQdFFi3yfAdibTE2xfBLCDPH+eR46JEDoP?=
 =?us-ascii?Q?SSII7WJ1SaUia5h3d/iHfhm/YlCgSrlOcFOy4cj7wEnv1p0yOzJPfwNcp/f9?=
 =?us-ascii?Q?ntSkIoKfgKFy3VDJ2509Hd0ajirZ6gP8g7bpZtXmhKWYC1RlkZbgCKrqq20?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: cda10be9-fe5a-46f0-99ce-08db49b4ab77
X-MS-Exchange-CrossTenant-AuthSource: SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2023 19:54:12.6467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1P221MB0846
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMFC+0yD6iv1/Gu7hw48GZyClmy/YUSdwTpwPDIKU1k=;
 b=Ab/dGlqQcYoz6eWNx1el6q8nuw3EUYhKShMJg94yuyehygelGipqBvHbMBwUPw5B65RO1Mm1fCia6xEpWoE8XMutXFUtZxDsNW9ARsQ0RLrVtS1bpWwS9HcZZnez+dVuuSyvFy/wZJOjauCWHttWktKjAQlSPFtKfxNg1RjbOtE+Eq6FAF1pOXpUypM43vIaEABqb5NYCSdn2fLgkZCuJRJu+c+nvVN3gTF1twus8/IOpDfwjSuHEEWfF3USwy+6WwcRtlyQTvlK5FVljMyFpIybUEziUBTj/qGmuxzxxJ2b8IsdkSyAqMoDgm2cz0hXFx0nJd0VV6n9uKTdSJe5SA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=Ab/dGlqQ
Subject: [Buildroot] [RFC PATCH] system: introduce rootfs prune support
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
Cc: James Knight <james.d.knight@live.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The following introduces the option `BR2_ROOTFS_PRUNE`, to allow users
to provide lists of directories and files that should be pruned from the
file system after a build. This is to provide a simpler means of
defining and cleaning up paths, instead of manually creating removal
logic inside a post-build script.

Users will now be able to define a file of entries to remove and
register this file as part of a board's configuration. More than one
file can be provided. Each line in a file will represent a file or
directory that should be removed. Wildcard values are supported for file
entries when attempting to remove a group of entries from a folder.
Comments are also supported in these files, allowing users to document
reasons for desiring board-specific removals. Sanity checks exists to
help prevent users from accidentally removing files outside of the
target directory.

Signed-off-by: James Knight <james.d.knight@live.com>
---
The goal of this patch is to provide an easy way for users to define
files to prune from the target file system after a build. Typically,
projects wanting to prune would have some sort of logic inside a
post-build script. Managing support to clear out select directories/
files is not always trivial, especially when wanting to do some wildcard
patterns on files to remove. Buildroot provides nice device table and
user table definition files, and having a file with entries of paths to
remove seems like a nice way to manage such an action. Projects
performing this type of pruning could have some library logic to support
a "prune" function to do this, but it would be nice if Buildroot
provides this support out-of-box (opinion).

These changes would also need to include some manual updates. Held off
this work if this feature is not something desired.
---
 Makefile              |   6 +++
 support/scripts/prune | 122 ++++++++++++++++++++++++++++++++++++++++++
 system/Config.in      |  10 ++++
 3 files changed, 138 insertions(+)
 create mode 100755 support/scripts/prune

diff --git a/Makefile b/Makefile
index 95959daab2296a5e1c19a36b0a9d356175aeba81..44d9a44b1ad6a423999341ccd4a576ae87adc671 100644
--- a/Makefile
+++ b/Makefile
@@ -794,6 +794,12 @@ endif # merged /usr
 	$(Q)$(if $(STAGING_DIR_FILES_LISTS), \
 		cat $(STAGING_DIR_FILES_LISTS)) > $(BUILD_DIR)/packages-file-list-staging.txt
 
+	$(foreach s, $(call qstrip,$(BR2_ROOTFS_PRUNE)), \
+		@$(call MESSAGE,"Pruning $(s)")$(sep) \
+		$(Q)$(TOPDIR)/support/scripts/prune $(TARGET_DIR) $(s) \
+		$(if $(wildcard $(BUILD_DIR)/.br2-pruned),--ignore-missing)$(sep))
+	@touch $(BUILD_DIR)/.br2-pruned
+
 	$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
 		@$(call MESSAGE,"Executing post-build script $(s)")$(sep) \
 		$(Q)$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
diff --git a/support/scripts/prune b/support/scripts/prune
new file mode 100755
index 0000000000000000000000000000000000000000..aaafdd378631199e465e3b768662e7ce4fcc463c
--- /dev/null
+++ b/support/scripts/prune
@@ -0,0 +1,122 @@
+#!/usr/bin/env bash
+#
+# This script accepts a target directory and multiple "prune files". Each
+# prune file will be parsed for lines which indicate paths to be removed from
+# the target directory. An example prune file list is as follows:
+#
+#  etc/libfoo.d/03-checks.sh
+#  usr/bin/test-libfoo
+#  usr/lib/libfootest.*
+#  # always ensure opt is empty
+#  opt/
+#
+# This script will not prune outside of the target directory.
+
+dry_run=false
+files=()
+ignore_missing=false
+target=
+vflag=false
+while [[ $# -gt 0 ]]; do
+    case $1 in
+    --dry-run) dry_run=true ;;
+    --ignore-missing) ignore_missing=true ;;
+    --verbose) vflag=true ;;
+    -*)
+        echo "unknown argument: $1"
+        exit 1
+        ;;
+    *)
+        if [ -z "$target" ]; then
+            target="$1"
+        else
+            files+=("$1")
+        fi
+        ;;
+    esac
+
+    shift
+done
+
+function msg() {
+    echo "(prune) $1"
+}
+function verbose() {
+    $vflag && echo "(prune-verbose) $1"
+}
+
+target=$(realpath "$target" 2>/dev/null)
+verbose "target: $target"
+
+if [ ! -d "$target" ] ; then
+    echo "Error: invalid target $target"
+    exit 1
+elif [ ${#files[@]} -eq 0 ]; then
+    echo "Error: no prune files provided"
+    exit 1
+fi
+
+# extract all prune entries from the provided files
+for f in "${files[@]}"; do
+    if [ ! -f "$f" ]; then
+        msg "Error: missing prune file: $f"
+        exit 1
+    fi
+
+    verbose "processing file: $f"
+    while IFS= read -r entry; do
+        # trim and ignore empty lines and comments
+        entry="${entry#"${entry%%[![:space:]]*}"}"
+        entry="${entry%"${entry##*[![:space:]]}"}"
+        [[ -z "$entry" || $entry == "#"* ]] && continue
+
+        verbose "processing entry: $entry"
+        is_dir=
+        [[ "$entry" == *"/" ]] && is_dir=1
+        path=$(realpath -m "$target/$entry")
+
+        # fail if the entry matches the target or leaves the target
+        if [[ $path == "$target" ]] || [[ "$path" != "$target"* ]]; then
+            msg "Error: invalid entry: $entry"
+            exit 1
+        fi
+
+        paths=("$path")
+
+        # if this is not a directory with a wildcard hint, look for any
+        # files on this path matching the wildcard
+        if [[ $is_dir -eq 0 ]]; then
+            basename=${path##*/}
+            if [[ "$basename" == *"*"* ]]; then
+                dirname=${path%/*}
+                verbose "finding files in ($basename): $dirname"
+                paths=()
+                while read -r -d $'\0'; do
+                    verbose "found: $REPLY"
+                    paths+=("$REPLY")
+                done < <(find "$dirname" -maxdepth 1 -name "$basename" \
+                    -print0 2>/dev/null)
+
+                if [ ${#paths[@]} -eq 0 ] && ! $ignore_missing; then
+                    msg "missing: $path"
+                fi
+            fi
+        fi
+
+        # process paths to remove
+        for p in "${paths[@]}"; do
+            if [ -e "$p" ]; then
+                if $dry_run; then
+                    msg "removed (dryrun): $p"
+                elif rm -rf "$p"; then
+                    msg "removed: $p"
+                else
+                    msg "failed to remove: $p"
+                    exit 1
+                fi
+            elif ! $ignore_missing; then
+                msg "missing: $p"
+            fi
+        done
+    done <"$f"
+done
diff --git a/system/Config.in b/system/Config.in
index 1ca7690ea3ba7de72618d4597dfe19abdfc68cb8..14125a50e7b17080201c91207408997b7f9dde56 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -587,6 +587,16 @@ config BR2_ROOTFS_OVERLAY
 	  They are copied as-is into the rootfs, excluding files ending
 	  with ~ and .git, .svn and .hg directories.
 
+config BR2_ROOTFS_PRUNE
+	string "Root filesystem prune entries"
+	default ""
+	help
+	  Specify a list of files which contain prune entries of files
+	  or directories that should be removed from the root
+	  filesystem. This occurs after the build is finished and any
+	  configured overlays are applied, but before the post build
+	  script is triggered.
+
 config BR2_ROOTFS_PRE_BUILD_SCRIPT
 	string "Custom scripts to run before commencing the build"
 	default ""
-- 
2.40.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
