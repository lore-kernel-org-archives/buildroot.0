Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4BD0C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14F227010F;
	Tue, 21 Feb 2023 01:42:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14F227010F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1_1DGYyCFw7y; Tue, 21 Feb 2023 01:42:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1ECC970003;
	Tue, 21 Feb 2023 01:42:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1ECC970003
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 897D01BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E71B86FFED
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E71B86FFED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B7_JFHZ7EUnM for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98C7D6FE5A
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98C7D6FE5A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8491B828C8; Mon, 20 Feb 2023 20:52:52 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 14:30:56 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4e23807372370974a307b3c70ef9d77964a149ce
X-Git-Newrev: d68b617993bd2f5c82a4936ed1e24e4fec6b94a2
X-Patchwork-Hint: ignore
Message-Id: <20230220205252.8491B828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/busybox: update to
 1.36.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d68b617993bd2f5c82a4936ed1e24e4fec6b94a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Remove upstream patch 0003-awk-fix-use-after-free-CVE-2022-30065.patch
and update _IGNORE_CVES accordingly.

The two other CVE fixes are still not applied upstream. Renumber the
patches and update the comment in the .mk file.

Refresh busybox.config. All configs are set to the new defaults, except
for CONFIG_UDHCPC_DEFAULT_SCRIPT: for this one, reuse the script we also
use for DHCPv4. This is matches the behaviour previous to the bump,
where we had a single script handling both.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...003-awk-fix-use-after-free-CVE-2022-30065.patch | 52 ----------------------
 ...dr2str-ensure-only-printable-characters-.patch} |  0
 ...itize-all-printed-strings-with-printable.patch} |  0
 package/busybox/busybox.config                     | 23 +++++++---
 package/busybox/busybox.hash                       |  2 +-
 package/busybox/busybox.mk                         |  8 ++--
 6 files changed, 21 insertions(+), 64 deletions(-)

