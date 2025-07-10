Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF5BC83F17
	for <buildroot@archiver.kernel.org>; Thu, 10 Jul 2025 20:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DE87410A7;
	Thu, 10 Jul 2025 20:23:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3yL_dviq30zg; Thu, 10 Jul 2025 20:23:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 775D4410AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 775D4410AE;
	Thu, 10 Jul 2025 20:23:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 929B1114
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78016610BB;
 Thu, 10 Jul 2025 20:23:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I-nH7AaFLgUh; Thu, 10 Jul 2025 20:23:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8FCFF613AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FCFF613AD
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8FCFF613AD
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:23:06 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-45348bff79fso16358905e9.2
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 13:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752178985; x=1752783785;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wjFlAe5raqEK9kU9E4GUvYwVSTyPLFlL5vzomP6OCsc=;
 b=KQrzEgpq6Or1PQyW7JfSvrkaag3D6xUdxltVuHaalIPp7necmObIbbz3pfr3YERyiE
 YgTdipmCxcq8tORGWDWs+i3p8j5eJY9U39I7dW/iEI3XbPK9Rf2WGCAvwwma68bxGSMT
 DKuumzavxW/r8bX0VdIzXugBaczyBc2rOB8vbQws5pcoIrYlV3MeHMPPY2eMJdxhaAxV
 U9WvlgeWbKBd6dlzZid/sEIoNfMftuynk9lylQpMKJkbXxH1aAL8A9iK0ulx7sRv9O2a
 SaS5bDJThHR1cLJlpnxgclnKAjmbGYT+soRB+OqGpcIao+3w/jXXvhY41pVgU6mWwS85
 mv9w==
X-Gm-Message-State: AOJu0Yzbw7m6msSeDcxXj6OlImxBdWb49pQj5AGW9uQPYlCNhSZZc349
 iNy+EHml9RRGSJ3zIjlstt4Oj93xFnrNDT2PaP1OCecBre0Gqf7VwKv4ldajZg==
X-Gm-Gg: ASbGncsoD2+OIPTAm2GwydJ3Jp0SJiZNSyKT6M6TYJvXi4fx4+TcUNJkZCZmtmlcxPK
 YGHfdIXuqdNq+zK9GkZkE9DhW8Z45qP1EYERO9+tEOmPntTfqg56AAQmuEQE9txuiyK9q2cx/pV
 fWh7dUsYeZk+FK4UlA25vICXuksgJmTEx+V6Iuc2yrhQpeOv3ngek4ie9DJ1P4Me3IxST/Ywfni
 RNj2faEMfTGR0WEM//+iEl3DOtaQCpfSgktYMVfCnDLEciOAu7t8XDC9oXATIPKEiiqOY1ltR8o
 LwBsCSAQdbNPJiXOiEzkkTXkV0DG6Xk1YEwxfIr+hIh94tvkYBJT2TOicj17ZfyFCKg89SEB
X-Google-Smtp-Source: AGHT+IFo8asKV20o0emrjnbG0zHAbyO/0+E144scEvI7yLnzUaJFc+Cq5VmdDm6Sp6ObBcZWkbiDFQ==
X-Received: by 2002:a05:600c:674f:b0:450:cfe1:a827 with SMTP id
 5b1f17b1804b1-454f4284539mr1786275e9.31.1752178984358; 
 Thu, 10 Jul 2025 13:23:04 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd1997sm2742694f8f.10.2025.07.10.13.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 13:23:04 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Date: Thu, 10 Jul 2025 22:22:49 +0200
