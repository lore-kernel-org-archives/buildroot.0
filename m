Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127ADC636CC
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 10:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B18034037E;
	Sat, 11 Feb 2023 10:53:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B18034037E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id drFFkhL0oIkP; Sat, 11 Feb 2023 10:53:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA024403CA;
	Sat, 11 Feb 2023 10:53:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA024403CA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D2FF71BF59A
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 10:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAC4E403CA
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 10:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAC4E403CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6zlIdMFOwLQ2 for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 10:52:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09826403A2
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 09826403A2
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 10:52:48 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id n13so5566534wmr.4
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 02:52:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=V2avyIVmygTXYHr/kNuz4FYg1Fez3oficx05pjdJRiE=;
 b=ZFDg2DMR8JblWl+pADzdHg1xJBwrFoFi4SVNPUhYUYppevp0q/NrCEuQK9xYwWSRuK
 KQnW2VDb3RdEgsJBSw1XYoRUzGBY6RO1Fbv/6BUVwOTSDcTOKc+U5XdVKTmNRurZE10j
 vIc4tnPpKoEpVMqj2f8Ans81lnAQZR1gzgcE8k0O8wb9iUlL8xON50Jc75Nqhq6svqNK
 ovDovrhXoqaLKLGu4laFXWr0Le3g9UHlhlFp0iEWo9r/AzIu4/QyO9Ru+sIAwwm3cEot
 Bqp8OmTSWFfwfC2kwmXLemTWt1p6RBORc+sZ2KyXKMd35ILF1ePSL1pyqCndx26Rux2L
 wPZg==
X-Gm-Message-State: AO0yUKW84lBmOlatitv1mxq4vx0JA1kTPiy5sgHGIj5caLzKeBfhVZh7
 HrIjGJSsGZglYx5nIrmC+TM23+vHrCI=
X-Google-Smtp-Source: AK7set+K8YpBqzLjsEFEKADlLpBhs4hX1tH1bFp7Zy21Oc3Ryd8PiKnwEDXRgLhhvkFQMeRXoxYmLg==
X-Received: by 2002:a05:600c:1713:b0:3dc:e66:4cb9 with SMTP id
 c19-20020a05600c171300b003dc0e664cb9mr15276357wmn.13.1676112767006; 
 Sat, 11 Feb 2023 02:52:47 -0800 (PST)
Received: from localhost.localdomain (1-1-22-171.ftth.cust.kwaoo.net.
 [171.22.1.1]) by smtp.gmail.com with ESMTPSA id
 i20-20020a1c5414000000b003dc53217e07sm8084200wmb.16.2023.02.11.02.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 02:52:46 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Feb 2023 11:52:45 +0100
Message-Id: <ec2c6f0827a28d46c9b525f9c058f81cd4c9dd1b.1676112761.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1676112761.git.yann.morin.1998@free.fr>
References: <cover.1676112761.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V2avyIVmygTXYHr/kNuz4FYg1Fez3oficx05pjdJRiE=;
 b=mDdZ0TFxaVIFdaE8BQPvVKXJoIpiCRsX1I5uYraurrVcY+9tq/e0mGbXdKF5WNP3Xh
 GBLNI5+UttCGLHI+FgX4+5NDhyCS+meu3Iqyl/lattuDWCuITwgPzAdSR8CB5EUR+txe
 wNR4lgzNEzNCtvqH84pX8TCGvxFnNLTTJ5pCTJvas2wcVbG7AZUtxVfPzwmiocRsaanR
 ZiRisiRCXJ66d6I7vtGB0ZdtM3tACBSvBdc5JHWAmR6R3dCJSuVe80Re0pkSKtmiw7ck
 Edqmod/sVJismZreZE6fu4F8YTBNy2W0ABM6qSFxY7DWkpH0vl9PAxPd3o5BRA9ZHd+w
 7toA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mDdZ0TFx
Subject: [Buildroot] [PATCH 2/2] br2-external: make version of external
 trees available
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

For various reasons, like debugging or compliance, it is important to
identify what br2-external trees versions were used for a specific
build.

