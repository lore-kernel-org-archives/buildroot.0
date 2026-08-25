Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CB1C61DB9
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 21:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3AB880C63;
	Tue, 25 Aug 2026 21:42:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K-kofKqMibMp; Tue, 25 Aug 2026 21:42:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787694144;
	bh=TuOUsT0kY6240q/2T7jbHcUfbd3E/Xkh0cxZRN9GlVM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sf4HoayILimjuAVKlz1RjN6RzMYGPoEvowdJseQJDoccX/MRQ0WSv0/00h3EuvOmc
	 b1HW0ODDH5CrtXReZaxBaEG0rwVq+92pRZhOYwhAMPH50pMvNHyzhCng8N4EYXdW3a
	 QqKggJuydDwjhHhP1bJczJlX34LpA9+nHIjc/lmaOdji/aEZjmEssIeos91QYd5WRO
	 T7TsHvoeBKcLjf6RyYdOzokKQqlP2131DqtgrhVDGBcJDyPeHyZ0VeteC3gDW4+5Ze
	 9NvCStSsdlw7lQ6ciZc2A+0JGFI42G72R7viRL+uE2as6ZKkFedRzx+1WoqdC3yBLN
	 jM9qccYfmDKeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FBDA80C38;
	Tue, 25 Aug 2026 21:42:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 869613C3
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 21:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CB8F606AE
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 21:42:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pIW_CsjLMxCY for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 21:42:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A044C605FF
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 21:42:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 062091A1826;
 Tue, 25 Aug 2026 21:42:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C88F7604C4;
 Tue, 25 Aug 2026 21:42:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F108F11C7A933; 
 Tue, 25 Aug 2026 23:42:13 +0200 (CEST)
To: Buildroot List <buildroot@buildroot.org>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Aug 2026 23:41:59 +0200
Message-ID: <20260825214203.3708181-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260825214203.3708181-1-thomas.petazzoni@bootlin.com>
References: <20260825214203.3708181-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH v3 1/3] support/scripts/check-host-rpath: fix
 shellcheck issues
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:

In ./support/scripts/check-host-rpath line 21:
    while read file; do
          ^--^ SC2162 (info): read without -r will mangle backslashes.

In ./support/scripts/check-host-rpath line 62:
    while read lib; do
          ^--^ SC2162 (info): read without -r will mangle backslashes.

In ./support/scripts/check-host-rpath line 90:
    while read rpath; do
          ^--^ SC2162 (info): read without -r will mangle backslashes.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Changes since v2:
- New in v3
---
 .checkpackageignore              | 1 -
 support/scripts/check-host-rpath | 6 +++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index c3ec943075..3cf8cabece 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -997,7 +997,6 @@ support/libtool/buildroot-libtool-v2.4.patch lib_patch.ApplyOrder lib_patch.Sob
 support/misc/relocate-sdk.sh Shellcheck
 support/scripts/apply-patches.sh Shellcheck
 support/scripts/check-bin-arch Shellcheck
-support/scripts/check-host-rpath Shellcheck
 support/scripts/expunge-gconv-modules Shellcheck
 support/scripts/fix-configure-powerpc64.sh lib_shellscript.EmptyLastLine
 support/scripts/generate-gitlab-ci-yml Shellcheck
diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
index 41aa0aa1ed..7b48af42ca 100755
--- a/support/scripts/check-host-rpath
+++ b/support/scripts/check-host-rpath
@@ -18,7 +18,7 @@ main() {
     hostdir="$( sed -r -e 's:/+:/:g; s:/$::;' <<<"${hostdir}" )"
 
     ret=0
-    while read file; do
+    while read -r file; do
         is_elf "${file}" || continue
         elf_needs_rpath "${file}" "${hostdir}" || continue
         check_elf_has_rpath "${file}" "${hostdir}" "${perpackagedir}" && continue
@@ -59,7 +59,7 @@ elf_needs_rpath() {
     local hostdir="${2}"
     local lib
 
-    while read lib; do
+    while read -r lib; do
         [ -e "${hostdir}/lib/${lib}" ] && return 0
     done < <( readelf -d "${file}" 2>/dev/null                             \
               |sed -r -e '/^.* \(NEEDED\) .*Shared library: \[(.+)\]$/!d;' \
@@ -87,7 +87,7 @@ check_elf_has_rpath() {
     local perpackagedir="${3}"
     local rpath dir
 
-    while read rpath; do
+    while read -r rpath; do
         for dir in ${rpath//:/ }; do
             # Remove duplicate and trailing '/' for proper match
             dir="$( sed -r -e 's:/+:/:g; s:/$::;' <<<"${dir}" )"
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