Message-ID: <f229aa81274a52b8e68e3717d56d3d50909069ad.1752178975.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1752178975.git.yann.morin.1998@free.fr>
References: <cover.1752178975.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752178985; x=1752783785; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wjFlAe5raqEK9kU9E4GUvYwVSTyPLFlL5vzomP6OCsc=;
 b=QURXQM8Ks3bMs4WndL78gSrAGt8/EZ+P8ClLGzp5vRLZvGQvogQxOrFk0trzMTczKc
 aoSCxa1apiN2vENlBLXxDGCIpe3HTBfcR+zmFgu1ZTyaytZZulcEK7cfQm1UpU8ohIam
 XRYnb1glv4GIo1Q2g8M3jMD3FJwx29mt6yzjP0NFjKbE/Eh6WmwFNUc4tfqYv8aLVddi
 48I7ENhUegv4axpebO3Tby5CvjjmgygESFCSpOkaIuEDWK0I23Qt4LAcZSL3WIrGV9gY
 0UbLiaSqnq5l/nWRqu4UPqzKqDUxBSqIZMDquUz49T7QuzGm5AzWHrB6fUKhv4yxYtm0
 7vjQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QURXQM8K
Subject: [Buildroot] [PATCH 07/17 v2] support/scripts: move merged-usr
 errors message into check-merged-usr.sh
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

By moving the loop over the overlays into the script, we can generate
better error messages about how and why a skeleton or a specific overlay
is improperly setup for merged-usr.

We can also now rely on its exit code to decicde whether the skeleton or
the overlays are properly setup, rather than stash the stdout/stderr to
a Makefile variable and test the emptiness thereof.

Introduce a --type option to pass the type of root to verify, for better
error reporting. This will incidentally be usefull in a future commit,
when we need to take different actions based on whether the root is a
skeleton or an overlay.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile                                   | 15 ++---
 package/skeleton-custom/skeleton-custom.mk | 21 +++----
 support/scripts/check-merged-usr.sh        | 65 +++++++++++++++++-----
 3 files changed, 64 insertions(+), 37 deletions(-)

diff --git a/Makefile b/Makefile
index c581067320..fd5fe575e7 100644
--- a/Makefile
+++ b/Makefile
@@ -782,17 +782,10 @@ endif
 # For a merged /usr, ensure that /lib, /bin and /sbin and their /usr
 # counterparts are appropriately setup as symlinks ones to the others.
 ifeq ($(BR2_ROOTFS_MERGED_USR),y)
-
-	$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
-		@$(call MESSAGE,"Sanity check in overlay $(d)")$(sep) \
-		$(Q)not_merged_dirs="$$(support/scripts/check-merged-usr.sh $(d))"; \
-		test -n "$$not_merged_dirs" && { \
-			echo "ERROR: The overlay in $(d) is not" \
-				"using a merged /usr for the following directories:" \
-				$$not_merged_dirs; \
-			exit 1; \
-		} || true$(sep))
-
+	@$(call MESSAGE,"Sanity check in overlays $(call qstrip,$(BR2_ROOTFS_OVERLAY))")
+	support/scripts/check-merged-usr.sh \
+		--type overlay \
+		$(call qstrip,$(BR2_ROOTFS_OVERLAY))
 endif # merged /usr
 
 	$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
diff --git a/package/skeleton-custom/skeleton-custom.mk b/package/skeleton-custom/skeleton-custom.mk
index b05c834b94..c194108307 100644
--- a/package/skeleton-custom/skeleton-custom.mk
+++ b/package/skeleton-custom/skeleton-custom.mk
@@ -26,17 +26,16 @@ endif
 # For a merged /usr, ensure that /lib, /bin and /sbin and their /usr
 # counterparts are appropriately setup as symlinks ones to the others.
 ifeq ($(BR2_ROOTFS_MERGED_USR),y)
-SKELETON_CUSTOM_NOT_MERGED_USR_DIRS = \
-	$(shell support/scripts/check-merged-usr.sh $(SKELETON_CUSTOM_PATH))
+define SKELETON_CUSTOM_NOT_MERGED_USR_DIRS
+	support/scripts/check-merged-usr.sh \
+		--type skeleton \
+		$(SKELETON_CUSTOM_PATH)
+endef
 endif # merged /usr
 
-ifeq ($(BR2_PACKAGE_SKELETON_CUSTOM)$(BR_BUILDING),yy)
-ifneq ($(SKELETON_CUSTOM_NOT_MERGED_USR_DIRS),)
-$(error The custom skeleton in $(SKELETON_CUSTOM_PATH) is not \
-	using a merged /usr for the following directories: \
-	$(SKELETON_CUSTOM_NOT_MERGED_USR_DIRS))
-endif
-endif
+define SKELETON_CUSTOM_CONFIGURE_CMDS
+	$(SKELETON_CUSTOM_NOT_MERGED_USR_DIRS)
+endef
 
 # The target-dir-warning file and the lib{32,64} symlinks are the only
 # things we customise in the custom skeleton.
