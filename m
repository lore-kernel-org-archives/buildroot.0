Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24138E8B36C
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 21:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC05D608FD;
	Tue,  3 Feb 2026 21:54:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k74BO0Y0_Riw; Tue,  3 Feb 2026 21:54:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA44560901
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770155679;
	bh=4f25yJCIbhLlItvx931LFlF19vKzkM9VY757H+lBkMI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Pp4IHkGEsieVEyUPqlm9W0DVVOA27mI3hm6zJK2xhl4CdAkcBAPyH4VwdFXbmhp02
	 hr+jMePhpl87zCCBvj+fHiOzHQGxWnhekegntvKBxl1nP5RnpOe3Tj7FWVKUjHmPlW
	 FXJEknTxVjJM/QP59aOCGDUW/B3IUD9MuGhk4AzZvf9l46PYJhZk+FSDIQKrxpHRgf
	 NHEduqvYoCdAVAaE0GcuWrDkPdpwmeWhie0IqGYOw03u7zpeWZOsOY0PwNIOP/mBCU
	 yj9tl93MhvirrA/sXLtS1fbJf+HSouDVSJQ1dHI8fWMxkBhKvFY4v5vOrq5kQqjqhB
	 fZu/DRI2Eg+qA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA44560901;
	Tue,  3 Feb 2026 21:54:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 83432F5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D5EB60A51
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:54:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PpaaM2OOZrPF for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 21:54:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 636E260A47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 636E260A47
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 636E260A47
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:54:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id AD01F19F58A;
 Tue,  3 Feb 2026 22:54:32 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 03 Feb 2026 22:54:32 +0100
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Tue,  3 Feb 2026 22:54:29 +0100
Message-ID: <194a25b4dce8f83d709dec1003427c8a1f39d71a.1770155657.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770155657.git.yann.morin.1998@free.fr>
References: <cover.1770155657.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770155674;
 bh=1vjdldz5l9EjXLywRuNJLqWOPTJuLgKEtYuaHV+IsvU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PMg8CT6X8oOl3jriIYOF76mNeaNjAkruvShyR5fOT0Gdt6M6jEKXCKHxDD33WPYPB
 av+Y255a55UZHwlWL0skB5AoYdNSocupKNZqpmshs+TncJhs0PYhMCd+GZ4c4RKhjE
 nTPsqX8az5z0g5SSfQHo6R/l8fq+wnndBxnSz6JkDCjwiIx7tzvVHorDwoC3xm2I26
 LvBBevMmBeJ4Pv1VZ1vIdtacHt4KLi5ZPV+ReOmcJNXmQ+FTmwYeafCBHW992H20EM
 /FivDYnp6gunJd+CDtfEwsHHnoaiFzUDpkPnRfpaw95QTPL03anEQhFCmiG6dFw0Is
 MKePDUC556MrA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PMg8CT6X
Subject: [Buildroot] [PATCH 2/3 v4] support/br2-external: fix remaining
 shellcheck errors
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

Boring changes: either do what shellcheck suggested, or comment why we
don't want to fix the code.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore          |  1 -
 support/scripts/br2-external | 11 ++++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 16a0d5b511..67e531512e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1085,7 +1085,6 @@ support/libtool/buildroot-libtool-v2.4.4.patch lib_patch.ApplyOrder lib_patch.Up
 support/libtool/buildroot-libtool-v2.4.patch lib_patch.ApplyOrder lib_patch.Sob lib_patch.Upstream
 support/misc/relocate-sdk.sh Shellcheck
 support/scripts/apply-patches.sh Shellcheck
-support/scripts/br2-external Shellcheck
 support/scripts/check-bin-arch Shellcheck
 support/scripts/check-host-rpath Shellcheck
 support/scripts/expunge-gconv-modules Shellcheck
diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index 6d4fc1a791..474feaded7 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -34,6 +34,7 @@ main() {
         error "Cannot create output directory '%s'\n" "${outputdir}"
     fi
 
+    # shellcheck disable=SC2068  # We do want to split on spaces
     do_validate "${outputdir}" ${@//:/ }
     do_mk "${outputdir}"
     do_kconfig "${outputdir}"
@@ -71,7 +72,7 @@ do_validate_one() {
     if [ ! -d "${br2_ext}" ]; then
         error "'%s': no such file or directory\n" "${br2_ext}"
     fi
-    if [ ! -r "${br2_ext}" -o ! -x "${br2_ext}" ]; then
+    if [ ! -r "${br2_ext}" ] || [ ! -x "${br2_ext}" ]; then
         error "'%s': permission denied\n" "${br2_ext}"
     fi
     if [ ! -f "${br2_ext}/external.desc" ]; then
@@ -106,9 +107,9 @@ do_validate_one() {
     br2_ext="$( cd "${br2_ext}"; pwd )"
     br2_ver="$( support/scripts/setlocalversion "${br2_ext}" )"
     BR2_EXT_NAMES+=( "${br2_name}" )
-    eval BR2_EXT_PATHS_${br2_name}="\"\${br2_ext}\""
-    eval BR2_EXT_VERS_${br2_name}="\"\${br2_ver}\""
-    eval BR2_EXT_DESCS_${br2_name}="\"\${br2_desc:-\${br2_name}}\""
+    eval "BR2_EXT_PATHS_${br2_name}=\"\${br2_ext}\""
+    eval "BR2_EXT_VERS_${br2_name}=\"\${br2_ver}\""
+    eval "BR2_EXT_DESCS_${br2_name}=\"\${br2_desc:-\${br2_name}}\""
 }
 
 # Generate the .mk snippet that defines makefile variables
@@ -272,7 +273,7 @@ do_kconfig() {
     printf 'endmenu\n' >>"${outputdir}/.br2-external.in.menus"
 }
 
+# shellcheck disable=SC2059  # fmt *is* a format
 error() { local fmt="${1}"; shift; printf "BR2_EXTERNAL_ERROR = ${fmt}" "${@}"; exit 1; }
 
-my_name="${0##*/}"
 main "${@}"
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