Add a Kconfig option that contains the version as computed by
support/scripts/setlocalversion; this will appear in the .config file
(but not in defconfig files, which is what we want).

Also generate that variable on the .mk side, so that it gets properly
exported in the environment, for post-build of post-iamge scripts to use
as they see fit (like, ensuring there is no dirtyness when in a CI for
example).

Reported-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/br2-external | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index 5815c6ded0..8aea479d20 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -66,7 +66,7 @@ do_validate() {
 
 do_validate_one() {
     local br2_ext="${1}"
-    local br2_name br2_desc n d
+    local br2_name br2_desc br2_ver n d
 
     if [ ! -d "${br2_ext}" ]; then
         error "'%s': no such file or directory\n" "${br2_ext}"
@@ -104,8 +104,10 @@ do_validate_one() {
 
     # Register this br2-external tree, use an absolute canonical path
     br2_ext="$( cd "${br2_ext}"; pwd )"
+    br2_ver="$( support/scripts/setlocalversion "${br2_ext}" )"
     BR2_EXT_NAMES+=( "${br2_name}" )
     eval BR2_EXT_PATHS_${br2_name}="\"\${br2_ext}\""
+    eval BR2_EXT_VERS_${br2_name}="\"\${br2_ver}\""
     eval BR2_EXT_DESCS_${br2_name}="\"\${br2_desc:-\${br2_name}}\""
 }
 
@@ -113,7 +115,7 @@ do_validate_one() {
 # for the br2-external tree
 do_mk() {
     local outputdir="${1}"
-    local br2_name br2_desc br2_ext
+    local br2_name br2_desc br2_ext br2_ver
 
     {
         printf '#\n# Automatically generated file; DO NOT EDIT.\n#\n'
@@ -139,12 +141,14 @@ do_mk() {
         for br2_name in "${BR2_EXT_NAMES[@]}"; do
             eval br2_desc="\"\${BR2_EXT_DESCS_${br2_name}}\""
             eval br2_ext="\"\${BR2_EXT_PATHS_${br2_name}}\""
+            eval br2_ver="\"\${BR2_EXT_VERS_${br2_name}}\""
             printf '\n'
             printf 'BR2_EXTERNAL_NAMES += %s\n' "${br2_name}"
             printf 'BR2_EXTERNAL_DIRS += %s\n' "${br2_ext}"
             printf 'BR2_EXTERNAL_MKS += %s/external.mk\n' "${br2_ext}"
             printf 'export BR2_EXTERNAL_%s_PATH = %s\n' "${br2_name}" "${br2_ext}"
             printf 'export BR2_EXTERNAL_%s_DESC = %s\n' "${br2_name}" "${br2_desc}"
+            printf 'export BR2_EXTERNAL_%s_VERSION = %s\n' "${br2_name}" "${br2_ver}"
         done
     } >"${outputdir}/.br2-external.mk"
 }
@@ -152,7 +156,7 @@ do_mk() {
 # Generate the kconfig snippets for the br2-external tree.
 do_kconfig() {
     local outputdir="${1}"
-    local br2_name br2_desc br2_ext br2
+    local br2_name br2_desc br2_ext br2_ver br2
     local -a items
 
     items=(
@@ -192,11 +196,15 @@ do_kconfig() {
     for br2_name in "${BR2_EXT_NAMES[@]}"; do
         eval br2_desc="\"\${BR2_EXT_DESCS_${br2_name}}\""
         eval br2_ext="\"\${BR2_EXT_PATHS_${br2_name}}\""
+        eval br2_ver="\"\${BR2_EXT_VERS_${br2_name}}\""
 
         {
             printf 'config BR2_EXTERNAL_%s_PATH\n' "${br2_name}"
             printf '\tstring\n'
             printf '\tdefault "%s"\n' "${br2_ext}"
+            printf 'config BR2_EXTERNAL_%s_VERSION\n' "${br2_name}"
+            printf '\tstring\n'
+            printf '\tdefault "%s"\n' "${br2_ver}"
             printf '\n'
         } >>"${outputdir}/.br2-external.in.paths"
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
