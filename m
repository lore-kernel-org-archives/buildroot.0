Return-Path: <SRS0=Fkjy=NM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B9BC4338F
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 13:47:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C50D1601FA
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 13:47:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C50D1601FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 889EA80F46;
	Sat, 21 Aug 2021 13:47:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yJAC96AqtrCM; Sat, 21 Aug 2021 13:46:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBDEB80F4C;
	Sat, 21 Aug 2021 13:46:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8B2D61BF35E
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 13:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FB1B80F4C
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 13:46:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xj8zPl24YKEl for <buildroot@lists.busybox.net>;
 Sat, 21 Aug 2021 13:46:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 207E880F46
 for <buildroot@buildroot.org>; Sat, 21 Aug 2021 13:46:54 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id h13so18463646wrp.1
 for <buildroot@buildroot.org>; Sat, 21 Aug 2021 06:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=16QoLEYXqes983jLuspysV/49q3T/Prrw/aXmdCbE7w=;
 b=EtCNcPC7MI0cpxZjEudLyPVux0/wRIKXaxTaW6zWF9mJOjHoiz8N7IAQTViLdCNNfJ
 eMZZ9zLNKlTqL9YHORuRQlhBT0jVfZKF/8tuzPoqSrLy1iDHv+GdGKxvVhZcfCLAMRXA
 bungUsMOr1Ckbs4/RgABpzMW+5PligLBF8SqrUmf/O/wW65IjbuAg5pNOxEsd9Hc95zO
 bgtBproWbFWxOX4SIroPVyyjEzmqD/HznxGIJWFE65NJ9G7IekC2Wd2pi1LnfKjOcvGu
 4RVsKgmz0OnXTrCevJ0frC2Sq/OGNUwLjaRzEO/lCmhw/nLYDA/x4EeVShK62N21QNEJ
 4HRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=16QoLEYXqes983jLuspysV/49q3T/Prrw/aXmdCbE7w=;
 b=gJRuyp6olb0zbfbZ/oYDlkuVd0YkpSkVi5vvC1lVF5EPppJpwcfiAU56Z0ub1The43
 GNZzVgZHDTOf1QBbbOzBUYhuVavUx+DMfZGNbUsBLbojT7nEN0hmV6aSvevZd/ZhP2MG
 EUiF0niX2LKbEXQTbX7SOPH2oJxcA7LsYiozSvJ08VxhceIkeAGo0Dl4kOOO3PG/Ne3c
 qWb8PXHZcyuTY3zdEmzP7AQheYarfcT4VR56M91jLVPdLHTNcsdRU3NDHiPQ85NPrc1g
 RAHO5RQRowdjqk8a6m5gjIPH1Q3JdbpbzL06WA7EtR1CfyBPXkdXuUcJzIXM4QDf7HV4
 v6LQ==
X-Gm-Message-State: AOAM530YwQCDekJhlIgoLiRDWOELOKPmkjW/tsodQLC1xUrwVEXm7Q86
 nMf9dGnCSlKKyldtK526iBLMZvu4FC0=
X-Google-Smtp-Source: ABdhPJxfTpZO6jCV/eRGIWf1hvirPv63eWNV4T4LFp3Cnh9WqLkL8yyvkYaGSayRKmx4oUPkZVeLDQ==
X-Received: by 2002:adf:c549:: with SMTP id s9mr4066411wrf.344.1629553612405; 
 Sat, 21 Aug 2021 06:46:52 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id c14sm509923wrr.58.2021.08.21.06.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 06:46:51 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Aug 2021 15:46:45 +0200
Message-Id: <20210821134646.1163359-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 for-next 1/2] utils/test-pkg: add mode to
 only prepare .config files
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Currently, running test-pkg is only done locally on the developpers
machine.

In a follow up commit, we'll add the possibility to run test-pkg in a
gitlab-ci pipeline and, to speed up things, with one job per buildable
configuration.

As such, we will need that test-pkg only ever prepares the
configuration, and that it does not build them.

Add such a mode, with a new option, --prepare-only

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v6: Remove terse option for --prepare-only (Arnout)
    rename local variable "defer" to "prepare-only"
v5: split off from the next patch into this patch
---
 utils/test-pkg | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/utils/test-pkg b/utils/test-pkg
index 54c6c5e8fe..526b95b1fb 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -12,13 +12,13 @@ do_clean() {
 
 main() {
     local o O opts
-    local cfg dir pkg random toolchains_csv toolchain all number mode
+    local cfg dir pkg random toolchains_csv toolchain all number mode prepare_only
     local ret nb nb_skip nb_fail nb_legal nb_tc build_dir keep
     local -a toolchains
     local pkg_br_name
 
     o='hakc:d:n:p:r:t:'
-    O='help,all,keep,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:'
+    O='help,all,keep,prepare-only,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:'
     opts="$(getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}")"
     eval set -- "${opts}"
 
@@ -27,6 +27,7 @@ main() {
     keep=0
     number=0
     mode=0
+    prepare_only=0
     toolchains_csv="${TOOLCHAINS_CSV}"
     while [ ${#} -gt 0 ]; do
         case "${1}" in
@@ -39,6 +40,9 @@ main() {
         (-k|--keep)
             keep=1; shift 1
             ;;
+        (--prepare-only)
+            prepare_only=1; shift 1
+            ;;
         (-c|--config-snippet)
             cfg="${2}"; shift 2
             ;;
@@ -127,7 +131,7 @@ main() {
         toolchain="$(basename "${toolchainconfig}" .config)"
         build_dir="${dir}/${toolchain}"
         printf "%40s [%*d/%d]: " "${toolchain}" ${#nb_tc} ${nb} ${nb_tc}
-        build_one "${build_dir}" "${toolchainconfig}" "${cfg}" "${pkg}" && ret=0 || ret=${?}
+        build_one "${build_dir}" "${toolchainconfig}" "${cfg}" "${pkg}" "${prepare_only}" && ret=0 || ret=${?}
         case ${ret} in
         (0) printf "OK\n";;
         (1) : $((nb_skip++)); printf "SKIPPED\n";;
@@ -147,6 +151,7 @@ build_one() {
     local toolchainconfig="${2}"
     local cfg="${3}"
     local pkg="${4}"
+    local prepare_only="${5}"
 
     mkdir -p "${dir}"
 
@@ -170,6 +175,11 @@ build_one() {
     # Remove file, it's empty anyway.
     rm -f "${dir}/missing.config"
 
+    # Defer building the job to the caller (e.g. a gitlab pipeline)
+    if [ ${prepare_only} -eq 1 ]; then
+        return 0
+    fi
+
     if [ -n "${pkg}" ]; then
         if ! make O="${dir}" "${pkg}-dirclean" >> "${dir}/logfile" 2>&1; then
             return 2
@@ -257,6 +267,10 @@ Options:
         Note: the logfile and configuration is always retained, even without
         this option.
 
+    --prepare-only
+        Only prepare the .config files, but do not build them. Output the
+        list of build directories to stdout, and the status on stderr.
+
 Example:
 
     Testing libcec would require a config snippet that contains:
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