@@ -49,9 +48,7 @@ define SKELETON_CUSTOM_INSTALL_TARGET_CMDS
 endef
 
 # For the staging dir, we don't really care what we install, but we
-# need the /lib and /usr/lib appropriately setup. Since we ensure,
-# above, that they are correct in the skeleton, we can simply copy the
-# skeleton to staging.
+# need the /lib and /usr/lib appropriately setup.
 define SKELETON_CUSTOM_INSTALL_STAGING_CMDS
 	$(call SYSTEM_RSYNC,$(SKELETON_CUSTOM_PATH),$(STAGING_DIR))
 	$(call SYSTEM_USR_SYMLINKS_OR_DIRS,$(STAGING_DIR))
diff --git a/support/scripts/check-merged-usr.sh b/support/scripts/check-merged-usr.sh
index 6d31c81c21..c3b5c6419a 100755
--- a/support/scripts/check-merged-usr.sh
+++ b/support/scripts/check-merged-usr.sh
@@ -11,16 +11,48 @@
 # /usr/sbin/
 #
 # Input:
-#   $1:     the root directory (skeleton, overlay) to check
+#   --type TYPE     the type of root to check: 'skeleton' or 'overlay'
+#   $*:             the root directories (skeleton, overlays) to check
 # Output:
-#   stdout: the list of non-compliant paths (empty if compliant).
+#   stdout:         the list of non-compliant paths (empty if compliant).
 # Exit code:
-#   0:      in case of success (stdout will be empty)
-#   !0:     if any path is improperly merged
+#   0:              in case of success (stdout will be empty)
+#   !0:             if any path is improperly merged
 #
 
-# The directory to check for merged-usr
-root="${1}"
+opts="type:"
+ARGS="$(getopt -n check-merged -o "" -l "${opts}" -- "${@}")" || exit 1
+eval set -- "${ARGS}"
+
+type=
+while :; do
+	case "${1}" in
+	(--type)
+		type="${2}"
+		shift 2
+		;;
+	(--)
+		shift
+		break
+		;;
+	esac
+done
+
+report_error() {
+	local type="${1}"
+	local root="${2}"
+	local fmt="${3}"
+	shift 3
+
+	if ${first}; then
+		printf "The %s in %s is not properly setup:\n" \
+			"${type}" "${root}"
+	fi
+	first=false
+	# shellcheck disable=SC2059  # fmt *is* a format string
+	printf "  - ${fmt}" "${@}"
+	is_success=false
+}
 
 # Extract the inode numbers for all of those directories. In case any is
 # a symlink, we want to get the inode of the pointed-to directory, so we
@@ -42,19 +74,24 @@ is_valid_merged() {
 }
 
 test_merged() {
-	local root="${1}"
-	local dir1="${2}"
-	local dir2="${3}"
+	local type="${1}"
+	local root="${2}"
+	local dir1="${3}"
+	local dir2="${4}"
 
 	if ! is_valid_merged "${root}" "${dir1}" "${dir2}"; then
-		printf '%s\n' "${dir1}"
-		is_success=false
+		report_error "${type}" "${root}" \
+			'%s should be missing, or be a relative symlink to %s\n' \
+			"${dir1}" "${dir2}"
 	fi
 }
 
 is_success=true
-test_merged "${root}" "/lib" "/usr/lib"
-test_merged "${root}" "/bin" "/usr/bin"
-test_merged "${root}" "/sbin" "/usr/sbin"
+for root; do
+	first=true
+	test_merged "${type}" "${root}" "/lib" "/usr/lib"
+	test_merged "${type}" "${root}" "/bin" "/usr/bin"
+	test_merged "${type}" "${root}" "/sbin" "/usr/sbin"
+done
 
 ${is_success}
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