diff --git a/package/busybox/0003-awk-fix-use-after-free-CVE-2022-30065.patch b/package/busybox/0003-awk-fix-use-after-free-CVE-2022-30065.patch
deleted file mode 100644
index f9bfee328e..0000000000
--- a/package/busybox/0003-awk-fix-use-after-free-CVE-2022-30065.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From e06b1f0839972cc3f5b432849d574d14a8f17613 Mon Sep 17 00:00:00 2001
-From: Natanael Copa <ncopa@alpinelinux.org>
-Date: Fri, 17 Jun 2022 17:45:34 +0200
-Subject: [PATCH] awk: fix use after free (CVE-2022-30065)
-
-fixes https://bugs.busybox.net/show_bug.cgi?id=14781
-
-function                                             old     new   delta
-evaluate                                            3343    3357     +14
-
-Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-Backport: https://git.busybox.net/busybox/commit/?id=e63d7cdfdac78c6fd27e9e63150335767592b85e
-[straightforward conflict resolution in testsuite/awk.tests]
-Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
----
- editors/awk.c       | 3 +++
- testsuite/awk.tests | 6 ++++++
- 2 files changed, 9 insertions(+)
-
-diff --git a/editors/awk.c b/editors/awk.c
-index f6314ac72..654cbac33 100644
---- a/editors/awk.c
-+++ b/editors/awk.c
-@@ -3114,6 +3114,9 @@ static var *evaluate(node *op, var *res)
- 
- 		case XC( OC_MOVE ):
- 			debug_printf_eval("MOVE\n");
-+			/* make sure that we never return a temp var */
-+			if (L.v == TMPVAR0)
-+				L.v = res;
- 			/* if source is a temporary string, jusk relink it to dest */
- 			if (R.v == TMPVAR1
- 			 && !(R.v->type & VF_NUMBER)
-diff --git a/testsuite/awk.tests b/testsuite/awk.tests
-index bcaafe8fd..156aa65eb 100755
---- a/testsuite/awk.tests
-+++ b/testsuite/awk.tests
-@@ -469,4 +469,10 @@ testing 'awk printf %% prints one %' \
- 	"%\n" \
- 	'' ''
- 
-+testing 'awk assign while test' \
-+	"awk '\$1==\$1=\"foo\" {print \$1}'" \
-+	"foo\n" \
-+	"" \
-+	"foo"
-+
- exit $FAILCOUNT
--- 
-2.37.3
-
diff --git a/package/busybox/0004-libbb-sockaddr2str-ensure-only-printable-characters-.patch b/package/busybox/0003-libbb-sockaddr2str-ensure-only-printable-characters-.patch
similarity index 100%
rename from package/busybox/0004-libbb-sockaddr2str-ensure-only-printable-characters-.patch
rename to package/busybox/0003-libbb-sockaddr2str-ensure-only-printable-characters-.patch
diff --git a/package/busybox/0005-nslookup-sanitize-all-printed-strings-with-printable.patch b/package/busybox/0004-nslookup-sanitize-all-printed-strings-with-printable.patch
similarity index 100%
rename from package/busybox/0005-nslookup-sanitize-all-printed-strings-with-printable.patch
rename to package/busybox/0004-nslookup-sanitize-all-printed-strings-with-printable.patch
diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
index e7f628ca6d..4826fb8242 100644
--- a/package/busybox/busybox.config
+++ b/package/busybox/busybox.config
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
-# Busybox version: 1.35.0
-# Thu Jan 27 10:16:54 2022
+# Busybox version: 1.36.0
+# Tue Feb  7 12:34:02 2023
 #
 CONFIG_HAVE_DOT_CONFIG=y
 
@@ -93,6 +93,9 @@ CONFIG_FEATURE_BUFFERS_USE_MALLOC=y
 # CONFIG_FEATURE_BUFFERS_GO_IN_BSS is not set
 CONFIG_PASSWORD_MINLEN=6
 CONFIG_MD5_SMALL=1
+CONFIG_SHA1_SMALL=3
+CONFIG_SHA1_HWACCEL=y
+CONFIG_SHA256_HWACCEL=y
 CONFIG_SHA3_SMALL=1
 CONFIG_FEATURE_NON_POSIX_CP=y
 # CONFIG_FEATURE_VERBOSE_CP_MESSAGE is not set
@@ -123,6 +126,9 @@ CONFIG_LAST_SUPPORTED_WCHAR=0
 # CONFIG_UNICODE_BIDI_SUPPORT is not set
 # CONFIG_UNICODE_NEUTRAL_TABLE is not set
 # CONFIG_UNICODE_PRESERVE_BROKEN is not set
+# CONFIG_LOOP_CONFIGURE is not set
+# CONFIG_NO_LOOP_CONFIGURE is not set
+CONFIG_TRY_LOOP_CONFIGURE=y
 
 #
 # Applets
@@ -338,6 +344,7 @@ CONFIG_FEATURE_TR_CLASSES=y
 CONFIG_FEATURE_TR_EQUIV=y
 CONFIG_TRUE=y
 CONFIG_TRUNCATE=y
+CONFIG_TSORT=y
 CONFIG_TTY=y
 CONFIG_UNAME=y
 CONFIG_UNAME_OSNAME="GNU/Linux"
@@ -520,7 +527,7 @@ CONFIG_FEATURE_SHADOWPASSWDS=y
 # CONFIG_USE_BB_PWD_GRP is not set
 # CONFIG_USE_BB_SHADOW is not set
 CONFIG_USE_BB_CRYPT=y
-# CONFIG_USE_BB_CRYPT_SHA is not set
+CONFIG_USE_BB_CRYPT_SHA=y
 # CONFIG_ADD_SHELL is not set
 # CONFIG_REMOVE_SHELL is not set
 CONFIG_ADDGROUP=y
@@ -811,10 +818,10 @@ CONFIG_FEATURE_LESS_TRUNCATE=y
 CONFIG_FEATURE_LESS_REGEXP=y
 # CONFIG_FEATURE_LESS_WINCH is not set
 # CONFIG_FEATURE_LESS_ASK_TERMINAL is not set
-# CONFIG_FEATURE_LESS_DASHCMD is not set
+CONFIG_FEATURE_LESS_DASHCMD=y
 # CONFIG_FEATURE_LESS_LINENUMS is not set
-# CONFIG_FEATURE_LESS_RAW is not set
-# CONFIG_FEATURE_LESS_ENV is not set
+CONFIG_FEATURE_LESS_RAW=y
+CONFIG_FEATURE_LESS_ENV=y
 CONFIG_LSSCSI=y
 CONFIG_MAKEDEVS=y
 # CONFIG_FEATURE_MAKEDEVS_LEAF is not set
@@ -831,10 +838,12 @@ CONFIG_PARTPROBE=y
 # CONFIG_RFKILL is not set
 CONFIG_RUNLEVEL=y
 # CONFIG_RX is not set
+CONFIG_SEEDRNG=y
 CONFIG_SETFATTR=y
 CONFIG_SETSERIAL=y
 CONFIG_STRINGS=y
 CONFIG_TIME=y
+CONFIG_TREE=y
 CONFIG_TS=y
 # CONFIG_TTYSIZE is not set
 # CONFIG_UBIATTACH is not set
@@ -1007,6 +1016,7 @@ CONFIG_UDHCPC=y
 CONFIG_FEATURE_UDHCPC_ARPING=y
 CONFIG_FEATURE_UDHCPC_SANITIZEOPT=y
 CONFIG_UDHCPC_DEFAULT_SCRIPT="/usr/share/udhcpc/default.script"
+CONFIG_UDHCPC6_DEFAULT_SCRIPT="/usr/share/udhcpc/default.script"
 # CONFIG_UDHCPC6 is not set
 # CONFIG_FEATURE_UDHCPC6_RFC3646 is not set
 # CONFIG_FEATURE_UDHCPC6_RFC4704 is not set
@@ -1141,6 +1151,7 @@ CONFIG_ASH_IDLE_TIMEOUT=y
 CONFIG_ASH_ECHO=y
 CONFIG_ASH_PRINTF=y
 CONFIG_ASH_TEST=y
+CONFIG_ASH_SLEEP=y
 CONFIG_ASH_HELP=y
 CONFIG_ASH_GETOPTS=y
 CONFIG_ASH_CMDCMD=y
diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
index 2091cdaf65..6d1c36906d 100644
--- a/package/busybox/busybox.hash
+++ b/package/busybox/busybox.hash
@@ -1,5 +1,5 @@
 # From https://busybox.net/downloads/busybox-1.35.0.tar.bz2.sha256
-sha256  faeeb244c35a348a334f4a59e44626ee870fb07b6884d68c10ae8bc19f83a694  busybox-1.35.0.tar.bz2
+sha256  542750c8af7cb2630e201780b4f99f3dcceeb06f505b479ec68241c1e6af61a5  busybox-1.36.0.tar.bz2
 # Locally computed
 sha256  bbfc9843646d483c334664f651c208b9839626891d8f17604db2146962f43548  LICENSE
 sha256  b5a136ed67798e51fe2e0ca0b2a21cb01b904ff0c9f7d563a6292e276607e58f  archival/libarchive/bz/LICENSE
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index f8f9cb5616..1633ca525d 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -4,17 +4,15 @@
 #
 ################################################################################
 
-BUSYBOX_VERSION = 1.35.0
+BUSYBOX_VERSION = 1.36.0
 BUSYBOX_SITE = https://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPL-2.0, bzip2-1.0.4
 BUSYBOX_LICENSE_FILES = LICENSE archival/libarchive/bz/LICENSE
 BUSYBOX_CPE_ID_VENDOR = busybox
 
-# 0003-awk-fix-use-after-free-CVE-2022-30065.patch
-BUSYBOX_IGNORE_CVES += CVE-2022-30065
-# 0004-libbb-sockaddr2str-ensure-only-printable-characters-.patch
-# 0005-nslookup-sanitize-all-printed-strings-with-printable.patch
+# 0003-libbb-sockaddr2str-ensure-only-printable-characters-.patch
+# 0004-nslookup-sanitize-all-printed-strings-with-printable.patch
 BUSYBOX_IGNORE_CVES += CVE-2022-28391
 
 BUSYBOX_CFLAGS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
